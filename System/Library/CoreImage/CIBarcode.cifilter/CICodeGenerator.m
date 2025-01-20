@interface CICodeGenerator
- (CGImage)outputCGImage;
- (NSData)inputMessage;
- (id)outputImage;
- (void)setInputMessage:(id)a3;
@end

@implementation CICodeGenerator

- (CGImage)outputCGImage
{
  return 0LL;
}

- (id)outputImage
{
  v2 = -[CICodeGenerator outputCGImage](self, "outputCGImage");
  if (v2)
  {
    v5[0] = kCIImageNearestSampling;
    v5[1] = kCIImageAlphaOne;
    v6[0] = &__kCFBooleanTrue;
    v6[1] = &__kCFBooleanTrue;
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  2LL));
    v2 = (CGImage *)objc_claimAutoreleasedReturnValue(+[CIImage imageWithCGImage:options:](&OBJC_CLASS___CIImage, "imageWithCGImage:options:", v2, v3));
  }

  return v2;
}

- (NSData)inputMessage
{
  return self->inputMessage;
}

- (void)setInputMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end