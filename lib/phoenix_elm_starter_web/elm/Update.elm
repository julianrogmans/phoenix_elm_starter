module Update exposing (update)

import Navigation
import UrlParser
import RemoteData exposing (RemoteData(..), fromResult)
import Types exposing (Actions(..), State)
import Routing exposing (routes)
import Config
import Authentication.Update as Authentication
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

        Authentication message ->
            let
                ( newState, authenticationCmd ) =
                    Authentication.update message model
            in
                ( newState, authenticationCmd )

        Logout ->
            ( Config.initialState Nothing, Cmd.none )

        _ ->
            ( model, Cmd.none )
