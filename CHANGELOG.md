# Changelog

All notable changes to this project are documented here. The format is based on
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres
to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.3.0] - 2026-07-17

Modernization of the actively-maintained fork now referenced by Expo's official
push-notification documentation.

### Security

- Clear four hackney security advisories (one HIGH) by moving the HTTP stack to
  httpoison 3.0 / hackney 4.x. hackney's 1.x line is unpatched; 4.0.1 is the first
  release carrying the fixes.

### Changed

- **Breaking:** require `httpoison ~> 3.0`, which in turn requires `hackney ~> 4.0`.
- Require Elixir `~> 1.14`.
- Replace Poison with Jason for JSON encoding and decoding.
- Adopt the modern `extra_applications` pattern for OTP applications.
- Remove obsolete dependencies (dialyze, inch_ex).

### Fixed

- Name HTTPoison correctly in the module documentation (previously HTTPotion).

### Development

- Run CI on GitHub Actions, replacing the retired Travis configuration.
- Update credo to 1.7.19 and jason to 1.4.5.

## [0.2.0] - 2018-08-20

Baseline inherited from the original project by
[rdrop](https://github.com/rdrop/exponent-server-sdk-elixir).
