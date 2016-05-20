module View exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Json.Decode as Json
import Model exposing (..)
import Routes exposing (..)


view : Model -> Html Msg
view model =
  div
    [ ]
    [ h1 [] [ text "DJ Funtime" ]
    , div [ class "menu" ]
        [ a (clickTo <| Routes.encode Home) [ text "Home" ]
        , a (clickTo <| Routes.encode (Room "1")) [ text "Room 1" ]
        , a (clickTo <| Routes.encode (Room "2")) [ text "Room 2" ]
        ]
    , div
        [ class "content"
        ]
        [ text <| case model.route of
            Home ->
              "This is home"
            Room _ ->
              "This is room " ++ model.room
            EmptyRoute ->
              ""
        ]
    ]


-- inner click helper

clickTo : String -> List (Attribute Msg)
clickTo path =
  [ href path
  , onWithOptions
      "click"
      { stopPropagation = True, preventDefault = True }
      (Json.map (\_ -> SetPath path) Json.value)
  ]
