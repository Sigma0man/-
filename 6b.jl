using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("6b.sit";animate=true)
sleep(4)
function inverse!(Side)
    if Side==Nord
        Side=Sud
    elseif Side==Sud
        Side=Nord
    elseif Side==West
        Side=Ost
    else
        Side=West
    end
    return Side
end
function prohodvnogi!(r,Side,t)
    if Side==Nord || Side==Sud
        k=0
        while isborder(r,Side)
            move!(r,Ost)
            push!(t,Ost)
            k+=1
        end
        move!(r,Side)
        push!(t,Side)
        while isborder(r,West)
            move!(r,Side)
            push!(t,Side)
        end
        while k>0
            move!(r,West)
            push!(t,West)
            k-=1
        end
    else
        k=0
        while isborder(r,Side)
            move!(r,Nord)
            push!(t,Nord)
            k+=1
        end
        move!(r,Side)
        push!(t,Side)
        while isborder(r,Sud)
            move!(r,Side)
            push!(t,Side)
        end
        while k>0
            move!(r,Sud)
            push!(t,Sud)
            k-=1
        end
    end
    return t
end
function tudisudi!(r)
    for i in [Ost,West,Nord,Sud]
        t=[]
        u=0
        while u==0
            if isborder(r,i)
                if i in [Nord,Sud]
                    oi=0
                    while !isborder(r,Ost)
                        oi+=1
                        move!(r,Ost)
                    end
                    if isborder(r,i) && isborder(r,Ost)
                        u=1
                        while oi>0
                            move!(r,West)
                            oi-=1
                        end
                    else
                        while oi>0
                            move!(r,West)
                            oi-=1
                        end
                        t=prohodvnogi!(r,i,t)
                    end
                else
                    oi=0
                    while !isborder(r,Nord)
                        oi+=1
                        move!(r,Nord)
                    end
                    if isborder(r,i) && isborder(r,Nord)
                        u=1
                        while oi>0
                            move!(r,Sud)
                            oi-=1
                        end
                    else
                        while oi>0
                            move!(r,Sud)
                            oi-=1
                        end
                        t=prohodvnogi!(r,i,t)
                    end
                end
            else
                move!(r,i)
                push!(t,i)
            end
        end
        putmarker!(r)
        for ii in reverse(t)
            ty=inverse!(ii)
            move!(r,ty)
        end
    end
end
tudisudi!(r)
sleep(5)