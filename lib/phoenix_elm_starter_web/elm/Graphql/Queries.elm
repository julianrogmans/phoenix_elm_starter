module Graphql.Queries exposing (..)

import GraphQElm exposing (gql, Query)
import Authentication.Types exposing (LoginState, RegisterState)


sessionQuery : LoginState -> Query
sessionQuery data =
    { resource = "signin"
    , fields = [ gql memberQuery, "token" ]
    , args = [ ( "email", data.email ), ( "password", data.password ) ]
    , alias = ""
    }


memberQuery : Query
memberQuery =
    { resource = "member"
    , fields = [ "id", "first_name", "last_name", "email" ]
    , args = []
    , alias = ""
    }


registerMutation : RegisterState -> Query
registerMutation data =
    { resource = "register"
    , fields = [ gql memberQuery, "token" ]
    , args =
        [ ( "first_name", data.firstName )
        , ( "last_name", data.lastName )
        , ( "email", data.email )
        , ( "password", data.password )
        , ( "password_confirmation", data.passwordConfirmation )
        ]
    , alias = ""
    }
