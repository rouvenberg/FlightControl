%% function to create mode response
% mode_resp_lat(model,idx,ylimits)
% inputs:   model   -> linear system under investigation
%           idx     -> indizes corresponding to the the dynamic mode of interest, e.g. 'idx_dr' for the dutch roll mode
%           ylimits -> limit the y-axis of the plot, e.g. [-0.1 0.9]
% outputs:  figure only

% This function is provided as part of the term project for the class 
% "Flight Control Law Design and Application" at TU Hamburg.
% by Julian Theis and Nicolas Sedlmair, 2021

function [] = mode_resp_lat(model,idx,idx_outputs,ylimits)

[M,~] = eig(model.a); % compute the modal matrix of the linear system under investigation (columns are the right eigenvectors of the system)

[X,T] = initial(model,M(:,idx(1))); % compute free response of the model: note that the first entry of 'idx' determines the dynamic mode as it defines the (right) eigenvector of the system to investigate
% X = real(X(:,[8 1 2 4])); % take only real part of the outputs of interest, i.e. the vector [7 2 3 4] picks the desired outputs of the model (see 'OutputNames' of the model) and changes the order
X = real(X(:,idx_outputs)); % take only real part of the outputs of interest, i.e. the vector [7 2 3 4] picks the desired outputs of the model (see 'OutputNames' of the model) and changes the order
X = X.*[180/pi 180/pi 180/pi 180/pi]; % transform 'rad' --> '°' and 'rad/s' --> '°/s'
plot(T,X,'-','LineWidth',3);
legend('beta (°)', 'p (°/s)', 'r (°/s)', '\Phi (°)','Location','best')
xlabel('Time (s)')
ylim(ylimits)
grid
clear X T M
end