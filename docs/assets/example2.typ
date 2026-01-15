#import "@preview/fitch:0.1.0": *

#set page(width: auto, height: auto, margin: .5cm)

// (A -> (B -> C))  |-  ((A -> B) -> (A -> C))
//
// 1. | (A -> (B -> C))   Premise
//    +-----------------
// 2. |  | A -> B         Assumption
//    |  +--------
// 3. |  |  | A           Assumption
//    |  |  +---
// 4. |  |  | B -> C      MP 1, 3
// 5. |  |  | B           MP 2, 3
// 6. |  |  | C           MP 4, 5
//    |  |
// 7. |  | A -> C         ->I 3-6
//    |
// 8. | ((A -> B) -> (A -> C))   ->I 2-7

$A -> (B -> C) quad tack.r quad (A -> B) -> (A -> C)$

#proof(
  premise(1, $A -> (B -> C)$),
  subproof(
    assume(2, $A -> B$),
    subproof(
      assume(3, $A$),
      step(4, $B -> C$, rule: "MP 1, 3"),
      step(5, $B$, rule: "MP 2, 3"),
      step(6, $C$, rule: "MP 4, 5"),
    ),
    step(7, $A -> C$, rule: [$->$I 3-6]),
  ),
  step(8, $(A -> B) -> (A -> C)$, rule: [$->$I 2-7]),
)
