rockspec_format = "3.0"

package = "lua-wan30"
version = "0.1.0-1"

source = {
  url = "git+file:///Users/dieselniu/new-website/website-link-extension/lua-wan30",
  tag = "v0.1.0",
}

description = {
  summary = "Lua helpers for generating Wan links and campaign URLs",
  detailed = [[
lua-wan30 is a tiny Lua utility for building Wan homepage links,
landing page URLs, and UTM campaign links from Lua applications.
  ]],
  homepage = "https://wan30.video/",
  license = "MIT",
  maintainer = "dieselniu",
  labels = { "url", "marketing", "links", "wan" },
}

build = {
  type = "builtin",
  modules = {
    wan = "src/wan.lua",
  },
}
