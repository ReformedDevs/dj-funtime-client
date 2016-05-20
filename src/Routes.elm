module Routes exposing (..)

import RouteParser exposing (..)


type Route
  = Home
  | Room String
  | EmptyRoute


routeParsers : List (Matcher Route)
routeParsers =
  [ static Home "/"
  , dyn1 Room "/room/" string ""
  ]


decode : String -> Route
decode path =
  RouteParser.match routeParsers path
    |> Maybe.withDefault EmptyRoute


encode : Route -> String
encode route =
  case route of
    Home ->
      "/"

    Room name ->
      "/room/" ++ name

    EmptyRoute ->
      ""
