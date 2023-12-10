using HorizonSideRobots
include("structiveof40.jl")

left(side::HorizonSide) = HorizonSide(mod(Int(side)+1, 4))
right(side::HorizonSide) = HorizonSide(mod(Int(side)-1, 4))
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))

r=Robot("untitled.sit",animate=true)

function next_move(r, side) 
    if isborder(r, right(side)) && !isborder(r, side)
        return side
    elseif !isborder(r, right(side)) 
        return right(side)
    elseif !isborder(r, left(side))
        return left(side)
    end
    return inverse(side)
end

function prohod( side,r) 
    side = left(side)
    cord = (Nothing,Nothing)
    while cord!=(0,0) 
        side = next_move(r, side)
        
        cord = move!(r, side)
        podscet(r,side)
    
    end 
    
end

function podscet(r,side)
    if isborder(r,Sud) && !isborder(r,Nord) && (side == Ost || side==Sud )
        r.S += r.coordinates.y-1
    elseif isborder(r,Nord) && !isborder(r,Sud) && (side==West ) 
        r.S+=(-r.coordinates.y)
    elseif isborder(r,Nord) && isborder(r,Ost)  && side==Nord
        r.S+=-r.coordinates.y
    elseif isborder(r,Nord) && isborder(r,Sud) && side==Ost
        r.S+=-1    
    end
end

function main(r,side)
    r = CordRobot(r)
    prohod(side,r)
    println(r.S)
end
main(r,Nord)

