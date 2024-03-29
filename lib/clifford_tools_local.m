function tool = clifford_tools_local
%CLIFFORD_TOOLS_LOCAL: local functions created to perform clifford algebra
%operations
%   Function: rotor
%   Inputs: angle of rotation(in radians),
%           mv1: vector that needs to be rotated. 
%           mv2: vector that mv1 is to be rotated about. 
%   Output: rotor operator 
tool.rotor = @rotor;

%   Function: up,projecting GA --> CGA
tool.up = @up;

%   Function: down,projecting CGA --> GA
tool.down = @down;

%   Function: homo,homogenize a CGA vector 
tool.homo = @homo;

end


function R = rotor(angle,mv1,mv2)
    % Normalised the multivector1, i.e, the initial vector
    mv1 = unit(mv1);% or mv1 = mv1/abs(mv1);
    % Normalised the multivector1, i.e, the final rotated vector
    mv2 = unit(mv2); % or mv2 = mv2/abs(mv2);
    
    mv1WedgeMv2 = mv1*mv2; %creating a bi-vector
    mv1WedgeMv2 = unit(mv1WedgeMv2); % or mv1WedgeMv2 = mv1WedgeMv2/abs(mv1WedgeMv2)

    R = cos(angle/2) - mv1WedgeMv2*sin(angle/2);
end


% % Reference: https://clifford.readthedocs.io/en/latest/tutorials/cga/index.html

% Project a multivector to conformal space (GA-->CGA)
function mv_conformal = up(mv)
    mv_conformal = mv + (0.5*(mv^2)*ei) + eo;
end

function mv = homo(mv_conformal)
    %Normalizing the input mv_conformal
    mv_conformal = unit(mv_conformal);
    mv = mv_conformal/left_contraction(-mv_conformal,ei);
end

% Projection from CGA to GA
function mv = down(mv_conformal)
    %Normalizing the input mv
    mv_conformal = unit(mv_conformal);
    mv = wedge(homo(mv_conformal),E)*E; % where E = wedge(ei,eo);
end