function [ children ] = successors( state )

    CL=state(1); %Canibals left
    ML=state(2); %Mercenaries left
    CR=state(3); %Canibals right
    MR=state(4); %Missionaries right
    B=state(5); %Boat
    
    children=([]);
    
    if B == 0 
        new_state = [CL, ML - 2, CR, MR + 2, 1];
		% Two missionaries cross left to right.
		if isValid(new_state)
			children = [children; new_state];
        end 
		new_state = [CL - 2, ML,CR + 2, MR, 1];
		% Two canibals cross left to right.
		if isValid(new_state)
			children = [children; new_state];
        end
		new_state = [CL - 1, ML - 1,CR + 1, MR + 1, 1];
		% One missionary and one canibal cross left to right.
		if isValid(new_state)
			children = [children; new_state];
        end
		new_state = [CL, ML - 1,CR, MR + 1, 1];
		% One missionary crosses left to right.
		if isValid(new_state)
			children = [children; new_state];
        end
		new_state = [CL - 1, ML,CR + 1, MR, 1];
		% One canibal crosses left to right.
		if isValid(new_state)
			children = [children; new_state];
        end
        
        
    elseif B==1     
        
        new_state = [CL, ML + 2,CR, MR - 2, 0];
		% Two missionaries cross right to left.
		if isValid(new_state)
			children = [children; new_state];            
        end
		new_state = [CL + 2, ML,CR - 2, MR, 0];
		% Two canibals cross right to left.
		if isValid(new_state)
			children = [children; new_state];
        end
		new_state = [CL + 1, ML + 1,CR - 1, MR - 1, 0];
		% One missionary and one canibal cross right to left.
		if isValid(new_state)
			children = [children; new_state];
        end
		new_state = [CL, ML + 1,CR, MR - 1, 0];
		% One missionary crosses right to left.
		if isValid(new_state)
			children = [children; new_state];
        end
		new_state = [CL + 1, ML,CR - 1, MR, 0];
		% One canibal crosses right to left.
		if isValid(new_state)
			children = [children; new_state];
        end
    end
        
    children = children.';
        


end

