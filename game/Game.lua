local Grid = require("game.object.Grid")

local Game = {}

function Game:new()
    local game = {
        objects = {}
    }

    setmetatable(game, self)
    self.__index = self

    game.objects.grid = Grid:new(0, 0, 16, 32, 16)

    return game
end

function Game:draw()
    for name, object in pairs(self.objects)
    do
        object:draw(self)
    end
end

return Game