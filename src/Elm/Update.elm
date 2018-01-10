module Update exposing (..)

import Model exposing (Model, Msg(..))
import Blob exposing (createDownloadUrl)
import Json.Encode as JE


-- update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TextInput str ->
            { model | plane = str } ! [ createDownloadUrl <| encodeModel model ]

        GetWindowSize s ->
            { model | windowSize = s } ! []

        TitleInput str ->
            { model | title = str } ! [ createDownloadUrl <| encodeModel model ]

        Output ->
            model ! []

        GetUrl url ->
            { model | downloadUrl = url } ! []

        _ ->
            model ! []


encodeModel : Model -> String
encodeModel model =
    let
        value =
            JE.object
                [ ( "title", JE.string model.title )
                , ( "content", JE.string model.plane )
                ]
    in
        JE.encode 4 value
