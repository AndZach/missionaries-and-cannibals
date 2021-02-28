clear all;
init=int8([-1, -1, -1, -1]);
goal=int8([-1, -1, -1, -1]);
max_dpth=0; %maximum depth of the state space (m)

%Initial State
while (size(init, 2)~=4) || (isValid(init(1:4))== false) 
init = input ('Give the initial state [ C_l  M_l  C_r  M_r ] : ');
end
display ('The Initial State is: ');
display (init);

%MaxNodes
MS= init(2)+ init(4); %Mercenaries Sum
CS= init(1) + init(3); %Canibals Sum
Nodes = ((MS+1)*(CS+1)*2); 

%Goal State
while (size(init, 2)~=4)|| isValidGoal(goal(1:4), CS, MS)== false
goal= input ('Give the goal state [ C_l  M_l  C_r  M_r ] : ');
end
display('The Goal State is: ' );
display (goal);

while (1)
method=-1;

%Choose Method 
while (method ~= 0) && (method ~=1) && (method ~=2) && (method~=3)
    display (['Give the search method.',
        '0. Search Graph        ',
        '1. Breadth-first search',
        '2. Depth-limited search',
        '3. Exit                ']);
    method = input('--');
end 

%Exit
if method==3
   return; 
end

%Clear Variables from previous method
clearvars -except init goal Nodes method max_dpth; 

P=int8([]); %States Array
P(1, :)= [init(1:4), 0]; %States Array Initialization
B = zeros(Nodes); %Search Biograph Array
BSol=zeros(Nodes); %Solutiion Biograph Array
children1=int8([]); %Children Array
Sol=int8([]); %Solution Array
SolPos=int8([]); %Solutions Position

NSol=0; %Number of Solutions
NChild=0; %Number of Children
i=1;
n=size(P);
m=size(Sol);
mbf=0; %Maximum Branching Factor (b)
sol_dpth=0; %Shallowest Solution Node Depth (d) 


if method == 0
    %run script
    SearchGraph

    %Display Search Graph
    display('The Search Graph is: ');
    display('[  C_l  M_l  C_r  M_r  B  ]');
    display(P);
    display (n, 'Number of Nodes ');
    view(BGobj);
    
elseif method == 1
        %run script
        BFS  
        
        %Display Results
        if NSol==0
          display('No solution found!'); 
        else
          view(BGobj);
          display('The Solution Array is: ');
          display('[  C_l  M_l  C_r  M_r  B  ]');
          display(Sol);
          display(m,'Nodes Explored');
        end
        
elseif method == 2
        %run script
        DFS

        %Display Results
        if NSol==0 
            display('No Solution found!');
        else
          view(BGobj);
          display('The Solution Array is: ');
          display('[  C_l  M_l  C_r  M_r  B  ]');
          display(Sol);
          display(m, 'Nodes Explored');
        end
end
end 
    