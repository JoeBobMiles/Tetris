local GameObject = require("engine.object.GameObject")
local Cell = require("game.object.Cell")

local Grid = GameObject:new()

function Grid:new()
    local grid = {}

    setmetatable(grid, self)
    self.__index = self

    self.cells = {}
    for x = 1, 10, 1 do
        self.cells[x] = {}

        for y = 1, 10, 1 do
            self.cells[x][y] = Cell:new(x * 10,y * 10)
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