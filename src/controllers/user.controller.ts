import { Request, Response } from "express";
import { getLoggedUser } from "../services/user.service";

class UserController {
  async getLoggedUser(req: Request, res: Response) {
    const loggedUser = res.locals.user;

    try {
      const { error, payload } = await getLoggedUser(loggedUser.name);

      if (error) {
        return res.status(500).json({ error: payload });
      }

      return res.status(200).json(payload);
    } catch (err) {
      return res.status(500).json({ error: "Internal Server Error" });
    }
  }
}

export default new UserController();
