module Main exposing (..)

import Html exposing (Html, program, text)


-- model


type alias Model =
    String



-- message


type Msg
    = NoOp



-- view


view : Model -> Html Msg
view model =
    text model



-- update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        _ ->
            model ! []



-- main


main : Program Never Model Msg
main =
    program
        { init = "hoge" ! []
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }
