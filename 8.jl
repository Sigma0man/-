using HorizonSideRobots
r = Robot("8.sit";animate=true)
function progonka!(r,i,o,l)
    for ii in 1:l*o
        if !ismarker(r)
            move!(r,i)
        else
            return 5
        end
    end
end
function spiral!(r,o)
    po=[[Sud,1],[Ost,1],[Nord,2],[West,2],[Sud,2],[Ost,1],[Nord,1]]
    for i in po
        if progonka!(r,i[1],o,i[2])==5
            break
        end
    end
    if ismarker(r)
        return 0
    end
    o+=1
    spiral!(r,o)
end
function poisk!(r)
    o=1
    spiral!(r,o)
end
poisk!(r)
sleep(3)