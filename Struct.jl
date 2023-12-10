using HorizonSideRobots


HSR = HorizonSideRobots
include("librobot.jl")

mutable struct ChessMarkRobot <: AbstractRobot
    robot::Robot
    flag::Bool
    function ChessMarkRobot(robot, flag)
        if flag == true
            putmarker!(robot)
        end
        new(robot,flag)
    end
end

get_baserobot(robot::ChessMarkRobot) = robot.robot

function HSR.move!(robot::ChessMarkRobot, side)
    move!(robot.robot, side)
    robot.flag = !robot.flag
    if robot.flag == true
        putmarker!(robot)
    end
    return Nothing
end
function try_move!(robot::ChessMarkRobot, side)
    ortogonal_side = left(side)
    back_side = inverse(ortogonal_side)
    n=0
    while isborder(robot, side)==true && isborder(robot, ortogonal_side) == false
        move!(robot, ortogonal_side)
        n += 1
    end
    if isborder(robot,side)==true
        move!(robot, back_side, n)
        return false
    end
    move!(robot, side)
    if n > 0 # продолжается обход
        along!(()->!isborder(robot, back_side), robot, side) 
        move!(robot, back_side, n)
    end
    return true
end


along!(robot::ChessMarkRobot, side::HorizonSide) = while try_move!(robot, side) end

along!(stop_condition::Function, robot::ChessMarkRobot, side::HorizonSide) =
    while !stop_condition() && try_move!(robot, side) end
