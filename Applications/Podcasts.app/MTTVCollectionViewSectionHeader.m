@interface MTTVCollectionViewSectionHeader
+ (CGSize)estimatedSize:(CGSize)a3;
+ (id)titleFont;
- (BOOL)avoiding;
- (IMTVVibrantLabel)vibrantLabel;
- (MTTVCollectionViewSectionHeader)initWithFrame:(CGRect)a3;
- (UILabel)headerLabel;
- (id)title;
- (id)titleView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAvoiding:(BOOL)a3;
- (void)setHeaderLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVibrantLabel:(id)a3;
@end

@implementation MTTVCollectionViewSectionHeader

+ (CGSize)estimatedSize:(CGSize)a3
{
  CGFloat width = a3.width;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "titleFont", a3.width, a3.height));
  [v4 descender];
  double v6 = IMRoundToPixel(70.0 - v5 + 20.0) + 4.0;

  double v7 = width;
  double v8 = v6;
  result.height = v8;
  result.CGFloat width = v7;
  return result;
}

+ (id)titleFont
{
  return +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
}

- (MTTVCollectionViewSectionHeader)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVCollectionViewSectionHeader;
  v3 = -[MTHeaderCollectionReusableView initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[MTTVCollectionViewSectionHeader setBackgroundColor:](v3, "setBackgroundColor:", v4);
  }

  return v3;
}

- (void)setAvoiding:(BOOL)a3
{
  if (self->_avoiding != a3)
  {
    self->_avoiding = a3;
    if (a3)
    {
      CGAffineTransformMakeTranslation(&v6, 0.0, 6.0 - 35.0);
    }

    else
    {
      __int128 v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&v6.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v6.c = v4;
      *(_OWORD *)&v6.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    }

    CGAffineTransform v5 = v6;
    -[MTTVCollectionViewSectionHeader setTransform:](self, "setTransform:", &v5);
  }

- (IMTVVibrantLabel)vibrantLabel
{
  vibrantLabel = self->_vibrantLabel;
  if (!vibrantLabel)
  {
    __int128 v4 = objc_alloc(&OBJC_CLASS___IMTVVibrantLabel);
    CGAffineTransform v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVCollectionViewSectionHeader headerLabel](self, "headerLabel"));
    CGAffineTransform v6 = -[IMTVVibrantLabel initWithLabel:blurEffectStyle:](v4, "initWithLabel:blurEffectStyle:", v5, 5000LL);
    double v7 = self->_vibrantLabel;
    self->_vibrantLabel = v6;

    vibrantLabel = self->_vibrantLabel;
  }

  return vibrantLabel;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTVCollectionViewSectionHeader headerLabel](self, "headerLabel"));
  [v5 setText:v4];
}

- (id)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVCollectionViewSectionHeader headerLabel](self, "headerLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return v3;
}

- (id)titleView
{
  return -[MTTVCollectionViewSectionHeader vibrantLabel](self, "vibrantLabel");
}

- (UILabel)headerLabel
{
  headerLabel = self->_headerLabel;
  if (!headerLabel)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    id v5 = self->_headerLabel;
    self->_headerLabel = v4;

    -[UILabel setNumberOfLines:](self->_headerLabel, "setNumberOfLines:", 1LL);
    id v6 = [(id)objc_opt_class(self) titleFont];
    double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[UILabel setFont:](self->_headerLabel, "setFont:", v7);

    headerLabel = self->_headerLabel;
  }

  return headerLabel;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MTTVCollectionViewSectionHeader;
  -[MTHeaderCollectionReusableView layoutSubviews](&v22, "layoutSubviews");
  -[MTTVCollectionViewSectionHeader bounds](self, "bounds");
  CGFloat x = v23.origin.x;
  CGFloat y = v23.origin.y;
  CGFloat width = v23.size.width;
  CGFloat height = v23.size.height;
  CGRect v24 = CGRectInset(v23, 64.0, 20.0);
  double v7 = v24.origin.x;
  double v8 = v24.size.width;
  double v9 = v24.size.height;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVCollectionViewSectionHeader titleView](self, "titleView"));
  objc_msgSend(v10, "sizeThatFits:", v8, v9);
  double v12 = v11;
  double v14 = v13;

  id v15 = [(id)objc_opt_class(self) titleFont];
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v16, "mt_offsetFromFirstBaselineToTop");
  double v18 = 70.0 - v17 + 11.0;
  if (-[MTTVCollectionViewSectionHeader mt_isRTL](self, "mt_isRTL"))
  {
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v25);
    v26.origin.CGFloat x = v7;
    v26.origin.CGFloat y = v18;
    v26.size.CGFloat width = v12;
    v26.size.CGFloat height = v14;
    double v20 = MaxX - CGRectGetWidth(v26);
    v27.origin.CGFloat x = v7;
    v27.origin.CGFloat y = v18;
    v27.size.CGFloat width = v12;
    v27.size.CGFloat height = v14;
    double v7 = v20 - CGRectGetMinX(v27);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVCollectionViewSectionHeader titleView](self, "titleView"));
  objc_msgSend(v21, "setFrame:", v7, v18, v12, v14);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTTVCollectionViewSectionHeader;
  -[MTHeaderCollectionReusableView prepareForReuse](&v3, "prepareForReuse");
  -[MTTVCollectionViewSectionHeader setAvoiding:](self, "setAvoiding:", 0LL);
}

- (void)setVibrantLabel:(id)a3
{
}

- (BOOL)avoiding
{
  return self->_avoiding;
}

- (void)setHeaderLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end