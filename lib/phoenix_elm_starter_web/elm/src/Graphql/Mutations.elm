module Graphql.Mutations exposing (..)

import Task exposing (Task)
import GraphQL.Client.Http exposing (Error, sendMutation)
import GraphQL.Request.Builder as Build
    exposing
        ( ObjectType
        , ValueSpec
        , NonNull
        , request
        , extract
        , field
        )
import GraphQL.Request.Builder.Arg as Arg
import GraphQL.Request.Builder.Variable as Var
import Graphql.Schema exposing (session)
import Graphql.Requests exposing (baseUrl)
import Types


send : vars -> ValueSpec NonNull ObjectType result vars -> Task Error result
send data mutation =
    sendMutation baseUrl <|
        request data <|
            Build.mutationDocument mutation


login : Types.LoginForm -> Task Error Types.Session
login data =
    let
        email =
            Var.required "email" .email Var.string

        password =
            Var.required "password" .password Var.string

        arguments =
            [ ( "email", Arg.variable email )
            , ( "password", Arg.variable password )
            ]
    in
        send data <|
            extract <|
                field "login" arguments session


register : Types.RegisterForm -> Task Error Types.Session
register data =
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
            [ ( "firstName", Arg.variable firstName )
            , ( "lastName", Arg.variable lastName )
            , ( "email", Arg.variable email )
            , ( "password", Arg.variable password )
            , ( "passwordConfirmation", Arg.variable passwordConfirmation )
            ]
    in
        send data <|
            extract <|
                field "register" arguments session
