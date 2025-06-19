import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import crypto from "crypto";
import prisma from "../configs/prisma";
import { AppError } from "../utils/error-handler.utils";
import logger from "../utils/logger.utils";
import {
  sendResetPasswordEmail,
  sendPasswordResetSuccessEmail,
} from "./email.service";

export const register = async (
  email: string,
  password: string,
  name: string
) => {
  logger.info(`Attempting to register user with email: ${email}`);
  const existingUser = await prisma.user.findUnique({ where: { email } });
  if (existingUser) {
    logger.warn(`Registration failed: Email already in use - ${email}`);
    throw new AppError("Email already in use", 400);
  }

  const hashedPassword = await bcrypt.hash(password, 10);
  const user = await prisma.user.create({
    data: { email, password: hashedPassword, name },
  });
  logger.info(`User registered successfully: ${user.id}`);
  return user;
};

export const login = async (email: string, password: string) => {
  logger.info(`Login attempt for user: ${email}`);
  const user = await prisma.user.findUnique({ where: { email } });
  if (!user) {
    logger.warn(`Login failed: User not found - ${email}`);
    throw new AppError("User not found", 404);
  }

  if (!user.password) {
    logger.error(`Login failed: User has no password set - ${email}`);
    throw new AppError("User has no password set", 500);
  }

  const isPasswordValid = await bcrypt.compare(password, user.password);
  if (!isPasswordValid) {
    logger.warn(`Login failed: Invalid password for user - ${email}`);
    throw new AppError("Invalid password", 401);
  }

  const token = jwt.sign({ userId: user.id }, process.env.JWT_SECRET!, {
    expiresIn: "1h",
  });
  logger.info(`User logged in successfully: ${user.id}`);
  return token;
};

export const forgotPassword = async (email: string) => {
  logger.info(`Forgot password request for email: ${email}`);

  const user = await prisma.user.findUnique({ where: { email } });
  if (!user) {
    logger.warn(`Forgot password failed: User not found - ${email}`);
    throw new AppError("User not found", 404);
  }

  const resetToken = crypto.randomBytes(32).toString("hex");
  const resetTokenExpiry = new Date(Date.now() + 3600000);

  await prisma.user.update({
    where: { email },
    data: {
      resetToken,
      resetTokenExpiry,
    },
  });

  try {
    await sendResetPasswordEmail(email, resetToken, user.name);
    logger.info(`Password reset email sent successfully to: ${email}`);
    return { message: "Password reset email sent successfully" };
  } catch (error) {
    logger.error(`Failed to send password reset email to ${email}:`, error);
    await prisma.user.update({
      where: { email },
      data: {
        resetToken: null,
        resetTokenExpiry: null,
      },
    });
    throw new AppError("Failed to send reset password email", 500);
  }
};

export const resetPassword = async (token: string, newPassword: string) => {
  logger.info(
    `Password reset attempt with token: ${token.substring(0, 10)}...`
  );

  const user = await prisma.user.findFirst({
    where: {
      resetToken: token,
      resetTokenExpiry: {
        gt: new Date(),
      },
    },
  });

  if (!user) {
    logger.warn(`Password reset failed: Invalid or expired token`);
    throw new AppError("Invalid or expired reset token", 400);
  }

  const hashedPassword = await bcrypt.hash(newPassword, 10);

  await prisma.user.update({
    where: { id: user.id },
    data: {
      password: hashedPassword,
      resetToken: null,
      resetTokenExpiry: null,
    },
  });

  try {
    await sendPasswordResetSuccessEmail(user.email, user.name);
    logger.info(`Password reset successful for user: ${user.id}`);
  } catch (error) {
    logger.error(
      `Failed to send password reset success email to ${user.email}:`,
      error
    );
  }

  logger.info(`Password reset completed successfully for user: ${user.id}`);
  return { message: "Password reset successful" };
};
