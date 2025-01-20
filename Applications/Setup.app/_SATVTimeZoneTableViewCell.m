@interface _SATVTimeZoneTableViewCell
- (_SATVTimeZoneTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation _SATVTimeZoneTableViewCell

- (_SATVTimeZoneTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____SATVTimeZoneTableViewCell;
  v4 = -[_SATVTimeZoneTableViewCell initWithStyle:reuseIdentifier:](&v10, "initWithStyle:reuseIdentifier:", 3LL, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_SATVTimeZoneTableViewCell detailTextLabel](v4, "detailTextLabel"));
    [v6 setFont:v5];

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_SATVTimeZoneTableViewCell textLabel](v4, "textLabel"));
    [v8 setFont:v7];
  }

  return v4;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS____SATVTimeZoneTableViewCell;
  -[_SATVTimeZoneTableViewCell layoutSubviews](&v23, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SATVTimeZoneTableViewCell textLabel](self, "textLabel"));
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  -[_SATVTimeZoneTableViewCell bounds](self, "bounds");
  double v11 = floor((v10 - v7) * 0.5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_SATVTimeZoneTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v12, "setFrame:", v11, v5, v7, v9);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_SATVTimeZoneTableViewCell detailTextLabel](self, "detailTextLabel"));
  [v13 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  -[_SATVTimeZoneTableViewCell bounds](self, "bounds");
  double v21 = floor((v20 - v17) * 0.5);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[_SATVTimeZoneTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v22, "setFrame:", v21, v15, v17, v19);
}

@end