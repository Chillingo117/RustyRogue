-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

--constants
centerX = display.contentCenterX
centerY = display.contentCenterY
phoneHeight = display.actualContentHeight --inverted for some unknown reason, hence reverted at redBox creation

lives = 3 ---------------lives modifer
score = 0


local function doesLiterallyNothing()
end

--------------------------------------------------------------------------------------------------------------------------------------------------------
local physics = require("physics") --sets and starts physics
physics.start()
x = 2

gravity = 15 * math.log(x)
physics.setGravity(0, gravity)

function increaseGravity() --increments gravity, used in redBox
	x = x + 1
	gravity =  15 * math.log(x)  --math can be modified to change redbox speed
	physics.setGravity(0, gravity)
end
	


--------------------------------------------------------------------------------------------------------------------------------------------------------
local background = display.newImageRect( "background.png", 560, 780) --sets background
background.x = centerX
background.y = centerY

function sendToBack() --sends background to back
	background:toBack()                                 
	return true
end

sendToBack()

--------------------------------------------------------------------------------------------------------------------------------------------------------
local redBox = display.newImageRect("redBox.png", 70, 100) --creates redBox
redBox.x = centerX
redBox.y = -phoneHeight

physics.addBody(redBox) --lets redBox get affected by gravity

local function createRedBox() -- creates new redBox, used in reset RedBox
	redBox = display.newImageRect("redBox.png", 70, 100)
	redBox.x = centerX
	redBox.y = -phoneHeight
	physics.addBody(redBox)
end

local function resetRedBox() --removes redBox, calls to create a new one
	redBox:removeSelf()
	redBox = nil
	timer.performWithDelay(100, createRedBox)
end

--------------------------------------------------------------------------------------------------------------------------------------------------------
local playerBox = display.newImageRect("playerBox.png", 70, 70) --creates player
playerBox.x = centerX
playerBox.y = phoneHeight -90

physics.addBody(playerBox, "static")-- lets playerBox collide

--------------------------------------------------------------------------------------------------------------------------------------------------------
local sheetOptions = 
{
	frames =
	{
		{   -- a
            x = 15,
            y = 0,
            width = 57,
            height = 90
        },
        {   -- b
            x = 72,
            y = 0,
            width = 40,
            height = 90
        },
        {   -- c
            x = 112,
            y = 0,
            width = 59,
            height = 90
        },
		{   -- d
            x = 167,
            y = 0,
            width = 57,
            height = 90
        },
		{   -- e
            x = 217,
            y = 0,
            width = 50,
            height = 90
        },
		{   -- f
            x = 257,
            y = 0,
            width = 45,
            height = 90
        },
		{   -- g
            x = 300,
            y = 0,
            width = 57,
            height = 90
        },
		{   -- h
            x = 350,
            y = 0,
            width = 65,
            height = 90
        },
		{   -- i
            x = 410,
            y = 0,
            width = 20,
            height = 90
        },
		{   -- j
            x = 426,
            y = 0,
            width = 35,
            height = 90
        },
		{   -- k
            x = 460,
            y = 0,
            width = 54,
            height = 90
        },
		{   -- l
            x = 510,
            y = 0,
            width = 40,
            height = 90
        },
		{   -- m
            x = 545,
            y = 0,
            width = 70,
            height = 90
        },
		{   -- n
            x = 617,
            y = 0,
            width = 60,
            height = 90
        },
		{   -- o
            x = 18,
            y = 105,
            width = 57,
            height = 90
        },
		{   -- p
            x = 75,
            y = 105,
            width = 50,
            height = 90
        },
		{   -- q
            x = 120,
            y = 110,
            width = 60,
            height = 90
        },
		{   -- r
            x = 183,
            y = 105,
            width = 50,
            height = 90
        },
		{   -- s
            x = 229,
            y = 105,
            width = 45,
            height = 90
        },
		{   -- t
            x = 270,
            y = 105,
            width = 50,
            height = 90
        },
		{   -- u
            x = 315,
            y = 105,
            width = 55,
            height = 90
        },
		{   -- v
            x = 365,
            y = 105,
            width = 55,
            height = 90
        },
		{   -- w
            x = 420,
            y = 105,
            width = 75,
            height = 90
        },
		{   -- x
            x = 495,
            y = 105,
            width = 47,
            height = 90
        },
		{   -- y
            x = 540,
            y = 105,
            width = 45,
            height = 90
        },
		{   -- z
            x = 585,
            y = 105,
            width = 50,
            height = 90
        },
	},
}
local objectSheet = graphics.newImageSheet("Alphabet.png", sheetOptions) --creates sprites for letters

--------------------------------------------------------------------------------------------------------------------------------------------------------
letterIndex = 3
local function newLetter()
	letterIndex = math.random(26)

	local letter = display.newImageRect(objectSheet, letterIndex, 65, 65)
	letter.x = centerX
	letter.y = phoneHeight -90
end

newLetter()

local function deleteLetter()
	letter:removeSelf()
	letter = nil
end

--------------------------------------------------------------------------------------------------------------------------------------------------------
local function onLocalCollision(self, event) --when redBox hits player
	if(event.phase == "began") then
		lives = lives - 1
		timer.performWithDelay(100, resetRedBox())
		timer.performWithDelay(100, increaseGravity())
	end
end

playerBox.collision = onLocalCollision --colision listener
playerBox:addEventListener("collision")

local function keyTyped(event)
	if (event.phase == "down") then
		if(event.keyName== "a") then
			enteredIndex = 1
		end
		if(event.keyName== "b") then
			enteredIndex = 2
		end
		if(event.keyName== "c") then
			enteredIndex = 3
		end
		if(event.keyName== "d") then
			enteredIndex = 4
		end
		if(event.keyName== "e") then
			enteredIndex = 5
		end
		if(event.keyName== "f") then
			enteredIndex = 6
		end
		if(event.keyName== "g") then
			enteredIndex = 7
		end
		if(event.keyName== "h") then
			enteredIndex = 8
		end
		if(event.keyName== "i") then
			enteredIndex = 9
		end
		if(event.keyName== "j") then
			enteredIndex = 10
		end
		if(event.keyName== "k") then
			enteredIndex = 11
		end
		if(event.keyName== "l") then
			enteredIndex = 12
		end
		if(event.keyName== "m") then
			enteredIndex = 13
		end
		if(event.keyName== "n") then
			enteredIndex = 14
		end
		if(event.keyName== "o") then
			enteredIndex = 15
		end
		if(event.keyName== "p") then
			enteredIndex = 16
		end
		if(event.keyName== "q") then
			enteredIndex = 17
		end
		if(event.keyName== "r") then
			enteredIndex = 18
		end
		if(event.keyName== "s") then
			enteredIndex = 19
		end
		if(event.keyName== "t") then
			enteredIndex = 20
		end
		if(event.keyName== "u") then
			enteredIndex = 21
		end
		if(event.keyName== "v") then
			enteredIndex = 22
		end
		if(event.keyName== "w") then
			enteredIndex = 23
		end
		if(event.keyName== "x") then
			enteredIndex = 24
		end
		if(event.keyName== "y") then
			enteredIndex = 25
		end
		if(event.keyName== "z") then
			enteredIndex = 26
		end
		if(enteredIndex == letterIndex) then
			score = score + 1
			timer.performWithDelay(100, resetRedBox())
			timer.performWithDelay(100, increaseGravity())
		end
	end
end

Runtime:addEventListener("key", keyTyped)