using HorizonSideRobots

include("funct.jl")

function main(r)
    shuttle!(()->!isborder(r, Nord),r, Ost)
end

r = Robot("7.sit", animate = true)

main(r)
sleep(5)