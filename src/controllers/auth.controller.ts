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

export const forgotPassword = catchAsync(
  async (req: Request, res: Response) => {
    logger.info("Forgot password endpoint called");
    const { email } = req.body;

    if (!email) {
      return res.status(400).json({
        success: false,
        message: "Email is required",
      });
    }

    const result = await AuthService.forgotPassword(email);
    logger.info(`Forgot password request processed for: ${email}`);

    res.status(200).json({
      success: true,
      message: result.message,
    });
  }
);

export const resetPassword = catchAsync(async (req: Request, res: Response) => {
  logger.info("Reset password endpoint called");
  const { token, newPassword } = req.body;

  if (!token || !newPassword) {
    return res.status(400).json({
      success: false,
      message: "Token and new password are required",
    });
  }

  if (newPassword.length < 6) {
    return res.status(400).json({
      success: false,
      message: "Password must be at least 6 characters long",
    });
  }

  const result = await AuthService.resetPassword(token, newPassword);
  logger.info("Password reset completed successfully");

  res.status(200).json({
    success: true,
    message: result.message,
  });
});
