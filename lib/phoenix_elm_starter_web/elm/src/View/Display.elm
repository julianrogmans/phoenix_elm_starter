module View.Display exposing (styleSheet)

import Style exposing (StyleSheet, Style)
import Style.Sheet as Sheet exposing (mix)
import View.Style as Style exposing (Class(..), styles)
import Routing as Route exposing (Route)
import Authentication.Style as Auth


styleSheet : Maybe Route -> StyleSheet Class variation
styleSheet route =
    Style.styleSheet
        [ mix <| pageStyles route
        , mix styles
        ]


pageStyles : Maybe Route -> List (Style Class variation)
pageStyles route =
    case route of
        Just (Route.Register) ->
            Auth.registerStyles

        Just (Route.Login) ->
            Auth.loginStyles

        _ ->
            []
