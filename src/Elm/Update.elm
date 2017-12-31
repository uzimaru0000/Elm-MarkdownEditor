module Update exposing (..)

import Model exposing (Model, Msg(..))

-- update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TextInput str ->
            { model | plane = str } ! []

        GetWindowSize s ->
            { model | windowSize = s } ! []

        _ ->
            model ! []