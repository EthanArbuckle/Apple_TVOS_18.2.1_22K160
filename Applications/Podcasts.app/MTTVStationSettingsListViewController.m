@interface MTTVStationSettingsListViewController
+ (CGSize)podcastImageSize;
- (UIAlertController)deleteStationAlertController;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_newSeparatorHeaderView;
- (id)newSettingsController;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)setDeleteStationAlertController:(id)a3;
- (void)showDeleteStationUI;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation MTTVStationSettingsListViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVStationSettingsListViewController;
  -[MTPlaylistSettingsViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", 0.0, 0.0, 1.0, 100.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSettingsListViewController tableView](self, "tableView"));
  [v4 setTableFooterView:v3];
}

- (void)showDeleteStationUI
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainQueueContext]);

  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_10006C8D0;
  v19 = sub_10006C8E0;
  id v20 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006C8E8;
  v11[3] = &unk_1002404B8;
  v14 = &v15;
  id v5 = v4;
  id v12 = v5;
  v13 = self;
  [v5 performBlockAndWait:v11];
  uint64_t v6 = v16[5];
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController library](self, "library"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10006C944;
    v10[3] = &unk_10023FF98;
    v10[4] = self;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController controllerForDeletingStation:fromLibrary:deletionCompletion:]( &OBJC_CLASS___UIAlertController,  "controllerForDeletingStation:fromLibrary:deletionCompletion:",  v6,  v7,  v10));
    -[MTTVStationSettingsListViewController setDeleteStationAlertController:]( self,  "setDeleteStationAlertController:",  v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVStationSettingsListViewController deleteStationAlertController]( self,  "deleteStationAlertController"));
    -[MTTVStationSettingsListViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v9,  1LL,  0LL);
  }

  _Block_object_dispose(&v15, 8);
}

+ (CGSize)podcastImageSize
{
  double v2 = 91.0;
  double v3 = 91.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return dbl_1001C3730[objc_msgSend(a4, "section", a3) == (id)2];
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result = 0.0;
  if (a4 != 2)
  {
    uint64_t v8 = v4;
    uint64_t v9 = v5;
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___MTTVStationSettingsListViewController;
    -[MTGenericSettingsViewController tableView:heightForFooterInSection:]( &v7,  "tableView:heightForFooterInSection:",  a3,  0.0);
  }

  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if (a4 != 3) {
    return *(double *)&qword_1002B3908;
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen", a3));
  [v4 scale];
  double v6 = v5;

  return 1.0 / v6 * 2.0 + 21.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4 == 3) {
    return -[MTTVStationSettingsListViewController _newSeparatorHeaderView](self, "_newSeparatorHeaderView", a3);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVStationSettingsListViewController;
  id v5 = -[MTGenericSettingsViewController tableView:viewForHeaderInSection:]( &v6,  "tableView:viewForHeaderInSection:",  a3);
  return (id)objc_claimAutoreleasedReturnValue(v5);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section] == (id)3)
  {
    -[MTTVStationSettingsListViewController showDeleteStationUI](self, "showDeleteStationUI");
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___MTTVStationSettingsListViewController;
    -[MTTVGenericSettingsViewController tableView:didSelectRowAtIndexPath:]( &v8,  "tableView:didSelectRowAtIndexPath:",  v6,  v7);
  }
}

- (id)_newSeparatorHeaderView
{
  double v3 = objc_opt_new(&OBJC_CLASS___UIView);
  uint64_t v4 = objc_opt_new(&OBJC_CLASS___UIView);
  -[UIView addSubview:](v3, "addSubview:", v4);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v4, "heightAnchor"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v6 scale];
  double v8 = v7;

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 constraintEqualToConstant:1.0 / v8 + 1.0 / v8]);
  [v9 setActive:1];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](v4, "leftAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](v3, "leftAnchor"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 constraintEqualToAnchor:v11]);
  [v12 setActive:1];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](v4, "rightAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](v3, "rightAnchor"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 constraintEqualToAnchor:v14]);
  [v15 setActive:1];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4, "topAnchor"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v3, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintEqualToAnchor:v17]);
  [v18 setActive:1];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSettingsListViewController tableView](self, "tableView"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mt_separatorColor"));
  -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v20);

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section] == (id)3)
  {
    double v8 = -[MTTVDeleteTableViewCell initWithStyle:reuseIdentifier:]( objc_alloc(&OBJC_CLASS___MTTVDeleteTableViewCell),  "initWithStyle:reuseIdentifier:",  0LL,  0LL);
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___MTTVStationSettingsListViewController;
    id v9 = -[MTGenericSettingsViewController tableView:cellForRowAtIndexPath:]( &v12,  "tableView:cellForRowAtIndexPath:",  v6,  v7);
    double v8 = (MTTVDeleteTableViewCell *)objc_claimAutoreleasedReturnValue(v9);
  }

  v10 = v8;

  return v10;
}

- (id)newSettingsController
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTTVStationSettingsListViewController;
  id v2 = -[MTPlaylistSettingsViewController newSettingsController](&v11, "newSettingsController");
  double v3 = (void *)objc_claimAutoreleasedReturnValue( +[MTSetting buttonSettingWithTitle:identifier:changeHandler:]( &OBJC_CLASS___MTSetting,  "buttonSettingWithTitle:identifier:changeHandler:",  0LL,  0LL,  0LL));
  objc_super v12 = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTSettingsGroup groupWithTitle:footerText:settings:]( &OBJC_CLASS___MTSettingsGroup,  "groupWithTitle:footerText:settings:",  0LL,  0LL,  v4));

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 groups]);
  id v7 = [v6 mutableCopy];

  [v7 setObject:v5 forKeyedSubscript:@"delete"];
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v2 order]);
  id v9 = [v8 mutableCopy];

  [v9 addObject:@"delete"];
  [v2 setGroups:v7];
  [v2 setOrder:v9];

  return v2;
}

- (UIAlertController)deleteStationAlertController
{
  return self->_deleteStationAlertController;
}

- (void)setDeleteStationAlertController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end