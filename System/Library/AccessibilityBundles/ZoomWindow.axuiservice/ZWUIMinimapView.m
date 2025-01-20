@interface ZWUIMinimapView
- (BOOL)enabled;
- (CGRect)zoomedRect;
- (ZWUIMinimapView)initWithFrame:(CGRect)a3;
- (void)hideSelf;
- (void)setEnabled:(BOOL)a3;
- (void)setZoomedRect:(CGRect)a3;
- (void)setZoomedRect:(CGRect)a3 screenRect:(CGRect)a4;
@end

@implementation ZWUIMinimapView

- (ZWUIMinimapView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ZWUIMinimapView;
  v3 = -[ZWUIMinimapView initWithFrame:]( &v14,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIMinimapView layer](v3, "layer"));
  [v4 setCornerRadius:6.0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4005LL));
  v6 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](v6, "layer"));
  [v7 setCornerRadius:6.0];

  -[UIVisualEffectView setClipsToBounds:](v6, "setClipsToBounds:", 1LL);
  -[ZWUIMinimapView bounds](v3, "bounds");
  -[UIVisualEffectView setFrame:](v6, "setFrame:");
  -[ZWUIMinimapView addSubview:](v3, "addSubview:", v6);
  v8 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  zoomedView = v3->_zoomedView;
  v3->_zoomedView = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UIView setBackgroundColor:](v3->_zoomedView, "setBackgroundColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_zoomedView, "layer"));
  [v11 setCornerRadius:3.0];

  -[ZWUIMinimapView addSubview:](v3, "addSubview:", v3->_zoomedView);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIMinimapView layer](v3, "layer"));
  [v12 setAllowsGroupOpacity:0];

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = __30__ZWUIMinimapView_setEnabled___block_invoke;
  v3[3] = &unk_6CAB0;
  v3[4] = self;
  BOOL v4 = a3;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v3,  0LL,  0.25,  0.0);
}

id __30__ZWUIMinimapView_setEnabled___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setZoomedRect:(CGRect)a3 screenRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat x = a4.origin.x;
  CGFloat y = a4.origin.y;
  CGFloat v6 = a3.size.height;
  CGFloat v7 = a3.size.width;
  CGFloat v8 = a3.origin.y;
  CGFloat v9 = a3.origin.x;
  -[ZWUIMinimapView setZoomedRect:](self, "setZoomedRect:");
  -[ZWUIMinimapView bounds](self, "bounds");
  CGRect v20 = CGRectInset(v19, 1.0, 1.0);
  double v11 = v20.size.width;
  double v12 = v20.size.height;
  v20.origin.CGFloat x = v9;
  v20.origin.CGFloat y = v8;
  v20.size.double width = v7;
  v20.size.double height = v6;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  CGRect v21 = CGRectIntersection(v20, v22);
  CGFloat v13 = v21.origin.x / width * v11 + 1.0;
  CGFloat v14 = v21.origin.y / height * v12 + 1.0;
  double v15 = v11 * (v21.size.width / width);
  double v16 = v12 * (v21.size.height / height);
  [(id)objc_opt_class(self) cancelPreviousPerformRequestsWithTarget:self selector:"hideSelf" object:0];
  -[ZWUIMinimapView performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "hideSelf",  0LL,  1.25);
  -[UIView setFrame:](self->_zoomedView, "setFrame:", v13, v14, v15, v16);
}

- (void)hideSelf
{
}

- (CGRect)zoomedRect
{
  double x = self->_zoomedRect.origin.x;
  double y = self->_zoomedRect.origin.y;
  double width = self->_zoomedRect.size.width;
  double height = self->_zoomedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setZoomedRect:(CGRect)a3
{
  self->_zoomedRect = a3;
}

- (void).cxx_destruct
{
}

@end