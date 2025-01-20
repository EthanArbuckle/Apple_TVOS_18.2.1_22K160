@interface MTNoContentTableViewCell
+ (id)reuseIdentifier;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTColorTheme)colorTheme;
- (MTNoContentTableViewCell)init;
- (MTNoContentTableViewCell)initWithReuseIdentifier:(id)a3;
- (MTNoContentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)message;
- (UIEdgeInsets)_layoutMargins;
- (UIEdgeInsets)contentInset;
- (void)layoutSubviews;
- (void)setColorTheme:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setMessage:(id)a3;
- (void)set_layoutMargins:(UIEdgeInsets)a3;
- (void)setupCell;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MTNoContentTableViewCell

+ (id)reuseIdentifier
{
  return @"kMTNoContentTableViewCellReuseIdentifier";
}

- (MTNoContentTableViewCell)init
{
  id v3 = [(id)objc_opt_class(self) reuseIdentifier];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[MTNoContentTableViewCell initWithReuseIdentifier:](self, "initWithReuseIdentifier:", v4);

  return v5;
}

- (MTNoContentTableViewCell)initWithReuseIdentifier:(id)a3
{
  return -[MTNoContentTableViewCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0LL, a3);
}

- (MTNoContentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTNoContentTableViewCell;
  v4 = -[MTTableViewCell initWithStyle:reuseIdentifier:](&v8, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MTNoContentTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0LL);
    -[MTNoContentTableViewCell setSeparatorInset:]( v5,  "setSeparatorInset:",  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[MTNoContentTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v6);
  }

  return v5;
}

- (void)setupCell
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTNoContentTableViewCell;
  -[MTTableViewCell setupCell](&v7, "setupCell");
  -[MTNoContentTableViewCell bounds](self, "bounds");
  id v3 = (UILabel *)objc_claimAutoreleasedReturnValue( +[MTContentUnavailableView messageLabelWithFrame:]( &OBJC_CLASS___MTContentUnavailableView,  "messageLabelWithFrame:"));
  messageLabel = self->_messageLabel;
  self->_messageLabel = v3;

  -[UILabel setAutoresizingMask:](self->_messageLabel, "setAutoresizingMask:", 18LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTNoContentTableViewCell message](self, "message"));
  -[UILabel setText:](self->_messageLabel, "setText:", v5);

  -[UILabel setAlpha:](self->_messageLabel, "setAlpha:", 1.0);
  -[UILabel setOpaque:](self->_messageLabel, "setOpaque:", 1LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTNoContentTableViewCell contentView](self, "contentView"));
  [v6 addSubview:self->_messageLabel];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTNoContentTableViewCell;
  id v4 = a3;
  -[MTNoContentTableViewCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTNoContentTableViewCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  id v6 = [v5 horizontalSizeClass];
  id v7 = [v4 horizontalSizeClass];

  if (v6 != v7) {
    -[MTNoContentTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MTNoContentTableViewCell;
  -[MTTableViewCell layoutSubviews](&v17, "layoutSubviews");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTNoContentTableViewCell contentView](self, "contentView"));
  [v3 bounds];
  CGRectGetHeight(v18);

  -[UILabel frame](self->_messageLabel, "frame");
  -[UILabel setFrame:](self->_messageLabel, "setFrame:");
  UIUserInterfaceLayoutDirection v4 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:]( &OBJC_CLASS___UIView,  "userInterfaceLayoutDirectionForSemanticContentAttribute:",  -[MTNoContentTableViewCell semanticContentAttribute](self, "semanticContentAttribute"));
  -[MTNoContentTableViewCell contentInset](self, "contentInset");
  double v6 = v5;
  -[MTNoContentTableViewCell contentInset](self, "contentInset");
  double v8 = v7;
  -[MTNoContentTableViewCell bounds](self, "bounds");
  double Width = CGRectGetWidth(v19);
  unsigned int v10 = -[MTNoContentTableViewCell isHorizontallyRegular](self, "isHorizontallyRegular");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v11 scale];
  double v13 = v12;

  if (v4)
  {
    else {
      double v14 = 0.0;
    }
  }

  else
  {
    double v14 = v6;
  }

  double v15 = 0.0;
  if (v10) {
    double v15 = v8;
  }
  double v16 = Width - v6 - v15;
  -[MTNoContentTableViewCell bounds](self, "bounds");
  -[UIView setFrame:](self->super._separator, "setFrame:", v14, CGRectGetMaxY(v20) + -24.0 - 1.0 / v13, v16, 1.0 / v13);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTNoContentTableViewCell;
  -[MTNoContentTableViewCell sizeThatFits:](&v6, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4 + 24.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return -[UILabel text](self->_messageLabel, "text");
}

- (void)setColorTheme:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_colorTheme, a3);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v9 backgroundColor]);
  if (v5)
  {
    -[MTNoContentTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);
  }

  else
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[MTNoContentTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v6);
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryTextColorForTheme:](&OBJC_CLASS___UIColor, "secondaryTextColorForTheme:", v9));
  -[UILabel setTextColor:](self->_messageLabel, "setTextColor:", v7);

  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColorForTheme:](&OBJC_CLASS___UIColor, "separatorColorForTheme:", v9));
  -[UIView setBackgroundColor:](self->super._separator, "setBackgroundColor:", v8);
}

- (MTColorTheme)colorTheme
{
  return self->_colorTheme;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (UIEdgeInsets)_layoutMargins
{
  double top = self->__layoutMargins.top;
  double left = self->__layoutMargins.left;
  double bottom = self->__layoutMargins.bottom;
  double right = self->__layoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)set_layoutMargins:(UIEdgeInsets)a3
{
  self->__layoutMargins = a3;
}

- (void).cxx_destruct
{
}

@end