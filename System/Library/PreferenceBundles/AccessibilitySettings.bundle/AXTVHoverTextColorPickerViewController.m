@interface AXTVHoverTextColorPickerViewController
- (AXTVHoverTextColorPickerViewController)initWithTitle:(id)a3;
- (id)colorGetter;
- (id)colorSetter;
- (id)loadSettingGroups;
- (void)_colorCellClicked:(id)a3;
- (void)setColorGetter:(id)a3;
- (void)setColorSetter:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AXTVHoverTextColorPickerViewController

- (AXTVHoverTextColorPickerViewController)initWithTitle:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AXTVHoverTextColorPickerViewController;
  v5 = -[AXTVHoverTextColorPickerViewController init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[AXTVHoverTextColorPickerViewController setTitle:](v5, "setTitle:", v4);
  }

  return v6;
}

- (id)loadSettingGroups
{
  id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v23 = [[TSKSettingGroup alloc] initWithTitle:0];
  v25 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  objc_initWeak(&location, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_26BA0;
  v30[3] = &unk_65798;
  objc_copyWeak(&v31, &location);
  v2 = objc_retainBlock(v30);
  id v10 = AXTVLocString(@"AXHoverTextDefaultColorValue", v3, v4, v5, v6, v7, v8, v9, v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v11,  0LL,  0LL,  0LL,  self,  "_colorCellClicked:"));

  [v12 setUpdateBlock:v2];
  -[NSMutableArray addObject:](v25, "addObject:", v12);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[HTUITaggedColor userPickableColors](&OBJC_CLASS___HTUITaggedColor, "userPickableColors"));
  id v14 = [v13 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v27;
    do
    {
      v16 = 0LL;
      v17 = v12;
      do
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedName]);
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v19,  0LL,  v18,  0LL,  self,  "_colorCellClicked:"));

        [v12 setUpdateBlock:v2];
        -[NSMutableArray addObject:](v25, "addObject:", v12);
        v16 = (char *)v16 + 1;
        v17 = v12;
      }

      while (v14 != v16);
      id v14 = [v13 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }

    while (v14);
  }

  [v23 setSettingItems:v25];
  [v22 addObject:v23];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

  return v22;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 item]);
  char v24 = 0;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___HTUITaggedColor);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 representedObject]);
  uint64_t v13 = __UIAccessibilityCastAsClass(v11, v12, 1LL, &v24);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (v24) {
    abort();
  }
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"circle.fill"));
  [v8 setImage:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 font]);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v17,  3LL));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v8 imageView]);
  [v19 setPreferredSymbolConfiguration:v18];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v14 color]);
  uint64_t v21 = v20;
  if (!v20) {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](&OBJC_CLASS___UIColor, "systemBlackColor"));
  }
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v8 imageView]);
  [v22 setTintColor:v21];

  if (!v20) {
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v8 imageView]);
  }
  [v23 sizeToFit];
}

- (void)_colorCellClicked:(id)a3
{
  id v8 = a3;
  uint64_t v4 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[AXTVHoverTextColorPickerViewController colorSetter]( self,  "colorSetter"));
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 representedObject]);
    ((void (**)(void, void *))v4)[2](v4, v5);
  }

  -[AXTVHoverTextColorPickerViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVHoverTextColorPickerViewController accessibilityPreviousViewController]( self,  "accessibilityPreviousViewController"));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___TSKViewController);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    [v6 reloadSettings];
  }
}

- (id)colorGetter
{
  return self->_colorGetter;
}

- (void)setColorGetter:(id)a3
{
}

- (id)colorSetter
{
  return self->_colorSetter;
}

- (void)setColorSetter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end