module Authentication.Register exposing (..)

import List
import Element as Page exposing (Element)
import Element.Attributes as Add exposing (fill, fillPortion, percent, px)
import Form exposing (Form)
import Form.Validate as V exposing (andMap)
import Form.Input exposing (textInput, passwordInput)
import Form.Input.Extra exposing (emailInput, stringField)
import Authentication.Types exposing (Action(..), RegisterFormState)
import Authentication.Form exposing (renderInput, submitButton)
import View.Style as Style exposing (Class)


validate : V.Validation e RegisterFormState
validate =
    V.succeed RegisterFormState
        |> andMap (V.field "firstName" V.string)
        |> andMap (V.field "lastName" V.string)
        |> andMap (V.field "email" V.email)
        |> andMap (V.field "password" V.string)
        |> andMap (V.field "passwordConfirmation" V.string)


layout : Form () RegisterFormState -> Element Class variation Action
layout register =
    Page.column Style.None
        [ Add.width fill ]
        [ Page.h1 Style.LargeHeader [ Add.center, Add.padding 10 ] <| Page.text "Sign Up"
        , Page.map RegisterForm <| renderForm register
        , Page.map RegisterForm <| submitButton "Register"
        ]


renderForm : Form () RegisterFormState -> Element Class variation Form.Msg
renderForm register =
    let
        fields =
            [ ( "firstName", textInput )
            , ( "lastName", textInput )
            , ( "email", emailInput )
            , ( "password", passwordInput )
            , ( "passwordConfirmation", passwordInput )
            ]
    in
        Page.column Style.None
            [ Add.width fill ]
            (List.map (renderInput register) fields)
