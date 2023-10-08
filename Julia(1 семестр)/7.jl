using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("7.sit";animate=true)
sleep(4)
function doyouknowtheway!(r)
    for i in [West,Ost]
        if isborder(r,Nord)
            while isborder(r,Nord) && !isborder(r,i)
                move!(r,i)
            end
        end 
    end
end
doyouknowtheway!(r)
sleep(3)