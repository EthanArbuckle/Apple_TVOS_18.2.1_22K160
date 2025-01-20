@interface _TVAnimatedImageView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
@end

@implementation _TVAnimatedImageView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"contentsRect"])
  {
    BOOL v5 = 1;
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS____TVAnimatedImageView;
    BOOL v5 = -[_TVAnimatedImageView _shouldAnimatePropertyWithKey:](&v7, "_shouldAnimatePropertyWithKey:", v4);
  }

  return v5;
}

@end