module Update exposing (update)

import Navigation
import UrlParser
import RemoteData exposing (RemoteData(..))
import Types exposing (Message(..), Model)
import Routing exposing (routes)
import Login.View as LoginView
import Graphql.Requests exposing (routeRequest)
import Graphql.Schema as Schema


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

        LoginMsg message ->
            let
                ( newModel, loginCmd ) =
                    LoginView.update message model
            in
                ( newModel, loginCmd )

        SignInMember data ->
            let
                session =
                    model.session
            in
                ( { model | session = { session | data = data } }, Cmd.none )

        _ ->
            ( model, Cmd.none )
