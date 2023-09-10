local dap = require("dap")

dap.adapters.lldb = {type = "executable", command = "/usr/bin/lldb-vscode", name = "lldb"}

local function getRustExe()
  local cwd = vim.fn.getcwd()
  local slashIndex = 0
  for i = #cwd, 1, -1 do
    local c = cwd:sub(i, i)
    -- print(c)
    if c == "/" then
      slashIndex = i
      break
    end
  end
  local exe = string.sub(cwd, slashIndex + 1)
  return cwd .. "/target/debug/" .. exe
end

dap.configurations.rust = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    -- program = function()
    --     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/example')
    -- end,
    program = getRustExe(), -- "/home/carl/Desktop/my_projects/rust_projects/example/target/debug/example",
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {"mandel.png", "1000x750", "-1.20,0.35", "-1.0,0.20"},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}
