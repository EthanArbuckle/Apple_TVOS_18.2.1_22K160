@interface MTTVBadgeView
- (UILabel)badgeLabel;
- (void)setBadgeLabel:(id)a3;
@end

@implementation MTTVBadgeView

- (UILabel)badgeLabel
{
  badgeLabel = self->_badgeLabel;
  if (!badgeLabel)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    v5 = self->_badgeLabel;
    self->_badgeLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
    -[UILabel setFont:](self->_badgeLabel, "setFont:", v6);

    -[UILabel setNumberOfLines:](self->_badgeLabel, "setNumberOfLines:", 1LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](self->_badgeLabel, "setTextColor:", v7);

    -[UILabel setTextAlignment:](self->_badgeLabel, "setTextAlignment:", 1LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_badgeLabel, "setBackgroundColor:", v8);

    badgeLabel = self->_badgeLabel;
  }

  return badgeLabel;
}

- (void)setBadgeLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end