module App exposing (..)

import Navigation
import Html exposing (div, text)


type alias Model =
    String


init : ( Model, Cmd Msg )
init =
    ( "Phoenix Elm Starter", Cmd.none )


type Msg
    = NoOp


update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view model =
    div []
        [ text model
        ]


main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
