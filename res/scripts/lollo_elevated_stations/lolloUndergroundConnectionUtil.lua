return function(lods)
    local underpassZed = require('lollo_elevated_stations/lolloConstants')().underpassZed -- LOLLO we make the passenger underpass less deep
    local idTransf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1}

    local _getNode = function(x)
        return {
            {0, x, underpassZed},
            {0, 1, 0},
            2.4000000953674
        }
    end

    return {
        boundingInfo = {
            bbMax = {2.5, 20, -1},
            bbMin = {-2.5, -20, -5}
        },
        collider = {
            params = {
                halfExtents = {1.0, 1.0, 1.0}
            },
            transf = idTransf,
            type = 'BOX'
        },
        lods = lods,
        metadata = {
            transportNetworkProvider = {
                laneLists = {
                    {
                        nodes = {
                            -- across the track
                            {
                                {-2.5, 0, underpassZed},
                                {2.5, 0, 0},
                                2.4000000953674
                            },
                            {
                                {0, 0, underpassZed},
                                {2.5, 0, 0},
                                2.4000000953674
                            },
                            {
                                {0, 0, underpassZed},
                                {2.5, 0, 0},
                                2.4000000953674
                            },
                            {
                                {2.5, 0, underpassZed},
                                {2.5, 0, 0},
                                2.4000000953674
                            },
                            -- along the track
                            _getNode(-20),
                            -- _getNode(-18),
                            -- _getNode(-18),
                            -- _getNode(-17),
                            -- _getNode(-17),
                            -- _getNode(-16),
                            -- _getNode(-16),
                            -- _getNode(-15),
                            -- _getNode(-15),
                            _getNode(-14),
                            _getNode(-14),
                            -- _getNode(-13),
                            -- _getNode(-13),
                            _getNode(-12),
                            _getNode(-12),
                            _getNode(-10),
                            _getNode(-10),
                            -- _getNode(-8),
                            -- _getNode(-8),
                            -- _getNode(-7),
                            -- _getNode(-7),
                            -- _getNode(-5),
                            -- _getNode(-5),
                            -- _getNode(-3),
                            -- _getNode(-3),
                            _getNode(-2),
                            _getNode(-2),
                            _getNode(0),
                            _getNode(0),
                            _getNode(2),
                            _getNode(2),
                            -- _getNode(3),
                            -- _getNode(3),
                            -- _getNode(5),
                            -- _getNode(5),
                            -- _getNode(7),
                            -- _getNode(7),
                            -- _getNode(8),
                            -- _getNode(8),
                            _getNode(10),
                            _getNode(10),
                            _getNode(12),
                            _getNode(12),
                            -- _getNode(13),
                            -- _getNode(13),
                            _getNode(14),
                            _getNode(14),
                            -- _getNode(15),
                            -- _getNode(15),
                            -- _getNode(16),
                            -- _getNode(16),
                            -- _getNode(17),
                            -- _getNode(17),
                            -- _getNode(18),
                            -- _getNode(18),
                            _getNode(20),
                        },
                        speedLimit = 20,
                        transportModes = {'PERSON'}
                    }
                },
                runways = {},
                terminals = {}
            }
        },
        version = 1
    }
end
