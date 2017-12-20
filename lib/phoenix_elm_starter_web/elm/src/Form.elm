module Form exposing (..)

import Dict exposing (Dict)
import Element.Input exposing (Option)
import Types exposing (State, Action, FormErrors)
import Forms exposing (Form, ValidationError)
import View.Style exposing (Class)


validateEqual : String -> String -> Maybe String
validateEqual one two =
    if (one == two) then
        Nothing
    else
        Just "must match"


updateFormError : FormErrors -> String -> List ValidationError -> FormErrors
updateFormError errors field newErrors =
    Dict.insert field newErrors errors


hasError : Maybe (List ValidationError) -> Bool
hasError errors =
    case errors of
        Nothing ->
            False

        Just errorMessages ->
            errorMessages
                |> List.filterMap identity
                |> List.isEmpty
                |> not
