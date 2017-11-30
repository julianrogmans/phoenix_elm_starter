module Authentication.Update exposing (..)

import RemoteData exposing (RemoteData(..))
import Graphql.Schema as Schema
import Graphql.Queries exposing (sessionQuery, registerMutation)
import Types exposing (Actions(Authenticate))
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
                ( { model
                    | session = { session | data = Loading }
                  }
                , Schema.query Authenticate session (sessionQuery login)
                )

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
                ( { model | session = { session | data = Loading } }
                , Schema.mutate Authenticate session (registerMutation register)
                )
