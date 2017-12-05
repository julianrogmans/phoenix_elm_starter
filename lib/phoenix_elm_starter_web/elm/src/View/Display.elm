module View.Display exposing (styleSheet)

import Style exposing (StyleSheet, Style, Property)
import Color
import Style.Font as Font
import Style.Sheet as Sheet exposing (ChildSheet)
import Style.Border as Border
import Style.Color as Color
import Types exposing (State)
import View.Style as Style exposing (Class(..))
import View.StyleHelpers
    exposing
        ( ClassList
        , Variations(..)
        , class
        , composeWith
        )
import Routing as Route exposing (Route)
import Authentication.Styles as Auth


defaultStyles : State -> ClassList variation
defaultStyles state =
    [ class App
        []
    , class Submit
        [ Default [ Border.rounded 10 ]
        , Optional [ ( Color.background Color.red, state.hasClass ) ]
        ]
    , class LargeHeader
        [ Default [ Font.size 30 ]
        ]
    ]


styleSheet : State -> StyleSheet Class variation
styleSheet state =
    Style.styleSheet
        (defaultStyles state
            |> composeWith (pageStyles state)
        )


pageStyles : State -> ClassList variation
pageStyles state =
    case state.route of
        Just (Route.Register) ->
            Auth.registerStyles state

        Just (Route.Login) ->
            Auth.loginStyles state

        _ ->
            []
