module Graphql.Requests exposing (..)

import Graphql.Schema exposing (query)
import Types exposing (Message)
import Routing exposing (Route(..))
import Graphql.Decoders exposing (..)
import Graphql.Queries exposing (..)


routeRequest route =
    case route of
        Just Home ->
            Cmd.none

        _ ->
            Cmd.none
