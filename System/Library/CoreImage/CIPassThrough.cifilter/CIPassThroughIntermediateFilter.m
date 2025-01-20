@interface CIPassThroughIntermediateFilter
- (id)outputImage;
@end

@implementation CIPassThroughIntermediateFilter

- (id)outputImage
{
  return -[CIImage _imageByRenderingToIntermediate](self->super.inputImage, "_imageByRenderingToIntermediate");
}

@end