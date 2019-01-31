module Main where

import Prelude

import Effect (Effect)
import Hareactive.Types (Behavior, Stream, Now)
import Turbine (Component, runComponent, output, modelView, (</>))
import Turbine.HTML.Elements as E

app :: Component {} Unit
app = E.text "Hello, world!"

main :: Effect Unit
main = runComponent "#mount" app
