module Main exposing (..)

import Html exposing (program)
import Window exposing (Size, resizes)
import Model exposing (Model, Msg(..), init)
import Update exposing (update)
import View exposing (view)
import Blob exposing (getDownloadUrl)


-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ resizes GetWindowSize
        , getDownloadUrl GetUrl
        ]



-- main


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
