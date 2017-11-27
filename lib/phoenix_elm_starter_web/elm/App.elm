module App exposing (..)

import Html
import Element exposing (viewport, text)
import Navigation
import RemoteData exposing (RemoteData(..), WebData)
import UrlParser exposing (parseLocation)
import Styles exposing (stylesheet)
import Types exposing (Message(..), Model, Member)
import Routing as R exposing (Route, routes)
import Graphql.Requests exposing (routeRequest)
import Update exposing (update)
import Login.View as LoginView
import Graphql.Queries exposing (sessionQuery)
import Graphql.Decoders exposing (sessionDecoder)
import Graphql.Utils exposing (createDecoder, createQuery)


initialModel : Maybe Route -> Model
initialModel route =
    { login = LoginView.initialModel
    , authenticated = False
    , session =
        { data = NotAsked
        , decoder = createDecoder sessionDecoder
        }
    , error = Nothing
    , route = route
    }


init location =
    let
        currentRoute =
            parseLocation routes location
    in
        ( initialModel currentRoute, routeRequest currentRoute )


subscriptions model =
    Sub.none


view model =
    viewport stylesheet <|
        case model.route of
            Just (R.Home) ->
                text <| toString model.error

            -- Element.html <|
            --     HomeView.layout model.home
            Just (R.Login) ->
                Element.html <|
                    Html.map LoginMsg (LoginView.layout model.login)

            _ ->
                text "404 Not Found"


main =
    Navigation.program UrlChange
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
