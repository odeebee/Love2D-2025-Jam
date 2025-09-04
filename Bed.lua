Bed = {
    clickable=false,
    show=true,
    x=400,
    y=550-50,
    name="Bed",
    description="An incredibly comfortable looking bed, just look at those pixel perfect curves.",
    image=love.graphics.newImage("New Piskel(17).png"),
    width=100,
    length=50,
    room=3
}

function  Bed:new(x,y,name,description,image,width,length,room)
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