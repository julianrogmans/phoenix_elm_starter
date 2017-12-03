module Main exposing (main)

import Navigation
import Update as State
import App
import View
import Types exposing (Action(UrlChange))
import Authentication.Types as Auth


main : Program Never Types.State (Action Auth.Action Types.Session)
main =
    Navigation.program UrlChange
        { init = App.init
        , update = State.update
        , view = View.render
        , subscriptions = App.subscriptions
        }
