@interface TVPSignInLandingView
- (NSString)actionPromptMessage;
- (NSString)message;
- (NSString)title;
- (TVPSignInLandingView)initWithFrame:(CGRect)a3;
- (TVPSignInLandingViewDelegate)delegate;
- (UIButton)signInButton;
- (UIImage)sampleImage;
- (UIImageView)imageView;
- (UILabel)messageLabel;
- (UILabel)signInLabel;
- (UIView)containerView;
- (double)alphaOnImage;
- (id)preferredFocusEnvironments;
- (void)_onSelectSignIn:(id)a3;
- (void)configureUIControls;
- (void)layoutSubviews;
- (void)setActionPromptMessage:(id)a3;
- (void)setAlphaOnImage:(double)a3;
- (void)setContainerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageView:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setSampleImage:(id)a3;
- (void)setSignInButton:(id)a3;
- (void)setSignInLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVPSignInLandingView

- (TVPSignInLandingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPSignInLandingView;
  v3 = -[TVPSignInLandingView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, 1920.0, 1080.0);
  v4 = v3;
  if (v3)
  {
    v3->_alphaOnImage = 1.0;
    -[TVPSignInLandingView configureUIControls](v3, "configureUIControls");
  }

  return v4;
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  -[UILabel setText:](self->_signInLabel, "setText:", v5);
}

- (void)setMessage:(id)a3
{
  id v5 = a3;
  -[UILabel setText:](self->_messageLabel, "setText:", v5);
}

- (void)setSampleImage:(id)a3
{
  id v5 = a3;
  -[UIImageView setImage:](self->_imageView, "setImage:", v5);
}

- (void)setAlphaOnImage:(double)a3
{
  if (self->_alphaOnImage != a3)
  {
    self->_alphaOnImage = a3;
    -[UIImageView setAlpha:](self->_imageView, "setAlpha:");
  }

- (void)setActionPromptMessage:(id)a3
{
  id v5 = (NSString *)a3;
  p_actionPromptMessage = &self->_actionPromptMessage;
  if (self->_actionPromptMessage != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_actionPromptMessage, a3);
    -[UIButton setTitle:forState:](self->_signInButton, "setTitle:forState:", *p_actionPromptMessage, 0LL);
    -[UIButton setTitle:forState:](self->_signInButton, "setTitle:forState:", *p_actionPromptMessage, 8LL);
    id v5 = v7;
  }
}

- (id)preferredFocusEnvironments
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self->_containerView, "subviews", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v14;
    v7 = &__NSArray0__struct;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v2);
      }
      v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___UIButton, v4);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
        break;
      }
      if (v5 == (id)++v8)
      {
        id v5 = [v2 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }

    id v11 = v9;

    if (v11)
    {
      id v17 = v11;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
      v2 = v11;
      goto LABEL_13;
    }

    v7 = &__NSArray0__struct;
  }

  else
  {
    v7 = &__NSArray0__struct;
LABEL_13:
  }

  return v7;
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___TVPSignInLandingView;
  -[TVPSignInLandingView layoutSubviews](&v35, "layoutSubviews");
  if (!self->_sampleImage) {
    sub_100079A70();
  }
  if (!self->_message) {
    sub_100079A98();
  }
  -[TVPSignInLandingView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  if (self->_title)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_signInLabel, "text"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title2Font](&OBJC_CLASS___TVPThemeManager, "title2Font"));
    +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v7,  v8,  v4);
    double v10 = v9;

    float v11 = (983.0 - v10) * 0.5;
    -[UILabel setFrame:](self->_signInLabel, "setFrame:", floorf(v11), 0.0, v10, 66.0);
    double v12 = 113.0;
  }

  else
  {
    double v12 = 0.0;
  }

  if (self->_sampleImage)
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageView, "image"));
    [v13 size];
    double v15 = v14;
    double v17 = v16;

    float v18 = (983.0 - v15) * 0.5;
    -[UIImageView setFrame:](self->_imageView, "setFrame:", floorf(v18), v12, v15, v17);
    double v12 = v12 + v17 + 60.0;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleForState:](self->_signInButton, "titleForState:", 0LL));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager headlineFont](&OBJC_CLASS___TVPThemeManager, "headlineFont"));
  +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v19,  v20,  v4);
  double v22 = v21;

  if (v22 >= 450.0) {
    double v23 = v22 + 80.0;
  }
  else {
    double v23 = 530.0;
  }
  float v24 = (983.0 - v23) * 0.5;
  -[UIButton setFrame:](self->_signInButton, "setFrame:", floorf(v24), v12, v23, 74.0);
  double v25 = v12 + 154.0;
  if (self->_message)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_messageLabel, "text"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption2Font](&OBJC_CLASS___TVPThemeManager, "caption2Font"));
    +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v26,  v27,  980.0);
    double v29 = v28;
    double v31 = v30;

    float v32 = (983.0 - v29) * 0.5;
    -[UILabel setFrame:](self->_messageLabel, "setFrame:", floorf(v32), v25, v29, v31);
    double v25 = v25 + v31;
  }

  float v33 = (v4 + -983.0) * 0.5;
  float v34 = (v6 - v25) * 0.5;
  -[UIView setFrame:](self->_containerView, "setFrame:", floorf(v33), floorf(v34), 983.0, v25);
}

- (void)_onSelectSignIn:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 authenticateUserOnSelectSignIn];
  }

- (void)traitCollectionDidChange:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVPSignInLandingView;
  id v4 = a3;
  -[TVPSignInLandingView traitCollectionDidChange:](&v17, "traitCollectionDidChange:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSignInLandingView traitCollection](self, "traitCollection", v17.receiver, v17.super_class));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSignInLandingView traitCollection](self, "traitCollection"));
    id v9 = [v8 userInterfaceStyle];

    signInLabel = self->_signInLabel;
    if (v9 == (id)2)
    {
      double v11 = 0.8;
      double v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.8));
      -[UILabel setTextColor:](signInLabel, "setTextColor:", v12);

      messageLabel = self->_messageLabel;
      double v14 = 1.0;
    }

    else
    {
      double v11 = 0.6;
      double v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.6));
      -[UILabel setTextColor:](signInLabel, "setTextColor:", v15);

      messageLabel = self->_messageLabel;
      double v14 = 0.0;
    }

    double v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", v14, v11));
    -[UILabel setTextColor:](messageLabel, "setTextColor:", v16);
  }

- (void)configureUIControls
{
  double v3 = objc_alloc_init(&OBJC_CLASS___UIView);
  containerView = self->_containerView;
  self->_containerView = v3;

  -[UIView setClipsToBounds:](self->_containerView, "setClipsToBounds:", 0LL);
  -[TVPSignInLandingView addSubview:](self, "addSubview:", self->_containerView);
  id v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
  signInLabel = self->_signInLabel;
  self->_signInLabel = v5;

  id v7 = self->_signInLabel;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title2Font](&OBJC_CLASS___TVPThemeManager, "title2Font"));
  -[UILabel setFont:](v7, "setFont:", v8);

  id v9 = self->_signInLabel;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

  -[UILabel setTextAlignment:](self->_signInLabel, "setTextAlignment:", 1LL);
  -[UILabel setLineBreakMode:](self->_signInLabel, "setLineBreakMode:", 4LL);
  -[UILabel setNumberOfLines:](self->_signInLabel, "setNumberOfLines:", 0LL);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_signInLabel);
  double v11 = objc_alloc_init(&OBJC_CLASS___UILabel);
  messageLabel = self->_messageLabel;
  self->_messageLabel = v11;

  __int128 v13 = self->_messageLabel;
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption2Font](&OBJC_CLASS___TVPThemeManager, "caption2Font"));
  -[UILabel setFont:](v13, "setFont:", v14);

  double v15 = self->_messageLabel;
  double v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v15, "setBackgroundColor:", v16);

  -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 1LL);
  -[UILabel setLineBreakMode:](self->_messageLabel, "setLineBreakMode:", 2LL);
  -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 0LL);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_messageLabel);
  objc_super v17 = objc_alloc_init(&OBJC_CLASS___UIImageView);
  imageView = self->_imageView;
  self->_imageView = v17;

  -[UIImageView setAlpha:](self->_imageView, "setAlpha:", self->_alphaOnImage);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_imageView);
  v19 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
  signInButton = self->_signInButton;
  self->_signInButton = v19;

  double v21 = self->_signInButton;
  double v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"TViCloudSignInButton" value:&stru_1000CC6C8 table:0]);
  -[UIButton setTitle:forState:](v21, "setTitle:forState:", v23, 0LL);

  float v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_signInButton, "titleLabel"));
  double v25 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager headlineFont](&OBJC_CLASS___TVPThemeManager, "headlineFont"));
  [v24 setFont:v25];

  -[UIButton _setBlurEnabled:](self->_signInButton, "_setBlurEnabled:", 0LL);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_signInButton, "layer"));
  [v26 setCornerRadius:6.0];

  -[UIButton addTarget:action:forControlEvents:]( self->_signInButton,  "addTarget:action:forControlEvents:",  self,  "_onSelectSignIn:",  0x2000LL);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_signInButton);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)actionPromptMessage
{
  return self->_actionPromptMessage;
}

- (UIImage)sampleImage
{
  return self->_sampleImage;
}

- (double)alphaOnImage
{
  return self->_alphaOnImage;
}

- (TVPSignInLandingViewDelegate)delegate
{
  return (TVPSignInLandingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)signInLabel
{
  return self->_signInLabel;
}

- (void)setSignInLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIButton)signInButton
{
  return self->_signInButton;
}

- (void)setSignInButton:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end