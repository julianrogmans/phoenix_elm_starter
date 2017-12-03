module Graphql.Queries exposing (..)

import GraphQL.Request.Builder as Build
    exposing
        ( ValueSpec
        , ObjectType
        , NonNull
        , extract
        , field
        , list
        )
import Graphql.Schema exposing (member)


-- allMembers : ValueSpec NonNull ObjectType result


allMembers =
    Build.queryDocument <|
        extract <|
            field "members" [] (list member)
