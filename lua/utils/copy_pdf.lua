---@class copy_pdf
local M = {}
-- Function to copy the compiled PDF to the clipboard
function M.copy_pdf_to_clipboard()
    -- Get the current file name without extension
    local current_file = vim.fn.expand('%:r')
    local pdf_file = current_file .. '.pdf'

    -- Check if the PDF file exists
    if vim.fn.filereadable(pdf_file) == 0 then
        print('PDF file does not exist: ' .. pdf_file)
        return
    end

    -- Determine the operating system
    local OS = vim.uv.os_uname().sysname
    local command

    if OS == 'Linux' then
        -- Use `xclip` on Linux
        command = 'xclip -selection clipboard -t application/pdf -i ' .. vim.fn.shellescape(pdf_file)
    elseif OS == 'Darwin' then
        -- Use `pbcopy` on macOS
        command = 'file-to-clipboard(){ osascript -e{\'on run{a}\',\'set the clipboard to posix file a\',end} "$(greadlink -f -- "$1")";} && file-to-clipboard ' .. vim.fn.shellescape(pdf_file)
    elseif OS == 'Windows_NT' then
        -- Use PowerShell on Windows to copy the file to the clipboard
        command = 'powershell -command "Set-Clipboard -Path ' .. vim.fn.shellescape(pdf_file) .. '"'
    else
        print('Unsupported OS: ' .. OS)
        return
    end

    -- Execute the command
    local handle = io.popen(command)
    if handle then
        handle:close()
        print('PDF copied to clipboard: ' .. pdf_file)
    else
        print('Failed to copy PDF to clipboard')
    end
end

-- Create a command to call the function
-- vim.api.nvim_create_user_command('CopyPDFToClipboard', copy_pdf_to_clipboard, {})

-- Optionally, create a key mapping to call the function
return M
