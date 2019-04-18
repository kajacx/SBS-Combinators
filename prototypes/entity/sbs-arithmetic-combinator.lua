require ("prototypes.entity.combinator-pictures")

data:extend({
  generate_arithmetic_combinator({ 
	  type = "arithmetic-combinator",
    name = "sbs-arithmetic-combinator",
    icon = "__SBS-Combinators__/graphics/entity/sbs-arithmetic-combinator.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "sbs-arithmetic-combinator"},
	  fast_replaceable_group = "arithmetic-combinator",
    max_health = 120,
    corpse = "small-remnants",

    collision_box = {{-0.35, -0.65}, {0.35, 0.65}},
    selection_box = {{-0.5, -1}, {0.5, 1}},

    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    active_energy_usage = "1KW",

    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/combinator.ogg",
        volume = 0.45
      },
      max_sounds_per_type = 2,
      match_speed_to_activity = true
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },

    activity_led_light =
    {
      intensity = 0.8,
      size = 1,
      color = {r = 1.0, g = 1.0, b = 1.0}
    },

    activity_led_light_offsets =
    {
      {0.234375, -0.484375},
      {0.5, 0},
      {-0.265625, 0.140625},
      {-0.453125, -0.359375}
    },

    screen_light =
    {
      intensity = 0.3,
      size = 0.6,
      color = {r = 1.0, g = 1.0, b = 1.0}
    },

    screen_light_offsets =
    {
      {0.015625, -0.234375},
      {0.015625, -0.296875},
      {0.015625, -0.234375},
      {0.015625, -0.296875}
    },

    input_connection_bounding_box = {{-0.5, 0}, {0.5, 1}},
    output_connection_bounding_box = {{-0.5, -1}, {0.5, 0}},

    circuit_wire_max_distance = 9
  })
})
