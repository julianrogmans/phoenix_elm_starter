module Graphql.Decoders exposing (..)

import Json.Decode exposing (string, int, nullable)
import Json.Decode.Pipeline exposing (required, optional, decode)
import Types exposing (Member, Session)


memberDecoder =
    decode Member
        |> required "id" int
        |> required "first_name" string
        |> required "last_name" string
        |> required "email" string
        |> optional "last_sign_in" (nullable string) Nothing


sessionDecoder =
    decode Session
        |> required "member" memberDecoder
        |> required "token" string
