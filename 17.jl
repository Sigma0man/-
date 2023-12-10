using HorizonSideRobots

include("funct.jl")

function main(r)
    spiral!(()->ismarker(r),r)
end

r = Robot("8.sit", animate = true)

main(r)
sleep(20)