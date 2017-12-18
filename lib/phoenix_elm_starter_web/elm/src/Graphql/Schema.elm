module Graphql.Schema exposing (..)

import RemoteData exposing (RemoteData(..))
import GraphQL.Client.Http exposing (Error(..))
import GraphQL.Request.Builder exposing (..)
import Types as App
import Graphql.Types exposing (GraphqlType(..))


resolve model message result =
    case message of
        Session ->
            case result of
                NotAsked ->
                    ( model, Cmd.none )

                Loading ->
                    ( { model | session = Loading }, Cmd.none )

                Failure error ->
                    case error of
                        GraphQLError gqlErrors ->
                            ( model, Cmd.none )

                        HttpError httpError ->
                            -- something needs to happen here to promote the http error
                            -- to a JwtError to handle more granular HTTP responses
                            ( model, Cmd.none )

                Success _ ->
                    ( { model | session = result }, Cmd.none )

        Members ->
            ( model, Cmd.none )


member : ValueSpec NonNull ObjectType App.Member vars
member =
    object App.Member
        |> with (field "id" [] id)
        |> with (field "firstName" [] string)
        |> with (field "lastName" [] string)
        |> with (field "email" [] string)
        |> with (field "lastSignIn" [] (nullable string))


session : ValueSpec NonNull ObjectType App.Session vars
session =
    object App.Session
        |> with (field "member" [] member)
        |> with (field "token" [] string)
