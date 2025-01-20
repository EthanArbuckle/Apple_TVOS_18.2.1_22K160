@interface PBUserNotificationTextEntryViewController
- (NSMutableArray)userValues;
- (PBCFUserNotification)notification;
- (PBUserNotificationTextEntryViewController)init;
- (PBUserNotificationTextEntryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PBUserNotificationViewControllerDelegate)delegate;
- (TVSStateMachine)stateMachine;
- (UITapGestureRecognizer)menuRecognizer;
- (UIViewController)childViewController;
- (id)_buttonsForTextField:(int64_t)a3 defaultButtonIndex:(int64_t *)a4;
- (id)_messageStringAttributes;
- (id)_titleStringAttributes;
- (id)textField;
- (int64_t)currentTextField;
- (int64_t)preferredUserInterfaceStyle;
- (void)_configureStateMachine;
- (void)_handleHomeButton:(id)a3;
- (void)_menuButtonPressed:(id)a3;
- (void)_showChildViewController:(id)a3;
- (void)_showTextEntryViewControllerForTextField:(int64_t)a3;
- (void)buttonView:(id)a3 didSelectButton:(id)a4 atIndex:(int64_t)a5;
- (void)loadView;
- (void)setChildViewController:(id)a3;
- (void)setCurrentTextField:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setMenuRecognizer:(id)a3;
- (void)setNotification:(id)a3;
- (void)setPreferredUserInterfaceStyle:(int64_t)a3;
- (void)setStateMachine:(id)a3;
- (void)setUserValues:(id)a3;
- (void)textEntryControllerDidFinish:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PBUserNotificationTextEntryViewController

- (PBUserNotificationTextEntryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBUserNotificationTextEntryViewController;
  v4 = -[PBUserNotificationTextEntryViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_preferredUserInterfaceStyle = 2LL;
    -[PBUserNotificationTextEntryViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 8LL);
  }

  return v5;
}

- (PBUserNotificationTextEntryViewController)init
{
  return -[PBUserNotificationTextEntryViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0LL, 0LL);
}

- (void)setNotification:(id)a3
{
  v5 = (PBCFUserNotification *)a3;
  p_notification = &self->_notification;
  if (self->_notification != v5) {
    objc_storeStrong((id *)&self->_notification, a3);
  }
  objc_super v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  userValues = self->_userValues;
  self->_userValues = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification textFieldTitles](*p_notification, "textFieldTitles"));
  id v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = 0LL;
    do
    {
      -[NSMutableArray addObject:](self->_userValues, "addObject:", &stru_1003E2910);
      ++v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification textFieldTitles](*p_notification, "textFieldTitles"));
      id v13 = [v12 count];
    }

    while (v11 < (unint64_t)v13);
  }

  -[PBUserNotificationTextEntryViewController _configureStateMachine](self, "_configureStateMachine");
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBUserNotificationTextEntryViewController;
  -[PBUserNotificationTextEntryViewController loadView](&v7, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationTextEntryViewController view](self, "view"));
  v4 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuButtonPressed:");
  menuRecognizer = self->_menuRecognizer;
  self->_menuRecognizer = v4;

  -[UITapGestureRecognizer setAllowedPressTypes:](self->_menuRecognizer, "setAllowedPressTypes:", &off_1003FE548);
  [v3 addGestureRecognizer:self->_menuRecognizer];
  v6 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleHomeButton:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v6, "setAllowedPressTypes:", &off_1003FE560);
  [v3 addGestureRecognizer:v6];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBUserNotificationTextEntryViewController;
  -[PBUserNotificationTextEntryViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationTextEntryViewController view](self, "view"));
  [v4 layoutIfNeeded];

  -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"view appeared");
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBUserNotificationTextEntryViewController;
  -[PBUserNotificationTextEntryViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"view disappeared");
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (void)_configureStateMachine
{
  if (!self->_stateMachine)
  {
    objc_initWeak(&location, self);
    v3 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100034C94;
    v15[3] = &unk_1003D16D0;
    objc_copyWeak(&v16, &location);
    v15[4] = self;
    objc_super v4 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( v3,  "initWithName:initialState:mode:stateChangeHandler:",  @"Don't touch Jim",  @"uninitialized",  1LL,  v15);
    stateMachine = self->_stateMachine;
    self->_stateMachine = v4;

    v6 = self->_stateMachine;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100034DB0;
    v13[3] = &unk_1003D0990;
    objc_copyWeak(&v14, &location);
    -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v6,  "registerDefaultHandlerForEvent:withBlock:",  @"menu pressed",  v13);
    objc_super v7 = self->_stateMachine;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100034E10;
    v11[3] = &unk_1003D0990;
    objc_copyWeak(&v12, &location);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v7,  "registerHandlerForEvent:onState:withBlock:",  @"view appeared",  @"uninitialized",  v11);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( self->_stateMachine,  "registerHandlerForEvent:onState:withBlock:",  @"view disappeared",  @"text field",  &stru_1003D16F0);
    v8 = self->_stateMachine;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100034E5C;
    v9[3] = &unk_1003D1740;
    objc_copyWeak(&v10, &location);
    v9[4] = self;
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
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000350A4;
  v3[3] = &unk_1003D05A8;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(&_dispatch_main_q, v3);
}

- (id)_buttonsForTextField:(int64_t)a3 defaultButtonIndex:(int64_t *)a4
{
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationTextEntryViewController notification](self, "notification"));
  LODWORD(a3) = [v8 isLastTextField:a3];

  if (!(_DWORD)a3)
  {
    *a4 = 0LL;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
    id v26 = sub_1001C307C(@"ButtonContinue", 0LL);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    [v21 setTitle:v27 forState:0];

    v24 = v21;
    uint64_t v25 = -1LL;
    goto LABEL_9;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationTextEntryViewController notification](self, "notification"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 otherButtonTitle]);

  if (v10)
  {
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationTextEntryViewController notification](self, "notification"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 otherButtonTitle]);
    [v11 setTitle:v13 forState:0];

    [v11 setTag:0];
    [v7 addObject:v11];
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationTextEntryViewController notification](self, "notification"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 alternateButtonTitle]);

  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationTextEntryViewController notification](self, "notification"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 alternateButtonTitle]);
    [v16 setTitle:v18 forState:0];

    [v16 setTag:1];
    [v7 addObject:v16];
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationTextEntryViewController notification](self, "notification"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 defaultButtonTitle]);

  if (v20)
  {
    *a4 = (int64_t)[v7 count];
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationTextEntryViewController notification](self, "notification"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 defaultButtonTitle]);
    [v21 setTitle:v23 forState:0];

    v24 = v21;
    uint64_t v25 = 2LL;
LABEL_9:
    [v24 setTag:v25];
    [v7 addObject:v21];
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
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](*p_childViewController, "view"));
    [v8 removeFromSuperview];

    -[UIViewController removeFromParentViewController](*p_childViewController, "removeFromParentViewController");
    v9 = *p_childViewController;
    *p_childViewController = 0LL;
  }

  if (v5)
  {
    -[PBUserNotificationTextEntryViewController addChildViewController:](self, "addChildViewController:", v5);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationTextEntryViewController view](self, "view"));
    [v11 bounds];
    objc_msgSend(v10, "setFrame:");

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationTextEntryViewController view](self, "view"));
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
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationTextEntryViewController childViewController](self, "childViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 textField]);
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (void)buttonView:(id)a3 didSelectButton:(id)a4 atIndex:(int64_t)a5
{
  id v6 = a4;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationTextEntryViewController textField](self, "textField"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 text]);
  v9 = (void *)v8;
  id v10 = &stru_1003E2910;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  unint64_t v11 = v10;

  -[NSMutableArray setObject:atIndexedSubscript:]( self->_userValues,  "setObject:atIndexedSubscript:",  v11,  self->_currentTextField);
  -[TVSStateMachine postEvent:withContext:]( self->_stateMachine,  "postEvent:withContext:",  @"dialog button pressed",  v6);
}

- (void)textEntryControllerDidFinish:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 bottomAccessoryView]);
  id v4 = [v3 defaultButtonIndex];
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 buttonAtIndex:v4]);
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v3 delegate]);
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
    objc_super v7 = "-[PBUserNotificationTextEntryViewController _menuButtonPressed:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[NSMutableArray setObject:atIndexedSubscript:]( self->_userValues,  "setObject:atIndexedSubscript:",  &stru_1003E2910,  self->_currentTextField);
  -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"menu pressed");
}

- (void)_handleHomeButton:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082C04();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    id v14 = "-[PBUserNotificationTextEntryViewController _handleHomeButton:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v13, 0xCu);
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentApplicationSceneHandle]);
  unsigned __int8 v9 = [v8 isDefaultKioskAppScene];

  if ((v9 & 1) == 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppDelegate sharedApplicationDelegate](&OBJC_CLASS___PBAppDelegate, "sharedApplicationDelegate"));
    [v10 handleTVTapEvent:v4];
  }

  -[NSMutableArray setObject:atIndexedSubscript:]( self->_userValues,  "setObject:atIndexedSubscript:",  &stru_1003E2910,  self->_currentTextField);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v12 = WeakRetained;
  if (WeakRetained && (objc_opt_respondsToSelector(WeakRetained, "didCancelUserNotificationViewController:") & 1) != 0) {
    [v12 didCancelUserNotificationViewController:self];
  }
}

- (id)_titleStringAttributes
{
  if (qword_100470088 != -1) {
    dispatch_once(&qword_100470088, &stru_1003D1760);
  }
  return (id)qword_100470080;
}

- (id)_messageStringAttributes
{
  if (qword_100470098 != -1) {
    dispatch_once(&qword_100470098, &stru_1003D1780);
  }
  return (id)qword_100470090;
}

- (PBCFUserNotification)notification
{
  return self->_notification;
}

- (PBUserNotificationViewControllerDelegate)delegate
{
  return (PBUserNotificationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)setPreferredUserInterfaceStyle:(int64_t)a3
{
  self->_preferredUserInterfaceStyle = a3;
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