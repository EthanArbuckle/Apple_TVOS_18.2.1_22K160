@interface TVMusicBlurEffect
+ (id)musicBlurEffectWithStyle:(int64_t)a3;
- (NSNumber)customBlurRadius;
- (NSNumber)customSaturation;
- (id)effectSettings;
- (void)setCustomBlurRadius:(id)a3;
- (void)setCustomSaturation:(id)a3;
@end

@implementation TVMusicBlurEffect

+ (id)musicBlurEffectWithStyle:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___TVMusicBlurEffect;
  id v3 = objc_msgSendSuper2(&v5, "effectWithStyle:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)effectSettings
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicBlurEffect;
  id v3 = -[TVMusicBlurEffect effectSettings](&v10, "effectSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBlurEffect customBlurRadius](self, "customBlurRadius"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBlurEffect customBlurRadius](self, "customBlurRadius"));
    [v6 doubleValue];
    objc_msgSend(v4, "setBlurRadius:");
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBlurEffect customSaturation](self, "customSaturation"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBlurEffect customSaturation](self, "customSaturation"));
    [v8 doubleValue];
    objc_msgSend(v4, "setSaturationDeltaFactor:");
  }

  return v4;
}

- (NSNumber)customBlurRadius
{
  return self->_customBlurRadius;
}

- (void)setCustomBlurRadius:(id)a3
{
}

- (NSNumber)customSaturation
{
  return self->_customSaturation;
}

- (void)setCustomSaturation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end