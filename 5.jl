using HorizonSideRobots
HSR = HorizonSideRobots
robot = Robot("5.sit";animate=true)
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

function inv!(Side)
    if Side==Ost
        Side=Sud
    elseif Side==Nord
        Side=Ost
    elseif Side==West
        Side=Nord
    elseif Side==Sud
        Side=West
    end
    return Side
end
function inv2!(side)
    if side==Ost
        side=West
    elseif side==West
        side=Ost
    elseif side==Nord
        side=Sud
    else 
        side=Nord
    end
    return side
end
function inve!(Side)
    if Side==Ost
        Side=Nord
    elseif Side==Nord
        Side=West
    elseif Side==West
        Side=Sud
    elseif Side==Sud
        Side=Ost
    end
    return Side
end
function inve2!(side)
    if side==West
        side=Sud
        return Sud
    elseif side==Ost
        side=Nord
    elseif side==Nord
        side=West
    else 
        side=Ost
    end
    return side
end
function borderinside!(robot,side)
    v,l=vozvrat!(robot)
    kraska!(robot,Nord)
    move!(robot,Ost)
    while !isborder(robot,side)
        move!(robot,side)
        if isborder(robot,side) & ismarker(robot)
            move!(robot,Ost)
            if side==Sud
                side=Nord
            else
                side=Sud
            end
        end
    end
    if !ismarker(robot) & isborder(robot,side)
        po=0
        side1=side
        if side1==Sud
            toko=0
        else
            toko=1
        end
        side=Ost
        while po!=4
            while isborder(robot,side1)
                putmarker!(robot)
                move!(robot,side)
            end
            putmarker!(robot)
            if toko==0
                side1=inv2!(side)
                side=inv!(side)
            else
                side1=inve2!(side1)
                side=inve!(side)
            end
            move!(robot,side)
            po+=1
        end
    end
    while !isborder(robot,West)
        move!(robot,West)
    end
    while !isborder(robot,Sud)
        move!(robot,Sud)
    end
    vozvrat!(robot)
    for i in 1:v
        move!(robot,Nord)
    end
    for ii in 1:l
        move!(robot,Ost)
    end
end
borderinside!(robot,Nord)
sleep(6)



