@interface AXTVCaptionCustomStylesViewController
- (TSKSettingItem)createNewStyleItem;
- (UIBarButtonItem)doneButtonItem;
- (UIBarButtonItem)editButtonItem;
- (id)_editStyleControllerWithStyle:(id)a3;
- (id)loadSettingGroups;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_updateNavigationItem;
- (void)createNewStyle:(id)a3;
- (void)deleteExistingStyle:(id)a3;
- (void)loadView;
- (void)setCreateNewStyleItem:(id)a3;
- (void)setDoneButtonItem:(id)a3;
- (void)setEditButtonItem:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)toggleEditMode:(id)a3;
@end

@implementation AXTVCaptionCustomStylesViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVAudioVideoFacade sharedInstance](&OBJC_CLASS___AXTVAudioVideoFacade, "sharedInstance"));
  objc_initWeak(&location, self);
  v20[0] = (uint64_t)_NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = (uint64_t)sub_27168;
  v20[3] = (uint64_t)&unk_662C0;
  objc_copyWeak(&v21, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v3,  @"availableCustomCaptionStyles",  v20));
  id v5 = [[TSKSettingGroup alloc] initWithTitle:0];
  id v13 = AXTVLocString(@"AXCaptionCreateNewStyleTitle", v6, v7, v8, v9, v10, v11, v12, v20[0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v14,  0LL,  0LL,  0LL,  self,  "createNewStyle:"));
  createNewStyleItem = self->_createNewStyleItem;
  self->_createNewStyleItem = v15;

  -[TSKSettingItem setAccessoryTypes:](self->_createNewStyleItem, "setAccessoryTypes:", 1LL);
  v24 = self->_createNewStyleItem;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  [v5 setSettingItems:v17];

  v23[0] = v4;
  v23[1] = v5;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v18;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AXTVCaptionCustomStylesViewController;
  -[AXTVCaptionBaseViewController loadView](&v3, "loadView");
  -[AXTVCaptionCustomStylesViewController _updateNavigationItem](self, "_updateNavigationItem");
}

- (void)_updateNavigationItem
{
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCustomStylesViewController navigationItem](self, "navigationItem"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCustomStylesViewController tableView](self, "tableView"));
  unsigned int v4 = [v3 isEditing];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVAudioVideoFacade sharedInstance](&OBJC_CLASS___AXTVAudioVideoFacade, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 availableCustomCaptionStyles]);
  id v7 = [v6 count];

  if (v7)
  {
    if (v4)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCustomStylesViewController doneButtonItem](self, "doneButtonItem"));

      if (!v8)
      {
        uint64_t v9 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]( objc_alloc(&OBJC_CLASS___UIBarButtonItem),  "initWithBarButtonSystemItem:target:action:",  0LL,  self,  "toggleEditMode:");
        -[AXTVCaptionCustomStylesViewController setDoneButtonItem:](self, "setDoneButtonItem:", v9);
      }

      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[AXTVCaptionCustomStylesViewController doneButtonItem](self, "doneButtonItem"));
    }

    else
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCustomStylesViewController editButtonItem](self, "editButtonItem"));

      if (!v11)
      {
        uint64_t v12 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]( objc_alloc(&OBJC_CLASS___UIBarButtonItem),  "initWithBarButtonSystemItem:target:action:",  2LL,  self,  "toggleEditMode:");
        -[AXTVCaptionCustomStylesViewController setEditButtonItem:](self, "setEditButtonItem:", v12);
      }

      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[AXTVCaptionCustomStylesViewController editButtonItem](self, "editButtonItem"));
    }

    id v13 = (void *)v10;
    [v14 setRightBarButtonItem:v10];
  }

  else
  {
    [v14 setRightBarButtonItem:0];
  }
}

- (void)toggleEditMode:(id)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCustomStylesViewController tableView](self, "tableView", a3));
  unsigned int v5 = [v4 isEditing];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCustomStylesViewController tableView](self, "tableView"));
  [v6 setEditing:v5 ^ 1];

  -[AXTVCaptionCustomStylesViewController _updateNavigationItem](self, "_updateNavigationItem");
}

- (void)createNewStyle:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[AXTVCaptionStyle createDefaultCaptionStyle]( &OBJC_CLASS___AXTVCaptionStyle,  "createDefaultCaptionStyle",  a3));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVAudioVideoFacade sharedInstance](&OBJC_CLASS___AXTVAudioVideoFacade, "sharedInstance"));
  [v4 setActiveCaptionStyle:v7];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVCaptionCustomStylesViewController _editStyleControllerWithStyle:]( self,  "_editStyleControllerWithStyle:",  v7));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCustomStylesViewController navigationController](self, "navigationController"));
  [v6 pushViewController:v5 animated:1];
}

- (void)deleteExistingStyle:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVAudioVideoFacade sharedInstance](&OBJC_CLASS___AXTVAudioVideoFacade, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);

  [v5 deleteCaptionStyle:v6];
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[AXTVAudioVideoFacade sharedInstance](&OBJC_CLASS___AXTVAudioVideoFacade, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v11 availableCustomCaptionStyles]);
  id v8 = [v7 count];

  if (!v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCustomStylesViewController navigationItem](self, "navigationItem"));
    [v9 setRightBarButtonItem:0];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCustomStylesViewController tableView](self, "tableView"));
    [v10 setEditing:0];
  }

  -[AXTVCaptionCustomStylesViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (id)_editStyleControllerWithStyle:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___AXTVCaptionEditStyleViewController);
  -[AXTVCaptionEditStyleViewController setStyle:](v4, "setStyle:", v3);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVAudioVideoFacade sharedInstance](&OBJC_CLASS___AXTVAudioVideoFacade, "sharedInstance"));
  [v5 setActiveCaptionStyle:v3];

  return v4;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  unsigned int v5 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue( -[AXTVCaptionCustomStylesViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  a4));
  if (v5 == self->_createNewStyleItem) {
    int64_t v6 = 2LL;
  }
  else {
    int64_t v6 = 1LL;
  }

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 2)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCustomStylesViewController tableView](self, "tableView"));
    [v34 setEditing:0];

    -[AXTVCaptionCustomStylesViewController createNewStyle:](self, "createNewStyle:", 0LL);
  }

  else if (a4 == 1)
  {
    objc_initWeak(&location, self);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVCaptionCustomStylesViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v9));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 representedObject]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 name]);

    id v20 = AXTVLocString(@"AXDeleteCustomCaptionStyleTitle", v13, v14, v15, v16, v17, v18, v19, v12);
    v37 = v10;
    v35 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v36 = (void *)v12;
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v35,  0LL,  1LL));
    v22 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TSKSettingItem));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    uint64_t v24 = TSKLocStringFromBundleCachingKey(@"SettingsCancel", v23, 0LL, 0LL, @"Localizable");
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v25,  1LL,  0LL));

    v27 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TSKSettingItem));
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v29 = TSKLocStringFromBundleCachingKey(@"SettingsDelete", v28, 0LL, 0LL, @"Localizable");
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_27A98;
    v38[3] = &unk_651D8;
    objc_copyWeak(&v40, &location);
    id v31 = v37;
    id v39 = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v30,  2LL,  v38));

    [v21 addAction:v26];
    [v21 addAction:v32];
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionCustomStylesViewController navigationController](self, "navigationController"));
    [v33 presentViewController:v21 animated:1 completion:0];

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }
}

- (TSKSettingItem)createNewStyleItem
{
  return self->_createNewStyleItem;
}

- (void)setCreateNewStyleItem:(id)a3
{
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