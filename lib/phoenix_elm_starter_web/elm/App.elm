module App exposing (..)

import Dict exposing (union)
import Element exposing (..)
import Element.Attributes exposing (..)
import RemoteData exposing (WebData, fromResult)
import Navigation
import UrlParser exposing (parseLocation)
import Stylesheet exposing (..)
import Html exposing (Html)
import Msg exposing (Msg(..))
import Models exposing (AppState)
import Requests exposing (testApiRequest)
import Routing exposing (Route, routes)


-- import Queries exposing (userRequestCmd)


type alias Model =
    { route : Maybe Route
    , state : AppState
    }


initialModel : Maybe Route -> Model
initialModel route =
    { state =
        { testApi = RemoteData.Loading
        , currentUser = RemoteData.Loading
        }
    , route = route
    }


init location =
    let
        currentRoute =
            parseLocation routes location
                |> Debug.log "currentRoute-------"
    in
        ( initialModel currentRoute, testApiRequest )


update : Msg a -> Model -> ( Model, Cmd (Msg a) )
update msg model =
    case msg of
        NavigateTo url ->
            ( model, Navigation.newUrl url )

        UrlChange location ->
            let
                newRoute =
                    parseLocation routes location
            in
                ( { model | route = newRoute }, Cmd.none )

        TestApiRequest result ->
            case result of
                Ok requestType ->
                    let
                        temp =
                            Debug.log "test-------" requestType
                    in
                        ( model, Cmd.none )

                Err _ ->
                    ( model, Cmd.none )

        -- UserRequest result ->
        --     let
        --         currentState =
        --             model.state
        --
        --         newState =
        --             { currentState | currentUser = fromResult result }
        --     in
        --         ( { model | state = newState }, Cmd.none )
        NoOp ->
            ( model, Cmd.none )


subscriptions : Model -> Sub (Msg a)
subscriptions model =
    Sub.none


view model =
    viewport Stylesheet.stylesheet <|
        column None
            [ height fill, width fill ]
            [ row None
                [ height fill, width fill, center, verticalCenter ]
                [ el Banner [] (headerText model.state.testApi) ]
            , row Callouts
                [ spacing 10 ]
                [ column Callout
                    [ width fill, height (px 300) ]
                    [ empty ]
                , column Callout
                    [ width fill, height (px 300) ]
                    [ empty ]
                , column Callout
                    [ width fill, height (px 300) ]
                    [ empty ]
                ]
            ]


headerText webData =
    case webData of
        RemoteData.NotAsked ->
            text "Start"

        RemoteData.Loading ->
            text "Phoenix Starter loading..."

        RemoteData.Success data ->
            text data.hello

        RemoteData.Failure err ->
            text ("Error:" ++ toString err)


main =
    Navigation.program UrlChange
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
