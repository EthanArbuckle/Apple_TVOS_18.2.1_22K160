@interface TVSettingsPreviouslyUsedEmailViewController
- (TVSettingsPreviouslyUsedEmailFacade)emailFacade;
- (TVSettingsPreviouslyUsedEmailViewController)initWithStyle:(int64_t)a3;
- (UIBarButtonItem)doneButtonItem;
- (UIBarButtonItem)editButtonItem;
- (id)loadSettingGroups;
- (id)title;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_clearAll;
- (void)_showDeleteConfirmationForItem:(id)a3;
- (void)_updateNavigationItem;
- (void)clearAll;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)setDoneButtonItem:(id)a3;
- (void)setEditButtonItem:(id)a3;
- (void)setEmailFacade:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)toggleEditMode:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSettingsPreviouslyUsedEmailViewController

- (TVSettingsPreviouslyUsedEmailViewController)initWithStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsPreviouslyUsedEmailViewController;
  v3 = -[TVSettingsPreviouslyUsedEmailViewController initWithStyle:](&v8, "initWithStyle:", a3);
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[TVSettingsPreviouslyUsedEmailFacade sharedInstance]( &OBJC_CLASS___TVSettingsPreviouslyUsedEmailFacade,  "sharedInstance"));
    emailFacade = v3->_emailFacade;
    v3->_emailFacade = (TVSettingsPreviouslyUsedEmailFacade *)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:v3 selector:"willResumeFromBackground" name:UIApplicationWillEnterForegroundNotification object:0];
  }

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  -[TVSettingsPreviouslyUsedEmailViewController reloadSettings](self, "reloadSettings");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsPreviouslyUsedEmailViewController;
  -[TVSettingsPreviouslyUsedEmailViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsPreviouslyUsedEmailViewController;
  -[TVSettingsPreviouslyUsedEmailViewController viewDidAppear:](&v3, "viewDidAppear:", a3);
  +[TVCSMetrics reportAction:](&OBJC_CLASS___TVCSMetrics, "reportAction:", 8LL);
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TVSettingsPreviouslyUsedEmailViewController;
  -[TVSettingsPreviouslyUsedEmailViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)dealloc
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsPreviouslyUsedEmailViewController;
  -[TVSettingsPreviouslyUsedEmailViewController dealloc](&v4, "dealloc");
}

- (void)toggleEditMode:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreviouslyUsedEmailViewController tableView](self, "tableView", a3));
  unsigned int v5 = [v4 isEditing];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreviouslyUsedEmailViewController tableView](self, "tableView"));
  [v6 setEditing:v5 ^ 1];

  -[TVSettingsPreviouslyUsedEmailViewController _updateNavigationItem](self, "_updateNavigationItem");
  -[TVSettingsPreviouslyUsedEmailViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (UIBarButtonItem)doneButtonItem
{
  doneButtonItem = self->_doneButtonItem;
  if (!doneButtonItem)
  {
    objc_super v4 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]( objc_alloc(&OBJC_CLASS___UIBarButtonItem),  "initWithBarButtonSystemItem:target:action:",  0LL,  self,  "toggleEditMode:");
    unsigned int v5 = self->_doneButtonItem;
    self->_doneButtonItem = v4;

    doneButtonItem = self->_doneButtonItem;
  }

  return doneButtonItem;
}

- (UIBarButtonItem)editButtonItem
{
  editButtonItem = self->_editButtonItem;
  if (!editButtonItem)
  {
    objc_super v4 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]( objc_alloc(&OBJC_CLASS___UIBarButtonItem),  "initWithBarButtonSystemItem:target:action:",  2LL,  self,  "toggleEditMode:");
    unsigned int v5 = self->_editButtonItem;
    self->_editButtonItem = v4;

    editButtonItem = self->_editButtonItem;
  }

  return editButtonItem;
}

- (void)_updateNavigationItem
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsPreviouslyUsedEmailViewController navigationItem](self, "navigationItem"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreviouslyUsedEmailViewController emailFacade](self, "emailFacade"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 previouslyUsedEmails]);
  id v5 = [v4 count];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreviouslyUsedEmailViewController tableView](self, "tableView"));
  unsigned int v7 = [v6 isEditing];

  if (!v5)
  {
    if (!v7)
    {
      [v10 setRightBarButtonItem:0];
      goto LABEL_8;
    }

    goto LABEL_5;
  }

  if ((v7 & 1) != 0)
  {
LABEL_5:
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[TVSettingsPreviouslyUsedEmailViewController doneButtonItem](self, "doneButtonItem"));
    goto LABEL_6;
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[TVSettingsPreviouslyUsedEmailViewController editButtonItem](self, "editButtonItem"));
LABEL_6:
  v9 = (void *)v8;
  [v10 setRightBarButtonItem:v8];

LABEL_8:
}

- (id)loadSettingGroups
{
  uint64_t v3 = TSKLocString(@"PreviouslyUsedEmailSectionTitle");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v4,  self->_emailFacade,  @"previouslyUsedEmails",  &stru_100190B88));

  [v5 setAutoHide:0];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreviouslyUsedEmailViewController emailFacade](self, "emailFacade"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 previouslyUsedEmails]);
  id v8 = [v7 count];

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v10 = TSKLocString(@"PreviouslyUsedClearAllEmailButtonTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v11,  0LL,  0LL,  0LL,  self,  "clearAll"));

    [v9 addObject:v12];
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v9));
    v17[0] = v5;
    v17[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  }

  else
  {
    v16 = v5;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  }

  -[TVSettingsPreviouslyUsedEmailViewController _updateNavigationItem](self, "_updateNavigationItem");

  return v14;
}

- (id)title
{
  return (id)TSKLocString(@"PreviouslyUsedTitle");
}

- (void)clearAll
{
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "section", a3) == 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue( -[TVSettingsPreviouslyUsedEmailViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  a5));
    -[TVSettingsPreviouslyUsedEmailViewController _showDeleteConfirmationForItem:]( self,  "_showDeleteConfirmationForItem:",  v6);
  }

- (void)_showDeleteConfirmationForItem:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);
  uint64_t v6 = TSKLocString(@"PreviouslyUsedEmailDeleteMessageFormat");
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 userInput]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v8));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  v9,  1LL));
  uint64_t v11 = TSKLocString(@"PreviouslyUsedDeleteEmailButtonTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v5 userInput]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v13));

  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10005724C;
  v20[3] = &unk_10018F4C0;
  objc_copyWeak(&v22, &location);
  id v15 = v5;
  id v21 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  2LL,  v20));
  [v10 addAction:v16];
  uint64_t v17 = TSKLocString(@"PreviouslyUsedDeleteEmailCancel");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v18,  1LL,  0LL));

  [v10 addAction:v19];
  -[TVSettingsPreviouslyUsedEmailViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v10,  1LL,  0LL);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)_clearAll
{
  uint64_t v3 = TSKLocString(@"PreviouslyUsedEmailClearAllMessage");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  v4,  1LL));

  objc_initWeak(&location, self);
  uint64_t v6 = TSKLocString(@"PreviouslyUsedClearAllEmailButtonTitle");
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  v14 = sub_1000574FC;
  id v15 = &unk_10018F4E8;
  objc_copyWeak(&v16, &location);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v7,  2LL,  &v12));

  objc_msgSend(v5, "addAction:", v8, v12, v13, v14, v15);
  uint64_t v9 = TSKLocString(@"PreviouslyUsedClearAllEmailEmailCancel");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v10,  1LL,  0LL));

  [v5 addAction:v11];
  -[TVSettingsPreviouslyUsedEmailViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v5,  1LL,  0LL);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (TVSettingsPreviouslyUsedEmailFacade)emailFacade
{
  return self->_emailFacade;
}

- (void)setEmailFacade:(id)a3
{
}

- (void)setEditButtonItem:(id)a3
{
}

- (void)setDoneButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end