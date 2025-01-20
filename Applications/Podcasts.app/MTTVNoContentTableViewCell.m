@interface MTTVNoContentTableViewCell
+ (double)heightForStyle:(unint64_t)a3;
+ (double)marginBottomForStyle:(unint64_t)a3;
+ (id)messageFont;
+ (id)reuseIdentifier;
- (MTTVNoContentTableViewCell)init;
- (MTTVNoContentTableViewCell)initWithMessage:(id)a3;
- (MTTVNoContentTableViewCell)initWithReuseIdentifier:(id)a3;
- (MTTVNoContentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)message;
- (UILabel)messageLabel;
- (void)configureSubviews;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setMessage:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTextColors;
@end

@implementation MTTVNoContentTableViewCell

+ (id)reuseIdentifier
{
  return @"kMTTVNoContentTableViewCellReuseIdentifier";
}

+ (double)heightForStyle:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 messageFont]);
  [v5 capHeight];
  double v7 = v6 + 30.0;
  [a1 marginBottomForStyle:a3];
  double v9 = v7 + v8;

  return v9;
}

+ (double)marginBottomForStyle:(unint64_t)a3
{
  double result = 5.0;
  if (!a3) {
    return 30.0;
  }
  return result;
}

+ (id)messageFont
{
  return +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleSubtitle1);
}

- (MTTVNoContentTableViewCell)init
{
  id v3 = [(id)objc_opt_class(self) reuseIdentifier];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[MTTVNoContentTableViewCell initWithReuseIdentifier:](self, "initWithReuseIdentifier:", v4);

  return v5;
}

- (MTTVNoContentTableViewCell)initWithMessage:(id)a3
{
  id v4 = a3;
  v5 = -[MTTVNoContentTableViewCell init](self, "init");
  double v6 = v5;
  if (v5) {
    -[MTTVNoContentTableViewCell setMessage:](v5, "setMessage:", v4);
  }

  return v6;
}

- (MTTVNoContentTableViewCell)initWithReuseIdentifier:(id)a3
{
  return -[MTTVNoContentTableViewCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0LL, a3);
}

- (MTTVNoContentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVNoContentTableViewCell;
  id v4 = -[MTTVNoContentTableViewCell initWithStyle:reuseIdentifier:](&v8, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MTTVNoContentTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0LL);
    -[MTTVNoContentTableViewCell setSeparatorStyle:](v5, "setSeparatorStyle:", 0LL);
    -[MTTVNoContentTableViewCell setSeparatorInset:]( v5,  "setSeparatorInset:",  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[MTTVNoContentTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[MTTVNoContentTableViewCell configureSubviews](v5, "configureSubviews");
  }

  return v5;
}

- (void)configureSubviews
{
  id v3 = objc_opt_new(&OBJC_CLASS___UILabel);
  messageLabel = self->_messageLabel;
  self->_messageLabel = v3;

  id v5 = [(id)objc_opt_class(self) messageFont];
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[UILabel setFont:](self->_messageLabel, "setFont:", v6);

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVNoContentTableViewCell message](self, "message"));
  -[UILabel setText:](self->_messageLabel, "setText:", v7);

  -[UILabel setAlpha:](self->_messageLabel, "setAlpha:", 1.0);
  -[UILabel setOpaque:](self->_messageLabel, "setOpaque:", 1LL);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVNoContentTableViewCell contentView](self, "contentView"));
  [v8 addSubview:self->_messageLabel];

  -[MTTVNoContentTableViewCell updateTextColors](self, "updateTextColors");
}

- (void)setMessage:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_message, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_message, a3);
    -[UILabel setText:](self->_messageLabel, "setText:", v5);
    -[UILabel sizeToFit](self->_messageLabel, "sizeToFit");
    -[MTTVNoContentTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateTextColors
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTTVNoContentTableViewCell mt_primaryTextColor](self, "mt_primaryTextColor"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVNoContentTableViewCell messageLabel](self, "messageLabel"));
  [v3 setTextColor:v4];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MTTVNoContentTableViewCell;
  -[MTTVNoContentTableViewCell layoutSubviews](&v13, "layoutSubviews");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVNoContentTableViewCell messageLabel](self, "messageLabel"));
  [v3 frame];
  double v5 = v4;

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVNoContentTableViewCell messageLabel](self, "messageLabel"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 font]);
  objc_msgSend(v7, "mt_offsetFromCapHeightToAscent");
  double v9 = 30.0 - v8;

  -[MTTVNoContentTableViewCell bounds](self, "bounds");
  double v11 = v10 + -8.0 + -8.0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVNoContentTableViewCell messageLabel](self, "messageLabel"));
  objc_msgSend(v12, "setFrame:", 8.0, v9, v11, v5);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVNoContentTableViewCell;
  id v4 = a3;
  -[MTTVNoContentTableViewCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVNoContentTableViewCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    -[MTTVNoContentTableViewCell updateTextColors](self, "updateTextColors");
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVNoContentTableViewCell;
  -[MTTVNoContentTableViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v5,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  a4);
  -[MTTVNoContentTableViewCell updateTextColors](self, "updateTextColors");
}

- (NSString)message
{
  return self->_message;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end