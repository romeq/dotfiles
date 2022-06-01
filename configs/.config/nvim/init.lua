require("plugins")

local function read_token_from(file)
    local fhandle = io.open(file, "rb")
    if not fhandle then
        return nil
    end
    local token = fhandle:read("l")
    fhandle:close()
    return token
end

local token = read_token_from("/home/rmq/.testaustime_token")
if token then
    vim.g.testaustime_token = token
    vim.g.testaustime_url = "https://api.testaustime.fi"
    vim.g.testaustime_ignore = "packer netrw help qf TelescopePrompt"
end

