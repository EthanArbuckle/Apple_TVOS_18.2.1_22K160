@interface PhoneRootView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PhoneRootView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PhoneRootView;
  id v5 = -[PhoneRootView hitTest:withEvent:](&v8, "hitTest:withEvent:", a4, a3.x, a3.y);
  v6 = (PhoneRootView *)objc_claimAutoreleasedReturnValue(v5);
  if (v6 == self)
  {

    v6 = 0LL;
  }

  return v6;
}

@end