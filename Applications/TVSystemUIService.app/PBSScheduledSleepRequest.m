@interface PBSScheduledSleepRequest
- (NSString)contentTitle;
- (UIImage)contentImage;
@end

@implementation PBSScheduledSleepRequest

- (NSString)contentTitle
{
  return (NSString *)-[PBSScheduledSleepRequest localizedValue](self, "localizedValue", a2, self);
}

- (UIImage)contentImage
{
  return (UIImage *)+[UIImage _systemImageNamed:]( &OBJC_CLASS___UIImage,  "_systemImageNamed:",  @"fitness.timer",  a2,  self);
}

@end