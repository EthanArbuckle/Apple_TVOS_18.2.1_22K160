@interface MTToolbar
- (BOOL)isSeparatorHidden;
- (MTToolbar)init;
- (UIColor)separatorColor;
- (id)_separatorColor;
- (void)layoutSubviews;
- (void)setSeparatorColor:(id)a3;
- (void)setSeparatorHidden:(BOOL)a3;
- (void)setupView;
@end

@implementation MTToolbar

- (MTToolbar)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTToolbar;
  v2 = -[MTToolbar init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[MTToolbar setupView](v2, "setupView");
  }
  return v3;
}

- (void)setupView
{
  v3 = objc_opt_new(&OBJC_CLASS___UIImage);
  -[MTToolbar setBackgroundImage:forToolbarPosition:barMetrics:]( self,  "setBackgroundImage:forToolbarPosition:barMetrics:",  v3,  0LL,  0LL);

  v4 = objc_opt_new(&OBJC_CLASS___UIImage);
  -[MTToolbar setShadowImage:forToolbarPosition:](self, "setShadowImage:forToolbarPosition:", v4, 0LL);

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[MTToolbar setBackgroundColor:](self, "setBackgroundColor:", v5);

  v6 = objc_alloc_init(&OBJC_CLASS___UIView);
  separatorView = self->_separatorView;
  self->_separatorView = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTToolbar _separatorColor](self, "_separatorColor"));
  -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", v8);

  -[MTToolbar addSubview:](self, "addSubview:", self->_separatorView);
}

- (void)setSeparatorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[MTToolbar isSeparatorHidden](self, "isSeparatorHidden") != a3) {
    -[UIView setHidden:](self->_separatorView, "setHidden:", v3);
  }
}

- (BOOL)isSeparatorHidden
{
  return -[UIView isHidden](self->_separatorView, "isHidden");
}

- (void)setSeparatorColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  if (self->_separatorColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_separatorColor, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTToolbar _separatorColor](self, "_separatorColor"));
    -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", v6);

    objc_super v5 = v7;
  }
}

- (id)_separatorColor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTToolbar separatorColor](self, "separatorColor"));
  BOOL v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor cellSeparatorColor](&OBJC_CLASS___UIColor, "cellSeparatorColor"));
  }
  objc_super v5 = v4;

  return v5;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTToolbar;
  -[MTToolbar layoutSubviews](&v9, "layoutSubviews");
  if (self->_separatorView)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v3 scale];
    double v5 = v4;

    -[MTToolbar bounds](self, "bounds");
    double v7 = v6;
    -[MTToolbar bounds](self, "bounds");
    -[UIView setFrame:](self->_separatorView, "setFrame:", CGRectZero.origin.x, v8 - 1.0 / v5, v7, 1.0 / v5);
  }

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (void).cxx_destruct
{
}

@end