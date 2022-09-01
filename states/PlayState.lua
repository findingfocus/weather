PlayState = Class{__includes = BaseState}

function PlayState:init()
	player = Player(0, VIRTUAL_HEIGHT - GROUND_HEIGHT, 40, 40)
	mountainBiome = Biome('mountain', 450, 100, 240, VIRTUAL_HEIGHT - GROUND_HEIGHT)
end

function PlayState:update(dt)
	player:update(dt)
	mountainBiome:GetHypotLength()
	player:GetHypotLength(mountainBiome)
	sounds['beep']:setLooping(true)
	sounds['beep']:setVolume(player.tween)
	sounds['beep']:play()
end


function PlayState:render()
	love.graphics.clear(150/255, 150/255, 150/255, 255/255)
	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
	love.graphics.print('player.x: ' .. tostring(player.x), 10, 50)
	love.graphics.print('aLength: ' .. tostring(player.aLength), 10, DEBUG_OFFSET * 2)
	love.graphics.print('bLength: ' .. tostring(player.bLength), 10, DEBUG_OFFSET * 3)
	love.graphics.print('cLength: ' .. tostring(player.cLength), 10, DEBUG_OFFSET * 4)
	love.graphics.print('cX: ' .. tostring(player.cX), 10, DEBUG_OFFSET * 5)
	love.graphics.print('cy: ' .. tostring(player.cY), 10, DEBUG_OFFSET * 6)
	love.graphics.printf('WEATHER', VIRTUAL_WIDTH / 2, 200, VIRTUAL_HEIGHT / 2, 'center')
	player:render()
	mountainBiome:render()
end 

