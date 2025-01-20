@interface MTTVStationsPlusButtonView
- (CGPath)_shadowPathForSize:(CGSize)a3 radius:(double)a4;
- (MTTVStationsPlusButtonView)initWithFrame:(CGRect)a3;
- (UIImageView)plusButtonImageView;
- (void)addPlusImage;
- (void)layoutSubviews;
- (void)setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4;
- (void)setPlusButtonImageView:(id)a3;
- (void)setupFocus;
@end

@implementation MTTVStationsPlusButtonView

- (MTTVStationsPlusButtonView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVStationsPlusButtonView;
  v3 = -[MTTVStationsPlusButtonView initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MTTVStationsPlusButtonView addPlusImage](v3, "addPlusImage");
    -[MTTVStationsPlusButtonView setupFocus](v4, "setupFocus");
  }

  return v4;
}

- (void)setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVStationsPlusButtonView;
  id v6 = a4;
  -[MTTVStationsPlusButtonView setControlState:withAnimationCoordinator:]( &v8,  "setControlState:withAnimationCoordinator:",  a3,  v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000FB99C;
  v7[3] = &unk_100241568;
  v7[4] = self;
  v7[5] = a3;
  [v6 addCoordinatedAnimations:v7 completion:0];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVStationsPlusButtonView;
  -[MTTVStationsPlusButtonView layoutSubviews](&v7, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsPlusButtonView contentView](self, "contentView"));
  [v3 bounds];
  double v5 = ceil(v4 * 0.5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsPlusButtonView plusButtonImageView](self, "plusButtonImageView"));
  objc_msgSend(v6, "setCenter:", v5, v5);
}

- (void)addPlusImage
{
  v3 = objc_alloc(&OBJC_CLASS___UIImageView);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"plus.circle.fill"));
  double v5 = -[UIImageView initWithImage:](v3, "initWithImage:", v4);
  -[MTTVStationsPlusButtonView setPlusButtonImageView:](self, "setPlusButtonImageView:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsPlusButtonView plusButtonImageView](self, "plusButtonImageView"));
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, 150.0, 150.0);

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsPlusButtonView contentView](self, "contentView"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsPlusButtonView plusButtonImageView](self, "plusButtonImageView"));
  [v7 addSubview:v8];

  -[MTTVStationsPlusButtonView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)setupFocus
{
}

- (CGPath)_shadowPathForSize:(CGSize)a3 radius:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  double y = CGPointZero.y;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsPlusButtonView plusButtonImageView](self, "plusButtonImageView", a3.width, a3.height, a4));
  [v8 bounds];
  UIRectCenteredIntegralRect(CGPointZero.x, y, width, height, v9, v10, v11, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsPlusButtonView plusButtonImageView](self, "plusButtonImageView"));
  [v13 frame];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](&OBJC_CLASS___UIBezierPath, "bezierPathWithOvalInRect:"));

  id v15 = v14;
  v16 = (CGPath *)[v15 CGPath];

  return v16;
}

- (UIImageView)plusButtonImageView
{
  return self->_plusButtonImageView;
}

- (void)setPlusButtonImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end