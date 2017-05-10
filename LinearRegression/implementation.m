function err = error_fun(theta, x, y)
    return 1/2 * (sum(transpose(theta) * x - y))^2;
end

function close_enough(theta, next_theta)
    return abs(theta - next_theta) < ones(size(theta)) * 0.001;
end

function theta = linear_regression(seed_theta, x, y, learning_rate)
    next_theta = ones(length(seed_theta)) * 1000000;
    m = length(y);
    while(close_enough(seed_theta, next_theta))
        next_theta = seed_theta - (x/m) * sum(transpose(seed_theta) * x - y);
    end

    return next_theta
end


% TODO: Find out the optimal values for learning rate and seed values for parameters theta.
x = load("ex2x.dat");
y = load("ex2y.dat");

seed_theta = [0; 0];
learning_rate = 0.001

linear_regression(seed_theta, x, y, 0.001)
