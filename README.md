# DEPRECATED - use the upstream version

Trufflehog now provides their own action. Usage and more information in their [README](https://github.com/trufflesecurity/trufflehog#trufflehog-oss-github-action).

# Secret Scan for GitHub Actions

Scan your repo for secrets. AWS tokens, keys, this has you covered.

This is a fork of [max/secret-scan](https://github.com/max/secret-scan) with an additional option to ignore patterns defined in a JSON file.

## Usage

For more information about path filtering and allowed patterns, please refer to the [truffleHog](https://github.com/trufflesecurity/truffleHog) documentation.

```yaml
on: push
name: Find Secrets
jobs:
  main:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: channelbeta/secret-scan@2.1.6
```

### With path filters

Use path filters to manage the set of objects that will be scanned.

```yaml
on: push
name: Find Secrets
jobs:
  main:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: channelbeta/secret-scan@2.1.6
        with:
          include_path: '<path-to>/include_paths.txt'
          exclude_path: '<path-to>/exclude_paths.txt'
```

Sample path filter file:

```text
^\.github\/
^\.terraform\.lock\.hcl$
.*\.jmx$
```

### With allowed patterns

Use a JSON file to allow patterns (including regex) that shouldn't trigger a warning.

```yaml
on: push
name: Find Secrets
jobs:
  main:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: channelbeta/secret-scan@2.1.6
        with:
          allowed_patterns: '<path-to>/allowed_patterns.json'
```

Sample allowed patterns JSON:

```json
{
    "descriptive name": "-----BEGIN EC PRIVATE KEY-----\nfoobar123\n-----END EC PRIVATE KEY-----",
    "git cherry pick SHAs": "regex:Cherry picked from .*"
}
```
