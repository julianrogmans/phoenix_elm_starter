module Authentication.Form exposing (..)

import Dict
import List exposing (map)
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


errorFor : String -> Types.FormErrors -> List (Input.Option Class variation msg)
errorFor fieldName errorDict =
    let
        fieldErrors =
            Dict.get fieldName errorDict
    in
        case fieldErrors of
            Nothing ->
                []

            Just errors ->
                case errors of
                    Nothing ->
                        []

                    Just errorMessages ->
                        let
                            errorList =
                                List.filterMap identity errorMessages
                        in
                            renderErrors errorList


renderErrors errors =
    let
        errorString =
            String.join ", " errors
    in
        if (List.isEmpty errors) then
            []
        else
            [ Input.errorBelow <|
                Page.el Style.Error [] <|
                    Page.text errorString
            ]


hasError errors =
    case errors of
        [] ->
            False

        _ ->
            True
