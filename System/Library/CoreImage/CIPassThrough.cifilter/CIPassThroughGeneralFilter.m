@interface CIPassThroughGeneralFilter
- (id)outputImage;
@end

@implementation CIPassThroughGeneralFilter

- (id)outputImage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CIKernel cachedKernelWithString:]( &OBJC_CLASS___CIKernel,  "cachedKernelWithString:",  @"kernel vec4 CIPT_General (sampler s, float v) { return sample(s, samplerCoord(s)+v); } \n"));
  -[CIImage extent](self->super.inputImage, "extent");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v15[0] = self->super.inputImage;
  v15[1] = &off_43A8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applyWithExtent:roiCallback:arguments:", &stru_41E0, v12, v5, v7, v9, v11));

  return v13;
}

@end