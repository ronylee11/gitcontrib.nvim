local M = {}
username = ""
opts = ""

M.notify = require("notify")

local function on_job_exit(_, code, _)
    if code == 0 then
        -- Read the output file
        local f = assert(io.open("/tmp/github_contributions.txt", 'r'))
        local s = assert(f:read('*a'))
        f:close()
        -- Notify it using nvim-notify
        local result = M.notify(s, "info", {
            title = "GitHub Contributions 🐙",
            timeout = 300,
        })
    else
        print("Error: Unable to fetch GitHub contributions.")
    end
end

local function fetch_github_contributions()
    local curl_command = "curl 'https://github-contributions-api.deno.dev/" .. username .. ".text?" .. opts.. "' > /tmp/github_contributions.txt"
    local job_id = vim.fn.jobstart(curl_command, {
        on_exit = on_job_exit,
        stdout_buffered = true,
        stderr_buffered = true,
    })

    if job_id > 0 then
        print("Fetching GitHub contributions in the background...")
    else
        print("Error starting the job.")
    end
end

---@params opts? Config
function M.setup(config)
    username = config.username or ""
    opts = config.opts or ""
    
    if username ~= nil then
        fetch_github_contributions()
    else
        print("Error: Please provide username.")
    end
end

return M
