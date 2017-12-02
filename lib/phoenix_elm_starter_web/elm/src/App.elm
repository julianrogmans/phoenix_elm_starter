module App exposing (..)

import Navigation
import UrlParser
import Form exposing (Form)
import RemoteData exposing (RemoteData(NotAsked))
import Routing
import Types
import Graphql.Requests as Graphql
import Graphql.Decoders exposing (sessionDecoder)
import Authentication.Login as Login
import Authentication.Register as Register


initialState : Maybe Routing.Route -> Types.State
initialState route =
    { login = Form.initial [] Login.validate
    , members = NotAsked
    , session = NotAsked
    , register = Form.initial [] Register.validate
    , route = route
    }


init : Navigation.Location -> ( Types.State, Cmd msg )
init location =
    let
        currentRoute =
            UrlParser.parseLocation Routing.routes location
    in
        ( initialState currentRoute, Graphql.routeRequest currentRoute )


subscriptions : a -> Sub msg
subscriptions state =
    Sub.none
