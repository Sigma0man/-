using HorizonSideRobots
robot = Robot("2.sit";animate=true)
function voz(robot)
    k=0
    while !isborder(robot,Sud)
        move!(robot,Sud)
        k=k+1
    end
    pr=0
    while !isborder(robot,West)
        move!(robot,West)
        pr=pr+1
    end
    return k,pr
end

function inversia!(Side)
    if Side==Ost
        Side=Sud
    elseif Side==Sud
        Side=West
    elseif Side==Nord
        Side=Ost
    else
        return 2
    end
    return Side
end
function rsh!(robot)
    s,p=voz(robot)
    kraska!(robot,Nord)
    for i in 1:s
        move!(robot,Ost)
    end
    for i in 1:p
        move!(robot,Nord)
    end
end
function kraska!(robot,Side)
    while !isborder(robot,Side) 
        putmarker!(robot)
        move!(robot,Side)
    end
    if isborder(robot,Side) 
        Side=inversia!(Side)
        if Side==2
            return 0
        end
        putmarker!(robot)
        kraska!(robot,Side)
    end
end
rsh!(robot)
sleep(2)