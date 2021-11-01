import { PrismaClient } from '@prisma/client';

// Client instantiation must be lazy to avoid Lambda error
// https://issueexplorer.com/issue/prisma/prisma/9520
//
// Reference must differ for production to handle ES module build
// https://github.com/prisma/prisma/pull/4920#issuecomment-927334909

const prisma = global.prisma || new PrismaClient();

if (process.env.NODE_ENV === 'development') global.prisma = prisma;
export default prisma;
