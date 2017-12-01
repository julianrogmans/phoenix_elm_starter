module Types exposing (..)

import Json.Decode as Decode
import Navigation
import GraphQL.Client.Http exposing (Error)
import RemoteData exposing (RemoteData(Failure))
import Graphql.Types exposing (GraphqlType)
import Authentication.Types exposing (LoginState, RegisterState)
import Routing exposing (Route)


type alias State =
    { login : LoginState
    , members : GraphqlData (List Member)
    , session : GraphqlData Session
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


type alias GraphqlData success =
    RemoteData Error success


type Actions message success
    = NoOp
    | NavigateTo String
    | UrlChange Navigation.Location
    | Authentication message
    | Graphql GraphqlType (Result Error success)
    | Logout
