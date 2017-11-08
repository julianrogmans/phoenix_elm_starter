module Schema exposing (..)

import GraphQL.Request.Builder exposing (..)


user =
    object User
        |> with (field "name" [] string)
        |> with (field "email" [] string)
        |> with (field "password" [] string)
