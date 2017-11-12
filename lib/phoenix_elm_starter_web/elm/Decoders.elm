module Decoders exposing (..)

import Json.Decode exposing (string)
import Json.Decode.Pipeline exposing (requiredAt, decode)
import Models exposing (TestApi)


decodeTestApi =
    decode TestApi
        |> requiredAt [ "test", "hello" ] string
