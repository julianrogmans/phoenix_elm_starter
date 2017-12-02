module Graphql.Types exposing (..)

import RemoteData exposing (RemoteData(..))
import GraphQL.Client.Http exposing (Error(..))


type GraphqlType
    = Session
    | Members


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
