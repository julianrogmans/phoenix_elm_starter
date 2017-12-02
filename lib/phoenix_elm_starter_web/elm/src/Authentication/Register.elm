module Authentication.Register exposing (..)

import List
import Html exposing (div, button)
import Element as Page
import Form exposing (Form)
import Form.Validate as V exposing (andMap)
import Form.Input as Input
import Form.Input.Extra as Input
import Authentication.Types exposing (Actions(..), RegisterFormState)
import Styles exposing (Selectors(..))


validate =
    V.succeed RegisterFormState
        |> andMap (V.field "firstName" V.string)
        |> andMap (V.field "lastName" V.string)
        |> andMap (V.field "email" V.email)
        |> andMap (V.field "password" V.string)
        |> andMap (V.field "passwordConfirmation" V.string)


layout register =
    Page.row None
        []
        [ Page.map RegisterForm <|
            render_form register
        ]


render_form register =
    let
        field =
            flip Form.getFieldAsString register
    in
        Page.wrappedRow None
            []
            [ Page.html <| flip Input.textInput [] <| field "firstName"
            , Page.html <| flip Input.textInput [] <| field "lastName"
            , Page.html <| flip Input.emailInput [] <| field "email"
            , Page.html <| flip Input.passwordInput [] <| field "password"
            , Page.html <| flip Input.passwordInput [] <| field "passwordConfirmation"
            ]
