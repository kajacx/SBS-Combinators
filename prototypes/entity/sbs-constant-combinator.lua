require ("prototypes.entity.combinator-pictures")

data:extend({
  generate_constant_combinator({ 
	  type = "constant-combinator",
    name = "sbs-constant-combinator",
    icon = "__SBS-Combinators__/graphics/entity/sbs-constant-combinator.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "sbs-constant-combinator"},
	  fast_replaceable_group = "constant-combinator",
    max_health = 120,
    corpse = "small-remnants",

    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},

    item_slot_count = 18,

    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },

    activity_led_light =
    {
      intensity = 0.8,
      size = 1,
      color = {r = 1.0, g = 1.0, b = 1.0}
    },

    activity_led_light_offsets =
    {
      {0.296875, -0.40625},
      {0.25, -0.03125},
      {-0.296875, -0.078125},
      {-0.21875, -0.46875}
    },

    circuit_wire_max_distance = 9
  })
})
