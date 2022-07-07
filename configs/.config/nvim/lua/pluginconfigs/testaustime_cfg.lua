local function read_token_from(file)
    local fhandle = io.open(file, "rb")
    if not fhandle then
        return nil
    end
    local token = fhandle:read("l")
    fhandle:close()
    return token
end

return require("testaustime").setup({
    token = read_token_from(os.getenv("HOME") .. "/.testaustime_token"),
    editor_name = "neovim",
    useragent = "very balls",
})
