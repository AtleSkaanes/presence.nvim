local data_file_path = vim.fn.stdpath('data') .. '/presence/.data'

local read_file = function(path)
    local f = io.open(path, "r")
    if f == nil then return "" end
    io.input(f)
    local content = io.read()
    io.close(f)
    return content
end

local write_file = function(path, text, mode)
    local f = io.open(path, mode)
    if f == nil then return end
    io.output(f)
    io.write(text)
    io.close(f)
end

local m = {}

m.DoesOtherInstanceExists = function()
    local instance = read_file(data_file_path)
    if instance == "" or instance == nil then
        return false
    else
        return true
    end
end

m.StartInstance = function()
    write_file(data_file_path, "instance\n", "w")
end

m.QuitInstance = function ()
    write_file(data_file_path, "", "w")
end

return m


