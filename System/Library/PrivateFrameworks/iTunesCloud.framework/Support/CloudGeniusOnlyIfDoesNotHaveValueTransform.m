@interface CloudGeniusOnlyIfDoesNotHaveValueTransform
- (id)geniusValueForMLValue:(id)a3;
@end

@implementation CloudGeniusOnlyIfDoesNotHaveValueTransform

- (id)geniusValueForMLValue:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CloudGeniusOnlyIfDoesNotHaveValueTransform;
  id v3 = -[CloudGeniusHasValueTransform geniusValueForMLValue:](&v8, "geniusValueForMLValue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  else {
    v5 = &__kCFBooleanTrue;
  }
  id v6 = v5;

  return v6;
}

@end