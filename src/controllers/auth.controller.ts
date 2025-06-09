import { Request, Response, NextFunction } from "express";
import * as AuthService from "../services/auth.service";
import { catchAsync } from "../utils/error-handler.utils";
import logger from "../utils/logger.utils";

export const register = catchAsync(async (req: Request, res: Response) => {
  logger.info("Register endpoint called");
  const { email, password, name } = req.body;
  const user = await AuthService.register(email, password, name);
  logger.info(`User registered successfully: ${user.id}`);
  res.status(201).json(user);
});

export const login = catchAsync(
  async (req: Request, res: Response, next: NextFunction) => {
    logger.info("Login endpoint called");
    const { email, password } = req.body;
    const token = await AuthService.login(email, password);
    logger.info(`User logged in successfully: ${email}`);
    res.json({ token });
  }
);
