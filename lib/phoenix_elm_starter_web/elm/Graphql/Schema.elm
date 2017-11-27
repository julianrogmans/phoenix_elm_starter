module Graphql.Schema exposing (query)

import Http
import RemoteData exposing (WebData, fromResult)
import RemoteData.Http as R
import Json.Decode
import Json.Encode exposing (string)
import Graphql.Utils exposing (createDecoder, createQuery, requestConfig)
import Graphql.Queries exposing (..)
import Graphql.Decoders exposing (..)


query response model query_ =
    let
        decoder =
            model.decoder query_

        query =
            createQuery query_
    in
        R.postWithConfig
            requestConfig
            "/graphql"
            response
            decoder
            query
