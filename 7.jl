using HorizonSideRobots
r = Robot("7.sit";animate=true)
function inversia!(Side)
    if Side==Ost
        Side=West
    else
        Side=Ost
    end
    return Side
end

function vozvrat(r,side,o)
    for i in 0:o
        move!(r,inversia!(side))
    end
end

function detector!(r,o,side)
    for i in 0:o
        move!(r,side)
        if !isborder(r,Nord)
            return true
        end
    end
    vozvrat(r,(side),o)
    return false
end

function ostanovka!(r)
    o=0
    side=Ost
    f=detector!(r,o,side)
    while !f
        side=inversia!(side)
        f=detector!(r,(o),side)
        o+=1
    end
end
ostanovka!(r)
