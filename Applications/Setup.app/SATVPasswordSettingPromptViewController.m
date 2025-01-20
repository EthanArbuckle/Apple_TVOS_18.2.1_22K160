@interface SATVPasswordSettingPromptViewController
- (ACAccount)account;
- (CGRect)chooseOptionViewFrameForLayoutDirection:(BOOL)a3 withinBounds:(CGRect)a4;
- (SATVChooseOptionView)chooseOptionView;
- (SATVPasswordSettingPromptViewController)initWithAccount:(id)a3;
- (UIImageView)glyphImageView;
- (id)completionHandler;
- (id)firstOptionButtonFooterTextForView:(id)a3;
- (id)firstOptionButtonTextForView:(id)a3;
- (id)passwordSettingFooterNote;
- (id)secondOptionButtonFooterTextForView:(id)a3;
- (id)secondOptionButtonTextForView:(id)a3;
- (id)subtitleTextForView:(id)a3;
- (id)thirdOptionButtonFooterTextForView:(id)a3;
- (id)thirdOptionButtonTextForView:(id)a3;
- (id)titleTextForView:(id)a3;
- (void)_handlePasswordSetting:(unint64_t)a3;
- (void)didFocusFirstOptionForView:(id)a3;
- (void)didFocusSecondOptionForView:(id)a3;
- (void)didFocusThirdOptionForView:(id)a3;
- (void)didSelectFirstOptionForView:(id)a3;
- (void)didSelectSecondOptionForView:(id)a3;
- (void)didSelectThirdOptionForView:(id)a3;
- (void)setChooseOptionView:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setGlyphImageView:(id)a3;
- (void)setImageViewFrameFromChooseOptionViewFrame:(CGRect)a3 withinBounds:(CGRect)a4 layoutIsRightToLeft:(BOOL)a5;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SATVPasswordSettingPromptViewController

- (SATVPasswordSettingPromptViewController)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVPasswordSettingPromptViewController;
  v6 = -[SATVPasswordSettingPromptViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVPasswordSettingPromptViewController;
  -[SATVPasswordSettingPromptViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasswordSettingPromptViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v3 setBackgroundColor:v4];

  id v5 = objc_alloc_init(&OBJC_CLASS___SATVChooseOptionView);
  -[SATVPasswordSettingPromptViewController setChooseOptionView:](self, "setChooseOptionView:", v5);
  -[SATVChooseOptionView setDataSource:](v5, "setDataSource:", self);
  -[SATVChooseOptionView setDelegate:](v5, "setDelegate:", self);
  -[SATVPasswordSettingPromptViewController tvsk_addConstrainedSubview:](self, "tvsk_addConstrainedSubview:", v5);
}

- (void)viewDidLayoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SATVPasswordSettingPromptViewController;
  -[SATVPasswordSettingPromptViewController viewDidLayoutSubviews](&v22, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasswordSettingPromptViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [v3 _shouldReverseLayoutDirection];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasswordSettingPromptViewController chooseOptionView](self, "chooseOptionView"));
  -[SATVPasswordSettingPromptViewController chooseOptionViewFrameForLayoutDirection:withinBounds:]( self,  "chooseOptionViewFrameForLayoutDirection:withinBounds:",  v12,  v5,  v7,  v9,  v11);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  objc_msgSend(v13, "setFrame:");
  -[SATVPasswordSettingPromptViewController setImageViewFrameFromChooseOptionViewFrame:withinBounds:layoutIsRightToLeft:]( self,  "setImageViewFrameFromChooseOptionViewFrame:withinBounds:layoutIsRightToLeft:",  v12,  v15,  v17,  v19,  v21,  v5,  v7,  v9,  v11);
}

- (CGRect)chooseOptionViewFrameForLayoutDirection:(BOOL)a3 withinBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v8 = a3;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasswordSettingPromptViewController chooseOptionView](self, "chooseOptionView"));
  objc_msgSend(v10, "sizeThatFits:", 835.0, 1.79769313e308);
  double v12 = v11;
  double v14 = v13;
  if (-[SATVPasswordSettingPromptViewController tvsk_layoutStyle](self, "tvsk_layoutStyle"))
  {
    v29.origin.double x = UIRectCenteredYInRect(0.0, 0.0, v12, v14, x, y, width, height);
    CGFloat v15 = v29.origin.y;
    CGFloat v16 = v29.size.width;
    CGFloat v17 = v29.size.height;
    double v18 = floor(CGRectGetWidth(v29) * 0.5);
    double v19 = 572.0 - v18;
    double v20 = width - (v18 + 572.0);
    if (v8) {
      double v21 = v20;
    }
    else {
      double v21 = v19;
    }
  }

  else
  {
    double v21 = UIRectCenteredRect(0.0, 0.0, v12, v14, x, y, width, height);
    CGFloat v15 = v22;
    CGFloat v16 = v23;
    CGFloat v17 = v24;
  }

  double v25 = v21;
  double v26 = v15;
  double v27 = v16;
  double v28 = v17;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (void)setImageViewFrameFromChooseOptionViewFrame:(CGRect)a3 withinBounds:(CGRect)a4 layoutIsRightToLeft:(BOOL)a5
{
  BOOL v5 = a5;
  double v7 = CGRectGetMaxX(a3) + 135.0;
  if (v5) {
    double v8 = 150.0;
  }
  else {
    double v8 = v7;
  }
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[SATVPasswordSettingPromptViewController glyphImageView](self, "glyphImageView"));
  objc_msgSend(v11, "sizeThatFits:", 650.0, 650.0);
  objc_msgSend(v11, "setFrame:", UIRectCenteredRect(0.0, 0.0, v9, v10, v8, 215.0, 650.0, 650.0));
}

- (id)passwordSettingFooterNote
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasswordSettingPromptViewController account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_firstName"));

  id v4 = sub_10000D7CC(@"PASSWORD_SETTING_FOOTER_NOTE", @"Localizable");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v5, v3));

  return v6;
}

- (id)titleTextForView:(id)a3
{
  return sub_10000D7CC(@"PASSWORD_SETTING_TITLE", @"Localizable");
}

- (id)subtitleTextForView:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasswordSettingPromptViewController account](self, "account", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 username]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_firstName"));
  id v6 = sub_10000D7CC(@"PASSWORD_SETTING_MESSAGE", @"Localizable");
  double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v4, v5));

  return v8;
}

- (id)firstOptionButtonTextForView:(id)a3
{
  return sub_10000D7CC(@"PASSWORD_SETTING_ALWAYS", @"Localizable");
}

- (id)secondOptionButtonTextForView:(id)a3
{
  return sub_10000D7CC(@"PASSWORD_SETTING_SOMETIMES", @"Localizable");
}

- (id)thirdOptionButtonTextForView:(id)a3
{
  return sub_10000D7CC(@"PASSWORD_SETTING_NEVER", @"Localizable");
}

- (id)firstOptionButtonFooterTextForView:(id)a3
{
  return -[SATVPasswordSettingPromptViewController passwordSettingFooterNote](self, "passwordSettingFooterNote", a3);
}

- (id)secondOptionButtonFooterTextForView:(id)a3
{
  return -[SATVPasswordSettingPromptViewController passwordSettingFooterNote](self, "passwordSettingFooterNote", a3);
}

- (id)thirdOptionButtonFooterTextForView:(id)a3
{
  return -[SATVPasswordSettingPromptViewController passwordSettingFooterNote](self, "passwordSettingFooterNote", a3);
}

- (void)didSelectFirstOptionForView:(id)a3
{
  id v4 = sub_10002AF94();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "User selected AMSAccountPasswordPromptSettingAlways",  v6,  2u);
  }

  -[SATVPasswordSettingPromptViewController _handlePasswordSetting:](self, "_handlePasswordSetting:", 1LL);
}

- (void)didSelectSecondOptionForView:(id)a3
{
  id v4 = sub_10002AF94();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "User selected AMSAccountPasswordPromptSettingSometimes",  v6,  2u);
  }

  -[SATVPasswordSettingPromptViewController _handlePasswordSetting:](self, "_handlePasswordSetting:", 2LL);
}

- (void)didSelectThirdOptionForView:(id)a3
{
  id v4 = sub_10002AF94();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "User selected AMSAccountPasswordPromptSettingNever",  v6,  2u);
  }

  -[SATVPasswordSettingPromptViewController _handlePasswordSetting:](self, "_handlePasswordSetting:", 3LL);
}

- (void)didFocusFirstOptionForView:(id)a3
{
  id v4 = sub_10002AF94();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "User focused AMSAccountPasswordPromptSettingAlways",  v6,  2u);
  }

  -[SATVPasswordSettingPromptViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  17LL,  16LL);
}

- (void)didFocusSecondOptionForView:(id)a3
{
  id v4 = sub_10002AF94();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "User focused AMSAccountPasswordPromptSettingSometimes",  v6,  2u);
  }

  -[SATVPasswordSettingPromptViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  18LL,  16LL);
}

- (void)didFocusThirdOptionForView:(id)a3
{
  id v4 = sub_10002AF94();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "User focused AMSAccountPasswordPromptSettingNever",  v6,  2u);
  }

  -[SATVPasswordSettingPromptViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  19LL,  16LL);
}

- (void)_handlePasswordSetting:(unint64_t)a3
{
  id v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SATVPasswordSettingPromptViewController completionHandler](self, "completionHandler"));
  if (v4)
  {
    BOOL v5 = v4;
    v4[2]();
    id v4 = v5;
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (ACAccount)account
{
  return self->_account;
}

- (SATVChooseOptionView)chooseOptionView
{
  return self->_chooseOptionView;
}

- (void)setChooseOptionView:(id)a3
{
}

- (UIImageView)glyphImageView
{
  return self->_glyphImageView;
}

- (void)setGlyphImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end