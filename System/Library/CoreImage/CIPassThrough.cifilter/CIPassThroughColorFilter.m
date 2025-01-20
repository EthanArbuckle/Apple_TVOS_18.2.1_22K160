@interface CIPassThroughColorFilter
- (id)outputImage;
@end

@implementation CIPassThroughColorFilter

- (id)outputImage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CIColorKernel cachedKernelWithString:]( &OBJC_CLASS___CIColorKernel,  "cachedKernelWithString:",  @"kernel vec4 CIPT_Color (__sample s) { return s; } \n"));
  -[CIImage extent](self->super.inputImage, "extent");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  inputImage = self->super.inputImage;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &inputImage, 1LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applyWithExtent:arguments:", v12, v5, v7, v9, v11));

  return v13;
}

@end