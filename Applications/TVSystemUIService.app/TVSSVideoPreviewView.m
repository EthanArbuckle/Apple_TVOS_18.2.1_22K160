@interface TVSSVideoPreviewView
+ (Class)layerClass;
- (BOOL)canBecomeFocused;
@end

@implementation TVSSVideoPreviewView

+ (Class)layerClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AVSampleBufferDisplayLayer);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

@end