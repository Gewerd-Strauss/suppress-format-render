# suppress-format-render Extension For Quarto

This extension is designed to reduce rendering time in a project.
To achieve this, the extension checks the frontmatter for suppressed formats.
For these formats, the body of the file will be removed, keeping only the frontmatter to be rendered.

## Installing

```bash
quarto install extension Gewerd-Strauss/suppress-format-render
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Using

1. Add the filter to a file, or a general yaml-configuration-file (project or subdirectory).
2. For a file which should not be rendered to a specific set of formats, populate the YAML-key `suppress-formats: []` with the respective format.

## Example

TODO: write example Here is the source code for a minimal example: [example.qmd](example.qmd).

## ROADMAP

TODO: If a format is suppressed, its link must be stripped from the `format-links`-element of the html-page (if that element is present.)
