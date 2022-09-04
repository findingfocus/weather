Biome = Class{}

function Biome:init(name, biomeX, biomeY, markerX, markerY)
	self.name = name
	self.aLength = 0
	self.bLength = 0
	self.cLength = 0
	self.playerALength = 0
	self.playerBLength = 0
	self.playerCLength = 0
	self.biomeX = biomeX
	self.biomeY = biomeY
	self.cX = 0
	self.cY = 0
	self.width = 20
	self.height = 20
	self.markerX = markerX
	self.markerY = markerY 
end

function Biome:GetHypotLength()
	self.cX = self.biomeX
	self.cY = self.markerY

	self.aLength = math.abs(self.cX - self.markerX)
	self.bLength = math.abs(self.cY - self.biomeY)
	--use pythag
	self.cLength = math.floor(math.sqrt((self.aLength^2) + (self.bLength^2)))
end

function Biome:update(dt)

end

function Biome:render()
	--[[
	--Renders Biome Placement
	love.graphics.setColor(96/255, 149/255, 247/255, 255/255)
	love.graphics.rectangle('fill', self.biomeX, self.biomeY, self.width, self.height)

	--Renders BiomeMarker
	love.graphics.setColor(255/255, 60/255, 60/255, 255/255)
	love.graphics.rectangle('fill', self.markerX, self.markerY, self.width, self.height)
	--]]
end