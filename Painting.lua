Painting = {
    clickable=false,
    show=true,
    x=420,
    y=400,
    name="Painting",
    description="A painting, you dont quite know what it depicts though.",
    image=love.graphics.newImage("Painting.png"),
    width=15,
    length=30,
    room=3
}

function  Painting:new(x,y,name,description,image,width,length,room)
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