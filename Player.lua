Player = {
    x = 0,
    y = 0,
    xSpeed = 0,
    ySpeed = 0,
    size = 0,
    r = 0,
    g = 0,
    b = 0
}

function Player:new(x,y,xSpeed,ySpeed,size,r,g,b)
    t = {
        x = x,
        y = y,
        xSpeed = xSpeed,
        ySpeed = ySpeed,
        size = size,
        r = r,
        g = g,
        b = b
    }
    setmetatable(t,self)
    self.__index = self
    return t
end