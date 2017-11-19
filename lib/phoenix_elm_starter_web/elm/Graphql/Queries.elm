module Graphql.Queries exposing (..)

import GraphQElm exposing (Query, gql)


userQuery : String
userQuery =
    gql
        { resource = "users"
        , fields = [ "id", "name", "email" ]
        , args = []
        , alias = ""
        }
