function [ Valid ] = isValidGoal( state, CS, MS )

  CL=state(1); %Canibals left
  ML=state(2); %Mercenaries left
  CR=state(3); %Canibals right
  MR=state(4); %Missionaries right
  
  if (ML>=0 && MR>=0 && CL>=0 && CR>=0)&& (ML==0 || ML>=CL) && (MR == 0 || MR >= CR) && (CL+CR == CS && ML+MR == MS)
    Valid = true; 
  else 
    Valid = false; 
end
end

