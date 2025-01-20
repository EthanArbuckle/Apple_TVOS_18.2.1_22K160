@interface TVPSlideshowSettingsViewController
- (CGSize)_getAttributedTextSize:(id)a3 font:(id)a4 maxWidth:(double)a5;
- (NSArray)photoAssets;
- (NSArray)slideshowSettings;
- (NSArray)slideshowTransitionSettings;
- (NSDictionary)slideshowThemeSettings;
- (NSDictionary)slideshowTransitionMapping;
- (TVPSlideshowSettingsViewController)init;
- (TVPSlideshowSettingsViewController)initWithPhotoAssets:(id)a3;
- (TVPSlideshowUtilities)slideshowUtilities;
- (UILabel)slideshowLabel;
- (UILabel)transitionLabel;
- (UITableView)slideshowSettingsView;
- (UITableView)slideshowTransitionStyleView;
- (id)completionHandler;
- (id)preferredFocusEnvironments;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_handleMenuTap:(id)a3;
- (void)_initializeSlideshowSettings;
- (void)_slideshowThemeChanged:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)refreshPhotoAssets:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setPhotoAssets:(id)a3;
- (void)setSlideshowLabel:(id)a3;
- (void)setSlideshowSettings:(id)a3;
- (void)setSlideshowSettingsView:(id)a3;
- (void)setSlideshowThemeSettings:(id)a3;
- (void)setSlideshowTransitionMapping:(id)a3;
- (void)setSlideshowTransitionSettings:(id)a3;
- (void)setSlideshowTransitionStyleView:(id)a3;
- (void)setSlideshowUtilities:(id)a3;
- (void)setTransitionLabel:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation TVPSlideshowSettingsViewController

- (TVPSlideshowSettingsViewController)initWithPhotoAssets:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVPSlideshowSettingsViewController;
  v6 = -[TVPSlideshowSettingsViewController init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    if (!v5) {
      sub_100079AC0();
    }
    objc_storeStrong((id *)&v6->_photoAssets, a3);
    -[TVPSlideshowSettingsViewController _initializeSlideshowSettings](v7, "_initializeSlideshowSettings");
  }

  return v7;
}

- (TVPSlideshowSettingsViewController)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPSlideshowSettingsViewController.m",  90,  @"%s is not available as initializer",  "-[TVPSlideshowSettingsViewController init]");

  abort();
}

- (void)refreshPhotoAssets:(id)a3
{
  id v4 = a3;
  if (!v4) {
    sub_100079AE8();
  }
  id v7 = v4;
  id v5 = (NSArray *)[v4 copy];
  photoAssets = self->_photoAssets;
  self->_photoAssets = v5;
}

- (void)loadView
{
  v3 = objc_alloc(&OBJC_CLASS___UIView);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v4 bounds];
  v6 = -[UIView initWithFrame:](v3, "initWithFrame:");

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v5);

  -[TVPSlideshowSettingsViewController setView:](self, "setView:", v6);
}

- (void)_handleMenuTap:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView superview](self->_slideshowTransitionStyleView, "superview", a3));

  if (v4)
  {
    slideshowTransitionStyleView = self->_slideshowTransitionStyleView;
    slideshowSettingsView = self->_slideshowSettingsView;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000168B8;
    v9[3] = &unk_1000C9680;
    v9[4] = self;
    +[UIView transitionFromView:toView:duration:options:completion:]( &OBJC_CLASS___UIView,  "transitionFromView:toView:duration:options:completion:",  slideshowTransitionStyleView,  slideshowSettingsView,  0LL,  v9,  0.1);
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVPSlideshowSettingsViewController navigationController](self, "navigationController"));
    id v7 = [v8 popViewControllerAnimated:1];
  }

- (void)viewDidLoad
{
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___TVPSlideshowSettingsViewController;
  -[TVPSlideshowSettingsViewController viewDidLoad](&v47, "viewDidLoad");
  v46 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleMenuTap:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v46, "setAllowedPressTypes:", &off_1000D1AF8);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowSettingsViewController view](self, "view"));
  [v3 addGestureRecognizer:v46];

  id v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
  slideshowLabel = self->_slideshowLabel;
  self->_slideshowLabel = v4;

  v6 = self->_slideshowLabel;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title3Font](&OBJC_CLASS___TVPThemeManager, "title3Font"));
  -[UILabel setFont:](v6, "setFont:", v7);

  -[UILabel setNumberOfLines:](self->_slideshowLabel, "setNumberOfLines:", 1LL);
  id v8 = self->_slideshowLabel;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

  v10 = self->_slideshowLabel;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"SlideshowHeader" value:&stru_1000CC6C8 table:0]);
  -[UILabel setText:](v10, "setText:", v12);

  -[UILabel setTextAlignment:](self->_slideshowLabel, "setTextAlignment:", 1LL);
  v13 = objc_alloc_init(&OBJC_CLASS___UILabel);
  transitionLabel = self->_transitionLabel;
  self->_transitionLabel = v13;

  v15 = self->_transitionLabel;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title3Font](&OBJC_CLASS___TVPThemeManager, "title3Font"));
  -[UILabel setFont:](v15, "setFont:", v16);

  -[UILabel setNumberOfLines:](self->_transitionLabel, "setNumberOfLines:", 1LL);
  v17 = self->_transitionLabel;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v17, "setBackgroundColor:", v18);

  v19 = self->_transitionLabel;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedStringForKey:@"Transitions" value:&stru_1000CC6C8 table:0]);
  -[UILabel setText:](v19, "setText:", v21);

  -[UILabel setTextAlignment:](self->_transitionLabel, "setTextAlignment:", 1LL);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_slideshowLabel, "text"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title3Font](&OBJC_CLASS___TVPThemeManager, "title3Font"));
  -[TVPSlideshowSettingsViewController _getAttributedTextSize:font:maxWidth:]( self,  "_getAttributedTextSize:font:maxWidth:",  v22,  v23,  1000.0);
  double v25 = v24;
  double v27 = v26;

  -[UILabel setFrame:](self->_slideshowLabel, "setFrame:", floor((1000.0 - v25) * 0.5) + 460.0, 0.0, v25, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_transitionLabel, "text"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title3Font](&OBJC_CLASS___TVPThemeManager, "title3Font"));
  -[TVPSlideshowSettingsViewController _getAttributedTextSize:font:maxWidth:]( self,  "_getAttributedTextSize:font:maxWidth:",  v28,  v29,  1000.0);
  double v31 = v30;
  double v33 = v32;

  -[UILabel setFrame:](self->_transitionLabel, "setFrame:", floor((1000.0 - v31) * 0.5) + 460.0, 0.0, v31, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowSettingsViewController view](self, "view"));
  [v34 bounds];
  double v36 = v35 + -93.0;

  v37 = -[UITableView initWithFrame:style:]( objc_alloc(&OBJC_CLASS___UITableView),  "initWithFrame:style:",  0LL,  460.0,  93.0,  1000.0,  v36);
  slideshowSettingsView = self->_slideshowSettingsView;
  self->_slideshowSettingsView = v37;

  -[UITableView setDataSource:](self->_slideshowSettingsView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_slideshowSettingsView, "setDelegate:", self);
  -[UITableView setAutoresizingMask:](self->_slideshowSettingsView, "setAutoresizingMask:", 18LL);
  v39 = self->_slideshowSettingsView;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](v39, "setBackgroundColor:", v40);

  -[UITableView setSeparatorStyle:](self->_slideshowSettingsView, "setSeparatorStyle:", 0LL);
  -[UITableView setTableHeaderView:](self->_slideshowSettingsView, "setTableHeaderView:", self->_slideshowLabel);
  -[UITableView setRemembersLastFocusedIndexPath:]( self->_slideshowSettingsView,  "setRemembersLastFocusedIndexPath:",  1LL);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowSettingsViewController view](self, "view"));
  [v41 addSubview:self->_slideshowSettingsView];

  v42 = -[UITableView initWithFrame:style:]( objc_alloc(&OBJC_CLASS___UITableView),  "initWithFrame:style:",  0LL,  460.0,  93.0,  1000.0,  v36);
  slideshowTransitionStyleView = self->_slideshowTransitionStyleView;
  self->_slideshowTransitionStyleView = v42;

  -[UITableView setDataSource:](self->_slideshowTransitionStyleView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_slideshowTransitionStyleView, "setDelegate:", self);
  -[UITableView setAutoresizingMask:](self->_slideshowTransitionStyleView, "setAutoresizingMask:", 18LL);
  v44 = self->_slideshowTransitionStyleView;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](v44, "setBackgroundColor:", v45);

  -[UITableView setSeparatorStyle:](self->_slideshowTransitionStyleView, "setSeparatorStyle:", 0LL);
  -[UITableView setTableHeaderView:](self->_slideshowTransitionStyleView, "setTableHeaderView:", self->_transitionLabel);
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPSlideshowSettingsViewController;
  -[TVPSlideshowSettingsViewController dealloc](&v4, "dealloc");
}

- (id)preferredFocusEnvironments
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView superview](self->_slideshowSettingsView, "superview"));

  if (v3)
  {
    slideshowSettingsView = self->_slideshowSettingsView;
    p_slideshowSettingsView = &slideshowSettingsView;
  }

  else
  {
    if (!self->_slideshowTransitionStyleView) {
      return &__NSArray0__struct;
    }
    slideshowTransitionStyleView = self->_slideshowTransitionStyleView;
    p_slideshowSettingsView = &slideshowTransitionStyleView;
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  p_slideshowSettingsView,  1LL));
}

- (void)_slideshowThemeChanged:(id)a3
{
  id v26 = (id)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:@"theme"]);
  if (([v4 isEqualToString:TVScreenSaverStyleKenBurns] & 1) == 0
    && ![v4 isEqualToString:TVScreenSaverStyleClassic])
  {
    id v6 = -[NSArray copy](self->_slideshowSettings, "copy");
    id v7 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v6));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 localizedStringForKey:@"TimePerSlide" value:&stru_1000CC6C8 table:0]);
    unsigned int v18 = -[NSArray containsObject:](v7, "containsObject:", v17);

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"TimePerSlide" value:&stru_1000CC6C8 table:0]);
      -[NSArray removeObject:](v7, "removeObject:", v20);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 localizedStringForKey:@"Transition" value:&stru_1000CC6C8 table:0]);
    unsigned int v23 = -[NSArray containsObject:](v7, "containsObject:", v22);

    if (v23)
    {
      double v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      double v25 = (void *)objc_claimAutoreleasedReturnValue([v24 localizedStringForKey:@"Transition" value:&stru_1000CC6C8 table:0]);
      -[NSArray removeObject:](v7, "removeObject:", v25);
    }

    else if (!v18)
    {
      goto LABEL_12;
    }

    objc_storeStrong((id *)&self->_slideshowSettings, v7);
    goto LABEL_12;
  }

  slideshowSettings = self->_slideshowSettings;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v7 = (NSArray *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"TimePerSlide" value:&stru_1000CC6C8 table:0]);
  if (-[NSArray containsObject:](slideshowSettings, "containsObject:", v7))
  {
LABEL_12:

    goto LABEL_13;
  }

  id v8 = self->_slideshowSettings;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:@"Transition" value:&stru_1000CC6C8 table:0]);
  LOBYTE(v8) = -[NSArray containsObject:](v8, "containsObject:", v10);

  if ((v8 & 1) == 0)
  {
    id v6 = -[NSArray copy](self->_slideshowSettings, "copy");
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v6));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedStringForKey:@"TimePerSlide" value:&stru_1000CC6C8 table:0]);
    -[NSArray addObject:](v11, "addObject:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedStringForKey:@"Transition" value:&stru_1000CC6C8 table:0]);
    -[NSArray addObject:](v11, "addObject:", v15);

    id v7 = self->_slideshowSettings;
    self->_slideshowSettings = v11;
    goto LABEL_12;
  }

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_slideshowSettingsView == a3) {
    return 2LL;
  }
  else {
    return 1LL;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = (UITableView *)a3;
  id v7 = v6;
  if (a4 == 1)
  {
    objc_super v9 = &OBJC_IVAR___TVPSlideshowSettingsViewController__slideshowSettings;
LABEL_8:
    int64_t v8 = (int64_t)[*(id *)((char *)&self->super.super.super.isa + *v9) count];
    goto LABEL_9;
  }

  if (a4)
  {
    int64_t v8 = 0LL;
    goto LABEL_9;
  }

  if (self->_slideshowTransitionStyleView == v6)
  {
    objc_super v9 = &OBJC_IVAR___TVPSlideshowSettingsViewController__slideshowTransitionSettings;
    goto LABEL_8;
  }

  int64_t v8 = 1LL;
LABEL_9:

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle", a3));
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"Settings" value:&stru_1000CC6C8 table:0]);
  }

  else
  {
    id v5 = &stru_1000CC6C8;
  }

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = (UITableView *)a3;
  id v7 = a4;
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedSlideshowPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedSlideshowPreferences"));
  objc_super v9 = (UITableViewCell *)objc_claimAutoreleasedReturnValue( -[UITableView dequeueReusableCellWithIdentifier:]( v6,  "dequeueReusableCellWithIdentifier:",  @"tableViewCellReuseIdentifier"));
  if (!v9) {
    objc_super v9 = -[UITableViewCell initWithStyle:reuseIdentifier:]( objc_alloc(&OBJC_CLASS___UITableViewCell),  "initWithStyle:reuseIdentifier:",  1LL,  @"tableViewCellReuseIdentifier");
  }
  id v10 = [v7 section];
  if (v10 == (id)1)
  {
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_slideshowSettings, "objectAtIndex:", [v7 row]));
    switch((unint64_t)[v7 row])
    {
      case 0uLL:
        unsigned __int8 v15 = [v8 shufflePhotos];
        goto LABEL_16;
      case 1uLL:
        unsigned __int8 v15 = [v8 repeatPhotos];
LABEL_16:
        unsigned __int8 v20 = v15;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v11 = v21;
        if ((v20 & 1) != 0) {
          v22 = @"On";
        }
        else {
          v22 = @"Off";
        }
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v21 localizedStringForKey:v22 value:&stru_1000CC6C8 table:0]);
        goto LABEL_25;
      case 2uLL:
        v11 = (void *)objc_claimAutoreleasedReturnValue([v8 slideshowStyle]);
        uint64_t v23 = 3LL;
        goto LABEL_21;
      case 3uLL:
        v11 = (void *)objc_opt_new(&OBJC_CLASS___NSDateComponentsFormatter, v14);
        [v11 setUnitsStyle:3];
        [v11 setAllowedUnits:128];
        uint64_t v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringFromTimeInterval:", (double)(uint64_t)objc_msgSend(v8, "timePerSlide")));
        goto LABEL_22;
      case 4uLL:
        v11 = (void *)objc_claimAutoreleasedReturnValue([v8 slideshowTransitionStyle]);
        uint64_t v23 = 4LL;
LABEL_21:
        uint64_t v24 = objc_claimAutoreleasedReturnValue(-[objc_class objectForKey:]((&self->super.super.super.isa)[v23], "objectForKey:", v11));
LABEL_22:
        v12 = (__CFString *)v24;
        uint64_t v16 = 1LL;
        goto LABEL_26;
      default:
        uint64_t v16 = 0LL;
        v12 = &stru_1000CC6C8;
        goto LABEL_27;
    }
  }

  if (v10)
  {
    uint64_t v16 = 0LL;
    v12 = &stru_1000CC6C8;
    v13 = &stru_1000CC6C8;
  }

  else
  {
    if (self->_slideshowTransitionStyleView == v6)
    {
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndex:]( self->_slideshowTransitionSettings,  "objectAtIndex:",  [v7 row]));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v8 slideshowThemeTransitionSettings]);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v7, "row")));

      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v8 slideshowTransitionStyle]);
      unsigned int v19 = [v11 isEqualToString:v18];

      if (v19) {
        uint64_t v16 = 3LL;
      }
      else {
        uint64_t v16 = 0LL;
      }
      v12 = &stru_1000CC6C8;
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v12 = &stru_1000CC6C8;
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"StartSlideshow" value:&stru_1000CC6C8 table:0]);
LABEL_25:
      uint64_t v16 = 0LL;
    }

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = (UITableView *)a3;
  id v7 = a4;
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedSlideshowPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedSlideshowPreferences"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView cellForRowAtIndexPath:](v6, "cellForRowAtIndexPath:", v7));
  id v10 = [v7 section];
  if (v10 == (id)1)
  {
    switch((unint64_t)[v7 row])
    {
      case 0uLL:
        if ([v8 shufflePhotos])
        {
          [v8 setShufflePhotos:0];
          goto LABEL_15;
        }

        [v8 setShufflePhotos:1];
        goto LABEL_27;
      case 1uLL:
        if ([v8 repeatPhotos])
        {
          [v8 setRepeatPhotos:0];
LABEL_15:
          unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v9 detailTextLabel]);
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
          v22 = v21;
          uint64_t v23 = @"Off";
        }

        else
        {
          [v8 setRepeatPhotos:1];
LABEL_27:
          unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v9 detailTextLabel]);
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
          v22 = v21;
          uint64_t v23 = @"On";
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue([v21 localizedStringForKey:v23 value:&stru_1000CC6C8 table:0]);
        [v20 setText:v29];

        break;
      case 2uLL:
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowSettingsViewController photoAssets](self, "photoAssets"));
        id v25 = [v24 count];

        if (v25) {
          uint64_t v14 = -[TVPSlideshowMarimbaViewController initWithPhotoAssets:displayThemeOptions:]( objc_alloc(&OBJC_CLASS___TVPSlideshowMarimbaViewController),  "initWithPhotoAssets:displayThemeOptions:",  self->_photoAssets,  1LL);
        }
        else {
          uint64_t v14 = 0LL;
        }
        double v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowSettingsViewController completionHandler](self, "completionHandler"));

        if (v30)
        {
          double v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowSettingsViewController completionHandler](self, "completionHandler"));
          -[TVPSlideshowMarimbaViewController setCompletionHandler:](v14, "setCompletionHandler:", v31);
        }

        double v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowSettingsViewController navigationController](self, "navigationController"));
        [v32 pushViewController:v14 animated:1];

        double v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v33 addObserver:self selector:"_slideshowThemeChanged:" name:@"TVSlideshowThemeChangedNotification" object:v14];

        goto LABEL_33;
      case 3uLL:
        uint64_t v14 = (TVPSlideshowMarimbaViewController *)objc_claimAutoreleasedReturnValue( -[TVPSlideshowUtilities alertControllerDisplayingTimePerSlideOptionsForCell:]( self->_slideshowUtilities,  "alertControllerDisplayingTimePerSlideOptionsForCell:",  v9));
        -[TVPSlideshowSettingsViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v14,  1LL,  0LL);
        goto LABEL_33;
      case 4uLL:
        slideshowSettingsView = self->_slideshowSettingsView;
        slideshowTransitionStyleView = self->_slideshowTransitionStyleView;
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472LL;
        v34[2] = sub_100017B8C;
        v34[3] = &unk_1000C9680;
        v34[4] = self;
        unsigned int v19 = v34;
        goto LABEL_20;
      default:
        break;
    }
  }

  else if (!v10)
  {
    if (self->_slideshowSettingsView == v6)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowSettingsViewController photoAssets](self, "photoAssets"));
      id v13 = [v12 count];

      if (v13) {
        uint64_t v14 = -[TVPSlideshowMarimbaViewController initWithPhotoAssets:]( objc_alloc(&OBJC_CLASS___TVPSlideshowMarimbaViewController),  "initWithPhotoAssets:",  self->_photoAssets);
      }
      else {
        uint64_t v14 = 0LL;
      }
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowSettingsViewController completionHandler](self, "completionHandler"));

      if (v26)
      {
        double v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowSettingsViewController completionHandler](self, "completionHandler"));
        -[TVPSlideshowMarimbaViewController setCompletionHandler:](v14, "setCompletionHandler:", v27);
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowSettingsViewController navigationController](self, "navigationController"));
      [v28 pushViewController:v14 animated:1];

LABEL_33:
    }

    else
    {
      id v11 = [v9 accessoryType];
      if (!v11)
      {
        unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v8 slideshowThemeTransitionSettings]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v7, "row")));
        [v8 setSlideshowTransitionStyle:v16];

        -[UITableView reloadData](self->_slideshowTransitionStyleView, "reloadData");
      }

      slideshowSettingsView = self->_slideshowTransitionStyleView;
      slideshowTransitionStyleView = self->_slideshowSettingsView;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_100017B44;
      v35[3] = &unk_1000CA0A0;
      v35[4] = self;
      BOOL v36 = v11 == 0LL;
      unsigned int v19 = v35;
LABEL_20:
      +[UIView transitionFromView:toView:duration:options:completion:]( &OBJC_CLASS___UIView,  "transitionFromView:toView:duration:options:completion:",  slideshowSettingsView,  slideshowTransitionStyleView,  0LL,  v19,  0.1);
    }
  }

  -[UITableView deselectRowAtIndexPath:animated:](v6, "deselectRowAtIndexPath:animated:", v7, 0LL);
}

- (CGSize)_getAttributedTextSize:(id)a3 font:(id)a4 maxWidth:(double)a5
{
  id v7 = a3;
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  a4,  NSFontAttributeName,  0LL));
  objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a5, 1.79769313e308);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_initializeSlideshowSettings
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedSlideshowPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedSlideshowPreferences"));
  objc_super v4 = -[TVPSlideshowUtilities initWithMarimbaMode:]( objc_alloc(&OBJC_CLASS___TVPSlideshowUtilities),  "initWithMarimbaMode:",  0LL);
  slideshowUtilities = self->_slideshowUtilities;
  self->_slideshowUtilities = v4;

  v89 = v3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 slideshowStyle]);
  id v7 = &ACAccountStoreDidChangeNotification_ptr;
  v85 = v6;
  v88 = self;
  if (([v6 isEqualToString:TVScreenSaverStyleKenBurns] & 1) != 0
    || [v6 isEqualToString:TVScreenSaverStyleClassic])
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    int64_t v8 = self;
    uint64_t v82 = objc_claimAutoreleasedReturnValue([v86 localizedStringForKey:@"ShufflePhotos" value:&stru_1000CC6C8 table:0]);
    v93[0] = v82;
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:@"RepeatPhotos" value:&stru_1000CC6C8 table:0]);
    v93[1] = v10;
    double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:@"Theme" value:&stru_1000CC6C8 table:0]);
    v93[2] = v12;
    double v13 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    double v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray localizedStringForKey:value:table:]( v13,  "localizedStringForKey:value:table:",  @"TimePerSlide",  &stru_1000CC6C8,  0LL));
    v93[3] = v14;
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedStringForKey:@"Transition" value:&stru_1000CC6C8 table:0]);
    v93[4] = v16;
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v93, 5LL));
    slideshowSettings = v8->_slideshowSettings;
    v8->_slideshowSettings = (NSArray *)v17;
    unsigned int v19 = v86;
    unsigned __int8 v20 = (void *)v82;

    id v7 = &ACAccountStoreDidChangeNotification_ptr;
  }

  else
  {
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"ShufflePhotos" value:&stru_1000CC6C8 table:0]);
    v92[0] = v20;
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:@"RepeatPhotos" value:&stru_1000CC6C8 table:0]);
    v92[1] = v10;
    double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:@"Theme" value:&stru_1000CC6C8 table:0]);
    v92[2] = v12;
    v21 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v92, 3LL));
    double v13 = self->_slideshowSettings;
    self->_slideshowSettings = v21;
  }

  v83 = (void *)objc_claimAutoreleasedReturnValue([(id)v7[102] mainBundle]);
  v80 = (void *)objc_claimAutoreleasedReturnValue( [v83 localizedStringForKey:@"SlideshowThemeRandom" value:&stru_1000CC6C8 table:0]);
  v91[0] = v80;
  v78 = (void *)objc_claimAutoreleasedReturnValue([(id)v7[102] mainBundle]);
  v76 = (void *)objc_claimAutoreleasedReturnValue( [v78 localizedStringForKey:@"SlideshowThemeCoverCascade" value:&stru_1000CC6C8 table:0]);
  v91[1] = v76;
  v74 = (void *)objc_claimAutoreleasedReturnValue([(id)v7[102] mainBundle]);
  v72 = (void *)objc_claimAutoreleasedReturnValue( [v74 localizedStringForKey:@"SlideshowThemeFlipup" value:&stru_1000CC6C8 table:0]);
  v91[2] = v72;
  v70 = (void *)objc_claimAutoreleasedReturnValue([(id)v7[102] mainBundle]);
  v68 = (void *)objc_claimAutoreleasedReturnValue( [v70 localizedStringForKey:@"SlideshowThemeFloating" value:&stru_1000CC6C8 table:0]);
  v91[3] = v68;
  v66 = (void *)objc_claimAutoreleasedReturnValue([(id)v7[102] mainBundle]);
  v64 = (void *)objc_claimAutoreleasedReturnValue( [v66 localizedStringForKey:@"SlideshowThemeOrigami" value:&stru_1000CC6C8 table:0]);
  v91[4] = v64;
  v62 = (void *)objc_claimAutoreleasedReturnValue([(id)v7[102] mainBundle]);
  v60 = (void *)objc_claimAutoreleasedReturnValue( [v62 localizedStringForKey:@"SlideshowThemeReflections" value:&stru_1000CC6C8 table:0]);
  v91[5] = v60;
  v58 = (void *)objc_claimAutoreleasedReturnValue([(id)v7[102] mainBundle]);
  v56 = (void *)objc_claimAutoreleasedReturnValue( [v58 localizedStringForKey:@"SlideshowThemeShiftingTiles" value:&stru_1000CC6C8 table:0]);
  v91[6] = v56;
  v54 = (void *)objc_claimAutoreleasedReturnValue([(id)v7[102] mainBundle]);
  v52 = (void *)objc_claimAutoreleasedReturnValue( [v54 localizedStringForKey:@"SlideshowThemeShrinkingTiles" value:&stru_1000CC6C8 table:0]);
  v91[7] = v52;
  v22 = v7;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([(id)v7[102] mainBundle]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( [v23 localizedStringForKey:@"SlideshowThemeSlidingPanels" value:&stru_1000CC6C8 table:0]);
  v91[8] = v24;
  id v25 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[102] mainBundle]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue( [v25 localizedStringForKey:@"SlideshowThemeSnapshots" value:&stru_1000CC6C8 table:0]);
  v91[9] = v26;
  double v27 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[102] mainBundle]);
  v28 = (void *)objc_claimAutoreleasedReturnValue( [v27 localizedStringForKey:@"SlideshowThemeKenBurns" value:&stru_1000CC6C8 table:0]);
  v91[10] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[102] mainBundle]);
  double v30 = (void *)objc_claimAutoreleasedReturnValue( [v29 localizedStringForKey:@"SlideshowThemeClassic" value:&stru_1000CC6C8 table:0]);
  v91[11] = v30;
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v91, 12LL));

  double v31 = (void *)objc_claimAutoreleasedReturnValue([v89 slideshowThemeSettings]);
  uint64_t v32 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:",  v87,  v31));
  slideshowThemeSettings = v88->_slideshowThemeSettings;
  v88->_slideshowThemeSettings = (NSDictionary *)v32;

  v84 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[102] mainBundle]);
  v81 = (void *)objc_claimAutoreleasedReturnValue( [v84 localizedStringForKey:@"SlideshowTransitionRandom" value:&stru_1000CC6C8 table:0]);
  v90[0] = v81;
  v79 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[102] mainBundle]);
  v77 = (void *)objc_claimAutoreleasedReturnValue( [v79 localizedStringForKey:@"SlideshowTransitionCube" value:&stru_1000CC6C8 table:0]);
  v90[1] = v77;
  v75 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[102] mainBundle]);
  v73 = (void *)objc_claimAutoreleasedReturnValue( [v75 localizedStringForKey:@"SlideshowTransitionDissolve" value:&stru_1000CC6C8 table:0]);
  v90[2] = v73;
  v71 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[102] mainBundle]);
  v69 = (void *)objc_claimAutoreleasedReturnValue( [v71 localizedStringForKey:@"SlideshowTransitionDroplet" value:&stru_1000CC6C8 table:0]);
  v90[3] = v69;
  v67 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[102] mainBundle]);
  v65 = (void *)objc_claimAutoreleasedReturnValue( [v67 localizedStringForKey:@"SlideshowTransitionFadeBlack" value:&stru_1000CC6C8 table:0]);
  v90[4] = v65;
  v63 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[102] mainBundle]);
  v61 = (void *)objc_claimAutoreleasedReturnValue( [v63 localizedStringForKey:@"SlideshowTransitionFadeWhite" value:&stru_1000CC6C8 table:0]);
  v90[5] = v61;
  v59 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[102] mainBundle]);
  v57 = (void *)objc_claimAutoreleasedReturnValue( [v59 localizedStringForKey:@"SlideshowTransitionFlip" value:&stru_1000CC6C8 table:0]);
  v90[6] = v57;
  v55 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[102] mainBundle]);
  v53 = (void *)objc_claimAutoreleasedReturnValue( [v55 localizedStringForKey:@"SlideshowTransitionMoveIn" value:&stru_1000CC6C8 table:0]);
  v90[7] = v53;
  v51 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[102] mainBundle]);
  v50 = (void *)objc_claimAutoreleasedReturnValue( [v51 localizedStringForKey:@"SlideshowTransitionPageFlip" value:&stru_1000CC6C8 table:0]);
  v90[8] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[102] mainBundle]);
  v48 = (void *)objc_claimAutoreleasedReturnValue( [v49 localizedStringForKey:@"SlideshowTransitionPush" value:&stru_1000CC6C8 table:0]);
  v90[9] = v48;
  v34 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[102] mainBundle]);
  double v35 = (void *)objc_claimAutoreleasedReturnValue( [v34 localizedStringForKey:@"SlideshowTransitionReveal" value:&stru_1000CC6C8 table:0]);
  v90[10] = v35;
  BOOL v36 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[102] mainBundle]);
  v37 = (void *)objc_claimAutoreleasedReturnValue( [v36 localizedStringForKey:@"SlideshowTransitionMosaicFlip" value:&stru_1000CC6C8 table:0]);
  v90[11] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[102] mainBundle]);
  v39 = (void *)objc_claimAutoreleasedReturnValue( [v38 localizedStringForKey:@"SlideshowTransitionTwirl" value:&stru_1000CC6C8 table:0]);
  v90[12] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[102] mainBundle]);
  v41 = (void *)objc_claimAutoreleasedReturnValue( [v40 localizedStringForKey:@"SlideshowTransitionWipe" value:&stru_1000CC6C8 table:0]);
  v90[13] = v41;
  uint64_t v42 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v90, 14LL));
  slideshowTransitionSettings = v88->_slideshowTransitionSettings;
  v88->_slideshowTransitionSettings = (NSArray *)v42;

  v44 = v88->_slideshowTransitionSettings;
  v45 = (void *)objc_claimAutoreleasedReturnValue([v89 slideshowThemeTransitionSettings]);
  uint64_t v46 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:",  v44,  v45));
  slideshowTransitionMapping = v88->_slideshowTransitionMapping;
  v88->_slideshowTransitionMapping = (NSDictionary *)v46;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSArray)slideshowSettings
{
  return self->_slideshowSettings;
}

- (void)setSlideshowSettings:(id)a3
{
}

- (NSDictionary)slideshowThemeSettings
{
  return self->_slideshowThemeSettings;
}

- (void)setSlideshowThemeSettings:(id)a3
{
}

- (NSDictionary)slideshowTransitionMapping
{
  return self->_slideshowTransitionMapping;
}

- (void)setSlideshowTransitionMapping:(id)a3
{
}

- (NSArray)slideshowTransitionSettings
{
  return self->_slideshowTransitionSettings;
}

- (void)setSlideshowTransitionSettings:(id)a3
{
}

- (NSArray)photoAssets
{
  return self->_photoAssets;
}

- (void)setPhotoAssets:(id)a3
{
}

- (TVPSlideshowUtilities)slideshowUtilities
{
  return self->_slideshowUtilities;
}

- (void)setSlideshowUtilities:(id)a3
{
}

- (UITableView)slideshowSettingsView
{
  return self->_slideshowSettingsView;
}

- (void)setSlideshowSettingsView:(id)a3
{
}

- (UITableView)slideshowTransitionStyleView
{
  return self->_slideshowTransitionStyleView;
}

- (void)setSlideshowTransitionStyleView:(id)a3
{
}

- (UILabel)slideshowLabel
{
  return self->_slideshowLabel;
}

- (void)setSlideshowLabel:(id)a3
{
}

- (UILabel)transitionLabel
{
  return self->_transitionLabel;
}

- (void)setTransitionLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end