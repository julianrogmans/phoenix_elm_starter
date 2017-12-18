module Authentication.Style exposing (..)

import Color exposing (rgba)
import Style exposing (Style, style)
import Style.Color as Color
import View.Style as Class exposing (Class(..), button)


loginStyles : List (Style Class variation)
loginStyles =
    [ button (Submit { disabled = True })
        [ Color.background Color.darkGreen ]
    ]


registerStyles : List (Style Class variation)
registerStyles =
    []
