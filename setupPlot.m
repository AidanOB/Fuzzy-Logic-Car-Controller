function car = setupPlot(xSize, ySize)
    % Sets up the simulation environment for a car in an empty field
    figure(1); clf; hold on;
    car.path  = plot(0, 0, 'g');
    car.xPos  = 0;
    car.yPos  = 0;
    car.theta = pi/2;
%     car.theta = 0;
    car.R     = [cos(car.theta), sin(car.theta); -sin(car.theta), cos(car.theta)];
    car.size  = 2;
    car.point1= 0;
    car.point2= pi/3;
    car.point3= 2*pi/3;
    car.point5= 4*pi/3;
    car.point6= 5*pi/3;
    car.point7= 2*pi;
    car.car = 1;
    
    car.points= [car.size*cos(car.point1), car.size*cos(car.point2), car.size*cos(car.point3), car.size*cos(car.point5), car.size*cos(car.point6), car.size*cos(car.point7);...
                 car.size*sin(car.point1), car.size*sin(car.point2), car.size*sin(car.point3), car.size*sin(car.point5), car.size*sin(car.point6), car.size*sin(car.point7)]';
    
    car = updateCarPos(car, 0, 0);
    
    car.draw = plot(car.points(:,1), car.points(:,2), 'b');
    car.target = plot(0,0, 'r*');
%     car = drawCar(car);
    grid on;
    axis([-xSize, xSize, -ySize, ySize]);
    hold off;
    
end