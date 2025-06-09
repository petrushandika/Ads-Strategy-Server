import { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";
import { AppError } from "../utils/error-handler.utils";
import logger from "../utils/logger.utils";
import prisma from "../configs/prisma";

interface AuthRequest extends Request {
  userId?: number;
}

export const authenticate = (
  req: AuthRequest,
  res: Response,
  next: NextFunction
) => {
  const authHeader = req.header("Authorization");

  if (!authHeader) {
    logger.warn("No Authorization header provided");
    return next(new AppError("No Authorization header provided", 401));
  }

  const token = authHeader.replace("Bearer ", "");

  if (!token) {
    logger.warn("No token provided");
    return next(new AppError("No token provided", 401));
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET!) as {
      userId: number;
    };
    req.userId = decoded.userId;
    logger.info(`User ${decoded.userId} authenticated successfully`);
    next();
  } catch (error) {
    if (error instanceof jwt.JsonWebTokenError) {
      logger.error(`JWT Error: ${error.message}`);
      return next(new AppError(`Invalid token: ${error.message}`, 401));
    }
    logger.error("Unexpected error during authentication:", error);
    next(new AppError("Authentication failed", 401));
  }
};

export const loadUser = async (
  req: AuthRequest,
  res: Response,
  next: NextFunction
) => {
  if (!req.userId) {
    return next();
  }

  try {
    const user = await prisma.user.findUnique({
      where: { id: req.userId },
    });

    if (user) {
      (res.locals as any).user = user;
    }
  } catch (error) {
    console.error("Failed to load user:", error);
  }

  next();
};
