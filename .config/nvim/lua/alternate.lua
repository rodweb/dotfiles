local api = vim.api

local function get_alternate_buffer_name()
  local buf_name = api.nvim_buf_get_name(0)
  return buf_name:gsub('.(%w+)$', '.test.%1')
end

local function get_main_buffer_name()
  local buf_name = api.nvim_buf_get_name(0)
  return buf_name:gsub('.test.', '')
end

local function is_alternate_buffer()
  local buf_name = api.nvim_buf_get_name(0)
  if (string.find(buf_name, ".test.%w+$")) then
    return true
  end
  return false
end

local function open_main_buffer()
  local buf_name = get_main_buffer_name()
  api.nvim_command("edit " .. buf_name)
end

local function open_alternate_buffer()
  local buf_name = get_alternate_buffer_name()
  api.nvim_command("edit " .. buf_name)
end

local function create_alternate_buffer()
  local buf_name = get_alternate_buffer_name()
  local buf = api.nvim_create_buf('bl', false)
  api.nvim_buf_set_name(buf, buf_name)
  api.nvim_win_set_buf(0, buf)
end

local function alternate() 
  local is_alternate = is_alternate_buffer()
  if is_alternate then
    open_main_buffer()
  else
    open_alternate_buffer()
  end
end

return {
  alternate = alternate,
}
