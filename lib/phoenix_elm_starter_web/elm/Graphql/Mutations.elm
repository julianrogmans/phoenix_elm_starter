module Graphql.Mutations exposing (..)

import GraphQL.Request.Builder as Build exposing (extract, field)
import GraphQL.Request.Builder.Arg as Arg
import GraphQL.Request.Builder.Variable as Var
import Graphql.Schema exposing (session)


-- register  Types.RegisterState -> Task


register formData =
    let
        firstName =
            Var.required "firstName" .firstName Var.string

        lastName =
            Var.required "lastName" .lastName Var.string

        email =
            Var.required "email" .email Var.string

        password =
            Var.required "password" .password Var.string

        passwordConfirmation =
            Var.required "passwordConfirmation" .passwordConfirmation Var.string

        arguments =
            [ ( "firstName", firstName )
            , ( "lastName", lastName )
            , ( "email", email )
            , ( "password", password )
            , ( "passwordConfirmation", passwordConfirmation )
            ]
    in
        Build.mutationDocument <|
            extract <|
                field "register" arguments session
