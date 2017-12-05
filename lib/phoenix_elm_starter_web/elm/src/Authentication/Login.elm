module Authentication.Login exposing (..)

import List
import Element as Page exposing (Element)
import Element.Attributes as Add exposing (fill, px)
import Form exposing (Form)
import Form.Validate as V exposing (andMap)
import Form.Input as Input
import Form.Input.Extra as Input
import Authentication.Types exposing (Action(..), LoginFormState)
import Authentication.Form exposing (renderInput, submitButton)
import View.Style as Style exposing (Class)


validate : V.Validation e LoginFormState
validate =
    V.succeed LoginFormState
        |> andMap (V.field "email" V.email)
        |> andMap (V.field "password" V.string)


layout : Form () LoginFormState -> Element Class variation Action
layout login =
    Page.column Style.None
        [ Add.width fill ]
        [ Page.h1 Style.LargeHeader [ Add.center, Add.padding 10 ] <| Page.text "Login"
        , Page.map LoginForm <| renderForm login
        , Page.map LoginForm <| submitButton "Login"
        ]


renderForm : Form () LoginFormState -> Element Class variation Form.Msg
renderForm login =
    let
        fields =
            [ ( "email", Input.emailInput )
            , ( "password", Input.passwordInput )
            ]
    in
        Page.column Style.None
            [ Add.width fill ]
            (List.map (renderInput login) fields)
