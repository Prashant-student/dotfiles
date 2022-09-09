require('nvim-tree').setup {
    view = {
        adaptive_size = true,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
}

vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeToggle<CR>', {noremap = true})
