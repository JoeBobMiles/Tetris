local Grid = require("game.object.Grid")
local Tetrimino = require("game.object.Tetrimino")

local Game = {}

function Game:new()
    local game = {
        objects = {}
    }

    setmetatable(game, self)
    self.__index = self

    local columns = 16
    local rows = 32
    local cellDimension = 16

    local windowWidth, windowHeight = love.graphics.getDimensions()

    local gridWidth = columns * cellDimension
    local gridHeight = rows * cellDimension

    game.objects.grid = Grid:new(
        (windowWidth / 2) - (gridWidth / 2),
        (windowHeight / 2) - (gridHeight / 2),
        columns, rows,
        cellDimension)

    game.objects.tetrimino = Tetrimino:new(columns/2, rows/2)

    return game
end

function Game:draw()
    for name, object in pairs(self.objects)
    do
        object:draw(self)
    end
end

return Game