module Authentication.Form exposing (..)

import List exposing (map)
import Tuple exposing (first)
import Element as Page exposing (Element)
import Element.Input as Input
import Element.Events as Event
import Element.Attributes as Add exposing (fill, px)
import Forms exposing (Form, initForm)
import Types exposing (Action)
import View.Style as Style exposing (Class)


loginFormFields =
    [ ( "email", [ Forms.validateExistence ] )
    , ( "password", [ Forms.validateExistence ] )
    ]


registerFormFields =
    [ ( "firstName", [ Forms.validateExistence ] )
    , ( "lastName", [ Forms.validateExistence ] )
    , ( "email", [ Forms.validateExistence ] )
    , ( "password", [ Forms.validateExistence ] )
    , ( "passwordConfirmation", [ Forms.validateExistence ] )
    ]


submitButton : String -> Action -> Bool -> Element Class variation Action
submitButton name message disabled =
    Page.button (Style.Submit { disabled = disabled })
        [ Add.width fill
        , Add.padding 10
        , Event.onClick message
        ]
    <|
        Page.el Style.None [ Add.padding 5, Add.center, Add.verticalCenter ] <|
            Page.text name


errorFor : Form -> String -> List (Input.Option Class variation msg)
errorFor form_ field =
    let
        errorString =
            Forms.errorString form_ field
    in
        case errorString of
            "no errors" ->
                []

            error ->
                [ Input.errorBelow <| Page.el Style.Error [] <| Page.text error ]


hasError errors =
    case errors of
        [] ->
            False

        _ ->
            True
