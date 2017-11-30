module App exposing (..)

import Html exposing (Html)
import Element exposing (viewport, text)
import Element.Events as Events
import Navigation
import Routing as Route
import Styles exposing (stylesheet, Selectors(..))
import Types exposing (Actions(..), State, Member)
import Update exposing (update)
import Config exposing (init)
import Authentication.Login as LoginView
import Authentication.Register as RegisterView


subscriptions : a -> Sub msg
subscriptions state =
    Sub.none


view state =
    viewport stylesheet <|
        Element.row None
            []
            [ Element.button None [ Events.onClick Logout ] (text "Log Out")
            , case state.route of
                Just route ->
                    case route of
                        Route.Home ->
                            text "HomeView"

                        -- Element.html <|
                        --     HomeView.layout state.home
                        Route.Login ->
                            Element.html <|
                                Html.map Authentication (LoginView.layout state.login)

                        Route.Register ->
                            Element.html <|
                                Html.map Authentication (RegisterView.layout state.register)

                        Route.NotFound ->
                            text "404 Not Found"

                Nothing ->
                    text "Nothing"
            ]


main =
    Navigation.program UrlChange
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
