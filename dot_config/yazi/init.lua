local function module_exists(name)
  -- 尝试通过 `pcall` 加载模块
  local status, _ = pcall(require, name)
  return status
end

-- 检查模块是否存在
if not module_exists("no-status") then
  os.execute("ya pack -i")
end


require("full-border"):setup()
require("no-status"):setup()


Header:children_add(function()
  if ya.target_family() ~= "unix" then
    return ui.Line {}
  end
  return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
end, 500, Header.LEFT)
