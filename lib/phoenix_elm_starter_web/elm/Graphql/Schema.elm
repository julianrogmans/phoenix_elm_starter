module Graphql.Schema exposing (query)

import Http
import Json.Decode
import Types exposing (Msg(GraphqlResponse))
import Graphql.Utils exposing (createRequest, createQuery, createDecoder)
import Graphql.Queries exposing (..)
import Graphql.Decoders exposing (..)


type alias Query =
    String


query : Query -> Json.Decode.Decoder model -> Cmd (Msg model)
query query decoder =
    createRequest (createQuery query) (createDecoder decoder)
        |> Http.send GraphqlResponse
