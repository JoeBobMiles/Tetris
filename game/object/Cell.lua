local GameObject = require("engine.object.GameObject")

local Cell = GameObject:new{
    x = 0,
    y = 0,
}

function Cell:new(x, y, dimension)
    local cell = {}

    setmetatable(cell, self)
    self.__index = self

    cell.x = x or 0
    cell.y = y or 0
    cell.dimension = dimension or 10

    return cell
end

function Cell:draw(game)
    love.graphics.rectangle(
        "line",
        self.x, self.y,
        self.dimension, self.dimension)
end

return Cell