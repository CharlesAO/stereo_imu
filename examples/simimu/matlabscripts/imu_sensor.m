function [ w, a ] = imu_sensor( rf, pf, tl, g )
%imu_sensor ģ��IMU���������
%   ����ȫ������ϵ�µ���ת��ƽ�ƹ켣����IMU���
%   ���� rf: ��ת�켣
%       pf: ƽ�ƹ켣
%       tl: ʱ����
%       bias: ƫ��
%       noise: ����
%   ���  w: ������ϵ�½��ٶ�
%        a: ������ϵ�¼��ٶ�

len = length(tl);
omega = zeros(3, len);
acc = zeros(3, len);
dh = 1e-7;
% g = [0; 0; -9.81];
for i = 1:len,
    R = rf(tl(i));
    %����R����ֵ����
    R_dot = (rf(tl(i)+dh)-rf(tl(i)-dh))/(2*dh);
    %����R�ĵ���
    %R_dot2 = R*(skew(H(logm(rf(tl(i))))*th_dot));
    om = R'*R_dot;
    omega(:, i) = [om(3,2); om(1,3); om(2,1)];
    vf_old = (pf(tl(i))-pf(tl(i)-2*dh))/(2*dh);
    vf = (pf(tl(i)+2*dh)-pf(tl(i)))/(2*dh);
    ac = (vf-vf_old)/(2*dh);
    
    %acc(:, i) = R'* ac;
    acc(:, i) = R'* (ac-g);
end;

w = omega;
a = acc;
end

