@interface ZWCancelButtonTouchesScrollView
- (BOOL)touchesShouldCancelInContentView:(id)a3;
- (id)panGestureRecognizer;
@end

@implementation ZWCancelButtonTouchesScrollView

- (id)panGestureRecognizer
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ZWCancelButtonTouchesScrollView;
  id v2 = -[ZWCancelButtonTouchesScrollView panGestureRecognizer](&v4, "panGestureRecognizer");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___UIButton);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    BOOL v6 = 1;
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___ZWCancelButtonTouchesScrollView;
    BOOL v6 = -[ZWCancelButtonTouchesScrollView touchesShouldCancelInContentView:]( &v8,  "touchesShouldCancelInContentView:",  v4);
  }

  return v6;
}

@end