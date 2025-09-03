Plant = {
    clickable=false,
    show=true,
    x=500,
    y=550-34,
    name="Plant",
    description="A house plant, looks like it's been fed rubbing alchohol.",
    image=love.graphics.newImage("Plant.png"),
    width=40,
    length=34,
    room=1
}

function Plant:new(x,y,name,description,image,width,length,room)
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