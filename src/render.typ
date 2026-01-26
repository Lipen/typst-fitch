
/// Internal: Render a line number cell.
///
/// == Arguments:
/// - `num`: The line number to display.
/// - `_style`: Styling configuration.
#let _fitch-num-cell(num, _style) = {
  align(right)[#num]
}

/// Internal: Render a proof line cell with scope bars.
///
/// == Arguments:
/// - `item`: The proof line item (premise/assumption or step).
/// - `depth`: The current nesting depth (number of scope bars).
/// - `is-first`: Whether this is the first premise/assumption.
/// - `is-last`: Whether this is the last premise/assumption.
/// - `style`: Styling configuration.
#let _fitch-line-cell(item, depth, is-first, is-last, style) = {
  let out = item.formula

  if is-last {
    out = box(
      out,
      stroke: (bottom: style.stroke),
      outset: style.pad,
    )
  }

  for level in range(0, depth) {
    let top-out = if level == 0 and is-first {
      style.pad
    } else {
      style.pad + style.row-gutter
    }
    out = box(
      inset: (left: style.indent, rest: 0pt),
      box(
        out,
        stroke: (left: style.stroke),
        outset: (top: top-out, rest: style.pad),
      ),
    )
  }

  out
}

/// Internal: Render the rule/justification cell.
///
/// == Arguments:
/// - `item`: The proof line item.
/// - `style`: Styling configuration.
#let _fitch-rule-cell(item, style) = {
  let rule = if item.rule != none {
    item.rule
  }
  if rule != none { text(..style.rule-style)[#rule] }
}

/// Default styling configuration for Fitch proofs.
#let fitch-style-default = (
  /// Horizontal spacing between columns.
  col-gutter: 0.8em,
  /// Vertical spacing between rows.
  row-gutter: 0.3em,
  /// Scope bars and underlines.
  stroke: 1pt + blue,
  /// Horizontal spacing between nested bars.
  indent: 1em,
  /// Padding inside the cell.
  pad: 0.5em,
  /// Style for the rule cell.
  rule-style: (style: "italic"),
)

/// Renders a Fitch-style proof.
///
/// == Arguments:
/// - `p`: The processed proof structure (from `build-proof`).
/// - `style`: Style overrides.
///
/// == Example:
/// ```typst
/// #let p = build-proof(
///   premise(0, "A"),
///   step(1, "A", rule: "Reiteration"),
/// )
/// #render-proof(p)
/// ```
#let render-proof(p, style: (:)) = {
  assert(
    p.kind == "proof",
    message: "Expected a proof node.",
  )

  let style = fitch-style-default + style

  let handle-premises(items, depth) = {
    let out = ()
    for (idx, item) in items.enumerate() {
      let is-first = idx == 0
      let is-last = idx == items.len() - 1
      out.push(_fitch-num-cell(item.id, style))
      out.push(_fitch-line-cell(item, depth, is-first, is-last, style))
      out.push(_fitch-rule-cell(item, style))
    }
    out
  }

  let process(items, depth) = {
    let out = ()
    for item in items {
      assert(
        item.kind != "premise",
        message: "Premises should not appear here.",
      )
      assert(
        item.kind != "assume",
        message: "Assumptions should not appear here.",
      )

      if item.kind == "subproof" {
        out += handle-premises(item.assumptions, depth + 1)
        out += process(item.steps, depth + 1)
      } else {
        out.push(_fitch-num-cell(item.id, style))
        out.push(_fitch-line-cell(item, depth, false, false, style))
        out.push(_fitch-rule-cell(item, style))
      }
    }
    out
  }

  let cells = ()
  cells += handle-premises(p.premises, 0)
  cells += process(p.steps, 0)

  grid(
    columns: 3,
    column-gutter: style.col-gutter,
    row-gutter: style.row-gutter,
    inset: style.pad,
    if p.premises.len() == 0 {
      // Add top line if there are no premises
      grid.hline(start: 1, end: 2, stroke: style.stroke)
    } else {
      // Otherwise, add "empty" line instead of "none" (!)
      // Note: Typst interprets "none" as an empty cell,
      //       but we *do not* want *any* cell at all here.
      grid.hline(start: 1, end: 1)
    },
    grid.vline(x: 1, stroke: style.stroke),
    ..cells,
  )
}
