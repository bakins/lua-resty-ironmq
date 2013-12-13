local http = require "resty.http.simple"
local tcp = ngx.socket.tcp
local cjson = require "cjson"
local encode = cjson.encode
local decode = cjson.decode
local concat = table.concat

local _M = {}

_M.VERSION = "0.1.0"

local mt = { __index = _M }

function _M.new(opts)
    local token = opts.token
    if not token then
	return nil, "token is required"
    end

    local project = opts.project
    if not project then
	return nil, "project is required"
    end

    local self = {
	host = opts.host or "mq-aws-us-east-1.iron.io",
	token = token,
	project = project
    }
    return setmetatable(self, mt)
end

local function http_request(self, method, path, body, query)
    if body then
	body = encode(body)
    end

    local options = {
	method = method,
	headers = {
	    Authorization = "OAuth " .. self.token,
	    ["Content-Type"] = "application/json"
	},
	path = concat({"/projects", self.project, "queues", path }, "/"),
	body = body,
	query = query
    }

    local res, err = http.request(self.host, 80, options)
    if not res then
	return nil, err
    end

    return true, decode(res.body)
end

function _M.queues(self)
    local rc, data = http_request(self, "GET", "", nil, { per_page = 100 })
    if not rc then
	return nil, data
    end
    -- TODO: use new table.create to create a sized table
    local queues = {}
    for i=1,#data do
	queues[i] = data[i].name
    end
    return queues, nil
end

return _M

