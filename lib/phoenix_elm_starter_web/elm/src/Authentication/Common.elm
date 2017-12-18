module Authentication.Common exposing (input, submitButton)

import Element as Page
import Element.Extra as Page
import Element.Attributes as Add exposing (fill, fillPortion)
import Element.Events as Event
import RemoteData exposing (RemoteData(..))
import Form exposing (Form, Msg(Submit))
import Form.Input exposing (Input)
import View.Style as Style exposing (Class)
import Types exposing (GraphqlData, Session)
import Authentication.Style as Auth
import Utils exposing (labelize)


submitButton : String -> GraphqlData Session -> Page.Element Class variation Msg
submitButton value state =
    let
        isDisabled =
            case state of
                Loading ->
                    True

                _ ->
                    False
    in
        Page.button (Style.Submit { disabled = isDisabled })
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


input : Form e o -> ( String, Input e String ) -> Page.Element Class variation Msg
input form_ ( name, input_ ) =
    Page.row Style.None
        [ Add.padding 15, Add.spacing 15 ]
        [ Page.el Style.Label [ Add.width (fillPortion 1), Add.verticalCenter ] <|
            Page.el Style.None [ Add.alignRight ] <|
                Page.text <|
                    labelize name
        , Page.el Style.None [ Add.width (fillPortion 3) ] <|
            Page.stringField input_ name [] form_
        ]
