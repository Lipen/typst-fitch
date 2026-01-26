# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

...

## [0.2.0]

### Changed

- Refactor internals: split into modules (ast, builder, render), add builder API, extract rendering of structured proofs.
- Replace `style` parameter with optional named parameters in `proof(..args)`.
- Improve README: build/render proof descriptions, style customization, single-sentence lines.

## [0.1.0]

### Added

- Add Fitch package, docs, examples, and tests.
- Add CI and release workflows.

[unreleased]: https://github.com/Lipen/typst-fitch/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/Lipen/typst-fitch/releases/tag/v0.2.0
[0.1.0]: https://github.com/Lipen/typst-fitch/releases/tag/v0.1.0
