using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("8.sit";animate=true)
function vstalvugol!(r)
    while !isborder(r,Sud)
        move!(r,Sud)
    end
    while !isborder(r,West)
        move!(r,West)
    end
end
function reverse!(side)
    if side==Sud
        side=Nord
    else
        side=Sud
    end
    return side
end
function pognali!(r)
    vstalvugol!(r)
    side=Nord
    st=0
    while !(isborder(r,Ost) && isborder(r,Sud))
        while !isborder(r,side)
            if ismarker(r)
                st=1
                break
            end
            move!(r,side)
        end
        side=reverse!(side)
        if st==1
            break
        end
        move!(r,Ost)
    end
end
pognali!(r)
sleep(3)