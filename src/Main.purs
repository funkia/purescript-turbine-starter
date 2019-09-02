module Main where

import Prelude

import Effect (Effect)
import Hareactive.Types (Behavior)
import Hareactive.Combinators (accum)
import Turbine (Component, use, component, output, (</>), runComponent)
import Turbine.HTML as E

counter :: Component { count :: Behavior Int } {}
counter = component \on -> do
  count <- accum (+) 0 (on.increment <> on.decrement)
  ( E.div { class: pure "wrapper" } (
      E.text "Counter " </>
      E.span {} (E.textB $ map show count) </>
      E.button {} (E.text "+" ) `use` (\o -> { increment: o.click $> 1 }) </>
      E.button {} (E.text "-" ) `use` (\o -> { decrement: o.click $> -1 })
    )
  ) `output` { count }

main :: Effect Unit
main = runComponent "#mount" counter
