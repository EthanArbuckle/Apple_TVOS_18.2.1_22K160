@interface CloudGeniusOnlyIfHasValueTransform
- (id)geniusValueForMLValue:(id)a3;
@end

@implementation CloudGeniusOnlyIfHasValueTransform

- (id)geniusValueForMLValue:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CloudGeniusOnlyIfHasValueTransform;
  id v3 = -[CloudGeniusHasValueTransform geniusValueForMLValue:](&v8, "geniusValueForMLValue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  else {
    v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

@end