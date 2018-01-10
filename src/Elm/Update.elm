module Update exposing (..)

import Model exposing (Model, Msg(..))
import Blob exposing (createDownloadUrl)
import Json.Encode as JE
import Task
import Date


-- update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TextInput str ->
            let
                newModel =
                    { model | plane = str }
            in
                ( newModel, Task.perform GetDate Date.now )

        GetWindowSize s ->
            ( { model | windowSize = s }, Cmd.none )

        TitleInput str ->
            let
                newModel =
                    { model | title = str }
            in
                ( newModel, Task.perform GetDate Date.now )

        GetUrl url ->
            ( { model | downloadUrl = url }, Cmd.none )

        GetDate date ->
            ( model, createDownloadUrl <| encodeModel model date )

        _ ->
            model ! []


encodeModel : Model -> Date.Date -> String
encodeModel model date =
    let
        value =
            JE.object
                [ ( "title", JE.string model.title )
                , ( "content", JE.string model.plane )
                , ( "time", JE.string <| toString date )
                ]
    in
        JE.encode 4 value
