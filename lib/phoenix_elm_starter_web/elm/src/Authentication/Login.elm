module Authentication.Login exposing (..)

import List
import Element as Page exposing (Element)
import Element.Attributes as Add exposing (fill, px)
import Form exposing (Form)
import Form.Validate as V exposing (andMap)
import Form.Input exposing (passwordInput)
import Form.Input.Extra exposing (emailInput, stringField)
import Authentication.Types exposing (Action(..), LoginFormState)
import Authentication.Form exposing (renderInput, submitButton)
import Styles as S


validate : V.Validation e LoginFormState
validate =
    V.succeed LoginFormState
        |> andMap (V.field "email" V.email)
        |> andMap (V.field "password" V.string)


layout : Form () LoginFormState -> Element S.Style variation Action
layout login =
    Page.column S.Login
        [ Add.width fill ]
        [ Page.h1 S.LargeHeader [ Add.center, Add.padding 10 ] <| Page.text "Login"
        , Page.map LoginForm <| renderForm login
        , Page.map LoginForm <| submitButton "Login"
        ]


renderForm : Form () LoginFormState -> Element S.Style variation Form.Msg
renderForm login =
    let
        fields =
            [ ( "email", emailInput )
            , ( "password", passwordInput )
            ]
    in
        Page.column S.None
            [ Add.width fill ]
            (List.map (renderInput login) fields)
