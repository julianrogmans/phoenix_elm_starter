module Graphql.Schema exposing (..)

import GraphQL.Request.Builder exposing (..)
import Types exposing (Session, Member)


member =
    object Member
        |> with (field "id" [] id)
        |> with (field "firstName" [] string)
        |> with (field "lastName" [] string)
        |> with (field "email" [] string)
        |> with (field "lastSignIn" [] (nullable string))


session =
    object Session
        |> with (field "member" [] member)
        |> with (field "token" [] string)