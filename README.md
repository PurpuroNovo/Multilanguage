# Multilanguage

A library for mutli language support

## How to install?

Make a `libraries` folder in your mod, and move Multilanguage to there

## Example code

```lua
local json = require("src.lib.json")

-- Get the JSON from the mod
local function ReadJson(path)
    return json.decode(love.filesystem.read("string", Mod.info.path .. "/" .. path))
end

Mod.language = nil

--- Get text from the language
function Mod:getText(path)
    if not Mod.language then return end

    return Mod.language[path]
end

function Mod:init()
    print("Loaded "..self.info.name.."!")

    local languages = {
        ReadJson("assets/lang/en.json"), -- You can put as many languages as you like
        ReadJson("assets/lang/pt-br.json"),
        ReadJson("assets/lang/eo.json"),
    }

    function Mod:postInit()
        Multilanguage:openMenu(languages, function (lang)
            -- This will be called when the player selects the language
            Mod.language = lang
        end)
    end
end
```

Every language needs a `languageName` and `languageFlag`, Examples:

```json
{
    "languageName": "American English",
    "languageFlag": "ui/menu/lang/us",

    "hello": "Hello!"
}
```

```json
{
    "languageName": "Esperanto",
    "languageFlag": "ui/menu/lang/eo",

    "hello": "Saluton!"
}
```