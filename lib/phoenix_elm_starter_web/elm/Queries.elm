module Queries exposing (..)

import GraphQElm exposing (Query, gql)


testApiQuery : String
testApiQuery =
    gql
        { resource = "test"
        , fields = [ "hello" ]
        , args = []
        , alias = ""
        }
