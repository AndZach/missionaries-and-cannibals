while i<=n   %Run all the nodes
    
%if solution found 
if (P(i,1:4)== goal) 
      NSol=NSol+1;
      SolPos(NSol)=i;
      if NSol==1
      Sol(1:i, :)=P(1:i, :);
      m=size(Sol, 1);
      
      %make Solution Graph Matrix
      for j=2:m
        B(j-1, j)=1;
      end
      end
end

%Complete the children array
[temp]=successors (P(i,:));
c=size(temp, 2);
[children1(i ,: , 1:c)]=successors(P(i, :));

%Maximum Braching Factor(b)
if c > mbf 
    mbf=c; 
end

l=int8(0);

%Run all the children for (i) Node
  for k=1:c 
    
    [Lia1,Locb1] = ismember(children1(i, 1:5, k), P(:,:), 'rows' ); 
   
    if Lia1 == 1  %Child already exists in P
        
       %Add to P (LIFO)
        if Locb1>i
          P=[P(1:(i+l), :) ; children1(i, 1:5, k) ; P((i+l+1):(Locb1-1), :);P((Locb1+1):end, :)];
           l=l+1;
        end
        n=size(P,1);
    else 
        P=[P(1:(i+l), :) ; children1(i, 1:5, k) ; P((i+l+1):end, :)];
        l=l+1;
        n=size(P,1);      
    end
  end
 
B(i, i+1)=1;
i=i+1;

end

%Create DFS Biograph
if NSol>0
    str = strread(num2str(P.'),'%s');
    BGobj = biograph(B(1:n, 1:n), str);
    for j=1:m-1
    BGobj.edges(j).LineColor = [0.8 0.0 0.1];
    BGobj.edges(j).LineWidth = 1.5;
    end
    BGobj.nodes(SolPos(1)).Color = [0.9 0.8 0.9];

%Compute Complexity
    %Maximum depth of any path in the state space(m)
    if max_dpth~=0 %Need to run BFS or SearchGraph to compute max_dpth
    %Time Complexity: O(b^m)
    complx_time=mbf^max_dpth;
    %Space Complexity: O(b*m)
    complx_space=mbf*max_dpth;
    %Display Complexity
    display (complx_time, 'The time complexity is: O()');
    display (complx_space, 'The space complexity is: O()');    
    end
end