module App exposing (..)

import Element exposing (..)
import Element.Attributes exposing (..)
import RemoteData exposing (WebData)
import Stylesheet exposing (..)
import Html exposing (Html)
import Msg exposing (..)
import Models exposing (User)
import Requests exposing (testApiRequest)
import Models exposing (TestApi)


-- import Queries exposing (userRequestCmd)


type alias Model =
    { testApiResult : WebData TestApi
    }


init : ( Model, Cmd (Msg a) )
init =
    ( (Model RemoteData.Loading), testApiRequest )


update : Msg a -> Model -> ( Model, Cmd (Msg a) )
update msg model =
    case msg of
        GraphqlMsg data ->
            let
                webData =
                    RemoteData.fromResult data

                temp =
                    Debug.log (toString webData)
            in
                ( { model | testApiResult = webData }, Cmd.none )

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
                [ el Banner [] (headerText model.testApiResult) ]
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


main : Program Never Model (Msg a)
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
