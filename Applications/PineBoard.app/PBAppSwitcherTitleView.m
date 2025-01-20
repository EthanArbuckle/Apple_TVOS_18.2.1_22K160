@interface PBAppSwitcherTitleView
+ (void)initialize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (PBAppSwitcherTitleView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (double)titleOpacity;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleOpacity:(double)a3;
@end

@implementation PBAppSwitcherTitleView

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___PBAppSwitcherTitleView) == a1)
  {
    TVSUIAppIconAttributesForVariant(v4, 1LL);
    xmmword_100470A78 = v4[0];
    *(_OWORD *)algn_100470A88 = v4[1];
    uint64_t v2 = v6;
    uint64_t v6 = 0LL;
    v3 = (void *)qword_100470AA0;
    qword_100470A98 = v5;
    qword_100470AA0 = v2;
  }

- (PBAppSwitcherTitleView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PBAppSwitcherTitleView;
  v3 = -[PBAppSwitcherTitleView initWithFrame:]( &v17,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_titleOpacity = 1.0;
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v5;

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 1LL);
    v7 = v4->_titleLabel;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v7, "setTextColor:", v8);

    v9 = v4->_titleLabel;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle3));
    -[UILabel setFont:](v9, "setFont:", v10);

    -[UILabel setText:](v4->_titleLabel, "setText:", @" ");
    -[UILabel sizeToFit](v4->_titleLabel, "sizeToFit");
    -[PBAppSwitcherTitleView addSubview:](v4, "addSubview:", v4->_titleLabel);
    v11 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    imageView = v4->_imageView;
    v4->_imageView = v11;

    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", 2LL);
    -[UIImageView setClipsToBounds:](v4->_imageView, "setClipsToBounds:", 1LL);
    double v13 = *(double *)&qword_100470A98 * (*((double *)&xmmword_100470A78 + 1) / *(double *)&qword_100470A90);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v4->_imageView, "layer"));
    [v14 setCornerRadius:v13];

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v4->_imageView, "layer"));
    [v15 setCornerCurve:qword_100470AA0];

    -[PBAppSwitcherTitleView addSubview:](v4, "addSubview:", v4->_imageView);
  }

  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  -[UILabel bounds](self->_titleLabel, "bounds", a3.width, a3.height);
  double MaxX = CGRectGetMaxX(v7);
  if (MaxX < width) {
    double MaxX = width;
  }
  double v5 = *((double *)&xmmword_100470A78 + 1);
  result.height = v5;
  result.double width = MaxX;
  return result;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___PBAppSwitcherTitleView;
  -[PBAppSwitcherTitleView layoutSubviews](&v27, "layoutSubviews");
  -[PBAppSwitcherTitleView bounds](self, "bounds");
  CGFloat y = v28.origin.y;
  CGFloat x = v28.origin.x;
  CGFloat height = v28.size.height;
  CGFloat v3 = CGRectZero.origin.y;
  CGSize v4 = (CGSize)xmmword_100470A78;
  CGFloat width = v28.size.width;
  double v6 = CGRectGetHeight(v28);
  v29.origin.CGFloat x = CGRectZero.origin.x;
  v29.origin.CGFloat y = v3;
  v29.size = v4;
  CGFloat v7 = (v6 - CGRectGetHeight(v29)) * 0.5;
  -[UIImageView setFrame:](self->_imageView, "setFrame:", CGRectZero.origin.x, v7, v4);
  -[UILabel frame](self->_titleLabel, "frame");
  CGFloat rect = v8;
  CGFloat v10 = v9;
  double v12 = v11;
  v30.origin.CGFloat x = CGRectZero.origin.x;
  v30.origin.CGFloat y = v7;
  v30.size = v4;
  CGFloat v13 = CGRectGetMaxX(v30) + 30.0;
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double v14 = CGRectGetHeight(v31);
  v32.origin.CGFloat x = v13;
  v32.origin.CGFloat y = rect;
  v32.size.CGFloat width = v10;
  v32.size.CGFloat height = v12;
  CGFloat v15 = (v14 - CGRectGetHeight(v32)) * 0.5;
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double v16 = CGRectGetWidth(v33);
  v34.origin.CGFloat x = v13;
  v34.origin.CGFloat y = v15;
  v34.size.CGFloat width = v10;
  v34.size.CGFloat height = v12;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v13, v15, v16 - CGRectGetMinX(v34), v12);
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v18 = [v17 userInterfaceLayoutDirection];

  if (v18 == (id)1)
  {
    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 2LL);
    titleLabel = self->_titleLabel;
    CGAffineTransformMakeScale(&v26, -1.0, 1.0);
    -[UILabel setTransform:](titleLabel, "setTransform:", &v26);
    imageView = self->_imageView;
    CGAffineTransformMakeScale(&v25, -1.0, 1.0);
    -[UIImageView setTransform:](imageView, "setTransform:", &v25);
  }

- (void)setTitle:(id)a3
{
  id v4 = a3;
  if ((-[NSString isEqual:](self->_title, "isEqual:", v4) & 1) == 0)
  {
    -[UILabel setText:](self->_titleLabel, "setText:", v4);
    -[PBAppSwitcherTitleView setNeedsLayout](self, "setNeedsLayout");
    double v5 = (NSString *)[v4 copy];
    title = self->_title;
    self->_title = v5;
  }
}

- (void)setTitleOpacity:(double)a3
{
  if (self->_titleOpacity != a3)
  {
    -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", a3);
    self->_titleOpacitCGFloat y = a3;
  }

- (void)setImage:(id)a3
{
  id v5 = a3;
  if ((-[UIImage isEqual:](self->_image, "isEqual:", v5) & 1) == 0)
  {
    -[UIImageView setImage:](self->_imageView, "setImage:", v5);
    objc_storeStrong((id *)&self->_image, a3);
  }
}

- (NSString)title
{
  return self->_title;
}

- (double)titleOpacity
{
  return self->_titleOpacity;
}

- (UIImage)image
{
  return self->_image;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
}

@end