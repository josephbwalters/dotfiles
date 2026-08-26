local aug = vim.api.nvim_create_augroup
local acmd = vim.api.nvim_create_autocmd

local mygroup = aug("MyAutocmds", { clear = true })

-- snacks.nvim's dashboard registers one callback for both BufDelete and BufWipeout
-- on its bufhidden=wipe buffer; both fire on close, so the 2nd nvim_del_augroup_by_id
-- call always errors on an already-deleted group. Silence that specific no-op failure.
local nvim_del_augroup_by_id = vim.api.nvim_del_augroup_by_id
vim.api.nvim_del_augroup_by_id = function(id)
  pcall(nvim_del_augroup_by_id, id)
end

-- milli animated splash on startup, rotating every 30s, then snacks dashboard
-- Press <Enter>, <q>, or <Esc> to skip to the dashboard at any time
acmd("VimEnter", {
  group = mygroup,
  once = true,
  callback = function()
    if vim.fn.argc() == 0 then
      vim.defer_fn(function()
        if vim.fn.exists(":MilliPreview") == 0 then
          Snacks.dashboard.open()
          return
        end

        local splashes = { "badge", "blackhole", "spaceship", "dancerramp", "shader" }
        local idx = 1
        local buf = nil
        local timer = vim.uv.new_timer()

        local function open_dashboard()
          timer:stop()
          timer:close()
          if buf and vim.api.nvim_buf_is_valid(buf) then
            pcall(vim.api.nvim_buf_delete, buf, { force = true })
          end
          vim.schedule(function() Snacks.dashboard.open() end)
        end

        local function show_splash()
          if buf and vim.api.nvim_buf_is_valid(buf) then
            pcall(vim.api.nvim_buf_delete, buf, { force = true })
          end
          vim.cmd("MilliPreview " .. splashes[idx])
          buf = vim.api.nvim_get_current_buf()
          idx = (idx % #splashes) + 1
          vim.keymap.set("n", "<CR>",  open_dashboard, { buffer = buf, desc = "Open dashboard" })
          vim.keymap.set("n", "q",     open_dashboard, { buffer = buf, desc = "Open dashboard" })
          vim.keymap.set("n", "<Esc>", open_dashboard, { buffer = buf, desc = "Open dashboard" })
        end

        show_splash()
        -- rotate through splashes every 30 seconds
        timer:start(15000, 15000, vim.schedule_wrap(show_splash))
      end, 1)
    end
  end,
})

-- Toggle relative numbers in insert mode
acmd({ "InsertEnter" }, {
  group = mygroup,
  callback = function() vim.opt.relativenumber = false end,
})
acmd({ "InsertLeave" }, {
  group = mygroup,
  callback = function() vim.opt.relativenumber = true end,
})

