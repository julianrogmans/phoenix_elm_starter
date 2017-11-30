module Authentication.Styles exposing (..)

import Color exposing (rgba)
import Style exposing (..)
import Style.Font exposing (..)
import Style.Color exposing (..)


type Selectors
    = Login
    | Form
    | FormLabel
    | FormInput


stylesheet =
    Style.styleSheet
        [ style Login [] ]
