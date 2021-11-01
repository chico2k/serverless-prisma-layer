/* eslint-disable @typescript-eslint/no-var-requires */
const path = require('path');
const slsw = require('serverless-webpack');
const nodeExternals = require('webpack-node-externals');
const CopyPlugin = require('copy-webpack-plugin');

module.exports = {
    context: __dirname,
    mode: slsw.lib.webpack.isLocal ? 'development' : 'production',
    entry: path.join(__dirname, 'index.ts'),
    devtool: slsw.lib.webpack.isLocal ? 'eval-cheap-source-map' : 'source-map',
    resolve: {
        extensions: ['.mjs', '.json', '.ts', 'js'],
        symlinks: false,
        cacheWithContext: false,
    },
    output: {
        libraryTarget: 'commonjs',
        path: path.join(__dirname, 'lambda-layers-database', 'nodejs', 'node14', 'node_modules', 'database'),
        filename: 'index.js',
    },
    target: 'node',
    optimization: {
        minimize: true,
    },

    externals: [nodeExternals()],
    module: {
        rules: [
            // all files with a `.ts` or `.tsx` extension will be handled by `ts-loader`
            {
                test: /\.(tsx?)$/,
                loader: 'ts-loader',
                exclude: [
                    [
                        path.resolve(__dirname, '.serverless'),
                        // path.resolve(__dirname, 'node_modules'),
                        path.resolve(__dirname, '.webpack'),
                    ],
                ],
                options: {
                    transpileOnly: true,
                    experimentalWatchApi: true,
                },
            },
        ],
    },
    plugins: [
        new CopyPlugin({
            patterns: [
                { from: './prisma/schema.prisma' },
                { from: './package.json' },
                { from: './node_modules/@prisma', to: '../@prisma' },
                { from: './node_modules/.prisma', to: '../.prisma' },
            ],
        }),
    ],
};
