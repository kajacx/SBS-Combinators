require ("prototypes.entity.combinator-pictures")

data:extend({
  generate_decider_combinator({ 
	  type = "decider-combinator",
    name = "sbs-decider-combinator",
    icon = "__SBS-Combinators__/graphics/entity/sbs-decider-combinator.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "sbs-decider-combinator"},
	  fast_replaceable_group = "decider-combinator",
    max_health = 150,
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

    activity_led_light =
    {
      intensity = 0.8,
      size = 1,
      color = {r = 1.0, g = 1.0, b = 1.0}
    },

    activity_led_light_offsets =
    {
      {0.265625, -0.53125},
      {0.515625, -0.078125},
      {-0.25, 0.03125},
      {-0.46875, -0.5}
    },

    screen_light =
    {
      intensity = 0.3,
      size = 0.6,
      color = {r = 1.0, g = 1.0, b = 1.0}
    },

    screen_light_offsets =
    {
      {0.015625, -0.265625},
      {0.015625, -0.359375},
      {0.015625, -0.265625},
      {0.015625, -0.359375}
    },

    input_connection_bounding_box = {{-0.5, 0}, {0.5, 1}},
    output_connection_bounding_box = {{-0.5, -1}, {0.5, 0}},

    input_connection_points =
    {
      {
        shadow =
        {
          red = {0.328125, 0.703125},
          green = {0.859375, 0.703125}
        },
        wire =
        {
          red = {-0.28125, 0.34375},
          green = {0.25, 0.34375}
        }
      },
      {
        shadow =
        {
          red = {-0.265625, -0.171875},
          green = {-0.296875, 0.296875}
        },
        wire =
        {
          red = {-0.75, -0.5},
          green = {-0.75, -0.0625}
        }
      },
      {
        shadow =
        {
          red = {0.828125, -0.359375},
          green = {0.234375, -0.359375}
        },
        wire =
        {
          red = {0.25, -0.71875},
          green = {-0.28125, -0.71875}
        }
      },
      {
        shadow =
        {
          red = {1.29688, 0.328125},
          green = {1.29688, -0.140625}
        },
        wire =
        {
          red = {0.75, -0.0625},
          green = {0.75, -0.53125}
        }
      }
    },

    output_connection_points =
    {
      {
        shadow =
        {
          red = {0.234375, -0.453125},
          green = {0.828125, -0.453125}
        },
        wire =
        {
          red = {-0.3125, -0.78125},
          green = {0.28125, -0.78125}
        }
      },
      {
        shadow =
        {
          red = {1.17188, -0.109375},
          green = {1.17188, 0.296875}
        },
        wire =
        {
          red = {0.65625, -0.4375},
          green = {0.65625, -0.03125}
        }
      },
      {
        shadow =
        {
          red = {0.828125, 0.765625},
          green = {0.234375, 0.765625}
        },
        wire =
        {
          red = {0.28125, 0.40625},
          green = {-0.3125, 0.40625}
        }
      },
      {
        shadow =
        {
          red = {-0.140625, 0.328125},
          green = {-0.140625, -0.078125}
        },
        wire =
        {
          red = {-0.6875, -0.03125},
          green = {-0.6875, -0.4375}
        }
      }
    },
    circuit_wire_max_distance = 9
  })
})
