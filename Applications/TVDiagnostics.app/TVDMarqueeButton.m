@interface TVDMarqueeButton
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
@end

@implementation TVDMarqueeButton

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[TVDMarqueeButton isFocused](self, "isFocused");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMarqueeButton titleLabel](self, "titleLabel"));
  [v9 setMarqueeEnabled:v8];

  id v10 = -[TVDMarqueeButton isFocused](self, "isFocused");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMarqueeButton titleLabel](self, "titleLabel"));
  [v11 setMarqueeRunning:v10];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMarqueeButton titleLabel](self, "titleLabel"));
  [v12 setLineBreakMode:5];

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVDMarqueeButton;
  -[TVDMarqueeButton didUpdateFocusInContext:withAnimationCoordinator:]( &v13,  "didUpdateFocusInContext:withAnimationCoordinator:",  v7,  v6);
}

@end