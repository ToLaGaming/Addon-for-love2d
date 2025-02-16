local parser = {}

function parser.execute_script(script, env)
    local func, err = load("return function() " .. script .. " end", "script", "t", env)

    if not func then
        print("Skripti-virhe: " .. err)
        return
    end

    func()()
end

function parser.parse_and_execute(code, env)
    for command in code:gmatch("[^;]+") do
        local if_pattern = 'if tipu%.keyboard%.isDown%("(.-)"%) then (.+)'

        local key, action = command:match(if_pattern)

        if key and action then
            if love.keyboard.isDown(key) then
                parser.execute_script(action, env)
            end
        else
            parser.execute_script(command, env)
        end
    end
end

return parser
