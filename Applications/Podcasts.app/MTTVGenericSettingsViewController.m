@interface MTTVGenericSettingsViewController
+ (id)cellClassForSettingType:(int64_t)a3 inGroupWithIdentifier:(id)a4;
- (BOOL)_radioButtonTintsTextColorOnSelection;
- (id)newCellForDescriptionType:(int64_t)a3 inGroupWithIdentifier:(id)a4;
- (id)optionsTableViewControllerWithOption:(id)a3;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (void)configureCell:(id)a3 atIndexPath:(id)a4 withDescription:(id)a5 inGroupWithIdentifier:(id)a6;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation MTTVGenericSettingsViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVGenericSettingsViewController;
  -[MTGenericSettingsViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGenericSettingsViewController tableView](self, "tableView"));
  [v3 setRemembersLastFocusedIndexPath:1];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGenericSettingsViewController tableView](self, "tableView"));
  [v4 setInsetsContentViewsToSafeArea:0];
}

- (void)viewWillLayoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___MTTVGenericSettingsViewController;
  -[MTTVGenericSettingsViewController viewWillLayoutSubviews](&v39, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGenericSettingsViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 superview]);
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGenericSettingsViewController tableView](self, "tableView"));
  if ([v13 effectiveUserInterfaceLayoutDirection] == (id)1) {
    double v14 = 30.0;
  }
  else {
    double v14 = 0.0;
  }

  double v15 = v6 + v14;
  double v16 = v8 + 0.0;
  double v17 = v10 + -30.0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGenericSettingsViewController tableView](self, "tableView"));
  [v18 frame];
  v41.origin.x = v15;
  v41.origin.y = v16;
  v41.size.width = v17;
  v41.size.height = v12;
  BOOL v19 = CGRectEqualToRect(v40, v41);

  if (!v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGenericSettingsViewController tableView](self, "tableView"));
    objc_msgSend(v20, "setFrame:", v15, v16, v17, v12);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGenericSettingsViewController tableView](self, "tableView"));
  [v21 contentInset];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGenericSettingsViewController tableView](self, "tableView"));
  [v28 contentInset];
  if (v32 != v25 || v29 != v23 || v31 != v27)
  {

LABEL_12:
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGenericSettingsViewController tableView](self, "tableView"));
    objc_msgSend(v34, "setContentInset:", v23, v25, 0.0, v27);

    goto LABEL_13;
  }

  double v33 = v30;

  if (v33 != 0.0) {
    goto LABEL_12;
  }
LABEL_13:
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGenericSettingsViewController tableView](self, "tableView"));
  objc_msgSend(v38, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
}

+ (id)cellClassForSettingType:(int64_t)a3 inGroupWithIdentifier:(id)a4
{
  id v7 = a4;
  if (a3 == 6)
  {
    double v8 = &OBJC_CLASS___MTTVTextCell;
  }

  else
  {
    if (a3)
    {
      v15.receiver = a1;
      v15.super_class = (Class)&OBJC_METACLASS___MTTVGenericSettingsViewController;
      id v12 = objc_msgSendSuper2(&v15, "cellClassForSettingType:inGroupWithIdentifier:", a3, v7);
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v12);
      goto LABEL_7;
    }

    double v8 = &OBJC_CLASS___MTTVSwitchCell;
  }

  double v9 = (objc_class *)objc_opt_class(v8, v6);
  double v10 = NSStringFromClass(v9);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
LABEL_7:
  v13 = (void *)v11;

  return v13;
}

- (id)newCellForDescriptionType:(int64_t)a3 inGroupWithIdentifier:(id)a4
{
  id v6 = a4;
  if (a3 != 6 && a3)
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___MTTVGenericSettingsViewController;
    id v15 = -[MTGenericSettingsViewController newCellForDescriptionType:inGroupWithIdentifier:]( &v17,  "newCellForDescriptionType:inGroupWithIdentifier:",  a3,  v6);
  }

  else
  {
    id v7 = [(id)objc_opt_class(self) cellClassForSettingType:a3 inGroupWithIdentifier:v6];
    double v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
    double v9 = NSClassFromString(v8);

    double v10 = NSStringFromClass(v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = [(id)objc_opt_class(self) cellIdentifierForSettingType:a3];
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v11, v13));

    id v15 = [[v9 alloc] initWithStyle:1 reuseIdentifier:v14];
  }

  return v15;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4 withDescription:(id)a5 inGroupWithIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MTTVGenericSettingsViewController;
  -[MTGenericSettingsViewController configureCell:atIndexPath:withDescription:inGroupWithIdentifier:]( &v28,  "configureCell:atIndexPath:withDescription:inGroupWithIdentifier:",  v10,  v11,  v12,  v13);
  [v10 setShowsSeparator:0];
  [v10 setSelectedBackgroundView:0];
  double v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleHeadline));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 textLabel]);
  [v15 setFont:v14];

  double v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleHeadline));
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v10 detailTextLabel]);
  [v17 setFont:v16];

  if ([v12 type] == (id)6)
  {
    id v18 = v10;
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"ATV_STATION_TITLE" value:&stru_100248948 table:0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v18 textLabel]);
    [v21 setText:v20];

    double v22 = (void *)objc_claimAutoreleasedReturnValue([v12 value]);
    double v23 = (void *)objc_claimAutoreleasedReturnValue([v18 detailTextLabel]);
    [v23 setText:v22];

    objc_initWeak(&location, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000D7E2C;
    v24[3] = &unk_1002441F8;
    objc_copyWeak(&v26, &location);
    id v25 = v12;
    [v18 setTextChangedBlock:v24];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

- (id)optionsTableViewControllerWithOption:(id)a3
{
  id v3 = a3;
  v4 = -[MTOptionsTableViewController initWithOption:]( objc_alloc(&OBJC_CLASS___MTTVOptionsTableViewController),  "initWithOption:",  v3);

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingAtIndexPath:](self, "settingAtIndexPath:", v7));
  id v9 = [v8 type];
  if (v9 == (id)6)
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v6 cellForRowAtIndexPath:v7]);
    [v14 showEditTitleUI];
  }

  else
  {
    if (v9)
    {
      v15.receiver = self;
      v15.super_class = (Class)&OBJC_CLASS___MTTVGenericSettingsViewController;
      -[MTGenericSettingsViewController tableView:didSelectRowAtIndexPath:]( &v15,  "tableView:didSelectRowAtIndexPath:",  v6,  v7);
      goto LABEL_7;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 value]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v10 BOOLValue] ^ 1));
    [v8 setValue:v11];

    id v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v8 changeHandler]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 value]);
    ((void (**)(void, void *))v12)[2](v12, v13);

    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVGenericSettingsViewController tableView](self, "tableView"));
    [v14 reloadData];
  }

LABEL_7:
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVGenericSettingsViewController;
  id v4 = -[MTGenericSettingsViewController tableView:viewForFooterInSection:]( &v7,  "tableView:viewForFooterInSection:",  a3,  a4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v5 setTopAlignLabel:1];
  return v5;
}

- (BOOL)_radioButtonTintsTextColorOnSelection
{
  return 0;
}

@end