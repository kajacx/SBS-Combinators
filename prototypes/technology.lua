data:extend({
  {
    type = "technology",
    name = "sbs-combinators",
    icon_size = 128,
    icon = "__SBS-Combinators__/graphics/technology/sbs-combinators.png",
    effects = {
      {
        type = "unlock-recipe",
        recipe = "sbs-arithmetic-combinator"
      },
      {
        type = "unlock-recipe",
        recipe = "sbs-decider-combinator"
      },
      {
        type = "unlock-recipe",
        recipe = "sbs-constant-combinator"
      },
    },
    prerequisites = {"circuit-network"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 15
    },
    order = "a-d-e"
  }
})