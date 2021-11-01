import { v4 } from 'uuid';

import { User } from 'database';

const getRecords = async (event: any, context: any) => {
    // const db = User.myDatabaseLayerTest();
    const uuid = v4();

    const user = await User.getUsers();

    return {
        statusCode: 200,
        body: JSON.stringify({
            uuid,
            user,
        }),
    };
};

export { getRecords };
