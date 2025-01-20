@interface MCTVInstallProfileQuestionViewController
- (BOOL)allowsEmptyInput;
- (BOOL)waitingForPasscodePreflight;
- (DMCFieldCollection)fieldCollection;
- (MCTVInstallProfileQuestionViewController)initWithUserInput:(id)a3;
- (MCTVInstallProfileQuestionViewControllerDelegate)delegate;
- (NSArray)userInput;
- (NSString)previousResponseValue;
- (TVSUITextEntryController)textEntryController;
- (TVSUITextEntryHeaderView)headerView;
- (id)_messageStringAttributes;
- (id)_titleStringAttributes;
- (id)listTitleTextColor;
- (id)preferredFocusEnvironments;
- (void)_cancelInput;
- (void)_cancelPayload;
- (void)_configureSubmitButton;
- (void)_configureTextField;
- (void)_configureTitleView;
- (void)_continueOrFinish;
- (void)_didFinishPasscodePreflightWithError:(id)a3;
- (void)_didFinishPreflightWithError:(id)a3;
- (void)_donePressed:(id)a3;
- (void)_finishInput;
- (void)_menuPressed;
- (void)_preflightCurrentPayload;
- (void)_processResponseAndContinue;
- (void)_retryCurrentPasswordFieldWithError:(id)a3;
- (void)_retryPayload;
- (void)_showErrorAlertWithError:(id)a3;
- (void)_tellDelegateDidFinishWithUserInputResponses:(id)a3;
- (void)_textFieldTextDidChange:(id)a3;
- (void)_updateUIForCurrentField;
- (void)didFinishPreflightWithError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)textEntryControllerDidFinish:(id)a3;
- (void)updateWithUserInput:(id)a3;
- (void)viewDidLoad;
@end

@implementation MCTVInstallProfileQuestionViewController

- (MCTVInstallProfileQuestionViewController)initWithUserInput:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCTVInstallProfileQuestionViewController;
  v5 = -[MCTVInstallProfileQuestionViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0LL, 0LL);
  if (v5)
  {
    v6 = -[DMCFieldCollection initWithUserInput:]( objc_alloc(&OBJC_CLASS___DMCFieldCollection),  "initWithUserInput:",  v4);
    fieldCollection = v5->_fieldCollection;
    v5->_fieldCollection = v6;
  }

  return v5;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MCTVInstallProfileQuestionViewController;
  -[MCTVInstallProfileQuestionViewController viewDidLoad](&v19, "viewDidLoad");
  v3 = objc_alloc_init(&OBJC_CLASS___TVSUITextEntryController);
  textEntryController = self->_textEntryController;
  self->_textEntryController = v3;

  -[TVSUITextEntryController setDelegate:](self->_textEntryController, "setDelegate:", self);
  v5 = objc_alloc_init(&OBJC_CLASS___TVSUITextEntryHeaderView);
  headerView = self->_headerView;
  self->_headerView = v5;

  -[TVSUITextEntryHeaderView setAutoresizingMask:](self->_headerView, "setAutoresizingMask:", 18LL);
  -[TVSUITextEntryController setTopAccessoryView:]( self->_textEntryController,  "setTopAccessoryView:",  self->_headerView);
  -[MCTVInstallProfileQuestionViewController _configureTitleView](self, "_configureTitleView");
  -[MCTVInstallProfileQuestionViewController _configureTextField](self, "_configureTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUITextEntryController textField](self->_textEntryController, "textField"));
  [v7 addTarget:self action:"_textFieldTextDidChange:" forControlEvents:0x20000];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
  [v8 addTarget:self action:"_donePressed:" forControlEvents:0x2000];
  id v9 = objc_alloc_init(&OBJC_CLASS___TVSUITextEntryFooterView);
  [v9 setSubmitButton:v8];
  -[TVSUITextEntryController setBottomAccessoryView:](self->_textEntryController, "setBottomAccessoryView:", v9);
  -[MCTVInstallProfileQuestionViewController _configureSubmitButton](self, "_configureSubmitButton");
  -[MCTVInstallProfileQuestionViewController addChildViewController:]( self,  "addChildViewController:",  self->_textEntryController);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileQuestionViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUITextEntryController view](self->_textEntryController, "view"));
  [v10 addSubview:v11];

  -[TVSUITextEntryController didMoveToParentViewController:]( self->_textEntryController,  "didMoveToParentViewController:",  self);
  v12 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuPressed");
  -[UITapGestureRecognizer setAllowedPressTypes:](v12, "setAllowedPressTypes:", &off_2AA90);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileQuestionViewController view](self, "view"));
  [v13 addGestureRecognizer:v12];

  objc_initWeak(&location, self);
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___UITraitPreferredContentSizeCategory);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_60B0;
  v16[3] = &unk_287E8;
  objc_copyWeak(&v17, &location);
  id v15 =  -[MCTVInstallProfileQuestionViewController registerForTraitChanges:withHandler:]( self,  "registerForTraitChanges:withHandler:",  v14,  v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (id)preferredFocusEnvironments
{
  return -[TVSUITextEntryController preferredFocusEnvironments]( self->_textEntryController,  "preferredFocusEnvironments");
}

- (void)updateWithUserInput:(id)a3
{
  id v4 = a3;
  v5 = -[DMCFieldCollection initWithUserInput:](objc_alloc(&OBJC_CLASS___DMCFieldCollection), "initWithUserInput:", v4);

  fieldCollection = self->_fieldCollection;
  self->_fieldCollection = v5;

  -[MCTVInstallProfileQuestionViewController _updateUIForCurrentField](self, "_updateUIForCurrentField");
}

- (void)didFinishPreflightWithError:(id)a3
{
  if (self->_waitingForPasscodePreflight)
  {
    self->_waitingForPasscodePreflight = 0;
    -[MCTVInstallProfileQuestionViewController _didFinishPasscodePreflightWithError:]( self,  "_didFinishPasscodePreflightWithError:",  a3);
  }

  else
  {
    -[MCTVInstallProfileQuestionViewController _didFinishPreflightWithError:](self, "_didFinishPreflightWithError:", a3);
  }

- (void)textEntryControllerDidFinish:(id)a3
{
}

- (void)_donePressed:(id)a3
{
}

- (void)_menuPressed
{
}

- (void)_textFieldTextDidChange:(id)a3
{
  if (self->_allowsEmptyInput)
  {
    BOOL v4 = 1LL;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUITextEntryController textField](self->_textEntryController, "textField", a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 text]);
    BOOL v4 = [v6 length] != 0;
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVSUITextEntryController bottomAccessoryView](self->_textEntryController, "bottomAccessoryView", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v8 submitButton]);
  [v7 setEnabled:v4];
}

- (void)_tellDelegateDidFinishWithUserInputResponses:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileQuestionViewController delegate](self, "delegate"));
  [v5 questionController:self didFinishWithResponses:v4];
}

- (void)_finishInput
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[DMCFieldCollection userInputResponses](self->_fieldCollection, "userInputResponses"));
  -[MCTVInstallProfileQuestionViewController _tellDelegateDidFinishWithUserInputResponses:]( self,  "_tellDelegateDidFinishWithUserInputResponses:",  v3);
}

- (void)_cancelInput
{
}

- (void)_retryPayload
{
}

- (void)_cancelPayload
{
}

- (void)_updateUIForCurrentField
{
}

- (void)_continueOrFinish
{
  if (-[DMCFieldCollection currentFieldIsFinalField](self->_fieldCollection, "currentFieldIsFinalField"))
  {
    -[MCTVInstallProfileQuestionViewController _finishInput](self, "_finishInput");
  }

  else
  {
    -[DMCFieldCollection moveToNextField](self->_fieldCollection, "moveToNextField");
    -[MCTVInstallProfileQuestionViewController _updateUIForCurrentField](self, "_updateUIForCurrentField");
  }

- (void)_preflightCurrentPayload
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[DMCFieldCollection responseDictionariesForCurrentPayload]( self->_fieldCollection,  "responseDictionariesForCurrentPayload"));
  objc_msgSend( v4,  "preflightUserInputResponses:forPayloadIndex:",  v3,  -[DMCFieldCollection currentPayloadIndex](self->_fieldCollection, "currentPayloadIndex"));
}

- (void)_didFinishPasscodePreflightWithError:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    previousResponseValue = self->_previousResponseValue;
    self->_previousResponseValue = 0LL;

    -[MCTVInstallProfileQuestionViewController _retryCurrentPasswordFieldWithError:]( self,  "_retryCurrentPasswordFieldWithError:",  v9);
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMCFieldCollection currentField](self->_fieldCollection, "currentField"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 retypeDescription]);
    v7 = (void *)v6;
    if (v6) {
      id v8 = (const __CFString *)v6;
    }
    else {
      id v8 = &stru_29488;
    }
    [v5 setFieldDescription:v8];

    -[MCTVInstallProfileQuestionViewController _updateUIForCurrentField](self, "_updateUIForCurrentField");
  }
}

- (void)_didFinishPreflightWithError:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (!v4)
  {
    -[MCTVInstallProfileQuestionViewController _continueOrFinish](self, "_continueOrFinish");
    goto LABEL_8;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:MCErrorTypeKey]);
  if (![v6 isEqualToString:MCErrorTypeNeedsRetry])
  {

    goto LABEL_7;
  }

  unsigned int v7 = -[DMCFieldCollection currentFieldIsSinglePasswordField]( self->_fieldCollection,  "currentFieldIsSinglePasswordField");

  if (!v7)
  {
LABEL_7:
    -[MCTVInstallProfileQuestionViewController _showErrorAlertWithError:](self, "_showErrorAlertWithError:", v8);
    goto LABEL_8;
  }

  -[MCTVInstallProfileQuestionViewController _retryCurrentPasswordFieldWithError:]( self,  "_retryCurrentPasswordFieldWithError:",  v8);
LABEL_8:
}

- (void)_processResponseAndContinue
{
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[DMCFieldCollection currentField](self->_fieldCollection, "currentField"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUITextEntryController textField](self->_textEntryController, "textField"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 text]);

  if (![v13 needsRetype])
  {
    unsigned int v5 = 0;
    goto LABEL_6;
  }

  if (self->_previousResponseValue)
  {
    if (objc_msgSend(v4, "isEqualToString:"))
    {
      unsigned int v5 = [v13 isDevicePasscodeField];
      previousResponseValue = self->_previousResponseValue;
      self->_previousResponseValue = 0LL;

LABEL_6:
      if (self->_waitingForPasscodePreflight || (v5 & 1) != 0)
      {
        if (!v5) {
          goto LABEL_9;
        }
      }

      else
      {
        [v13 setUserResponse:v4];
        if ((-[DMCFieldCollection currentFieldIsLastInPayload]( self->_fieldCollection,  "currentFieldIsLastInPayload") & 1) != 0)
        {
LABEL_9:
          -[MCTVInstallProfileQuestionViewController _preflightCurrentPayload](self, "_preflightCurrentPayload");
          goto LABEL_22;
        }
      }

      -[MCTVInstallProfileQuestionViewController _continueOrFinish](self, "_continueOrFinish");
      goto LABEL_22;
    }

    id v9 = self->_previousResponseValue;
    self->_previousResponseValue = 0LL;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v13 mismatchDescription]);
  }

  else
  {
    unsigned int v7 = (NSString *)[v4 copy];
    id v8 = self->_previousResponseValue;
    self->_previousResponseValue = v7;

    if ([v13 isDevicePasscodeField])
    {
      [v13 setUserResponse:v4];
      unsigned int v5 = 0;
      self->_waitingForPasscodePreflight = 1;
      goto LABEL_6;
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v13 retypeDescription]);
  }

  v11 = (void *)v10;
  if (v10) {
    v12 = (const __CFString *)v10;
  }
  else {
    v12 = &stru_29488;
  }
  [v13 setFieldDescription:v12];

  -[MCTVInstallProfileQuestionViewController _updateUIForCurrentField](self, "_updateUIForCurrentField");
LABEL_22:
}

- (void)_retryCurrentPasswordFieldWithError:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMCFieldCollection currentField](self->_fieldCollection, "currentField"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
  if (v5) {
    [v4 setFieldDescription:v5];
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedRecoverySuggestion]);
  if (v6) {
    [v4 setFinePrint:v6];
  }
  -[MCTVInstallProfileQuestionViewController _updateUIForCurrentField](self, "_updateUIForCurrentField");
}

- (void)_showErrorAlertWithError:(id)a3
{
  id v4 = a3;
  objc_initWeak(location, self);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_6CE4;
  v37[3] = &unk_286F0;
  objc_copyWeak(&v38, location);
  v32 = objc_retainBlock(v37);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_6D10;
  v35[3] = &unk_286F0;
  objc_copyWeak(&v36, location);
  v31 = objc_retainBlock(v35);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_6D3C;
  v33[3] = &unk_286F0;
  objc_copyWeak(&v34, location);
  unsigned int v5 = objc_retainBlock(v33);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedRecoverySuggestion]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v7,  1LL));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:MCErrorTypeKey]);

  if ([v10 isEqualToString:MCErrorTypeSkippable])
  {
    id v11 = MCUILocalizedString(@"RETRY");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  0LL,  v32,  &v38));
    [v8 addAction:v13];

    id v14 = MCUILocalizedString(@"SKIP");
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  0LL,  v31));
    [v8 addAction:v16];

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  v5));
    [v8 addAction:v17];
  }

  else if (objc_msgSend(v10, "isEqualToString:", MCErrorTypeRetryable, &v38))
  {
    id v18 = MCUILocalizedString(@"RETRY");
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v19,  0LL,  v32));
    [v8 addAction:v20];

    id v21 = MCUILocalizedString(@"IGNORE");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v22,  0LL,  v31));
    [v8 addAction:v23];

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  v5));
    [v8 addAction:v17];
  }

  else
  {
    if ([v10 isEqualToString:MCErrorTypeNeedsRetry])
    {
      id v24 = MCUILocalizedString(@"RETRY");
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v25,  0LL,  v32));
      [v8 addAction:v26];

      id v27 = MCUILocalizedString(@"CANCEL");
    }

    else
    {
      id v27 = MCUILocalizedString(@"OK");
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  1LL,  v5));
    [v8 addAction:v28];
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileQuestionViewController navigationController](self, "navigationController"));
  [v29 presentViewController:v8 animated:1 completion:0];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);

  objc_destroyWeak(v30);
  objc_destroyWeak(location);
}

- (void)_configureTitleView
{
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[DMCFieldCollection currentField](self->_fieldCollection, "currentField"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v14 title]);
  if ([v3 length])
  {
    id v4 = objc_alloc(&OBJC_CLASS___NSAttributedString);
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileQuestionViewController _titleStringAttributes](self, "_titleStringAttributes"));
    uint64_t v6 = -[NSAttributedString initWithString:attributes:](v4, "initWithString:attributes:", v3, v5);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  -[TVSUITextEntryHeaderView setTitle:](self->_headerView, "setTitle:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v14 finePrint]);
  if ([v7 length])
  {
    id v8 = objc_alloc(&OBJC_CLASS___NSAttributedString);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MCTVInstallProfileQuestionViewController _messageStringAttributes]( self,  "_messageStringAttributes"));
    uint64_t v10 = -[NSAttributedString initWithString:attributes:](v8, "initWithString:attributes:", v7, v9);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  -[TVSUITextEntryHeaderView setMessage:](self->_headerView, "setMessage:", v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v14 fieldDescription]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUITextEntryController textFieldHeaderLabel](self->_textEntryController, "textFieldHeaderLabel"));
  [v12 setText:v11];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUITextEntryController view](self->_textEntryController, "view"));
  [v13 setNeedsLayout];
}

- (void)_configureTextField
{
  if (-[MCTVInstallProfileQuestionViewController isViewLoaded](self, "isViewLoaded"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUITextEntryController textField](self->_textEntryController, "textField"));

    if (v3)
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue(-[DMCFieldCollection currentField](self->_fieldCollection, "currentField"));
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUITextEntryController textField](self->_textEntryController, "textField"));
      objc_msgSend(v4, "setSecureTextEntry:", objc_msgSend(v7, "isPassword"));
      objc_msgSend(v4, "setKeyboardType:", objc_msgSend(v7, "keyboardType"));
      objc_msgSend(v4, "setAutocapitalizationType:", objc_msgSend(v7, "capitalizationType"));
      [v4 setAutocorrectionType:1];
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v7 defaultValue]);
      [v4 setText:v5];

      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 placeholderValue]);
      [v4 setPlaceholder:v6];
    }
  }

- (void)_configureSubmitButton
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUITextEntryController bottomAccessoryView](self->_textEntryController, "bottomAccessoryView"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v3 submitButton]);

  id v4 = v12;
  if (v12)
  {
    if (-[DMCFieldCollection currentFieldIsFinalField]( self->_fieldCollection,  "currentFieldIsFinalField")) {
      unsigned int v5 = @"NEXT";
    }
    else {
      unsigned int v5 = @"DONE";
    }
    id v6 = MCUILocalizedString(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v12 setTitle:v7 forState:0];

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.117647059,  0.117647059,  0.117647059,  0.4));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileQuestionViewController traitCollection](self, "traitCollection"));
    uint64_t v10 = (char *)[v9 userInterfaceStyle];

    if (v10 == (_BYTE *)&dword_0 + 2)
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.882352941,  0.882352941,  0.882352941,  0.4));

      id v8 = (void *)v11;
    }

    [v12 _setVisualEffectViewEnabled:0 backgroundColor:v8];

    id v4 = v12;
  }
}

- (id)_titleStringAttributes
{
  v7[0] = NSFontAttributeName;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle3));
  v8[0] = v3;
  v7[1] = NSForegroundColorAttributeName;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileQuestionViewController listTitleTextColor](self, "listTitleTextColor"));
  v8[1] = v4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));

  return v5;
}

- (id)_messageStringAttributes
{
  v7[0] = NSFontAttributeName;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
  v8[0] = v3;
  v7[1] = NSForegroundColorAttributeName;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileQuestionViewController listTitleTextColor](self, "listTitleTextColor"));
  v8[1] = v4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));

  return v5;
}

- (id)listTitleTextColor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 traitCollection]);
  id v4 = (char *)[v3 userInterfaceStyle];

  if (v4 == (_BYTE *)&dword_0 + 1)
  {
    double v5 = 0.6;
    double v6 = 0.0;
  }

  else
  {
    double v5 = 0.9;
    double v6 = 1.0;
  }

  return (id)objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor,  "colorWithWhite:alpha:",  v6,  v5));
}

- (NSArray)userInput
{
  return self->_userInput;
}

- (MCTVInstallProfileQuestionViewControllerDelegate)delegate
{
  return (MCTVInstallProfileQuestionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (DMCFieldCollection)fieldCollection
{
  return self->_fieldCollection;
}

- (TVSUITextEntryController)textEntryController
{
  return self->_textEntryController;
}

- (TVSUITextEntryHeaderView)headerView
{
  return self->_headerView;
}

- (BOOL)allowsEmptyInput
{
  return self->_allowsEmptyInput;
}

- (BOOL)waitingForPasscodePreflight
{
  return self->_waitingForPasscodePreflight;
}

- (NSString)previousResponseValue
{
  return self->_previousResponseValue;
}

- (void).cxx_destruct
{
}

@end