@interface TVHNoMediaLibrariesDiscoveredView
- (TVHNoMediaLibrariesDiscoveredView)init;
- (TVHNoMediaLibrariesDiscoveredView)initWithAccountName:(id)a3;
- (TVHNoMediaLibrariesDiscoveredView)initWithCoder:(id)a3;
- (TVHNoMediaLibrariesDiscoveredView)initWithFrame:(CGRect)a3;
- (TVHNoMediaLibrariesDiscoveredViewDelegate)delegate;
- (UIButton)retryButton;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (void)_didSelectRetryButton;
- (void)setDelegate:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setRetryButton:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation TVHNoMediaLibrariesDiscoveredView

- (TVHNoMediaLibrariesDiscoveredView)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHNoMediaLibrariesDiscoveredView)initWithFrame:(CGRect)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHNoMediaLibrariesDiscoveredView)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHNoMediaLibrariesDiscoveredView)initWithAccountName:(id)a3
{
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)&OBJC_CLASS___TVHNoMediaLibrariesDiscoveredView;
  v5 = -[TVHNoMediaLibrariesDiscoveredView initWithFrame:]( &v60,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v7 = v6;
    id v59 = v4;
    if (v4)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"NO_HOME_SHARES_FOUND_ERROR_TITLE" value:0 table:0]);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"NO_HOME_SHARES_FOUND_ERROR_MESSAGE_FORMAT" value:0 table:0]);

      uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v4));
    }

    else
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"NO_DAAP_SERVERS_FOUND_ERROR_TITLE" value:0 table:0]);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v11 = objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"NO_DAAP_SERVERS_FOUND_ERROR_MESSAGE" value:0 table:0]);
    }

    uint64_t v12 = v11;
    v43 = (void *)v11;
    v58 = (void *)v8;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v13,  v14));

    v16 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v16;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v5->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v18 = v5->_titleLabel;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 6LL));
    -[UILabel setFont:](v18, "setFont:", v19);

    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 0LL);
    -[UILabel setTextAlignment:](v5->_titleLabel, "setTextAlignment:", 1LL);
    -[UILabel setText:](v5->_titleLabel, "setText:", v8);
    v57 = (void *)v15;
    -[UILabel setTextColor:](v5->_titleLabel, "setTextColor:", v15);
    -[TVHNoMediaLibrariesDiscoveredView addSubview:](v5, "addSubview:", v5->_titleLabel);
    v20 = objc_alloc_init(&OBJC_CLASS___UILabel);
    messageLabel = v5->_messageLabel;
    v5->_messageLabel = v20;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v5->_messageLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v22 = v5->_messageLabel;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 13LL));
    -[UILabel setFont:](v22, "setFont:", v23);

    -[UILabel setNumberOfLines:](v5->_messageLabel, "setNumberOfLines:", 0LL);
    -[UILabel setTextAlignment:](v5->_messageLabel, "setTextAlignment:", 1LL);
    -[UILabel setText:](v5->_messageLabel, "setText:", v12);
    -[UILabel setTextColor:](v5->_messageLabel, "setTextColor:", v15);
    -[TVHNoMediaLibrariesDiscoveredView addSubview:](v5, "addSubview:", v5->_messageLabel);
    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
    retryButton = v5->_retryButton;
    v5->_retryButton = (UIButton *)v24;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:]( v5->_retryButton,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIButton addTarget:action:forControlEvents:]( v5->_retryButton,  "addTarget:action:forControlEvents:",  v5,  "_didSelectRetryButton",  0x2000LL);
    v26 = v5->_retryButton;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[UIButton setTitleColor:forState:](v26, "setTitleColor:forState:", v27, 0LL);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v56 = (void *)objc_claimAutoreleasedReturnValue([v28 localizedStringForKey:@"RETRY_TITLE" value:0 table:0]);

    -[UIButton setTitle:forState:](v5->_retryButton, "setTitle:forState:", v56, 0LL);
    -[TVHNoMediaLibrariesDiscoveredView addSubview:](v5, "addSubview:", v5->_retryButton);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v5->_titleLabel, "centerXAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNoMediaLibrariesDiscoveredView centerXAnchor](v5, "centerXAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToAnchor:v54]);
    v61[0] = v53;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5->_titleLabel, "topAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNoMediaLibrariesDiscoveredView topAnchor](v5, "topAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v52 constraintEqualToAnchor:v51 constant:360.0]);
    v61[1] = v50;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v5->_messageLabel, "centerXAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNoMediaLibrariesDiscoveredView centerXAnchor](v5, "centerXAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue([v49 constraintEqualToAnchor:v48]);
    v61[2] = v47;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5->_messageLabel, "topAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v5->_titleLabel, "bottomAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v46 constraintEqualToAnchor:v45 constant:22.0]);
    v61[3] = v44;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v5->_messageLabel, "widthAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToConstant:950.0]);
    v61[4] = v41;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerXAnchor](v5->_retryButton, "centerXAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNoMediaLibrariesDiscoveredView centerXAnchor](v5, "centerXAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v40 constraintEqualToAnchor:v39]);
    v61[5] = v38;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](v5->_retryButton, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v5->_messageLabel, "bottomAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintEqualToAnchor:v30 constant:50.0]);
    v61[6] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](v5->_retryButton, "heightAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToConstant:66.0]);
    v61[7] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](v5->_retryButton, "widthAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToConstant:340.0]);
    v61[8] = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v61, 9LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v36);

    id v4 = v59;
  }

  return v5;
}

- (void)_didSelectRetryButton
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHNoMediaLibrariesDiscoveredView delegate](self, "delegate"));
  [v3 noMediaLibrariesFoundViewDidSelectRetry:self];
}

- (TVHNoMediaLibrariesDiscoveredViewDelegate)delegate
{
  return (TVHNoMediaLibrariesDiscoveredViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (UIButton)retryButton
{
  return self->_retryButton;
}

- (void)setRetryButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end