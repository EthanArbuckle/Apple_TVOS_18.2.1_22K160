@interface AXTVSpeechPronunciationsViewController
- (AXTVSpeechPronunciationsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AXTVSpeechPronunciationsViewController)initWithStyle:(int64_t)a3;
- (UIBarButtonItem)doneButtonItem;
- (UIBarButtonItem)editButtonItem;
- (id)_addNewPronunciationGroup;
- (id)_pronunciationsListGroup;
- (id)loadSettingGroups;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_commonInit;
- (void)_removePronuncation:(id)a3;
- (void)_toggleEditMode:(id)a3;
- (void)_updateNavigationItem;
- (void)loadView;
- (void)setDoneButtonItem:(id)a3;
- (void)setEditButtonItem:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXTVSpeechPronunciationsViewController

- (AXTVSpeechPronunciationsViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AXTVSpeechPronunciationsViewController;
  v3 = -[AXTVSpeechPronunciationsViewController initWithStyle:](&v6, "initWithStyle:", a3);
  v4 = v3;
  if (v3) {
    -[AXTVSpeechPronunciationsViewController _commonInit](v3, "_commonInit");
  }
  return v4;
}

- (AXTVSpeechPronunciationsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AXTVSpeechPronunciationsViewController;
  v4 = -[AXTVSpeechPronunciationsViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4) {
    -[AXTVSpeechPronunciationsViewController _commonInit](v4, "_commonInit");
  }
  return v5;
}

- (void)_commonInit
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_9B30;
  v4[3] = &unk_654A0;
  objc_copyWeak(&v5, &location);
  id v3 = objc_loadWeakRetained(&location);
  [v2 registerUpdateBlock:v4 forRetrieveSelector:"customPronunciationSubstitutions" withListener:v3];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)loadSettingGroups
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationsViewController _pronunciationsListGroup](self, "_pronunciationsListGroup"));
  [v3 axSafelyAddObject:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationsViewController _addNewPronunciationGroup](self, "_addNewPronunciationGroup"));
  [v3 axSafelyAddObject:v5];

  return v3;
}

- (id)_addNewPronunciationGroup
{
  id v2 = [[TSKSettingGroup alloc] initWithTitle:0];
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v11 = AXTVLocString(@"AXSpeechAddPronunciationButtonTitle", v4, v5, v6, v7, v8, v9, v10, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v12,  0LL,  0LL,  0LL,  &stru_654E0));

  -[NSMutableArray addObject:](v3, "addObject:", v13);
  [v2 setSettingItems:v3];

  return v2;
}

- (id)_pronunciationsListGroup
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 customPronunciationSubstitutions]);
  id v4 = [[TSKSettingGroup alloc] initWithTitle:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_9DA8;
  v7[3] = &unk_65508;
  uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = v8;
  [v3 enumerateObjectsUsingBlock:v7];
  [v4 setSettingItems:v5];

  return v4;
}

- (void)_toggleEditMode:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationsViewController tableView](self, "tableView", a3));
  unsigned int v5 = [v4 isEditing];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationsViewController tableView](self, "tableView"));
  [v6 setEditing:v5 ^ 1];

  -[AXTVSpeechPronunciationsViewController _updateNavigationItem](self, "_updateNavigationItem");
}

- (void)_removePronuncation:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils sharedInstance](&OBJC_CLASS___AXTVUtils, "sharedInstance"));
  [v5 removePronunciationFromSettings:v4 syncWithIcloud:1];

  -[AXTVSpeechPronunciationsViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AXTVSpeechPronunciationsViewController;
  -[AXTVSpeechPronunciationsViewController loadView](&v3, "loadView");
  -[AXTVSpeechPronunciationsViewController _updateNavigationItem](self, "_updateNavigationItem");
}

- (void)_updateNavigationItem
{
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v13 customPronunciationSubstitutions]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationsViewController navigationItem](self, "navigationItem"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationsViewController tableView](self, "tableView"));
  unsigned int v6 = [v5 isEditing];

  if ([v3 count])
  {
    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationsViewController doneButtonItem](self, "doneButtonItem"));

      if (!v7)
      {
        uint64_t v8 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]( objc_alloc(&OBJC_CLASS___UIBarButtonItem),  "initWithBarButtonSystemItem:target:action:",  0LL,  self,  "_toggleEditMode:");
        -[AXTVSpeechPronunciationsViewController setDoneButtonItem:](self, "setDoneButtonItem:", v8);
      }

      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationsViewController doneButtonItem](self, "doneButtonItem"));
    }

    else
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationsViewController editButtonItem](self, "editButtonItem"));

      if (!v10)
      {
        id v11 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]( objc_alloc(&OBJC_CLASS___UIBarButtonItem),  "initWithBarButtonSystemItem:target:action:",  2LL,  self,  "_toggleEditMode:");
        -[AXTVSpeechPronunciationsViewController setEditButtonItem:](self, "setEditButtonItem:", v11);
      }

      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationsViewController editButtonItem](self, "editButtonItem"));
    }

    v12 = (void *)v9;
    [v4 setRightBarButtonItem:v9];
  }

  else
  {
    [v4 setRightBarButtonItem:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXTVSpeechPronunciationsViewController;
  -[AXTVSpeechPronunciationsViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[AXTVSpeechPronunciationsViewController reloadSettings](self, "reloadSettings");
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationsViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", a4));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TTSSubstitution);
  char isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  return isKindOfClass & 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 1)
  {
    objc_initWeak(&location, self);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationsViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v9));
    id v18 = AXTVLocString(@"AXSpeechDeletePronunciationPromptTitle", v11, v12, v13, v14, v15, v16, v17, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v34 = (void *)v10;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v33,  0LL,  1LL));
    v20 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TSKSettingItem));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    uint64_t v22 = TSKLocStringFromBundleCachingKey(@"SettingsCancel", v21, 0LL, 0LL, @"Localizable");
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v23,  1LL,  0LL));

    v25 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TSKSettingItem));
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    uint64_t v27 = TSKLocStringFromBundleCachingKey(@"SettingsDelete", v26, 0LL, 0LL, @"Localizable");
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_A460;
    v35[3] = &unk_651D8;
    objc_copyWeak(&v37, &location);
    id v29 = v34;
    id v36 = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v28,  2LL,  v35));

    [v19 addAction:v24];
    [v19 addAction:v30];
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationsViewController navigationController](self, "navigationController"));
    [v31 presentViewController:v19 animated:1 completion:0];

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
}

- (UIBarButtonItem)editButtonItem
{
  return self->_editButtonItem;
}

- (void)setEditButtonItem:(id)a3
{
}

- (UIBarButtonItem)doneButtonItem
{
  return self->_doneButtonItem;
}

- (void)setDoneButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end