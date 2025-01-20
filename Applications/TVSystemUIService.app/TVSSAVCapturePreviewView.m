@interface TVSSAVCapturePreviewView
+ (Class)layerClass;
- (id)videoPreviewLayer;
@end

@implementation TVSSAVCapturePreviewView

+ (Class)layerClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AVCaptureVideoPreviewLayer);
}

- (id)videoPreviewLayer
{
  return -[TVSSAVCapturePreviewView layer](self, "layer", a2, self);
}

@end