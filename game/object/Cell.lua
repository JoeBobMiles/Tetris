local GameObject = require("engine.object.GameObject")

local Cell = GameObject:new{
    x = 0,
    y = 0,
}

function Cell:new(x, y)
    local cell = {}

    setmetatable(cell, self)
    self.__index = self

    cell.x = x or 0
    cell.y = y or 0

    return cell
end

function Cell:draw()
    love.graphics.rectangle("line", self.x, self.y, 10, 10)
end

return Cell