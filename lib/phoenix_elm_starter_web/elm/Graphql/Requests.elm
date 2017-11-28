module Graphql.Requests exposing (..)

import Routing exposing (Route(..))


routeRequest : Maybe Route -> Cmd msg
routeRequest route =
    case route of
        Just Home ->
            Cmd.none

        _ ->
            Cmd.none
