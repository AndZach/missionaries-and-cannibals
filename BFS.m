while i<=n %Run all the nodes
    
    %if solution found 
    if (P(i,1:4)== goal)
      NSol=NSol+1;
      SolPos(NSol)=i;
      if NSol==1
      Sol(1:i, :)=P(1:i, :); %Solution Array
      m=size(Sol,1);
      
      %make Solution Graph Matrix
      for j=2:m
        B(j-1, j)=1;
      end
      end
    end

%Complete the children array
[temp]=successors (P(i,:)); 
c=size(temp, 2);
[children1(i , :, 1:c)]=successors(P(i, :));
%Maximum Braching Factor(b)
if c > mbf 
    mbf=c; 
end

%Run all the children for (i) Node
  for k=1:c 
    
    [Lia1,Locb1] = ismember(children1(i, 1:5, k), P(:,:), 'rows' ); 
   
    if Lia1 == 1  %Child already exists in P
        if Locb1>i
          B(i, Locb1)= 1; 
        end
    else
        %Add to P (FIFO)
        P=[P ; children1(i, 1:5, k)]; 
        n=size(P,1);
        B(i, n)=1;         
    end    
  end 
i=i+1;
end

%Create BFS Biograph
if NSol>0
    str = strread(num2str(P.'),'%s'); 
    BGobj = biograph(B(1:n, 1:n), str);    
    x=1;
    for j=1:m-1
      BGobj.edges(x).LineColor = [0.8 0.0 0.1];
      BGobj.edges(x).LineWidth = 1.5;
      l = nnz(B(j, :));
      x=x+l;
    end
    BGobj.nodes(SolPos(1)).Color = [ 0.9 0.8 0.9];
    
%Shallowest Solution Node Depth(d)
[dist] = shortestpath(BGobj, 1, m);
sol_dpth = dist;

%Maximum depth of any path in the state space(m)
[dist, path, pred] = shortestpath(BGobj, 1, n);
max_dpth = dist;

%Compute Complexity
%Time Complexity: O(b^d)
complx_time=mbf^sol_dpth;
%Space Complexity: O(b^d)
complx_space=complx_time;

%Display Complexity
display (complx_time, 'The time complexity is: O()');
display (complx_space, 'The space complexity is: O()');
end

