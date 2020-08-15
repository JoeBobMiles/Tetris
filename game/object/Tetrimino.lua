local GameObject = require("engine.object.GameObject")

local Tetrimino = GameObject:new{
    row = 0,
    column = 0,
}

function Tetrimino:new(column, row)
    local tetrimino = {}

    setmetatable(tetrimino, self)
    self.__index = self

    tetrimino.column = column or self.column
    tetrimino.row = row or self.row

    return tetrimino
end

function Tetrimino:draw(game)
    local grid = game.objects.grid

    love.graphics.rectangle(
        "fill",
        grid.x + (grid.cellDimension * self.column),
        grid.y + (grid.cellDimension * self.row),
        grid.cellDimension,
        grid.cellDimension)
end

return Tetrimino