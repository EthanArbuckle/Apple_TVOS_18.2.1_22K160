@interface UIFocusGuide
- (void)tvm_showDebugViewWithColor:(id)a3;
@end

@implementation UIFocusGuide

- (void)tvm_showDebugViewWithColor:(id)a3
{
  id v10 = a3;
  if (-[UIFocusGuide isEnabled](self, "isEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide identifier](self, "identifier"));
    unsigned __int8 v5 = [v4 isEqualToString:@"debugView"];

    if ((v5 & 1) == 0)
    {
      v6 = objc_alloc(&OBJC_CLASS___UIView);
      -[UIFocusGuide layoutFrame](self, "layoutFrame");
      v7 = -[UIView initWithFrame:](v6, "initWithFrame:");
      -[UIView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0LL);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v10 colorWithAlphaComponent:0.3]);
      -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide owningView](self, "owningView"));
      [v9 addSubview:v7];

      -[UIFocusGuide setIdentifier:](self, "setIdentifier:", @"debugView");
    }
  }
}

@end