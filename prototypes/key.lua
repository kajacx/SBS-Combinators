-- 'consuming'
-- available options:
-- none: default if not defined
-- all: if this is the first input to get this key sequence then no other inputs listening for this sequence are fired
-- script-only: if this is the first *custom* input to get this key sequence then no other *custom* inputs listening for this sequence are fired. Normal game inputs will still be fired even if they match this sequence.
-- game-only: The opposite of script-only: blocks game inputs using the same key sequence but lets other custom inputs using the same key sequence fire.

data:extend({
    {
        type = "custom-input",
        name = "sbscomb-step",
        key_sequence = "SHIFT + F",
        consuming = "none"
    },
    {
        type = "custom-input",
        name = "sbscomb-toggle",
        key_sequence = "SHIFT + T",
        consuming = "none"
    },
})