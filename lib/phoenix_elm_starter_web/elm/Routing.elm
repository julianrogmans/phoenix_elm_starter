module Routing exposing (..)

import Json.Decode as Decode
import Html exposing (Attribute)
import Html.Events exposing (onWithOptions)
import Navigation
import UrlParser exposing (return, apply, follow, path, apply, oneOf)


type Route
    = Home
    | Login
    | NotFound


routes =
    oneOf
        [ return Home
        , return Login |> follow paths.login
        ]


onLinkClick : msg -> Attribute msg
onLinkClick message =
    let
        options =
            { stopPropagation = False
            , preventDefault = True
            }
    in
        onWithOptions "click" options (Decode.succeed message)


paths =
    { login = path "login" }
