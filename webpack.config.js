const path = require("path");
module.exports = {
  entry: {
    app: path.resolve(__dirname, "lib/ispychange_elm_web/elm") + "/index.js"
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
          options: {}
        }
      }
    ]
  }
};
