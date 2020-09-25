return function(height)
    local underpassZed = require('lollo_elevated_stations/lolloConstants')().underpassZed -- LOLLO we make the passenger underpass less deep

    -- local leftAboveTransf = {0, 0.472, 0, 0, 1, 0, 0, 0, 0, 0, 1.5, 0, -9.75, -2.39, 0.707, 1}
    -- local frontAboveTransf = {2.000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1.5, 0, 0, -5, 0.707, 1}
    -- local rightAboveTransf = {0, 0.472, 0, 0, 1, 0, 0, 0, 0, 0, 1.5, 0, 9.75, -2.39, 0.707, 1}

    local topTransf = {1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 6, -5.25, 0.707, 1}
    local upperLiftShaftTransf = {0, 0, 1, 0, 0, 6, 0, 0, 14, 0, 0, 0, -14.0, -2.5, 4.0, 1}

    -- local zedZoom4Wall = (-height + 2.5) * 0.3335 -- wallBasicHeight * zoom = - (height - 3.0), approx coz there is an additional shift
    -- local zShift4Wall = 0.7 -- was -59.3
    -- local leftBelowTransf = {0, 0.55, 0, 0, 1, 0, 0, 0, 0, 0, zedZoom4Wall, 0, -9.75, -2.0, zShift4Wall, 1}
    -- local frontBelowTransf = {1.999, 0, 0, 0, 0, 1, 0, 0, 0, 0, zedZoom4Wall, 0, 0, -5, zShift4Wall, 1}
    -- local rightBelowTransf = {0, 0.55, 0, 0, 1, 0, 0, 0, 0, 0, zedZoom4Wall, 0, 9.75, -2.0, zShift4Wall, 1}
    -- local rearBelowTransf = {1.999, 0, 0, 0, 0, 1, 0, 0, 0, 0, zedZoom4Wall, 0, 0, 1, zShift4Wall, 1}

    local function _getWallsBelowPlatform()
        local results = {}

        local zShift4Wall = -1.8 + 5
        for h = 5, height, 5 do
            zShift4Wall = zShift4Wall - 5
            local zedZoom4Wall = h == 5 and 0.5 or 1
            local transf0 = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, zedZoom4Wall, 0, 6, 0.75, zShift4Wall, 1}

            results[#results + 1] = {
                -- front wall
                --materials = {'industry/oil_refinery/era_a/wall_2.mtl'},
                materials = {'lollo_trainstation_wall_grey_no_horiz_stripes.mtl'},
                -- mesh = 'lollo12x6x5room.msh',
                mesh = 'lollo12x6x5room_deco.msh',
                name = 'oil_refinery_wall_large',
                transf = transf0
            }
        end

        return results
    end
    local _wallsBelowThePlatform = _getWallsBelowPlatform()

    local zedShift4groundRoof = -height + 3.00 -- - height * .6 + 2.60
    local groundRoofTransf = {.4, 0, 0, 0, 0, .05, 0, 0, 0, 0, .05, 0, 0, -5.1, zedShift4groundRoof, 1}

    local zedShift4groundPillar = -height + 3.2
    local zedZoom4groundPillar = -1.075
    local frontLeftPillarTransf = {0.2, 0, 0, 0, 0, 1, 0, 0, 0, 0, zedZoom4groundPillar, 0, -9.0, -5, zedShift4groundPillar, 1}
    local frontRightPillarTransf = {0.2, 0, 0, 0, 0, 1, 0, 0, 0, 0, zedZoom4groundPillar, 0, 9.0, -5, zedShift4groundPillar, 1}
    local rearLeftPillarTransf = {0.2, 0, 0, 0, 0, 1, 0, 0, 0, 0, zedZoom4groundPillar, 0, -9.0, 0.5, zedShift4groundPillar, 1}
    local rearRightPillarTransf = {0.2, 0, 0, 0, 0, 1, 0, 0, 0, 0, zedZoom4groundPillar, 0, 9.0, 0.5, zedShift4groundPillar, 1}

    local groundLiftShaftTransf = {0, 0, -height / 4.0, 0, 0, 6, 0, 0, 14, 0, 0, 0, -14.0, -2.5, -height, 1}

    -- local zedShift4GroundFloor = -height - .79
    -- local groundFloorPavingTransf = {1.024, 0, 0, 0, 0, 1.30, 0, 0, 0, 0, 1, 0, 0, 1.25, zedShift4GroundFloor, 1}

    local roofTransf = {1.95, 0, 0, 0, 0, 0, 4.0, 0, 0, 1.55, 0, 0, 0.0, -5.24, 4.2, 1}
    -- local solarOneTransf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, -1.1, 5.25, 1}
    -- local solarTwoTransf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, -3.4, 5.25, 1}
    local ventOneTransf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 6, -2, 5.3, 1}
    local ventTwoTransf = {-1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, -6, -2, 5.3, 1}
    local floorPavingTransf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, -.03, 0, 1}
    local floorTransf = {1.9, 0, 0, 0, 0, 0, 1.9, 0, 0, 1.9, 0, 0, 0, -4.7, 0.32, 1}
    local idTransf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1}
    local stationMainTransf = {.6, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1}

    -- LOLLO NOTE I can make many of these, one for each height.
    -- For example, elevated_stairs_5.mdl, elevated_stairs_10.mdl, and so on.
    -- I must leave the existing elevated_stairs.mdl for compatibility with previous versions.
    -- Only the transformations above will change, if I am clever,
    -- and the height of the bounding box.

    --print('LOLLO height = ', height)
    return {
        boundingInfo = {
            bbMax = {5.8, 1.0, 5.0},
            bbMin = {-5.8, -5.0, -height}
        },
        -- LOLLO NOTE the collider here seems to have no effect.
        -- We already get it in elevated_stairs.module, so never mind
        collider = {
            params = {
                halfExtents = {5.8, 3.0, 32.0}
            },
            transf = idTransf,
            type = 'BOX'
        },
        lods = {
            {
                node = {
                    children = {
                        {
                            children = {
                                -- above the platform
                                {
                                    -- inner lift shaft
                                    materials = {'shaft.mtl'}, -- glass with a hint of colour
                                    --materials = { "station/rail/era_c/era_c_trainstation_roof_white.mtl", }, -- white, some vertical patterns
                                    --materials = {'station/rail/era_c/era_c_trainstation_glass_milk.mtl'}, -- always a fallback
                                    --materials = {'station/rail/era_c/era_c_trainstation_glass.mtl'}, -- dark mirror, always a fallback
                                    --materials = {'depot/rail/train_depot_era_a/metal_color.mtl'}, -- old dark rust
                                    --materials = {'station/air/airfield/passenger_terminal_windows_and_doors.mtl'}, -- shiny, light pattern with weird reflections
                                    --materials = {'station/air/airfield/wall_002.mtl'}, -- marmor-metal w horiz stripes
                                    --materials = {'station/air/airfield/wall_003.mtl'}, -- horiz white stripes
                                    --materials = {'station/air/airfield/wall_004.mtl'}, -- horiz wood planks
                                    --materials = {'station/air/airfield/wall_005.mtl'}, -- horiz wood mahogany
                                    --materials = {'station/air/airfield/wall_006.mtl'}, -- white marmor-metal w horiz light stripes, white
                                    --materials = { "station/rail/era_c/era_c_trainstation_special.mtl", }, -- weird, glass and some white pattern, still a fallback
                                    --materials = {'asset/commercial/era_c/com_glass.mtl'}, -- transparent with little reflection, it could be useful
                                    -- these are unsuitable
                                    --materials = {'station/harbor/harbor_window_1.mtl'}, -- mirrory glass and rust
                                    --materials = {'station/air/airfield/main_building_windows_and_doors.mtl'},
                                    --materials = {'industry/oil_well/windows_and_doors_1.mtl'}, --  looks like a bunker
                                    --materials = {'asset/industry/asset_industry_transparent_01.mtl'},
                                    -- these fail
                                    --materials = {'asset/station/rail/era_b/station_windows_and_doors_1.mtl'},
                                    --materials = {'asset/station/train/passenger/trainstation_1990_doors_and_windows_1.mtl'},
                                    --materials = {'building/era_c/res_3_3x4_03/res_1_windows_and_doors_01_mat.mtl'},
                                    --materials = {'depot/rail/train_depot_era_a/metal_floor.mtl'},
                                    --materials = {'headquarter/headquarter_era_c_05/headquarter_era_c_05_window_highrise_01.mtl'},
                                    --materials = {'headquarter/headquarter_era_c_05/headquarter_era_c_05_window_highrise_02.mtl'},
                                    --materials = {'headquarter/headquarter_era_c_05/headquarter_era_c_05_special.mtl'},
                                    --mesh = 'asset/industry/ind_chimney_3_big_single/ind_chimney_3_big_single_lod0.msh', -- this gives different results altogether
                                    --mesh = 'asset/industry/pipes_small_straight/pipes_small_straight_lod0.msh',
                                    --materials = {'station/air/airfield/passenger_terminal_windows_and_doors.mtl'},
                                    mesh = 'asset/industry/pipes_large_straight/pipes_large_straight_lod0.msh',
                                    name = 'ind_chimney_3_big_single',
                                    transf = upperLiftShaftTransf
                                },
                                {
                                    -- ticket machine upstairs right
                                    materials = {'station/road/streetstation/streetstation_1.mtl'},
                                    mesh = 'station/road/streetstation/asset/tickets_era_c_1/tickets_era_c_1_lod0.msh',
                                    name = 'tickets_era_c_1',
                                    transf = {0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 7.8, -1.5, 0.8, 1}
                                },
                                {
                                    -- ticket machine upstairs left
                                    materials = {'station/road/streetstation/streetstation_1.mtl'},
                                    mesh = 'station/road/streetstation/asset/tickets_era_c_1/tickets_era_c_1_lod0.msh',
                                    name = 'tickets_era_c_1',
                                    transf = {0, -1, 0, 0, -1, 0, 0, 0, 0, 0, 1, 0, -7.75, -2.7, 0.8, 1}
                                },
                                -- ground level
                                {
                                    -- inner lift shaft
                                    materials = {'shaft.mtl'}, -- glass with a hint of colour
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
                                -- {
                                --     -- floor paving
                                --     --materials = {'station/rail/era_c/era_c_trainstation_floor_1.mtl'}, -- same as era_c_station_floor_1.mtl
                                --     --materials = {'station/rail/era_c/era_c_station_floor_1.mtl'},
                                --     materials = {'station/road/streetstation/streetstation_perron_base_new.mtl'},
                                --     mesh = 'station/rail/era_c/station_1_main/station_1_main_perron_lod0.msh',
                                --     name = 'station_1_main_perron',
                                --     transf = groundFloorPavingTransf
                                -- },
                                {
                                    -- front left pillar
                                    materials = {'lollo_trainstation_wall_grey_no_stripes.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = frontLeftPillarTransf
                                },
                                {
                                    --front right pillar
                                    materials = {'lollo_trainstation_wall_grey_no_stripes.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = frontRightPillarTransf
                                },
                                {
                                    --rear left pillar
                                    materials = {'lollo_trainstation_wall_grey_no_stripes.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = rearLeftPillarTransf
                                },
                                {
                                    -- rear right pillar
                                    materials = {'lollo_trainstation_wall_grey_no_stripes.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = rearRightPillarTransf
                                },
                                {
                                    -- ticket machine downstairs right
                                    materials = {'station/road/streetstation/streetstation_1.mtl'},
                                    mesh = 'station/road/streetstation/asset/tickets_era_c_1/tickets_era_c_1_lod0.msh',
                                    name = 'tickets_era_c_1',
                                    transf = {0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 7.47, 0.2, -height, 1}
                                },
                                {
                                    -- ticket machine downstairs left
                                    materials = {'station/road/streetstation/streetstation_1.mtl'},
                                    mesh = 'station/road/streetstation/asset/tickets_era_c_1/tickets_era_c_1_lod0.msh',
                                    name = 'tickets_era_c_1',
                                    transf = {0, -1, 0, 0, -1, 0, 0, 0, 0, 0, 1, 0, -7.47, 0.2, -height, 1}
                                },
                                -- roof
                                {
                                    -- flat roof
                                    --materials = { "industry/oil_refinery/era_a/wall_2.mtl", },
                                    --materials = { "station/rail/era_c/era_c_trainstation_roof_white.mtl", },
                                    --materials = { "station/rail/era_c/era_c_trainstation_glass_milk.mtl", },
                                    --materials = { "asset/roof/asset_roof_decor1.mtl", },
                                    --materials = { "asset/roof/asset_roof_decor1.mtl", },
                                    --materials = { "industry/chemical_plant/wall_1.mtl", },
                                    --materials = { "industry/goods_factory/goods_factory_roof1.mtl", },
                                    --materials = { "industry/machines_factory/wall_1.mtl", },
                                    --materials = {'industry/machines_factory/roof_2.mtl'},
                                    materials = {'lollo_trainstation_wall_white.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = roofTransf
                                },
                                --[[ {
                                    --solar panel 1
                                    materials = {'asset/roof/asset_roof_decor1.mtl'},
                                    mesh = 'asset/roof/lod_0_solar_panel1.msh',
                                    transf = solarOneTransf
                                }, ]]
--[[                                 {
                                    --solar panel 2
                                    materials = {'asset/roof/asset_roof_decor1.mtl'},
                                    mesh = 'asset/roof/lod_0_solar_panel1.msh',
                                    transf = solarTwoTransf
                                }, ]]
                                {
                                    -- roof vent 1
                                    materials = {'asset/roof/asset_roof_decor1.mtl'},
                                    mesh = 'asset/roof/lod_0_ventilation_end_curved.msh',
                                    transf = ventOneTransf
                                },
                                {
                                    -- roof vent 2
                                    materials = {'asset/roof/asset_roof_decor1.mtl'},
                                    mesh = 'asset/roof/lod_0_ventilation_end_curved.msh',
                                    transf = ventTwoTransf
                                },
                                -- floor paving upstairs
                                {
                                    materials = {'station/rail/era_c/era_c_trainstation_floor_1.mtl'},
                                    mesh = 'station/rail/era_c/station_1_main/station_1_main_perron_lod0.msh',
                                    name = 'station_1_main_perron',
                                    transf = floorPavingTransf
                                },
                                -- floor structure
                                {
                                    materials = {'lollo_trainstation_wall_grey_no_horiz_stripes.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'station_1_main_floor',
                                    transf = floorTransf
                                }
                            },
                            name = 'station_1_main_grp',
                            transf = stationMainTransf
                        },
                        --[[                         {
                            animations = {
                                forever = {
                                    forward = true,
                                    params = {
                                        keyframes = {
                                            {
                                                rot = {0, 0, 0},
                                                time = 0,
                                                transl = {0, 0, 0}
                                            },
                                            {
                                                rot = {0, 0, 0},
                                                time = 4000,
                                                transl = {0, 0, -22}
                                            },
                                            {
                                                rot = {0, 0, 0},
                                                time = 6000,
                                                transl = {0, 0, -22}
                                            },
                                            {
                                                rot = {0, 0, 0},
                                                time = 10000,
                                                transl = {0, 0, 0}
                                            },
                                            {
                                                rot = {0, 0, 0},
                                                time = 12000,
                                                transl = {0, 0, 0}
                                            }
                                        },
                                        origin = {0, 0, 0}
                                    },
                                    type = 'KEYFRAME'
                                }
                            },
                            materials = {'industry/construction_material/trim_2.mtl'},
                            mesh = 'industry/construction_material/lod_0_building_2_elevator.msh',
                            --transf = { 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 2.5, 0, 30, 1, },
                            transf = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, -1, 1}
                        }, ]]
                        --[[ 						{
							animations = {
								forever = {
									forward = false,
									params = {
										keyframes = {
											{
												rot = { 0, 0, 0, },
												time = 0,
												transl = { 0, 0, 1, },
											},
											{
												rot = { 0, 0, 0, },
												time = 4000,
												transl = { 0, 0, -25, },
											},
											{
												rot = { 0, 0, 0, },
												time = 6000,
												transl = { 0, 0, -25, },
											},
											{
												rot = { 0, 0, 0, },
												time = 10000,
												transl = { 0, 0, 1, },
											},
											{
												rot = { 0, 0, 0, },
												time = 12000,
												transl = { 0, 0, 1, },
											},
										},
										origin = { 0, 0, 0, },
									},
									type = "KEYFRAME",
								},
							},
							materials = { "industry/construction_material/trim_2.mtl", },
							mesh = "industry/construction_material/lod_0_building_2_elevator.msh",
							--transf = { 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, -8.5, 0, 30, 1, },
                            transf = { 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, -2.5, 0, -1, 1, },
                        }, ]]
                        {
                            children = _wallsBelowThePlatform,
                            name = 'walls_below_the_platform',
                            transf = idTransf
                        },
                        {
                            children = {
                                {
                                    -- top
                                    --materials = { "industry/oil_refinery/era_a/wall_2.mtl", },
                                    materials = {'lollo_trainstation_wall_white_no_stripes.mtl'},
                                    --materials = { "station/rail/era_c/era_c_trainstation_glass_milk.mtl", },
                                    --materials = { "station/rail/era_c/era_c_trainstation_special.mtl", },
                                    --materials = { "asset/commercial/era_c/com_glass.mtl", },
                                    --materials = { "building/era_c/com_1_1x1_03/com_era_c_window_glass_mat.mtl", }, -- crashes
                                    --materials = { "asset/roof/asset_roof_decor1.mtl", },
                                    mesh = 'lollo12x6x5top.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = topTransf
                                }
                            },
                        },
                        {
                            children = {
                                {
                                    materials = {'station/rail/era_c/era_c_trainstation_assets.mtl'},
                                    mesh = 'era_c_single_station_name_lod0.msh',
                                    name = 'era_c_station_name',
                                    transf = idTransf
                                }
                            },
                            name = 'era_c_station_name_grp',
                            --transf = { 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, },
                            transf = {2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, -5.1, -.1, 1}
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
                                -- above the platform
                                {
                                    -- inner lift shaft
                                    materials = {'shaft.mtl'},
                                    mesh = 'asset/industry/pipes_large_straight/pipes_large_straight_lod0.msh',
                                    name = 'ind_chimney_3_big_single',
                                    transf = upperLiftShaftTransf
                                },
                                -- ground level
                                {
                                    -- inner lift shaft
                                    materials = {'shaft.mtl'},
                                    mesh = 'asset/industry/pipes_large_straight/pipes_large_straight_lod0.msh',
                                    name = 'ind_chimney_3_big_single',
                                    transf = groundLiftShaftTransf
                                },
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
                                -- {
                                --     -- floor paving
                                --     materials = {'station/road/streetstation/streetstation_perron_base_new.mtl'},
                                --     mesh = 'station/rail/era_c/station_1_main/station_1_main_perron_lod1.msh',
                                --     name = 'station_1_main_perron',
                                --     transf = groundFloorPavingTransf
                                -- },
                                {
                                    -- front left pillar
                                    materials = {'lollo_trainstation_wall_grey_no_stripes.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = frontLeftPillarTransf
                                },
                                {
                                    --front right pillar
                                    materials = {'lollo_trainstation_wall_grey_no_stripes.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = frontRightPillarTransf
                                },
                                {
                                    --rear left pillar
                                    materials = {'lollo_trainstation_wall_grey_no_stripes.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = rearLeftPillarTransf
                                },
                                {
                                    -- rear right pillar
                                    materials = {'lollo_trainstation_wall_grey_no_stripes.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = rearRightPillarTransf
                                },
                                -- roof
                                {
                                    -- flat roof
                                    materials = {'lollo_trainstation_wall_white.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = roofTransf
                                },
                                --[[ {
                                    --solar panel 1
                                    materials = {'asset/roof/asset_roof_decor1.mtl'},
                                    mesh = 'asset/roof/lod_0_solar_panel1.msh',
                                    transf = solarOneTransf
                                }, ]]
--[[                                 {
                                    --solar panel 2
                                    materials = {'asset/roof/asset_roof_decor1.mtl'},
                                    mesh = 'asset/roof/lod_0_solar_panel1.msh',
                                    transf = solarTwoTransf
                                }, ]]
                                {
                                    -- roof vent 1
                                    materials = {'asset/roof/asset_roof_decor1.mtl'},
                                    mesh = 'asset/roof/lod_0_ventilation_end_curved.msh',
                                    transf = ventOneTransf
                                },
                                {
                                    -- roof vent 2
                                    materials = {'asset/roof/asset_roof_decor1.mtl'},
                                    mesh = 'asset/roof/lod_0_ventilation_end_curved.msh',
                                    transf = ventTwoTransf
                                },
                                -- floor paving upstairs
                                {
                                    materials = {'station/rail/era_c/era_c_trainstation_floor_1.mtl'},
                                    mesh = 'station/rail/era_c/station_1_main/station_1_main_perron_lod1.msh',
                                    name = 'station_1_main_perron',
                                    transf = floorPavingTransf
                                },
                                -- floor structure
                                {
                                    materials = {'lollo_trainstation_wall_grey_no_horiz_stripes.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'station_1_main_floor',
                                    transf = floorTransf
                                }
                            },
                            name = 'station_1_main_grp',
                            transf = stationMainTransf
                        },
                        {
                            children = _wallsBelowThePlatform,
                            name = 'walls_below_the_platform',
                            transf = idTransf
                        },
                        {
                            children = {
                                {
                                    -- top
                                    --materials = { "industry/oil_refinery/era_a/wall_2.mtl", },
                                    materials = {'lollo_trainstation_wall_white_no_stripes.mtl'},
                                    --materials = { "station/rail/era_c/era_c_trainstation_glass_milk.mtl", },
                                    --materials = { "station/rail/era_c/era_c_trainstation_special.mtl", },
                                    --materials = { "asset/commercial/era_c/com_glass.mtl", },
                                    --materials = { "building/era_c/com_1_1x1_03/com_era_c_window_glass_mat.mtl", }, -- crashes
                                    --materials = { "asset/roof/asset_roof_decor1.mtl", },
                                    mesh = 'lollo12x6x5top.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = topTransf
                                }
                            },
                        },
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
                                -- ground level
                                -- {
                                --     -- floor paving
                                --     materials = {'station/road/streetstation/streetstation_perron_base_new.mtl'},
                                --     mesh = 'station/rail/era_c/station_1_main/station_1_main_perron_lod2.msh',
                                --     name = 'station_1_main_perron',
                                --     transf = groundFloorPavingTransf
                                -- },
                                {
                                    -- front left pillar
                                    materials = {'lollo_trainstation_wall_grey_no_stripes.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = frontLeftPillarTransf
                                },
                                {
                                    --front right pillar
                                    materials = {'lollo_trainstation_wall_grey_no_stripes.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = frontRightPillarTransf
                                },
                                {
                                    --rear left pillar
                                    materials = {'lollo_trainstation_wall_grey_no_stripes.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = rearLeftPillarTransf
                                },
                                {
                                    -- rear right pillar
                                    materials = {'lollo_trainstation_wall_grey_no_stripes.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = rearRightPillarTransf
                                },
                                -- roof
                                {
                                    -- flat roof
                                    materials = {'lollo_trainstation_wall_white.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = roofTransf
                                },
                                -- floor paving upstairs
                                {
                                    materials = {'station/rail/era_c/era_c_trainstation_floor_1.mtl'},
                                    mesh = 'station/rail/era_c/station_1_main/station_1_main_perron_lod2.msh',
                                    name = 'station_1_main_perron',
                                    transf = floorPavingTransf
                                },
                                -- floor structure
                                {
                                    materials = {'lollo_trainstation_wall_grey_no_horiz_stripes.mtl'},
                                    mesh = 'industry/oil_refinery/era_a/oil_refinery_wall_large/oil_refinery_wall_large_lod0.msh',
                                    name = 'station_1_main_floor',
                                    transf = floorTransf
                                }
                            },
                            name = 'station_1_main_grp',
                            transf = stationMainTransf
                        },
                        {
                            children = _wallsBelowThePlatform,
                            name = 'walls_below_the_platform',
                            transf = idTransf
                        },
                        {
                            children = {
                                {
                                    -- top
                                    --materials = { "industry/oil_refinery/era_a/wall_2.mtl", },
                                    materials = {'lollo_trainstation_wall_white_no_stripes.mtl'},
                                    --materials = { "station/rail/era_c/era_c_trainstation_glass_milk.mtl", },
                                    --materials = { "station/rail/era_c/era_c_trainstation_special.mtl", },
                                    --materials = { "asset/commercial/era_c/com_glass.mtl", },
                                    --materials = { "building/era_c/com_1_1x1_03/com_era_c_window_glass_mat.mtl", }, -- crashes
                                    --materials = { "asset/roof/asset_roof_decor1.mtl", },
                                    mesh = 'lollo12x6x5top.msh',
                                    name = 'oil_refinery_wall_large',
                                    transf = topTransf
                                }
                            },
                        },
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
                        transf = {1, 0, 0, 0, 0, 0, 1, 0, 0, -1, 0, 0, -2.6, -5.333, .23, 1},
                        type = 'STATION_NAME',
                        verticalAlignment = 'CENTER'
                    }
                }
            },
            transportNetworkProvider = {
                laneLists = {
                    {
                        -- horizontally into the platform, left
                        nodes = {
                            {
                                {-0.5, 1.5, 0.80000001192093},
                                {0.5, -1.5, 0},
                                2.4000000953674
                            },
                            {
                                {0, 0, 0.80000001192093},
                                {0.5, -1.5, 0},
                                2.4000000953674
                            }
                        },
                        speedLimit = 20,
                        transportModes = {'PERSON'}
                    },
                    {
                        -- horizontally into the platform, right
                        nodes = {
                            {
                                {0.5, 1.5, 0.80000001192093},
                                {-0.5, -1.5, 0},
                                2.4000000953674
                            },
                            {
                                {0, 0, 0.80000001192093},
                                {-0.5, -1.5, 0},
                                2.4000000953674
                            }
                        },
                        speedLimit = 20,
                        transportModes = {'PERSON'}
                    },
                    {
                        -- down the stairs
                        linkable = true,
                        nodes = {
                            {
                                {0, 0, 0.80000001192093},
                                {0, -1, 0},
                                2.4000000953674
                            },
                            {
                                {0, -2, 0.80000001192093},
                                {0, -1, 0},
                                2.4000000953674
                            },
                            {
                                {0, -2, 0.80000001192093},
                                {0, -1, 0},
                                2.4000000953674
                            },
                            {
                                {0, -2.5, 0},
                                {0, -1, 0},
                                2.4000000953674
                            }
                        },
                        speedLimit = 20,
                        transportModes = {'PERSON'}
                    },
                    {
                        -- horizontally into the along underpass, left
                        nodes = {
                            {
                                {-2, 2.5, underpassZed},
                                {1, -1, 0},
                                2.4000000953674
                            },
                            {
                                {0, 0, underpassZed},
                                {0, -2.5, 0},
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
                                {2, 2.5, underpassZed},
                                {-1, -1, 0},
                                2.4000000953674
                            },
                            {
                                {0, 0, underpassZed},
                                {0, -2.5, 0},
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
                                {0, -0, underpassZed},
                                {0, -2.5, 0},
                                2.4000000953674
                            },
                            {
                                {0, -2.5, underpassZed},
                                {0, -2.5, 0},
                                2.4000000953674
                            }
                        },
                        speedLimit = 20,
                        transportModes = {'PERSON'}
                    },
                    {
                        -- out toward the back
                        nodes = {
                            {
                                {0, 0.3, -height},
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
                    },
                    {
                        -- sideways, to connect extra elements
                        nodes = {
                            {
                                {-6, -2.5, -height},
                                {1, 0, 0},
                                2.4
                            },
                            {
                                {0, -2.5, -height},
                                {1, 0, 0},
                                2.4
                            },
                            {
                                {0, -2.5, -height},
                                {1, 0, 0},
                                2.4
                            },
                            {
                                {6, -2.5, -height},
                                {1, 0, 0},
                                2.4
                            },
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
                                    {0, -2.5, 0},
                                    {0, 0, -1}, -- 0, 0, 0 crashes, 0, 0, -1 and 0, 0, 1 hide the people, 0, 1, 0 and 1, 0, 0 have them walk while being lifted
                                    2.4
                                },
                                {
                                    {0, -2.5, underpassZed},
                                    {0, 0, -1},
                                    2.4
                                },
                                {
                                    {0, -2.5, underpassZed},
                                    {0, 0, -1},
                                    2.4
                                },
                                {
                                    {0, -2.5, -height},
                                    {0, 0, -1},
                                    2.4
                                },
                                {
                                    {0, -2.5, -height},
                                    {0, -1, 0},
                                    2.4
                                },
                                {
                                    {0, -5, -height},
                                    {0, -1, 0},
                                    2.4
                                }
                            },
                            speedLimit = 20,
                            transportModes = {'PERSON'}
                        } or
                        {
                            -- straight down and then out
                            -- LOLLO NOTE alter the sequence if underpassZed changes!
                            linkable = true,
                            nodes = {
                                {
                                    {0, -2.5, 0},
                                    {0, 0, -1}, -- 0, 0, 0 crashes, 0, 0, -1 and 0, 0, 1 hide the people, 0, 1, 0 and 1, 0, 0 have them walk while being lifted
                                    2.4
                                },
                                {
                                    {0, -2.5, underpassZed},
                                    {0, 0, -1},
                                    2.4
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
