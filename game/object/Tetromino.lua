local GameObject = require("engine.object.GameObject")

local Tetromino = GameObject:new
{
    row = 0,
    column = 0,
    type = "I",
    angle = 0,
}

function Tetromino:new(column, row, type)
    local tetromino = {}

    setmetatable(tetromino, self)
    self.__index = self

    tetromino.column = math.floor(column) or self.column
    tetromino.row = math.floor(row) or self.row
    tetromino.type = type or self.type

    return tetromino
end

function Tetromino:shape()
    -- Refer to: https://en.wikipedia.org/wiki/Tetromino for tetromino names.
    local shapes =
    {
        ["I"] =
        {
            { column = 0, row = 3 },
            { column = 0, row = 2 },
            { column = 0, row = 1 },
            { column = 0, row = 0 },
        },
        ["J"] =
        {
            { column = 0,  row = 2 },
            { column = 0,  row = 1 },
            { column = 0,  row = 0 },
            { column = -1, row = 0 },
        },
        ["L"] =
        {
            { column = 0, row = 2 },
            { column = 0, row = 1 },
            { column = 0, row = 0 },
            { column = 1, row = 0 },
        },
        ["O"] =
        {
            { column = 0, row = 1 },
            { column = 1, row = 1 },
            { column = 0, row = 0 },
            { column = 1, row = 0 },
        },
        ["S"] =
        {
            { column = 1,  row = 1 },
            { column = 0,  row = 1 },
            { column = 0,  row = 0 },
            { column = -1, row = 0 },
        },
        ["Z"] =
        {
            { column = -1, row = 1 },
            { column = 0,  row = 1 },
            { column = 0,  row = 0 },
            { column = 1,  row = 0 },
        },
        ["T"] =
        {
            { column = 0,  row = 0 },
            { column = -1, row = 1 },
            { column = 0,  row = 1 },
            { column = 1,  row = 1 },
        },
    }

    local shape = shapes[self.type]

    local angleRadians = self.angle * (math.pi / 180)
    local sine = math.sin(angleRadians)
    local cosine = math.cos(angleRadians)

    local minX = 0
    local maxX = 0
    local minY = 0
    local maxY = 0

    -- Hard-coded Euclidean rotation of tetromino.
    -- https://en.wikipedia.org/wiki/Rotation_matrix
    for index, cell in pairs(shape)
    do
        shape[index] =
        {
            column = (cell.column * cosine) - (cell.row * sine),
            row = (cell.column * sine) + (cell.row * cosine),
        }

        minX = math.min(minX, shape[index].column)
        maxX = math.max(maxX, shape[index].column)

        minY = math.min(minY, shape[index].row)
        maxY = math.max(maxY, shape[index].row)
    end

    local shapeWidth = math.floor(math.abs(maxX - minX))
    local shapeHeight = math.floor(math.abs(maxY - minY))

    for index, cell in pairs(shape)
    do
        shape[index] =
        {
            column = cell.column + math.floor(shapeWidth / 2),
            row = cell.row - minY,
        }
    end

    return shape
end

function Tetromino:draw(game)
    local grid = game.objects.grid

    local shape = self:shape()

    for index, cell in pairs(shape)
    do
        love.graphics.rectangle(
            "fill",
            grid.x + (grid.cellDimension * (self.column + cell.column)),
            grid.y + (grid.cellDimension * (self.row - cell.row)),
            grid.cellDimension,
            grid.cellDimension)
    end
end

return Tetromino