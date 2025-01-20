@interface MTTVDeleteTableViewCell
- (MTTVDeleteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)updateColors;
@end

@implementation MTTVDeleteTableViewCell

- (MTTVDeleteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTTVDeleteTableViewCell;
  v4 = -[MTTVDeleteTableViewCell initWithStyle:reuseIdentifier:](&v9, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"Delete Station" value:&stru_100248948 table:0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVDeleteTableViewCell textLabel](v4, "textLabel"));
    [v7 setText:v6];

    -[MTTVDeleteTableViewCell updateColors](v4, "updateColors");
  }

  return v4;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVDeleteTableViewCell;
  -[MTTVDeleteTableViewCell setHighlighted:animated:](&v5, "setHighlighted:animated:", a3, a4);
  -[MTTVDeleteTableViewCell updateColors](self, "updateColors");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVDeleteTableViewCell;
  -[MTTVDeleteTableViewCell setSelected:animated:](&v5, "setSelected:animated:", a3, a4);
  -[MTTVDeleteTableViewCell updateColors](self, "updateColors");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVDeleteTableViewCell;
  id v6 = a4;
  -[MTTVDeleteTableViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v8,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B359C;
  v7[3] = &unk_10023FF98;
  v7[4] = self;
  [v6 addCoordinatedAnimations:v7 completion:0];
}

- (void)updateColors
{
  if ((-[MTTVDeleteTableViewCell isFocused](self, "isFocused") & 1) != 0
    || (-[MTTVDeleteTableViewCell isSelected](self, "isSelected") & 1) != 0
    || -[MTTVDeleteTableViewCell isHighlighted](self, "isHighlighted"))
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](&OBJC_CLASS___UIColor, "systemRedColor"));
  }

  else
  {
    if ((-[MTTVDeleteTableViewCell mt_isDarkBackground](self, "mt_isDarkBackground") & 1) == 0)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
      id v6 = 0LL;
      goto LABEL_6;
    }

    id v6 = 0LL;
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
LABEL_6:
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVDeleteTableViewCell contentView](self, "contentView"));
  [v4 setBackgroundColor:v6];

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVDeleteTableViewCell textLabel](self, "textLabel"));
  [v5 setTextColor:v3];
}

@end