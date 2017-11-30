module Graphql.Schema exposing (query, mutate)

import Http
import RemoteData exposing (WebData)
import RemoteData.Http exposing (postWithConfig)
import GraphQElm exposing (Query)
import Graphql.Utils exposing (createDecoder, createQuery, createMutation, createRequest)
import Types exposing (GraphqlData)


query : (Result Http.Error model -> msg) -> GraphqlData model -> Query -> Cmd msg
query response model query_ =
    let
        decoder =
            model.decoder query_

        query =
            createQuery query_
    in
        Http.send response <|
            createRequest query decoder


mutate : (Result Http.Error model -> msg) -> GraphqlData model -> Query -> Cmd msg
mutate response model mutation_ =
    let
        decoder =
            model.decoder mutation_

        mutation =
            createMutation mutation_
    in
        Http.send response <|
            createRequest mutation decoder
