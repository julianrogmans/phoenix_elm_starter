const path = require("path");
module.exports = {
  entry: {
    app: path.resolve(__dirname, "lib/phoenix_elm_starter_web/elm/index.js")
  },
  output: {
    path: path.resolve(__dirname, "priv/static/js"),

    filename: "[name].js"
  },
  module: {
    rules: [
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        use: {
          loader: "elm-webpack-loader",
          options: {
            verbose: true,
            warn: true,
            debug: true
          }
        }
      }
    ]
  }
};
