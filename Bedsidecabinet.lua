Bedsidecabinet = {
    clickable=false,
    show=true,
    x=350,
    y=550-30,
    name="Bedside cabinet",
    description="The iconic bedside cabinet.",
    image=love.graphics.newImage("Bedsidecabinet.png"),
    width=30,
    length=30,
    room=3
}

function  Bedsidecabinet:new(x,y,name,description,image,width,length,room)
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