local parser = require("parser")

function love.load()
    player = { x = 100, y = 100 }
    tipu = { keyboard = love.keyboard }
    env = {
        player = player,
        tipu = tipu,
        print = print,
        tonumber = tonumber
    }
end

function love.update(dt)
    parser.parse_and_execute([[  
        if tipu.keyboard.isDown("d") then player.x = player.x + 2;
        if tipu.keyboard.isDown("a") then player.x = player.x - 2;
        if tipu.keyboard.isDown("w") then player.y = player.y - 2;
        if tipu.keyboard.isDown("s") then player.y = player.y + 2;
    ]], env)
end

function love.draw()
    love.graphics.rectangle("fill", player.x, player.y, 20, 20)
end
