module View.Style exposing (..)

import List exposing (append)
import Style exposing (Style, Property, style)
import Color
import Style.Font as Font
import Style.Border as Border
import Style.Color as Color


type Class
    = None
    | App
    | Intup
    | LargeHeader
    | Submit SubmitOptions
    | Label


type alias SubmitOptions =
    { disabled : Bool }


type alias StyleFunction variation =
    Class -> List (Property Class variation) -> Style Class variation


button : StyleFunction variation
button class props =
    style class <|
        append
            [ Border.rounded 10
            , Color.background Color.red
            , Color.text Color.white
            ]
            props


styles : List (Style Class variation)
styles =
    [ style App
        []
    , button (Submit { disabled = False }) []
    , button (Submit { disabled = True })
        [ Color.background Color.lightGrey ]
    , style LargeHeader
        [ Font.size 30 ]
    ]
