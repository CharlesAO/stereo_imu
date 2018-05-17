function [ rot, pos ] = traj_gen( twist )
%traj_gen ����twist���λ�˺���
%   ���� twist: se3����
%   ���  rot: ȫ����̬����
%        pos: ȫ��λ�ú���

    function R = rot_i(t)
        tw = twist(t);
        R = expm(hat(tw(1:3)));
    end
    
    function P = pos_i(t)
        tw = twist(t);
        V = zeros(4);
        V(1:3, 1:3) = hat(tw(1:3));
        V(1:3, 4) = tw(4:6);
        SE = expm(V);
        P = SE(1:3, 4);
        
        R = expm(hat(tw(1:3)));
        assert( norm(1-norm(R'*SE(1:3,1:3)))<1e-10 , 'here');
    end

    rot = @rot_i;
    pos = @pos_i;
end

