local arrayUtils = require('lollo_elevated_stations.arrayUtils')
local lolloConstants = require('lollo_elevated_stations/lolloConstants')
local modulesutil = require 'modulesutil'
local transf = require 'transf'
local vec3 = require 'vec3'

local helper = {}

helper.updateFn = function(result, transform, tag, slotId, addModuleFn, params)
    local _isWithGap = arrayUtils.arrayHasValue(result.pedestrianGroundAreasWithGap, slotId)

    local faces = _isWithGap and {
        {2.5, -5.8, 0.0, 1.0},
        {2.5, 9.8, 0.0, 1.0},
        {-2.5, 9.8, 0.0, 1.0},
        {-2.5, -5.8, 0.0, 1.0}
    } or {
        {2.5, -5.8, 0.0, 1.0},
        {2.5, 5.8, 0.0, 1.0},
        {-2.5, 5.8, 0.0, 1.0},
        {-2.5, -5.8, 0.0, 1.0}
    }
    modulesutil.TransformFaces(transform, faces)
    local faces2 = {
        type = 'EQUAL',
        faces = {faces},
        optional = true
        -- slopeHigh = 999, --LOLLO added this
        -- slopeLow = 0 --LOLLO added this
    }
    table.insert(result.terrainAlignmentLists, faces2)
    -- LOLLO NOTE insert colliders here, coz those in the model do not pull.
    -- These values are calculated with trial and error. They are slightly larger than half of the bounding box sizes, which are cut a tad smaller.
    if _isWithGap then table.insert(
        result.colliders,
        {
            type = 'BOX',
            transf = transf.mul(transform, transf.transl(vec3.new(0, 2, 2.5))),
            params = {
                halfExtents = {2.5, 7.8, 2.5}
            }
        }
    )
    else table.insert(
        result.colliders,
        {
            type = 'BOX',
            transf = transf.mul(transform, transf.transl(vec3.new(0, 0, 2.5))),
            params = {
                halfExtents = {2.5, 5.8, 2.5}
            }
        }
    )
    end
    -- insert underground collider to force streets and rails below to be in a tunnel
    table.insert(
        result.colliders,
        {
            type = 'BOX',
            transf = transf.mul(transform, transf.transl(vec3.new(0, 0, -lolloConstants().undergroundClearing))),
            params = {
                halfExtents = {2.5, 5.8, lolloConstants().undergroundClearing}
            }
        }
    )

    table.insert(
        result.groundFaces,
        {
            face = faces,
            modes = {
                {
                    type = 'FILL',
                    key = 'shared/asphalt_01.gtex.lua' --'shared/asphalt_01.gtex.lua'
                },
                --[[                         {
                    type = 'STROKE_INNER',
                    key = 'shared/asphalt_01.gtex.lua',
                },
                ]]
                {
                    type = 'STROKE_OUTER',
                    key = 'shared/asphalt_01.gtex.lua' --'street_border.lua'
                }
            }
        }
    )

    addModuleFn(
        'pedestrian_ground_areas/empty.mdl',
        transf.rotZTransl(math.rad(90), vec3.new(0, 0, 0))
    )

    if _isWithGap then
        addModuleFn(
            'between_ground_areas.mdl',
            transf.rotZTransl(math.rad(0), vec3.new(0, 8, 0))
        )
    end
end

return helper