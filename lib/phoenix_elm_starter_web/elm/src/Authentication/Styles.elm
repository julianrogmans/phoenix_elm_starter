module Authentication.Styles exposing (..)

import Color exposing (rgba)
import Style exposing (style)
import Style.Font as Font
import Style.Color as Color
import Types exposing (State)
import View.Style as Class
import View.StyleHelpers exposing (ClassList, Variations(..), class)


loginStyles : State -> ClassList variation
loginStyles state =
    [ class Class.Submit
        [ Default
            [ Color.text Color.lightGrey
            ]
        ]
    ]


registerStyles : State -> ClassList variation
registerStyles state =
    [ class Class.Submit
        [ Default
            [ Color.background Color.lightGrey
            ]
        ]
    ]
