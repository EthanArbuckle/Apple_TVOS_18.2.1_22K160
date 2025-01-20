@interface SATVTextEntryViewController
- (BOOL)_disableAutomaticKeyboardUI;
- (BOOL)_enableAutomaticKeyboardPressDone;
- (BOOL)isContinueButtonEnabled;
- (BOOL)isSecureTextEntry;
- (NSString)continueButtonText;
- (NSString)textFieldSubtitle;
- (NSString)textFieldTitle;
- (SATVTextEntryView)textEntryView;
- (SATVTextEntryViewControllerDelegate)delegate;
- (UISystemInputViewController)systemInputViewController;
- (id)preferredFocusEnvironments;
- (int64_t)keyboardType;
- (void)_doneButtonPressed:(id)a3;
- (void)_handleMenuButton:(id)a3;
- (void)_submitButtonAction:(id)a3;
- (void)_textChanged;
- (void)loadView;
- (void)setContinueButtonEnabled:(BOOL)a3;
- (void)setContinueButtonText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)setSystemInputViewController:(id)a3;
- (void)setTextEntryView:(id)a3;
- (void)setTextFieldSubtitle:(id)a3;
- (void)setTextFieldTitle:(id)a3;
@end

@implementation SATVTextEntryViewController

- (void)loadView
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___SATVTextEntryViewController;
  -[SATVTextEntryViewController loadView](&v30, "loadView");
  v3 = objc_alloc(&OBJC_CLASS___SATVTextEntryView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryViewController view](self, "view"));
  [v4 bounds];
  v5 = -[SATVTextEntryView initWithFrame:](v3, "initWithFrame:");
  textEntryView = self->_textEntryView;
  self->_textEntryView = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView continueButton](self->_textEntryView, "continueButton"));
  [v7 addTarget:self action:"_submitButtonAction:" forControlEvents:0x2000];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryViewController view](self, "view"));
  [v8 addSubview:self->_textEntryView];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView textField](self->_textEntryView, "textField"));
  v10 = (UISystemInputViewController *)objc_claimAutoreleasedReturnValue( +[UISystemInputViewController systemInputViewControllerForResponder:editorView:containingResponder:]( &OBJC_CLASS___UISystemInputViewController,  "systemInputViewControllerForResponder:editorView:containingResponder:",  v9,  0LL,  self));
  systemInputViewController = self->_systemInputViewController;
  self->_systemInputViewController = v10;

  v12 = self->_textEntryView;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UISystemInputViewController view](self->_systemInputViewController, "view"));
  -[SATVTextEntryView setSystemInputView:touchInputEnabled:]( v12,  "setSystemInputView:touchInputEnabled:",  v13,  -[UISystemInputViewController supportsTouchInput](self->_systemInputViewController, "supportsTouchInput"));

  -[SATVTextEntryViewController addChildViewController:]( self,  "addChildViewController:",  self->_systemInputViewController);
  textFieldTitle = self->_textFieldTitle;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView titleLabel](self->_textEntryView, "titleLabel"));
  [v15 setText:textFieldTitle];

  textFieldSubtitle = self->_textFieldSubtitle;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView subtitleLabel](self->_textEntryView, "subtitleLabel"));
  [v17 setText:textFieldSubtitle];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView continueButton](self->_textEntryView, "continueButton"));
  [v18 setTitle:self->_continueButtonText forState:0];

  BOOL continueButtonEnabled = self->_continueButtonEnabled;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView continueButton](self->_textEntryView, "continueButton"));
  [v20 setEnabled:continueButtonEnabled];

  BOOL secureTextEntry = self->_secureTextEntry;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView textField](self->_textEntryView, "textField"));
  [v22 setSecureTextEntry:secureTextEntry];

  int64_t keyboardType = self->_keyboardType;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView textField](self->_textEntryView, "textField"));
  [v24 setKeyboardType:keyboardType];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView textField](self->_textEntryView, "textField"));
  [v25 addTarget:self action:"_textChanged" forControlEvents:0x20000];

  v26 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleMenuButton:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v26, "setAllowedPressTypes:", &off_1000D0F68);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v26, "setAllowedTouchTypes:", &__NSArray0__struct);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryViewController view](self, "view"));
  [v27 addGestureRecognizer:v26];

  v28 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_doneButtonPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v28, "setAllowedPressTypes:", &off_1000D0F80);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v28, "setAllowedTouchTypes:", &__NSArray0__struct);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryViewController view](self, "view"));
  [v29 addGestureRecognizer:v28];
}

- (BOOL)_disableAutomaticKeyboardUI
{
  return 1;
}

- (BOOL)_enableAutomaticKeyboardPressDone
{
  return 1;
}

- (void)_doneButtonPressed:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView continueButton](self->_textEntryView, "continueButton", a3));
  unsigned int v5 = [v4 isEnabled];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView continueButton](self->_textEntryView, "continueButton"));
    [v6 sendActionsForControlEvents:0x2000];
  }

- (void)setTextFieldTitle:(id)a3
{
  if (self->_textFieldTitle != a3)
  {
    v4 = (NSString *)[a3 copy];
    textFieldTitle = self->_textFieldTitle;
    self->_textFieldTitle = v4;

    id v6 = self->_textFieldTitle;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView titleLabel](self->_textEntryView, "titleLabel"));
    [v7 setText:v6];

    -[SATVTextEntryView setNeedsLayout](self->_textEntryView, "setNeedsLayout");
  }

- (void)setTextFieldSubtitle:(id)a3
{
  if (self->_textFieldSubtitle != a3)
  {
    v4 = (NSString *)[a3 copy];
    textFieldSubtitle = self->_textFieldSubtitle;
    self->_textFieldSubtitle = v4;

    id v6 = self->_textFieldSubtitle;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView subtitleLabel](self->_textEntryView, "subtitleLabel"));
    [v7 setText:v6];

    -[SATVTextEntryView setNeedsLayout](self->_textEntryView, "setNeedsLayout");
  }

- (void)setContinueButtonText:(id)a3
{
  unsigned int v5 = (NSString *)a3;
  if (self->_continueButtonText != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_continueButtonText, a3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView continueButton](self->_textEntryView, "continueButton"));
    [v6 setTitle:self->_continueButtonText forState:0];

    -[SATVTextEntryView setNeedsLayout](self->_textEntryView, "setNeedsLayout");
    unsigned int v5 = v7;
  }
}

- (void)setContinueButtonEnabled:(BOOL)a3
{
  if (self->_continueButtonEnabled != a3)
  {
    BOOL v3 = a3;
    self->_BOOL continueButtonEnabled = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView continueButton](self->_textEntryView, "continueButton"));
    [v4 setEnabled:v3];
  }

- (void)setSecureTextEntry:(BOOL)a3
{
  if (self->_secureTextEntry != a3)
  {
    BOOL v3 = a3;
    self->_BOOL secureTextEntry = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView textField](self->_textEntryView, "textField"));
    [v4 setSecureTextEntry:v3];
  }

- (void)setKeyboardType:(int64_t)a3
{
  if (self->_keyboardType != a3)
  {
    self->_int64_t keyboardType = a3;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryView textField](self->_textEntryView, "textField"));
    [v5 setKeyboardType:a3];

    -[SATVTextEntryView setNeedsUpdateConstraints](self->_textEntryView, "setNeedsUpdateConstraints");
  }

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryViewController systemInputViewController](self, "systemInputViewController"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 preferredFocusEnvironments]);

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = &__NSArray0__struct;
  }
  id v5 = v4;

  return v5;
}

- (void)_textChanged
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SATVTextEntryViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v6, "textEntryViewController:textDidChange:") & 1) != 0)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryViewController textEntryView](self, "textEntryView"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 textField]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 text]);
    [v6 textEntryViewController:self textDidChange:v5];
  }
}

- (void)_handleMenuButton:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SATVTextEntryViewController delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v4, "textEntryViewControllerDidCancel:") & 1) != 0) {
    [v4 textEntryViewControllerDidCancel:self];
  }
}

- (void)_submitButtonAction:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SATVTextEntryViewController delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v7, "textEntryViewController:didEnterText:") & 1) != 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTextEntryViewController textEntryView](self, "textEntryView"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 textField]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 text]);
    [v7 textEntryViewController:self didEnterText:v6];
  }
}

- (NSString)textFieldTitle
{
  return self->_textFieldTitle;
}

- (NSString)textFieldSubtitle
{
  return self->_textFieldSubtitle;
}

- (NSString)continueButtonText
{
  return self->_continueButtonText;
}

- (BOOL)isContinueButtonEnabled
{
  return self->_continueButtonEnabled;
}

- (BOOL)isSecureTextEntry
{
  return self->_secureTextEntry;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (SATVTextEntryViewControllerDelegate)delegate
{
  return (SATVTextEntryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SATVTextEntryView)textEntryView
{
  return self->_textEntryView;
}

- (void)setTextEntryView:(id)a3
{
}

- (UISystemInputViewController)systemInputViewController
{
  return self->_systemInputViewController;
}

- (void)setSystemInputViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end