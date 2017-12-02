module Authentication.Login exposing (..)

import List
import Element as Page
import Element.Attributes as Add exposing (fill, px)
import Element.Events as Event
import Form.Validate as V exposing (andMap)
import Form.Input exposing (passwordInput)
import Form.Input.Extra exposing (emailInput, stringField)
import Authentication.Types exposing (Actions(..), LoginFormState)
import Authentication.Form exposing (renderInput, submitButton)
import Styles as S


validate =
    V.succeed LoginFormState
        |> andMap (V.field "email" V.email)
        |> andMap (V.field "password" V.string)


layout login =
    Page.column S.Login
        [ Add.width fill ]
        [ Page.h1 S.None [ Add.center, Add.padding 10 ] <| Page.text "Login"
        , Page.map LoginForm <| renderForm login
        , Page.map LoginForm <| submitButton "Login"
        ]


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
