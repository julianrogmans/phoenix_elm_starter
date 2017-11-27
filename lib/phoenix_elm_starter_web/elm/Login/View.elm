module Login.View exposing (..)

import Html exposing (div, input, text, button)
import Html.Attributes exposing (type_, placeholder, value, name)
import Html.Events exposing (onClick, onInput)
import Element exposing (row, html)
import RemoteData exposing (RemoteData(..))
import Graphql.Schema as Schema
import Graphql.Queries exposing (sessionQuery)
import Types exposing (Message(SignInMember))
import Login.Types exposing (Message(..))
import Login.Styles as Style exposing (Selectors(..))


initialModel =
    { email = "rogmansj@gmail.com"
    , password = "Julain"
    }


update msg model =
    let
        login =
            model.login

        session =
            model.session
    in
        case msg of
            EmailInputChange value ->
                ( { model | login = { login | email = value } }, Cmd.none )

            PasswordInputChange value ->
                ( { model | login = { login | password = value } }, Cmd.none )

            SignIn ->
                ( { model | session = { session | data = Loading } }, Schema.query SignInMember session (sessionQuery login) )


layout model =
    Element.layout Style.stylesheet <|
        row Form
            []
            [ html <|
                div []
                    [ input
                        [ type_ "text"
                        , value model.email
                        , name "Email"
                        , onInput EmailInputChange
                        ]
                        []
                    , input
                        [ type_ "password"
                        , value model.password
                        , name "Password"
                        , onInput PasswordInputChange
                        ]
                        []
                    , button
                        [ onClick SignIn ]
                        [ text "Sign In" ]
                    ]
            ]
