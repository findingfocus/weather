Player = Class{}

function Player:init(x, y, width, height)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
end

function Player:update(dt)
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

	if self.y < 0 then
		self.y = 0
	end

	if self.y > VIRTUAL_HEIGHT - self.height then
		self.y = VIRTUAL_HEIGHT - self.height
	end
end

function Player:render()
	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end