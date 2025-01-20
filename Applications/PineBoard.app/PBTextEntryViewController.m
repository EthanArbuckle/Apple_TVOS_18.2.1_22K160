@interface PBTextEntryViewController
- (NSArray)enteredValues;
- (NSMutableArray)buttonTitles;
- (NSMutableArray)textFieldValues;
- (NSMutableArray)userValues;
- (NSString)defaultMessage;
- (NSString)defaultTitle;
- (PBTextEntryViewController)init;
- (PBTextEntryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PBTextEntryViewControllerDelegate)delegate;
- (TVSStateMachine)stateMachine;
- (UITapGestureRecognizer)menuRecognizer;
- (UIViewController)childViewController;
- (id)_buttonsForTextField:(int64_t)a3 defaultButtonIndex:(int64_t *)a4;
- (id)_messageStringAttributes;
- (id)_titleStringAttributes;
- (id)textField;
- (int64_t)currentTextField;
- (int64_t)defaultButtonIndex;
- (unint64_t)addButtonWithTitle:(id)a3;
- (unint64_t)addTextFieldWithInitialText:(id)a3 placeholder:(id)a4 keyboardType:(int64_t)a5;
- (void)_configureStateMachine;
- (void)_menuButtonPressed:(id)a3;
- (void)_showChildViewController:(id)a3;
- (void)_showTextEntryViewControllerForTextField:(int64_t)a3;
- (void)_synchronizeEnteredValues;
- (void)buttonView:(id)a3 didSelectButton:(id)a4 atIndex:(int64_t)a5;
- (void)loadView;
- (void)setAlternateTitle:(id)a3 message:(id)a4 forTextFieldAtIndex:(unint64_t)a5;
- (void)setButtonTitles:(id)a3;
- (void)setChildViewController:(id)a3;
- (void)setCurrentTextField:(int64_t)a3;
- (void)setDefaultButtonIndex:(int64_t)a3;
- (void)setDefaultMessage:(id)a3;
- (void)setDefaultTitle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnteredValues:(id)a3;
- (void)setMenuRecognizer:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setTextFieldValues:(id)a3;
- (void)setUserValues:(id)a3;
- (void)textEntryControllerDidFinish:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PBTextEntryViewController

- (PBTextEntryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBTextEntryViewController;
  v4 = -[PBTextEntryViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_defaultButtonIndex = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    textFieldValues = v5->_textFieldValues;
    v5->_textFieldValues = (NSMutableArray *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    buttonTitles = v5->_buttonTitles;
    v5->_buttonTitles = (NSMutableArray *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    userValues = v5->_userValues;
    v5->_userValues = (NSMutableArray *)v10;

    -[PBTextEntryViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 8LL);
  }

  return v5;
}

- (PBTextEntryViewController)init
{
  return -[PBTextEntryViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0LL, 0LL);
}

- (unint64_t)addTextFieldWithInitialText:(id)a3 placeholder:(id)a4 keyboardType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v11 = v10;
  if (v8) {
    [v10 setObject:v8 forKey:@"initial_text"];
  }
  if (v9) {
    [v11 setObject:v9 forKey:@"placeholder"];
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
  [v11 setObject:v12 forKey:@"keyboard_type"];

  -[NSMutableArray addObject:](self->_textFieldValues, "addObject:", v11);
  id v13 = -[NSMutableArray indexOfObject:](self->_textFieldValues, "indexOfObject:", v11);

  return (unint64_t)v13;
}

- (void)setAlternateTitle:(id)a3 message:(id)a4 forTextFieldAtIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_textFieldValues, "objectAtIndex:", a5));
  v11 = v10;
  if (v8) {
    [v10 setObject:v8 forKey:@"alt_title"];
  }
  if (v9) {
    [v11 setObject:v9 forKey:@"alt_message"];
  }
}

- (unint64_t)addButtonWithTitle:(id)a3
{
  buttonTitles = self->_buttonTitles;
  id v5 = a3;
  -[NSMutableArray addObject:](buttonTitles, "addObject:", v5);
  id v6 = -[NSMutableArray indexOfObject:](self->_buttonTitles, "indexOfObject:", v5);

  return (unint64_t)v6;
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBTextEntryViewController;
  -[PBTextEntryViewController loadView](&v6, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBTextEntryViewController view](self, "view"));
  v4 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuButtonPressed:");
  menuRecognizer = self->_menuRecognizer;
  self->_menuRecognizer = v4;

  -[UITapGestureRecognizer setAllowedPressTypes:](self->_menuRecognizer, "setAllowedPressTypes:", &off_1003FE7D0);
  [v3 addGestureRecognizer:self->_menuRecognizer];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBTextEntryViewController;
  -[PBTextEntryViewController viewDidLoad](&v3, "viewDidLoad");
  -[PBTextEntryViewController _configureStateMachine](self, "_configureStateMachine");
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBTextEntryViewController;
  -[PBTextEntryViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBTextEntryViewController view](self, "view"));
  [v4 layoutIfNeeded];

  -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"view appeared");
}

- (void)_configureStateMachine
{
  if (!self->_stateMachine)
  {
    objc_initWeak(&location, self);
    objc_super v3 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10014A234;
    v15[3] = &unk_1003D0928;
    objc_copyWeak(&v16, &location);
    v4 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( v3,  "initWithName:initialState:mode:stateChangeHandler:",  @"PBTextEntry",  @"uninitialized",  0LL,  v15);
    stateMachine = self->_stateMachine;
    self->_stateMachine = v4;

    objc_super v6 = self->_stateMachine;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10014A2C4;
    v13[3] = &unk_1003D0990;
    objc_copyWeak(&v14, &location);
    -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v6,  "registerDefaultHandlerForEvent:withBlock:",  @"menu pressed",  v13);
    v7 = self->_stateMachine;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10014A324;
    v11[3] = &unk_1003D0990;
    objc_copyWeak(&v12, &location);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v7,  "registerHandlerForEvent:onState:withBlock:",  @"view appeared",  @"uninitialized",  v11);
    id v8 = self->_stateMachine;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10014A364;
    v9[3] = &unk_1003D0990;
    objc_copyWeak(&v10, &location);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v8,  "registerHandlerForEvent:onState:withBlock:",  @"dialog button pressed",  @"text field",  v9);
    -[TVSStateMachine setShouldAcceptEvents:](self->_stateMachine, "setShouldAcceptEvents:", 1LL);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

- (void)_showTextEntryViewControllerForTextField:(int64_t)a3
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBTextEntryViewController textFieldValues](self, "textFieldValues"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:a3]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"alt_title"]);
  id v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[PBTextEntryViewController defaultTitle](self, "defaultTitle"));
  }
  v34 = v9;

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"alt_message"]);
  v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[PBTextEntryViewController defaultMessage](self, "defaultMessage"));
  }
  id v13 = v12;

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"keyboard_type"]);
  id v15 = [v14 integerValue];

  v33 = v13;
  else {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_userValues, "objectAtIndexedSubscript:", a3));
  }
  v17 = (void *)v16;
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"placeholder"]);
  v19 = (void *)objc_opt_new(&OBJC_CLASS___TVSUITextEntryController);
  [v19 setDelegate:self];
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 textField]);
  [v20 _setTitleForRemoteTextEditing:0];
  v32 = v17;
  [v20 setText:v17];
  v31 = (void *)v18;
  [v20 setPlaceholder:v18];
  [v20 setAutocapitalizationType:0];
  [v20 setAutocorrectionType:1];
  [v20 setEnablesReturnKeyAutomatically:1];
  [v20 setKeyboardType:v15];
  [v20 setKeyboardAppearance:1];
  -[PBTextEntryViewController _synchronizeEnteredValues](self, "_synchronizeEnteredValues");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PBTextEntryViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v21, "textEntry:willPresentTextField:") & 1) != 0) {
    [v21 textEntry:self willPresentTextField:v20];
  }
  v22 = (void *)objc_opt_new(&OBJC_CLASS___TVSUITextEntryHeaderView);
  if (v34)
  {
    v23 = objc_alloc(&OBJC_CLASS___NSAttributedString);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PBTextEntryViewController _titleStringAttributes](self, "_titleStringAttributes"));
    v25 = -[NSAttributedString initWithString:attributes:](v23, "initWithString:attributes:", v34, v24);
    [v22 setTitle:v25];
  }

  if (v13)
  {
    v26 = objc_alloc(&OBJC_CLASS___NSAttributedString);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PBTextEntryViewController _messageStringAttributes](self, "_messageStringAttributes"));
    v28 = -[NSAttributedString initWithString:attributes:](v26, "initWithString:attributes:", v13, v27);
    [v22 setMessage:v28];
  }

  [v19 setTopAccessoryView:v22];
  uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
  v29 = (void *)objc_claimAutoreleasedReturnValue( -[PBTextEntryViewController _buttonsForTextField:defaultButtonIndex:]( self,  "_buttonsForTextField:defaultButtonIndex:",  a3,  &v35));
  v30 = -[PBUserNotificationTextEntryButtonView initWithButtons:]( objc_alloc(&OBJC_CLASS___PBUserNotificationTextEntryButtonView),  "initWithButtons:",  v29);
  -[PBUserNotificationTextEntryButtonView setDelegate:](v30, "setDelegate:", self);
  -[PBUserNotificationTextEntryButtonView setDefaultButtonIndex:](v30, "setDefaultButtonIndex:", v35);
  [v19 setBottomAccessoryView:v30];
  -[PBTextEntryViewController _showChildViewController:](self, "_showChildViewController:", v19);
}

- (id)_buttonsForTextField:(int64_t)a3 defaultButtonIndex:(int64_t *)a4
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBTextEntryViewController textFieldValues](self, "textFieldValues"));
  id v9 = (char *)[v8 count] - 1;

  if (v9 == (char *)a3)
  {
    *a4 = -[PBTextEntryViewController defaultButtonIndex](self, "defaultButtonIndex");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBTextEntryViewController buttonTitles](self, "buttonTitles"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10014A92C;
    v15[3] = &unk_1003D9448;
    id v16 = v7;
    [v10 enumerateObjectsUsingBlock:v15];

    v11 = v16;
  }

  else
  {
    *a4 = 0LL;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
    id v12 = sub_1001C307C(@"ButtonContinue", 0LL);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v11 setTitle:v13 forState:0];

    [v11 setTag:-1];
    [v7 addObject:v11];
  }

  return v7;
}

- (void)_showChildViewController:(id)a3
{
  id v5 = a3;
  p_childViewController = &self->_childViewController;
  childViewController = self->_childViewController;
  if (childViewController)
  {
    -[UIViewController willMoveToParentViewController:](childViewController, "willMoveToParentViewController:", 0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](*p_childViewController, "view"));
    [v8 removeFromSuperview];

    -[UIViewController removeFromParentViewController](*p_childViewController, "removeFromParentViewController");
    id v9 = *p_childViewController;
    *p_childViewController = 0LL;
  }

  if (v5)
  {
    -[PBTextEntryViewController addChildViewController:](self, "addChildViewController:", v5);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBTextEntryViewController view](self, "view"));
    [v11 bounds];
    objc_msgSend(v10, "setFrame:");

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBTextEntryViewController view](self, "view"));
    [v12 addSubview:v10];

    [v5 didMoveToParentViewController:self];
    objc_storeStrong((id *)&self->_childViewController, a3);
  }
}

- (id)textField
{
  childViewController = self->_childViewController;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVSUITextEntryController);
  if ((objc_opt_isKindOfClass(childViewController, v4) & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBTextEntryViewController childViewController](self, "childViewController"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 textField]);
  }

  else
  {
    objc_super v6 = 0LL;
  }

  return v6;
}

- (void)_synchronizeEnteredValues
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBTextEntryViewController userValues](self, "userValues"));
  id v4 = [v3 copy];
  -[PBTextEntryViewController setEnteredValues:](self, "setEnteredValues:", v4);
}

- (void)buttonView:(id)a3 didSelectButton:(id)a4 atIndex:(int64_t)a5
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBTextEntryViewController textField](self, "textField"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 text]);
  id v9 = (void *)v8;
  id v10 = &stru_1003E2910;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  v11 = v10;

  -[NSMutableArray setObject:atIndexedSubscript:]( self->_userValues,  "setObject:atIndexedSubscript:",  v11,  self->_currentTextField);
  -[TVSStateMachine postEvent:withContext:]( self->_stateMachine,  "postEvent:withContext:",  @"dialog button pressed",  v6);
}

- (void)textEntryControllerDidFinish:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([a3 bottomAccessoryView]);
  id v4 = [v3 defaultButtonIndex];
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 buttonAtIndex:v4]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 delegate]);
    [v7 buttonView:v3 didSelectButton:v6 atIndex:v5];
  }
}

- (void)_menuButtonPressed:(id)a3
{
  id v4 = sub_100082C04();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[PBTextEntryViewController _menuButtonPressed:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[NSMutableArray setObject:atIndexedSubscript:]( self->_userValues,  "setObject:atIndexedSubscript:",  &stru_1003E2910,  self->_currentTextField);
  -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"menu pressed");
}

- (id)_titleStringAttributes
{
  if (qword_100471068 != -1) {
    dispatch_once(&qword_100471068, &stru_1003D9468);
  }
  return (id)qword_100471060;
}

- (id)_messageStringAttributes
{
  if (qword_100471078 != -1) {
    dispatch_once(&qword_100471078, &stru_1003D9488);
  }
  return (id)qword_100471070;
}

- (PBTextEntryViewControllerDelegate)delegate
{
  return (PBTextEntryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)defaultTitle
{
  return self->_defaultTitle;
}

- (void)setDefaultTitle:(id)a3
{
}

- (NSString)defaultMessage
{
  return self->_defaultMessage;
}

- (void)setDefaultMessage:(id)a3
{
}

- (int64_t)defaultButtonIndex
{
  return self->_defaultButtonIndex;
}

- (void)setDefaultButtonIndex:(int64_t)a3
{
  self->_defaultButtonIndex = a3;
}

- (NSArray)enteredValues
{
  return self->_enteredValues;
}

- (void)setEnteredValues:(id)a3
{
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (void)setChildViewController:(id)a3
{
}

- (UITapGestureRecognizer)menuRecognizer
{
  return self->_menuRecognizer;
}

- (void)setMenuRecognizer:(id)a3
{
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (int64_t)currentTextField
{
  return self->_currentTextField;
}

- (void)setCurrentTextField:(int64_t)a3
{
  self->_currentTextField = a3;
}

- (NSMutableArray)textFieldValues
{
  return self->_textFieldValues;
}

- (void)setTextFieldValues:(id)a3
{
}

- (NSMutableArray)buttonTitles
{
  return self->_buttonTitles;
}

- (void)setButtonTitles:(id)a3
{
}

- (NSMutableArray)userValues
{
  return self->_userValues;
}

- (void)setUserValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end