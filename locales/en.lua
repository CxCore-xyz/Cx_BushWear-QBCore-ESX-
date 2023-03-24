--Translation For QBCore
local Translations = {
    progbar = {
        ["progbar_puton"] = "Puting On Bush",
        ["progbar_takeoff"] = "Taking Off Bush",
        ["progbar_cancel"] = "Canceled!",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})