
function [final_pose,final_pred,P_end]=manhattan_path_passing(path,counter,initial_pose,initial_pred,P_ini)
Ld=3;
% start_point=path(1,:);
end_point=path(end,:);
mid_point=[0 20];
t1=20;
if counter==1
    start_pos=[0;0;pi/2;0;0];
    q_true=start_pos;
    q_pred=[0;0;pi/2];
    P_ini=zeros(3);
    X=[end_point(1),end_point(2);mid_point(1),mid_point(2)];
    d2=pdist(X,'euclidean');
    t2=d2;
    T=t1+t2;
    [final_pose,final_pred,P_end]=closed_loop_control(path,Ld,T,q_true,q_pred,P_ini);
    
else 
    q_true=[initial_pose(1);initial_pose(2);initial_pose(3);0;0];
    q_pred=initial_pred;
    X=[end_point(1),end_point(2);mid_point(1),mid_point(2)];
    d2=pdist(X,'euclidean');
    t2=d2;
    T=t1+t2;
    [final_pose,final_pred,P_end]=closed_loop_control(path,Ld,T,q_true,q_pred,P_ini);
end 
     








