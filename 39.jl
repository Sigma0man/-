using HorizonSideRobots

include("structureof39.jl")

left(side::HorizonSide) = HorizonSide(mod(Int(side)+1, 4))
right(side::HorizonSide) = HorizonSide(mod(Int(side)-1, 4))
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))


function next_move(r, side) 

    #Проверка на направление движения

    if isborder(r, right(side)) && !isborder(r, side)
        return side
    
    elseif !isborder(r, right(side)) 
        return right(side,r)
    
    elseif !isborder(r, left(side))
        return left(side,r)
    end
    return inverse(side,r)
end


function prohod( side,robot) 
    side = left(side)
    cord = (Nothing,Nothing)
    
    while cord!=(0,0) || r.t<4
        
        side = next_move(r, side)
        cord = move!(r, side)
    
    end 
end

function out_or_in(r)
    if r.count >0 
        return "Outside"
    

    end
    
    return "Inside"
end
r=Robot("where.sit",animate=true)
function main(r, side)
    
    sleep(5)
    r = CordRobot(r)
    
    prohod(side,r)
    println(out_or_in(r))

end

main(r,Sud)
