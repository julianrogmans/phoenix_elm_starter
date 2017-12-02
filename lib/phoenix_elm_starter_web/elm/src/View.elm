module View exposing (render)

import Element as Page exposing (text)
import Element.Events as Events
import Routing as Route
import Styles as S exposing (stylesheet)
import Types exposing (Actions(..), State, Member)
import Authentication.Login as Login
import Authentication.Register as Register


render state =
    Page.viewport stylesheet <|
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
