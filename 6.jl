using HorizonSideRobots
HSR = HorizonSideRobots
robot = Robot("6.sit";animate=true)
function startwithnul!(robot)
    vniz,vlevo=0,0
    history=[]
    while !isborder(robot,West) || !isborder(robot,Sud)
        if !isborder(robot,Sud)
            push!(history,Nord)
            move!(robot,Sud)
        else
            push!(history,Ost)
            move!(robot,West)
        end
    end
    return history
end
function Robotalwayscomeback!(robot)
    history=reverse(startwithnul!(robot))
    kraska!(robot,Nord)
    for i in history
        move!(robot,i)
    end
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
Robotalwayscomeback!(robot)
sleep(3)