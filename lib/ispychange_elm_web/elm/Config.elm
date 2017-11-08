module Config exposing (AppConfig)

import Html


type alias AppConfig data model msg =
    { init : ( model, Cmd msg )
    , update : msg -> model -> ( model, Cmd msg )
    , urlUpdate : data -> model -> ( model, Cmd msg )
    , view : model -> Html msg
    , subscriptions : model -> Sub msg
    }
