# CSS: Modern Features

## CSS custom properties (aka- CSS Variables)

Scope of variable follows CSS scope rules (e.g. - HTML DOM structure).

```css
/* declaration */
--VAR_NAME: <declaration-value>;
/* usage */
var(--VAR_NAME)
```

Example Usage:

```css
/* global vars */
:root {
  --main-color: #ff00ff;
  --main-bg: rgb(200, 255, 255);
}

body {
  color: var(--main-color);
}
```

Variable Examples:

```css
:root {
  --main-color: #ff00ff;
  --main-bg: rgb(200, 255, 255);
  --logo-border-color: rebeccapurple;

  --header-height: 68px;
  --content-padding: 10px 20px;
  --base-line-height: 1.4286;
  --transition-duration: .35s;
  --external-link: "external link";
  --margin-top: calc(2vh + 20px);
}
```

## Calculations

```css
:root {
  --block-font-size: 1rem;
}

.block__highlight {
  font-size: calc(var(--block-font-size) * 1.5);
}
```

## Mixins via `@apply`

```css
:root {
  /* define some reusable style */
  --pink-schema: {
    color: #6a8759;
    background-color: #f64778;
  }
}

/* apply the reusable style to a DOM element */
body {
  @apply --pink-schema;
}
```

## Vendor Prefixes

CSS vendor prefixes (or browser prefixes), allow us to add support for new and
unsupported CSS features to old browsers.

## CSS File Imports

```css
@import [ <string> | <url> | [<media-query-list>]?;

@import url("print.css") print; /* only loaded when the 'print' media query is true */
@import "mobile.css" (max-width: 728px);
```
