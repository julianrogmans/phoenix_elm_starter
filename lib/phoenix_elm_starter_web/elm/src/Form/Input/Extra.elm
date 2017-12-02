module Form.Input.Extra exposing (emailInput)

import Form
import Form.Input as Input
import Form.Field as Field


emailInput field =
    Input.baseInput "email"
        Field.String
        Form.Text
        field
