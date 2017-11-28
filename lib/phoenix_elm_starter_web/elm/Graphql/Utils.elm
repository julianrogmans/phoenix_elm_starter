module Graphql.Utils exposing (..)

import Http
import RemoteData.Http exposing (Config)
import GraphQElm exposing (gql, Query)
import Json.Encode as Encode
import Json.Decode as Decode exposing (Decoder)


requestConfig : Config
requestConfig =
    { headers = [ Http.header "Content-Type" "application/graphql" ]
    , withCredentials = True
    , timeout = Nothing
    }


createQuery : Query -> Encode.Value
createQuery query =
    Encode.string ("query { " ++ gql query ++ " }")


createDecoder : Decoder model -> Query -> Decoder model
createDecoder decoder { resource } =
    Decode.at [ "data", resource ] decoder
