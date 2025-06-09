import prisma from "../configs/prisma";

interface UserServiceResponse {
  error?: string;
  payload: any;
}

export const getLoggedUser = async (
  name: string
): Promise<UserServiceResponse> => {
  try {
    const user = await prisma.user.findFirst({
      where: { name },
      select: {
        id: true,
        name: true,
        email: true,
      },
    });

    if (!user) {
      return { error: "User not found", payload: null };
    }

    return { payload: user };
  } catch (error) {
    return { error: "Failed to fetch user", payload: null };
  }
};
