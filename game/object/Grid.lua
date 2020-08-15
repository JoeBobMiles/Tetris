local GameObject = require("engine.object.GameObject")
local Cell = require("game.object.Cell")

local Grid = GameObject:new()

function Grid:new(columns, rows)
    local grid = {}

    setmetatable(grid, self)
    self.__index = self

    local cellDimension = 50

    self.cells = {}
    for x = 1, (columns or 1), 1 do
        self.cells[x] = {}

        for y = 1, (rows or 1), 1 do
            self.cells[x][y] = Cell:new(
                x * cellDimension,y * cellDimension,
                cellDimension)
        end
    end

    return grid
end

function Grid:update(game, dt)
    return
end

function Grid:draw(game)
    for x, row in pairs(self.cells)
    do
        for y, cell in pairs(row)
        do
            cell:draw(game)
        end
    end
end

return Grid