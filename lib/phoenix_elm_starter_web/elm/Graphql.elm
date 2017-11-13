module Graphql exposing (query)

import Http exposing (request, stringBody, expectJson)
import GraphQElm exposing (Query, gql)
import Json.Decode as Decode
import Msg exposing (Msg(TestApiRequest))


query query_ decoder =
    let
        requestQuery =
            baseQuery query_

        requestDecoder =
            baseDecoder decoder
    in
        baseRequest requestQuery requestDecoder
            |> Http.send TestApiRequest


baseRequest body decoder =
    request
        { method = "POST"
        , headers = []
        , url = "/graphql"
        , body = stringBody "application/graphql" body
        , expect = expectJson decoder
        , timeout = Nothing
        , withCredentials = False
        }


baseQuery query =
    "query{" ++ query ++ "}"


baseDecoder decoder =
    Decode.field "data" decoder