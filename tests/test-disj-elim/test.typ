#import "/src/lib.typ": *

#set page(width: auto, height: auto, margin: .5cm)

// Test: Disjunction Elimination (Multiple subproofs)

#proof(
  premise(1, $P or Q$),
  premise(2, $P -> R$),
  premise(3, $Q -> R$),
  subproof(
    assume(4, $P$),
    step(5, $R$, rule: "MP 2, 4"),
  ),
  subproof(
    assume(6, $Q$),
    step(7, $R$, rule: "MP 3, 6"),
  ),
  step(8, $R$, rule: "Disj Elim 1, 4-5, 6-7"),
)
