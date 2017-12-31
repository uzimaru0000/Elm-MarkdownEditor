module Main exposing (..)

import Html exposing (Html, program, textarea, div, text, input, header, iframe)
import Html.Attributes exposing (type_, id, class, style)
import Html.Events exposing (onInput)
import Markdown exposing (toHtml)
import Window exposing (Size, resizes)


-- model


type alias Model =
    { plane : String
    , windowSize : Size
    }


init : ( Model, Cmd Msg )
init =
    { plane = "hoge"
    , windowSize = Size 0 0
    }
        ! []



-- message


type Msg
    = NoOp
    | TextInput String
    | ResizeWindow Size



-- view


view : Model -> Html Msg
view model =
    div []
        [ headerView
        , contentView model
        ]


headerView : Html Msg
headerView =
    header [] []


contentView : Model -> Html Msg
contentView model =
    div [ id "content", style [ ( "height", toString model.windowSize.height ++ "px" ) ] ]
        [ div [] [ textarea [ onInput TextInput, id "planeText" ] [] ]
        , toHtml [ id "mdArea" ] model.plane
        ]



-- update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TextInput str ->
            { model | plane = str } ! []

        ResizeWindow s ->
            { model | windowSize = s } ! []

        _ ->
            model ! []



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    resizes ResizeWindow



-- main


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
