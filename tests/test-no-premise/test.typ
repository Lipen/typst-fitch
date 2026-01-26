#import "/src/lib.typ": *

#set page(width: auto, height: auto, margin: .5cm)

// Test: Proof without premises (Subproof from start)

#proof(
  subproof(
    assume(1, $P$),
    step(2, $P or Q$, rule: "Add 1"),
  ),
  step(3, $P -> (P or Q)$, rule: "Cond Proof 1-2"),
)
