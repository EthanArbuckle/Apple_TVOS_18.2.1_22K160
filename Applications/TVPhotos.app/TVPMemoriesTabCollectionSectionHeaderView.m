@interface TVPMemoriesTabCollectionSectionHeaderView
- (CGAffineTransform)focusAvoidanceContentTransform;
- (NSLayoutConstraint)topTitleConstraint;
- (NSString)title;
- (TVPMemoriesTabCollectionSectionHeaderView)initWithFrame:(CGRect)a3;
- (UILabel)titleView;
- (UIView)contentView;
- (double)contentWidth;
- (double)preferredHeight;
- (double)titleAlpha;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setFocusAvoidanceContentTransform:(CGAffineTransform *)a3;
- (void)setPreferredHeight:(double)a3;
- (void)setTitle:(id)a3;
- (void)setTitleAlpha:(double)a3;
- (void)setTopTitleConstraint:(id)a3;
@end

@implementation TVPMemoriesTabCollectionSectionHeaderView

- (TVPMemoriesTabCollectionSectionHeaderView)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabCollectionSectionHeaderView;
  v4 = -[TVPMemoriesTabCollectionSectionHeaderView initWithFrame:]( &v22,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v4)
  {
    uint64_t v5 = objc_opt_new(&OBJC_CLASS___UIView, v3);
    contentView = v4->_contentView;
    v4->_contentView = (UIView *)v5;

    -[TVPMemoriesTabCollectionSectionHeaderView addSubview:](v4, "addSubview:", v4->_contentView);
    uint64_t v8 = objc_opt_new(&OBJC_CLASS___UILabel, v7);
    titleView = v4->_titleView;
    v4->_titleView = (UILabel *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v4->_titleView, "setTextColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIFontDescriptor preferredFontDescriptorWithTextStyle:]( &OBJC_CLASS___UIFontDescriptor,  "preferredFontDescriptorWithTextStyle:",  UIFontTextStyleHeadline));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 fontDescriptorWithSymbolicTraits:2]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](&OBJC_CLASS___UIFont, "fontWithDescriptor:size:", v12, 0.0));
    -[UILabel setFont:](v4->_titleView, "setFont:", v13);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_titleView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v4->_titleAlpha = 1.0;
    -[UIView addSubview:](v4->_contentView, "addSubview:", v4->_titleView);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_titleView, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4->_contentView, "topAnchor"));
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v15]);
    topTitleConstraint = v4->_topTitleConstraint;
    v4->_topTitleConstraint = (NSLayoutConstraint *)v16;

    -[NSLayoutConstraint setActive:](v4->_topTitleConstraint, "setActive:", 1LL);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_titleView, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4->_contentView, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v18 constraintEqualToAnchor:v19]);
    [v20 setActive:1];
  }

  return v4;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionSectionHeaderView titleView](self, "titleView"));
  [v5 setText:v4];
}

- (NSString)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionSectionHeaderView titleView](self, "titleView"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (double)contentWidth
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionSectionHeaderView titleView](self, "titleView"));
  [v2 frame];
  double Width = CGRectGetWidth(v5);

  return Width;
}

- (CGAffineTransform)focusAvoidanceContentTransform
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionSectionHeaderView contentView](self, "contentView"));
  if (v4)
  {
    v6 = v4;
    [v4 transform];
    id v4 = v6;
  }

  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (void)setFocusAvoidanceContentTransform:(CGAffineTransform *)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVPMemoriesTabCollectionSectionHeaderView contentView]( self,  "contentView",  *(void *)&a3->a,  *(void *)&a3->b,  *(void *)&a3->c,  *(void *)&a3->d,  *(void *)&a3->tx,  *(void *)&a3->ty));
  [v3 setTransform:&v4];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabCollectionSectionHeaderView;
  -[TVPMemoriesTabCollectionSectionHeaderView prepareForReuse](&v3, "prepareForReuse");
  -[TVPMemoriesTabCollectionSectionHeaderView setTitleAlpha:](self, "setTitleAlpha:", 1.0);
}

- (void)setTitleAlpha:(double)a3
{
  if (self->_titleAlpha != a3)
  {
    self->_titleAlpha = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionSectionHeaderView titleView](self, "titleView"));
    [v4 setAlpha:a3];
  }

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabCollectionSectionHeaderView;
  id v4 = -[TVPMemoriesTabCollectionSectionHeaderView preferredLayoutAttributesFittingAttributes:]( &v17,  "preferredLayoutAttributesFittingAttributes:",  a3);
  CGRect v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[TVPMemoriesTabCollectionSectionHeaderView preferredHeight](self, "preferredHeight");
  double v7 = v6;
  [v5 size];
  double v9 = v8;
  double v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionSectionHeaderView titleView](self, "titleView"));
  objc_msgSend(v12, "sizeThatFits:", v9, v11);
  double v14 = v13;

  if (v7 <= 0.0) {
    double v15 = v14 + 12.0;
  }
  else {
    double v15 = v7;
  }
  objc_msgSend(v5, "setSize:", v9, v15);
  return v5;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabCollectionSectionHeaderView;
  -[TVPMemoriesTabCollectionSectionHeaderView layoutSubviews](&v27, "layoutSubviews");
  -[TVPMemoriesTabCollectionSectionHeaderView bounds](self, "bounds");
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[TVPMemoriesTabCollectionSectionHeaderView preferredHeight](self, "preferredHeight");
  double v12 = v11;
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  double Width = CGRectGetWidth(v28);
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  double Height = CGRectGetHeight(v29);
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionSectionHeaderView contentView](self, "contentView"));
  objc_msgSend(v15, "setBounds:", 0.0, 0.0, Width, Height);

  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  double MidX = CGRectGetMidX(v30);
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  double MidY = CGRectGetMidY(v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionSectionHeaderView contentView](self, "contentView"));
  objc_msgSend(v18, "setCenter:", MidX, MidY);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionSectionHeaderView titleView](self, "titleView"));
  objc_msgSend(v19, "sizeThatFits:", v8, v10);
  double v21 = v20;

  if (v12 <= 0.0) {
    double v22 = 0.0;
  }
  else {
    double v22 = v12 - v21 + -12.0;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionSectionHeaderView topTitleConstraint](self, "topTitleConstraint"));
  [v23 setConstant:v22];

  -[TVPMemoriesTabCollectionSectionHeaderView titleAlpha](self, "titleAlpha");
  double v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionSectionHeaderView titleView](self, "titleView"));
  [v26 setAlpha:v25];
}

- (double)preferredHeight
{
  return self->_preferredHeight;
}

- (void)setPreferredHeight:(double)a3
{
  self->_preferreddouble Height = a3;
}

- (double)titleAlpha
{
  return self->_titleAlpha;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UILabel)titleView
{
  return self->_titleView;
}

- (NSLayoutConstraint)topTitleConstraint
{
  return self->_topTitleConstraint;
}

- (void)setTopTitleConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end