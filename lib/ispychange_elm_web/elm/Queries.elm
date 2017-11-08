module Queries exposing (..)

import GraphQL.Request.Builder exposing (..)
import GraphQL.Request.Builder.Arg as Arg
import GraphQL.Request.Builder.Variable as Var
import Schema exposing (..)
import Models exposing (..)


userQuery : Document Query User { vars | userID : String }
userQuery =
    let
        userIDVar =
            Var.required "userID" .userID Var.id

        queryRoot =
            extract
                (field "user"
                    [ ( "id", Arg.variable userIDVar ) ]
                    user
                )
    in
        queryDocument queryRoot
