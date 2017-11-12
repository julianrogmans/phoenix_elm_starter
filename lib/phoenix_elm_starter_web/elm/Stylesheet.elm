module Stylesheet exposing (..)

import Color exposing (rgba)
import Style exposing (..)
import Style.Font as Font
import Style.Color as Color


type Styles
    = None
    | Banner
    | Callouts
    | Callout


colors =
    { primaryColor = rgba 144 144 144 1
    }


stylesheet =
    Style.styleSheet
        [ style None []
        , style Banner
            [ Font.size 72
            ]
        , style Callout
            [ Color.background colors.primaryColor ]
        ]
