return {
    'nyngwang/NeoTerm.lua',
    config = function()
        require('neo-term').setup {
            exclude_filetypes = { 'oil' },
        }
        vim.keymap.set('n', '<leader>tt', function() vim.cmd('NeoTermToggle') end)
    end
}
