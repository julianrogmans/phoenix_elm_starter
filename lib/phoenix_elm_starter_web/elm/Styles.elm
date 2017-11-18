module Styles exposing (..)

import Color exposing (rgba)
import Style exposing (..)
import Style.Font as Font
import Style.Color as Color


type Selectors
    = None


colors =
    { primaryColor = rgba 144 144 144 1
    }


stylesheet =
    Style.styleSheet
        [ style None []
        ]
