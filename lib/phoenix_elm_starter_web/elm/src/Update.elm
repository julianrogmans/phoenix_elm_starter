module Update exposing (update)

import Dict
import Task
import Navigation
import UrlParser
import RemoteData exposing (RemoteData(..), fromResult)
import Forms
import Form
import Types exposing (Action(..), State, GraphqlAction(..))
import Routing exposing (routes)
import App
import Graphql.Requests exposing (routeRequest)
import Graphql.Schema exposing (resolve)
import Graphql.Mutations as Mutation


update : Action -> State -> ( State, Cmd Action )
update msg ({ login, register } as model) =
    case msg of
        NavigateTo url ->
            ( model, Navigation.newUrl url )

        UrlChange location ->
            let
                newRoute =
                    UrlParser.parseLocation routes location
            in
                ( { model | route = newRoute }, routeRequest newRoute )

        UpdateLoginForm field value ->
            { model
                | login =
                    { login
                        | form = Forms.updateFormInput login.form field value
                    }
            }
                |> update (UpdateLoginErrors field)

        SubmitLoginForm data ->
            ( { model | session = Loading }
            , Cmd.map Graphql <|
                Task.attempt AuthMutation <|
                    Mutation.login data
            )

        UpdateRegisterForm field value ->
            { model
                | register =
                    { register
                        | form = Forms.updateFormInput register.form field value
                    }
            }
                |> update (UpdateRegisterErrors field)

        SubmitRegisterForm data ->
            ( { model | session = Loading }
            , Cmd.map Graphql <|
                Task.attempt AuthMutation <|
                    Mutation.register data
            )

        UpdateLoginErrors field ->
            ( { model
                | login =
                    { login
                        | errors =
                            Form.updateFormError login.errors field <|
                                Forms.errorList login.form field
                    }
              }
            , Cmd.none
            )

        UpdateRegisterErrors field ->
            let
                ( password, confirmation ) =
                    ( Forms.formValue register.form "password"
                    , Forms.formValue register.form "passwordConfirmation"
                    )

                errors =
                    Forms.errorList register.form field
                        |> Form.updateFormError register.errors field
                        |> Dict.insert
                            "passwordConfirmation"
                            [ Form.validateEqual password confirmation ]
            in
                ( { model | register = { register | errors = errors } }
                , Cmd.none
                )

        Graphql message ->
            resolve model message

        Logout ->
            ( App.initialState Nothing, Cmd.none )

        _ ->
            ( model, Cmd.none )
