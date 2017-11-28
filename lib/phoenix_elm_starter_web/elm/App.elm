module App exposing (..)

import Html exposing (Html)
import Element exposing (viewport, text)
import Navigation
import RemoteData exposing (RemoteData(..), WebData)
import UrlParser exposing (parseLocation)
import Styles exposing (stylesheet, Selectors(..))
import Types exposing (Actions(..), State, Member)
import Routing as R exposing (Route, routes)
import Graphql.Requests exposing (routeRequest)
import Update exposing (update)
import Login.View as LoginView
import Graphql.Decoders exposing (sessionDecoder)
import Graphql.Utils exposing (createDecoder)


initialState : Maybe Route -> State
initialState route =
    { login = LoginView.initialState
    , authenticated = False
    , session =
        { data = NotAsked
        , decoder = createDecoder sessionDecoder
        }
    , error = Nothing
    , route = route
    }


init : Navigation.Location -> ( State, Cmd msg )
init location =
    let
        currentRoute =
            parseLocation routes location
    in
        ( initialState currentRoute, routeRequest currentRoute )


subscriptions : a -> Sub msg
subscriptions state =
    Sub.none


view state =
    viewport stylesheet <|
        Element.row None
            []
            [ case state.route of
                Just (R.Home) ->
                    text <| toString state.error

                -- Element.html <|
                --     HomeView.layout state.home
                Just (R.Login) ->
                    Element.html <|
                        Html.map LoginMsg (LoginView.layout state.login)

                _ ->
                    text "404 Not Found"
            , case state.session.data of
                NotAsked ->
                    Element.empty

                Loading ->
                    Element.empty

                Success _ ->
                    Element.empty

                Failure error ->
                    Element.text (toString error)
            ]


main =
    Navigation.program UrlChange
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
