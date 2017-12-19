module Types exposing (..)

import Navigation
import Forms
import GraphQL.Client.Http exposing (Error)
import RemoteData exposing (RemoteData(Failure))
import Routing exposing (Route)


type alias State =
    { login : Forms.Form
    , members : GraphqlData (List Member)
    , session : GraphqlData Session
    , register : Forms.Form
    , route : Maybe Route
    , hasClass : Bool
    }


type alias Member =
    { id : String
    , firstName : String
    , lastName : String
    , email : String
    , lastSignIn : Maybe String
    }


type alias LoginForm =
    { email : String
    , password : String
    }


type alias RegisterForm =
    { firstName : String
    , lastName : String
    , email : String
    , password : String
    , passwordConfirmation : String
    }


type alias Session =
    { member : Member
    , token : String
    }


type GraphqlAction
    = AllMembersQuery (Result Error (List Member))
    | AuthMutation (Result Error Session)


type alias GraphqlData success =
    RemoteData Error success


type alias Field =
    ( String, List Forms.FieldValidator )


type Action
    = NoOp
    | NavigateTo String
    | UrlChange Navigation.Location
    | UpdateLoginForm String String
    | SubmitLoginForm LoginForm
    | UpdateRegisterForm String String
    | SubmitRegisterForm RegisterForm
    | Graphql GraphqlAction
    | Logout
