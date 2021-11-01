import { User as UserDB } from '@prisma/client';
import prisma from './lib/prisma';

const getUsers = async (): Promise<UserDB[]> => {
    return await prisma.user.findMany();
};

export class User {
    static getUsers = getUsers;
}
