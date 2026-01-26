#import "ast.typ": assume, premise, step, subproof
#import "builder.typ": build-proof
#import "render.typ": render-proof

// Public API

/// Construct and render a Fitch-style proof.
///
/// == Arguments:
/// - `..args`: Proof lines (_positional_ args) and optional style overrides (_named_ args).
///
/// == Example - Simple Proof:
/// ```typst
/// #fitch-proof(
///   premise(1, $A$),
///   premise(2, $A -> B$),
///   step(3, $B$, rule: "MP 1, 2"),
/// )
/// ```
///
/// == Example - Proof with subproof (conditional proof):
/// ```typst
/// #fitch-proof(
///   premise(1, $A -> B$),
///   subproof(
///     assume(2, $A$),
///     step(3, $B$, rule: "MP 1, 2"),
///   ),
///   step(4, $A -> B$, rule: "Cond Proof 2-3"),
/// )
/// ```
#let fitch-proof(..args) = {
  let p = build-proof(..args.pos())
  render-proof(p, style: args.named())
}

#let fitch = fitch-proof
#let proof = fitch-proof
