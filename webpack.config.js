var webpack = require('webpack');
var modules_dir = __dirname + '/node_modules';

var config = {
  entry: {
    library: [__dirname + '/library/App.jsx'],
    vendor: []
  },
  output: {
    path: __dirname + '/build',
    filename: 'app.js'
  },
  plugins: [
    new webpack.optimize.CommonsChunkPlugin('vendor', 'vendor.js')
  ],
  module: {
    loaders: [ 
      {test: /\.css$/, loader: 'style-loader!css-loader'},
      {test: /\.jsx$/, loader: 'jsx-loader'}
    ],
    noParse: []
  },
  resolve: { alias: {} },
  addVendor: function (name, path) {
    this.resolve.alias[name] = path;
    this.module.noParse.push(new RegExp('^' + path + '$'));
    this.entry.vendor.push(name);
  }
}
config.addVendor('react', modules_dir + '/react/dist/react.min.js');

module.exports = config;
