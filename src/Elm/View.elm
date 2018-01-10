module View exposing (..)

import Html exposing (Html, program, textarea, div, text, input, header, h1, button, a)
import Html.Attributes exposing (type_, id, class, style, href, target, downloadAs)
import Html.Events exposing (onInput, onClick)
import Markdown exposing (toHtml)
import Model exposing (Model, Msg(..))


-- view


view : Model -> Html Msg
view model =
    div []
        [ headerView model
        , contentView model
        ]


headerView : Model -> Html Msg
headerView model =
    header []
        [ h1 [] [ text "MarkDown Editer" ]
        , input [ onInput TitleInput ] []
        , a [ href model.downloadUrl, target "_blank", downloadAs (model.title ++ ".json") ] [ text "Output" ]
        ]


contentView : Model -> Html Msg
contentView model =
    div [ id "content", style [ ( "height", toString model.windowSize.height ++ "px" ) ] ]
        [ div [] [ textarea [ onInput TextInput, id "planeText" ] [] ]
        , toHtml [ id "mdArea" ] model.plane
        ]
