local lolloLaneUtils = {}
lolloLaneUtils.getVerticalLane = function(x, y, underpassZed)
    -- LOLLO NOTE alter the sequence if underpassZed changes!
    return {
        --[[ {
            {x, y, 0},
            {0, -1, 0},
            2.4
        },
        {
            {x, y, underpassZed},
            {0, -1, 0},
            2.4
        }, ]]
        {
            {x, y, underpassZed},
            {0, -1, 0},
            2.4
        },
        {
            {x, y, -5},
            {0, -1, 0},
            2.4
        },
        {
            {x, y, -5},
            {0, -1, 0},
            2.4
        },
        {
            {x, y, -10},
            {0, -1, 0},
            2.4
        },
        {
            {x, y, -10},
            {0, -1, 0},
            2.4
        },
        {
            {x, y, -15},
            {0, -1, 0},
            2.4
        },
        {
            {x, y, -15},
            {0, -1, 0},
            2.4
        },
        {
            {x, y, -20},
            {0, -1, 0},
            2.4
        },
        {
            {x, y, -20},
            {0, -1, 0},
            2.4
        },
        {
            {x, y, -25},
            {0, -1, 0},
            2.4
        },
        {
            {x, y, -25},
            {0, -1, 0},
            2.4
        },
        {
            {x, y, -30},
            {0, -1, 0},
            2.4
        },
        {
            {x, y, -30},
            {0, -1, 0},
            2.4
        },
        {
            {x, y, -35},
            {0, -1, 0},
            2.4
        },
        {
            {x, y, -35},
            {0, -1, 0},
            2.4
        },
        {
            {x, y, -40},
            {0, -1, 0},
            2.4
        },
        {
            {x, y, -40},
            {0, -1, 0},
            2.4
        },
        {
            {x, y, -45},
            {0, -1, 0},
            2.4
        }
    }
end

lolloLaneUtils.getLaneLists = function(xm1, x0, xp1, ym1, y0, yp1, underpassZed)
    return {
        {
            -- horizontally into the underpass, straight across
            --linkable = true,
            nodes = {
                -- inside station
                {
                    {x0, yp1, underpassZed},
                    {0, -2.5, 0},
                    2.4000000953674
                },
                -- below outer platform
                {
                    {x0, y0, underpassZed},
                    {0, -2.5, 0},
                    2.4000000953674
                },
                {
                    {x0, y0, underpassZed},
                    {0, -2.5, 0},
                    2.4000000953674
                },
                -- outside station
                {
                    {x0, ym1, underpassZed},
                    {0, -2.5, 0},
                    2.4000000953674
                }
            },
            speedLimit = 20,
            transportModes = {'PERSON'}
        },
        {
            -- horizontally, connected to the underpass, straight along the outer side
            --linkable = true,
            nodes = {
                -- outside station left
                {
                    {xm1, ym1, underpassZed},
                    {-10.0, 0, 0},
                    2.4000000953674
                },
                -- outside station centre
                {
                    {x0, ym1, underpassZed},
                    {-10, 0, 0},
                    2.4000000953674
                },
                {
                    {x0, ym1, underpassZed},
                    {10, 0, 0},
                    2.4000000953674
                },
                -- outside station right
                {
                    {xp1, ym1, underpassZed},
                    {10, 0, 0},
                    2.4000000953674
                }
            },
            speedLimit = 20,
            transportModes = {'PERSON'}
        },
        {
            -- horizontally into the underpass - diagonal right going in
            --linkable = true,
            nodes = {
                -- inside
                {
                    {10, yp1, underpassZed}, -- no xp1 here!
                    {-10, 0.0, 0},
                    2.4000000953674
                },
                {
                    {x0, y0, underpassZed},
                    {0, 2.5, 0},
                    2.4000000953674
                }
            },
            speedLimit = 20,
            transportModes = {'PERSON'}
        },
        {
            -- horizontally into the underpass - diagonal left going in
            --linkable = true,
            nodes = {
                -- inside
                {
                    {-10, yp1, underpassZed}, -- no xm1 here!
                    {10, 0.0, 0},
                    2.4000000953674
                },
                {
                    {x0, y0, underpassZed},
                    {0, 2.5, 0},
                    2.4000000953674
                }
            },
            speedLimit = 20,
            transportModes = {'PERSON'}
        },
        {
            -- vertically down, inner side, centre
            linkable = true,
            nodes = lolloLaneUtils.getVerticalLane(x0, yp1, underpassZed),
            speedLimit = 20,
            transportModes = {'PERSON'}
        },
        {
            -- vertically down, outer side, centre
            linkable = true,
            nodes = lolloLaneUtils.getVerticalLane(x0, ym1, underpassZed),
            speedLimit = 20,
            transportModes = {'PERSON'}
        },
        {
            -- vertically down, outer side, left
            linkable = true,
            nodes = lolloLaneUtils.getVerticalLane(xm1, ym1, underpassZed),
            speedLimit = 20,
            transportModes = {'PERSON'}
        },
        {
            -- vertically down, outer side, right
            linkable = true,
            nodes = lolloLaneUtils.getVerticalLane(xp1, ym1, underpassZed),
            speedLimit = 20,
            transportModes = {'PERSON'}
        }
    }
end

return lolloLaneUtils
