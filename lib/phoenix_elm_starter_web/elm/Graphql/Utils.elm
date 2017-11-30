module Graphql.Utils exposing (..)

import Http exposing (stringBody, expectJson)
import RemoteData.Http exposing (Config)
import GraphQElm exposing (gql, Query)
import Json.Encode as Encode
import Json.Decode as Decode exposing (Decoder)


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


createQuery : Query -> String
createQuery query =
    "query { " ++ gql query ++ " }"


createMutation : Query -> String
createMutation mutate =
    "mutation { " ++ gql mutate ++ " }"


createDecoder : Decoder model -> Query -> Decoder model
createDecoder decoder { resource } =
    Decode.at [ "data", resource ] decoder
