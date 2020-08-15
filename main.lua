local Game = require("game.Game")

function love.load()
    game = Game:new()
end

function love.draw()
    game:draw()
end

function love.keyreleased(key, scancode)
    game:keyreleased(key, scancode)
end