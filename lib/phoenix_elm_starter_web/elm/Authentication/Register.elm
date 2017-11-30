module Authentication.Register exposing (..)

import Html exposing (div, input, text, button)
import Html.Attributes exposing (type_, placeholder, value, name)
import Html.Events exposing (onClick, onInput)
import Element exposing (row, html)
import Authentication.Types exposing (Actions(..))
import Authentication.Styles as Style exposing (Selectors(..))


initialState =
    { firstName = "Julian"
    , lastName = "Rogmans"
    , email = "rogmansj@gmail.com"
    , password = "Julian"
    , passwordConfirmation = "Julian"
    }


layout model =
    Element.layout Style.stylesheet <|
        row Form
            []
            [ html <|
                div []
                    [ input
                        [ type_ "text"
                        , value model.firstName
                        , name "firstName"
                        , onInput RegisterFirstName
                        ]
                        []
                    , input
                        [ type_ "text"
                        , value model.lastName
                        , name "lastName"
                        , onInput RegisterLastName
                        ]
                        []
                    , input
                        [ type_ "email"
                        , value model.email
                        , name "email"
                        , onInput RegisterEmail
                        ]
                        []
                    , input
                        [ type_ "password"
                        , value model.password
                        , name "password"
                        , onInput RegisterPassword
                        ]
                        []
                    , input
                        [ type_ "password"
                        , value model.password
                        , name "passwordConfirmation"
                        , onInput RegisterPasswordConfirmation
                        ]
                        []
                    , button
                        [ onClick Register ]
                        [ text "Sign Up" ]
                    ]
            ]
