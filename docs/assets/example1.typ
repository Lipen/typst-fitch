#import "@preview/fitch:0.1.0": *

#set page(width: auto, height: auto, margin: .5cm)

// 1 | A -> not A  Premise
//   +------------
// 2 |  | A        Assumption
//   |  +-------
// 3 |  | not A    MP 1,2
//   |
// 4 |  | not A    Assumption
//   |  +-------
// 5 |  | not A    R 4
//   |
// 6 | not A       LEM 2-3, 4-5

$A -> not A quad tack.r quad not A$

#proof(
  premise(1, $A -> not A$),
  subproof(
    assume(2, $A$),
    step(3, $not A$, rule: "MP 1, 2"),
  ),
  subproof(
    assume(4, $not A$),
    step(5, $not A$, rule: "R 4"),
  ),
  step(6, $not A$, rule: "LEM 2-3, 4-5"),
)
