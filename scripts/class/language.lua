---@class Language
---@overload fun(path: string|table, name?: string, flag?: string): Language
local Language, super = Class()

function Language:init(path, name, flag)
    self.data = {}

    if type(path) == "table" then
        self.data = path
    elseif type(path) == "string" then
        self.data = JSON.decode(love.filesystem.read("string", Mod.info.path .. "/" .. path))
    end

    self.name = name or self.data["languageName"] or "Unknown language"
    self.flag = flag or self.data["languageFlag"] or "kristal/starwalker"
end

---@param path string
---@param options? table
---@nodiscard
function Language:get(path, options)
    local options = options or {}
    local result = self.data[path]

    if type(options.type) ~= "nil" then
        if options.type == "string" then
            result =  tostring(result)
        elseif options.type == "number" then
            result = tonumber(result)
        end
    end

    return result
end

return Language