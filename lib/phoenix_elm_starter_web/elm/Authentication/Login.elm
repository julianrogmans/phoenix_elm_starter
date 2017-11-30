module Authentication.Login exposing (..)

import Html exposing (div, input, text, button)
import Html.Attributes exposing (type_, placeholder, value, name)
import Html.Events exposing (onClick, onInput)
import Element exposing (row, html)
import Authentication.Types exposing (Actions(..))
import Authentication.Styles as Style exposing (Selectors(..))


initialState =
    { email = "rogmansj@gmail.com"
    , password = "Julain"
    }


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
                        , onInput LoginEmail
                        ]
                        []
                    , input
                        [ type_ "password"
                        , value model.password
                        , name "Password"
                        , onInput LoginPassword
                        ]
                        []
                    , button
                        [ onClick SignIn ]
                        [ text "Sign In" ]
                    ]
            ]
