require '/src/dependencies/dependencies'

function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')

	love.window.setTitle('Weather')

	pixelFont = love.graphics.newFont('/src/fonts/Pixel.ttf', 40)
	love.graphics.setFont(pixelFont)

	sounds = {
		['beep'] = love.audio.newSource('/src/music/beep.wav', 'static'),
		['select'] = love.audio.newSource('/src/music/select.wav', 'static'),
		['birds'] = love.audio.newSource('/src/music/birds.mp3', 'static'),
		['mountain'] = love.audio.newSource('/src/music/mountain.mp3', 'static'),
		['thunder'] = love.audio.newSource('/src/music/thunder.mp3', 'static')
	}
--]]
	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		vsync = true,
		fullscreen = true,
		resizable = false
	})

	gStateMachine = StateMachine {
		['playState'] = function() return PlayState() end,
		['helpState'] = function() return HelpState() end
	}

	gStateMachine:change('playState')

	love.keyboard.keysPressed = {}

end

function love.resize(w, h)
	push:resize(w,h)
end

function love.keypressed(key)
	love.keyboard.keysPressed[key] = true

	if key == 'escape' then
		love.event.quit()
	end
end

function love.keyboard.wasPressed(key)
	if love.keyboard.keysPressed[key] then
		return true
	else
		return false
	end
end


function love.update(dt)

	gStateMachine:update(dt)

	love.keyboard.keysPressed = {} 
end



function love.draw()
	push:start()

	gStateMachine:render()

	displayFPS()

	push:finish()
end

function displayFPS()
	love.graphics.setFont(pixelFont)
	love.graphics.setColor(0/255, 255/255, 0/255, 255/255)
	love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
end