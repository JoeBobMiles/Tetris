local GameObject = require("engine.object.GameObject")

local Tetromino = GameObject:new
{
    row = 0,
    column = 0,
    type = "I"
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

function Tetromino:draw(game)
    local grid = game.objects.grid

    local function fillCell(column, row)
        love.graphics.rectangle(
            "fill",
            grid.x + (grid.cellDimension * column),
            grid.y + (grid.cellDimension * row),
            grid.cellDimension,
            grid.cellDimension)
    end

    -- Refer to: https://en.wikipedia.org/wiki/Tetromino for tetromino names.
    local actions =
    {
        ["I"] =
        function (column, row)
            fillCell(column, row)
            fillCell(column, row-1)
            fillCell(column, row-2)
            fillCell(column, row-3)
        end,
        ["J"] =
        function (column, row)
            fillCell(column-1, row)
            fillCell(column, row)
            fillCell(column, row-1)
            fillCell(column, row-2)
        end,
        ["L"] =
        function (column, row)
            fillCell(column+1, row)
            fillCell(column, row)
            fillCell(column, row-1)
            fillCell(column, row-2)
        end,
        ["O"] =
        function (column, row)
            return
        end,
        ["S"] =
        function (column, row)
            return
        end,
        ["Z"] =
        function (column, row)
            return
        end,
        ["T"] =
        function (column, row)
            return
        end,
    }

    actions[self.type](self.column, self.row)
end

return Tetromino