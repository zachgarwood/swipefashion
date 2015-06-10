var path = require('path');
var HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  entry: [
    'webpack/hot/dev-server',
    path.resolve(__dirname, 'library/main.js')
  ],
  output: {
    path: path.resolve(__dirname, 'dev'),
    filename: 'app.js'
  },
  module: {
    loaders: [ 
      {test: /\.jsx$/, loader: 'jsx-loader'},
      {test: /\.scss$/, loader: 'style!css!sass'}
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      inject: true,
      template: path.resolve(__dirname, 'library/index.html')
    })
  ]
}
