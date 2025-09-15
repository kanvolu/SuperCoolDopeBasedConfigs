VERSION = "0.1.0"

local micro = import("micro")
local config = import("micro/config")
local shell = import("micro/shell")
local buffer = import("micro/buffer")
local io = require("io")
local os = require("os")


function open_file(file, mode)
    --checks the mode and opens the file
    if mode == 'tab' then
        micro.CurPane():AddTab()
        local buf, err = buffer.NewBufferFromFile(file)
        if err then
            micro.TermMessage('An error ocurred while opening the file. ' .. err)
        end
        micro.CurPane():OpenBuffer(buf)
    elseif mode == 'hsplit' then
        micro.CurPane():HSplitIndex(buffer.NewBufferFromFile(file), true)
    elseif mode == 'vsplit' then
        micro.CurPane():VSplitIndex(buffer.NewBufferFromFile(file), true)
    elseif mode == 'inplace' or not mode then
        local buf, err = buffer.NewBufferFromFile(file)
        micro.CurPane():OpenBuffer(buf)
        if err then
            micro.TermMessage('An error ocurred while opening the file. ' .. err)
        end
    else --failsafe in case the mode set is not valid
        micro.TermMessage(mode .. ' is not a valid option. You can use "tab", "vsplit", "hsplit", or "inplace"')
    end
end

function yazi()
    --creates a temporary file and runs yazi in an interactive shell writing the selected path to the temporary file
    local tmp = os.tmpname()
    local string, err = shell.RunInteractiveShell('yazi --chooser-file=' .. tmp, false, false)
    if err then
        micro.TermMessage('A problem ocurred when executing yazi.')
    end
    local file = io.open(tmp)
    --checks if a file was selected
    if not file then
        micro.InfoBar():Message('Closed yazi. No file was selected.')
        return
    end
    --reads the temporary file and returns the file path
    file = file:read()
    local result, err = os.remove(tmp)
    if not result then
        micro.TermMessage('Could not remove temporary file ' .. tmp .. ' ' .. err)
    end
    return file
end


function main(bp, args)
    --TODO scan all open buffers for buffers without save path and prompt to save
    local saved = bp:SaveAll() --failsafe to save all buffers IF THEY HAVE A SAVE PATH before openning yazi, in case something breaks
    --Gets the configured opening mode for yazi
    local mode = config.GetGlobalOption('yazi.mode')
    --checks the amount of arguments to make sure it is valid
    if #args > 1 then
        micro.InfoBar():Message("You can only pass one argument to yazi.")
        return
    elseif #args == 1 then
        mode = args[1]
        if mode ~= 'tab' and mode ~= 'hsplit' and mode ~= 'vsplit' and mode ~= 'inplace' then --failsafe in case argument provided is not valid
            micro.InfoBar():Message('"' .. mode .. '"' .. ' is not a valid argument. You can use "tab", "vsplit", "hsplit", or "inplace".')
            return
        end
    end
    local file = yazi()
    --checks if a file was selected, if not it goes back to micro
    if not file then
        return
    end
    open_file(file, mode)
end


function init()
    config.MakeCommand('y', main, config.NoComplete)
    config.MakeCommand('yazi', main, config.NoComplete)
end
