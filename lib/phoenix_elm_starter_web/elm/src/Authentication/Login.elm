module Authentication.Login exposing (..)

import List
import Html exposing (div, button)
import Element as Page
import Form exposing (Form, Msg(Submit))
import Form.Validate as V exposing (andMap)
import Form.Input as Input
import Form.Input.Extra as Input
import Authentication.Types exposing (Actions(..), LoginFormState)
import Styles exposing (Selectors(..))


validate =
    V.succeed LoginFormState
        |> andMap (V.field "email" V.email)
        |> andMap (V.field "password" V.string)


layout login =
    Page.row None
        []
        [ Page.map LoginForm <|
            render_form login
        ]


render_form login =
    let
        field =
            flip Form.getFieldAsString login
    in
        Page.wrappedRow None
            []
            [ Page.html <| flip Input.emailInput [] <| field "email"
            , Page.html <| flip Input.passwordInput [] <| field "password"
            ]
