module Model exposing (..)

import Window exposing (Size, width, height)
import Task


-- model


type alias Model =
    { plane : String
    , windowSize : Size
    }


init : ( Model, Cmd Msg )
init =
    ({ plane = ""
    , windowSize = Size 0 0
    }
    , Task.perform GetWindowSize <| Task.map2 Size width height
    )



-- message


type Msg
    = NoOp
    | TextInput String
    | GetWindowSize Size