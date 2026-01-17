#import "../../lib.typ": *

#set page(width: auto, height: auto, margin: .5cm)

// Test: Proof by Contradiction (Negation Introduction)

#proof(
  premise(1, $P -> Q$),
  premise(2, $P -> not Q$),
  subproof(
    assume(3, $P$),
    step(4, $Q$, rule: "MP 1, 3"),
    step(5, $not Q$, rule: "MP 2, 3"),
    step(6, $Q and not Q$, rule: "Conj 4, 5"),
  ),
  step(7, $not P$, rule: "RAA 3-6"),
)
