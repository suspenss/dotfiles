local function mode_name()
  local mode_map = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    V = "V-LINE",
    [""] = "V-BLOCK", -- Visual block mode (Ctrl + V)
    c = "COMMAND",
    no = "OPERATOR PENDING",
    s = "SELECT",
    S = "S-LINE",
    [""] = "S-BLOCK", -- Select block mode
    R = "REPLACE",
    Rv = "V-REPLACE",
    t = "TERMINAL",
  }
  local mode = vim.fn.mode()          -- 获取当前模式的缩写
  local name = mode_map[mode] or mode -- 返回完整的模式名称
  return string.format("%-10s", "  " .. name)
end


local function lsp()
  local count = {}
  local levels = {
    errors = vim.diagnostic.severity.ERROR,
    warnings = vim.diagnostic.severity.WARN,
    info = vim.diagnostic.severity.INFO,
    hints = vim.diagnostic.severity.HINT,
  }

  for k, severity_level in pairs(levels) do
    count[k] = #vim.diagnostic.get(0, { severity = severity_level })
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#LspDiagnosticsSignError#E: " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#LspDiagnosticsSignWarning#W: " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#LspDiagnosticsSignHint#H: " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#LspDiagnosticsSignInformation#I: " .. count["info"]
  end

  return errors .. warnings .. hints .. info .. "%#Normal#"
end

Statusline = {}

Statusline.active = function()
  local width = vim.fn.winwidth(0) -- 获取当前窗口宽度
  local filepath = "%t "
  -- 如果窗口宽度大于 80，显示文件路径
  if width > 90 then
    filepath = "%f " -- 显示文件路径
  end
  return table.concat {
    "%#Statusline#",
    mode_name(),
    "%#Normal# ",
    filepath,
    " %m",
    " %r",
    "%=",
    lsp(),            -- 将状态栏分成左右两部分
    " %y   ",
    "%-8.(%l:%c%V%)", -- 当前行号、列号和虚拟列号
    " %P",            -- 显示文件的百分比位置
  }
end
