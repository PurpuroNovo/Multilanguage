Multilanguage = {}
-- The selected language, nil by default
---@type Language|nil
Multilanguage.language = nil

----------------------------------------------------------------------------------------------------------------

function Multilanguage:openMenu(langTable, callback)
    Game.world:openMenu(LanguageMenu(langTable, callback))
end

---@deprecated
function Multilanguage:getText(path)
    if not self.language then
        return nil
    end
    
    return self.language:get(path)
end

function Multilanguage:init()
    ---@type Language
    Language = require(self.info.path .. "/scripts/class/language")

    ---@type EsperantoLanguage
    EsperantoLanguage = require(self.info.path .. "/scripts/class/esperantoLanguage")
    
    ---@type LanguageMenu
    LanguageMenu = require(self.info.path .. "/scripts/menu/languagemenu")

    ----------------------------------------------------------------------------------------------------------------

    -- A list of all flags supported
    ---@type Language[]
    Multilanguage.example = {
        Language({["languageName"] = "Baguette",                 ["languageFlag"] = "ui/menu/lang/baguette"}),
        Language({["languageName"] = "Brasil",                   ["languageFlag"] = "ui/menu/lang/br"}),
        Language({["languageName"] = "Deutschland",              ["languageFlag"] = "ui/menu/lang/de"}),
        Language({["languageName"] = "England",                  ["languageFlag"] = "ui/menu/lang/en"}),
        Language({["languageName"] = "España",                   ["languageFlag"] = "ui/menu/lang/es"}),
        Language({["languageName"] = "Esperanto",                ["languageFlag"] = "ui/menu/lang/eo"}),
        Language({["languageName"] = "France",                   ["languageFlag"] = "ui/menu/lang/fr"}),
        Language({["languageName"] = "Ireland",                  ["languageFlag"] = "ui/menu/lang/ir"}),
        Language({["languageName"] = "India",                    ["languageFlag"] = "ui/menu/lang/in"}),
        Language({["languageName"] = "Italia",                   ["languageFlag"] = "ui/menu/lang/it"}),
        Language({["languageName"] = "México",                   ["languageFlag"] = "ui/menu/lang/mx"}),
        Language({["languageName"] = "Portugal",                 ["languageFlag"] = "ui/menu/lang/pt"}),
        Language({["languageName"] = "Roma",                     ["languageFlag"] = "ui/menu/lang/rm"}),
        Language({["languageName"] = "România",                  ["languageFlag"] = "ui/menu/lang/ro"}),
        Language({["languageName"] = "Scotland",                 ["languageFlag"] = "ui/menu/lang/sc"}),
        Language({["languageName"] = "toki pona",                ["languageFlag"] = "ui/menu/lang/to"}),
        Language({["languageName"] = "United Kingdom",           ["languageFlag"] = "ui/menu/lang/uk"}),
        Language({["languageName"] = "United States",            ["languageFlag"] = "ui/menu/lang/us"}),
        Language({["languageName"] = "Россия",                   ["languageFlag"] = "ui/menu/lang/ru"}),
        Language({["languageName"] = "中国",                      ["languageFlag"] = "ui/menu/lang/cn"}),
        Language({["languageName"] = "日本",                      ["languageFlag"] = "ui/menu/lang/jp"})
    }

    ----------------------------------------------------------------------------------------------------------------

    print("Multilanguage library loaded!")
end

return Multilanguage