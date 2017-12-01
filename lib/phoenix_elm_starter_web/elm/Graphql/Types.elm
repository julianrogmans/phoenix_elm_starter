module Graphql.Types exposing (..)

import RemoteData exposing (RemoteData(..), fromResult)
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
                        GraphQLError _ ->
                            ( model, Cmd.none )

                        HttpError httpError ->
                            -- promote401 from Jwt
                            ( model, Cmd.none )

                Success _ ->
                    ( { model | session = result }, Cmd.none )

        Members ->
            ( model, Cmd.none )
