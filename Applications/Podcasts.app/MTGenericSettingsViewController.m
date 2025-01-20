@interface MTGenericSettingsViewController
+ (BOOL)isMacIdiom;
+ (double)rowHeight;
+ (id)cellClassForSettingType:(int64_t)a3 inGroupWithIdentifier:(id)a4;
+ (id)cellIdentifierForSettingType:(int64_t)a3;
+ (id)settingFont;
- (BOOL)_radioButtonTintsTextColorOnSelection;
- (BOOL)emphasizedCellNeedsScrollToVisible;
- (BOOL)updateSettingForSettingValueChangeByUpdatingCellAtIndexPath:(id)a3;
- (MTGenericSettingsViewController)init;
- (MTSettingsController)settingsController;
- (double)heightForRowWithDescription:(id)a3 inGroupWithIdentifier:(id)a4;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)indexPathForSetting:(id)a3;
- (id)newCellForDescriptionType:(int64_t)a3 inGroupWithIdentifier:(id)a4;
- (id)optionsTableViewControllerWithOption:(id)a3;
- (id)settingAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)_defaultSelectionStyleForSetting:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)configureCell:(id)a3 atIndexPath:(id)a4 withDescription:(id)a5 inGroupWithIdentifier:(id)a6;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)optionSettingChanged:(id)a3 value:(unint64_t)a4;
- (void)setCell:(id)a3 enabled:(BOOL)a4 withDescription:(id)a5;
- (void)setEmphasizedCellNeedsScrollToVisible:(BOOL)a3;
- (void)setSettingsController:(id)a3;
- (void)settingsController:(id)a3 addedGroup:(id)a4 atIndex:(int64_t)a5;
- (void)settingsController:(id)a3 didChangeHeaderAction:(id)a4 inGroupWithIdentifier:(id)a5;
- (void)settingsController:(id)a3 didChangeSettingValueAtIndex:(int64_t)a4 inGroupWithIdentifier:(id)a5;
- (void)settingsController:(id)a3 reloadedGroupWithIdentifier:(id)a4;
- (void)settingsController:(id)a3 removedGroupAtIndex:(int64_t)a4;
- (void)settingsController:(id)a3 removedSettingAtIndex:(int64_t)a4 inGroupWithIdentifier:(id)a5;
- (void)switchSettingChanged:(id)a3 value:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)textSettingChanged:(id)a3 value:(id)a4;
- (void)updateRowHeight;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MTGenericSettingsViewController

+ (id)settingFont
{
  else {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleBody));
  }
  return v2;
}

+ (id)cellClassForSettingType:(int64_t)a3 inGroupWithIdentifier:(id)a4
{
  id v7 = a4;
  if ((unint64_t)a3 <= 9)
  {
    v8 = (objc_class *)objc_opt_class(*off_100243EF0[a3], v6);
    v9 = NSStringFromClass(v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v4;
}

+ (id)cellIdentifierForSettingType:(int64_t)a3
{
  else {
    return off_100243F40[a3 - 1];
  }
}

+ (double)rowHeight
{
  id v2 = [(id)objc_opt_class(a1) settingFont];
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  [v3 lineHeight];
  double v5 = v4 + 30.0;

  return v5;
}

- (MTGenericSettingsViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTGenericSettingsViewController;
  id v2 = -[MTGenericSettingsViewController initWithStyle:](&v6, "initWithStyle:", 1LL);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:v2 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

    double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v2 selector:"syncControllerOperationCompleted:" name:@"MTSyncControllerOperationCompleted" object:0];
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTGenericSettingsViewController;
  -[MTGenericSettingsViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTGenericSettingsViewController;
  -[MTGenericSettingsViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
  [v3 registerClass:objc_opt_class(MTSettingsWithActionHeaderView) forHeaderFooterViewReuseIdentifier:@"MTSettingsWithActionHeaderView"];
  -[MTGenericSettingsViewController updateRowHeight](self, "updateRowHeight");
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTGenericSettingsViewController;
  -[MTGenericSettingsViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
  [v4 reloadData];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTGenericSettingsViewController;
  -[MTGenericSettingsViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[MTGenericSettingsViewController _scrollEmphasizedCellToVisibleIfNecessary]( self,  "_scrollEmphasizedCellToVisibleIfNecessary");
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController view](self, "view", a3));
  [v4 setNeedsLayout];

  -[MTGenericSettingsViewController updateRowHeight](self, "updateRowHeight");
}

- (void)updateRowHeight
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
  [(id)objc_opt_class(self) rowHeight];
  objc_msgSend(v3, "setRowHeight:");

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
  [v4 reloadData];
}

- (void)setSettingsController:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_settingsController, a3);
  [v6 setDelegate:self];
  if (-[MTGenericSettingsViewController isViewLoaded](self, "isViewLoaded"))
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
    [v5 reloadData];
  }
}

- (id)settingAtIndexPath:(id)a3
{
  settingsController = self->_settingsController;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](settingsController, "order"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController groups](self->_settingsController, "groups"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 groupSettings]);

  id v11 = [v5 row];
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v11]);

  return v12;
}

- (id)indexPathForSetting:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController groups](self->_settingsController, "groups"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000CB88C;
    v21[3] = &unk_100243E80;
    id v6 = v4;
    id v22 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 keysOfEntriesPassingTest:v21]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 anyObject]);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order"));
    id v10 = [v9 indexOfObject:v8];

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 group]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 groupSettings]);
    id v13 = [v12 indexOfObject:v6];

    if (v10 == (id)0x7FFFFFFFFFFFFFFFLL || v13 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v16 = _MTLogCategoryDefault(v14);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order"));
        *(_DWORD *)buf = 138543874;
        id v24 = v6;
        __int16 v25 = 2114;
        v26 = v8;
        __int16 v27 = 2114;
        v28 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Unable to locate an index path for setting %{public}@ for key %{public}@. All settings: %{public}@",  buf,  0x20u);
      }

      v19 = 0LL;
    }

    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v13,  v10));
    }
  }

  else
  {
    v19 = 0LL;
  }

  return v19;
}

- (void)setCell:(id)a3 enabled:(BOOL)a4 withDescription:(id)a5
{
  BOOL v6 = a4;
  id v15 = a3;
  id v8 = a5;
  if (v6)
  {
    objc_msgSend( v15,  "setSelectionStyle:",  -[MTGenericSettingsViewController _defaultSelectionStyleForSetting:]( self,  "_defaultSelectionStyleForSetting:",  v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v15 textLabel]);
    [v9 setEnabled:1];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v15 detailTextLabel]);
    id v11 = v10;
    uint64_t v12 = 1LL;
  }

  else
  {
    [v15 setSelectionStyle:0];
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v15 textLabel]);
    [v13 setEnabled:0];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v15 detailTextLabel]);
    id v11 = v10;
    uint64_t v12 = 0LL;
  }

  [v10 setEnabled:v12];

  if ([v8 type])
  {
    if (!v6) {
      goto LABEL_11;
    }
  }

  else
  {
    [v15 setEnabled:v6];
    if (!v6) {
      goto LABEL_11;
    }
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController indexPathForSetting:](self, "indexPathForSetting:", v8));
  if (v14) {
    -[MTGenericSettingsViewController _configureEmphasisForCell:indexPath:animated:]( self,  "_configureEmphasisForCell:indexPath:animated:",  v15,  v14,  0LL);
  }

LABEL_11:
}

- (int64_t)_defaultSelectionStyleForSetting:(id)a3
{
  if ([a3 type]) {
    return 3LL;
  }
  else {
    return 0LL;
  }
}

- (double)heightForRowWithDescription:(id)a3 inGroupWithIdentifier:(id)a4
{
  return 44.0;
}

+ (BOOL)isMacIdiom
{
  return 0;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4 withDescription:(id)a5 inGroupWithIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 textLabel]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 title]);
  [v14 setText:v15];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 textLabel]);
  [v16 setAdjustsFontSizeToFitWidth:1];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v10 textLabel]);
  [v17 setBaselineAdjustment:1];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v10 textLabel]);
  [v18 setMinimumScaleFactor:0.9];

  else {
    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleBody));
  }
  v20 = (void *)v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue([v10 textLabel]);
  [v21 setFont:v20];

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v10 detailTextLabel]);
  [v22 setFont:v20];

  objc_initWeak(&location, self);
  switch((unint64_t)[v12 type])
  {
    case 0uLL:
      id v23 = v10;
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v12 value]);
      objc_msgSend(v23, "toggleOn:", objc_msgSend(v24, "BOOLValue"));

      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_1000CBF08;
      v38[3] = &unk_100243EA8;
      objc_copyWeak(&v40, &location);
      id v39 = v12;
      [v23 setToggleChanged:v38];

      objc_destroyWeak(&v40);
      goto LABEL_20;
    case 1uLL:
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v10 textLabel]);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellTextColor](&OBJC_CLASS___UIColor, "cellTextColor"));
      [v25 setTextColor:v26];

      id v23 = (id)objc_claimAutoreleasedReturnValue([v10 textLabel]);
      [v23 setTextAlignment:1];
      goto LABEL_20;
    case 2uLL:
      v35 = (void *)objc_claimAutoreleasedReturnValue([v10 detailTextLabel]);
      v36 = (void *)objc_claimAutoreleasedReturnValue([v12 value]);
      [v35 setText:v36];

      goto LABEL_17;
    case 3uLL:
LABEL_17:
      id v23 = (id)objc_claimAutoreleasedReturnValue([v10 textLabel]);
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor appTintColor](&OBJC_CLASS___UIColor, "appTintColor"));
      [v23 setTextColor:v27];
      goto LABEL_19;
    case 4uLL:
      id v23 = (id)objc_claimAutoreleasedReturnValue([v10 detailTextLabel]);
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v12 value]);
      [v23 setText:v27];
      goto LABEL_19;
    case 5uLL:
      id v23 = v12;
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v10 detailTextLabel]);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v23 currentShortTitle]);
      [v27 setText:v28];
      goto LABEL_15;
    case 7uLL:
      id v23 = v12;
      v37 = (void *)objc_claimAutoreleasedReturnValue([v23 radioGroup]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v23 value]);
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v37 value]));
      unsigned int v31 = [v29 isEqual:v30];

      if (v31) {
        uint64_t v32 = 3LL;
      }
      else {
        uint64_t v32 = 0LL;
      }
      [v10 setAccessoryType:v32];
      if (-[MTGenericSettingsViewController _radioButtonTintsTextColorOnSelection]( self,  "_radioButtonTintsTextColorOnSelection"))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellTextColor](&OBJC_CLASS___UIColor, "cellTextColor"));
        v34 = (void *)objc_claimAutoreleasedReturnValue([v10 textLabel]);
        [v34 setTextColor:v33];
      }

      goto LABEL_20;
    case 9uLL:
      id v23 = v10;
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v12 value]);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v23 messageLabel]);
      [v28 setText:v27];
LABEL_15:

LABEL_19:
LABEL_20:

      break;
    default:
      break;
  }

  objc_destroyWeak(&location);
}

- (id)newCellForDescriptionType:(int64_t)a3 inGroupWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(id)objc_opt_class(self) cellClassForSettingType:a3 inGroupWithIdentifier:v6];
  id v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  v9 = NSClassFromString(v8);

  id v10 = (NSString *)objc_claimAutoreleasedReturnValue( +[MTGenericSettingsViewController cellClassForSettingType:inGroupWithIdentifier:]( &OBJC_CLASS___MTGenericSettingsViewController,  "cellClassForSettingType:inGroupWithIdentifier:",  a3,  v6));
  Class v11 = NSClassFromString(v10);

  if ((-[objc_class isSubclassOfClass:](v9, "isSubclassOfClass:", v11) & 1) != 0)
  {
    id v12 = NSStringFromClass(v9);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = [(id)objc_opt_class(self) cellIdentifierForSettingType:a3];
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v13, v15));

    switch(a3)
    {
      case 0LL:
      case 1LL:
      case 6LL:
      case 9LL:
        id v17 = objc_alloc(v9);
        uint64_t v18 = 0LL;
        goto LABEL_5;
      case 2LL:
      case 3LL:
      case 8LL:
        id v17 = objc_alloc(v9);
        uint64_t v18 = 1LL;
LABEL_5:
        v9 = (objc_class *)[v17 initWithStyle:v18 reuseIdentifier:v16];
        break;
      case 4LL:
        uint64_t v19 = (objc_class *)[[v9 alloc] initWithStyle:1 reuseIdentifier:v16];
        v9 = v19;
        uint64_t v20 = 1LL;
        goto LABEL_9;
      case 5LL:
        v9 = (objc_class *)[[v9 alloc] initWithStyle:1 reuseIdentifier:v16];
        uint64_t v20 = [(id)objc_opt_class(self) isMacIdiom] ^ 1;
        uint64_t v19 = v9;
        goto LABEL_9;
      case 7LL:
        uint64_t v19 = (objc_class *)[[v9 alloc] initWithStyle:1 reuseIdentifier:v16];
        v9 = v19;
        uint64_t v20 = 3LL;
LABEL_9:
        -[objc_class setAccessoryType:](v19, "setAccessoryType:", v20);
        break;
      default:
        break;
    }

    return v9;
  }

  else
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not a subclass of %@",  v9,  v11));
    id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"MTInvalidCellClass",  v22,  0LL));

    objc_exception_throw(v23);
    return -[MTGenericSettingsViewController optionsTableViewControllerWithOption:](v24, v25, v26);
  }

- (id)optionsTableViewControllerWithOption:(id)a3
{
  return 0LL;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingAtIndexPath:](self, "settingAtIndexPath:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order"));
  id v8 = [v5 section];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v8]);
  -[MTGenericSettingsViewController heightForRowWithDescription:inGroupWithIdentifier:]( self,  "heightForRowWithDescription:inGroupWithIdentifier:",  v6,  v9);
  double v11 = v10;

  return v11;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:a4]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController groups](self->_settingsController, "groups"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);

  [v9 customHeaderHeight];
  double v10 = 30.0;
  if (v11 > 0.0)
  {
    [v9 customHeaderHeight];
    double v10 = v12;
  }

  return v10;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:a4]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController groups](self->_settingsController, "groups"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);

  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 groupFooter]);
  if ([v10 length])
  {
    double v11 = objc_alloc_init(&OBJC_CLASS___MTGenericSettingsFooterLabelView);
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](v11, "textView"));
    [v12 setAttributedText:v10];
  }

  else
  {
    double v11 = 0LL;
  }

  return v11;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:a4]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController groups](self->_settingsController, "groups"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);

  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 groupFooter]);
  if ([v10 length])
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController view](self, "view"));
    [v11 frame];
    double v13 = v12;
    +[MTGenericSettingsFooterLabelView labelInset](&OBJC_CLASS___MTGenericSettingsFooterLabelView, "labelInset");
    double v15 = v13 + v14 * -2.0;

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 string]);
    NSAttributedStringKey v23 = NSFontAttributeName;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont sectionFooterFont](&OBJC_CLASS___UIFont, "sectionFooterFont"));
    id v24 = v17;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    objc_msgSend(v16, "boundingRectWithSize:options:attributes:context:", 1, v18, 0, v15, 1.79769313e308);
    double v20 = v19;

    double v21 = ceil(v20) + 32.0;
  }

  else
  {
    double v21 = 16.0;
  }

  return v21;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order", a3));
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:a4]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController groups](self->_settingsController, "groups"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 groupSettings]);
  id v11 = [v10 count];

  return (int64_t)v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingAtIndexPath:](self, "settingAtIndexPath:", v6));
  id v9 = objc_msgSend((id)objc_opt_class(self), "cellIdentifierForSettingType:", objc_msgSend(v8, "type"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithIdentifier:v10]);

  if (!v11)
  {
    id v12 = [v8 type];
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order"));
    double v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));
    id v11 = -[MTGenericSettingsViewController newCellForDescriptionType:inGroupWithIdentifier:]( self,  "newCellForDescriptionType:inGroupWithIdentifier:",  v12,  v14);
  }

  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));
  -[MTGenericSettingsViewController configureCell:atIndexPath:withDescription:inGroupWithIdentifier:]( self,  "configureCell:atIndexPath:withDescription:inGroupWithIdentifier:",  v11,  v6,  v8,  v16);

  return v11;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingAtIndexPath:](self, "settingAtIndexPath:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController disabledGroups](self->_settingsController, "disabledGroups"));
  if ([v9 containsObject:v8])
  {

LABEL_5:
    id v11 = 0LL;
    goto LABEL_6;
  }

  unsigned __int8 v10 = [v6 enabled];

  if ((v10 & 1) == 0) {
    goto LABEL_5;
  }
  id v11 = v5;
LABEL_6:

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingAtIndexPath:](self, "settingAtIndexPath:", v7));
  switch((unint64_t)[v8 type])
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
      id v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v8 changeHandler]);
      v9[2](v9, 0LL);

      break;
    case 4uLL:
      unsigned __int8 v10 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue([v8 generator]);
      uint64_t v11 = v10[2]();
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

      double v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController navigationController](self, "navigationController"));
      [v13 pushViewController:v12 animated:1];

      break;
    case 5uLL:
      id v14 = v8;
      double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 options]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[MTGenericSettingsViewController optionsTableViewControllerWithOption:]( self,  "optionsTableViewControllerWithOption:",  v14));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 headerTitle]);
      [v16 setTitle:v17];

      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_1000CCC98;
      v47[3] = &unk_100243ED0;
      v47[4] = self;
      id v48 = v14;
      id v49 = v15;
      id v50 = v7;
      id v18 = v15;
      id v19 = v14;
      [v16 setOptionSelectedBlock:v47];
      double v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController metricDataSource](self, "metricDataSource"));
      [v16 setMetricDataSource:v20];

      double v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController navigationController](self, "navigationController"));
      [v21 pushViewController:v16 animated:1];

      break;
    case 7uLL:
      id v41 = v7;
      id v42 = v6;
      id v40 = v8;
      id v22 = v8;
      NSAttributedStringKey v23 = (void *)objc_claimAutoreleasedReturnValue([v22 radioGroup]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 value]);
      objc_msgSend(v23, "setValue:", objc_msgSend(v24, "unsignedIntegerValue"));

      SEL v25 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v23 changeHandler]);
      id v39 = v22;
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v22 value]);
      ((void (**)(void, id))v25)[2](v25, [v26 unsignedIntegerValue]);

      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      v38 = v23;
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v23 settings]);
      id v28 = [v27 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v44;
        do
        {
          for (i = 0LL; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v44 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)i);
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController indexPathForSetting:](self, "indexPathForSetting:", v32));
            if (v33)
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
              v35 = (void *)objc_claimAutoreleasedReturnValue([v34 cellForRowAtIndexPath:v33]);

              v36 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order"));
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndexedSubscript:", objc_msgSend(v33, "section")));

              -[MTGenericSettingsViewController configureCell:atIndexPath:withDescription:inGroupWithIdentifier:]( self,  "configureCell:atIndexPath:withDescription:inGroupWithIdentifier:",  v35,  v33,  v32,  v37);
            }
          }

          id v29 = [v27 countByEnumeratingWithState:&v43 objects:v51 count:16];
        }

        while (v29);
      }

      id v7 = v41;
      id v6 = v42;
      id v8 = v40;
      break;
    default:
      break;
  }

  [v6 deselectRowAtIndexPath:v7 animated:1];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:a4]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController groups](self->_settingsController, "groups"));
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v8]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 headerAction]);
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"MTSettingsWithActionHeaderView"]);
    [v12 setAction:v11];
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:a4]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController groups](self->_settingsController, "groups"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 groupTitle]);
  return v10;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v8 = a4;
  if ([(id)objc_opt_class(self) isMacIdiom])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 contentView]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](&OBJC_CLASS___UIColor, "systemBackgroundColor"));
    [v6 setBackgroundColor:v7];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  settingsController = self->_settingsController;
  id v8 = a5;
  id v9 = a4;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](settingsController, "order"));
  id v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v8, "section")));

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingAtIndexPath:](self, "settingAtIndexPath:", v8));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController disabledGroups](self->_settingsController, "disabledGroups"));
  else {
    id v13 = [v11 enabled];
  }

  -[MTGenericSettingsViewController setCell:enabled:withDescription:]( self,  "setCell:enabled:withDescription:",  v9,  v13,  v11);
}

- (void)settingsController:(id)a3 reloadedGroupWithIdentifier:(id)a4
{
  settingsController = self->_settingsController;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](settingsController, "order"));
  id v8 = [v7 indexOfObject:v6];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
  id v10 = [v9 numberOfSections];

  if ((uint64_t)v8 < (uint64_t)v10)
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", v8));
    [v12 reloadSections:v11 withRowAnimation:100];
  }

- (void)settingsController:(id)a3 addedGroup:(id)a4 atIndex:(int64_t)a5
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView", a3, a4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", a5));
  [v7 insertSections:v6 withRowAnimation:100];
}

- (void)settingsController:(id)a3 didChangeHeaderAction:(id)a4 inGroupWithIdentifier:(id)a5
{
  id v17 = a4;
  settingsController = self->_settingsController;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](settingsController, "order"));
  id v10 = [v9 indexOfObject:v8];

  uint64_t v11 = v17;
  if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 headerViewForSection:v10]);

    if (v13)
    {
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___MTSettingsWithActionHeaderView);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      {
        [v13 setAction:v17];
      }

      else
      {
        double v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", v10));
        [v15 reloadSections:v16 withRowAnimation:100];
      }
    }

    uint64_t v11 = v17;
  }
}

- (void)settingsController:(id)a3 removedGroupAtIndex:(int64_t)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", a4));
  [v6 deleteSections:v5 withRowAnimation:100];
}

- (void)settingsController:(id)a3 removedSettingAtIndex:(int64_t)a4 inGroupWithIdentifier:(id)a5
{
  settingsController = self->_settingsController;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](settingsController, "order"));
  id v10 = [v9 indexOfObject:v8];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  a4,  v10));
  uint64_t v14 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  [v11 deleteRowsAtIndexPaths:v13 withRowAnimation:100];
}

- (void)settingsController:(id)a3 didChangeSettingValueAtIndex:(int64_t)a4 inGroupWithIdentifier:(id)a5
{
  settingsController = self->_settingsController;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](settingsController, "order"));
  id v10 = [v9 indexOfObject:v8];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  a4,  v10));
  if (!-[MTGenericSettingsViewController updateSettingForSettingValueChangeByUpdatingCellAtIndexPath:]( self,  "updateSettingForSettingValueChangeByUpdatingCellAtIndexPath:",  v11))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
    uint64_t v14 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
    [v12 reloadRowsAtIndexPaths:v13 withRowAnimation:100];
  }
}

- (BOOL)updateSettingForSettingValueChangeByUpdatingCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingAtIndexPath:](self, "settingAtIndexPath:", v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 cellForRowAtIndexPath:v4]);

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___MTSwitchCell);
  char isKindOfClass = objc_opt_isKindOfClass(v7, v8);
  if ((isKindOfClass & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);
    objc_msgSend(v7, "toggleOn:animated:", objc_msgSend(v10, "BOOLValue"), 1);
  }

  return isKindOfClass & 1;
}

- (void)optionSettingChanged:(id)a3 value:(unint64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  [v5 setValue:v6];

  uint64_t v8 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue([v5 changeHandler]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  v8[2](v8, v7);
}

- (void)switchSettingChanged:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  [v6 setValue:v8];

  id v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v6 changeHandler]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  ((void (**)(void, void *))v9)[2](v9, v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController indexPathForSetting:](self, "indexPathForSetting:", v6));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);

  LOBYTE(v6) = [v7 isEqualToString:v12];
  if ((v6 & 1) == 0 && v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
    double v15 = v11;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    [v13 reloadRowsAtIndexPaths:v14 withRowAnimation:5];
  }
}

- (void)textSettingChanged:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    [v6 setValue:v7];
    uint64_t v8 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v6 changeHandler]);
    ((void (**)(void, id))v8)[2](v8, v7);
  }

  else
  {
    uint64_t v8 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[MTGenericSettingsViewController indexPathForSetting:]( self,  "indexPathForSetting:",  v6));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
    id v10 = v9;
    if (v8)
    {
      id v12 = v8;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
      [v10 reloadRowsAtIndexPaths:v11 withRowAnimation:5];
    }

    else
    {
      [v9 reloadData];
    }
  }
}

- (BOOL)_radioButtonTintsTextColorOnSelection
{
  return 1;
}

- (MTSettingsController)settingsController
{
  return self->_settingsController;
}

- (BOOL)emphasizedCellNeedsScrollToVisible
{
  return self->_emphasizedCellNeedsScrollToVisible;
}

- (void)setEmphasizedCellNeedsScrollToVisible:(BOOL)a3
{
  self->_emphasizedCellNeedsScrollToVisible = a3;
}

- (void).cxx_destruct
{
}

@end