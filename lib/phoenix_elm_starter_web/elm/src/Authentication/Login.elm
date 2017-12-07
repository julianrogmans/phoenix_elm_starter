module Authentication.Login exposing (..)

import List
import Element as Page exposing (Element)
import Element.Extra as Page
import Element.Attributes as Add exposing (fill, px)
import Form exposing (Form)
import Form.Validate as V exposing (andMap)
import Form.Input as Input exposing (passwordInput)
import Form.Input.Extra as Input exposing (emailInput)
import Types exposing (State)
import Authentication.Types exposing (Action(..), LoginFormState)
import Authentication.Common as Common exposing (submitButton)
import View.Style as Style exposing (Class)


validate : V.Validation e LoginFormState
validate =
    V.succeed LoginFormState
        |> andMap (V.field "email" V.email)
        |> andMap (V.field "password" V.string)


layout : State -> Element Class variation Action
layout { login, session } =
    Page.column Style.None
        [ Add.width fill ]
        [ Page.h1 Style.LargeHeader [ Add.center, Add.padding 10 ] <| Page.text "Login"
        , Page.map LoginForm <| renderForm login
        , Page.map LoginForm <| submitButton "Login" session
        ]


renderForm : Form () LoginFormState -> Element Class variation Form.Msg
renderForm login =
    let
        fields =
            List.map (Common.input login)
                [ ( "email", emailInput )
                , ( "password", passwordInput )
                ]
    in
        Page.column Style.None [ Add.width fill ] fields
