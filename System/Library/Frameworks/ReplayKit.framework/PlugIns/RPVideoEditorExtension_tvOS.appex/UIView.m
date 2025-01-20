@interface UIView
+ (id)_srVideoOverlayButtonWithStyle:(int64_t)a3;
@end

@implementation UIView

+ (id)_srVideoOverlayButtonWithStyle:(int64_t)a3
{
  if (a3 == 2
    || !a3
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice")),
        id v5 = [v4 _graphicsQuality],
        v4,
        v5 == (id)10))
  {
    v6 = off_10000C108;
  }

  else
  {
    v6 = &off_10000C110;
  }

  return [objc_alloc(*v6) initWithStyle:a3];
}

@end