module Graphql.Queries exposing (..)

import Task exposing (Task)
import GraphQL.Client.Http exposing (Error, sendQuery)
import GraphQL.Request.Builder as Build
    exposing
        ( ValueSpec
        , ObjectType
        , NonNull
        , extract
        , request
        , field
        , list
        )
import Graphql.Schema exposing (member)


send : vars -> ValueSpec NonNull ObjectType result vars -> Task Error result
send data query =
    sendQuery "/graphql" <|
        request data <|
            Build.queryDocument query


allMembers =
    send {} <|
        extract <|
            field "members" [] (list member)
