%Script to launch the Lab Projects for 4010, Weeks 9-13


function fuzzyLab(xSize, ySize, filename)
    dt = 0.05;
    %Setting up the plots and making the car structure
    car = setupPlot(xSize, ySize);
    car.history = [0, 0];

    
    
    
    % Making the fuzzy target
    target.xPos = randi([-45, 45]);
    target.yPos = randi([-45, 45]);
    target.w = randn(1);
    if(target.xPos < 0)
        target.theta = pi;
    else
        target.theta = 0;
    end
    target.car = 0;
    set(car.target, 'xdata', target.xPos, 'ydata', target.yPos);

    %Loading the fuzzy controller
    fis = readfis(filename);

    for i = 1:1500
        tic;
        xdist = target.xPos - car.xPos;
        ydist = target.yPos - car.yPos;
        dist  = sqrt(xdist^2 + ydist^2) - car.size;
        heading = atan2(ydist, xdist) - car.theta;
        heading = mod(heading+pi, 2*pi) - pi;
%         heading = -heading;
        if(dist >= 0)
            outputs = evalfis([dist, heading], fis);
        else
            outputs = evalfis([0, heading], fis);
            outputs(1) = 0;
        end
        v = outputs(1)*1.2;
        w = outputs(2) - 1;
        car = carEngine(car, v, w, dt, i);
    
    
        car = drawCar(car);
        fprintf('[Iter: %d]\t Distance: %03.1f,\t Heading: %3.1f, Speed: %01.2fms\n', i, dist + car.size, heading*180/pi, v);
        
        %Now do some changes for the target to move randomly
%         target.v = abs(randn(1))*2;
%         target.v = 1.2;
%         if (mod(i,5) == 0)
%             target.w = randn(1);
%         end
%         
%         target = carEngine(target, target.v, target.w, 0.05, i);
%         
%         set(car.target, 'xdata', target.xPos, 'ydata', target.yPos);
        
        pause(dt-toc);
% pause();
    end


end