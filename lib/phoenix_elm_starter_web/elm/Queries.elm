module Queries exposing (..)

import GraphQElm exposing (Query)


testApiQuery : Query
testApiQuery =
    { resource = "test"
    , fields = [ "hello" ]
    , args = []
    , alias = ""
    }
