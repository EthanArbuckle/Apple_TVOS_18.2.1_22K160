@interface PBCriticalRemoteBatteryWarningAlertHeaderViewController
- (int64_t)remoteType;
- (void)loadView;
- (void)setRemoteType:(int64_t)a3;
@end

@implementation PBCriticalRemoteBatteryWarningAlertHeaderViewController

- (void)loadView
{
  v3 = objc_alloc_init(&OBJC_CLASS___UIView);
  v24 = self;
  int64_t v4 = -[PBCriticalRemoteBatteryWarningAlertHeaderViewController remoteType](self, "remoteType");
  else {
    v5 = *(&off_1003D6678 + v4 - 1);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v5));
  v6 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v23);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  -[UIView addSubview:](v3, "addSubview:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v6, "centerXAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v3, "centerXAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v21]);
  v25[0] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v6, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v3, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintGreaterThanOrEqualToAnchor:v18]);
  v25[1] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v6, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v3, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintLessThanOrEqualToAnchor:v15]);
  v25[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v6, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v3, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v9 constant:48.0]);
  v25[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v6, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v3, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12]);
  v25[4] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 5LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v14);

  -[PBCriticalRemoteBatteryWarningAlertHeaderViewController setView:](v24, "setView:", v3);
}

- (int64_t)remoteType
{
  return self->_remoteType;
}

- (void)setRemoteType:(int64_t)a3
{
  self->_remoteType = a3;
}

@end