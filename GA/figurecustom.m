% Figure custom script file

% Initial: include array of things or not (optional)

ylabel_array=["Cart position x_0 (m)" "First Pendulum angle \phi_1 (rad)" "Second Pendulum angle \phi_2 (rad)"];
legend_array=["x_0" "\phi_1" "\phi_2"];
Time_Tick=[0 5 10 15 20 25 30 35 40];
Value_Tick={[0 .2 .4 .6 .8 1 1.2 1.4 1.6]
    [-.6 -.4 -.2 0 .2 .4 .6]
    [-.6 -.4 -.2 0 .2 .4 .6]};
% Limit, if need, reccomend fix after processing part
% xlimit_array
scr_sz=get(0,'ScreenSize'); % get screen size of your computer
% screen size is 4x1 array, scrsz(3)x(4)=width x height

% vertical 3 subplots count 3 2 1 up to down but tag is DisplayAxes1 2 3
% respectively and their order is the same. initial array up to down then
% we use array(numel(___))+1-i) in processing

% Processing

fig=gcf;
% set fig position [x y w h]
fig.Position=[0 0 scr_sz(3)/3 scr_sz(4)];
subplot_handles=fig.Children; % First UIContainer
for i=1:numel(subplot_handles.Children)
    axes_handle=subplot_handles.Children(i); % Second UIContainer; (i) for i_th subplot
    desired_axes=axes_handle(1); % doesnt need (1), just pass axes_handle (i_th subplot to desired_axes)
    current_panel=desired_axes.Children; % Panel
    current_panel.Children(2).FontSize=16; % Must done be before legend, label...
    current_panel.Children(2).Position=[0.15 0.25 .8 .7]; % Position of each axes in each panel, include XYLabels
    % current_panel.FontSize=16;  not visible worked
    % current_panel.Children is an 2 x 1 array <not sure 2 or n x 1>
    % (1) Legend
    % (2) Axes
    % dot more for details
    % legend = current_panel.Children(1) or directly as shown
    current_panel.Children(1).String={legend_array(numel(subplot_handles.Children)+1-i)};
    current_panel.Children(1).FontSize=16;
    current_panel.Children(1).Interpreter="tex";
    current_panel.Children(1).Location="northeast";
    % XLabel
    current_panel.Children(2).XLabel.String="Time (s)";
    current_panel.Children(2).XLabel.FontSize=16;
    % YLabel
    current_panel.Children(2).YLabel.String={ylabel_array(numel(subplot_handles.Children)+1-i)};
    current_panel.Children(2).YLabel.FontSize=11;
    current_panel.Children(2).YLabel.Position(1)=-4; % Aligh x of position
    % Grid/XTick & XTickLabel can be in initial part (optional)
    % XTick usually Time, so we use 1 initial array for all
    % but YTick is not the same, Value_Tick is cell array, need cell2mat
    current_panel.Children(2).XTick= Time_Tick;
    current_panel.Children(2).XTickLabel= Time_Tick;
    current_panel.Children(2).YTick= cell2mat(Value_Tick(numel(subplot_handles.Children)+1-i));
    current_panel.Children(2).YTickLabel= cell2mat(Value_Tick(numel(subplot_handles.Children)+1-i));
    % Line
    % Line is current_panel.Children(2).Children(1)
end

% Save figure as image file or anything else

% get yy mm dd hh mm ss
name = sprintf('%s/Fig_%s.png',"figure",datetime('now','format','ddMMyy_HHmmss')); % %s for subfolder, .png for file
saveas(fig, fullfile(pwd,name)); % pwd is current folder