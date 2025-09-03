Lady = {
    clue="",
    gotClue=false,
    dead = false,
    murderer = false,
    room = 1,
    x = 0,
    name = "Lady"
}

function Lady:new(dead,murderer,room,x,name)
    t = {
        clue=clue,
        gotClue=gotClue,
        dead = dead,
        murderer = murderer,
        room = room,
        x = x,
        name = name
    }
    setmetatable(t,self)
    self.__index = self
    return t
end