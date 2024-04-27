local uv = vim.uv

local function fs_stat(path)
  local handle = coroutine.running()
  uv.fs_stat(path, function(err, stat)
    if err then
      print(err)
      coroutine.resume(handle, nil)
    else
      coroutine.resume(handle, stat)
    end
  end)
  return coroutine.yield()
end

local function main()
  local stat = fs_stat("./test.lua")
  print(vim.inspect(stat))
end

coroutine.wrap(main)()
