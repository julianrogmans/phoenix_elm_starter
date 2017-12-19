module Main exposing (main)

import Navigation
import Update as State
import App
import View.Structure as View
import Types exposing (Action(UrlChange))


main : Program Never Types.State Action
main =
    Navigation.program UrlChange
        { init = App.init
        , update = State.update
        , view = View.render
        , subscriptions = App.subscriptions
        }
