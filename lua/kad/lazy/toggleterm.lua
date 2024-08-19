return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup({
        -- size = 120,
        open_mapping = [[<c-#]],
        hide_numbers = true,
        direction = "horizontal",
        close_on_exit = true,
        shade_terminals = false

      });

      local Terminal = require('toggleterm.terminal').Terminal
      local pwsh = Terminal:new({ cmd = 'powershell', hidden = true })
      local node = Terminal:new({ cmd = 'node', hidden = true })

      function RUN_PWSH()
        pwsh:toggle()
      end

      function RUN_NODE()
        node:toggle()
      end

      vim.keymap.set("n", "<leader>pt", '<Cmd>lua RUN_PWSH()<CR>')
      vim.keymap.set("n", "<leader>nt", '<Cmd>lua RUN_NODE()<CR>')

      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
      vim.cmd('autocmd BufWinEnter,WinEnter term://* startinsert')
      vim.cmd('autocmd BufLeave term://* stopinsert')
    end
  }
}
