module Graphql.Schema exposing (query, mutate)

import GraphQL.Request.Builder exposing (..)
import Types exposing (Session, Member)


member =
    object Member
        |> with (field "id" [] id)
        |> with (field "firstName" [] string)
        |> with (field "lastName" [] string)
        |> with (field "email" [] string)


session =
    object Session
        |> with (field "member" [] member)
        |> with (field "token" [] string)
