local function togibs(megs)
    return (math.floor(megs / 100000) / 10)
end

local function memory_usage_gib()
    local file = io.open("/proc/meminfo", "rb")
    if not file then
        return nil, nil
    end
    local content = file:read "*a"
    file:close()
    local total = tonumber(content:match("MemTotal:%s+(%d+)"))
    local free = tonumber(content:match("MemFree:%s+(%d+)"))
    local buffers = tonumber(content:match("Buffers:%s+(%d+)"))
    local cached = tonumber(content:match("Cached:%s+(%d+)"))
    local srec = tonumber(content:match("SReclaimable:%s+(%d+)"))
    local used_diff = free + cached + srec + buffers
    return togibs(total), togibs(total - used_diff)
end

return {
    memory_usage_gib = memory_usage_gib,
}
