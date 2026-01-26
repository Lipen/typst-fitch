#import "/src/lib.typ": *

#set page(width: auto, height: auto, margin: .5cm)

// Test: Deeply Nested Conditional Proofs

#proof(
  premise(1, $A -> (B -> (C -> D))$),
  subproof(
    assume(2, $A$),
    step(3, $B -> (C -> D)$, rule: "MP 1, 2"),
    subproof(
      assume(4, $B$),
      step(5, $C -> D$, rule: "MP 3, 4"),
      subproof(
        assume(6, $C$),
        step(7, $D$, rule: "MP 5, 6"),
      ),
      step(8, $C -> D$, rule: "R 5"),
    ),
    step(9, $B -> (C -> D)$, rule: "R 3"),
  ),
  step(10, $A -> (B -> (C -> D))$, rule: "R 1"),
)
