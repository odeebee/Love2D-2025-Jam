Mirror = {
    clickable=false,
    show=true,
    x=355,
    y=550-30-15,
    name="Mirror",
    description="You look into the mirror and a sad shrew like creature stares back at you. Oh.. ",
    image=love.graphics.newImage("Mirror.png"),
    width=15,
    length=15,
    room=3
}

function Mirror:new(x,y,name,description,image,width,length,room)
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