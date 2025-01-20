@interface ZWMenuItemSimpleButtonTableViewCell
- (ZWMenuItemSimpleButtonTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_applyTitleLabelColor;
@end

@implementation ZWMenuItemSimpleButtonTableViewCell

- (ZWMenuItemSimpleButtonTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ZWMenuItemSimpleButtonTableViewCell;
  v4 = -[ZWMenuItemSimpleButtonTableViewCell initWithStyle:reuseIdentifier:]( &v9,  "initWithStyle:reuseIdentifier:",  a3,  a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuItemSimpleButtonTableViewCell textLabel](v4, "textLabel"));
    -[ZWMenuItemSimpleButtonTableViewCell _applyTitleLabelColor](v5, "_applyTitleLabelColor");
    [v6 setTextAlignment:1];
    [v6 setLineBreakMode:4];
    [v6 setNumberOfLines:1];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v5 selector:"_applyTitleLabelColor" name:UIAccessibilityInvertColorsStatusDidChangeNotification object:0];
  }

  return v5;
}

- (void)_applyTitleLabelColor
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuItemSimpleButtonTableViewCell textLabel](self, "textLabel"));
  [v3 setTextColor:v4];
}

@end