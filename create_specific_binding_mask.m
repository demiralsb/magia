function specific_binding_mask = create_specific_binding_mask(meanpet_file,thr)

V = spm_vol(meanpet_file);
meanpet_image = spm_read_vols(V);
mask = uint8(meanpet_image >= thr);

p = fileparts(meanpet_file);
specific_binding_mask = sprintf('%s/specific_binding_mask.nii',p);
V.fname = specific_binding_mask;
V.dt = [spm_type('uint8') spm_platform('bigend')];
V.pinfo = [Inf Inf Inf]';
spm_write_vol(V,mask);

end