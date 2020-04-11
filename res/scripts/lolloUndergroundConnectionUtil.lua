return function(isHasTop)
    local underpassZed = require('lolloConstants')().underpassZed -- LOLLO we make the passenger underpass less deep

    local floorTransf = {0, 4.0, 0, 0, 0, 0, 1, 0, 1.60, 0, 0, 0, -2.40, -0.0, -3.45, 1}
    local leftWallTransf = {0, 4.0, 0, 0, 1, 0, 0, 0, 0, 0, 1.450, 0, 2.26, -0.0, -3.6, 1}
    local rightWallTransf = {0, 4.0, 0, 0, 1, 0, 0, 0, 0, 0, 1.450, 0, -2.26, -0.0, -3.6, 1}
    local foreWallTransf = {.49, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1.3, 0, 0, -19.8, -3.5, 1}
    local aftWallTransf = {.49, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1.3, 0, 0, 19.8, -3.5, 1}
    local idTransf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1}

    return {
        boundingInfo = {
            bbMax = {2.5, 30, -1},
            bbMin = {-2.5, -30, -5}
        },
        collider = {
            params = {},
            transf = idTransf,
            type = 'NONE'
        },
        lods = {
            {
                node = {
                    children = {
                        {
                            -- left wall
                            materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                            mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                            name = 'oil_refinery_wall_large',
                            transf = leftWallTransf
                        },
                        {
                            -- right wall
                            materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                            mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                            name = 'oil_refinery_wall_large',
                            transf = rightWallTransf
                        },
                        {
                            -- fore wall
                            materials = {'station/rail/era_c/era_c_trainstation_wall_white.mtl'},
                            mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                            name = 'oil_refinery_wall_large',
                            transf = foreWallTransf
                        },
                        {
                            -- aft wall
                            materials = {'station/rail/era_c/era_c_trainstation_wall_white.mtl'},
                            mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                            name = 'oil_refinery_wall_large',
                            transf = aftWallTransf
                        },
                        {
                            -- floor
                            materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                            mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                            name = 'oil_refinery_wall_large',
                            transf = floorTransf
                        },
                        -- I make 4 track covers coz the texture looks better
                        isHasTop and {
                            -- top (track cover) 1
                            --materials = {'depot/rail/train_depot_era_a/concrete.mtl'},
                            --materials = {'asset/ground/dam_texture_02_mat.mtl'},
                            --materials = {'industry/oil_refinery/era_a/wall_2.mtl'},
                            materials = {'wall_2.mtl'},
                            mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                            name = 'oil_refinery_wall_large',
                            transf = {0, 1.0, 0, 0, 0, 0, 1, 0, 1.35, 0, 0, 0, -2.04, -15.0, 0.14, 1}
                        } or nil,
                        isHasTop and {
                            -- top (track cover) 2
                            materials = {'wall_2.mtl'},
                            mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                            name = 'oil_refinery_wall_large',
                            transf = {0, 1.0, 0, 0, 0, 0, 1, 0, 1.35, 0, 0, 0, -2.04, -5.0, 0.14, 1}
                        } or nil,
                        isHasTop and {
                            -- top (track cover) 3
                            materials = {'wall_2.mtl'},
                            mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                            name = 'oil_refinery_wall_large',
                            transf = {0, 1.0, 0, 0, 0, 0, 1, 0, 1.35, 0, 0, 0, -2.04, 5.0, 0.14, 1}
                        } or nil,
                        isHasTop and {
                            -- top (track cover) 4
                            materials = {'wall_2.mtl'},
                            mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                            name = 'oil_refinery_wall_large',
                            transf = {0, 1.0, 0, 0, 0, 0, 1, 0, 1.35, 0, 0, 0, -2.04, 15.0, 0.14, 1}
                        } or nil
                    },
                    name = 'RootNode',
                    transf = idTransf
                },
                static = false,
                visibleFrom = 0,
                visibleTo = 5000
            }
        },
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
