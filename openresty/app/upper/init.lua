local gearman = require "resty.gearman"
function init()
    local gm = gearman:new()
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
end

return init;