module Graphql.Requests exposing (..)

import Task
import Routing exposing (Route(..))
import Types exposing (Action(Graphql), GraphqlAction(AllMembersQuery))
import Graphql.Queries as Query


baseUrl : String
baseUrl =
    "/graphql"


routeRequest : Maybe Route -> Cmd Action
routeRequest route =
    case route of
        Just Home ->
            Cmd.map Graphql <|
                Task.attempt AllMembersQuery <|
                    Query.allMembers

        _ ->
            Cmd.none
