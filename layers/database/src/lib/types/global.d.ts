import type { PrismaClient } from '.prisma/client';

declare global {
    var prisma: PrismaClient;
}

declare var prisma: PrismaClient;
