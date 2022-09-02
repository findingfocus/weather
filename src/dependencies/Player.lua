Player = Class{}

function Player:init(x, y, width, height)
	self.x = x
	self.y = y
	self.cX = 0
	self.cY = 0
	self.aLength = 0
	self.bLength = 0
	self.cLength = 0
	self.width = width
	self.height = height
	self.mountainTween = 0
	self.valleyTween = 0
	self.thunderTween = 0
	--self.mountain = Biome('mountain', x, y, marker)
	--self.biomes = {Biome('mountain', x, y, marker), Biome('forest', x, y, marker)}
end

function Player:GetHypotLength(biome)
	self.cX = biome.biomeX
	self.cY = self.y
	biome.playerALength = math.abs(self.cX - self.x)
	biome.playerBLength = math.abs(self.cY - biome.biomeY)
	----use pythag
	biome.playerCLength = math.floor(math.sqrt((biome.playerALength^2) + (biome.playerBLength^2)))
end

function Player:update(dt)
--[[
	for biome, biomes in pairs(self.biomes) do
	 	 = biomes:getTweenValue('mountain')

	end
--]]

	if love.keyboard.isDown('left') then
		self.x = self.x - PLAYER_SPEED
	end

	if love.keyboard.isDown('right') then
		self.x = self.x + PLAYER_SPEED
	end

	if self.x > VIRTUAL_WIDTH - self.width then
		self.x = VIRTUAL_WIDTH - self.width
	end

	if self.x < 0 then
		self.x = 0
	end

	if love.keyboard.isDown('up') then
		self.y = self.y - PLAYER_SPEED
	end

	if love.keyboard.isDown('down') then
		self.y = self.y + PLAYER_SPEED
	end

	--CLAMPING PLAYER TO SCREEN BOUNDARIES
	if self.y < 0 then
		self.y = 0
	end

	if self.y > VIRTUAL_HEIGHT - self.height then
		self.y = VIRTUAL_HEIGHT - self.height
	end

	--TEST TWEEN VALUES FOR LEFT AND RIGHT
	if mountainBiome.playerCLength > mountainBiome.cLength then
		self.mountainTween = 0
	else
		self.mountainTween = 1 - mountainBiome.playerCLength / mountainBiome.cLength
	end

	if valleyBiome.playerCLength > valleyBiome.cLength then
		self.valleyTween = 0
	else
		self.valleyTween = 1 - valleyBiome.playerCLength / valleyBiome.cLength
	end

	if forestBiome.playerCLength > forestBiome.cLength then
		self.thunderTween = 0
	else
		self.thunderTween = 1 - forestBiome.playerCLength / forestBiome.cLength
	end
end

function Player:render()
	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
	love.graphics.print('tween: ' .. tostring(self.mountainTween), 10, 350)
	love.graphics.print('cLength: ' .. tostring(mountainBiome.playerCLength), 10, 400)
end