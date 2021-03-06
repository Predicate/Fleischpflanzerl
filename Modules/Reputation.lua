-- GLOBALS: ChatFrame5

local frame = CreateFrame("Frame")
frame:RegisterEvent("UPDATE_FACTION")
local reps = {}
frame:SetScript("OnEvent", function()
    local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader,
    isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canBeLFGBonus, _
    local difference
    for factionIndex=1, GetNumFactions() do
        name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader,
    isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canBeLFGBonus = GetFactionInfo(factionIndex)
        if not isHeader and name then
            if (reps[name]) then
                difference = earnedValue - reps[name]
                if (difference > 0) then
                    --ChatFrame5:AddMessage(format("Reputation with %s increased by %d. (%d remaining until %s)", --long version
                    ChatFrame5:AddMessage(format("%s + %d. (%d until %s)", name, difference, topValue - earnedValue, (standingID == 8) and "max" or _G["FACTION_STANDING_LABEL"..standingID + 1]), 0.5, 0.5, 1)
                elseif (difference < 0) then
                    difference = 0 - difference
                    --ChatFrame5:AddMessage(format("Reputation with %s decreased by %d. (%d remaining until %s)", --long version
                    ChatFrame5:AddMessage(format("%s - %d. (%d until %s)", name, difference,  earnedValue - bottomValue, (standingID == 1) and "min" or _G["FACTION_STANDING_LABEL"..standingID - 1]), 0.5, 0.5, 1)
                end
            end
            reps[name] = earnedValue
        end
    end
end)