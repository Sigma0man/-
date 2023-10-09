using HorizonSideRobots
HSR = HorizonSideRobots
robot = Robot("3.sit";animate=true)
function vozvrat!(robot)
    vniz=0
    vlevo=0
    while !isborder(robot,Sud)
        vniz=vniz+1
        move!(robot,Sud)
    end
    while !isborder(robot,West)
        vlevo=vlevo+1
        move!(robot,West)
    end
    return vniz,vlevo
end
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
function zakrasit!(robot)
    n,l=vozvrat!(robot)
    Side=Nord
    while !isborder(robot,Ost)
        if !isborder(robot,Side)
            putmarker!(robot)
            move!(robot,Side)
        else
            putmarker!(robot)
            move!(robot,Ost)
            Side=inverse!(Side)
        end
    end
    while !isborder(robot,Sud)
        putmarker!(robot)
        move!(robot,Sud)
    end
    while !isborder(robot,West)
        putmarker!(robot)
        move!(robot,West)
    end
    for i in  0:n-1
        move!(robot,Nord)
    end
    for ii in  0:l-1
        move!(robot,Ost)
    end
end
zakrasit!(robot)
sleep(5)