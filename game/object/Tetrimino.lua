local GameObject = require("engine.object.GameObject")

local Tetrimino = GameObject:new
{
    row = 0,
    column = 0,
    type = "cyan"
}

function Tetrimino:new(column, row, type)
    local tetrimino = {}

    setmetatable(tetrimino, self)
    self.__index = self

    tetrimino.column = math.floor(column) or self.column
    tetrimino.row = math.floor(row) or self.row
    tetrimino.type = type or self.type

    return tetrimino
end

function Tetrimino:draw(game)
    local grid = game.objects.grid

    local function fillCell(column, row)
        love.graphics.rectangle(
            "fill",
            grid.x + (grid.cellDimension * column),
            grid.y + (grid.cellDimension * row),
            grid.cellDimension,
            grid.cellDimension)
    end

    local actions =
    {
        ["cyan"] =
        -- A straight line
        function (column, row)
            fillCell(column, row)
            fillCell(column, row-1)
            fillCell(column, row-2)
            fillCell(column, row-3)
        end,
        ["blue"] =
        -- Left-handed l-shape
        function (column, row)
            return
        end,
        ["orange"] =
        -- Right-handed l-shape
        function (column, row)
            return
        end,
        ["yellow"] =
        -- Square
        function (column, row)
            return
        end,
        ["green"] =
        -- Right-handed s-shape
        function (column, row)
            return
        end,
        ["red"] =
        -- Left-handed s-shape
        function (column, row)
            return
        end,
        ["violet"] =
        -- T-shape
        function (column, row)
            return
        end,
    }

    actions[self.type](self.column, self.row)
end

return Tetrimino