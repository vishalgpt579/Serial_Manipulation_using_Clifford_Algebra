%% Testing the functions
clear all;clc;
conformal_signature(3,0);

t = clifford_tools_local;

% % Testing the rotors
r1 = t.rotor(deg2rad(0),e1,e3);
r2 = t.rotor(deg2rad(45),e1,e2);
r = r1*r2;
fprintf("\nThe generated rotor is: %s",r);
fprintf("\nIs rotor func working: %d", islogical(r == (0.92388*e0 + 0.38268*e12)));

% % Testing the projections
x = 1*e1+1*e2;
x_cga = t.up(x); % x_cga = up(x);
x_ga = t.down(x_cga);
fprintf("\nGA to CGA: ");
disp(x_cga);
fprintf("\nCGA to GA vectpr: ");
disp(x_ga);
fprintf("\nFunctions working?: \n")

% Function works if their wedge product should be zero. 
disp(wedge(x,x_ga)==0); % disp(eq(x,x_ga));