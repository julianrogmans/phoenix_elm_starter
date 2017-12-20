module View.Style exposing (..)

import List exposing (append)
import Style exposing (Style, Property, style)
import Color
import Style.Font as Font
import Style.Border as Border
import Style.Color as Color
import Style.Scale as Scale


type Class
    = None
    | App
    | Input InputOptions
    | Button
    | Error
    | LargeHeader
    | Submit SubmitOptions
    | Label


type alias SubmitOptions =
    { disabled : Bool }


type alias InputOptions =
    { error : Bool }


type alias StyleFunction variation =
    Class -> List (Property Class variation) -> Style Class variation


scaled =
    Scale.modular 16 1.618


button : StyleFunction variation
button class props =
    style class <|
        append
            [ Border.rounded 10
            , Color.background Color.red
            , Color.text Color.white
            ]
            props


input : StyleFunction variation
input class props =
    style class <|
        append
            [ Font.size <| scaled 1
            , Border.all 1
            , Border.rounded 5
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
        [ Font.size <| scaled 3 ]
    , input (Input { error = True })
        [ Color.border Color.red
        , Border.roundBottomLeft 0
        , Border.roundBottomRight 0
        ]
    , input (Input { error = False })
        [ Color.border Color.darkGrey
        ]
    , style Error
        [ Color.background Color.red
        , Color.text Color.white
        , Font.size <| scaled 1
        , Font.bold
        , Border.roundBottomLeft 5
        , Border.roundBottomRight 5
        , Style.translate 0 -7 0
        ]
    ]
