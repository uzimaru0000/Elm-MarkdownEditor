module Main exposing (..)

import Html exposing (program)
import Window exposing (Size, resizes)
import Model exposing (Model, Msg(..), init)
import Update exposing (update)
import View exposing (view)


-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    resizes GetWindowSize



-- main


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
