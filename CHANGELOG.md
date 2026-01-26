# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Refactor internals: split into modules (ast, builder, render), add builder API, extract rendering of structured proofs.
- Replace `style` parameter with optional named parameters in `proof(..args)`.
- Improve README: build/render proof descriptions, style customization, single-sentence lines.

## [v0.1.0] - 2026-01-20

### Added

- Add Fitch package, docs, examples, and tests.
- Add CI and release workflows.

[unreleased]: https://github.com/Lipen/typst-fitch/compare/v0.1.0...HEAD
[v0.1.0]: https://github.com/Lipen/typst-fitch/tree/v0.1.0
