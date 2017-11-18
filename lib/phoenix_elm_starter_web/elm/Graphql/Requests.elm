module Graphql.Requests exposing (..)

import Graphql.Schema exposing (query)
import Types exposing (Msg)
import Routing exposing (Route(..))
import Graphql.Decoders exposing (..)
import Graphql.Queries exposing (..)
import Types exposing (GraphqlResult(UserResult))


routeRequest route =
    case route of
        Just Home ->
            query userQuery userDecoder UserResult

        _ ->
            Cmd.none
