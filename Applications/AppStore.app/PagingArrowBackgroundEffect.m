@interface PagingArrowBackgroundEffect
+ (id)effectWithStyle:(int64_t)a3;
- (id)effectSettings;
@end

@implementation PagingArrowBackgroundEffect

+ (id)effectWithStyle:(int64_t)a3
{
  return _[a1 _effectWithStyle:a3 invertAutomaticStyle:0];
}

- (id)effectSettings
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PagingArrowBackgroundEffect;
  id v2 = -[PagingArrowBackgroundEffect effectSettings](&v5, "effectSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  [v3 setBlurRadius:0.0];
  return v3;
}

@end