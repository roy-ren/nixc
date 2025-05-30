local M = {}

M.setup = function()
  -- Make line numbers default
  vim.opt.number = true
  -- You can also add relative line numbers, to help with jumping.
  --  Experiment for yourself to see if you like it!
  vim.opt.relativenumber = true

  -- Enable mouse mode, can be useful for resizing splits for example!
  vim.opt.mouse = "a"

  -- Don't show the mode, since it's already in the status line
  vim.opt.showmode = false
  --
  -- 禁用折叠（默认展开所有代码）
  vim.opt.foldmethod = "manual"
  vim.opt.foldlevel = 99

  vim.opt.softtabstop = 2
  vim.opt.shiftwidth = 2

  -- Sync clipboard between OS and Neovim.
  --  Schedule the setting after `UiEnter` because it can increase startup-time.
  --  Remove this option if you want your OS clipboard to remain independent.
  --  See `:help 'clipboard'`
  vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
  end)

  -- Enable break indent
  vim.opt.breakindent = true

  -- Save undo history
  vim.opt.undofile = true

  -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
  vim.opt.ignorecase = true
  vim.opt.smartcase = true

  -- Keep signcolumn on by default
  vim.opt.signcolumn = "yes"

  -- Decrease update time
  vim.opt.updatetime = 250

  -- Decrease mapped sequence wait time
  vim.opt.timeoutlen = 300

  -- Configure how new splits should be opened
  vim.opt.splitright = true
  vim.opt.splitbelow = true

  -- Sets how neovim will display certain whitespace characters in the editor.
  --  See `:help 'list'`
  --  and `:help 'listchars'`
  vim.opt.list = true
  vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

  -- Preview substitutions live, as you type!
  vim.opt.inccommand = "split"

  -- Show which line your cursor is on
  vim.opt.cursorline = true
  vim.o.cursorlineopt = "number,line"

  -- Minimal number of screen lines to keep above and below the cursor.
  vim.opt.scrolloff = 10
end

return M
