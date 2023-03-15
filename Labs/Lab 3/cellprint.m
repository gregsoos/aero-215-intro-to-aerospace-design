function [] = cellprint( cell )
%This function is very simple. It simply creates a display that includes
%strings of the portions of the first sentence from the question that are 
%not included in the cell elements, and then calls each element in the
%proper order so that it fully forms the sentence correctly.
disp(['Say you drive a ',cell{1},cell{2},cell{3},cell{4},', ',cell{5},'with ',cell{6},'.']) 

end

