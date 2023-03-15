function [] = structureprint( struct )
%This function is very simple. It simply creates a display that includes
%strings of the portions of the first sentence from the question that are 
%not included in the structure elements, and then calls each element in the
%proper order so that it fully forms the sentence correctly.

disp(['Say you drive a ',struct.color,struct.year,struct.make,struct.model,', ',struct.class,'with ',struct.cylinders,'.']) 

end

