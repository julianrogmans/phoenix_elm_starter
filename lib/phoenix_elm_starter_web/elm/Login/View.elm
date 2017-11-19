module Login.View exposing (..)

import Element exposing (text, row)
import Element.Events exposing (onInput)
import Login.Styles as Style exposing (Selectors(..))


type alias Model =
    { email : Maybe String
    , password : Maybe String
    }


type Message
    = EmailInputChange String
    | PasswordInputChange String


initialModel =
    { email = Nothing
    , password = Nothing
    }


update msg model =
    case msg of
        EmailInputChange value ->
            ( { model | email = Just value }, Cmd.none )

        PasswordInputChange value ->
            ( { model | password = Just value }, Cmd.none )


layout model =
    Element.layout Style.stylesheet <|
        row Form
            []
            []
