module Models exposing (..)

import RemoteData exposing (WebData)


type alias AppState =
    { testApi : WebData TestApi
    , currentUser : WebData User
    }


type alias TestApi =
    { hello : String }


type alias User =
    { id : Int
    , name : String
    , email : String
    }
