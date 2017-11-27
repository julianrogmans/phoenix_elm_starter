module Graphql.Utils exposing (..)

import Http exposing (stringBody, expectJson)
import GraphQElm exposing (gql)
import Json.Decode as Decode
import Json.Encode as Encode


requestConfig =
    { headers = [ Http.header "Content-Type" "application/graphql" ]
    , withCredentials = True
    , timeout = Nothing
    }


createQuery query =
    Encode.string ("query { " ++ gql query ++ " }")


createDecoder decoder { resource } =
    Decode.at [ "data", resource ] decoder
