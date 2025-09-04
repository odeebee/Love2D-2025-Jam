Pencase = {
    clickable=true,
    show=true,
    x=420,
    y=550-50-15,
    name="Sharpie",
    description="A case of pens, just taking one couldn't hurt.",
    image=love.graphics.newImage("Pencase.png"),
    width=15,
    length=15,
    room=1
}

function  Pencase:new(x,y,name,description,image,width,length,room)
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