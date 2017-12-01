module Authentication.Update exposing (..)

import Task
import GraphQL.Request.Builder exposing (request)
import GraphQL.Client.Http exposing (sendQuery, sendMutation)
import RemoteData exposing (RemoteData(..))
import Types exposing (Actions(Graphql))
import Graphql.Types exposing (GraphqlType(Session))
import Graphql.Mutations as Mutation
import Authentication.Types exposing (Actions(..))


update msg model =
    let
        login =
            model.login

        register =
            model.register

        session =
            model.session
    in
        case msg of
            LoginEmail value ->
                ( { model | login = { login | email = value } }, Cmd.none )

            LoginPassword value ->
                ( { model | login = { login | password = value } }, Cmd.none )

            SignIn ->
                ( model, Cmd.none )

            RegisterFirstName value ->
                ( { model | register = { register | firstName = value } }
                , Cmd.none
                )

            RegisterLastName value ->
                ( { model | register = { register | lastName = value } }
                , Cmd.none
                )

            RegisterEmail value ->
                ( { model | register = { register | email = value } }
                , Cmd.none
                )

            RegisterPassword value ->
                ( { model | register = { register | password = value } }
                , Cmd.none
                )

            RegisterPasswordConfirmation value ->
                ( { model | register = { register | passwordConfirmation = value } }
                , Cmd.none
                )

            Register ->
                ( { model | session = Loading }
                , Task.attempt (Graphql Session) <|
                    sendMutation "/graphql" <|
                        request register <|
                            Mutation.register
                )
