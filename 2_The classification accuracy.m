x = [1:30];
y = [0.556, 0.556, 0.611, 0.611, 0.556, 0.611, 0.667, 0.667, 0.722, 0.611, ...
    0.722, 0.667, 0.778, 0.722, 0.778, 0.778, 0.833, 0.833, 0.889, 0.889, ...
    0.833, 0.833, 0.889, 0.889, 0.889, 0.833, 0.778, 0.889, 0.889, 0.889];
figure;

plot(x, y)
xlabel('The evolution times of random forest', 'fontsize', 14)
ylabel('The classification accuracy', 'fontsize', 14)
axis([0 30 0 1.07])
