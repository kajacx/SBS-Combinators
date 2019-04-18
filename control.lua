--- LOCAL VARIABLES ---

local sbsArithmCombs = nil
local sbsDecideCombs = nil
local sbsConstCombs = nil

local STATE_IDLE = 1 -- wait for "step" or "start" signals
local STATE_STEP = 2 -- step-execute network on the next frame
local STATE_RUN = 3 -- run the network freely

local state = STATE_IDLE

--- HELPER FUNCTIONS ---

function stringOrNil(value)
    if value == nil then
        return "nil"
    else
        return value
    end
end

function indexOf(table, value)
    for i,v in pairs(table) do
        if value == i then
            return i
        end
    end
    return nil
end

--- INTERNAL FUNCTIONS ---

function insertCombinator(combinator)
    if combinator.name == "sbs-arithmetic-combinator" then
        table.insert(sbsArithmCombs, combinator)
        global.sbsArithmCombs = sbsArithmCombs
    end
    if combinator.name == "sbs-decider-combinator" then
        table.insert(sbsDecideCombs, combinator)
        global.sbsDecideCombs = sbsDecideCombs
    end
    if combinator.name == "sbs-constant-combinator" then
        table.insert(sbsConstCombs, combinator)
        global.sbsConstCombs = sbsConstCombs
    end
end

function removeCombinator(combinator)
    if combinator.name == "sbs-arithmetic-combinator" then
        local index = indexOf(sbsArithmCombs, combinator)
        if index ~= nil then
            sbsArithmCombs.remove(index)
            global.sbsArithmCombs = sbsArithmCombs
        end
    end
    if combinator.name == "sbs-decider-combinator" then
        local index = indexOf(sbsDecideCombs, combinator)
        if index ~= nil then
            sbsDecideCombs.remove(index)
            global.sbsDecideCombs = sbsDecideCombs
        end
    end
    if combinator.name == "sbs-constant-combinator" then
        local index = indexOf(sbsConstCombs, combinator)
        if index ~= nil then
            sbsConstCombs.remove(index)
            global.sbsConstCombs = sbsConstCombs
        end
    end
end

--- INITIALIZATION ---

script.on_init(
    function(e)
        sbsArithmCombs = {}
        sbsDecideCombs = {}
        sbsConstCombs = {}
        global.sbsArithmCombs = sbsArithmCombs
        global.sbsDecideCombs = sbsDecideCombs
        global.sbsConstCombs = sbsConstCombs
    end
)

script.on_load(
    function(e)
        sbsArithmCombs = global.sbsArithmCombs
        sbsDecideCombs = global.sbsDecideCombs
        sbsConstCombs = global.sbsConstCombs

        if sbsArithmCombs == nil then
            log("sbsArithmCombs is nil in the global array, this shouldn't happen")
            sbsArithmCombs = {}
        end
        if sbsDecideCombs == nil then
            log("sbsDecideCombs is nil in the global array, this shouldn't happen")
            sbsDecideCombs = {}
        end
        if sbsConstCombs == nil then
            log("sbsConstCombs is nil in the global array, this shouldn't happen")
            sbsConstCombs = {}
        end
    end
)


--- ENTITY BUILDING ---

script.on_event({defines.events.on_built_entity},
    function (e)
        if e and e.created_entity then
            insertCombinator(e.created_entity)
        end
    end
)

script.on_event({defines.events.on_entity_cloned},
    function (e)
        if e and e.destination then
            insertCombinator(e.destination)
        end
    end
)

script.on_event({defines.events.on_robot_built_entity},
    function (e)
        if e and e.created_entity then
            insertCombinator(e.created_entity)
        end
    end
)

script.on_event({defines.events.script_raised_built},
    function (e)
        if e and e.entity then
            insertCombinator(e.entity)
        end
    end
)

script.on_event({defines.events.script_raised_revive},
    function (e)
        if e and e.entity then
            insertCombinator(e.entity)
        end
    end
)


--- ENTITY DESTROYED ---
--[[
script.on_event({defines.events.on_entity_died},
    function (e)
        if e and e.entity then
            removeCombinator(e.entity)
        end
    end
)

script.on_event({defines.events.on_player_mined_entity},
    function (e)
        if e and e.entity then
            removeCombinator(e.entity)
        end
    end
)

script.on_event({defines.events.on_robot_mined_entity},
    function (e)
        if e and e.entity then
            removeCombinator(e.entity)
        end
    end
)

script.on_event({defines.events.script_raised_destroy},
    function (e)
        if e and e.entity then
            removeCombinator(e.entity)
        end
    end
)
--]]


--- PLAYER INPUT ---

script.on_event("sbscomb-step",
    function(e)
        state = STATE_STEP
    end
)

script.on_event("sbscomb-toggle",
    function(e)
        if state ~= STATE_RUN then
            state = STATE_RUN
        else
            state = STATE_IDLE
        end
    end
)

--- UPDATE LOOP ---

script.on_event({defines.events.on_tick},
    function (e)
        --[[
        if e.tick % 1 == 0 then
            for _,constComb in pairs(sbsConstCombs) do
                local signal = {}
                local control = constComb.get_or_create_control_behavior()
                local params = control.parameters;
                params.parameters[1] = {
                    signal = {type = "item", name="rail-signal"},
                    count = e.tick / 60,
                    index = 1
                }
                params.parameters[2] = {
                    signal = {type = "item", name="rail-chain-signal"},
                    count = e.tick % 60,
                    index = 2
                }
                control.parameters = params;
            end
        end
        --]]

        local invalidArithm = nil
        local invalidDecide = nil
        local energy = 0

        if state == STATE_IDLE then
            energy = 0
        elseif state == STATE_RUN then
            energy = 30
        else -- state == STATE_STEP
            energy = 30
            state = STATE_IDLE
        end

        for i,combinator in pairs(sbsArithmCombs) do
            if combinator.valid then
                combinator.energy = energy
            else
                invalidArithm = i
            end
        end
        for i,combinator in pairs(sbsDecideCombs) do
            if combinator.valid then
                combinator.energy = energy
            else
                invalidDecide = i
            end
        end

        if invalidArithm ~= nil then
            table.remove(sbsArithmCombs, invalidArithm)
            global.sbsArithmCombs = sbsArithmCombs
        end
        if invalidDecide ~= nil then
            table.remove(sbsDecideCombs, invalidDecide)
            global.sbsDecideCombs = sbsDecideCombs
        end
    end
)
