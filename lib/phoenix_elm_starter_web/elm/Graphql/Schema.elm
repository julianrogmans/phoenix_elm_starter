module Graphql.Schema exposing (query)

import RemoteData exposing (WebData, fromResult)
import RemoteData.Http exposing (postWithConfig)
import GraphQElm exposing (Query)
import Graphql.Utils exposing (createDecoder, createQuery, requestConfig)
import Types exposing (GraphqlData)


query : (WebData model -> msg) -> GraphqlData model -> Query -> Cmd msg
query response model query_ =
    let
        decoder =
            model.decoder query_

        query =
            createQuery query_
    in
        postWithConfig
            requestConfig
            "/graphql"
            response
            decoder
            query
