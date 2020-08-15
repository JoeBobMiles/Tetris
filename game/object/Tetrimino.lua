local GameObject = require("engine.object.GameObject")

local Tetrimino = GameObject:new{
    row = 0,
    column = 0,
}

function Tetrimino:new(column, row)
    local tetrimino = {}

    setmetatable(tetrimino, self)
    self.__index = self

    return tetrimino
end

return Tetrimino