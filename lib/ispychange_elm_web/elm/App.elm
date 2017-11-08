module App exposing (..)

import Config
import Navigation
import Components.Home.Main as Home exposing (view)
import Html exposing (text, Html)


type alias Model =
    Maybe a


init : ( Model, Cmd Msg )
init =
    ( Just "Phoenix Elm Starter", Cmd.none )


type Msg
    = NoOp


update msg model =
    case msg of
        NoOp ->
            model


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view model =
    App.Html


main =
    Navigation.program
