Diploma = {
    clickable=true,
    show=true,
    x=100,
    y=300,
    name="Diploma",
    image=love.graphics.newImage("Diploma.png"),
    room=1
}

function Diploma:new(x,y,name,image,room)
    t = {
        x=x,
        y=y,
        name=name,
        image=image,
        room=room
    }
    setmetatable(self)
    self.__index = self
    return t
end