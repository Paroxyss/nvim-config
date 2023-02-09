local function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

local function inMath()
    return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
end

local function inComment()
    return vim.api.nvim_eval('vimtex#syntax#in_comment()') == 1
end

local function inEnv(name)
    local a = vim.api.nvim_eval("vimtex#env#is_inside('" .. name .. "')")
    require("notify")(dump(a))
end

return {
    ctx = {
        math = inMath,
        comment = inComment,
        env = inEnv,
        envGen = function (name)
            return function () return inEnv(name) end
        end
    },
}
