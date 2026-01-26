/// Premise line in a Fitch proof.
///
/// == Arguments:
/// - id: Line number.
/// - formula: The logical formula or statement.
/// - rule: (optional) Justification for the premise.
///
/// == Example:
/// ```typst
/// premise(1, $A$)
/// premise(2, $A -> B$, rule: "Hypothesis")
/// ```
#let premise(id, formula, rule: "Premise") = {
  (
    kind: "premise",
    id: id,
    formula: formula,
    rule: rule,
  )
}

/// Assumption line in a Fitch proof.
///
/// == Arguments:
/// - `id`: Line number.
/// - `formula`: The assumed formula or statement.
/// - `rule`: (optional) Justification for the assumption.
///
/// == Example:
/// ```typst
/// subproof(
///   assume(2, $A$),
///   step(3, $B$, rule: "from 1"),
/// )
/// ```
#let assume(id, formula, rule: "Assumption") = {
  (
    kind: "assume",
    id: id,
    formula: formula,
    rule: rule,
  )
}

/// Derivation step in a Fitch proof.
///
/// == Arguments:
/// - `id`: Line number.
/// - `formula`: The derived logical formula or statement.
/// - `rule`: (optional) Justification for the step (e.g. "Modus Ponens 1, 2").
///
/// == Example:
/// ```typst
/// step(3, $B$, rule: "MP 1, 2")
/// step(5, $not A$, rule: [DNE 4])
/// ```
#let step(id, formula, rule: none) = {
  (
    kind: "step",
    id: id,
    formula: formula,
    rule: rule,
  )
}

/// Subproof in a Fitch proof.
///
/// == Arguments:
/// - `..lines`: The lines (assumptions, sub-steps, or sub-proofs) within the subproof.
///
/// == Example:
/// ```typst
/// subproof(
///   assume(2, $A$),
///   step(3, $B$, rule: "from 1"),
/// )
/// ```
#let subproof(..lines) = {
  (
    kind: "subproof",
    lines: lines.pos(),
  )
}
