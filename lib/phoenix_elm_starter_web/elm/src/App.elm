module App exposing (..)

import Navigation
import UrlParser
import Forms exposing (Form)
import RemoteData exposing (RemoteData(NotAsked))
import Routing
import Types
import Graphql.Requests as Graphql
import Authentication.Form exposing (loginFormFields, registerFormFields)


initialState : Maybe Routing.Route -> Types.State
initialState route =
    { login = Forms.initForm loginFormFields
    , members = NotAsked
    , session = NotAsked
    , register = Forms.initForm registerFormFields
    , route = route
    , hasClass = True
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
