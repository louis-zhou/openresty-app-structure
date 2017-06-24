local config = require 'config'
local cjson = require 'cjson'

ngx.say(cjson.encode(config))