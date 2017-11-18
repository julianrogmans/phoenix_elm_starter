module Graphql.Schema exposing (query, resolve)

import Http
import RemoteData exposing (fromResult)
import Json.Decode
import Types exposing (Msg(GraphqlResponse), GraphqlResult(..))
import Graphql.Utils exposing (createRequest, createQuery, createDecoder)
import Graphql.Queries exposing (..)
import Graphql.Decoders exposing (..)


type alias Query =
    String


query query decoder result =
    createRequest (createQuery query) (createDecoder decoder)
        |> Http.send result


resolve model result_ =
    case result_ of
        UserResult result ->
            ( { model | currentUser = fromResult result }, Cmd.none )
