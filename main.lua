-- Title: NumericTextFields
-- Name: Ryoma Scott 
-- Course: ICS2O/3C
-- This program displays a math equasion and asks the user to answer
--in a numeric textfield.
--terminal.


--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 255/255, 140/255, 140/255)

--create local variables

local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local randomOperator
local userAnswer
local correctAnswer

--local functions

local function AskQuestion()
	--generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 15)
	randomNumber2 = math.random(0, 30)
	randomOperator = math.random(1,3)

	-- subtraction
	if (randomOperator == 1) then
	correctAnswer = randomNumber1 - randomNumber2 
	questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "


	-- multiplication
	elseif (randomOperator == 2) then
		correctAnswer = randomNumber1 * randomNumber2
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

	-- addition
	elseif (randomOperator == 3) then
		correctAnswer = randomNumber1 + randomNumber2
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

		
		
	end

	

end

local function HideCorrect()
	correctObject.isVisible = false
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	--User begins editing "numericField"
	if ( event.phase == "began" ) then


		elseif event.phase == "submitted" then

			--when the answer is submitted (enter key is pressed) set user input to user's answer
			userAnswer = tonumber(event.target.text)

			--if the users answer and the correct answer are the same:
			if (userAnswer == correctAnswer) then
				correctObject.isVisible = true
				timer.performWithDelay(2000, HideCorrect)
				event.target.text = ""
			
			elseif (userAnswer ~= correctAnswer) then
				incorrectObject.isVisible = true
				timer.performWithDelay(2000, HideIncorrect)
				event.target.text = ""

		end
	end
end


	--Object creation

	--displays a question and sets the colour
	questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 40 )
	questionObject:setTextColor(255/255, 255/255, 0/255)

	--create the correct text object and make it invisible
	correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight/3, nil, 50 )
	correctObject:setTextColor(38/255, 90/255, 200/255)
	correctObject.isVisible = false

	--create the incorrect text object and make it invisible
	incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
	incorrectObject:setTextColor(100/255, 255/255, 10/255)
	incorrectObject.isVisible = false

--create numeric field
numericField = native.newTextField( display.contentWidth/2.1, display.contentHeight/2, 90, 80 )
numericField.inputType = "number"

--add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

--fucntion calls

--call the function to ask the question
AskQuestion()