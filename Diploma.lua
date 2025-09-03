Diploma = {
    clickable=true,
    show=true,
    x=100,
    y=300,
    name="Diploma",
    description="A diploma, doesnt look like it belongs to you",
    image=love.graphics.newImage("Diploma.png"),
    width=50,
    length=50,
    room=1
}

function Diploma:new(x,y,name,description,image,width,length,room)
    t = {
        x=x,
        y=y,
        name=name,
        description=description,
        image=image,
        width=width,
        length=length,
        room=room
    }
    setmetatable(self)
    self.__index = self
    return t
end