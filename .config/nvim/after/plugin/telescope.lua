local telescope = require('telescope')

telescope.setup{
    pickers = {
        grep_string = {
            theme = "ivy",
        },
        find_files = {
            theme = "ivy",
        }
    },
}


local builtin = require('telescope.builtin')
vim.api.nvim_create_user_command("Cat", builtin.find_files, {})
vim.api.nvim_create_user_command("Grep", function ()
    builtin.grep_string({ search = vim.fn.input("> ") })
end, {})

-- vim.keymap.set('n', '<C-p>', builtin.find_files, {})
-- vim.keymap.set('n', '<C-f>', function ()
    -- builtin.grep_string({search = vim.fn.input("> ")})
-- end, {})

