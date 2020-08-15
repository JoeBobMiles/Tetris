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

    game.objects.tetromino = Tetromino:new(0,0, "I")

    return game
end

function Game:update(dt)
    self.secondsSinceLastUpdate = self.secondsSinceLastUpdate + dt

    if self.secondsSinceLastUpdate >= 0.5
    then
        self.secondsSinceLastUpdate = self.secondsSinceLastUpdate - 1

        if self.objects.tetromino.row == self.objects.grid.rows
        then
            for index, cell in pairs(self.objects.tetromino:shape())
            do
                cell =
                {
                    column = self.objects.tetromino.column + cell.column,
                    row = self.objects.tetromino.row - cell.row,
                }

                self.objects.grid.cells[cell.column][cell.row].filled = true
            end

            self.objects.tetromino = Tetromino:new(0,0, "I")
        else
            self.objects.tetromino.row = self.objects.tetromino.row + 1
            print(self.objects.tetromino.row)
        end
    end
end

function Game:draw()
    for name, object in pairs(self.objects)
    do
        object:draw(self)
    end
end

function Game:keyreleased(key, scancode)
    if key == "z"
    then
       self.objects.tetromino.angle = self.objects.tetromino.angle + 90
    elseif key == "x"
    then
       self.objects.tetromino.angle = self.objects.tetromino.angle - 90
    elseif key == "right"
    then
        self.objects.tetromino.column = self.objects.tetromino.column + 1
    elseif key == "left"
    then
        self.objects.tetromino.column = self.objects.tetromino.column - 1
    end
end

return Game