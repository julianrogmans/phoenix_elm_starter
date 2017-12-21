module App exposing (..)

import Dict
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
    { login =
        { form = Forms.initForm loginFormFields
        , errors = Dict.empty
        }
    , members = NotAsked
    , session = NotAsked
    , register =
        { form = Forms.initForm registerFormFields
        , errors = Dict.empty
        }
    , route = route
    , hasClass = True
    }


init : Navigation.Location -> ( Types.State, Cmd Types.Action )
init location =
    let
        currentRoute =
            UrlParser.parseLocation Routing.routes location
    in
        ( initialState currentRoute, Graphql.routeRequest currentRoute )


subscriptions : a -> Sub msg
subscriptions state =
    Sub.none
