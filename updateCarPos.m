function car = updateCarPos(car, dx, dy)
    car.points= [car.size*cos(car.point1), car.size*cos(car.point2), car.size*cos(car.point3), car.size*cos(car.point5), car.size*cos(car.point6), car.size*cos(car.point7);...
                 car.size*sin(car.point1), car.size*sin(car.point2), car.size*sin(car.point3), car.size*sin(car.point5), car.size*sin(car.point6), car.size*sin(car.point7)]';
    car.points = car.points * car.R;
    
    car.points(:,1) = car.points(:,1) + car.xPos;
    car.points(:,2) = car.points(:,2) + car.yPos;
end