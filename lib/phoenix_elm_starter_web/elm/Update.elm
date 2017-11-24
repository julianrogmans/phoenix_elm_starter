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
                ( loginModel, loginCmd ) =
                    LoginView.update message model.login
            in
                ( { model | login = loginModel }, loginCmd )

        _ ->
            ( model, Cmd.none )
