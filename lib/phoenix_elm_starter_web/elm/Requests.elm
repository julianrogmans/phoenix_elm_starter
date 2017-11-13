module Requests exposing (..)

import Graphql exposing (..)
import Queries exposing (..)
import Decoders exposing (..)
import Msg exposing (Msg(TestApiRequest))


testApiRequest =
    Graphql.query testApiQuery decodeTestApi
