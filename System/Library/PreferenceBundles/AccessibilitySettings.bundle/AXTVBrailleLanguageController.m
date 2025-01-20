@interface AXTVBrailleLanguageController
- (BRLTTableEnumerator)tableEnumerator;
- (TSKSettingItem)addTableItem;
- (UIBarButtonItem)doneButtonItem;
- (UIBarButtonItem)editButtonItem;
- (id)_brailleLanguageItems;
- (id)loadSettingGroups;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_updateNavigationItem;
- (void)addRotorItem:(id)a3;
- (void)deleteTableFromRotor:(id)a3;
- (void)loadView;
- (void)setAddTableItem:(id)a3;
- (void)setDoneButtonItem:(id)a3;
- (void)setEditButtonItem:(id)a3;
- (void)setTableEnumerator:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)toggleEditMode:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXTVBrailleLanguageController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXTVBrailleLanguageController;
  -[AXTVBrailleLanguageController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[AXTVBrailleLanguageController reloadSettings](self, "reloadSettings");
}

- (id)loadSettingGroups
{
  id v3 = [[TSKSettingGroup alloc] initWithTitle:0];
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController _brailleLanguageItems](self, "_brailleLanguageItems"));
  [v3 setSettingItems:v4];
  id v5 = [[TSKSettingGroup alloc] initWithTitle:0];
  id v13 = AXTVLocString(@"AXBrailleTranslationAddNewLanguage", v6, v7, v8, v9, v10, v11, v12, v30[0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v22 = AXTVLocString(@"AXBrailleTranslationAddNewLanguageDescription", v15, v16, v17, v18, v19, v20, v21, v30[0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v14,  v23,  0LL,  0LL,  self,  "addRotorItem:"));
  -[AXTVBrailleLanguageController setAddTableItem:](self, "setAddTableItem:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController addTableItem](self, "addTableItem"));
  [v25 setAccessoryTypes:1];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController addTableItem](self, "addTableItem"));
  v31 = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
  [v5 setSettingItems:v27];

  v30[0] = (uint64_t)v3;
  v30[1] = (uint64_t)v5;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));

  return v28;
}

- (id)_brailleLanguageItems
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userLocale]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 voiceOverBrailleLanguageRotorItems]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  if ([v6 count])
  {
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id obj = v6;
    id v8 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v8)
    {
      id v9 = v8;
      v35 = v3;
      v36 = self;
      v34 = v6;
      uint64_t v38 = *(void *)v42;
      uint64_t v10 = v7;
      uint64_t v11 = obj;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v42 != v38) {
            objc_enumerationMutation(v11);
          }
          id v13 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"Default"]);
          unsigned int v15 = [v14 BOOLValue];

          if (v15)
          {
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"LanguageDefaults"]);
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 localeIdentifier]);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v17]);

            uint64_t v19 = v5;
            if (v18)
            {
              uint64_t v20 = -[BRLTTable initWithIdentifier:](objc_alloc(&OBJC_CLASS___BRLTTable), "initWithIdentifier:", v18);
              uint64_t v21 = v36;
            }

            else
            {
              uint64_t v21 = v36;
              v25 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController tableEnumerator](v36, "tableEnumerator"));
              id v26 = [(id)objc_opt_class(v25) defaultTableForLocale:v19];
              uint64_t v20 = (BRLTTable *)objc_claimAutoreleasedReturnValue(v26);
            }

            v27 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable localizedNameWithService](v20, "localizedNameWithService"));
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3221225472LL;
            v39[2] = sub_3788;
            v39[3] = &unk_651B0;
            v39[4] = v21;
            id v40 = v19;
            v24 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v27,  0LL,  v20,  0LL,  v39));

            [v24 setIdentifier:@"Default"];
            id v5 = v19;
            uint64_t v11 = obj;
          }

          else
          {
            id v22 = objc_alloc(&OBJC_CLASS___BRLTTable);
            v23 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"RotorItem"]);
            uint64_t v20 = -[BRLTTable initWithIdentifier:](v22, "initWithIdentifier:", v23);

            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable localizedNameWithService](v20, "localizedNameWithService"));
            v24 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v16,  0LL,  v20,  0LL));
          }

          uint64_t v7 = v10;
          [v10 addObject:v24];
        }

        id v9 = [v11 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }

      while (v9);
      v28 = v11;
      uint64_t v6 = v34;
      id v3 = v35;
    }

    else
    {
      v28 = obj;
    }
  }

  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController tableEnumerator](self, "tableEnumerator"));
    id v30 = [(id)objc_opt_class(v29) defaultTableForLocale:v5];
    v28 = (void *)objc_claimAutoreleasedReturnValue(v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue([v28 localizedNameWithService]);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_36F0;
    v45[3] = &unk_651B0;
    v45[4] = self;
    id v46 = v5;
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v31,  0LL,  v28,  0LL,  v45));

    [v7 addObject:v32];
  }

  return v7;
}

- (BRLTTableEnumerator)tableEnumerator
{
  tableEnumerator = self->_tableEnumerator;
  if (!tableEnumerator)
  {
    objc_super v4 = (BRLTTableEnumerator *)objc_claimAutoreleasedReturnValue( +[BRLTTableEnumerator tableEnumeratorWithSystemBundlePath]( &OBJC_CLASS___BRLTTableEnumerator,  "tableEnumeratorWithSystemBundlePath"));
    id v5 = self->_tableEnumerator;
    self->_tableEnumerator = v4;

    tableEnumerator = self->_tableEnumerator;
  }

  return tableEnumerator;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AXTVBrailleLanguageController;
  -[AXTVBrailleLanguageController loadView](&v3, "loadView");
  -[AXTVBrailleLanguageController _updateNavigationItem](self, "_updateNavigationItem");
}

- (void)_updateNavigationItem
{
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController navigationItem](self, "navigationItem"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 voiceOverBrailleLanguageRotorItems]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController tableView](self, "tableView"));
  unsigned int v6 = [v5 isEditing];

  if ([v4 count])
  {
    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController doneButtonItem](self, "doneButtonItem"));

      if (!v7)
      {
        id v8 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]( objc_alloc(&OBJC_CLASS___UIBarButtonItem),  "initWithBarButtonSystemItem:target:action:",  0LL,  self,  "toggleEditMode:");
        -[AXTVBrailleLanguageController setDoneButtonItem:](self, "setDoneButtonItem:", v8);
      }

      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController doneButtonItem](self, "doneButtonItem"));
    }

    else
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController editButtonItem](self, "editButtonItem"));

      if (!v10)
      {
        uint64_t v11 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]( objc_alloc(&OBJC_CLASS___UIBarButtonItem),  "initWithBarButtonSystemItem:target:action:",  2LL,  self,  "toggleEditMode:");
        -[AXTVBrailleLanguageController setEditButtonItem:](self, "setEditButtonItem:", v11);
      }

      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController editButtonItem](self, "editButtonItem"));
    }

    uint64_t v12 = (void *)v9;
    [v13 setRightBarButtonItem:v9];
  }

  else
  {
    [v13 setRightBarButtonItem:0];
  }
}

- (void)toggleEditMode:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController tableView](self, "tableView", a3));
  unsigned int v5 = [v4 isEditing];

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController tableView](self, "tableView"));
  [v6 setEditing:v5 ^ 1];

  -[AXTVBrailleLanguageController _updateNavigationItem](self, "_updateNavigationItem");
}

- (void)addRotorItem:(id)a3
{
  objc_super v4 = objc_alloc(&OBJC_CLASS___AXTVBrailleAllLanguagesController);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController tableEnumerator](self, "tableEnumerator"));
  uint64_t v17 = -[AXTVBrailleAllLanguagesController initWithTableEnumerator:](v4, "initWithTableEnumerator:", v5);

  -[AXTVBrailleAllLanguagesController setAddingNewLanguage:](v17, "setAddingNewLanguage:", 1LL);
  id v13 = AXTVLocString(@"AXBrailleTranslationAddNewLanguageTitle", v6, v7, v8, v9, v10, v11, v12, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[AXTVBrailleAllLanguagesController setTitle:](v17, "setTitle:", v14);

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController navigationController](self, "navigationController"));
  [v15 pushViewController:v17 animated:1];
}

- (void)deleteTableFromRotor:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 voiceOverBrailleLanguageRotorItems]);
  id v7 = [v6 mutableCopy];

  if ([v7 count])
  {
    uint64_t v8 = 0LL;
    while (1)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v8]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"RotorItem"]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      unsigned int v12 = [v10 isEqualToString:v11];

      if (v12) {
        break;
      }
    }

    [v7 removeObjectAtIndex:v8];
  }

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", a4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController addTableItem](self, "addTableItem"));

  if (v5 == v6)
  {
    int64_t v9 = 2LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    unsigned int v8 = [v7 isEqualToString:@"Default"];

    int64_t v9 = v8 ^ 1;
  }

  return v9;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 2)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController tableView](self, "tableView"));
    [v35 setEditing:0];

    -[AXTVBrailleLanguageController addRotorItem:](self, "addRotorItem:", 0LL);
  }

  else if (a4 == 1)
  {
    objc_initWeak(&location, self);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v9));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 representedObject]);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedName]);
    id v20 = AXTVLocString(@"AXBrailleTranslationDeleteTableTitle", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v12);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    v37 = v10;

    v36 = (void *)v21;
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v21,  0LL,  1LL));
    v23 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TSKSettingItem));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v25 = TSKLocStringFromBundleCachingKey(@"SettingsCancel", v24, 0LL, 0LL, @"Localizable");
    id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v26,  1LL,  0LL));

    v28 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TSKSettingItem));
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v30 = TSKLocStringFromBundleCachingKey(@"SettingsDelete", v29, 0LL, 0LL, @"Localizable");
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_409C;
    v38[3] = &unk_651D8;
    objc_copyWeak(&v40, &location);
    id v32 = v11;
    id v39 = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v31,  2LL,  v38));

    [v22 addAction:v27];
    [v22 addAction:v33];
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController navigationController](self, "navigationController"));
    [v34 presentViewController:v22 animated:1 completion:0];

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }
}

- (void)setTableEnumerator:(id)a3
{
}

- (TSKSettingItem)addTableItem
{
  return self->_addTableItem;
}

- (void)setAddTableItem:(id)a3
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