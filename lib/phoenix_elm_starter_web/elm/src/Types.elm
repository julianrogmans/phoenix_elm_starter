module Types exposing (..)

import Dict exposing (Dict)
import Navigation
import Forms exposing (ValidationError)
import GraphQL.Client.Http exposing (Error)
import RemoteData exposing (RemoteData(Failure))
import Routing exposing (Route)


type alias State =
    { login : FormState
    , members : GraphqlData (Dict String Member)
    , session : GraphqlData Session
    , register : FormState
    , route : Maybe Route
    , hasClass : Bool
    }


type alias FormState =
    { form : Forms.Form
    , errors : FormErrors
    }


type alias FormErrors =
    Dict String (List ValidationError)


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
    | UpdateLoginErrors String
    | UpdateRegisterErrors String
    | Graphql GraphqlAction
    | Logout
