local availableFrom = 1960
local defaultHeightIndex = 4
local defaultPillarsIndex = 1
local undergroundClearing = 4.4
local underpassZed = -3

return function()
    return {
        availableFrom = availableFrom,
        defaultHeightIndex = defaultHeightIndex,
        defaultPillarsIndex = defaultPillarsIndex,
        undergroundClearing = undergroundClearing,
        underpassZed = underpassZed
    }
end
