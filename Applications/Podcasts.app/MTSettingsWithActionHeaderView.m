@interface MTSettingsWithActionHeaderView
- (CGRect)_contentViewLayoutRect;
- (MTSettingHeaderAction)action;
- (MTSettingsWithActionHeaderView)initWithReuseIdentifier:(id)a3;
- (UIButton)actionButton;
- (id)_actionButtonDisplayTitleForActionTitle:(id)a3;
- (void)_reloadActionButtonContent;
- (void)_updateButtonFontAndTextAlignment;
- (void)actionButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAction:(id)a3;
@end

@implementation MTSettingsWithActionHeaderView

- (MTSettingsWithActionHeaderView)initWithReuseIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTSettingsWithActionHeaderView;
  v3 = -[MTSettingsWithActionHeaderView initWithReuseIdentifier:](&v8, "initWithReuseIdentifier:", a3);
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
    actionButton = v3->_actionButton;
    v3->_actionButton = (UIButton *)v4;

    -[UIButton addTarget:action:forControlEvents:]( v3->_actionButton,  "addTarget:action:forControlEvents:",  v3,  "actionButtonTapped:",  64LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView contentView](v3, "contentView"));
    [v6 addSubview:v3->_actionButton];
  }

  return v3;
}

- (void)setAction:(id)a3
{
  v5 = (MTSettingHeaderAction *)a3;
  if (self->_action != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_action, a3);
    -[MTSettingsWithActionHeaderView _reloadActionButtonContent](self, "_reloadActionButtonContent");
    v5 = v6;
  }
}

- (void)actionButtonTapped:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView action](self, "action", a3));
  [v3 performAction];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTSettingsWithActionHeaderView;
  -[MTSettingsWithActionHeaderView prepareForReuse](&v3, "prepareForReuse");
  -[MTSettingsWithActionHeaderView setAction:](self, "setAction:", 0LL);
}

- (void)layoutSubviews
{
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;
  double v7 = CGRectGetWidth(v27);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView actionButton](self, "actionButton"));
  [v8 frame];
  -[MTSettingsWithActionHeaderView setMaxTitleWidth:](self, "setMaxTitleWidth:", v7 - CGRectGetWidth(v28) + -12.0);

  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___MTSettingsWithActionHeaderView;
  -[MTSettingsWithActionHeaderView layoutSubviews](&v26, "layoutSubviews");
  LODWORD(v8) = -[MTSettingsWithActionHeaderView mt_isRTL](self, "mt_isRTL");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView actionButton](self, "actionButton"));
  [v9 frame];
  double v14 = sub_1000418B0((int)v8, 3LL, 3LL, v10, v11, v12, v13, x, y, width, height);
  double v16 = v15;
  double v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView textLabel](self, "textLabel"));
  objc_msgSend(v19, "mt_baselineOriginY");
  double v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView actionButton](self, "actionButton"));
  objc_msgSend(v22, "mt_firstBaselineOffsetFromTop");
  double v24 = v21 - v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView actionButton](self, "actionButton"));
  objc_msgSend(v25, "setFrame:", v14, v24, v16, v18);
}

- (void)_reloadActionButtonContent
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView actionButton](self, "actionButton"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView action](self, "action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTSettingsWithActionHeaderView _actionButtonDisplayTitleForActionTitle:]( self,  "_actionButtonDisplayTitleForActionTitle:",  v5));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100048930;
  v9[3] = &unk_100240240;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", v9);
  -[MTSettingsWithActionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateButtonFontAndTextAlignment
{
  else {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView actionButton](self, "actionButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 titleLabel]);
  [v5 setTextAlignment:v3];

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView actionButton](self, "actionButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView textLabel](self, "textLabel"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 font]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v12 titleLabel]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 font]);
    unsigned __int8 v10 = [v7 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v12 titleLabel]);
      [v11 setFont:v7];

      [v12 sizeToFit];
    }
  }
}

- (CGRect)_contentViewLayoutRect
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsWithActionHeaderView contentView](self, "contentView"));
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v2 layoutMargins];
  double v12 = v11;
  id v13 = [v2 layoutMargins];
  double v15 = UIRectInset(v13, v4, v6, v8, v10, 0.0, v12, 0.0, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (id)_actionButtonDisplayTitleForActionTitle:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v3 uppercaseStringWithLocale:v4]);

  return v5;
}

- (MTSettingHeaderAction)action
{
  return self->_action;
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void).cxx_destruct
{
}

@end