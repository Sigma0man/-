using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("14.sit";animate=true)
include("librobot.jl")
include("Struct.jl")
include("funct.jl")

r=ChessMarkRobot(r, true)



function snake!(stop_condition::Function, robot; start_side, ortogonal_side)
    s = start_side
    along!(stop_condition, robot, s)
    while !stop_condition() && try_move!(robot, ortogonal_side)
        s = inverse(s)
        along!(stop_condition, robot, s)
    end
end
snake!(robot; start_side, ortogonal_side) = snake!(() -> false, robot; start_side, ortogonal_side)




function main!(r) 
    tr=come_back!(r)
    
    snake!(r;start_side=Ost, ortogonal_side=Nord)
    finish!(r,tr)
    
end


main!(r)