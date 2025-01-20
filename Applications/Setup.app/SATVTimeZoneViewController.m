@interface SATVTimeZoneViewController
- (BOOL)_disableAutomaticKeyboardUI;
- (BOOL)_enableAutomaticKeyboardPressDone;
- (SATVTimeZoneSearchViewController)searchTableViewController;
- (SATVTimeZoneView)timeZoneView;
- (UILabel)titleLabel;
- (UISystemInputViewController)systemInputViewController;
- (id)completionHandler;
- (id)preferredFocusEnvironments;
- (void)_doneButtonPressed:(id)a3;
- (void)_textDidChange;
- (void)loadView;
- (void)setCompletionHandler:(id)a3;
- (void)setSearchTableViewController:(id)a3;
- (void)setSystemInputViewController:(id)a3;
- (void)setTimeZoneCityID:(id)a3;
- (void)setTimeZoneView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)viewController:(id)a3 didSelectCity:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SATVTimeZoneViewController

- (void)loadView
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___SATVTimeZoneViewController;
  -[SATVTimeZoneViewController loadView](&v25, "loadView");
  v3 = objc_alloc(&OBJC_CLASS___SATVTimeZoneView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController view](self, "view"));
  [v4 bounds];
  v5 = -[SATVTimeZoneView initWithFrame:](v3, "initWithFrame:");
  -[SATVTimeZoneViewController setTimeZoneView:](self, "setTimeZoneView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController timeZoneView](self, "timeZoneView"));
  [v6 addSubview:v7];

  id v8 = sub_10000D7CC(@"TIME_ZONE_TITLE", @"Localizable");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController timeZoneView](self, "timeZoneView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 headerView]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 titleLabel]);
  [v12 setText:v9];

  id v13 = sub_10000D7CC(@"TIME_ZONE_SUBTITLE", @"Localizable");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController timeZoneView](self, "timeZoneView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 headerView]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 subtitleLabel]);
  [v17 setText:v14];

  v18 = objc_alloc_init(&OBJC_CLASS___SATVTimeZoneSearchViewController);
  -[SATVTimeZoneViewController setSearchTableViewController:](self, "setSearchTableViewController:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController searchTableViewController](self, "searchTableViewController"));
  [v19 setSearchDelegate:self];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController timeZoneView](self, "timeZoneView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController searchTableViewController](self, "searchTableViewController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 tableView]);
  [v20 setSearchView:v22];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController searchTableViewController](self, "searchTableViewController"));
  -[SATVTimeZoneViewController addChildViewController:](self, "addChildViewController:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController searchTableViewController](self, "searchTableViewController"));
  [v24 didMoveToParentViewController:self];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVTimeZoneViewController;
  -[SATVTimeZoneViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController timeZoneView](self, "timeZoneView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 textField]);
  [v4 addTarget:self action:"_textDidChange" forControlEvents:0x20000];

  v5 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_doneButtonPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v5, "setAllowedPressTypes:", &off_1000D1058);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", &__NSArray0__struct);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController view](self, "view"));
  [v6 addGestureRecognizer:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SATVTimeZoneViewController;
  -[SATVTimeZoneViewController viewWillAppear:](&v14, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController systemInputViewController](self, "systemInputViewController"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController timeZoneView](self, "timeZoneView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 textField]);
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[UISystemInputViewController systemInputViewControllerForResponder:editorView:containingResponder:]( &OBJC_CLASS___UISystemInputViewController,  "systemInputViewControllerForResponder:editorView:containingResponder:",  v6,  0LL,  self));
    -[SATVTimeZoneViewController setSystemInputViewController:](self, "setSystemInputViewController:", v7);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController timeZoneView](self, "timeZoneView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController systemInputViewController](self, "systemInputViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 view]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController systemInputViewController](self, "systemInputViewController"));
    objc_msgSend(v8, "setSystemInputView:touchInputEnabled:", v10, objc_msgSend(v11, "supportsTouchInput"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController systemInputViewController](self, "systemInputViewController"));
    -[SATVTimeZoneViewController addChildViewController:](self, "addChildViewController:", v12);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController systemInputViewController](self, "systemInputViewController"));
    [v13 didMoveToParentViewController:self];
  }

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVTimeZoneViewController;
  -[SATVTimeZoneViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController timeZoneView](self, "timeZoneView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 textField]);
  [v5 becomeFirstResponder];
}

- (id)preferredFocusEnvironments
{
  if (!self->_pressedDone)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController systemInputViewController](self, "systemInputViewController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue([v5 preferredFocusEnvironments]);

    objc_super v6 = &__NSArray0__struct;
    if (v3) {
      objc_super v6 = v3;
    }
    id v4 = v6;
    goto LABEL_7;
  }

  self->_pressedDone = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController searchTableViewController](self, "searchTableViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 tableView]);

  if (v3)
  {
    v9 = v3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
LABEL_7:
    objc_super v7 = v4;

    return v7;
  }

  return &__NSArray0__struct;
}

- (void)_textDidChange
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController timeZoneView](self, "timeZoneView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v6 textField]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 text]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController searchTableViewController](self, "searchTableViewController"));
  [v5 setSearchString:v4];
}

- (void)viewController:(id)a3 didSelectCity:(id)a4
{
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
  self->_pressedDone = 1;
  -[SATVTimeZoneViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate", a3);
}

- (void)setTimeZoneCityID:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTimeZoneViewController completionHandler](self, "completionHandler"));

  if (v4)
  {
    v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[SATVTimeZoneViewController completionHandler]( self,  "completionHandler"));
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (SATVTimeZoneSearchViewController)searchTableViewController
{
  return self->_searchTableViewController;
}

- (void)setSearchTableViewController:(id)a3
{
}

- (UISystemInputViewController)systemInputViewController
{
  return self->_systemInputViewController;
}

- (void)setSystemInputViewController:(id)a3
{
}

- (SATVTimeZoneView)timeZoneView
{
  return self->_timeZoneView;
}

- (void)setTimeZoneView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end