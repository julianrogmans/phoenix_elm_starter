module Decoders exposing (..)

import Json.Decode exposing (string, int)
import Json.Decode.Pipeline exposing (requiredAt, decode)
import Models exposing (TestApi, User)


decodeTestApi =
    decode TestApi
        |> requiredAt [ "test", "hello" ] string


decodeCurrentUser =
    decode User
        |> requiredAt [ "current_user", "id" ] int
        |> requiredAt [ "current_user", "name" ] string
        |> requiredAt [ "current_user", "email" ] string
