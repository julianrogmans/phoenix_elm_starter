module Graphql.Utils exposing (..)

import Http exposing (stringBody, expectJson)
import GraphQElm exposing (gql)
import RemoteData.Http as RH
import Json.Decode as Decode
import Json.Encode exposing (string)


requestConfig =
    { headers = [ Http.header "Content-Type" "application/graphql" ]
    , withCredentials = True
    , timeout = Nothing
    }


createQuery query =
    string ("query{" ++ gql query ++ "}")


createDecoder decoder query =
    Decode.at [ "data", query.resource ] decoder
