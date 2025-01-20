@interface AXTVSwitchControlSwitchesViewController
- (UIBarButtonItem)doneButtonItem;
- (UIBarButtonItem)editButtonItem;
- (id)_addNewSwitchGroup;
- (id)_addSwitchDescriptionTextForScanningStyle;
- (id)_switchListGroup;
- (id)loadSettingGroups;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_removeSwitch:(id)a3;
- (void)_updateNavigationItem;
- (void)loadView;
- (void)setDoneButtonItem:(id)a3;
- (void)setEditButtonItem:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)toggleEditMode:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXTVSwitchControlSwitchesViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchesViewController _switchListGroup](self, "_switchListGroup"));
  [v3 axSafelyAddObject:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchesViewController _addNewSwitchGroup](self, "_addNewSwitchGroup"));
  [v3 axSafelyAddObject:v5];

  return v3;
}

- (id)_addNewSwitchGroup
{
  id v3 = [[TSKSettingGroup alloc] initWithTitle:0];
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSwitchControlSwitchesViewController _addSwitchDescriptionTextForScanningStyle]( self,  "_addSwitchDescriptionTextForScanningStyle"));
  [v3 setLocalizedDescription:v4];

  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v6 = AXParameterizedLocalizedString(2LL, @"SWITCHES_ADD_LABEL");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v7,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___AXTVSwitchControlAddSwitchViewController));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  -[NSMutableArray addObject:](v5, "addObject:", v9);
  [v3 setSettingItems:v5];

  return v3;
}

- (id)_switchListGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 assistiveTouchSwitches]);
  if ([v3 count])
  {
    unsigned __int8 v4 = [v2 assistiveTouchLongPressEnabled];
    id v5 = [[TSKSettingGroup alloc] initWithTitle:0];
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472LL;
    v10 = sub_37A9C;
    v11 = &unk_66C58;
    unsigned __int8 v13 = v4;
    v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    uint64_t v6 = v12;
    [v3 enumerateObjectsUsingBlock:&v8];
    objc_msgSend(v5, "setSettingItems:", v6, v8, v9, v10, v11);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AXTVSwitchControlSwitchesViewController;
  -[AXTVSwitchControlSwitchesViewController loadView](&v3, "loadView");
  -[AXTVSwitchControlSwitchesViewController _updateNavigationItem](self, "_updateNavigationItem");
}

- (void)_updateNavigationItem
{
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v13 assistiveTouchSwitches]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchesViewController navigationItem](self, "navigationItem"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchesViewController tableView](self, "tableView"));
  unsigned int v6 = [v5 isEditing];

  if ([v3 count])
  {
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchesViewController doneButtonItem](self, "doneButtonItem"));

      if (!v7)
      {
        id v8 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]( objc_alloc(&OBJC_CLASS___UIBarButtonItem),  "initWithBarButtonSystemItem:target:action:",  0LL,  self,  "toggleEditMode:");
        -[AXTVSwitchControlSwitchesViewController setDoneButtonItem:](self, "setDoneButtonItem:", v8);
      }

      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchesViewController doneButtonItem](self, "doneButtonItem"));
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchesViewController editButtonItem](self, "editButtonItem"));

      if (!v10)
      {
        v11 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]( objc_alloc(&OBJC_CLASS___UIBarButtonItem),  "initWithBarButtonSystemItem:target:action:",  2LL,  self,  "toggleEditMode:");
        -[AXTVSwitchControlSwitchesViewController setEditButtonItem:](self, "setEditButtonItem:", v11);
      }

      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchesViewController editButtonItem](self, "editButtonItem"));
    }

    v12 = (void *)v9;
    [v4 setRightBarButtonItem:v9];
  }

  else
  {
    if (v6) {
      -[AXTVSwitchControlSwitchesViewController toggleEditMode:](self, "toggleEditMode:", 0LL);
    }
    [v4 setRightBarButtonItem:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXTVSwitchControlSwitchesViewController;
  -[AXTVSwitchControlSwitchesViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[AXTVSwitchControlSwitchesViewController reloadSettings](self, "reloadSettings");
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchesViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", a4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___AXSwitch);
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
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchesViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v9));
    uint64_t v11 = AXParameterizedLocalizedString(2LL, @"SWITCHES_DELETE_SWITCH_CONFIRMATION_TITLE");
    v25 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v26 = (void *)v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v25,  0LL,  1LL));
    id v13 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TSKSettingItem));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = TSKLocStringFromBundleCachingKey(@"SettingsCancel", v14, 0LL, 0LL, @"Localizable");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v16,  1LL,  0LL));

    v18 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TSKSettingItem));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = TSKLocStringFromBundleCachingKey(@"SettingsDelete", v19, 0LL, 0LL, @"Localizable");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_381A4;
    v27[3] = &unk_651D8;
    objc_copyWeak(&v29, &location);
    id v22 = v26;
    id v28 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v21,  2LL,  v27));

    [v12 addAction:v17];
    [v12 addAction:v23];
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchesViewController navigationController](self, "navigationController"));
    [v24 presentViewController:v12 animated:1 completion:0];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
}

- (void)toggleEditMode:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchesViewController tableView](self, "tableView", a3));
  unsigned int v5 = [v4 isEditing];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlSwitchesViewController tableView](self, "tableView"));
  [v6 setEditing:v5 ^ 1];

  -[AXTVSwitchControlSwitchesViewController _updateNavigationItem](self, "_updateNavigationItem");
}

- (void)_removeSwitch:(id)a3
{
}

- (id)_addSwitchDescriptionTextForScanningStyle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = [v2 switchControlScanningStyle];

  if ((unint64_t)v3 > 2)
  {
    unsigned int v5 = 0LL;
  }

  else
  {
    uint64_t v4 = AXParameterizedLocalizedString(2LL, *(&off_66C78 + (void)v3));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }

  return v5;
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