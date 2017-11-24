module Graphql.Queries exposing (..)

import GraphQElm exposing (Query, gql)


-- userQuery : String
-- userQuery =
--     gql
--         { resource = "users"
--         , fields = [ "id", "name", "email" ]
--         , args = []
--         , alias = ""
--         }


sessionQuery data =
    { resource = "member_signin"
    , fields = [ "member", "jwt" ]
    , args = [ ( "email", data.email ), ( "password", data.password ) ]
    , alias = "MemberSignin"
    }
