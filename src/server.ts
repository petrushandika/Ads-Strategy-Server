import express, { Request, Response, NextFunction } from "express";
import dotenv from "dotenv";
import cors from "cors";
import passport from "passport";
import session from "express-session";

import "./configs/passport";

import AuthRoutes from "./routes/auth.routes";
import UserRoutes from "./routes/user.routes";

import logger from "./utils/logger.utils";
import { AppError } from "./utils/error-handler.utils";

dotenv.config();

const app = express();
const PORT = process.env.PORT || 8000;

app.use(express.json());

app.use(
  cors({
    origin: "http://localhost:3000",
    credentials: true,
  })
);

app.use(
  session({
    secret: process.env.ACCESS_TOKEN_SECRET!,
    resave: false,
    saveUninitialized: false,
    cookie: {
      secure: process.env.NODE_ENV === "production",
      httpOnly: true,
    },
  })
);

app.use(passport.initialize());
app.use(passport.session());

app.use((req: Request, res: Response, next: NextFunction) => {
  logger.info(`${req.method} ${req.url}`);
  next();
});

app.use("/api/auth", AuthRoutes);
app.use("/api/users", UserRoutes);

app.use((req: Request, res: Response) => {
  logger.warn(
    `404 - Route Not Found - ${req.originalUrl} - ${req.method} - ${req.ip}`
  );
  res.status(404).json({ error: "Not Found" });
});

app.use((err: AppError, req: Request, res: Response, next: NextFunction) => {
  const statusCode = err.statusCode || 500;
  logger.error(
    `${statusCode} - ${err.message} - ${req.originalUrl} - ${req.method} - ${req.ip}`
  );

  res.status(statusCode).json({
    error: err.message || "Internal Server Error",
    stack: process.env.NODE_ENV === "development" ? err.stack : undefined,
  });
});

app.listen(PORT, () => {
  logger.info(`Server is running on port ${PORT}`);
});
