--WB 2025

--CHARACTERS
require "Player"
require "Baron"
require "Butler"
require "Lady"
require "Maid"
require "Prince"
require "Professor"

--ITEMS
require "Diploma"

--THEME = REVEAL
screenWidth = 800
screenHeight = 600
floorHeight = 50

title = "Murder at the mansion"
characters = {Baron,Butler,Lady,Maid,Prince,Professor}
deadManName = ""
characterPos = {}
rooms = {"Living room","Kitchen","Bedroom"}
currentRoom = 1

displayTitleScreen = true
displayDeadMan = false
displayGameMain = false

speechText = ""

items = {Diploma}
inventory = {}

clueNum=0

function love.load()
    tombstone = love.graphics.newImage("Tombstone.png")
    diploma = love.graphics.newImage("Diploma.png")
    love.window.setMode(screenWidth,screenHeight)
    love.window.setTitle(title)
    killSomeone()
    setupCharacters()
end

function love.draw()
    if displayTitleScreen == true then
        drawTitleScreen()
        if displayDeadMan == true then
            drawDeadMan()
        end
    end

    if displayGameMain == true then
        --drawGameMain()
        drawUI()
        drawFloor()
        drawItems()
        if currentRoom == 1 then
            drawLivingRoom()
        end

        if currentRoom == 2 then
            drawKitchen()
        end

        if currentRoom == 3 then
            drawBedroom()
        end
    end
end

function love.update()
    tick()
end

function tick()
end

function drawDeadMan()
    love.graphics.print(tostring("The " .. deadManName .. " has died."),150,90)
    love.graphics.draw(tombstone,150,130)
    love.graphics.print("Solve the mystery",150,270)
end

function drawFloor()
    love.graphics.line(0,screenHeight - floorHeight,screenWidth,screenHeight - floorHeight)
end

function drawLivingRoom()
    positionCharacters()
    --love.graphics.draw(diploma,100,300)
end

function drawKitchen()
    positionCharacters()
end

function drawBedroom()
    positionCharacters()
end

function drawItems()
    for i=1,#items do
        if items[i].room == currentRoom and items[i].show == true then
            love.graphics.draw(items[i].image,items[i].x,items[i].y)
        end
    end
end

function love.mousepressed(x,y,button)
    --print(button)
    if displayTitleScreen == true then
        if button == 1 then
            if x >= 50 and x <= 50+50 and y >= 90 and y <= 90+10 then
                displayDeadMan = true
            end
            if displayDeadMan == true then
                if x >= 150 and x <= 150+50 and y >= 270 and y <= 270+10 then
                    displayTitleScreen = false
                    displayGameMain = true
                end
            end
        end
    end

    if displayGameMain == true then
        if button == 1 then
            searchForInteraction(x,y)
            searchForItems(x,y)
        end
    end
end

function searchForItems(x,y)
    for i=1,#items do
        if x >= items[i].x and x <= items[i].x + 50 and y >= items[i].y and y <= items[i].y + 50  and items[i].clickable == true then
            speechText = "Picked up " .. items[i].name
            table.insert(inventory,items[i].name)
            items[i].show = false
        end
    end
end

function searchForInteraction(x,y)
    characterY = screenHeight - floorHeight - 50
    for i=1,#characters do
        if x >= characters[i].x and x <= characters[i].x + 50 and y >= characterY and y <= characterY+50  and characters[i].dead == false then
            if characters[i].room == currentRoom then
                displayTalkingText(i,characters[i].name,characterY)
            end
        end

        if x >= characters[i].x and x <= characters[i].x + 50 and y >= characterY and y <= characterY+50  and characters[i].dead == true then
            if characters[i].room == currentRoom then
                speechText = "Dead men tell no tales detective."
            end
        end
    end
end

function displayTalkingText(index,name,y)
    --This function is super ugly, there is definetly a better way of doing it too.. super jank, but it works and I kinda dont care tbh.

    currentClue = "This is the " .. name .. "'s clue " .. tostring(clueNum)

    if name == "Professor" then
        speechText = "'I'm sorry but I only speak to learned men.'"
    end
    if name == "Professor" and isInArray("Faked Diploma") == true and characters[index].gotClue == false then
        speechText = "'Ah, a fellow savant. Fine ill let you in on what I know... " .. characters[index].clue .. "'"
        characters[index].gotClue = true
    end
    if name == "Professor" and isInArray("Diploma") == true then
        speechText = "'You must think i'm a halfwit, this diploma obviously is not yours.'"
    end
    if name == "Professor" and isInArray("Faked Diploma") == true and characters[index].gotClue == true then
        speechText = "'I've already told you detective " .. characters[index].clue .. "'"
    end

    if name == "Maid"  and characters[index].gotClue == true then
        speechText = "'You want to hear it again?.. " .. characters[index].clue .. "'"
    end
    if name == "Maid"  and characters[index].gotClue == false then
        characters[index].gotClue = true
        characters[index].clue = currentClue
        clueNum=clueNum+1
        speechText = "'Im only a simple maid but.. " .. characters[index].clue .. "'"
    end

    if name == "Butler" and characters[index].gotClue == true then
        speechText = "'Of course sir.. " .. characters[index].clue .. "'"
    end
    if name == "Butler" and characters[index].gotClue == false then
        characters[index].gotClue = true
        characters[index].clue = currentClue
        clueNum=clueNum+1
        speechText = "'While I may be a butler.. " .. characters[index].clue .. "'"
    end
end

function isInArray(item)
    if #inventory > 0 then
        for i=1,#inventory do
            if inventory[i] == item then
                return true
            end
        end
    end
end

function love.keypressed(key)
    if displayGameMain == true then
        if key == "left" and currentRoom > 1 then
            currentRoom = currentRoom - 1
            print("Left")
        end
        if key == "right" and currentRoom < #rooms then
            currentRoom = currentRoom + 1
            print("Right")
        end
    end
end

function positionCharacters()
    for i=1,#characters do
        if characters[i].room == currentRoom then
            love.graphics.rectangle("fill",characters[i].x,screenHeight - floorHeight - 50,50,50)
            love.graphics.setColor(0,0,0)
            love.graphics.print(characters[i].name,characters[i].x,screenHeight - floorHeight - 50)
            love.graphics.setColor(255,255,255)
        end
    end
end

function drawUI()
    love.graphics.print(speechText)
    love.graphics.print(rooms[currentRoom],0,550)
end

function setupCharacters()
    pos = 0
    for i=1,#characters do
        pos = pos + love.math.random(100,150)
        characters[i].room = love.math.random(1,#rooms)
        characters[i].x = pos
    end
end

function killSomeone()
    personToBeKilled = love.math.random(#characters)
    print(characters[personToBeKilled].name)
    deadManName = characters[personToBeKilled].name
    characters[personToBeKilled].dead = true
end

function drawTitleScreen()
    love.graphics.print(title,50,50)
    love.graphics.print("Start",50,90)
end