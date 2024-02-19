-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- Aerial
    ["]y"] = { "<cmd>AerialNext<cr>", desc = "Next symbol" },
    ["[y"] = { "<cmd>AerialPrev<cr>", desc = "Previous symbol" },
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },

    -- Tests
    ["<leader>t"] = { false },
    ["<leader>tr"] = {
      function() require("neotest").run.run() end,
      desc = "Run Nearst",
    },
    ["<leader>tl"] = {
      function() require("neotest").run.run_last() end,
      desc = "Run Last",
    },
    ["<leader>tf"] = {
      function() require("neotest").run.run(vim.fn.expand "%") end,
      desc = "Run File",
    },
    ["<leader>ta"] = {
      function() require("neotest").run.run(vim.loop.cwd()) end,
      desc = "Run All Test Files",
    },
    ["<leader>ts"] = {
      function() require("neotest").summary.toggle() end,
      desc = "Toggle Summary",
    },
    ["<leader>to"] = {
      function() require("neotest").output.open { enter = true, auto_close = true } end,
      desc = "Show Output",
    },
    ["<leader>tO"] = {
      function() require("neotest").output_panel.toggle() end,
      desc = "Toggle Output Panel",
    },
    ["<leader>tS"] = {
      function() require("neotest").run.stop() end,
      desc = "Stop",
    },

    ["<leader>th"] = { false },
    ["<leader>tn"] = { false },
    ["<leader>tp"] = { false },
    ["<leader>tv"] = { false },

    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    ["<esc><esc>"] = { "<cmd>ToggleTerm<cr>", desc = "Close Term" },
  },
}
