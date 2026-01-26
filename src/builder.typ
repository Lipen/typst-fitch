#let _process-subproof(items) = {
  let assumptions = ()
  let steps = ()
  for item in items {
    if item.kind == "assume" {
      assumptions.push(item)
    } else if item.kind == "premise" {
      panic("Premises can only appear at the top level of a proof.")
    } else if item.kind == "subproof" {
      let s = _process-subproof(item.lines)
      steps.push(s)
    } else {
      steps.push(item)
    }
  }
  (
    kind: "subproof",
    assumptions: assumptions,
    steps: steps,
  )
}

#let _process-proof(items) = {
  let premises = ()
  let steps = ()
  for item in items {
    if item.kind == "premise" {
      assert(steps.len() == 0, message: "Premises must come before any proof steps.")
      premises.push(item)
    } else if item.kind == "assume" {
      panic("Assumptions can only appear inside subproofs.")
    } else if item.kind == "subproof" {
      let s = _process-subproof(item.lines)
      steps.push(s)
    } else {
      steps.push(item)
    }
  }
  (
    kind: "proof",
    premises: premises,
    steps: steps,
  )
}

/// Builds the structured representation of a Fitch proof.
///
/// == Arguments:
/// - `..items`: Proof lines (premises, assumptions, steps, subproofs).
#let build-proof(..items) = {
  _process-proof(items.pos())
}
