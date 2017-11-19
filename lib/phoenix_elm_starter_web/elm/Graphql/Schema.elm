module Graphql.Schema exposing (query)

import Http
import RemoteData exposing (WebData, fromResult)
import RemoteData.Http as R
import Json.Decode
import Json.Encode exposing (string)
import Types exposing (Message(UserResponse))
import Graphql.Utils exposing (createDecoder, createQuery)
import Graphql.Queries exposing (..)
import Graphql.Decoders exposing (..)


type alias Query =
    String


query response query_ decoder_ =
    let
        decoder =
            createDecoder decoder_

        query =
            createQuery query_
    in
        R.post "/graphql" response decoder query
