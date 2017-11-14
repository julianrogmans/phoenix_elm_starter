module Models exposing (..)

import RemoteData exposing (WebData)


type alias AppState =
    { testApi : WebData TestApiModel
    , currentUser : WebData UserModel
    }


type alias TestApiModel =
    { hello : String }


type alias UserModel =
    { id : Int
    , name : String
    , email : String
    }
