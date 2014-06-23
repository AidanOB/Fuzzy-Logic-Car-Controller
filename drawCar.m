function car = drawCar(car)
    set(car.draw, 'xdata', car.points(:,1), 'ydata', car.points(:,2));
    set(car.path, 'xdata', car.history(1,:), 'ydata', car.history(2,:));
    

end