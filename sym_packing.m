function [Sum_Q_slide_sym]=sym_packing(Sum_Q_slide)
    Sum_Q_slide_other=flipud(Sum_Q_slide);
    Sum_Q_slide_sym=[Sum_Q_slide_other;Sum_Q_slide];
end