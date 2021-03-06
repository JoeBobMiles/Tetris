local GameObject = require("engine.object.GameObject")
local Cell = require("game.object.Cell")

local Grid = GameObject:new{
    x = 0, y = 0,
    columns = 0, rows = 0,
    cellDimension = 0,
    cells = {},
}

function Grid:new(x, y, columns, rows, cellDimension)
    local grid = {}

    setmetatable(grid, self)
    self.__index = self

    grid.x = x or self.x
    grid.y = y or self.y
    grid.columns = columns or self.columns
    grid.rows = rows or self.rows
    grid.cellDimension = cellDimension or self.cellDimension

    grid.cells = {}
    for col = 0, (grid.columns or 1), 1 do
        grid.cells[col] = {}

        for row = 0, (rows or 1), 1 do
            grid.cells[col][row] = Cell:new(
                grid.x + (col * grid.cellDimension),
                grid.y + (row * grid.cellDimension),
                grid.cellDimension)
        end
    end

    return grid
end

function Grid:width()
    return self.columns * self.cellDimension
end

function Grid:height()
    return self.rows * self.cellDimension
end

function Grid:update(game, dt)
    return
end

function Grid:draw(game)
    love.graphics.rectangle("line",
        self.x, self.y,
        self:width(), self:height())

    for colNumber, column in pairs(self.cells)
    do
        for rowNumber, cell in pairs(column)
        do
            cell:draw(game)
        end
    end
end

return Grid