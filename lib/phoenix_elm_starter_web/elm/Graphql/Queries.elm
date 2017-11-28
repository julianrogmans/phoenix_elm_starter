module Graphql.Queries exposing (..)

import GraphQElm exposing (Query)
import Login.Types as Login


sessionQuery : Login.State -> Query
sessionQuery data =
    { resource = "signin"
    , fields = [ "id", "token" ]
    , args = [ ( "email", data.email ), ( "password", data.password ) ]
    , alias = ""
    }
