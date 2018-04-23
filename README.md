# ease

A small easing library for Lua (and <a href="https://love2d.org/">love2d</a>) providing:

* the widely used easing functions by <a href="http://robertpenner.com/easing/">Robert Penner</a> under the common SCSS names seen on <a href="http://easings.net">http://easings.net</a>.
* an implementation of the CSS `cubicbezier` easing function

## Installation

Make sure `ease.lua` is in your lua paths. Then do:

```
ease = require "ease"
```

## Usage

```
local f = ease.incubic
print(f(0), f(0.25), f(0.5), f(0.75), f(1))
```

All functions are supported with `in`, `out` and `inout` variants, e.g. `incubic`, `outexpo`, `inoutelastic`. Also see <a href="http://easings.net">http://easings.net</a> for an overview.

`ease.cubicbezier` takes 4 parameters describing two 2d points as (x0, y0, x1, y1). Take a look at the <a href="https://www.w3.org/TR/css-timing-1/#cubic-bzier-timing-function">W3 specs</a> or just visit Lea Verou's <a href="http://cubic-bezier.com/">http://cubic-bezier.com/</a>.

Here are some sample curves ease produces (from the included demo app):

![demo image](https://raw.githubusercontent.com/wiki/poke1024/ease/demo.png)

# Credits

This library is a repackaging of the easing function implementation in <a href="https://github.com/rxi/flux">flux</a> by rxi and the `cubicbezier` implementation in <a href="https://github.com/gre/bezier-easing">bezier-easing</a> by Gaëtan Renaudeau, both with slight modifications (and the latter ported to Lua from Javascript).

See the LICENSE file for details.
