#import "../../lib.typ": *

#set page(width: auto, height: auto, margin: .5cm)

// Test: Simple Modus Ponens

#proof(
  premise(1, $P -> Q$),
  premise(2, $P$),
  step(3, $Q$, rule: "MP 1, 2"),
)
