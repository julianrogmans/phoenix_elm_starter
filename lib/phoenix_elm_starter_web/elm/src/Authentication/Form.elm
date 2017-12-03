module Authentication.Form exposing (renderInput, submitButton)

import Element as Page
import Html.Attributes as Attribute exposing (style)
import Element.Attributes as Add exposing (fill, fillPortion)
import Element.Events as Event
import Form exposing (Msg(Submit))
import Form.Input exposing (Input)
import Form.Input.Extra exposing (stringField)
import Styles as S
import Utils exposing (labelize)


submitButton : String -> Page.Element S.Style variation Msg
submitButton value =
    Page.button S.Submit
        [ Add.width fill
        , Add.padding 10
        , Event.onClick Submit
        ]
        (Page.el S.None
            [ Add.padding 5
            , Add.center
            , Add.verticalCenter
            ]
            (Page.text value)
        )


renderInput :
    Form.Form e o
    -> ( String, Input e String )
    -> Page.Element S.Style variation Msg
renderInput state ( name, formType ) =
    let
        field =
            stringField state
    in
        Page.row S.None
            [ Add.padding 15, Add.spacing 15 ]
            [ Page.el S.Label
                [ Add.width (fillPortion 1)
                , Add.verticalCenter
                ]
                (Page.el S.None [ Add.alignRight ] <| Page.text <| labelize name)
            , Page.el S.None [ Add.width (fillPortion 3) ] <|
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
