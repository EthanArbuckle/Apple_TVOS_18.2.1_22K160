@interface CIPassThroughWarpFilterCIKL
- (id)outputImage;
@end

@implementation CIPassThroughWarpFilterCIKL

- (id)outputImage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CIWarpKernel cachedKernelWithString:]( &OBJC_CLASS___CIWarpKernel,  "cachedKernelWithString:",  @"kernel vec2 CIPT_Warp () { return destCoord(); } \n"));
  -[CIImage extent](self->super.inputImage, "extent");
  v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "applyWithExtent:roiCallback:inputImage:arguments:",  &stru_41C0,  self->super.inputImage,  &__NSArray0__struct));

  return v4;
}

@end