import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

async function main() {
  await prisma.user.createMany({
    data: [
      {
        name: "Isah",
        email: "isahveronika@gmail.com",
        password: "isahveronika",
      },
      {
        name: "aiden",
        email: "aidenputraangkasa@gmail.com",
        password: "aidenputraangkasa",
      },
    ],
  });

  console.log("Seeding complete!");
}

main()
  .catch((e) => {
    console.error("Error seeding:", e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
