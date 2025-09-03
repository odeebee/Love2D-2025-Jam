Lamp = {
    clickable=false,
    show=true,
    x=10,
    y=550-60,
    name="Lamp",
    description="A simple lamp.",
    image=love.graphics.newImage("Lamp.png"),
    width=30,
    length=60,
    room=1
}

function Lamp:new(x,y,name,description,image,width,length,room)
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