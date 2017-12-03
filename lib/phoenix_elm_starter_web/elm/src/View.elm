module View exposing (render)

import Html exposing (Html)
import Element as Page exposing (text)
import Routing as Route
import Styles as S exposing (styleSheet)
import Types exposing (Action(..), State, Member)
import Authentication.Types as Auth
import Authentication.Login as Login
import Authentication.Register as Register


render : State -> Html (Action Auth.Action success)
render state =
    Page.viewport styleSheet <|
        Page.row S.App
            []
            [ Page.mainContent S.None [] <|
                case state.route of
                    Just route ->
                        case route of
                            Route.Home ->
                                text "Home"

                            Route.Login ->
                                Page.map AuthAction <|
                                    Login.layout state.login

                            Route.Register ->
                                Page.map AuthAction <|
                                    Register.layout state.register

                            Route.NotFound ->
                                text "404 Not Found"

                    Nothing ->
                        text "404 Not Found"
            ]
