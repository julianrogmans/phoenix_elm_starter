import Elm from "./src/Main.elm";

const elmDiv = document.querySelector("#elm-target");
if (elmDiv) {
  Elm.App.embed(elmDiv);
}
