#import "../../lib.typ": *

#set page(width: auto, height: auto, margin: .5cm)

// Test: Nested subproofs (Conditional Proof)

#proof(
  premise(1, $P -> (Q -> R)$),
  subproof(
    assume(2, $P and Q$),
    step(3, $P$, rule: "Simp 2"),
    step(4, $Q$, rule: "Simp 2"),
    step(5, $Q -> R$, rule: "MP 1, 3"),
    step(6, $R$, rule: "MP 5, 4"),
  ),
  step(7, $(P and Q) -> R$, rule: "Cond Proof 2-6"),
)
