module Update exposing (update)

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
            ( { model | login = Forms.updateFormInput model.login fieldName formVal }, Cmd.none )

        SubmitLoginForm data ->
            ( { model | session = Loading }
            , Cmd.map Graphql <|
                Task.attempt AuthMutation <|
                    Mutation.login data
            )

        UpdateRegisterForm fieldName formVal ->
            ( { model | register = Forms.updateFormInput model.register fieldName formVal }, Cmd.none )

        SubmitRegisterForm data ->
            ( { model | session = Loading }
            , Cmd.map Graphql <|
                Task.attempt AuthMutation <|
                    Mutation.register data
            )

        Graphql message ->
            resolve model message

        Logout ->
            ( App.initialState Nothing, Cmd.none )

        _ ->
            ( model, Cmd.none )
