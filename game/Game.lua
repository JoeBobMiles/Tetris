local Grid = require("game.object.Grid")
local Tetromino = require("game.object.Tetromino")

local Game = {}

function Game:new()
    local game = {
        objects = {},
        secondsSinceLastUpdate = 0,
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

    game.objects.tetromino = Tetromino:new(columns/2, rows/2, "I")

    return game
end

function Game:update(dt)
    self.secondsSinceLastUpdate = self.secondsSinceLastUpdate + dt

    if self.secondsSinceLastUpdate >= 1
    then
        self.secondsSinceLastUpdate = self.secondsSinceLastUpdate - 1
        self.objects.tetromino.row = self.objects.tetromino.row + dt
    end
end

function Game:draw()
    for name, object in pairs(self.objects)
    do
        object:draw(self)
    end
end

function Game:keyreleased(key, scancode)
    if key == "q"
    then
       self.objects.tetromino.angle = self.objects.tetromino.angle + 90
    elseif key == "e"
    then
       self.objects.tetromino.angle = self.objects.tetromino.angle - 90
    end
end

return Game