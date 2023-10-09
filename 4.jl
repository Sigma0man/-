using HorizonSideRobots
HSR = HorizonSideRobots
robot = Robot("4.sit";animate=true)
putmarker!(robot)
function inverse!(Side)
    if Side==Nord
        Side=Sud
    elseif Side==Sud
        Side=Nord
    elseif Side==West
        Side=Ost
    else
        Side=West
    return Side
    end
end
function spuskpod!(robot,Side,sid2)
    n=0
    k=0
    while !isborder(robot,Side)
        if !isborder(robot,sid2)
            putmarker!(robot)
            n=n+1
            move!(robot,Side)
            move!(robot,sid2)
            k=k+1
        else
            break
        end
    end
    putmarker!(robot)
    Side=inverse!(Side)
    sid2=inverse!(sid2)
    for i in 1:n
        move!(robot,Side)
    end
    for i in 1:k
        move!(robot,sid2)
    end
end
spuskpod!(robot,Sud,West)
spuskpod!(robot,Sud,Ost)
spuskpod!(robot,Nord,West)
spuskpod!(robot,Nord,Ost)
sleep(5)
