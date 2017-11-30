module Config exposing (..)

import Navigation
import UrlParser
import RemoteData exposing (RemoteData(NotAsked))
import Routing
import Types
import Graphql.Requests as Graphql
import Graphql.Decoders exposing (sessionDecoder)
import Graphql.Utils exposing (createDecoder)
import Authentication.Login as Login
import Authentication.Register as Register


initialState : Maybe Routing.Route -> Types.State
initialState route =
    { login = Login.initialState
    , members = NotAsked
    , session = NotAsked
    , register = Register.initialState
    , route = route
    }


init : Navigation.Location -> ( Types.State, Cmd msg )
init location =
    let
        currentRoute =
            UrlParser.parseLocation Routing.routes location
    in
        ( initialState currentRoute, Graphql.routeRequest currentRoute )
