module Update exposing (update)

import Navigation
import UrlParser
import RemoteData exposing (RemoteData(..), fromResult)
import Types exposing (Action(..), State)
import Routing exposing (routes)
import App
import Authentication.Types as Auth
import Authentication.Update as Authentication
import Graphql.Requests exposing (routeRequest)
import Graphql.Schema exposing (resolve)


update : Action Auth.Action Types.Session -> State -> ( State, Cmd (Action Auth.Action Types.Session) )
update msg model =
    case msg of
        NavigateTo url ->
            ( model, Navigation.newUrl url )

        UrlChange location ->
            let
                newRoute =
                    UrlParser.parseLocation routes location
            in
                ( { model | route = newRoute }, routeRequest newRoute )

        AuthAction message ->
            let
                ( newState, authenticationCmd ) =
                    Authentication.update message model
            in
                ( newState, authenticationCmd )

        Graphql message result ->
            resolve model message <|
                fromResult result

        Logout ->
            ( App.initialState Nothing, Cmd.none )

        _ ->
            ( model, Cmd.none )
