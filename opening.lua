
local storyboard = require("storyboard")
local scene = storyboard.newScene()

local widget = require("widget")
local handleStart

function scene:createScene(event)
	local group = self.view

	local bkg = display.newImage("background.png")
	bkg.anchorX = 0
	bkg.anchorY = 0
	group:insert(bkg)

	local jetText = display.newText("Jet", 200, 50, "Helvetica", 32)
	group:insert(jetText)

	local startBtn = widget.newButton{
		left=display.contentWidth/4,
		top=80,
		id="startBtn",
		label="Start Game",
		onEvent=handleStart
	}

	group:insert(startBtn)

end

function scene:willEnterScene(event)
end

function scene:enterScene(event)
end

function scene:exitScene(event)
end

function scene:didExitScene(event)
end

function scene:destroyScene(event)
end

function handleStart(event)
	storyboard.gotoScene("game")
end
scene:addEventListener("createScene", scene)
scene:addEventListener("willEnterScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("didExitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene