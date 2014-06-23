%Script to launch the Lab Projects for 4010, Weeks 9-13


%Random positioning to prove model
car = setupPlot(50, 50);
car.history = [0, 0];


%Randomising section
w = randn(1);
for i=1:1500,
    v = abs(randn(1))*2;
    
    if (mod(i,10) == 0)
        w = randn(1);
    end
    car = carEngine(car, v, w, 0.05, i);
    
    
    car = drawCar(car);
    
    pause(0.05);
end

