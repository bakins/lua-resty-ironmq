local ironmq = require "resty.ironmq"

local mq = ironmq.new({
			  project = os.getenv("IRONMQ_PROJECT"),
			  token = os.getenv("IRONMQ_TOKEN")
		      })

local queues, err = mq:queues()

if err then
    ngx.say(err)
else
    ngx.say(type(queues))
end


