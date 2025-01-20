@interface TVSettingsBetaTermsViewController
- (BOOL)termTextVisible;
- (NSArray)terms;
- (TVSettingsBetaTermsViewController)initWithTerms:(id)a3;
- (TVSettingsBetaTermsViewControllerDelegate)delegate;
- (UITapGestureRecognizer)menuRecognizer;
- (UIViewController)currentChildViewController;
- (id)preferredFocusEnvironments;
- (unint64_t)currentTermIndex;
- (void)_completeWithResult:(BOOL)a3;
- (void)_handleMenuButton:(id)a3;
- (void)_showButtons;
- (void)_showTermText;
- (void)_transitionToViewController:(id)a3 animated:(BOOL)a4;
- (void)setCurrentChildViewController:(id)a3;
- (void)setCurrentTermIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setMenuRecognizer:(id)a3;
- (void)setTermTextVisible:(BOOL)a3;
- (void)setTerms:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsBetaTermsViewController

- (TVSettingsBetaTermsViewController)initWithTerms:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVSettingsBetaTermsViewController;
  v5 = -[TVSettingsBetaTermsViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0LL, 0LL);
  v6 = v5;
  if (v5)
  {
    -[TVSettingsBetaTermsViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 8LL);
    v7 = (NSArray *)[v4 copy];
    terms = v6->_terms;
    v6->_terms = v7;

    v6->_currentTermIndex = 0LL;
    v6->_termTextVisible = 0;
    currentChildViewController = v6->_currentChildViewController;
    v6->_currentChildViewController = 0LL;
  }

  return v6;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsBetaTermsViewController;
  -[TVSettingsBetaTermsViewController viewDidLoad](&v3, "viewDidLoad");
  -[TVSettingsBetaTermsViewController _showButtons](self, "_showButtons");
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsBetaTermsViewController;
  -[TVSettingsBetaTermsViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  id v4 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleMenuButton:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v4, "setAllowedPressTypes:", &off_1001AEAE8);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v4, "setAllowedTouchTypes:", &__NSArray0__struct);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBetaTermsViewController view](self, "view"));
  [v5 addGestureRecognizer:v4];

  -[TVSettingsBetaTermsViewController setMenuRecognizer:](self, "setMenuRecognizer:", v4);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBetaTermsViewController view](self, "view"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBetaTermsViewController menuRecognizer](self, "menuRecognizer"));
  [v5 removeGestureRecognizer:v6];

  -[TVSettingsBetaTermsViewController setMenuRecognizer:](self, "setMenuRecognizer:", 0LL);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsBetaTermsViewController;
  -[TVSettingsBetaTermsViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
}

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBetaTermsViewController currentChildViewController](self, "currentChildViewController"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 preferredFocusEnvironments]);

  return v3;
}

- (void)_handleMenuButton:(id)a3
{
  if (-[TVSettingsBetaTermsViewController termTextVisible](self, "termTextVisible", a3)) {
    -[TVSettingsBetaTermsViewController _showButtons](self, "_showButtons");
  }
  else {
    -[TVSettingsBetaTermsViewController _completeWithResult:](self, "_completeWithResult:", 0LL);
  }
}

- (void)_showButtons
{
  id v21 = objc_alloc_init(&OBJC_CLASS___TVSUITextAlertController);
  uint64_t v2 = TSKLocString(@"OSBetaSoftwareTermsTitle");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  [v21 setTitle:v3];

  uint64_t v4 = TSKLocString(@"OSBetaSoftwareTermsMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v21 setText:v5];

  [v21 setShouldDismissAutomatically:0];
  objc_initWeak(&location, self);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBetaTermsViewController terms](self, "terms"));
  id v7 = [v6 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 title]);
        if ([v12 length])
        {
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472LL;
          v26[2] = sub_100018FB8;
          v26[3] = &unk_10018EF78;
          objc_copyWeak(v27, &location);
          v27[1] = (char *)i + v8;
          v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v12,  0LL,  v26));
          [v21 addButton:v13];

          objc_destroyWeak(v27);
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_1000F6978(buf, (uint64_t)v11, &v34);
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v28 objects:v35 count:16];
      v8 += (uint64_t)i;
    }

    while (v7);
  }

  uint64_t v14 = TSKLocString(@"OSBetaSoftwareAgreeButtonTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100018FFC;
  v24[3] = &unk_10018E810;
  objc_copyWeak(&v25, &location);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v15,  0LL,  v24));

  [v21 addButton:v16];
  uint64_t v17 = TSKLocString(@"OSBetaSoftwareDisagreeButtonTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10001902C;
  v22[3] = &unk_10018E810;
  objc_copyWeak(&v23, &location);
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v18,  0LL,  v22));

  [v21 addButton:v19];
  -[TVSettingsBetaTermsViewController _transitionToViewController:animated:]( self,  "_transitionToViewController:animated:",  v21,  1LL);
  -[TVSettingsBetaTermsViewController setTermTextVisible:](self, "setTermTextVisible:", 0LL);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)_showTermText
{
  id v7 = objc_alloc_init(&OBJC_CLASS___TVSUITextAlertController);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBetaTermsViewController terms](self, "terms"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "objectAtIndex:",  -[TVSettingsBetaTermsViewController currentTermIndex](self, "currentTermIndex")));

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 content]);
  [v7 setTitle:v5];
  [v7 setText:v6];
  [v7 setShouldDismissAutomatically:0];
  -[TVSettingsBetaTermsViewController _transitionToViewController:animated:]( self,  "_transitionToViewController:animated:",  v7,  1LL);
  -[TVSettingsBetaTermsViewController setTermTextVisible:](self, "setTermTextVisible:", 1LL);
}

- (void)_completeWithResult:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100019190;
  v3[3] = &unk_10018EFA0;
  v3[4] = self;
  BOOL v4 = a3;
  -[TVSettingsBetaTermsViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  v3);
}

- (void)_transitionToViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    -[TVSettingsBetaTermsViewController addChildViewController:](self, "addChildViewController:", v6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBetaTermsViewController view](self, "view"));
    [v8 bounds];
    objc_msgSend(v7, "setFrame:");

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
    [v9 setHidden:1];

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBetaTermsViewController view](self, "view"));
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
    [v10 addSubview:v11];

    [v6 didMoveToParentViewController:self];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBetaTermsViewController currentChildViewController](self, "currentChildViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBetaTermsViewController view](self, "view"));
  if (v4) {
    double v14 = 0.5;
  }
  else {
    double v14 = 0.0;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000193B4;
  v23[3] = &unk_10018E468;
  id v24 = v6;
  id v25 = v12;
  uint64_t v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_100019410;
  v20 = &unk_10018EFC8;
  id v21 = v25;
  v22 = self;
  id v15 = v25;
  id v16 = v6;
  +[UIView transitionWithView:duration:options:animations:completion:]( &OBJC_CLASS___UIView,  "transitionWithView:duration:options:animations:completion:",  v13,  5243136LL,  v23,  &v17,  v14);

  -[TVSettingsBetaTermsViewController setCurrentChildViewController:]( self,  "setCurrentChildViewController:",  v16,  v17,  v18,  v19,  v20);
}

- (TVSettingsBetaTermsViewControllerDelegate)delegate
{
  return (TVSettingsBetaTermsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)terms
{
  return self->_terms;
}

- (void)setTerms:(id)a3
{
}

- (UIViewController)currentChildViewController
{
  return self->_currentChildViewController;
}

- (void)setCurrentChildViewController:(id)a3
{
}

- (UITapGestureRecognizer)menuRecognizer
{
  return self->_menuRecognizer;
}

- (void)setMenuRecognizer:(id)a3
{
}

- (unint64_t)currentTermIndex
{
  return self->_currentTermIndex;
}

- (void)setCurrentTermIndex:(unint64_t)a3
{
  self->_currentTermIndex = a3;
}

- (BOOL)termTextVisible
{
  return self->_termTextVisible;
}

- (void)setTermTextVisible:(BOOL)a3
{
  self->_termTextVisible = a3;
}

- (void).cxx_destruct
{
}

@end