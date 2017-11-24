module Login.View exposing (..)

import Html exposing (div, input, text, button)
import Html.Attributes exposing (type_, placeholder, value, name)
import Html.Events exposing (onClick, onInput)
import Element exposing (row, html)
import Graphql.Schema exposing (query)
import Types exposing (Message(SignInMemberResponse))
import Login.Types exposing (Message(..), Model)
import Login.Styles as Style exposing (Selectors(..))
import Graphql.Queries exposing (sessionQuery)
import Graphql.Decoders exposing (sessionDecoder)


initialModel =
    { email = ""
    , password = ""
    , submitting = False
    }


signIn model =
    query SignInMemberResponse (sessionQuery model) sessionDecoder


update msg model =
    case msg of
        EmailInputChange value ->
            ( { model | email = value }, Cmd.none )

        PasswordInputChange value ->
            ( { model | password = value }, Cmd.none )

        SignInMember ->
            ( { model | submitting = True }, signIn model )


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
                        [ onClick SignInMember ]
                        [ text "Sign In" ]
                    ]
            ]
