import express from "express";
import passport from "passport";
import jwt from "jsonwebtoken";
import { User } from "@prisma/client";
import * as AuthController from "../controllers/auth.controller";

const router = express.Router();

router.post("/register", AuthController.register);
router.post("/login", AuthController.login);
router.post("/forgot-password", AuthController.forgotPassword);
router.post("/reset-password", AuthController.resetPassword);

router.get(
  "/google",
  passport.authenticate("google", { scope: ["profile", "email"] })
);

router.get(
  "/google/callback",
  passport.authenticate("google", {
    failureRedirect: `${process.env.NEXT_PUBLIC_BASE_URL}/login?error=google-auth-failed`,
    session: false,
  }),
  (req, res) => {
    const user = req.user as User;

    if (!user) {
      return res.redirect(
        `${process.env.NEXT_PUBLIC_BASE_URL}/login?error=user-not-found`
      );
    }

    const payload = { userId: user.id };
    const token = jwt.sign(payload, process.env.JWT_SECRET!, {
      expiresIn: "24h",
    });

    res.redirect(
      `${process.env.NEXT_PUBLIC_BASE_URL}/auth/callback?token=${token}`
    );
  }
);

export default router;
