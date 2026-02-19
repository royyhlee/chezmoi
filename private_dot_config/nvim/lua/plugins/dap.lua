local function build_dll()
  return coroutine.create(function(dap_run_co)
    vim.notify("Building project...", vim.log.levels.INFO)

    vim.fn.jobstart({
      "dotnet",
      "build",
      "--configuration",
      "Debug",
      "--no-restore",
      "--no-incremental",
    }, {
      cwd = vim.fn.getcwd(),
      on_exit = function(job_id, exit_code)
        if exit_code == 0 then
          vim.notify("Build succeeded!", vim.log.levels.INFO)
          coroutine.resume(dap_run_co, true)
        else
          vim.notify("Build failed!", vim.log.levels.ERROR)
          coroutine.resume(dap_run_co, false)
        end
      end,
    })
  end)
end

local function build_get_dll()
  return coroutine.create(function(dap_run_co)
    vim.notify("Building project...", vim.log.levels.INFO)
    vim.fn.jobstart({
      "dotnet",
      "build",
    }, {
      on_exit = function(_, exit_code)
        if exit_code ~= 0 then
          vim.notify("Build failed!", vim.log.levels.ERROR)
          coroutine.resume(dap_run_co, nil)
          return
        end

        vim.notify("Build successful!", vim.log.levels.INFO)

        -- Find all DLL files in bin folders
        local dll_files = vim.fn.globpath(vim.fn.getcwd(), "**/bin/**/*.dll", false, true)

        if #dll_files == 0 then
          vim.notify("No DLL files found in bin folders", vim.log.levels.WARN)
          coroutine.resume(dap_run_co, nil)
          return
        end

        -- Let user select from all found DLLs
        local opts = {
          format_item = function(dll)
            return vim.fn.fnamemodify(dll, ":t") -- Show relative path
          end,
        }

        vim.ui.select(dll_files, opts, function(choice)
          if choice then
            vim.notify("Selected: " .. vim.fn.fnamemodify(choice, ":."), vim.log.levels.INFO)
            coroutine.resume(dap_run_co, choice)
          else
            coroutine.resume(dap_run_co, nil)
          end
        end)
      end,
    })
  end)
end

local function get_dll()
  return coroutine.create(function(dap_run_co)
    local items = vim.fn.globpath(vim.fn.getcwd(), "**/bin/Debug/**/*.dll", false, true)
    local opts = {
      format_item = function(path)
        return vim.fn.fnamemodify(path, ":t")
      end,
    }
    local function cont(choice)
      if choice == nil then
        return nil
      else
        coroutine.resume(dap_run_co, choice)
      end
    end

    vim.ui.select(items, opts, cont)
  end)
end

return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")

      -- Override the default C# configuration
      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "NetCoreDbg: Launch (HTTP Profile)",
          request = "launch",
          program = build_get_dll,
          cwd = vim.fn.getcwd(),
          env = {
            ASPNETCORE_ENVIRONMENT = "Development",
          },
        },
        {
          type = "coreclr",
          name = "NetCoreDbg: Launch (HTTPS Profile)",
          request = "launch",
          program = get_dll,
          cwd = vim.fn.getcwd(),
          env = {
            ASPNETCORE_ENVIRONMENT = "local",
          },
        },
        {
          type = "coreclr",
          name = "NetCoreDbg: Attach",
          request = "attach",
          processId = require("dap.utils").pick_process,
        },
      }
    end,
  },
}
