Sofa = {
    clickable=false,
    show=true,
    x=300,
    y=550-48,
    name="Sofa",
    description="It's just a poorly drawn sofa.",
    image=love.graphics.newImage("Sofa.png"),
    width=95,
    length=48,
    room=1
}

function Sofa:new(x,y,name,description,image,width,length,room)
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