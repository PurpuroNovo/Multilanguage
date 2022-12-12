Multilanguage = {}

Multilanguage.example = {
    {["languageName"] = "Baguette",                 ["languageFlag"] = "ui/menu/lang/baguette"},
    {["languageName"] = "Bhaarat",                  ["languageFlag"] = "ui/menu/lang/in"},
    {["languageName"] = "Brasil",                   ["languageFlag"] = "ui/menu/lang/br"},
    {["languageName"] = "England",                  ["languageFlag"] = "ui/menu/lang/en"},
    {["languageName"] = "España",                   ["languageFlag"] = "ui/menu/lang/es"},
    {["languageName"] = "Esperanto",                ["languageFlag"] = "ui/menu/lang/eo"},
    {["languageName"] = "France",                   ["languageFlag"] = "ui/menu/lang/fr"},
    {["languageName"] = "México",                   ["languageFlag"] = "ui/menu/lang/mx"},
    {["languageName"] = "Portugal",                 ["languageFlag"] = "ui/menu/lang/pt"},
    {["languageName"] = "Roma",                     ["languageFlag"] = "ui/menu/lang/rm"},
    {["languageName"] = "toki pona",                ["languageFlag"] = "ui/menu/lang/to"},
    {["languageName"] = "United Kingdom",           ["languageFlag"] = "ui/menu/lang/uk"},
    {["languageName"] = "United States",            ["languageFlag"] = "ui/menu/lang/us"},
    {["languageName"] = "Россия",                   ["languageFlag"] = "ui/menu/lang/ru"},
    {["languageName"] = "中国",                      ["languageFlag"] = "ui/menu/lang/cn"},
    {["languageName"] = "日本",                      ["languageFlag"] = "ui/menu/lang/jp"},
}

Multilanguage.menu = require("libraries.Multilanguage.scripts.menu.language")

function Multilanguage:openMenu(langTable, callback)
    Game.world:openMenu(self.menu(langTable, callback))
end

function Multilanguage:init()
    print("Multilanguage library loaded!")
end

return Multilanguage