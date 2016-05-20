module Model exposing (..)

import Routes


type alias Model =
  { route : Routes.Route
  , room : String
  }


initialModel : Model
initialModel =
  { route = Routes.Home
  , room = ""
  }


type Msg
  = SetPath String
  | PathUpdated String
