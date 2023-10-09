using HorizonSideRobots
k = parse(Int, readline())
r = Robot("10.sit";animate=true)
sleep(3)
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
function pognali!(r,n)
    niz,l=vozvrat!(r)
    side=Nord
    n=n-1
    po=0
    st=0
    poi=0
    while !isborder(r,side) && !isborder(r,Ost)
        while !isborder(r,side)
            if st==1 && po<n
                putmarker!(r)
                move!(r,side)
                po+=1
            elseif st==1 && po==n
                putmarker!(r)
                move!(r,side)
                po=0
                st=0
            elseif st==0 && po<n
                move!(r,side)
                po+=1
            elseif st==0 && po==n
                move!(r,side)
                po=0
                st=1
            end
            if isborder(r,side)
                if st==1
                    po+=1
                    putmarker!(r)
                else
                    po+=1
                end
                if !isborder(r,Ost)
                    side=reverse!(side)
                    move!(r,Ost)
                end
                if poi<n
                    poi+=1
                else
                    poi=0
                    if st==1
                        st=0
                    else
                        st=1
                    end
                end
                while po>0 && !isborder(r,side)
                    if st==1
                        putmarker!(r)
                        move!(r,side)
                        po-=1
                    else
                        move!(r,side)
                        po-=1
                    end
                end
                if st==1
                    st=0
                else
                    st=1
                end
            end
        end
    end
    vozvrat!(r)
    for i in 1:niz
        move!(r,Nord)
    end
    for ii in 1:l
        move!(r,Ost)
    end
end
pognali!(r,k)
sleep(2)
