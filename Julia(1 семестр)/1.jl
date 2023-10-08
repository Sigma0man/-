using HorizonSideRobots
HSR = HorizonSideRobots
robot = Robot("1.sit";animate=true)
function reverse!(side)
    if side==Sud
        side=Nord
    elseif side==Nord
        side=Sud
    elseif side==West
        side=Ost
    else
        side=West
    end
    return side
end
function along!(robot,Side)
    k=0
    while !isborder(robot,Side)
        putmarker!(robot)
        move!(robot,Side)
        k+=1
    end
    putmarker!(robot)
    side=reverse!(Side)
    while k>0
        move!(robot,side)
        k-=1
    end
end
sleep(3)
function kraska!(robot)
    for i in [Sud,Nord,West,Ost]
        along!(robot,i)
    end
end
kraska!(robot)
sleep(4)