module Requests exposing (..)

import Graphql exposing (..)
import Queries exposing (..)
import Decoders exposing (..)


testApiRequest =
    Graphql.query testApiQuery decodeTestApi
