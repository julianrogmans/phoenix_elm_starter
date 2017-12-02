module Authentication.Styles exposing (..)

import Color exposing (rgba)
import Style exposing (..)
import Style.Font exposing (..)
import Style.Color exposing (..)


type Selectors
    = None


stylesheet =
    Style.styleSheet
        [ style None [] ]
