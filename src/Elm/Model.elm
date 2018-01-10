module Model exposing (..)

import Window exposing (Size, width, height)
import Task


-- model


type alias Model =
    { plane : String
    , windowSize : Size
    , title : String
    , downloadUrl : String
    }


init : ( Model, Cmd Msg )
init =
    ( { plane = ""
      , windowSize = Size 0 0
      , title = ""
      , downloadUrl = ""
      }
    , Task.perform GetWindowSize <| Task.map2 Size width height
    )



-- message


type Msg
    = NoOp
    | TextInput String
    | GetWindowSize Size
    | TitleInput String
    | Output
    | GetUrl String
