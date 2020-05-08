return function(lods)
    local underpassZed = require('lollo_elevated_stations/lolloConstants')().underpassZed -- LOLLO we make the passenger underpass less deep

    local idTransf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1}

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
                            --[[ 						{
							{ -5, 0, underpassZed, },
							{ 2.5, 0, 0, },
							2.4000000953674,
						},
						{
							{ -2.5, 0, underpassZed, },
							{ 2.5, 0, 0, },
							2.4000000953674,
						},
 ]] {
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
                            --[[ {
							{ 2.5, 0, underpassZed, },
							{ 2.5, 0, 0, },
							2.4000000953674,
						},
						{
							{ 5, 0, underpassZed, },
							{ 2.5, 0, 0, },
							2.4000000953674,
						}, ]]
                            -- along the track
                            {
                                {0, -20, underpassZed},
                                {0, 1, 0},
                                2.4000000953674
                            },
                            {
                                {0, -15, underpassZed},
                                {0, 1, 0},
                                2.4000000953674
                            },
                            {
                                {0, -15, underpassZed},
                                {0, 1, 0},
                                2.4000000953674
                            },
                            {
                                {0, -10, underpassZed},
                                {0, 1, 0},
                                2.4000000953674
                            },
                            {
                                {0, -10, underpassZed},
                                {0, 1, 0},
                                2.4000000953674
                            },
                            {
                                {0, -5, underpassZed},
                                {0, 1, 0},
                                2.4000000953674
                            },
                            {
                                {0, -5, underpassZed},
                                {0, 1, 0},
                                2.4000000953674
                            },
                            {
                                {0, 0, underpassZed},
                                {0, 1, 0},
                                2.4000000953674
                            },
                            {
                                {0, 0, underpassZed},
                                {0, 1, 0},
                                2.4000000953674
                            },
                            {
                                {0, 5, underpassZed},
                                {0, 1, 0},
                                2.4000000953674
                            },
                            {
                                {0, 5, underpassZed},
                                {0, 1, 0},
                                2.4000000953674
                            },
                            {
                                {0, 10, underpassZed},
                                {0, 1, 0},
                                2.4000000953674
                            },
                            {
                                {0, 10, underpassZed},
                                {0, 1, 0},
                                2.4000000953674
                            },
                            {
                                {0, 15, underpassZed},
                                {0, 1, 0},
                                2.4000000953674
                            },
                            {
                                {0, 15, underpassZed},
                                {0, 1, 0},
                                2.4000000953674
                            },
                            {
                                {0, 20, underpassZed},
                                {0, 1, 0},
                                2.4000000953674
                            }
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
