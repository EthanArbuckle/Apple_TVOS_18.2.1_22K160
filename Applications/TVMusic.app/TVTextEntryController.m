@interface TVTextEntryController
- (BOOL)_disableAutomaticKeyboardUI;
- (BOOL)_enableAutomaticKeyboardPressDone;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)textFieldAllowsFocus;
- (TVTextEntryController)init;
- (TVTextEntryController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVTextEntryControllerDelegate)delegate;
- (UILabel)textFieldHeaderLabel;
- (UISystemInputViewController)systemInputViewController;
- (UITextField)textField;
- (UIView)bottomAccessoryView;
- (UIView)topAccessoryView;
- (id)preferredFocusEnvironments;
- (void)_doneButtonPressed:(id)a3;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)loadView;
- (void)setBottomAccessoryView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTextFieldAllowsFocus:(BOOL)a3;
- (void)setTopAccessoryView:(id)a3;
- (void)systemInputViewController:(id)a3 didChangeAccessoryVisibility:(BOOL)a4;
- (void)systemInputViewControllerDidAcceptRecentInput:(id)a3;
- (void)textFieldDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TVTextEntryController

- (TVTextEntryController)initWithNibName:(id)a3 bundle:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVTextEntryController;
  v4 = -[TVTextEntryController initWithNibName:bundle:](&v19, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc(&OBJC_CLASS____TVTextEntryTextField);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v9 = -[_TVTextEntryTextField initWithFrame:](v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    textField = v4->_textField;
    v4->_textField = v9;

    -[_TVTextEntryTextField _setBlurEnabled:](v4->_textField, "_setBlurEnabled:", 0LL);
    v11 = v4->_textField;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle3));
    -[_TVTextEntryTextField setFont:](v11, "setFont:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v13 addObserver:v4 selector:"textFieldDidChange:" name:UITextFieldTextDidChangeNotification object:v4->_textField];

    v14 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    textFieldHeaderLabel = v4->_textFieldHeaderLabel;
    v4->_textFieldHeaderLabel = v14;

    -[UILabel setOpaque:](v4->_textFieldHeaderLabel, "setOpaque:", 0LL);
    -[UILabel setBackgroundColor:](v4->_textFieldHeaderLabel, "setBackgroundColor:", 0LL);
    -[UILabel setNumberOfLines:](v4->_textFieldHeaderLabel, "setNumberOfLines:", 1LL);
    v16 = v4->_textFieldHeaderLabel;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager bodyFont](&OBJC_CLASS___TVThemeManager, "bodyFont"));
    -[UILabel setFont:](v16, "setFont:", v17);
  }

  return v4;
}

- (TVTextEntryController)init
{
  return -[TVTextEntryController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0LL, 0LL);
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVTextEntryController;
  -[TVTextEntryController dealloc](&v4, "dealloc");
}

- (void)setTopAccessoryView:(id)a3
{
  id v11 = a3;
  p_topAccessoryView = &self->_topAccessoryView;
  -[UIView removeFromSuperview](self->_topAccessoryView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_topAccessoryView, a3);
  if (-[TVTextEntryController isViewLoaded](self, "isViewLoaded") && *p_topAccessoryView)
  {
    systemInputViewController = self->_systemInputViewController;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVTextEntryController view](self, "view"));
    v8 = v7;
    v9 = *p_topAccessoryView;
    if (systemInputViewController)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UISystemInputViewController view](self->_systemInputViewController, "view"));
      [v8 insertSubview:v9 below:v10];
    }

    else
    {
      [v7 addSubview:v9];
    }
  }
}

- (void)setBottomAccessoryView:(id)a3
{
  id v11 = a3;
  p_bottomAccessoryView = &self->_bottomAccessoryView;
  -[UIView removeFromSuperview](self->_bottomAccessoryView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_bottomAccessoryView, a3);
  if (-[TVTextEntryController isViewLoaded](self, "isViewLoaded") && *p_bottomAccessoryView)
  {
    systemInputViewController = self->_systemInputViewController;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVTextEntryController view](self, "view"));
    v8 = v7;
    v9 = *p_bottomAccessoryView;
    if (systemInputViewController)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UISystemInputViewController view](self->_systemInputViewController, "view"));
      [v8 insertSubview:v9 below:v10];
    }

    else
    {
      [v7 addSubview:v9];
    }
  }
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVTextEntryController;
  -[TVTextEntryController loadView](&v4, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVTextEntryController view](self, "view"));
  [v3 addSubview:self->_textField];
  [v3 addSubview:self->_textFieldHeaderLabel];
  if (self->_topAccessoryView) {
    objc_msgSend(v3, "addSubview:");
  }
  if (self->_bottomAccessoryView) {
    objc_msgSend(v3, "addSubview:");
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVTextEntryController;
  -[TVTextEntryController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVTextEntryController view](self, "view"));
  objc_super v4 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_doneButtonPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v4, "setAllowedPressTypes:", &off_100282270);
  [v3 addGestureRecognizer:v4];
}

- (void)didMoveToParentViewController:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVTextEntryController;
  -[TVTextEntryController didMoveToParentViewController:](&v12, "didMoveToParentViewController:");
  systemInputViewController = self->_systemInputViewController;
  if (a3)
  {
    if (!systemInputViewController)
    {
      v6 = (UISystemInputViewController *)objc_claimAutoreleasedReturnValue( +[UISystemInputViewController systemInputViewControllerForResponder:editorView:containingResponder:]( &OBJC_CLASS___UISystemInputViewController,  "systemInputViewControllerForResponder:editorView:containingResponder:",  self->_textField,  0LL,  self));
      v7 = self->_systemInputViewController;
      self->_systemInputViewController = v6;

      -[UISystemInputViewController setSupportsRecentInputsIntegration:]( self->_systemInputViewController,  "setSupportsRecentInputsIntegration:",  1LL);
      -[UISystemInputViewController setSystemInputViewControllerDelegate:]( self->_systemInputViewController,  "setSystemInputViewControllerDelegate:",  self);
      -[TVTextEntryController addChildViewController:]( self,  "addChildViewController:",  self->_systemInputViewController);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVTextEntryController view](self, "view"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UISystemInputViewController view](self->_systemInputViewController, "view"));
      [v8 addSubview:v9];

      -[UISystemInputViewController didMoveToParentViewController:]( self->_systemInputViewController,  "didMoveToParentViewController:",  self);
      self->_isTouchEnabled = -[UISystemInputViewController supportsTouchInput]( self->_systemInputViewController,  "supportsTouchInput");
    }
  }

  else if (systemInputViewController)
  {
    -[UISystemInputViewController setSystemInputViewControllerDelegate:]( systemInputViewController,  "setSystemInputViewControllerDelegate:",  0LL);
    -[UISystemInputViewController willMoveToParentViewController:]( self->_systemInputViewController,  "willMoveToParentViewController:",  0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UISystemInputViewController view](self->_systemInputViewController, "view"));
    [v10 removeFromSuperview];

    -[UISystemInputViewController removeFromParentViewController]( self->_systemInputViewController,  "removeFromParentViewController");
    id v11 = self->_systemInputViewController;
    self->_systemInputViewController = 0LL;
  }

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVTextEntryController;
  -[TVTextEntryController viewWillLayoutSubviews](&v3, "viewWillLayoutSubviews");
  -[UISystemInputViewController reloadInputViewsForPersistentDelegate]( self->_systemInputViewController,  "reloadInputViewsForPersistentDelegate");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVTextEntryController;
  -[TVTextEntryController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[_TVTextEntryTextField setUserInteractionEnabled:](self->_textField, "setUserInteractionEnabled:", 1LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVTextEntryController;
  -[TVTextEntryController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[_TVTextEntryTextField setUserInteractionEnabled:](self->_textField, "setUserInteractionEnabled:", 0LL);
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 nextFocusedView]);
  LOBYTE(self) = [v4 isDescendantOfView:self->_textField] ^ 1;

  return (char)self;
}

- (id)preferredFocusEnvironments
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  objc_super v4 = v3;
  if (self->_preferredFocusedView) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_systemInputViewController) {
    objc_msgSend(v4, "addObject:");
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVTextEntryController;
  id v5 = -[TVTextEntryController preferredFocusEnvironments](&v8, "preferredFocusEnvironments");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 addObjectsFromArray:v6];

  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVTextEntryController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 nextFocusedView]);

  if ([v6 isDescendantOfView:v9])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UISystemInputViewController view](self->_systemInputViewController, "view"));
    unsigned __int8 v8 = [v6 isDescendantOfView:v7];

    if ((v8 & 1) == 0) {
      objc_storeStrong((id *)&self->_preferredFocusedView, v6);
    }
  }
}

- (void)textFieldDidChange:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVTextEntryController view](self, "view", a3));
  [v3 setNeedsLayout];
}

- (void)viewDidLayoutSubviews
{
  v88.receiver = self;
  v88.super_class = (Class)&OBJC_CLASS___TVTextEntryController;
  -[TVTextEntryController viewDidLayoutSubviews](&v88, "viewDidLayoutSubviews");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[UISystemInputViewController view](self->_systemInputViewController, "view"));
  objc_msgSend( v3,  "systemLayoutSizeFittingSize:",  UILayoutFittingCompressedSize.width,  UILayoutFittingCompressedSize.height);
  double height = CGSizeZero.height;
  if (v6 != CGSizeZero.width || v4 != height)
  {
    double v8 = v4;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVTextEntryController view](self, "view"));
    [v9 bounds];
    double v86 = v13;
    if (!self->_isTouchEnabled) {
      double v11 = 0.0;
    }
    double v78 = v11;
    if (!self->_isTouchEnabled) {
      double v10 = 838.0;
    }
    double v87 = v10;
    if (self->_isTouchEnabled) {
      double v14 = v12;
    }
    else {
      double v14 = v12 + -838.0 + -90.0;
    }
    -[UILabel sizeThatFits:](self->_textFieldHeaderLabel, "sizeThatFits:", CGSizeZero.width, height);
    double v80 = v15;
    double v17 = v16;
    -[UIView sizeThatFits:](self->_topAccessoryView, "sizeThatFits:", v14, 360.0);
    double v81 = v18;
    double v20 = v19;
    double v21 = v19 + 100.0;
    if (v19 <= 0.0) {
      double v21 = 0.0;
    }
    double v79 = v17;
    double v22 = v17 + v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[_TVTextEntryTextField attributedText](self->_textField, "attributedText"));
    objc_msgSend(v23, "boundingRectWithSize:options:context:", 8, 0, CGSizeZero.width, height);
    CGRect v90 = CGRectIntegral(v89);
    double width = v90.size.width;

    if (width + 40.0 > v14 * 0.9) {
      double v25 = v14 * 0.9;
    }
    else {
      double v25 = width + 40.0;
    }
    if (width + 40.0 > 600.0) {
      double v26 = v25;
    }
    else {
      double v26 = 600.0;
    }
    double v27 = v8 + 30.0 + 70.0;
    if (!self->_isTouchEnabled) {
      double v27 = 70.0;
    }
    double v85 = v27;
    double v28 = v22 + v27;
    -[UIView sizeThatFits:](self->_bottomAccessoryView, "sizeThatFits:", v14, v86 - v28, v25);
    double v83 = v30;
    double v84 = v29;
    double v31 = v30 + 100.0;
    if (v30 <= 0.0) {
      double v31 = 0.0;
    }
    double v32 = (v86 - (v28 + v31)) * 0.5;
    double v33 = v14;
    -[UIView setFrame:]( self->_topAccessoryView,  "setFrame:",  UIRectCenteredXInRect(0.0, v32, v81, v20, v87, v78, v14, v86));
    if (v20 <= 0.0)
    {
      double v34 = v32;
    }

    else
    {
      -[UIView frame](self->_topAccessoryView, "frame");
      double v34 = CGRectGetMaxY(v91) + 100.0;
    }

    double v82 = v34;
    -[_TVTextEntryTextField setFrame:]( self->_textField,  "setFrame:",  UIRectCenteredXInRect(0.0, v34, v26, 70.0, v87, v78, v14, v86));
    textFieldHeaderLabel = self->_textFieldHeaderLabel;
    -[_TVTextEntryTextField frame](self->_textField, "frame");
    double MinX = CGRectGetMinX(v92);
    -[_TVTextEntryTextField frame](self->_textField, "frame");
    -[UILabel setFrame:](textFieldHeaderLabel, "setFrame:", MinX, CGRectGetMinY(v93) - v79, v80);
    if (self->_hideAccessoryViews)
    {
      [v3 bounds];
      double v38 = v37;
      double v40 = v39;
      double v42 = v41;
      double v44 = v43;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVTextEntryController view](self, "view"));
      id v46 = [v45 frame];
      double v51 = UIRectCenteredIntegralRect(v46, v38, v40, v42, v44, v47, v48, v49, v50);
      v55 = v3;
    }

    else
    {
      if (!self->_isTouchEnabled)
      {
        [v3 bounds];
        double v59 = v58;
        double v61 = v60;
        double v63 = v62;
        double v65 = v64;
        v66 = (void *)objc_claimAutoreleasedReturnValue(-[TVTextEntryController view](self, "view"));
        id v67 = [v66 frame];
        UIRectCenteredYInRect(v67, v59, v61, v63, v65, v68, v69, v70, v71);
        double v73 = v72;
        double v75 = v74;
        double v77 = v76;

        objc_msgSend(v3, "setFrame:", 194.0, v73, v75, v77);
        goto LABEL_32;
      }

      -[_TVTextEntryTextField frame](self->_textField, "frame");
      CGFloat v56 = CGRectGetMaxY(v94) + 30.0;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVTextEntryController view](self, "view"));
      [v45 bounds];
      CGFloat v57 = CGRectGetWidth(v95);
      [v3 bounds];
      double v54 = CGRectGetHeight(v96);
      double v51 = 0.0;
      v55 = v3;
      double v52 = v56;
      double v53 = v57;
    }

    objc_msgSend(v55, "setFrame:", v51, v52, v53, v54);

LABEL_32:
    -[UIView setFrame:]( self->_bottomAccessoryView,  "setFrame:",  UIRectCenteredXInRect(0.0, v85 + 100.0 + v82, v84, v83, v87, v78, v33, v86));
  }
}

- (BOOL)_disableAutomaticKeyboardUI
{
  return 1;
}

- (BOOL)_enableAutomaticKeyboardPressDone
{
  return 1;
}

- (void)systemInputViewController:(id)a3 didChangeAccessoryVisibility:(BOOL)a4
{
  BOOL v5 = !a4;
  self->_hideAccessoryViews = !a4;
  -[UIView setHidden:](self->_topAccessoryView, "setHidden:", v5);
  -[UIView setHidden:](self->_bottomAccessoryView, "setHidden:", v5);
  -[_TVTextEntryTextField setHidden:](self->_textField, "setHidden:", v5);
  -[UILabel setHidden:](self->_textFieldHeaderLabel, "setHidden:", v5);
}

- (void)systemInputViewControllerDidAcceptRecentInput:(id)a3
{
}

- (void)_doneButtonPressed:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVTextEntryController delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v4, "textEntryControllerDidFinish:") & 1) != 0) {
    [v4 textEntryControllerDidFinish:self];
  }
}

- (BOOL)textFieldAllowsFocus
{
  return -[_TVTextEntryTextField allowsFocus](self->_textField, "allowsFocus");
}

- (void)setTextFieldAllowsFocus:(BOOL)a3
{
}

- (TVTextEntryControllerDelegate)delegate
{
  return (TVTextEntryControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UITextField)textField
{
  return &self->_textField->super;
}

- (UILabel)textFieldHeaderLabel
{
  return self->_textFieldHeaderLabel;
}

- (UIView)topAccessoryView
{
  return self->_topAccessoryView;
}

- (UIView)bottomAccessoryView
{
  return self->_bottomAccessoryView;
}

- (UISystemInputViewController)systemInputViewController
{
  return self->_systemInputViewController;
}

- (void).cxx_destruct
{
}

@end