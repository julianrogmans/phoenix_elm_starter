module Authentication.Form exposing (..)

import List exposing (map)
import Element as Page exposing (Element)
import Element.Input as Input
import Element.Events as Event
import Element.Attributes as Add exposing (fill, px)
import Forms exposing (Form, ValidationError, initForm)
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
    , ( "passwordConfirmation", [] )
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


renderErrors : Maybe (List ValidationError) -> List (Input.Option Class variation Action)
renderErrors errors =
    case errors of
        Nothing ->
            []

        Just errorList ->
            let
                messages =
                    List.filterMap identity errorList
            in
                if (List.isEmpty messages) then
                    []
                else
                    let
                        errorString =
                            String.join ", " messages
                    in
                        [ Input.errorBelow <|
                            Page.el Style.Error [ Add.width fill, Add.padding 5 ] <|
                                Page.text errorString
                        ]
