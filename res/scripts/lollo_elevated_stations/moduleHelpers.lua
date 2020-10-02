local transf = require 'transf'
local vec3 = require 'vec3'

local helpers = {}

helpers.addBitsBetweenPlatformAndTrack = function(result, i, j, addModelFn, modelsConfig, ca, cb, baseZ)
    local zAdjustment = 0.02 -- 0.01
    local yShift = 0.9
    local moduleLeft = result.GetModuleAt(i - 1, j)
    if moduleLeft and (moduleLeft.metadata.track) then
        addModelFn(modelsConfig.perron2Track, transf.rotZTransl(math.rad(-90), vec3.new(-yShift, 20, baseZ + zAdjustment)))
        if not ca then
            addModelFn(modelsConfig.endPerronSmall, transf.rotZTransl(math.rad(-90), vec3.new(-2 - yShift, -20, baseZ)))
        end
        if not cb then
            addModelFn(modelsConfig.endPerronSmall, transf.rotZTransl(math.rad(90), vec3.new(-2 - yShift, 20, baseZ)))
        end
    end
    local moduleRight = result.GetModuleAt(i + 1, j)
    if moduleRight and (moduleRight.metadata.track) then
        addModelFn(modelsConfig.perron2Track, transf.rotZTransl(math.rad(90), vec3.new(yShift, -20, baseZ + zAdjustment)))
        if not ca then
            addModelFn(modelsConfig.endPerronSmall, transf.rotZTransl(math.rad(-90), vec3.new(2 + yShift, -20, baseZ)))
        end
        if not cb then
            addModelFn(modelsConfig.endPerronSmall, transf.rotZTransl(math.rad(90), vec3.new(2 + yShift, 20, baseZ)))
        end
    end
end

helpers.isWestPlatformNeighbourThere = function(result, i, j, isIncludeTracks)
    local nextM = result.GetModuleAt(i, j - 1)
    local ca = (nextM and (nextM.metadata.passenger_platform or nextM.metadata.cargo_platform or (isIncludeTracks and nextM.metadata.track)))
    or result.connector[1000 * i + 100 * (j - 1) + 7]
    or helpers.isStationOnHead(result, i, 3)

    return ca
end

helpers.isEastPlatformNeighbourThere = function(result, i, j, isIncludeTracks)
    local prevM = result.GetModuleAt(i, j + 1)
    local cb = (prevM and (prevM.metadata.passenger_platform or prevM.metadata.cargo_platform or (isIncludeTracks and prevM.metadata.track)))
    or result.connector[1000 * i + 100 * (j + 1) + 0]
    or helpers.isStationOnHead(result, i, 4)

    return cb
end

helpers.isSouthPlatformNeighbourThere = function(result, i, j, isIncludeTracks)
    local nextM = result.GetModuleAt(i + 1, j)
    return (nextM and (nextM.metadata.passenger_platform or nextM.metadata.cargo_platform or (isIncludeTracks and nextM.metadata.track)))
end

helpers.isNorthPlatformNeighbourThere = function(result, i, j, isIncludeTracks)
    local prevM = result.GetModuleAt(i - 1, j)
    return (prevM and (prevM.metadata.passenger_platform or prevM.metadata.cargo_platform or (isIncludeTracks and prevM.metadata.track)))
end

helpers.isStationOnHead = function(result, i, side34)
    if not(result) or not(result.occupied) or not(result.occupied[side34]) then return false end
    -- for neighbourIndex = -1, 1 do
    --     if result.occupied[side34][i + neighbourIndex] ~= nil then return true end
    -- end
    if result.occupied[side34][i] ~= nil then return true end
    return false
end

helpers.isStationOnSide = function(result, finerThanJ, side12)
    if not(result) or not(result.occupied) or not(result.occupied[side12]) then return false end
    -- local _jMin = trainstationutil.stationYMin
    -- local _jMax = trainstationutil.stationYMax
    -- local finerThanJ = (j - _jMin) * 4 + 1
    if result.occupied[side12][finerThanJ] ~= nil then return true end
    return false
end

return helpers
