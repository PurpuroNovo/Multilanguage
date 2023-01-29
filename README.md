## 🌏 Multilanguage
## Version 3.0.0
# 

**This will only work in the development version of Kristal! (v0.8.0-dev)**

A library for mutli language support

## How to install?

Make a `libraries` folder in your mod, and move Multilanguage to there

## Example code

```lua
-- The current language of the mod
Mod.language = nil

function Mod.onLanguageSet(language)
    -- This is called when a language is set
    Mod.language = language
end

function Mod:init()
    print("Loaded "..self.info.name.."!")

    -- You have to do this in :init, because the Multilanguage globals aren't there before :init, only in :init
    Mod.languages = {
        Language("assets/lang/en.json"), -- You can add as many languages as  you like
        Language("assets/lang/pt-br.json"),
        EsperantoLanguage("assets/lang/eo.json"),

        -- Language({"languageName": "You can also use tables!", "languageFlag": "kristal/starwalker"})
    }

    function Mod:postInit()
        Multilanguage:openMenu(Mod.languages, Mod.onLanguageSet)
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

```lua
{
    -- The languages
    Language("assets/lang/en.json"),
    Language("assets/lang/eo.json"),
}
```

# Using the language on a WorldCutscene

```lua
-- Like WorldCutscene:text, but it gets the text from the selected language
-- Replace ralsei.hello with your path (In the language, not of the language)
custscene:langText("ralsei.hello", "smile")
```