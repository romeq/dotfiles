local function read_from(file)
    local fhandle = io.open(file, "rb")
    if not fhandle then return nil end

    local contents = fhandle:read("*l")
    fhandle:close()
    return contents
end

local function get_secret_projects()
    local hiddenprojects = os.getenv("HOME") .. "/.testaustime_secret_projects"

    local fhandle = io.open(hiddenprojects)
    if not fhandle then
        return {}
    end
    fhandle:close()

    local lines = {}
    for line in io.lines(hiddenprojects) do
        lines[#lines + 1] = line
    end
    return lines
end

return require("testaustime").setup({
    token = read_from(os.getenv("HOME") .. "/.testaustime_token"),
    secret_projects = get_secret_projects(),
    editor_name = "neovim",
    useragent = "very balls",
})
