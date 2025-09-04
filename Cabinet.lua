Cabinet = {
    clickable=false,
    show=true,
    x=400,
    y=550-50,
    name="Cabinet",
    description="A stationary cabinet, looks like theres some unbranded correction fluid inside.",
    image=love.graphics.newImage("Cabinet.png"),
    width=50,
    length=50,
    room=1
}

function  Cabinet:new(x,y,name,description,image,width,length,room)
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