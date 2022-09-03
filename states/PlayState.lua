PlayState = Class{__includes = BaseState}

function PlayState:init()
	player = Player(0, 0, 40, 40)
	mountainBiome = Biome('mountain', 450, 100, 240, VIRTUAL_HEIGHT - GROUND_HEIGHT)
	forestBiome = Biome('forest', 600, VIRTUAL_HEIGHT - GROUND_HEIGHT, 100, VIRTUAL_HEIGHT - GROUND_HEIGHT)
	valleyBiome = Biome('valley', 1000, 300, 800, VIRTUAL_HEIGHT - GROUND_HEIGHT)
	titleRED = 255
	titleGREEN = 100
	titleBLUE = 255
	redDESCENDING = true
	greenDESCENDING = true
	blueDESCENDING = true
	scale1 = 4
	scale2 = 3
	scale3 = 2
end

function PlayState:update(dt)
	player:update(dt)
	mountainBiome:GetHypotLength()
	forestBiome:GetHypotLength()
	valleyBiome:GetHypotLength()
	player:GetHypotLength(mountainBiome)
	player:GetHypotLength(forestBiome)
	player:GetHypotLength(valleyBiome)
	sounds['mountain']:setLooping(true)
	sounds['mountain']:setVolume(player.mountainTween)
	sounds['mountain']:play()
	sounds['birds']:setLooping(true)
	sounds['birds']:setVolume(player.valleyTween)
	sounds['birds']:play()
	sounds['thunder']:setLooping(true)
	sounds['thunder']:setVolume(player.thunderTween)
	sounds['thunder']:play()

	if redDESCENDING then
		titleRED = titleRED - 1 / scale1
		if titleRED < 80 then
			titleRED = 80
			redDESCENDING = false
		end
	else
		titleRED = titleRED + 1 / scale1
		if titleRED > 255 then
			titleRED = 255
			redDESCENDING = true
		end
	end

		if greenDESCENDING then
		titleGREEN = titleGREEN - 1 / scale2
		if titleGREEN < 80 then
			titleGREEN = 80
			greenDESCENDING = false
		end
	else
		titleGREEN = titleGREEN + 1 / scale2
		if titleGREEN > 255 then
			titleGREEN = 255
			greenDESCENDING = true
		end
	end

		if blueDESCENDING then
		titleBLUE = titleBLUE - 1 / scale3
		if titleBLUE < 80 then
			titleBLUE = 80
			blueDESCENDING = false
		end
	else
		titleBLUE = titleBLUE + 1 / scale3
		if titleBLUE > 255 then
			titleBLUE = 255
			blueDESCENDING = true
		end
	end
end


function PlayState:render()
	love.graphics.clear(150/255, 150/255, 150/255, 255/255)
	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
	love.graphics.draw(BG, 0, 0, 0, .68, .68)
	love.graphics.setColor(titleRED/255, titleGREEN/255, titleBLUE/255, 255/255)
	love.graphics.print('WEATHER', VIRTUAL_WIDTH / 3 + 540, 150)
	mountainBiome:render()
	forestBiome:render()
	valleyBiome:render()
	player:render()
end 

