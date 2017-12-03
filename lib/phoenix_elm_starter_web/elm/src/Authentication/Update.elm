module Authentication.Update exposing (..)

import Task
import Form exposing (Form, Msg(Submit))
import RemoteData exposing (RemoteData(..))
import Types exposing (State)
import Graphql.Types exposing (GraphqlType(Session))
import Graphql.Mutations as Mutation
import Authentication.Types exposing (Action(..))
import Authentication.Register as Register
import Authentication.Login as Login


update : Action -> State -> ( State, Cmd (Types.Action Action Types.Session) )
update msg ({ register, login } as model) =
    case msg of
        RegisterForm formMsg ->
            let
                updatedRegister =
                    Form.update Register.validate formMsg register
            in
                case formMsg of
                    Submit ->
                        let
                            maybeSubmit =
                                case Form.getOutput register of
                                    Just data ->
                                        Task.attempt (Types.Graphql Session) <|
                                            Mutation.register data

                                    Nothing ->
                                        Cmd.none
                        in
                            ( { model | session = Loading, register = updatedRegister }, maybeSubmit )

                    _ ->
                        ( { model | register = updatedRegister }, Cmd.none )

        LoginForm formMsg ->
            let
                updatedLogin =
                    Form.update Login.validate formMsg login
            in
                case formMsg of
                    Submit ->
                        let
                            maybeSubmit =
                                case Form.getOutput login of
                                    Just data ->
                                        Task.attempt (Types.Graphql Session) <|
                                            Mutation.login data

                                    Nothing ->
                                        Cmd.none
                        in
                            ( { model | session = Loading, login = updatedLogin }, maybeSubmit )

                    _ ->
                        ( { model | login = updatedLogin }, Cmd.none )
