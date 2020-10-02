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

return helpers