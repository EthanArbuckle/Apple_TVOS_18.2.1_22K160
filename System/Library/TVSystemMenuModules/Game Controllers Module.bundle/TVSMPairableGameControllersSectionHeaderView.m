@interface TVSMPairableGameControllersSectionHeaderView
- (BOOL)showingActivityIndicator;
- (NSString)title;
- (TVSMPairableGameControllersSectionHeaderView)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)activityIndicatorView;
- (UILabel)titleLabel;
- (void)setShowingActivityIndicator:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVSMPairableGameControllersSectionHeaderView

- (TVSMPairableGameControllersSectionHeaderView)initWithFrame:(CGRect)a3
{
  CGRect v36 = a3;
  SEL v34 = a2;
  v35 = 0LL;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___TVSMPairableGameControllersSectionHeaderView;
  v35 = -[TVSMPairableGameControllersSectionHeaderView initWithFrame:]( &v33,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v35, v35);
  if (v35)
  {
    v32 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
    v3 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v35->_titleLabel;
    v35->_titleLabel = v3;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v35->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v9 = v35->_titleLabel;
    id v10 =  +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleCaption1,  1024LL);
    -[UILabel setFont:](v9, "setFont:");

    -[UILabel setNumberOfLines:](v35->_titleLabel, "setNumberOfLines:", 1LL);
    -[UILabel setTextColor:](v35->_titleLabel, "setTextColor:", v32);
    v11 = v35->_titleLabel;
    v12 = +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor");
    -[UILabel setBackgroundColor:](v11, "setBackgroundColor:");

    -[UILabel setHidden:](v35->_titleLabel, "setHidden:", 1LL);
    -[TVSMPairableGameControllersSectionHeaderView addSubview:](v35, "addSubview:", v35->_titleLabel);
    v5 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  9LL);
    activityIndicatorView = v35->_activityIndicatorView;
    v35->_activityIndicatorView = v5;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:]( v35->_activityIndicatorView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIActivityIndicatorView setColor:](v35->_activityIndicatorView, "setColor:", v32);
    -[UIActivityIndicatorView setHidden:](v35->_activityIndicatorView, "setHidden:", 1LL);
    -[TVSMPairableGameControllersSectionHeaderView addSubview:](v35, "addSubview:", v35->_activityIndicatorView);
    id v30 = -[UILabel leadingAnchor](v35->_titleLabel, "leadingAnchor");
    id v29 = -[TVSMPairableGameControllersSectionHeaderView leadingAnchor](v35, "leadingAnchor");
    id v28 = objc_msgSend(v30, "constraintEqualToAnchor:constant:");
    v37[0] = v28;
    id v27 = -[UILabel centerYAnchor](v35->_titleLabel, "centerYAnchor");
    id v26 = -[TVSMPairableGameControllersSectionHeaderView centerYAnchor](v35, "centerYAnchor");
    id v25 = objc_msgSend(v27, "constraintEqualToAnchor:");
    v37[1] = v25;
    id v24 = -[UILabel heightAnchor](v35->_titleLabel, "heightAnchor");
    id v23 = [v24 constraintEqualToConstant:28.0];
    v37[2] = v23;
    id v22 = -[UIActivityIndicatorView leadingAnchor](v35->_activityIndicatorView, "leadingAnchor");
    id v21 = -[UILabel trailingAnchor](v35->_titleLabel, "trailingAnchor");
    id v20 = objc_msgSend(v22, "constraintEqualToAnchor:constant:", 18.0);
    v37[3] = v20;
    id v19 = -[UIActivityIndicatorView centerYAnchor](v35->_activityIndicatorView, "centerYAnchor");
    id v18 = -[TVSMPairableGameControllersSectionHeaderView centerYAnchor](v35, "centerYAnchor");
    id v17 = objc_msgSend(v19, "constraintEqualToAnchor:");
    v37[4] = v17;
    id v16 = -[UIActivityIndicatorView heightAnchor](v35->_activityIndicatorView, "heightAnchor");
    id v15 = [v16 constraintEqualToConstant:20.0];
    v37[5] = v15;
    id v14 = -[UIActivityIndicatorView widthAnchor](v35->_activityIndicatorView, "widthAnchor");
    id v13 = [v14 constraintEqualToConstant:20.0];
    v37[6] = v13;
    v31 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 7LL);

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v31);
    objc_storeStrong((id *)&v31, 0LL);
    objc_storeStrong((id *)&v32, 0LL);
  }

  v8 = v35;
  objc_storeStrong((id *)&v35, 0LL);
  return v8;
}

- (void)setTitle:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = -[TVSMPairableGameControllersSectionHeaderView title](v7, "title");
  unsigned __int8 v4 = -[NSString isEqual:](v3, "isEqual:", location[0]);

  if ((v4 & 1) == 0)
  {
    v5 = -[TVSMPairableGameControllersSectionHeaderView titleLabel](v7, "titleLabel");
    -[UILabel setText:](v5, "setText:", location[0]);
    -[UILabel setHidden:](v5, "setHidden:", location[0] == 0LL);
    objc_storeStrong((id *)&v5, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (NSString)title
{
  v3 = -[TVSMPairableGameControllersSectionHeaderView titleLabel](self, "titleLabel");
  unsigned __int8 v4 = -[UILabel text](v3, "text");

  return v4;
}

- (void)setShowingActivityIndicator:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  if (self->_showingActivityIndicator != a3)
  {
    v6->_showingActivityIndicator = v4;
    id location = -[TVSMPairableGameControllersSectionHeaderView activityIndicatorView](v6, "activityIndicatorView");
    [location setHidden:!v6->_showingActivityIndicator];
    if (v6->_showingActivityIndicator) {
      [location startAnimating];
    }
    else {
      [location stopAnimating];
    }
    objc_storeStrong(&location, 0LL);
  }

- (BOOL)showingActivityIndicator
{
  return self->_showingActivityIndicator;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
}

@end