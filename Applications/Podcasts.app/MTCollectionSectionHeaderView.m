@interface MTCollectionSectionHeaderView
+ (double)height;
+ (id)font;
- (BOOL)isFloating;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTCollectionSectionHeaderView)initWithFrame:(CGRect)a3;
- (MTTVSectionHeaderView)sectionHeaderView;
- (UILabel)textLabel;
- (double)maxWidth;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setMaxWidth:(double)a3;
- (void)setNeedsLayout;
- (void)setSectionHeaderView:(id)a3;
@end

@implementation MTCollectionSectionHeaderView

+ (double)height
{
  return result;
}

+ (id)font
{
  return +[MTTVSectionHeaderView font](&OBJC_CLASS___MTTVSectionHeaderView, "font");
}

- (MTCollectionSectionHeaderView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTCollectionSectionHeaderView;
  v3 = -[MTCollectionReusableView initWithFrame:]( &v8,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionReusableView contentView](v3, "contentView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionSectionHeaderView sectionHeaderView](v4, "sectionHeaderView"));
    [v5 addSubview:v6];

    -[MTCollectionSectionHeaderView setPreservesSuperviewLayoutMargins:](v4, "setPreservesSuperviewLayoutMargins:", 1LL);
    -[MTCollectionSectionHeaderView setClipsToBounds:](v4, "setClipsToBounds:", 1LL);
  }

  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTCollectionSectionHeaderView;
  -[MTCollectionReusableView layoutSubviews](&v3, "layoutSubviews");
  -[MTCollectionSectionHeaderView bounds](self, "bounds");
  -[MTTVSectionHeaderView setFrame:](self->_sectionHeaderView, "setFrame:");
}

- (void)setNeedsLayout
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTCollectionSectionHeaderView;
  -[MTCollectionSectionHeaderView setNeedsLayout](&v3, "setNeedsLayout");
  -[MTTVSectionHeaderView setNeedsLayout](self->_sectionHeaderView, "setNeedsLayout");
}

- (BOOL)isFloating
{
  return -[MTTVSectionHeaderView floating](self->_sectionHeaderView, "floating");
}

- (void)setMaxWidth:(double)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionSectionHeaderView sectionHeaderView](self, "sectionHeaderView"));
  [v4 setMaxWidth:a3];
}

- (double)maxWidth
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionSectionHeaderView sectionHeaderView](self, "sectionHeaderView"));
  [v2 maxWidth];
  double v4 = v3;

  return v4;
}

- (UILabel)textLabel
{
  return -[MTTVSectionHeaderView textLabel](self->_sectionHeaderView, "textLabel");
}

- (MTTVSectionHeaderView)sectionHeaderView
{
  sectionHeaderView = self->_sectionHeaderView;
  if (!sectionHeaderView)
  {
    double v4 = objc_alloc_init(&OBJC_CLASS___MTTVSectionHeaderView);
    v5 = self->_sectionHeaderView;
    self->_sectionHeaderView = v4;

    sectionHeaderView = self->_sectionHeaderView;
  }

  return sectionHeaderView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionSectionHeaderView textLabel](self, "textLabel", a3.width, a3.height));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 text]);
  if ([v6 length])
  {
    [(id)objc_opt_class(self) height];
    double v8 = v7;
  }

  else
  {
    double v8 = 0.0;
  }

  double v9 = width;
  double v10 = v8;
  result.height = v10;
  result.CGFloat width = v9;
  return result;
}

- (void)prepareForReuse
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTCollectionSectionHeaderView;
  -[MTCollectionSectionHeaderView prepareForReuse](&v8, "prepareForReuse");
  id v3 = [(id)objc_opt_class(self) font];
  double v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionSectionHeaderView textLabel](self, "textLabel"));
  [v5 setFont:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionSectionHeaderView textLabel](self, "textLabel"));
  [v6 setText:0];

  -[MTCollectionReusableView setFloating:](self, "setFloating:", 0LL);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionSectionHeaderView sectionHeaderView](self, "sectionHeaderView"));
  [v7 prepareForReuse];
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTCollectionSectionHeaderView;
  -[MTCollectionSectionHeaderView applyLayoutAttributes:](&v9, "applyLayoutAttributes:", v4);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MTCollectionViewFlowLayoutAttributes);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionSectionHeaderView sectionHeaderView](self, "sectionHeaderView"));
    id v8 = [v6 isFloating];

    [v7 setFloating:v8];
  }
}

- (void)setSectionHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end