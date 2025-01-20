@interface _UIFocusAnimationConfiguration
- (unint64_t)as_animationOptions;
- (void)setAs_animationOptions:(unint64_t)a3;
@end

@implementation _UIFocusAnimationConfiguration

- (unint64_t)as_animationOptions
{
  return (unint64_t)-[_UIFocusAnimationConfiguration animationOptions](self, "animationOptions");
}

- (void)setAs_animationOptions:(unint64_t)a3
{
  if ((objc_opt_respondsToSelector(self, "setAnimationOptions:") & 1) != 0) {
    -[_UIFocusAnimationConfiguration setAnimationOptions:](self, "setAnimationOptions:", a3);
  }
}

@end