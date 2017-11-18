module Graphql.Utils exposing (..)

import Http exposing (stringBody, expectJson)
import Json.Decode as Decode


createRequest body decoder =
    Http.request
        { method = "POST"
        , headers = []
        , url = "/graphql"
        , body = stringBody "application/graphql" body
        , expect = expectJson decoder
        , timeout = Nothing
        , withCredentials = False
        }


createQuery query =
    "query{" ++ query ++ "}"


createDecoder decoder =
    Decode.field "data" decoder
