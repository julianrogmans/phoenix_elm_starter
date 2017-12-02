module View exposing (render)

import Element as Page exposing (text)
import Element.Events as Events
import Routing as Route
import Styles exposing (stylesheet, Selectors(..))
import Types exposing (Actions(..), State, Member)
import Authentication.Login as Login
import Authentication.Register as Register


render state =
    Page.viewport stylesheet <|
        Page.row None
            []
            [ Page.mainContent None [] <|
                case state.route of
                    Just route ->
                        case route of
                            Route.Home ->
                                Page.row None
                                    []
                                    [ Page.map HomeAction <|
                                        text "Home"
                                    ]

                            Route.Login ->
                                Page.row None
                                    []
                                    [ Page.map AuthAction <|
                                        Login.layout state.login
                                    ]

                            Route.Register ->
                                Page.row None
                                    []
                                    [ Page.map AuthAction <|
                                        Register.layout state.register
                                    ]

                            Route.NotFound ->
                                Page.row None
                                    []
                                    [ Page.map NotFoundAction <|
                                        text "404 Not Found"
                                    ]

                    Nothing ->
                        Page.row None
                            []
                            [ Page.map NotFoundAction <|
                                text "404 Not Found"
                            ]
            ]
