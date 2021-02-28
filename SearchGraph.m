while i<=n %Run all the nodes

%Complete the children array    
[temp]=successors (P(i,:));  
c=size(temp, 2);
[children1(i, :, 1:c)]=successors(P(i, :));

%Maximum Braching Factor(b)
if c > mbf 
    mbf=c; 
end

  for k=1:c 
    [Lia1,Locb1] = ismember(children1(i, 1:5, k), P(:,:), 'rows' ); 
   
    if Lia1 == 1 %Child already exists in P
        if Locb1>i
          B(i, Locb1)= 1; 
        end
    else 
        P=[P ; children1(i, 1:5, k)];  %Add the children to P
        n=size(P,1);
        B(i, n)=1;           
    end
  end
i=i+1;
end

str = strread(num2str(P.'),'%s'); %Biograph ids
BGobj = biograph(B(1:n, 1:n), str); %Search Tree Biograph

%Maximum depth of any path in the state space(m)
[dist, path, pred] = shortestpath(BGobj, 1, n);
max_dpth = dist;