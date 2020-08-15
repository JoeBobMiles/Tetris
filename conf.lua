--[[
    LÖVE config file. For documentation on what these options do, refer to:
        https://love2d.org/wiki/Config_Files
]]
function love.conf(t)
    -- Top-level configruation
    t.identity = nil
    t.appendidentity = false
    t.version = "11.3"
    t.console = true    -- Set to false for production!!!
    t.accelerometerjoystick = true
    t.externalstorage = false
    t.gammacorrect = false

    -- Audio configuration
    t.audio.mic = false
    t.audio.mixwithsystem = true

    -- Window/display configuration
    t.window.title = "Untitled"
    t.window.icon = nil
    t.window.width = 600
    t.window.height = 800
    t.window.borderless = false
    t.window.resizable = false 
    t.window.minwidth = 1
    t.window.minheight = 1
    t.window.fullscreen = false
    t.window.fullscreentype = "desktop"
    t.window.vsync = 1
    t.window.msaa = 0
    t.window.depth = nil
    t.window.stencil = nil
    t.window.display = 1
    t.window.highdpi = false
    t.window.usedpiscale = true
    t.window.x = nil
    t.window.y = nil

    -- Module configuration
    t.modules.audio = true
    t.modules.data = true
    t.modules.event = true
    t.modules.font = true
    t.modules.graphics = true
    t.modules.image = true
    t.modules.joystick = true
    t.modules.keyboard = true
    t.modules.math = true
    t.modules.mouse = true
    t.modules.physics = true
    t.modules.sound = true
    t.modules.system = true
    t.modules.thread = true
    t.modules.timer = true
    t.modules.touch = true
    t.modules.video = true
    t.modules.window = true
end