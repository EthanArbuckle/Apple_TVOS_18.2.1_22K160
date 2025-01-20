@interface ZWSlugBackgroundView
- (BOOL)isAccessibilityElement;
- (ZWSlugBackgroundView)initWithFrame:(CGRect)a3;
- (ZWSlugBackgroundViewDelegate)delegate;
- (id)accessibilityLabel;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ZWSlugBackgroundView

- (ZWSlugBackgroundView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ZWSlugBackgroundView;
  return -[ZWSlugBackgroundView initWithFrame:]( &v4,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (BOOL)isAccessibilityElement
{
  if (v3 <= 0.0) {
    return 0;
  }
  else {
    return -[ZWSlugBackgroundView isHidden](self, "isHidden") ^ 1;
  }
}

- (id)accessibilityLabel
{
  return ZWLocString(@"ZW_SLUG_LABEL");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5 = (ZWSlugBackgroundView *)objc_claimAutoreleasedReturnValue([a3 nextFocusedItem]);

  if (v5 == self)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[ZWSlugBackgroundView delegate](self, "delegate"));
    [v6 slugDidReceiveFocusWithSlugView:self];
  }

- (ZWSlugBackgroundViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end