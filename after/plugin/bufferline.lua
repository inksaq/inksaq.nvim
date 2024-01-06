require('bufferline').setup{
    options = {
        numbers = "none" or "ordinal" or "buffer_id" or "both",
        close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
        -- Add custom areas on the left and right of the bufferline.
        custom_areas = {
            right = function()
                local result = {}
                -- Your custom area here
                return result
            end,
        },
        -- Other configuration options...
    },
}
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
    
-- Navigate buffers
map('n', '<TAB>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', opts)
