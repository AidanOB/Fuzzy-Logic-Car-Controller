function carEngine = carEngine(carEngine, v, w, t, iter)
    %The carEngine function models the behaviour of a simulation car and
    %enables the vertices of the displayed car to be updated

    dx = v*t*cos(carEngine.theta);
    dy = v*t*sin(carEngine.theta);
    carEngine.xPos  = carEngine.xPos  + dx;
    carEngine.yPos  = carEngine.yPos  + dy;
%     w
    
    carEngine.theta = carEngine.theta + w*t;
%     car.theta
    if(carEngine.car == 1)
        carEngine.R     = [cos(carEngine.theta), sin(carEngine.theta); -sin(carEngine.theta), cos(carEngine.theta)];
    
        carEngine = updateCarPos(carEngine, dx, dy);
    
        carEngine.history(1, iter) = carEngine.xPos;
        carEngine.history(2, iter) = carEngine.yPos;
    end

end