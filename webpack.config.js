var path = require('path');
var webpack = require('webpack');
var HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  entry: {
    app: './library/main.js',
    vendor: [
      'backbone',
      'backbone-react-component',
      'jquery',
      'react',
      'store',
      'node-uuid',
    ] 
  },
  output: {
    path: path.resolve(__dirname, 'build'),
    filename: 'app.js'
  },
  module: {
    loaders: [ 
      {test: /\.jsx$/, loader: 'jsx-loader'},
      {test: /\.scss$/, loader: 'style!css!sass'}
    ],
    noParse: []
  },
  plugins: [
    new webpack.optimize.CommonsChunkPlugin('vendor', 'vendor.js'),
    new HtmlWebpackPlugin({
      hash: true,
      inject: true,
      minify: true,
      template: './library/index.html'
    })
  ]
};
