module Graphql.Requests exposing (..)

import Graphql.Schema exposing (query)
import Types exposing (Message)
import Routing exposing (Route(..))
import Graphql.Decoders exposing (..)
import Graphql.Queries exposing (..)
import Types exposing (Message(UserResponse))


routeRequest route =
    case route of
        Just Home ->
            query UserResponse userQuery userDecoder

        _ ->
            Cmd.none
