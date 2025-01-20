@interface PBUnbiasedAlertSelectButtonController
- (CGSize)preferredContentSize;
- (UIButton)selectButton;
- (id)preferredFocusEnvironments;
- (void)viewDidLoad;
@end

@implementation PBUnbiasedAlertSelectButtonController

- (void)viewDidLoad
{
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton tvsui_consentSelectButton](&OBJC_CLASS___UIButton, "tvsui_consentSelectButton"));
  selectButton = self->_selectButton;
  self->_selectButton = v3;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:]( self->_selectButton,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUnbiasedAlertSelectButtonController view](self, "view"));
  [v5 addSubview:self->_selectButton];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBUnbiasedAlertSelectButtonController view](self, "view"));
  [v6 setClipsToBounds:0];

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_selectButton, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PBUnbiasedAlertSelectButtonController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v25 leadingAnchor]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v23 constant:32.0]);
  v26[0] = v22;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_selectButton, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PBUnbiasedAlertSelectButtonController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v21 trailingAnchor]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v19 constant:-32.0]);
  v26[1] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_selectButton, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBUnbiasedAlertSelectButtonController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 topAnchor]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v8 constant:25.0]);
  v26[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_selectButton, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBUnbiasedAlertSelectButtonController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bottomAnchor]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 constraintEqualToAnchor:v12 constant:-5.0]);
  v26[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_selectButton, "heightAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToConstant:50.0]);
  v26[4] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 5LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v16);
}

- (CGSize)preferredContentSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBUnbiasedAlertSelectButtonController selectButton](self, "selectButton"));
  [v2 sizeToFit];
  [v2 bounds];
  double v4 = v3 + 30.0;
  double v6 = v5 + 64.0;

  double v7 = v6;
  double v8 = v4;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBUnbiasedAlertSelectButtonController selectButton](self, "selectButton"));
  if ([v2 isEnabled])
  {
    double v5 = v2;
    double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));
  }

  else
  {
    double v3 = &__NSArray0__struct;
  }

  return v3;
}

- (UIButton)selectButton
{
  return self->_selectButton;
}

- (void).cxx_destruct
{
}

@end