-- you'll need https://love2d.org/ to run this.

local ease = require "ease"

local names = {"quad", "cubic", "quart", "quint", "expo", "sine", "circ", "back", "elastic", "bounce"}
local variants = {"in", "out", "inout"}

function box(name, f)
	local n = 200
	local h = n / 2
	local y0 = h - f(0) * h
	love.graphics.setColor(0.8, 0.2, 0.2)
	for i = 1, n do
		local y1 = h - f(i / n) * h
		love.graphics.line(i, y0, i + 1, y1)
		y0 = y1
	end
	love.graphics.setColor(0, 0, 0)
	love.graphics.print(name, 0, h + 20, 0)
end

local function random()
	if math.random() < 0.5 then
		local a = math.random()
		local b = math.random()
		local c = math.random()
		local d = math.random()
		return string.format("cubicbezier(%.1f, %.1f, %.1f, %.1f)", a, b, c, d), ease.cubicbezier(a, b, c, d)
	else
		local name = variants[math.random(#variants)] .. names[math.random(#names)]
		return name, ease[name]
	end
end

love.window.setTitle("ease demo")
love.graphics.setBackgroundColor(0.9, 0.9, 0.9)

function newCurves()
	boxes = {}
	for j = 0, 2 do
		for i = 0, 2 do
			boxes[{i, j}] = {random()}
		end
	end
end

newCurves()

function love.keypressed(key)
	if key == 'space' then
		newCurves()
	end
end

function love.draw()
	local ox = love.graphics.getWidth() / 2 - (2 * 250 + 200) / 2
	local oy = love.graphics.getHeight() / 2 - (2 * 150 + 200) / 2

	love.graphics.print("Press space for more curves.", ox, love.graphics.getHeight() - 40)
	for where, what in pairs(boxes) do
		local x, y
		x, y = unpack(where)
		love.graphics.push()
		love.graphics.translate(ox + x * 250, oy + y * 150)
		box(unpack(what))
		love.graphics.pop()
	end
end
