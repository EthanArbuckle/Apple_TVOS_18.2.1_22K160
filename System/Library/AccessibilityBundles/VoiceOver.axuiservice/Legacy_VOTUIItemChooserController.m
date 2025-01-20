@interface Legacy_VOTUIItemChooserController
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)hostingWindowShouldMoveForReachability;
- (BOOL)textFieldShouldReturn:(id)a3;
- (Legacy_VOTUIItemChooserDelegate)delegate;
- (double)_positionAccountingForKeyboard:(CGRect)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_constraintsToPositionItem:(id)a3 identicallyToItem:(id)a4;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_displayWithList:(id)a3 fromRotorSwitch:(BOOL)a4;
- (void)_handleSearchFieldTextChange:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_loadGuidedAccessBundle;
- (void)_updateGuidedAccessWindowId:(unsigned int)a3;
- (void)_updatePositionForKeyboard:(CGRect)a3;
- (void)_updateSelectedRow:(id)a3;
- (void)consumeSinglePressUpForButtonKind:(int64_t)a3;
- (void)hideItemChooser:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)showItemChooser:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation Legacy_VOTUIItemChooserController

- (void)viewDidLoad
{
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___Legacy_VOTUIItemChooserController;
  -[Legacy_VOTUIItemChooserController viewDidLoad](&v43, "viewDidLoad");
  v3 = objc_alloc(&OBJC_CLASS___UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[UIView initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 18LL);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[Legacy_VOTUIItemChooserController view](self, "view"));
  [v8 addSubview:v7];

  v9 = -[_UIBackdropView initWithPrivateStyle:]( objc_alloc(&OBJC_CLASS____UIBackdropView),  "initWithPrivateStyle:",  2030LL);
  backdropView = self->_backdropView;
  self->_backdropView = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_UIBackdropView layer](self->_backdropView, "layer"));
  [v11 setCornerRadius:10.0];

  -[UIView addSubview:](v7, "addSubview:", self->_backdropView);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v12 addObserver:self selector:"_handleSearchFieldTextChange:" name:UITextFieldTextDidChangeNotification object:0];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v13 addObserver:self selector:"_keyboardWillShow:" name:UIKeyboardWillShowNotification object:0];

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v14 addObserver:self selector:"_keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];

  v15 = (UILabel *)objc_msgSend( objc_allocWithZone(UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  headingLabel = self->_headingLabel;
  self->_headingLabel = v15;

  -[UILabel setTag:](self->_headingLabel, "setTag:", 1010LL);
  v17 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___Legacy_VOTUIItemChooserController));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"VoiceOverItemChooser" value:&stru_253B8 table:@"VoiceOverUIService"]);
  -[UILabel setText:](self->_headingLabel, "setText:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UILabel setTextColor:](self->_headingLabel, "setTextColor:", v20);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_headingLabel, "setAdjustsFontForContentSizeCategory:", 1LL);
  -[UILabel setTextAlignment:](self->_headingLabel, "setTextAlignment:", 1LL);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:compatibleWithTraitCollection:",  UIFontTextStyleTitle2,  0LL));
  -[UILabel setFont:](self->_headingLabel, "setFont:", v21);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_headingLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UILabel setAccessibilityTraits:]( self->_headingLabel,  "setAccessibilityTraits:",  UIAccessibilityTraitSummaryElement | UIAccessibilityTraitHeader | kAXIgnoreItemChooserTrait);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_headingLabel, "setBackgroundColor:", v22);

  -[UIView addSubview:](v7, "addSubview:", self->_headingLabel);
  v23 = -[UITableView initWithFrame:style:]( objc_alloc(&OBJC_CLASS___UITableView),  "initWithFrame:style:",  0LL,  CGRectZero.origin.x,  y,  width,  height);
  table = self->_table;
  self->_table = v23;

  -[UITableView setRowHeight:](self->_table, "setRowHeight:", UITableViewAutomaticDimension);
  -[UITableView setEstimatedRowHeight:](self->_table, "setEstimatedRowHeight:", 100.0);
  -[UITableView setDelegate:](self->_table, "setDelegate:", self);
  -[UITableView setSeparatorStyle:](self->_table, "setSeparatorStyle:", 1LL);
  -[UITableView setDataSource:](self->_table, "setDataSource:", self);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](self->_table, "setBackgroundColor:", v25);

  -[UITableView setClipsToBounds:](self->_table, "setClipsToBounds:", 1LL);
  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:]( self->_table,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v26 = self->_table;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UITableView _setSectionIndexColor:](v26, "_setSectionIndexColor:", v27);

  -[UITableView registerClass:forCellReuseIdentifier:]( self->_table,  "registerClass:forCellReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___UITableViewCell),  @"TableViewCell");
  -[UIView addSubview:](v7, "addSubview:", self->_table);
  v28 = (NSMutableArray *)[objc_allocWithZone(NSMutableArray) init];
  filteredList = self->_filteredList;
  self->_filteredList = v28;

  v30 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  items = self->_items;
  self->_items = v30;

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[Legacy_VOTUIItemChooserController view](self, "view"));
  v34 = (void *)objc_claimAutoreleasedReturnValue( -[Legacy_VOTUIItemChooserController _constraintsToPositionItem:identicallyToItem:]( self,  "_constraintsToPositionItem:identicallyToItem:",  v7,  v33));
  [v32 addObjectsFromArray:v34];

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_headingLabel,  3LL,  0LL,  v7,  3LL,  1.0,  15.0));
  [v35 setActive:1];

  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_headingLabel,  7LL,  0LL,  v7,  7LL,  0.9,  0.0));
  [v36 setActive:1];

  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_headingLabel,  9LL,  0LL,  v7,  9LL,  1.0,  0.0));
  [v37 setActive:1];

  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_table,  3LL,  0LL,  self->_headingLabel,  4LL,  1.0,  10.0));
  [v38 setActive:1];

  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_table,  7LL,  0LL,  v7,  7LL,  0.9,  0.0));
  [v39 setActive:1];

  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_table,  9LL,  0LL,  v7,  9LL,  1.0,  0.0));
  [v40 setActive:1];

  v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_table,  4LL,  0LL,  v7,  4LL,  1.0,  0.0));
  [v41 setActive:1];

  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_backdropView,  3LL,  0LL,  v7,  4LL,  1.0,  0.0));
  [v42 setActive:1];
}

- (id)_constraintsToPositionItem:(id)a3 identicallyToItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = [&off_25B78 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(&off_25B78);
        }
        id v12 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v11) integerValue];
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  v12,  0LL,  v6,  v12,  1.0,  0.0));
        [v7 addObject:v13];

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [&off_25B78 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  return v7;
}

- (void)showItemChooser:(id)a3
{
  id v4 = a3;
  -[Legacy_VOTUIItemChooserController setAccessibilityViewIsModal:](self, "setAccessibilityViewIsModal:", 1LL);
  self->_categordouble y = 0x7FFFFFFFFFFFFFFFLL;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"items"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"categories"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"mappings"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"regionDescriptions"]);

  objc_storeStrong((id *)&self->_itemCategoryMappings, v6);
  objc_storeStrong((id *)&self->_originalList, obj);
  objc_storeStrong((id *)&self->_regionDescriptions, v7);
  objc_storeStrong((id *)&self->_categories, v5);
  if (GSEventIsHardwareKeyboardAttached( -[Legacy_VOTUIItemChooserController _displayWithList:fromRotorSwitch:]( self,  "_displayWithList:fromRotorSwitch:",  self->_originalList,  0LL))) {
    -[UISearchField becomeFirstResponder](self->_searchField, "becomeFirstResponder");
  }
  -[Legacy_VOTUIItemChooserController _guidedAccessItemChooserDidShow](self, "_guidedAccessItemChooserDidShow");
}

- (void)_updateGuidedAccessWindowId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (_AXSGuidedAccessEnabled(self, a2))
  {
    id v4 = [(id)AXSafeClassFromString(@"GAXClient") safeValueForKey:@"sharedInstance"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }

- (void)_loadGuidedAccessBundle
{
  if (_AXSGuidedAccessEnabled(self, a2))
  {
    if (qword_2D380 != -1) {
      dispatch_once(&qword_2D380, &stru_249E8);
    }
  }

- (BOOL)accessibilityScroll:(int64_t)a3
{
  categordouble y = self->_category;
  if (a3 == 1)
  {
    if (category == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v5 = -[NSArray count](self->_categories, "count") - 1;
    }
    else {
      unint64_t v5 = category - 1;
    }
  }

  else
  {
    if (a3 != 2)
    {
LABEL_20:
      LOBYTE(v6) = 0;
      return v6;
    }

    if (category == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v5 = 0LL;
    }
    else {
      unint64_t v5 = category + 1;
    }
  }

  NSUInteger v6 = -[NSArray count](self->_categories, "count");
  if (v6)
  {
    if (qword_2D388)
    {
      if ((v5 & 0x8000000000000000LL) != 0) {
        goto LABEL_19;
      }
    }

    else
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/CoreServices/VoiceOverTouch.app"));
      id v8 = (void *)qword_2D388;
      qword_2D388 = v7;

      if ((v5 & 0x8000000000000000LL) != 0) {
        goto LABEL_19;
      }
    }

    NSUInteger v9 = -[NSArray count](self->_categories, "count");
    if (v5 != 0x7FFFFFFFFFFFFFFFLL && v5 < v9)
    {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_categories, "objectAtIndex:", v5));
      uint64_t v17 = (int)[v16 intValue];

      uint64_t v18 = v17 - 1;
      if ((unint64_t)(v17 - 1) < 0x18 && ((0xFFF601u >> v18) & 1) != 0)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_2D388 localizedStringForKey:off_24B28[v18] value:0 table:@"VOTLocalizedStrings"]);
        -[UILabel setText:](self->_headingLabel, "setText:", v19);
      }

      else
      {
        _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/VOTAXUIService/Legacy_VOTUIItemChooserController.m",  350LL,  "-[Legacy_VOTUIItemChooserController accessibilityScroll:]",  @"No key for rotor type");
        -[UILabel setText:](self->_headingLabel, "setText:", &stru_253B8);
      }

      self->_categordouble y = v5;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_categories, "objectAtIndex:", v5));
      v21 = (NSMutableArray *)-[NSArray mutableCopyWithZone:](self->_originalList, "mutableCopyWithZone:", 0LL);
      filteredList = self->_filteredList;
      self->_filteredList = v21;

      v23 = self->_filteredList;
      v31 = _NSConcreteStackBlock;
      uint64_t v32 = 3221225472LL;
      v33 = sub_14E38;
      v34 = &unk_24A10;
      v35 = self;
      id v36 = v20;
      __int128 v15 = v20;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray indexesOfObjectsPassingTest:](v23, "indexesOfObjectsPassingTest:", &v31));
      -[NSMutableArray removeObjectsAtIndexes:](v23, "removeObjectsAtIndexes:", v24, v31, v32, v33, v34, v35);

      v14 = self->_filteredList;
LABEL_27:

      -[Legacy_VOTUIItemChooserController _displayWithList:fromRotorSwitch:]( self,  "_displayWithList:fromRotorSwitch:",  v14,  1LL);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_headingLabel, "text"));
      if (self->_category == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v26 = objc_claimAutoreleasedReturnValue( [(id)qword_2D388 localizedStringForKey:@"search.rotor.allitems" value:0 table:@"VOTLocalizedStrings"]);

        v25 = (void *)v26;
      }

      UIAccessibilityPostNotification(UIAccessibilityPageScrolledNotification, v25);
      UIAccessibilityNotifications v27 = UIAccessibilityLayoutChangedNotification;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView accessibilityElementAtIndex:](self->_table, "accessibilityElementAtIndex:", 0LL));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 _accessibilityFindDescendant:&stru_24A50]);
      UIAccessibilityPostNotification(v27, v29);

      LOBYTE(v6) = 1;
      return v6;
    }

- (void)hideItemChooser:(BOOL)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[Legacy_VOTUIItemChooserController delegate](self, "delegate", a3));

  if (v4)
  {
    v5[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_14F2C;
    v6[3] = &unk_247D0;
    v6[4] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_14F60;
    v5[3] = &unk_246E0;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v6,  v5,  0.2);
  }

- (BOOL)hostingWindowShouldMoveForReachability
{
  return 1;
}

- (void)_handleSearchFieldTextChange:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[Legacy_VOTUIItemChooserController view](self, "view", a3));
  unsigned __int8 v5 = [v4 isHidden];

  if ((v5 & 1) == 0)
  {
    NSUInteger v6 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchField text](self->_searchField, "text"));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 lowercaseString]);

    unsigned __int8 v7 = [v15 isEqualToString:self->_filter];
    id v8 = v15;
    if ((v7 & 1) == 0)
    {
      NSUInteger v9 = (NSString *)[v15 copyWithZone:0];
      filter = self->_filter;
      self->_filter = v9;

      v11 = (NSMutableArray *)-[NSArray mutableCopyWithZone:](self->_originalList, "mutableCopyWithZone:", 0LL);
      filteredList = self->_filteredList;
      self->_filteredList = v11;

      if (-[NSString length](self->_filter, "length"))
      {
        v13 = self->_filteredList;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_15250;
        v17[3] = &unk_24A78;
        v17[4] = self;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray indexesOfObjectsPassingTest:](v13, "indexesOfObjectsPassingTest:", v17));
        -[NSMutableArray removeObjectsAtIndexes:](v13, "removeObjectsAtIndexes:", v14);
      }

      -[Legacy_VOTUIItemChooserController _displayWithList:fromRotorSwitch:]( self,  "_displayWithList:fromRotorSwitch:",  self->_filteredList,  0LL,  v15);
      id v8 = v16;
    }
  }

- (void)consumeSinglePressUpForButtonKind:(int64_t)a3
{
}

- (void)_displayWithList:(id)a3 fromRotorSwitch:(BOOL)a4
{
  id v6 = a3;
  if (!self->_homeButtonIntercept)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[SBSHardwareButtonService sharedInstance](&OBJC_CLASS___SBSHardwareButtonService, "sharedInstance"));
    id v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( [v7 beginConsumingPressesForButtonKind:1 eventConsumer:self priority:0]);
    homeButtonIntercept = self->_homeButtonIntercept;
    self->_homeButtonIntercept = v8;
  }

  self->_id totalItemCount = (int64_t)[v6 count];
  if (self->_category == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (-[NSMutableArray count](self->_filteredList, "count")) {
      id totalItemCount = -[NSMutableArray count](self->_filteredList, "count");
    }
    else {
      id totalItemCount = (id)self->_totalItemCount;
    }
    v11 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___Legacy_VOTUIItemChooserController));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"VoiceOverItemChooser.count" value:&stru_253B8 table:@"VoiceOverUIService"]);
    uint64_t v14 = AXFormatInteger(totalItemCount);
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v15));
    -[UILabel setText:](self->_headingLabel, "setText:", v16);
  }

  else
  {
    id totalItemCount = 0LL;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[Legacy_VOTUIItemChooserController view](self, "view"));
  [v17 layoutIfNeeded];

  self->_selectedRow = 0x7FFFFFFFFFFFFFFFLL;
  self->_activateItem = 0;
  -[NSMutableDictionary removeAllObjects](self->_items, "removeAllObjects");
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_15600;
  v29[3] = &unk_24AA0;
  v29[4] = self;
  [v6 enumerateObjectsUsingBlock:v29];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_items, "allKeys"));
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue([v18 sortedArrayUsingComparator:&stru_24AE0]);
  sectionHeaders = self->_sectionHeaders;
  self->_sectionHeaders = v19;

  -[UITableView setBackgroundView:](self->_table, "setBackgroundView:", 0LL);
  -[UITableView reloadData](self->_table, "reloadData");
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1575C;
  v28[3] = &unk_247D0;
  v28[4] = self;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_15790;
  v26[3] = &unk_24B08;
  BOOL v27 = a4;
  v26[4] = self;
  v26[5] = totalItemCount;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v28,  v26,  0.2);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView safeValueForKey:](self->_table, "safeValueForKey:", @"_index"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_15900;
  v24[3] = &unk_247D0;
  id v25 = v21;
  id v22 = v21;
  AXPerformSafeBlock(v24);
  [v22 bounds];
  objc_msgSend(v22, "setBounds:", 0.0, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 layer]);
  [v23 setCornerRadius:5.0];
}

- (double)_positionAccountingForKeyboard:(CGRect)a3
{
  double y = a3.origin.y;
  v10.origin.x = CGRectZero.origin.x;
  v10.origin.double y = CGRectZero.origin.y;
  v10.size.double width = CGRectZero.size.width;
  v10.size.double height = CGRectZero.size.height;
  BOOL v5 = CGRectEqualToRect(a3, v10);
  double result = -1.0;
  if (!v5)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[Legacy_VOTUIItemChooserController view](self, "view", -1.0));
    [v7 frame];
    double v9 = v8;

    double result = (y - v9) * 0.5;
    if (v9 >= y) {
      return 30.0;
    }
  }

  return result;
}

- (void)_updatePositionForKeyboard:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[Legacy_VOTUIItemChooserController view](self, "view"));
  [v8 frame];
  uint64_t v10 = v9;
  double v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;

  if (v12 > 30.0)
  {
    -[Legacy_VOTUIItemChooserController _positionAccountingForKeyboard:]( self,  "_positionAccountingForKeyboard:",  x,  y,  width,  height);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_15AAC;
    v18[3] = &unk_24888;
    v18[4] = self;
    v18[5] = v10;
    v18[6] = v17;
    v18[7] = v14;
    v18[8] = v16;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v18, 0.2);
  }

- (void)_keyboardWillShow:(id)a3
{
  id v13 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[Legacy_VOTUIItemChooserController view](self, "view"));
  unsigned __int8 v5 = [v4 isHidden];

  if ((v5 & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:UIKeyboardFrameEndUserInfoKey]);
    [v7 CGRectValue];
    self->_keyboardFrame.origin.double x = v8;
    self->_keyboardFrame.origin.double y = v9;
    self->_keyboardFrame.size.double width = v10;
    self->_keyboardFrame.size.double height = v11;

    if (-[UISearchField isFirstResponder](self->_searchField, "isFirstResponder"))
    {
      double v12 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchField window](self->_searchField, "window"));
      [v12 becomeKeyWindow];

      -[Legacy_VOTUIItemChooserController _updatePositionForKeyboard:]( self,  "_updatePositionForKeyboard:",  self->_keyboardFrame.origin.x,  self->_keyboardFrame.origin.y,  self->_keyboardFrame.size.width,  self->_keyboardFrame.size.height);
    }
  }
}

- (void)_keyboardWillHide:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[Legacy_VOTUIItemChooserController view](self, "view", a3));
  unsigned __int8 v5 = [v4 isHidden];

  if ((v5 & 1) == 0)
  {
    -[UISearchField resignFirstResponder](self->_searchField, "resignFirstResponder");
    CGSize size = CGRectZero.size;
    self->_keyboardFrame.origin = CGRectZero.origin;
    self->_keyboardFrame.CGSize size = size;
  }

- (BOOL)textFieldShouldReturn:(id)a3
{
  searchField = self->_searchField;
  id v4 = a3;
  -[UISearchField resignFirstResponder](searchField, "resignFirstResponder");
  [v4 setText:&stru_253B8];

  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  self->_selectedRow = 0x7FFFFFFFFFFFFFFFLL;
  self->_activateItem = 0;
  -[Legacy_VOTUIItemChooserController hideItemChooser:](self, "hideItemChooser:", 0LL);
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (-[NSMutableArray count](self->_filteredList, "count", a3)) {
    return 1LL;
  }
  else {
    return -[NSArray count](self->_sectionHeaders, "count");
  }
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (-[NSMutableArray count](self->_filteredList, "count", a3)) {
    return (int64_t)-[NSMutableArray count](self->_filteredList, "count");
  }
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_sectionHeaders, "objectAtIndex:", a4));
  CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_items, "objectForKey:", v7));
  id v9 = [v8 count];

  return (int64_t)v9;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  if (-[NSString length](self->_filter, "length", a3)) {
    id v4 = 0LL;
  }
  else {
    id v4 = self->_sectionHeaders;
  }
  return v4;
}

- (void)_updateSelectedRow:(id)a3
{
  id v9 = a3;
  if (-[NSMutableArray count](self->_filteredList, "count"))
  {
    originalList = self->_originalList;
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView cellForRowAtIndexPath:](self->_table, "cellForRowAtIndexPath:", v9));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 textLabel]);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 text]);
    self->_selectedRow = -[NSArray indexOfObject:](originalList, "indexOfObject:", v7);
  }

  else
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_sectionHeaders, "objectAtIndex:", [v9 section]));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_items, "objectForKey:", v5));
    -[UITableView deselectRowAtIndexPath:animated:](self->_table, "deselectRowAtIndexPath:animated:", v9, 1LL);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v9, "row")));
    CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:1]);
    self->_selectedRow = (int64_t)[v8 integerValue];
  }
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "nextFocusedIndexPath", a3));
  -[Legacy_VOTUIItemChooserController _updateSelectedRow:](self, "_updateSelectedRow:", v6);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v9 = a4;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v9 contentView]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v5 setBackgroundColor:v6];

  if (v5)
  {
    do
    {
      unsigned __int8 v7 = v5;
      id v5 = (id)objc_claimAutoreleasedReturnValue([v5 superview]);

      CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      [v5 setBackgroundColor:v8];
    }

    while (v5 != v9 && v5);
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[NSMutableArray count](self->_filteredList, "count"))
  {
    CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_filteredList, "objectAtIndex:", [v7 row]));
    id v9 = -[NSArray indexOfObject:](self->_originalList, "indexOfObject:", v8);
  }

  else
  {
    CGFloat v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_sectionHeaders, "objectAtIndex:", [v7 section]));
    CGFloat v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_items, "objectForKey:", v10));
    double v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row")));
    CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:0]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row")));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:1]);
    id v9 = [v14 integerValue];
  }

  if (v9 >= (id)-[NSArray count](self->_regionDescriptions, "count")) {
    uint64_t v15 = 0LL;
  }
  else {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_regionDescriptions, "objectAtIndex:", v9));
  }
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithIdentifier:@"TableViewCell"]);
  [v16 setAccessibilityTraits:kAXIgnoreItemChooserTrait];
  [v16 setAccessibilityHint:v15];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 textLabel]);
  [v17 setText:v8];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 textLabel]);
  [v18 setNumberOfLines:0];

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v16 textLabel]);
  [v20 setTextColor:v19];

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v16 textLabel]);
  [v22 setBackgroundColor:v21];

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v16 setBackgroundColor:v23];

  v24 = (void *)objc_claimAutoreleasedReturnValue([v16 contentView]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 superview]);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v25 setBackgroundColor:v26];

  return v16;
}

- (Legacy_VOTUIItemChooserDelegate)delegate
{
  return (Legacy_VOTUIItemChooserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end