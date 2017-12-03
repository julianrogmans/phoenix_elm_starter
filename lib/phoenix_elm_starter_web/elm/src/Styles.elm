module Styles exposing (..)

-- import Color exposing (rgba)
-- import Style.Color as Color

import Style exposing (..)
import Style.Font as Font


type Style
    = None
    | App
    | Intup
    | LargeHeader
    | Submit
    | Label
    | Login
    | Register


styleSheet : StyleSheet Style variation
styleSheet =
    Style.styleSheet
        [ style App []
        , style LargeHeader
            [ Font.size 30
            ]
        ]
