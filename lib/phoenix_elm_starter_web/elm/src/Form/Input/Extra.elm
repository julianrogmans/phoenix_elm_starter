module Form.Input.Extra exposing (emailInput, stringField, boolField)

import String
import Element
import Form
import Form.Input as Input
import Form.Field as Field


stringField state name input =
    Element.html <| input <| Form.getFieldAsString name state


boolField state name input =
    Element.html <| input <| Form.getFieldAsBool name state


emailInput field =
    Input.baseInput "email"
        Field.String
        Form.Text
        field
