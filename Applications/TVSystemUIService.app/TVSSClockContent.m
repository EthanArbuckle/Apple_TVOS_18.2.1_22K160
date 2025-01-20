@interface TVSSClockContent
- (Class)preferredVisualizerViewClass;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation TVSSClockContent

- (Class)preferredVisualizerViewClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVSSClockContentView);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

@end