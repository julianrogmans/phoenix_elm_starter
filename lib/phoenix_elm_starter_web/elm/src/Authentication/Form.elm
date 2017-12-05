module Authentication.Form exposing (renderInput, submitButton)

import Element as Page
import Html.Attributes as Attribute exposing (style)
import Element.Attributes as Add exposing (fill, fillPortion)
import Element.Events as Event
import Form exposing (Msg(Submit))
import Form.Input exposing (Input)
import Form.Input.Extra exposing (stringField)
import View.Style as Style exposing (Class)
import Authentication.Styles as Auth
import Utils exposing (labelize)


submitButton : String -> Page.Element Class variation Msg
submitButton value =
    Page.button Style.Submit
        [ Add.width fill
        , Add.padding 10
        , Event.onClick Submit
        ]
        (Page.el Style.None
            [ Add.padding 5
            , Add.center
            , Add.verticalCenter
            ]
            (Page.text value)
        )


renderInput :
    Form.Form e o
    -> ( String, Input e String )
    -> Page.Element Class variation Msg
renderInput state ( name, formType ) =
    let
        field =
            stringField state
    in
        Page.row Style.None
            [ Add.padding 15, Add.spacing 15 ]
            [ Page.el Style.Label
                [ Add.width (fillPortion 1)
                , Add.verticalCenter
                ]
                (Page.el Style.None [ Add.alignRight ] <| Page.text <| labelize name)
            , Page.el Style.None [ Add.width (fillPortion 3) ] <|
                field name <|
                    flip formType
                        [ style
                            [ ( "width", "100%" )
                            , ( "height", "auto" )
                            , ( "font-size", "18px" )
                            , ( "padding", "5px" )
                            ]
                        ]
            ]
