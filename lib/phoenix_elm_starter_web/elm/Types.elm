module Types exposing (..)

import Json.Decode as Decode
import Navigation
import RemoteData exposing (WebData, RemoteData(Failure))
import GraphQElm exposing (Query)
import Graphql.Types exposing (GraphqlType)
import Authentication.Types exposing (LoginState, RegisterState)
import Routing exposing (Route)


type alias State =
    { login : LoginState
    , members : WebData (List Member)
    , session : WebData Session
    , register : RegisterState
    , route : Maybe Route
    }


type alias Member =
    { id : String
    , firstName : String
    , lastName : String
    , email : String
    , lastSignIn : Maybe String
    }


type alias Session =
    { member : Member
    , token : String
    }


type Actions message error success
    = NoOp
    | NavigateTo String
    | UrlChange Navigation.Location
    | Authentication message
    | Graphql GraphqlType (Result error success)
    | Logout
