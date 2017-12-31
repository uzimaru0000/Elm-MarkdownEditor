'use strict'

const path = require('path');
const ExtractText = require('extract-text-webpack-plugin');

module.exports = {
    entry: {
        app: [
            './src/index.js'
        ]
    },
    output: {
        path: path.join(__dirname, '/dist'),
        filename: '[name].js'
    },
    module: {
        rules: [
            {
                test: /\.html$/,
                exclude: /node_modules/,
                use: 'file-loader?name=[name].[ext]',
            },
            {
                test: /\.css$/,
                use: ExtractText.extract({
                    fallback: 'style-loader',
                    use: 'css-loader'
                })
            },
            {
                test: /\.elm/,
                exclude: [/node_modules/, /elm-stuff/, /Stylesheets\.elm/],
                use: [
                    'elm-hot-loader',
                    'elm-webpack-loader?debug=true'
                ]
            },
            {
                test: /Stylesheets\.elm/,
                use: ExtractText.extract({
                    fallback: 'style-loader',
                    use: [
                        'css-loader',
                        'elm-css-webpack-loader'
                    ]
                })
            }
        ]
    },
    plugins: [
        new ExtractText('style.css')
    ],
    devServer: {
        inline: true,
        stats: 'errors-only'
    }
};
