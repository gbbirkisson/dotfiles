local function stbufnr()
    return vim.api.nvim_win_get_buf(vim.g.statusline_winid)
end

local function relative_file_location()
    local path = vim.api.nvim_buf_get_name(stbufnr())
    if path == "" then
        return "No Name "
    end
    local cwd = vim.fn.getcwd()
    return path:sub(cwd:len() + 2, -1)
end

local function overridden_modules(modules)
    modules[2] = (function() -- M.fileInfo
        local icon = "󰈚 "
        local name = relative_file_location()

        if name ~= "No Name " then
            local devicons_present, devicons = pcall(require, "nvim-web-devicons")

            if devicons_present then
                local ft_icon = devicons.get_icon(name)
                icon = (ft_icon ~= nil and ft_icon) or icon
            end

            name = " " .. name .. " "
        end

        return "%#StText# " .. icon .. name
    end)()

    modules[9] = (function() -- M.cursor_position
        return "%#StText# %l:%c "
    end)()

    table.remove(modules, 13) -- M.cwd()
    table.remove(modules, 11) -- M.filetype()
    table.remove(modules, 10) -- M.file_encoding()

    table.remove(modules, 8) -- M.gitchanges()
    table.remove(modules, 4) -- M.LSP_Diagnostics

    -- M.gitchanges()
    table.insert(
        modules,
        4,
        (function()
            if not vim.b[stbufnr()].gitsigns_head or vim.b[stbufnr()].gitsigns_git_status then
                return ""
            end

            local git_status = vim.b[stbufnr()].gitsigns_status_dict

            local added = (git_status.added and git_status.added ~= 0) and
            ("%#St_lspInfo#  " .. git_status.added .. " ") or ""
            local changed = (git_status.changed and git_status.changed ~= 0)
                and ("%#St_lspWarning#  " .. git_status.changed .. " ")
                or ""
            local removed = (git_status.removed and git_status.removed ~= 0)
                and ("%#St_lspError#  " .. git_status.removed .. " ")
                or ""

            return (added .. changed .. removed) ~= "" and (added .. changed .. removed) or ""
        end)()
    )

    -- M.LSP_Diagnostics
    table.insert(
        modules,
        8,
        (function()
            if not rawget(vim, "lsp") then
                return "%#St_lspError# 󰅚 0 %#St_lspWarning# 0"
            end

            local errors_nr = #vim.diagnostic.get(stbufnr(), { severity = vim.diagnostic.severity.ERROR })
            local warnings_nr = #vim.diagnostic.get(stbufnr(), { severity = vim.diagnostic.severity.WARN })
            local hints_nr = #vim.diagnostic.get(stbufnr(), { severity = vim.diagnostic.severity.HINT })
            local info_nr = #vim.diagnostic.get(stbufnr(), { severity = vim.diagnostic.severity.INFO })

            local errors = (errors_nr and errors_nr > 0) and ("%#St_lspError#󰅚 " .. errors_nr .. " ") or ""
            local warnings = (warnings_nr and warnings_nr > 0) and ("%#St_lspWarning# " .. warnings_nr .. " ") or ""
            local hints = (hints_nr and hints_nr > 0) and ("%#St_lspHints#󰛩 " .. hints_nr .. " ") or ""
            local info = (info_nr and info_nr > 0) and ("%#St_lspInfo# " .. info_nr .. " ") or ""

            return errors .. warnings .. hints .. info
        end)()
    )
end

return overridden_modules
