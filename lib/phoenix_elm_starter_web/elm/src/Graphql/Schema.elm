module Graphql.Schema exposing (..)

import List
import Dict
import RemoteData exposing (RemoteData(..), fromResult)
import GraphQL.Client.Http exposing (Error(..))
import GraphQL.Request.Builder exposing (..)
import Types exposing (State, Action, GraphqlAction(..), Session, Member)


resolve : State -> GraphqlAction -> ( State, Cmd Action )
resolve model message =
    case message of
        AllMembersQuery result ->
            let
                members =
                    case result of
                        Ok data ->
                            data
                                |> List.map (\item -> ( item.id, item ))
                                |> Dict.fromList
                                |> Success

                        Err errors ->
                            Failure errors
            in
                ( { model | members = members }, Cmd.none )

        AuthMutation result ->
            ( { model | session = fromResult result }, Cmd.none )


member : ValueSpec NonNull ObjectType Member vars
member =
    object Member
        |> with (field "id" [] id)
        |> with (field "firstName" [] string)
        |> with (field "lastName" [] string)
        |> with (field "email" [] string)
        |> with (field "lastSignIn" [] (nullable string))


session : ValueSpec NonNull ObjectType Session vars
session =
    object Session
        |> with (field "member" [] member)
        |> with (field "token" [] string)
