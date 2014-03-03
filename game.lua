
local physics = require("physics")
local storyboard = require("storyboard")

local scene = storyboard.newScene()
local bkg1
local bkg2
local jet

function scene:createScene(event)
	local group = self.view

	bkg1 = display.newImage("bkg_loop.png")
	bkg1.speed = 1
	bkg1.enterFrame = scrollBackground
	bkg1.height = 320
	bkg1.width = 480
	bkg1.anchorX = 0
	bkg1.anchorY = 0
	bkg1.x = 0

	bkg2 = display.newImage("bkg_loop.png")
	bkg2.speed = 1
	bkg2.x = 480
	bkg2.width = 480
	bkg2.height = 320
	bkg2.enterFrame = scrollBackground
	bkg2.anchorX = 0
	bkg2.anchorY = 0

	jet = display.newImage("redJet.png")
	jet.x = 100
	jet.y = 100

	group:insert(bkg1)
	group:insert(bkg2)
	group:insert(jet)

end


function scene:willEnterScene(event)
	physics.start()
	physics.addBody(jet, "dynamic", {density=.1, bounce=0.1, friction=.2, radius=12})

	Runtime:addEventListener("enterFrame", bkg1)
	Runtime:addEventListener("enterFrame", bkg2)

	Runtime:addEventListener("touch", touchScreen)
end

function scene:enterScene(event)
end

function scene:exitScene(event)
end

function scene:didExitScene(event)
end

function scene:destroyScene(event)
end

function touchScreen(event)
	if (event.phase == 'began') then
		print("Touch began")
		if (jet.y < 300) then
			jet.enterFrame = activateEngine
			Runtime:addEventListener("enterFrame", jet)
		end
	end

	if (event.phase == "ended") then
		print("Touch ended")
		Runtime:removeEventListener("enterFrame", jet)
	end
end

function scrollBackground(self, event)
	if (self.x < -480) then
		self.x = 480 - 3
	else
		self.x = self.x - self.speed
	end
end

function activateEngine(self, event)
	self:applyForce(0, -0.5, self.x, self.y)
end

scene:addEventListener("createScene", scene)
scene:addEventListener("willEnterScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("didExitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene