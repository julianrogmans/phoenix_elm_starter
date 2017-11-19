module Graphql.Utils exposing (..)

import Http exposing (stringBody, expectJson)
import RemoteData.Http as RH
import Json.Decode as Decode
import Json.Encode exposing (string)


-- Http.request
--     { method = "POST"
--     , headers = []
--     , url = "/graphql"
--     , body = stringBody "application/graphql" (createQuery body)
--     , expect = expectJson (createDecoder decoder)
--     , timeout = Nothing
--     , withCredentials = False
--     }


createQuery query =
    string ("query{" ++ query ++ "}")


createDecoder decoder =
    Decode.field "data" decoder
