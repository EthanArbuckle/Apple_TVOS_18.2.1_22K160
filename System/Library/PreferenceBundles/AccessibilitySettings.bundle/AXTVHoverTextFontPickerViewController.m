@interface AXTVHoverTextFontPickerViewController
- (id)loadSettingGroups;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_fontNameCellClicked:(id)a3;
- (void)viewDidLoad;
@end

@implementation AXTVHoverTextFontPickerViewController

- (id)loadSettingGroups
{
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v21 = [[TSKSettingGroup alloc] initWithTitle:0];
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v11 = AXTVLocString(@"AXHoverTextDefaultFontValue", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v12,  0LL,  0LL,  0LL,  self,  "_fontNameCellClicked:"));

  [v13 setUpdateBlock:&stru_65DB8];
  -[NSMutableArray addObject:](v3, "addObject:", v13);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont familyNames](&OBJC_CLASS___UIFont, "familyNames"));
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      v18 = 0LL;
      v19 = v13;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  *(void *)(*((void *)&v24 + 1) + 8LL * (void)v18),  0LL,  *(void *)(*((void *)&v24 + 1) + 8LL * (void)v18),  0LL,  self,  "_fontNameCellClicked:"));

        [v13 setUpdateBlock:&stru_65DB8];
        -[NSMutableArray addObject:](v3, "addObject:", v13);
        v18 = (char *)v18 + 1;
        v19 = v13;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v16);
  }

  [v22 setSettingItems:v3];
  [v23 addObject:v22];

  return v23;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AXTVHoverTextFontPickerViewController;
  -[AXTVHoverTextFontPickerViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVHoverTextFontPickerViewController tableView](self, "tableView"));
  [v3 setRowHeight:UITableViewAutomaticDimension];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVHoverTextFontPickerViewController tableView](self, "tableView"));
  [v4 setEstimatedRowHeight:70.0];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___AXTVHoverTextFontPickerViewController;
  id v7 = -[AXTVHoverTextFontPickerViewController tableView:cellForRowAtIndexPath:]( &v19,  "tableView:cellForRowAtIndexPath:",  a3,  v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (![v6 section])
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVHoverTextFontPickerViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v6));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 representedObject]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 text]);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 font]);
    [v14 pointSize];
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithName:size:](&OBJC_CLASS___UIFont, "fontWithName:size:", v10));

    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVUtils _defaultAttributedStringForString:withFont:]( &OBJC_CLASS___AXTVUtils,  "_defaultAttributedStringForString:withFont:",  v12,  v15));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
    [v17 setAttributedText:v16];
  }

  return v8;
}

- (void)_fontNameCellClicked:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v5 setHoverTextFontName:v4];

  -[AXTVHoverTextFontPickerViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[AXTVHoverTextFontPickerViewController accessibilityPreviousViewController]( self,  "accessibilityPreviousViewController"));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TSKViewController);
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
    [v7 reloadSettings];
  }
}

@end