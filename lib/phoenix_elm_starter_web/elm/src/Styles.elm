module Styles exposing (..)

-- import Color exposing (rgba)

import Style exposing (..)
import Style.Font as Font
import Style.Color as Color


type Selectors
    = None
    | App
    | Intup
    | Submit
    | Label
    | Login
    | Register


stylesheet =
    Style.styleSheet
        [ style App []
        ]
