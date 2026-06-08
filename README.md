# lua-wan30

`lua-wan30` is a tiny Lua helper for generating links to [Wan](https://wan30.video/).

It keeps link construction in one place and can generate landing page URLs and
UTM-tagged campaign links from Lua applications.

## Install

```bash
luarocks install lua-wan30
```

## Usage

```lua
local wan = require("wan")

print(wan.homepage())
-- https://wan30.video/

print(wan.link({
  path = "/pricing",
  params = {
    ref = "lua",
    lang = "en",
  }
}))
-- https://wan30.video/pricing?lang=en&ref=lua

print(wan.campaign_link({
  path = "/",
  utm_source = "luarocks",
  utm_medium = "package",
  utm_campaign = "launch",
}))
-- https://wan30.video/?utm_campaign=launch&utm_medium=package&utm_source=luarocks
```

## API

### `wan.homepage()`

Returns the Wan homepage URL.

### `wan.link(options)`

Build a Wan URL.

Options:

- `base_url`: optional base URL override
- `path`: optional path such as `"/pricing"`
- `params`: optional query parameter table

### `wan.campaign_link(options)`

Build a Wan URL with default UTM values.

Defaults:

- `utm_source = "luarocks"`
- `utm_medium = "package"`
- `utm_campaign = "lua-wan30"`

## License

MIT
