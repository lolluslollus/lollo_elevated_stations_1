return function(height)
    local underpassZed = require('lollo_elevated_stations/lolloConstants')().underpassZed -- LOLLO we make the passenger underpass less deep

    -- local zedZoom4Wall = (-height + 2.5) * .333 -- wallBasicHeight * zoom = - (height - 3.0), approx coz there is an additional shift
    -- local zedZoom4Wall = (-height + 5.5) * .333 -- wallBasicHeight * zoom = - (height - 3.0), approx coz there is an additional shift
    local zedZoom4Wall = (-height + 6.5) * .333 -- wallBasicHeight * zoom = - (height - 3.0), approx coz there is an additional shift
    local zShift4Wall = -3.3
    local leftBelowTransf = {0, 0.39, 0, 0, 1, 0, 0, 0, 0, 0, zedZoom4Wall, 0, -9.75, -0.3, zShift4Wall, 1}
    local frontBelowTransf = {1.999, 0, 0, 0, 0, 1, 0, 0, 0, 0, zedZoom4Wall, 0, 0, -2.5, zShift4Wall, 1}
    local rightBelowTransf = {0, 0.39, 0, 0, 1, 0, 0, 0, 0, 0, zedZoom4Wall, 0, 9.75, -0.3, zShift4Wall, 1}
    local rearBelowTransf = {1.999, 0, 0, 0, 0, 1, 0, 0, 0, 0, zedZoom4Wall, 0, 0, 1.9, zShift4Wall, 1}

    local zedShift4groundRoof = -height + 3.00 -- - height * .6 + 2.60
    local groundRoofTransf = {.4, 0, 0, 0, 0, .05, 0, 0, 0, 0, .05, 0, 0, -2.6, zedShift4groundRoof, 1}

    local zedShift4groundPillar = -height + 3.25
    local zedZoom4groundPillar = -1.08
    local frontLeftPillarTransf = {.2, 0, 0, 0, 0, 2, 0, 0, 0, 0, zedZoom4groundPillar, 0, -9.0, -2.25, zedShift4groundPillar, 1}
    local frontRightPillarTransf = {.2, 0, 0, 0, 0, 2, 0, 0, 0, 0, zedZoom4groundPillar, 0, 9.0, -2.25, zedShift4groundPillar, 1}
    local rearLeftPillarTransf = {.2, 0, 0, 0, 0, 2, 0, 0, 0, 0, zedZoom4groundPillar, 0, -9.0, 1.65, zedShift4groundPillar, 1}
    local rearRightPillarTransf = {.2, 0, 0, 0, 0, 2, 0, 0, 0, 0, zedZoom4groundPillar, 0, 9.0, 1.65, zedShift4groundPillar, 1}

    local groundLiftShaftTransf = {0, 0, -height / 4.0, 0, 0, 6, 0, 0, 14, 0, 0, 0, -14.0, 0, -height, 1}
    -- local broadGroundLiftShaftTransf = {0, 0, -0.87, 0, 0, 10.3, 0, 0, 40, 0, 0, 0, -40.0, -0.3, -5, 1}

    local idTransf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1}
    local stationMainTransf = {.6, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1}

    -- LOLLO NOTE I can make many of these, one for each height.
    -- For example, platform_lifts_5.mdl, platform_lifts_10.mdl, and so on.
    -- Only the transformations above will change, if I am clever,
    -- and the height of the bounding box.

    --print('LOLLO height = ', height)
    return {
        boundingInfo = {
            -- bbMax = {5.8, 1.0, 1.0},
            bbMax = {5.8, 2.0, 1.0},
            bbMin = {-5.8, -2.6, -height}
        },
        -- LOLLO NOTE the collider here seems to have no effect.
        -- We already get it in platform_lifts.module, so never mind
        collider = {
            -- params = {
            --     halfExtents = {5.8, 2.4, 32.0}
            -- },
            -- transf = idTransf,
            -- type = 'BOX'
            params = {},
            transf = idTransf,
            type = 'MESH'
        },
        lods = {
            {
                node = {
                    children = {
                        {
                            children = {
                                -- walls below the platform
                                height > 5 and {
                                    -- front wall
                                    --materials = {'industry/oil_refinery/era_a/wall_2.mtl'},
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    --materials = { "station/rail/era_c/era_c_trainstation_glass_milk.mtl", },
                                    --materials = { "station/rail/era_c/era_c_trainstation_special.mtl", },
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = frontBelowTransf
                                } or nil,
                                -- {
                                --     materials = {'station/air/airport/shared/era_b_airport_windows_trans.mtl'}, -- glass with a hint of colour
                                --     mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                --     name = 'oil_refinery_wall_large',
                                --     transf = frontBelowTransf
                                -- },
                                height > 5 and {
                                    --rear wall
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = rearBelowTransf
                                } or nil,
                                height > 5 and {
                                    --right wall
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = rightBelowTransf
                                } or nil,
                                height > 5 and {
                                    -- left wall
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = leftBelowTransf
                                } or nil,
                                -- ground level
                                {
                                    -- inner lift shaft
                                    materials = {'station/air/airport/shared/era_b_airport_windows_trans.mtl'}, -- glass with a hint of colour
                                    --materials = { "station/rail/era_c/era_c_trainstation_roof_white.mtl", },
                                    --materials = {'station/rail/era_c/era_c_trainstation_glass_milk.mtl'},
                                    --materials = {'station/harbor/harbor_window_1.mtl'}, -- mirrory glass and rust
                                    --materials = {'depot/rail/train_depot_era_a/metal_color.mtl'}, -- old dark rust
                                    --materials = {'station/air/airfield/passenger_terminal_windows_and_doors.mtl'}, -- shiny, light pattern
                                    --materials = {'station/air/airfield/main_building_windows_and_doors.mtl'},
                                    --materials = {'station/air/airfield/wall_002.mtl'}, -- marmor-metal
                                    --materials = {'station/air/airfield/wall_003.mtl'}, -- marble column
                                    -- these are unsuitable
                                    --materials = {'station/air/asset/asset_tf2/asset_transparent.mtl'},
                                    --materials = {'station/harbor/harbor_windows_and_doors_3.mtl'},
                                    --materials = {'station/harbor/harbor_windows_and_doors_2.mtl'},
                                    --materials = {'station/harbor/harbor_windows_and_doors_1.mtl'},
                                    --materials = {'station/rail/cargo/cargo_station_windows_and_doors_2.mtl'},
                                    --materials = {'station/rail/cargo/cargo_station_windows_and_doors_1.mtl'},
                                    --materials = {'station/rail/era_c/era_c_trainstation_details_1.mtl'},
                                    --materials = { "station/rail/era_c/era_c_trainstation_special.mtl", }, -- weird, glass and some pattern
                                    --materials = {'asset/industry/asset_industry_transparent_01.mtl'},
                                    -- these fail
                                    --materials = {'station/air/asset/asset_tf2/asset_transparent_skinned.mtl'},
                                    --materials = {'building/era_c/res_3_3x4_03/res_1_windows_and_doors_01_mat.mtl'},
                                    --materials = {'depot/rail/train_depot_era_a/metal_floor.mtl'},
                                    --materials = {'headquarter/headquarter_era_c_05/headquarter_era_c_05_window_highrise_01.mtl'},
                                    --materials = {'headquarter/headquarter_era_c_05/headquarter_era_c_05_window_highrise_02.mtl'},
                                    --materials = {'headquarter/headquarter_era_c_05/headquarter_era_c_05_special.mtl'},
                                    --mesh = 'asset/industry/ind_chimney_3_big_single/ind_chimney_3_big_single_lod0.msh',
                                    --mesh = 'asset/industry/pipes_small_straight/pipes_small_straight_lod0.msh',
                                    mesh = 'asset/industry/pipes_large_straight/pipes_large_straight_lod0.msh',
                                    name = 'ind_chimney_3_big_single',
                                    transf = groundLiftShaftTransf
                                },
                                -- height <= 5 and {
                                --     -- outer, low lift shaft
                                --     materials = {'station/air/airport/shared/era_b_airport_windows_trans.mtl'}, -- glass with a hint of colour
                                --     mesh = 'asset/industry/pipes_large_straight/pipes_large_straight_lod0.msh',
                                --     name = 'ind_chimney_3_big_single',
                                --     transf = broadGroundLiftShaftTransf
                                -- } or nil,
                                {
                                    -- entrance roof
                                    materials = {
                                        'station/rail/era_c/era_c_trainstation_borders_1.mtl',
                                        'station/rail/era_c/era_c_trainstation_roof_wood.mtl',
                                        'station/rail/era_c/era_c_trainstation_roof_white.mtl',
                                        'station/rail/era_c/era_c_trainstation_modeling_tmp.mtl'
                                    },
                                    mesh = 'station/rail/era_c/station_3_roof_perron_side/station_3_roof_perron_side_lod0.msh',
                                    name = 'station_3_roof_perron_side',
                                    transf = groundRoofTransf
                                },
                                {
                                    -- front left pillar
                                    --materials = {'industry/oil_refinery/era_a/wall_2.mtl'},
                                    --materials = { "station/rail/era_c/era_c_trainstation_glass_milk.mtl", },
                                    --materials = { "station/rail/era_c/era_c_trainstation_special.mtl", },
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = frontLeftPillarTransf
                                },
                                {
                                    --front right pillar
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = frontRightPillarTransf
                                },
                                {
                                    --rear left pillar
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = rearLeftPillarTransf
                                },
                                {
                                    -- rear right pillar
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = rearRightPillarTransf
                                },
                                {
                                    -- ticket machine right
                                    materials = {'station/road/streetstation/streetstation_1.mtl'},
                                    mesh = 'station/road/streetstation/asset/tickets_era_c_1/tickets_era_c_1_lod0.msh',
                                    name = 'tickets_era_c_1',
                                    transf = {0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 7.47, 1.6, -height, 1}
                                },
                                {
                                    -- ticket machine left
                                    materials = {'station/road/streetstation/streetstation_1.mtl'},
                                    mesh = 'station/road/streetstation/asset/tickets_era_c_1/tickets_era_c_1_lod0.msh',
                                    name = 'tickets_era_c_1',
                                    transf = {0, -1, 0, 0, -1, 0, 0, 0, 0, 0, 1, 0, -7.47, 1.6, -height, 1}
                                },
                            },
                            name = 'station_1_main_grp',
                            transf = stationMainTransf
                        },
                        {
                            children = {
                                {
                                    materials = {'station/rail/era_c/era_c_trainstation_assets.mtl'},
                                    mesh = 'station/rail/asset/era_c_station_name/era_c_station_name_lod0.msh',
                                    name = 'era_c_station_name',
                                    transf = idTransf
                                }
                            },
                            name = 'era_c_station_name_grp',
                            --transf = { 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, },
                            transf = {2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, -2.6, -.1, 1}
                        }
                    },
                    name = 'RootNode',
                    transf = idTransf
                },
                static = false,
                visibleFrom = 0,
                visibleTo = 100
            },
            {
                node = {
                    children = {
                        {
                            children = {
                                -- walls below the platform
                                height > 5 and {
                                    -- front wall
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = frontBelowTransf
                                } or nil,
                                -- {
                                --     materials = {'station/air/airport/shared/era_b_airport_windows_trans.mtl'}, -- glass with a hint of colour
                                --     mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                --     name = 'oil_refinery_wall_large',
                                --     transf = frontBelowTransf
                                -- },
                                height > 5 and {
                                    --rear wall
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = rearBelowTransf
                                } or nil,
                                height > 5 and {
                                    --right wall
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = rightBelowTransf
                                } or nil,
                                height > 5 and {
                                    -- left wall
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = leftBelowTransf
                                } or nil,
                                -- ground level
                                {
                                    -- inner lift shaft
                                    materials = {'station/air/airport/shared/era_b_airport_windows_trans.mtl'},
                                    mesh = 'asset/industry/pipes_large_straight/pipes_large_straight_lod0.msh',
                                    name = 'ind_chimney_3_big_single',
                                    transf = groundLiftShaftTransf
                                },
                                -- height <= 5 and {
                                --     -- outer, low lift shaft
                                --     materials = {'station/air/airport/shared/era_b_airport_windows_trans.mtl'}, -- glass with a hint of colour
                                --     mesh = 'asset/industry/pipes_large_straight/pipes_large_straight_lod0.msh',
                                --     name = 'ind_chimney_3_big_single',
                                --     transf = broadGroundLiftShaftTransf
                                -- } or nil,
                                {
                                    -- entrance roof
                                    materials = {
                                        'station/rail/era_c/era_c_trainstation_borders_1.mtl',
                                        'station/rail/era_c/era_c_trainstation_roof_wood.mtl',
                                        'station/rail/era_c/era_c_trainstation_roof_white.mtl',
                                        'station/rail/era_c/era_c_trainstation_modeling_tmp.mtl'
                                    },
                                    mesh = 'station/rail/era_c/station_3_roof_perron_side/station_3_roof_perron_side_lod0.msh',
                                    name = 'station_3_roof_perron_side',
                                    transf = groundRoofTransf
                                },
                                {
                                    -- front left pillar
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = frontLeftPillarTransf
                                },
                                {
                                    --front right pillar
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = frontRightPillarTransf
                                },
                                {
                                    --rear left pillar
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = rearLeftPillarTransf
                                },
                                {
                                    -- rear right pillar
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = rearRightPillarTransf
                                },
                            },
                            name = 'station_1_main_grp',
                            transf = stationMainTransf
                        }
                    },
                    name = 'RootNode',
                    transf = idTransf
                },
                static = false,
                visibleFrom = 100,
                visibleTo = 400
            },
            {
                node = {
                    children = {
                        {
                            children = {
                                -- walls below the platform
                                height > 5 and {
                                    -- front wall
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = frontBelowTransf
                                } or nil,
                                height > 5 and {
                                    --rear wall
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = rearBelowTransf
                                } or nil,
                                height > 5 and {
                                    --right wall
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = rightBelowTransf
                                } or nil,
                                height > 5 and {
                                    -- left wall
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = leftBelowTransf
                                } or nil,
                                {
                                    -- front left pillar
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = frontLeftPillarTransf
                                },
                                {
                                    --front right pillar
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = frontRightPillarTransf
                                },
                                {
                                    --rear left pillar
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = rearLeftPillarTransf
                                },
                                {
                                    -- rear right pillar
                                    materials = {'station/rail/era_c/era_c_trainstation_wall_grey.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = rearRightPillarTransf
                                },
                            },
                            name = 'station_1_main_grp',
                            transf = stationMainTransf
                        }
                    },
                    name = 'RootNode',
                    transf = idTransf
                },
                static = false,
                visibleFrom = 400,
                visibleTo = 3500
            }
        },
        metadata = {
            labelList = {
                labels = {
                    {
                        alignment = 'CENTER',
                        alphaMode = 'BLEND',
                        childId = 'RootNode',
                        fitting = 'SCALE',
                        nLines = 1,
                        size = {5.2, .6},
                        transf = {1, 0, 0, 0, 0, 0, 1, 0, 0, -1, 0, 0, -2.6, -2.833, .23, 1},
                        type = 'STATION_NAME',
                        verticalAlignment = 'CENTER'
                    }
                }
            },
            transportNetworkProvider = {
                laneLists = {
                    {
                        -- horizontally into the along underpass, left
                        nodes = {
                            {
                                {2, -0.3, underpassZed},
                                {-2, 0.3, 0},
                                2.4000000953674
                            },
                            {
                                {0, 0, underpassZed},
                                {-2, 0.3, 0},
                                2.4000000953674
                            }
                        },
                        speedLimit = 20,
                        transportModes = {'PERSON'}
                    },
                    {
                        -- horizontally into the along underpass, right
                        nodes = {
                            {
                                {-2, -0.3, underpassZed},
                                {2, 0.3, 0},
                                2.4000000953674
                            },
                            {
                                {0, 0, underpassZed},
                                {2, 0.3, 0},
                                2.4000000953674
                            }
                        },
                        speedLimit = 20,
                        transportModes = {'PERSON'}
                    },
                    {
                        -- horizontally into the across underpass
                        nodes = {
                            {
                                {0, -0.3, underpassZed},
                                {0, 0.3, 0},
                                2.4000000953674
                            },
                            {
                                {0, 0, underpassZed},
                                {0, 0.3, 0},
                                2.4000000953674
                            }
                        },
                        speedLimit = 20,
                        transportModes = {'PERSON'}
                    },
                    height > 0 and
                        {
                            -- straight down and then out
                            -- LOLLO NOTE alter the sequence if underpassZed changes!
                            linkable = true,
                            nodes = {
                                {
                                    {0, 0, underpassZed},
                                    {0, 0, -1},
                                    2.4
                                },
                                {
                                    {0, 0, -height},
                                    {0, 0, -1},
                                    2.4
                                },
                                {
                                    {0, 0, -height},
                                    {0, -1, 0},
                                    2.4
                                },
                                {
                                    {0, -2.5, -height},
                                    {0, -1, 0},
                                    2.4
                                }
                            },
                            speedLimit = 20,
                            transportModes = {'PERSON'}
                        } or nil
                },
                runways = {},
                terminals = {}
            }
        },
        version = 1
    }
end