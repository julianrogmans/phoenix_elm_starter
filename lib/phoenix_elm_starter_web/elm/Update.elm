module Update exposing (update)

import RemoteData exposing (fromResult)
import Navigation
import UrlParser exposing (parseLocation)
import Types exposing (Msg(..), Model)
import Routing exposing (routes)
import Login.View as LoginView
import Graphql.Requests exposing (routeRequest)


update msg model =
    case msg of
        NavigateTo url ->
            ( model, Navigation.newUrl url )

        UrlChange location ->
            let
                newRoute =
                    parseLocation routes location
            in
                ( { model | route = newRoute }, routeRequest newRoute )

        GraphqlResponse result ->
            case fromResult result of
                RemoteData.NotAsked ->
                    ( model, Cmd.none )

                RemoteData.Loading ->
                    ( { model | loading = True }, Cmd.none )

                RemoteData.Failure err ->
                    ( { model | error = Just (toString err) }, Cmd.none )

                RemoteData.Success data ->
                    let
                        log =
                            Debug.log "Data: " data
                    in
                        -- This is where I want to pattern match against what
                        -- type of record/decoder/data was returned so I know where
                        -- to put it in the model
                        ( model, Cmd.none )

        Login message ->
            let
                ( loginModel, loginCmd ) =
                    LoginView.update message model.login
            in
                ( { model | login = loginModel }, loginCmd )

        _ ->
            ( model, Cmd.none )
