---@class LanguageMenu: Object
local LanguageMenu, super = Class(Object)

---@param languages Language[]
---@param callback function|nil
function LanguageMenu:init(languages, callback)
    super:init(self, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)

    self.callback = callback
    self.languages = languages
    self.pageSize = 11
    self.page = 1
    -- Starts at zero
    self.selection = 0

    self.lang_title = "Choose your language"

    ------------------------------------------------------------------------------------------------------------

    self.font = Assets.getFont("menu")

    self.lang_text = Text(self.lang_title, 330, 30, 300, 200, { style = "GONER" })
    self.lang_text.x = 330 - Utils.round(self.lang_text.text_width / 2)
    self:addChild(self.lang_text)

    self.page_text = Text("Page", 330, 440, 300, 200, { style = "GONER" })
    self.page_text.x = 330 - Utils.round(self.page_text.text_width / 2)
    self:addChild(self.page_text)

    self.heart = Sprite("player/heart_menu")
    self.heart.visible = true
    self.heart:setOrigin(0.5, 0.5)
    self.heart:setScale(2, 2)
    self.heart:setColor(1, 0, 0)
    self.heart.layer = 100
    self.heart:setPosition(100, 100)
    self:addChild(self.heart)

    self.language_texts = {}
    self:updatePage()

    self.time = 1
end

--------------------------------------------------------------------------------------------------

function LanguageMenu:getPages()
    return math.floor(#self.languages / self.pageSize) + 1
end

function LanguageMenu:pageToIndex(page)
    return 1 + ((page - 1) * self.pageSize)
end

function LanguageMenu:getPage(page)
    local result = {}

    local pageIndex = self:pageToIndex(page)
    for i = pageIndex, math.min(pageIndex + self.pageSize - 1, #self.languages) do
        table.insert(result, self.languages[i])
    end

    return result
end

function LanguageMenu:clearLangTexts()
    for i = 1, #self.language_texts do
        self.language_texts[i]:remove()
        self.language_texts[i] = nil
    end
end

function LanguageMenu:buildLangTexts(elements)
    for i = 1, #elements do
        ---@type Language
        local lang = elements[i]

        local text = Text(lang.name, 120, 82 + ((i - 1) * 32))
        local sprite = Sprite(lang.flag)
        sprite:setPosition(text.text_width + 8, Utils.round(text.text_height / 2 - 8))
        text:addChild(sprite)
        self:addChild(text)

        table.insert(self.language_texts, text)
    end
end

function LanguageMenu:updatePage()
    self.page_text:setText(self.page .. "/" .. self:getPages())
    self.page_text.x = 330 - Utils.round(self.page_text.text_width / 2)

    self:clearLangTexts()
    self:buildLangTexts(self:getPage(self.page))
end

function LanguageMenu:moveSoul(amount)
    Assets.playSound("ui_move")
    self.selection = self.selection + amount

    if (self.selection < 0) then
        if (self.page == 1) then
            self.selection = 0
        else
            self.selection = self.pageSize - 1
            self.page = math.max(self.page - 1, 1)
            self:updatePage()
        end
    end

    if (self.selection > math.min(#self.languages - self:pageToIndex(self.page), self.pageSize - 1)) then
        if (self.page == self:getPages()) then
            self.selection = self.selection - amount
        else
            self.selection = 0
            self.page = math.min(self.page + 1, self:getPages())
            self:updatePage()
        end
    end

    self.heart:setPosition(100, 100 + (self.selection * 32))
end

--------------------------------------------------------------------------------------------------

function LanguageMenu:draw()
    love.graphics.setColor(0, 0, 0, 1 / 1.5 * self.time)
    love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
    super:draw(self)
    love.graphics.setColor(1, 1, 1)
end

function LanguageMenu:onKeyPressed(key, repeatable)
    if Input.pressed("up", true) then
        self:moveSoul(-1)
    end
    if Input.pressed("down", true) then
        self:moveSoul(1)
    end
    if Input.pressed("confirm", true) then
        local lang = self.languages[self.selection + self:pageToIndex(self.page)]

        if type(self.callback) == "function" then
            self.callback(lang)
        end

        print("Selected language " .. lang.name)

        Multilanguage.language = lang
        Assets.playSound("ui_select")
        Game.world:closeMenu()
    end
end

function LanguageMenu:close()
    Game.world.menu = nil
    self:remove()
end

return LanguageMenu