module.exports = {
  entry: "./main.js",
  output: {
    path: __dirname + "/build",
    filename: "app.js"
  },
  module: {
    loaders: [ 
      {test: /\.css$/, loader: "style-loader!css-loader"},
      {test: /\.jsx$/, loader: "jsx-loader"}
    ]
  }
}
