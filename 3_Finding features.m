x = [1:19];
y = [22, 41, 99, 40, 27, 74, 113, 62, 102, 128, 65,...
     145, 77, 135, 199, 162, 240, 425, 742];
z = [3218, 3177, 3078, 3038, 3011, 2937, 2824, 2762, 2660,...
     2532, 2467, 2322, 2245, 2110, 1911, 1749, 1509, 1084, 342];
figure
[hx, ax1, ax2] = plotyy(x, y, x, z);
xlabel('The evolution times of random forest', 'fontsize', 14)
ylabel(hx(1), 'The number of features deleted', 'fontsize', 14)
ylabel(hx(2), 'The number of features remaining', 'fontsize', 14)
set(hx(1), 'ycolor', 'k')
set(hx(2), 'ycolor', 'k')
set(ax1, 'lineStyle', '-', 'color', 'r', 'Marker', '.')
set(ax2, 'lineStyle', '--', 'color', 'b', 'Marker', '*')
legend([ax1, ax2], {'The number of features deleted', 'The number of features  remaining'})
