# Contributor Guidelines

See [AIMarkdown/README.md](AIMarkdown/README.md) for this fork's purpose, custom parser capabilities, and integration boundaries.

## Repository constraints

- Preserve upstream licenses, copyright notices, and meaningful source data.
- Maintain the custom Swift AST, C parser bridge, and CAtomic support code on the `ai-markdown` branch.
- Preserve opt-in parser behavior, source ranges, metadata ownership, and existing default behavior. Do not combine maintenance changes with an upstream upgrade.
- Maintain semantic changes in this fork. The `ai-markdown-parser-swift` integration repository owns module and symbol isolation, generated snapshots, and Swift Package distribution; do not duplicate those transformations here.
- Record third-party provenance in `AIMarkdown/provenance.json` and retain the bundled licenses in `AIMarkdown/ThirdPartyLicenses`.
- Run checks appropriate to each change. For history or comment-only rewrites, verify every rewritten commit preserves executable code; do not present historical test logs as new test results.

## Commit messages

- Follow [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/) using `<type>[optional scope][!]: <description>`.
- Use `feat` for new functionality, `fix` for bug fixes, and other types such as `docs`, `test`, or `refactor` as appropriate.
- Describe what the commit changes. Add a body when needed to explain the behavior or reasoning, separated from the subject by a blank line.
- Mark breaking changes with `!` after the type or scope, or with a `BREAKING CHANGE: <description>` footer.
