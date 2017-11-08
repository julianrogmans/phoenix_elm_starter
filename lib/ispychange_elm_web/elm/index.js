import Elm from "./App.elm";

const elmDiv = document.querySelector("#elm-target");
if (elmDiv) {
  Elm.Main.embed(elmDiv);
}
