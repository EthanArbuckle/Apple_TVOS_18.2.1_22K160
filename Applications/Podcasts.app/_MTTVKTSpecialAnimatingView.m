@interface _MTTVKTSpecialAnimatingView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
@end

@implementation _MTTVKTSpecialAnimatingView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"zPosition"] & 1) != 0
    || ([v4 isEqualToString:@"cornerRadius"] & 1) != 0)
  {
    BOOL v5 = 1;
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS____MTTVKTSpecialAnimatingView;
    BOOL v5 = -[_MTTVKTSpecialAnimatingView _shouldAnimatePropertyWithKey:](&v7, "_shouldAnimatePropertyWithKey:", v4);
  }

  return v5;
}

@end