@interface MTHeaderCollectionReusableView
+ (double)height;
+ (id)reuseIdentifier;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTHeaderCollectionReusableView)initWithFrame:(CGRect)a3;
- (NSString)title;
- (UILabel)headerLabel;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHeaderLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setupSubviews;
@end

@implementation MTHeaderCollectionReusableView

+ (double)height
{
  return 44.0;
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

- (MTHeaderCollectionReusableView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTHeaderCollectionReusableView;
  v3 = -[MTHeaderCollectionReusableView initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3) {
    -[MTHeaderCollectionReusableView setupSubviews](v3, "setupSubviews");
  }
  return v4;
}

- (UILabel)headerLabel
{
  headerLabel = self->_headerLabel;
  if (!headerLabel)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    v5 = self->_headerLabel;
    self->_headerLabel = v4;

    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_headerLabel, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkTextColor](&OBJC_CLASS___UIColor, "darkTextColor"));
    -[UILabel setTextColor:](self->_headerLabel, "setTextColor:", v7);

    -[UILabel setNumberOfLines:](self->_headerLabel, "setNumberOfLines:", 1LL);
    headerLabel = self->_headerLabel;
  }

  return headerLabel;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTHeaderCollectionReusableView headerLabel](self, "headerLabel"));
  [v5 setText:v4];
}

- (NSString)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTHeaderCollectionReusableView headerLabel](self, "headerLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MTHeaderCollectionReusableView;
  -[MTHeaderCollectionReusableView layoutSubviews](&v12, "layoutSubviews");
  -[MTHeaderCollectionReusableView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTHeaderCollectionReusableView titleView](self, "titleView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTHeaderCollectionReusableView;
  -[MTHeaderCollectionReusableView prepareForReuse](&v3, "prepareForReuse");
  -[MTHeaderCollectionReusableView setTitle:](self, "setTitle:", 0LL);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTHeaderCollectionReusableView title](self, "title", a3.width, a3.height));
  if ([v5 length])
  {
    [(id)objc_opt_class(self) height];
    double v7 = v6;
  }

  else
  {
    double v7 = 0.0;
  }

  double v8 = width;
  double v9 = v7;
  result.height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)setupSubviews
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[MTHeaderCollectionReusableView setBackgroundColor:](self, "setBackgroundColor:", v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTHeaderCollectionReusableView titleView](self, "titleView"));
  -[MTHeaderCollectionReusableView addSubview:](self, "addSubview:", v4);
}

- (void)setHeaderLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end