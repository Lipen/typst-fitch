#import "../../lib.typ": *

#set page(width: auto, height: auto, margin: .5cm)

// Test: Custom Styling (Different colors and spacing)

#proof(
  style: (
    stroke: 1pt + red,
    col-gutter: 1.2em,
    row-gutter: 0.5em,
  ),
  premise(1, $forall x. P(x)$),
  premise(2, $a in D$),
  step(3, $P(a)$, rule: "UI 1"),
  step(4, $P(a)$, rule: [#text(blue)[instance]]),
)
