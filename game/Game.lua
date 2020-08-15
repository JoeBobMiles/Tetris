local Game = {}

function Game:new()
    local game = {}

    setmetatable(game, self)
    self.__index = self

    return game
end

function Game:draw()
    love.graphics.print("Hello World", 400, 300)
end

return Game