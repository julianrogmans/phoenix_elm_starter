module Element.Extra exposing (stringField)

import Html exposing (Html, Attribute)
import Html.Attributes exposing (style)
import Element exposing (Element)
import Form exposing (Form, FieldState)
import Form.Input exposing (Input)
import View.Style exposing (Class)


stringField : Input e String -> String -> List ( String, String ) -> Form e o -> Element Class variation Form.Msg
stringField input name styles form_ =
    let
        defaultStyles =
            [ ( "width", "100%" )
            , ( "height", "auto" )
            , ( "font-size", "18px" )
            , ( "padding", "5px" )
            ]
    in
        Element.html <|
            flip input [ style (defaultStyles ++ styles) ] <|
                Form.getFieldAsString name form_
