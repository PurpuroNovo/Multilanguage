local WorldCutscene, super = Class(WorldCutscene)

function WorldCutscene:langText(path, portrait, actor, options)
    self:text(Multilanguage.language:get(path, {type = "string", call = "WorldCutscene"}), portrait, actor, options)
end

return WorldCutscene