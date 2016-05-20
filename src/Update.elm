module Update exposing (..)

import Location
import Model exposing (..)
import Routes exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch
    [ Location.pathUpdates PathUpdated ]


init : String -> (Model, Cmd Msg)
init path =
  mountRoute (Routes.decode path) initialModel


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    PathUpdated path ->
      mountRoute (Routes.decode path) model
    SetPath path ->
      ( model, Location.setPath path )


mountRoute : Route -> Model -> (Model, Cmd Msg)
mountRoute route oldModel =
  let
    model = { oldModel | route = route }
  in
    case route of
      Home ->
        (model, Cmd.none)

      Room r ->
        ({ model | room = r }, Cmd.none)

      EmptyRoute ->
        (model, Cmd.none)
