local addonName, addon = ...

local defaultBlocked = {
1391165,
1391166,
2530794,
2530796,
2530797,
2530798,
2530811,
2530835,
5770084,
5770087,
5834632,
5835211,
5835212,
5835214,
5835215,
5835725,
5835726,
5854705,
5859141,
6178475,
6178476,
6178477,
6178478,
6178479,
6178480,
6178481,
6178488,
6178489,
6178494,
6178497,
6178498,
6178500,
6178502,
6178504,
6178506,
6178508,
}

local function MuteAll()
    for id, _ in pairs(XalatathMuterDB.sounds) do
        MuteSoundFile(id)
    end
end

local function UnmuteAll()
    for id, _ in pairs(XalatathMuterDB.sounds) do
        UnmuteSoundFile(id)
    end
end

local function InitDB()
    if not XalatathMuterDB then
        XalatathMuterDB = { sounds = {}, removedDefaults = {}, enabled = true }
    end
    if not XalatathMuterDB.sounds then
        XalatathMuterDB.sounds = {}
    end
    if not XalatathMuterDB.removedDefaults then
        XalatathMuterDB.removedDefaults = {}
    end
    if XalatathMuterDB.enabled == nil then
        XalatathMuterDB.enabled = true
    end
    for _, id in ipairs(defaultBlocked) do
        if not XalatathMuterDB.sounds[id] and not XalatathMuterDB.removedDefaults[id] then
            XalatathMuterDB.sounds[id] = true
        end
    end
end

local function ApplySounds()
    if XalatathMuterDB.enabled then
        MuteAll()
    else
        UnmuteAll()
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == addonName then
        InitDB()
        print("Xal'atath Muter: Loaded (" .. #defaultBlocked .. " default sounds)")
        self:UnregisterEvent("ADDON_LOADED")
    elseif event == "PLAYER_LOGIN" or event == "PLAYER_ENTERING_WORLD" then
        ApplySounds()
    end
end)

-- ─── Slash Commands ───────────────────────────────────────────────────────────

SLASH_XM1 = "/xm"
SlashCmdList["XM"] = function(msg)
    local command, arg = msg:match("^(%S*)%s*(.*)")
    command = command or ""
    arg = arg or ""

    if command == "on" then
        XalatathMuterDB.enabled = true
        MuteAll()
        print("Xal'atath Muter: ON — sounds muted.")

    elseif command == "off" then
        XalatathMuterDB.enabled = false
        UnmuteAll()
        print("Xal'atath Muter: OFF — sounds unmuted.")

    elseif command == "add" then
        local id = tonumber(arg)
        if id then
            XalatathMuterDB.sounds[id] = true
            XalatathMuterDB.removedDefaults[id] = nil
            if XalatathMuterDB.enabled then MuteSoundFile(id) end
            print("Xal'atath Muter: Added " .. id)
        else
            print("Xal'atath Muter: Invalid file data ID.")
        end

    elseif command == "remove" then
        local id = tonumber(arg)
        if id then
            XalatathMuterDB.sounds[id] = nil
            XalatathMuterDB.removedDefaults[id] = true
            UnmuteSoundFile(id)
            print("Xal'atath Muter: Removed " .. id)
        else
            print("Xal'atath Muter: Invalid file data ID.")
        end

    elseif command == "list" then
        print("Xal'atath Muter — managed sounds:")
        local count = 0
        for id in pairs(XalatathMuterDB and XalatathMuterDB.sounds or {}) do
            count = count + 1
            print("  " .. id)
        end
        if count == 0 then print("  (none)") end

    elseif command == "reset" then
        XalatathMuterDB.sounds = {}
        XalatathMuterDB.removedDefaults = {}
        for _, id in ipairs(defaultBlocked) do
            XalatathMuterDB.sounds[id] = true
        end
        ApplySounds()
        print("Xal'atath Muter: Reset to defaults.")

    else
        print("Xal'atath Muter — commands:")
        print("  /xm on           — enable muting")
        print("  /xm off          — disable muting")
        print("  /xm add <id>     — add a sound file data ID")
        print("  /xm remove <id>  — remove a sound file data ID")
        print("  /xm list         — list all managed sounds")
        print("  /xm reset        — reset to defaults")
        print("  Current state: " .. (XalatathMuterDB.enabled and "ON" or "OFF"))
    end
end