# gitcontrib.nvim

simple nvim plugin that pops up a notification window to show git contributions

![demo](./assets/demo.gif)

- [Upcoming Features](#upcoming-features)
- [Installation](#installation)
- [Usage](#usage)
  - [parameters for opts](#parameters-for-opts)
- [Credits](#%EF%B8%8F-credits-)

## Upcoming Features

- notifies that you haven't done your daily contribution!
- filter number of contributions and convert two digit numbers to specific characters according to range (1-10 = A, 10-20 = B, 20-30 = C ...)
- add colors(using nvim-treesitter highlight) and block (◼︎)

## Installation

Install with your preferred package manager:

vim-plug

```
Plug 'rcarriga/nvim-notify' "dependency
Plug 'ronylee11/gitcontrib.nvim'
```

## Usage

```lua
require('gitcontrib').setup({
    username = "yourgithubusername",
    opts = "pixel=%EF%90%88%20&scheme=unicorn&from=2024-01-01" -- optional
})
```

### parameters for opts

You can use other parameters. Each of them works on specific extensions.

- no-total=true : remove total contributions count (term/text/svg)
- no-legend=true : remove legend (term/svg)
- invert=true : change the background colors instead of the foreground colors (term)
- flat=true : return contributions as one-dimensional array (json)
- scheme=[name] : use specific color scheme (term/svg)
- pixel=[char] : use the character as pixels, URL encoding is required (term)
- frame=[color] : use the color as a frame of image (svg)
- bg=[color] : use the color as a background of image (svg)
- font-color=[color] : use the color as a font color (svg)
- from=[yyyy-mm-dd] : get contributions from the date (term/text/svg/json)
- to=[yyyy-mm-dd] : get contributions to the date (term/text/svg/json)

## ✏️ Credits 📔

Special thanks and huge shoutout to these projects 🌟🌟 <br/>
[rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify) <br/>
[kawarimidoll/deno-github-contributions-api](https://github.com/kawarimidoll/deno-github-contributions-api) <br/>
