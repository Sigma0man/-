using HorizonSideRobots
r = Robot("1.sit", animate = true)
function move_recursionno_end!(r, side)
    if !isborder(r,side)
        move!(r, side)
        move_recursionno_end!(r,side)
    else 
        return Nothing
    end
end

move_recursionno_end!(r,Sud)
sleep(3)