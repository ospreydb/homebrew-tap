# OspreyDB Homebrew Tap

Official Homebrew tap for **OspreyDB** ([`ospreydb/ospreydb`](https://github.com/ospreydb/ospreydb)), an Apache-2.0 1-bit RaBitQ vector search engine and server for S3 and object storage.

## Formula

- [`osprey`](Formula/osprey.rb) — Unified **OspreyDB** server and CLI (`Apache-2.0`) from [`ospreydb/ospreydb`](https://github.com/ospreydb/ospreydb). Prebuilt binaries for macOS (`arm64` / `x86_64`) and Linux (`arm64` / `x86_64`), plus `--HEAD` source builds via Cargo.

## Install

```bash
brew install ospreydb/tap/osprey
```

Or build from `main` HEAD:

```bash
brew install --HEAD ospreydb/tap/osprey
```

## Quickstart

Start the local OspreyDB server:

```bash
osprey serve --data-dir ./data --s3-uri file://$(pwd)/s3
```

Run diagnostics, benchmarks, imports, and searches from the unified CLI:

```bash
osprey doctor
osprey bench --help
osprey import --help
osprey search --help
```

## Verify

```bash
osprey --version
osprey --help
```

## Upgrade

```bash
brew update && brew upgrade osprey
```

## Documentation & Support

- Repository: https://github.com/ospreydb/ospreydb
- Getting Started: https://ospreydb.ramoslucas-lr.workers.dev/getting-started
- Issues & Releases: https://github.com/ospreydb/ospreydb/issues

Versions and SHA-256 checksums in `Formula/osprey.rb` are maintained automatically by the `release.yml` workflow in [`ospreydb/ospreydb`](https://github.com/ospreydb/ospreydb) whenever tagged releases are published.
