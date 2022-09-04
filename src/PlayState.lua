PlayState = Class{__includes = BaseState}

function PlayState:init()
	player = Player(0, 0, 40, 40)
	mountainBiome = Biome('mountain', 530, 80, 300, VIRTUAL_HEIGHT - GROUND_HEIGHT - 120)
	forestBiome = Biome('forest', 600, VIRTUAL_HEIGHT - GROUND_HEIGHT, 100, VIRTUAL_HEIGHT - GROUND_HEIGHT)
	valleyBiome = Biome('valley', 1000, 300, 800, VIRTUAL_HEIGHT - GROUND_HEIGHT)
	R2D2Biome = Biome('R2D2', 835, 240, 820, 255)
	titleRED = 255
	titleGREEN = 100
	titleBLUE = 255
	redDESCENDING = true
	greenDESCENDING = true
	blueDESCENDING = true
	scale1 = 4
	scale2 = 3
	scale3 = 2
	rainTimer = 3
	rainImage = rain1
	windTimer = 4
	windImage = wind1
end

function PlayState:update(dt)

	--RAIN ANIMATION
	rainTimer = rainTimer - .3
	if rainTimer < 0 then
		rainTimer = 3
	end
	if rainTimer > 2 and rainTimer <=3 then
		rainImage = rain1
	elseif rainTimer > 1 and rainTimer <=2 then
		rainImage = rain2
	elseif rainTimer <= 1 then
		rainImage = rain3
	end

	--WIND ANIMATION
	windTimer = windTimer - .25
	if windTimer < 0 then
		windTimer = 4
	end
	if windTimer > 3 and windTimer <= 4 then
		windImage = wind1
	elseif windTimer > 2 and windTimer <=3 then
		windImage = wind2
	elseif windTimer > 1 and windTimer <=2 then
		windImage = wind3
	elseif windTimer <= 1 then
		windImage = wind4
	end

	player:update(dt)
	mountainBiome:GetHypotLength()
	forestBiome:GetHypotLength()
	valleyBiome:GetHypotLength()
	R2D2Biome:GetHypotLength()
	player:GetHypotLength(mountainBiome)
	player:GetHypotLength(forestBiome)
	player:GetHypotLength(valleyBiome)
	player:GetHypotLength(R2D2Biome)
	sounds['mountain']:setLooping(true)
	sounds['mountain']:setVolume(player.mountainTween)
	sounds['mountain']:play()
	sounds['birds']:setLooping(true)
	sounds['birds']:setVolume(player.valleyTween)
	sounds['birds']:play()
	sounds['thunder']:setLooping(true)
	sounds['thunder']:setVolume(player.thunderTween)
	sounds['thunder']:play()
	sounds['R2D2']:setLooping(true)
	sounds['R2D2']:setVolume(player.R2D2Tween)
	sounds['R2D2']:play()

	if redDESCENDING then
		titleRED = titleRED - 1 / scale1
		if titleRED < 150 then
			titleRED = 150
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
		if titleGREEN < 150 then
			titleGREEN = 150
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
		if titleBLUE < 150 then
			titleBLUE = 150
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
	player:render()

	love.graphics.setColor(255/255, 255/255, 255/255, player.windTween/255)
	love.graphics.draw(windImage, 0, 0)

	love.graphics.setColor(255/255, 255/255, 255/255, player.rainTween/255)
	love.graphics.draw(rainImage, 0, 0)

	love.graphics.setColor(255/255, 255/255, 255/255, player.flareTween/255)
	love.graphics.draw(flare, 0, 0)
end 

