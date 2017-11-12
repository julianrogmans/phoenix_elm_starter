module Models exposing (..)


type Route
    = HomeRoute
    | NotFoundRoute


type alias TestApi =
    { hello : String }


type alias User =
    { id : Int
    , name : String
    , email : String
    }
