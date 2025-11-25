-- DAP (Debug Adapter Protocol) Configuration
-- Install: nvim-dap, nvim-dap-ui, nvim-dap-virtual-text

local dap = require("dap")
local dapui = require("dapui")

dapui.setup({})

require("nvim-dap-virtual-text").setup({})

-- Automatically open/close UI
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- ============================================================================
-- Language-Specific Adapters
-- ============================================================================

require("dap-lldb").setup({ codelldb_path = vim.env.CODELLDB_PATH })
require("dap-vscode-js").setup({})

for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest Tests",
      -- trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/jest/bin/jest.js",
        "--runInBand",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
  }
end

-- ============================================================================
-- Keymaps
-- ============================================================================

-- Basic debugging
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Set Conditional Breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Continue" })
vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { desc = "Debug: Run to Cursor" })

-- Step controls
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Debug: Step Out" })
vim.keymap.set("n", "<leader>dj", dap.down, { desc = "Debug: Down" })
vim.keymap.set("n", "<leader>dk", dap.up, { desc = "Debug: Up" })

-- Session controls
vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Debug: Restart" })
vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "Debug: Quit" })
vim.keymap.set("n", "<leader>dp", dap.pause, { desc = "Debug: Pause" })

-- UI controls
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
vim.keymap.set({ "n", "v" }, "<leader>de", dapui.eval, { desc = "Debug: Eval" })
vim.keymap.set("n", "<leader>dh", function()
  require("dap.ui.widgets").hover()
end, { desc = "Debug: Hover Variables" })

-- REPL
vim.keymap.set("n", "<leader>dl", dap.repl.open, { desc = "Debug: Open REPL" })
vim.keymap.set("n", "<leader>dL", dap.run_last, { desc = "Debug: Run Last" })

-- ============================================================================
-- Signs (breakpoint icons in gutter)
-- ============================================================================

vim.fn.sign_define("DapBreakpoint", {
  text = "●",
  texthl = "DapBreakpoint",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapBreakpointCondition", {
  text = "◆",
  texthl = "DapBreakpoint",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapBreakpointRejected", {
  text = "○",
  texthl = "DapBreakpoint",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapLogPoint", {
  text = "◉",
  texthl = "DapLogPoint",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapStopped", {
  text = "▶",
  texthl = "DapStopped",
  linehl = "debugPC",
  numhl = "",
})
