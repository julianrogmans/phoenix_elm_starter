module Form.Input.Extra exposing (emailInput, stringField, boolField)

import Html exposing (Html, Attribute)
import Element exposing (Element)
import Form exposing (Form, FieldState)
import Form.Input as Input
import Form.Field as Field
import View.Style as Style exposing (Class)


type alias InputFlipped e a =
    FieldState e a -> Html Form.Msg


stringField : Form e o -> String -> InputFlipped e String -> Element Class variation Form.Msg
stringField state name input =
    Element.html <| input <| Form.getFieldAsString name state


boolField : Form e o -> String -> InputFlipped e Bool -> Element Class variation Form.Msg
boolField state name input =
    Element.html <| input <| Form.getFieldAsBool name state


emailInput : FieldState e String -> List (Attribute Form.Msg) -> Html Form.Msg
emailInput field =
    Input.baseInput "email"
        Field.String
        Form.Text
        field
