return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'mfussenegger/nvim-dap-python',
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      -- Setup dap-ui
      dapui.setup()

      -- Breakpoint signs
      vim.fn.sign_define('DapBreakpoint', {text = '●', texthl = 'DapBreakpoint'})
      vim.fn.sign_define('DapBreakpointCondition', {text = '●', texthl = 'DapBreakpointCondition'})
      vim.fn.sign_define('DapStopped', {text = '→', texthl = 'DapStopped', linehl = 'DapStoppedLine'})

      vim.api.nvim_set_hl(0, 'DapBreakpoint', {fg = '#e51400'})
      vim.api.nvim_set_hl(0, 'DapBreakpointCondition', {fg = '#f0a000'})
      vim.api.nvim_set_hl(0, 'DapStopped', {fg = '#98c379'})
      vim.api.nvim_set_hl(0, 'DapStoppedLine', {bg = '#2e4d3d'})

      -- Setup Python debugging
      -- Requires debugpy: pip install debugpy
      require('dap-python').setup('python')

      -- Automatically open/close dap-ui
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end

      -- Keybindings for debugging
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {desc = 'Toggle breakpoint'})
      vim.keymap.set('n', '<leader>dn', dap.step_over, {desc = 'Step over (next)'})
      vim.keymap.set('n', '<leader>di', dap.step_into, {desc = 'Step into'})
      vim.keymap.set('n', '<leader>do', dap.step_out, {desc = 'Step out'})
      vim.keymap.set('n', '<leader>dc', dap.continue, {desc = 'Continue/Start debugging'})
      vim.keymap.set('n', '<leader>dt', dap.terminate, {desc = 'Terminate debugging'})
      vim.keymap.set('n', '<leader>du', dapui.toggle, {desc = 'Toggle DAP UI'})
    end,
  },
}
