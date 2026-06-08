local wan = {}

local DEFAULT_BASE_URL = "https://wan30.video/"

local function trim_trailing_slash(value)
  return (value:gsub("/+$", ""))
end

local function encode_component(value)
  return tostring(value)
    :gsub("\n", "\r\n")
    :gsub("([^%w%-_%.~])", function(char)
      return string.format("%%%02X", string.byte(char))
    end)
end

local function normalize_path(path)
  if not path or path == "" or path == "/" then
    return ""
  end
  if path:sub(1, 1) ~= "/" then
    return "/" .. path
  end
  return path
end

local function build_query(params)
  if not params then
    return ""
  end

  local parts = {}
  for key, value in pairs(params) do
    if value ~= nil then
      parts[#parts + 1] = encode_component(key) .. "=" .. encode_component(value)
    end
  end

  table.sort(parts)

  if #parts == 0 then
    return ""
  end

  return "?" .. table.concat(parts, "&")
end

function wan.homepage()
  return DEFAULT_BASE_URL
end

function wan.link(options)
  options = options or {}

  local base_url = trim_trailing_slash(options.base_url or DEFAULT_BASE_URL)
  local path = normalize_path(options.path)
  local query = build_query(options.params)

  return base_url .. path .. query
end

function wan.campaign_link(options)
  options = options or {}

  local params = {}
  if options.params then
    for key, value in pairs(options.params) do
      params[key] = value
    end
  end

  params.utm_source = options.utm_source or "luarocks"
  params.utm_medium = options.utm_medium or "package"
  params.utm_campaign = options.utm_campaign or "lua-wan30"

  return wan.link({
    base_url = options.base_url,
    path = options.path,
    params = params,
  })
end

return wan
