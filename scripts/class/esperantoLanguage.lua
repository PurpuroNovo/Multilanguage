local utf8 = require("utf8")

---@class EsperantoLanguage: Language
---@overload fun(path: string|table, name?: string, flag?: string): EsperantoLanguage
local EsperantoLanguage, super = Class(Language)

---@param path string
---@param options? table
---@nodiscard
function EsperantoLanguage:get(path, options)
    local options = options or {}
    local result = super.get(self, path, options)

    if type("result") == "string" and options.esperantize ~= false then
        local esperantized = ""
        local main = true

        for i, char in utf8.codes(result) do
            char = utf8.char(char)
            local type = (char == "Ĉ" or char == "ĉ" or char == "Ĝ" or char == "ĝ" or char == "Ĥ" or char == "ĥ" or char == "Ĵ" or char == "ĵ" or char == "Ŝ" or char == "ŝ" or char == "Ŭ" or char == "ŭ")

            if main ~= not type then
                main = not main

                if main then
                    esperantized = esperantized .. "[font:main]"
                else
                    esperantized = esperantized .. "[font:esperanto]"
                end
            end

            esperantized = esperantized .. char
        end

        result = esperantized
    end

    return result
end

return EsperantoLanguage