module Graphql.Schema exposing (query)

import Http
import RemoteData exposing (WebData, fromResult)
import RemoteData.Http as R
import Json.Decode
import Json.Encode exposing (string)
import Graphql.Utils exposing (createDecoder, createQuery, requestConfig)
import Graphql.Queries exposing (..)
import Graphql.Decoders exposing (..)


type alias Query =
    String


query response query_ decoder_ =
    let
        decoder =
            createDecoder decoder_ query_

        query =
            createQuery query_
    in
        R.postWithConfig requestConfig "/graphql" response decoder query
