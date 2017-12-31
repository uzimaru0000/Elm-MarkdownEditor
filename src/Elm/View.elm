module View exposing (..)

import Html exposing (Html, program, textarea, div, text, input, header, h1)
import Html.Attributes exposing (type_, id, class, style)
import Html.Events exposing (onInput)
import Markdown exposing (toHtml)
import Model exposing (Model, Msg(..))

-- view


view : Model -> Html Msg
view model =
    div []
        [ headerView
        , contentView model
        ]


headerView : Html Msg
headerView =
    header []
        [ h1 [] [ text "MarkDown Editer" ]
        ]


contentView : Model -> Html Msg
contentView model =
    div [ id "content", style [ ( "height", toString model.windowSize.height ++ "px" ) ] ]
        [ div [] [ textarea [ onInput TextInput, id "planeText" ] [] ]
        , toHtml [ id "mdArea" ] model.plane
        ]
