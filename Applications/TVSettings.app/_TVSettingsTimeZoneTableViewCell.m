@interface _TVSettingsTimeZoneTableViewCell
- (_TVSettingsTimeZoneTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation _TVSettingsTimeZoneTableViewCell

- (_TVSettingsTimeZoneTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____TVSettingsTimeZoneTableViewCell;
  v4 = -[_TVSettingsTimeZoneTableViewCell initWithStyle:reuseIdentifier:]( &v11,  "initWithStyle:reuseIdentifier:",  3LL,  a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsTimeZoneTableViewCell detailTextLabel](v4, "detailTextLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2));
    [v6 setFont:v7];

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsTimeZoneTableViewCell textLabel](v5, "textLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
    [v8 setFont:v9];
  }

  return v5;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS____TVSettingsTimeZoneTableViewCell;
  -[_TVSettingsTimeZoneTableViewCell layoutSubviews](&v23, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsTimeZoneTableViewCell textLabel](self, "textLabel"));
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  -[_TVSettingsTimeZoneTableViewCell bounds](self, "bounds");
  double v11 = floor((v10 - v7) * 0.5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsTimeZoneTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v12, "setFrame:", v11, v5, v7, v9);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsTimeZoneTableViewCell detailTextLabel](self, "detailTextLabel"));
  [v13 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  -[_TVSettingsTimeZoneTableViewCell bounds](self, "bounds");
  double v21 = floor((v20 - v17) * 0.5);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsTimeZoneTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v22, "setFrame:", v21, v15, v17, v19);
}

@end