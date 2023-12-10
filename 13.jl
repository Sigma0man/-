using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("13.sit";animate=true)
include("librobot.jl")

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


function moven!(robot,s,n)
    for i in 1:n
        move!(robot,s)
    end
end

mutable struct ChessmarkersRobot <: AbstractRobot
    robot::Robot
    flag::Bool
    function ChessmarkersRobot(robot, flag)
        if flag == true
            putmarker!(robot)
        end
        new(robot, flag)
    end
end
get_baserobot(robot::ChessmarkersRobot) = robot.robot

function HSR.move!(robot::ChessmarkersRobot, side)
    move!(robot.robot, side)
    robot.flag = !robot.flag
    if robot.flag == true
        putmarker!(robot)
    end
    nothing 
end

r=ChessmarkersRobot(r, true)

function main(r) 
    vniz,vlevo=vozvrat!(r)
    snake!(r;start_side=Ost, ortogonal_side=Nord)
    vozvrat!(r)
    moven!(r.robot,Nord,vniz)
    moven!(r.robot,Ost,vlevo)
end

main(r)
