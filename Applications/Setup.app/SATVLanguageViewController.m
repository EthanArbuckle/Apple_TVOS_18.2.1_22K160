@interface SATVLanguageViewController
- (NSIndexPath)focusedIndexPath;
- (NSIndexPath)selectedIndexPath;
- (SATVInternationalUtility)internationalUtility;
- (SATVLanguageViewController)init;
- (SATVTableViewController)tableViewController;
- (id)completionHandler;
- (id)indexPathForPreferredFocusedViewInTableView:(id)a3;
- (id)preferredFocusEnvironments;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_buildTable;
- (void)_selectLanguage:(id)a3;
- (void)_updateLabelValue;
- (void)autoAdvance;
- (void)setCompletionHandler:(id)a3;
- (void)setFocusedIndexPath:(id)a3;
- (void)setInternationalUtility:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setTableViewController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SATVLanguageViewController

- (SATVLanguageViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVLanguageViewController;
  v2 = -[SATVLanguageViewController init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
    internationalUtility = v2->_internationalUtility;
    v2->_internationalUtility = (SATVInternationalUtility *)v3;
  }

  return v2;
}

- (void)autoAdvance
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController internationalUtility](self, "internationalUtility"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 orderedLanguageCodes]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  -[SATVLanguageViewController _selectLanguage:](self, "_selectLanguage:", v5);
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVLanguageViewController;
  -[SATVLanguageViewController viewDidLoad](&v9, "viewDidLoad");
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___SATVTableViewController);
  -[SATVLanguageViewController setTableViewController:](self, "setTableViewController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController tableViewController](self, "tableViewController"));
  -[SATVLanguageViewController tvsk_addChildViewController:](self, "tvsk_addChildViewController:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController tableViewController](self, "tableViewController"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 tableView]);
  [v6 setDelegate:self];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController tableViewController](self, "tableViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 tableView]);
  [v8 setDataSource:self];

  -[SATVLanguageViewController _buildTable](self, "_buildTable");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVLanguageViewController;
  -[SATVLanguageViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[SATVLanguageViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  2LL,  2LL);
}

- (void)viewDidLayoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___SATVLanguageViewController;
  -[SATVLanguageViewController viewDidLayoutSubviews](&v26, "viewDidLayoutSubviews");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController tableViewController](self, "tableViewController"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bannerView]);
  [v4 frame];
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController tableViewController](self, "tableViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 tableView]);
  [v12 frame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v27.origin.x = v14;
  v27.origin.y = v16;
  v27.size.width = v18;
  v27.size.height = v20;
  double MinX = CGRectGetMinX(v27);
  v28.origin.x = v14;
  v28.origin.y = v16;
  v28.size.width = v18;
  v28.size.height = v20;
  double v22 = MinX + floor(CGRectGetWidth(v28) * 0.5);
  v29.origin.x = v6;
  v29.origin.y = v8;
  v29.size.width = 1144.0;
  v29.size.height = v10;
  double v23 = v22 - floor(CGRectGetWidth(v29) * 0.5);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController tableViewController](self, "tableViewController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 bannerView]);
  objc_msgSend(v25, "setFrame:", v23, v8, 1144.0, v10);
}

- (id)preferredFocusEnvironments
{
  if (self->_tableViewController)
  {
    tableViewController = self->_tableViewController;
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &tableViewController,  1LL));
  }

  else
  {
    v2 = &__NSArray0__struct;
  }

  return v2;
}

- (void)_selectLanguage:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController internationalUtility](self, "internationalUtility"));
  CGFloat v6 = (void *)objc_claimAutoreleasedReturnValue([v5 languageCodeWithGuessedRegionForCode:v4]);

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController internationalUtility](self, "internationalUtility"));
  [v7 setUserSetSystemLanguageCode:v6];

  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
  unsigned __int8 v9 = [v8 commitLanguageWillRestartSystem];

  if ((v9 & 1) != 0)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100032B60;
    v13[3] = &unk_1000C9468;
    v13[4] = self;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v13,  &stru_1000CA100,  0.3);
  }

  else
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
    [v10 commitLanguage];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController completionHandler](self, "completionHandler"));
    if (v11)
    {
      v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[SATVLanguageViewController completionHandler]( self,  "completionHandler"));
      ((void (**)(void, id))v12)[2](v12, v4);
    }
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1LL;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController internationalUtility](self, "internationalUtility", a3, a4));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 orderedLanguageCodes]);
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 row];
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController internationalUtility](self, "internationalUtility"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 orderedLanguageCodes]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:v8]);

  v12 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVTableViewTextCell);
  double v13 = NSStringFromClass(v12);
  CGFloat v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  double v15 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithIdentifier:v14 forIndexPath:v6]);

  CGFloat v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController internationalUtility](self, "internationalUtility"));
  double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 languageCodesToLanguageStringsDictionary]);
  CGFloat v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v11]);

  double v19 = (void *)objc_claimAutoreleasedReturnValue([v15 textLabel]);
  [v19 setText:v18];

  return v15;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "nextFocusedIndexPath", a3));
  -[SATVLanguageViewController setFocusedIndexPath:](self, "setFocusedIndexPath:", v6);

  +[NSThread cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSThread,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_updateLabelValue",  0LL);
  -[SATVLanguageViewController performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_updateLabelValue",  0LL,  0.3);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  -[SATVLanguageViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController internationalUtility](self, "internationalUtility"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 orderedLanguageCodes]);
  id v8 = [v5 row];

  id v9 = (id)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v8]);
  -[SATVLanguageViewController _selectLanguage:](self, "_selectLanguage:", v9);
}

- (id)indexPathForPreferredFocusedViewInTableView:(id)a3
{
  id v4 = a3;
  [v4 layoutIfNeeded];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController selectedIndexPath](self, "selectedIndexPath"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController selectedIndexPath](self, "selectedIndexPath"));
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 indexPathsForVisibleRows]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
  }

  return v6;
}

- (void)_buildTable
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController tableViewController](self, "tableViewController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 tableView]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___SATVTableViewTextCell);
  id v6 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVTableViewTextCell);
  id v7 = NSStringFromClass(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v4 registerClass:v5 forCellReuseIdentifier:v8];

  double v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSLocale deviceLanguage](&OBJC_CLASS___NSLocale, "deviceLanguage"));
  if (-[__CFString isEqual:](v17, "isEqual:", @"pt"))
  {

    double v17 = @"pt-BR";
  }

  id v9 = -[SATVLanguageHeaderView initWithFrame:]( objc_alloc(&OBJC_CLASS___SATVLanguageHeaderView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController internationalUtility](self, "internationalUtility"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 languageHeaderStringForLanguageCode:v17]);
  -[SATVLanguageHeaderView setTitle:subtitle:languageCode:animated:]( v9,  "setTitle:subtitle:languageCode:animated:",  v11,  0LL,  v17,  0LL);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController tableViewController](self, "tableViewController"));
  [v12 setBannerView:v9];

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController tableViewController](self, "tableViewController"));
  [v13 setMaxBannerViewWidth:1144.0];

  CGFloat v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController tableViewController](self, "tableViewController"));
  [v14 setCustomContentTopInset:127.0];

  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController tableViewController](self, "tableViewController"));
  CGFloat v16 = (void *)objc_claimAutoreleasedReturnValue([v15 tableView]);
  [v16 reloadData];
}

- (void)_updateLabelValue
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController internationalUtility](self, "internationalUtility"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 orderedLanguageCodes]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController focusedIndexPath](self, "focusedIndexPath"));
  double v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v5, "row")));

  if (-[__CFString isEqual:](v10, "isEqual:", @"pt"))
  {

    double v10 = @"pt-BR";
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController internationalUtility](self, "internationalUtility"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 languageHeaderStringForLanguageCode:v10]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLanguageViewController tableViewController](self, "tableViewController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bannerView]);
  [v9 setTitle:v7 subtitle:0 languageCode:v10 animated:1];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (NSIndexPath)focusedIndexPath
{
  return self->_focusedIndexPath;
}

- (void)setFocusedIndexPath:(id)a3
{
}

- (SATVInternationalUtility)internationalUtility
{
  return self->_internationalUtility;
}

- (void)setInternationalUtility:(id)a3
{
}

- (SATVTableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end