module Main exposing (main)

import Navigation
import Update as State
import App
import View
import Types exposing (Actions(UrlChange))


main =
    Navigation.program UrlChange
        { init = App.init
        , update = State.update
        , view = View.render
        , subscriptions = App.subscriptions
        }
