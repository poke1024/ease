-- some basic unit tests for ease.lua functions ported from bezier-easing.

local ease = require "ease"

local function allequals(f1, f2, samples)
	for i = 1, samples do
		local x = i / samples
		local d = math.abs(f1(x) - f2(x))
		if d > 0.05 then
			error("test failed.")
		end
	end
end

for j = 1, 1000 do
	local a = math.random()
	local b = math.random()
	local c = math.random()
	local d = math.random()
	local easing = ease.cubicbezier(a, b, c, d)
	local projected = ease.cubicbezier(b, a, d, c)
	allequals(function(x) return x end, function(x) return  projected(easing(x)) end, 100)
end

print("tests ok.")
