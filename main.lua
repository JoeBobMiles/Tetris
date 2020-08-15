local Game = require("game.Game")

function love.load()
    game = Game:new()
end

function love.draw()
    game:draw()
end