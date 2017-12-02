module Graphql.Queries exposing (..)

import GraphQL.Request.Builder as Build exposing (extract, field, list)
import Graphql.Schema exposing (member)


allMembers =
    Build.queryDocument <|
        extract <|
            field "members" [] (list member)
