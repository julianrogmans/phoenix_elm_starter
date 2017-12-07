module Form.Input.Extra exposing (emailInput)

import Html exposing (Html, Attribute)
import Form exposing (FieldState, InputType(Text))
import Form.Input as Input
import Form.Field as Field


emailInput : FieldState e String -> List (Attribute Form.Msg) -> Html Form.Msg
emailInput field =
    Input.baseInput "email"
        Field.String
        Text
        field
