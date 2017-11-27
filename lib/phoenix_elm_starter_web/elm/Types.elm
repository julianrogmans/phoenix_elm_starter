module Types exposing (..)

import Http exposing (Error)
import Json.Decode as Decode
import Navigation
import RemoteData exposing (WebData)
import GraphQElm exposing (Query)
import Login.Types as Login
import Routing exposing (Route)


type alias Model =
    { route : Maybe Route
    , session : GraphqlData Session
    , authenticated : Bool
    , error : Maybe String
    , login : Login.Model
    }


type alias GraphqlData model =
    { data : WebData model
    , decoder : Query -> Decode.Decoder model
    }


type alias Member =
    { id : Int
    , firstName : String
    , lastName : String
    , email : String
    , lastSignIn : Maybe String
    }


type alias Session =
    { currentResource : Member
    , token : String
    }


type Message subMsg
    = NoOp
    | NavigateTo String
    | UrlChange Navigation.Location
    | LoginMsg subMsg
    | SignInMember (WebData Session)
