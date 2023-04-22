local core = require("apisix.core")

local plugin_name = "xm-http-check"

local schema = {
    type = "object",
    properties = {
        reqProp = {
            type = "object"
        }
    }
}

local _M = {
    version = 0.2,
    priority = 100,
    name = plugin_name,
    schema = schema,
}

function _M.check_schema(conf, schema_type)
    return core.schema.check(schema, conf)
end

function _M.access(conf, ctx)
	core.log.warn(core.json.encode(conf, true))
	core.log.warn(core.json.encode(ctx, true))
end


function _M.body_filter(conf, ctx)
	
end


function _M.log(conf, ctx)
    local headers = ngx.req.get_headers()
	core.log.warn("headers: ", core.json.encode(headers))
	local uriArgs = ngx.req.get_uri_args()
	core.log.warn("uriArgs: ",core.json.encode(uriArgs))
	for field, value in pairs(uriArgs) do
		core.log.warn("field: ", field)
		core.log.warn("value: ", value)
	end
    
end

return _M
