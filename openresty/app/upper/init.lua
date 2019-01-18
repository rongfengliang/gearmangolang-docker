local gearman = require "resty.gearman"
local gm = gearman:new()
function init()
    gm:set_timeout(1000) -- 1 sec
    local ok, err = gm:connect("app", 4730)
    if not ok then
        ngx.say("failed to connect: ", err)
          return
    end
    ok, err = gm:submit_job("ToUpper", "dalong demo")  
            -- submit_job,submit_job_bg,submit_job_high,submit_job_high_bg,submit_job_low,submit_job_low_bg are supported
            -- submit_job(function_name, workload[, unique])
    if not ok then
        ngx.say("failed to submit job: ", err)
            return
    else
        ngx.say(ok)
    end
    -- put it into the connection pool of size 100,
            -- with 0 idle timeout
    -- local ok, err = gm:set_keepalive(0, 100)
    --     if not ok then
    --         ngx.say("failed to set keepalive: ", err)
    --         return
    --     end

            -- or just close the connection right away:
    local ok, err = gm:close()
        if not ok then
          ngx.say("failed to close: ", err)
          return
        end
end

return init;