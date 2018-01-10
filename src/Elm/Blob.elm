port module Blob exposing (..)

-- JsonデータをJS側に送ってダウンロードURLを作る


port createDownloadUrl : String -> Cmd msg



-- JS側からダウンロードURLを送る


port getDownloadUrl : (String -> msg) -> Sub msg
