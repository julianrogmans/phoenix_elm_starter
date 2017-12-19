module Update exposing (update)

import Dict
import Task
import Navigation
import UrlParser
import RemoteData exposing (RemoteData(..), fromResult)
import Forms
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

        UpdateLoginForm fieldName formVal ->
            let
                newModel =
                    { model
                        | login =
                            { login
                                | form = Forms.updateFormInput login.form fieldName formVal
                            }
                    }
            in
                update (UpdateLoginErrors fieldName) newModel

        SubmitLoginForm data ->
            ( { model | session = Loading }
            , Cmd.map Graphql <|
                Task.attempt AuthMutation <|
                    Mutation.login data
            )

        UpdateRegisterForm fieldName formVal ->
            let
                newModel =
                    { model
                        | register =
                            { register
                                | form = Forms.updateFormInput register.form fieldName formVal
                            }
                    }
            in
                update (UpdateRegisterErrors fieldName) newModel

        SubmitRegisterForm data ->
            ( { model | session = Loading }
            , Cmd.map Graphql <|
                Task.attempt AuthMutation <|
                    Mutation.register data
            )

        UpdateLoginErrors fieldName ->
            let
                errorList =
                    Forms.errorList login.form fieldName

                error =
                    case (errorList) of
                        [] ->
                            Nothing

                        _ ->
                            Just errorList
            in
                ( { model
                    | login =
                        { login | errors = Dict.insert fieldName error login.errors }
                  }
                , Cmd.none
                )

        UpdateRegisterErrors fieldName ->
            let
                errorList =
                    Forms.errorList register.form fieldName

                error =
                    case (errorList) of
                        [] ->
                            Nothing

                        _ ->
                            Just errorList
            in
                ( { model
                    | register =
                        { register | errors = Dict.insert fieldName error register.errors }
                  }
                , Cmd.none
                )

        Graphql message ->
            resolve model message

        Logout ->
            ( App.initialState Nothing, Cmd.none )

        _ ->
            ( model, Cmd.none )
