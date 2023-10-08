using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("9.sit";animate=true)
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
function reverse!(side)
    if side==Sud
        side=Nord
    else
        side=Sud
    end
    return side
end
function pognali!(r)
    vniz,vlevo=vozvrat!(r)
    side=Nord
    st=0
    while !(isborder(r,Ost) )
        while !isborder(r,side)
            if st==0
                move!(r,side)
                st=1
            else
                putmarker!(r)
                move!(r,side)
                st=0
            end
        end
        side=reverse!(side)
        if st==0
            move!(r,Ost)
            st=1
        else
            putmarker!(r)
            move!(r,Ost)
            st=0
        end
    end
    while !isborder(r,Sud)
        if st==0
            move!(r,Sud)
            st=1
        else
            putmarker!(r)
            move!(r,Sud)
            st=0
        end
    end
    if st==1
        putmarker!(r)
        st=0
    end
    while !isborder(r,West)
        move!(r,West)
    end
    for i in 1:vniz
        move!(r,Nord)
    end
    for i in 1:vlevo
        move!(r,Ost)
    end
end
pognali!(r)
sleep(5)