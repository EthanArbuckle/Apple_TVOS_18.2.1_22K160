@interface GCTVSettingsElementCustomizationController
- (GCTVSettingsElementCustomizationController)initWithMapping:(id)a3 elements:(id)a4 controller:(id)a5 prefsStoreObj:(id)a6;
- (GCTVSettingsElementCustomizationControllerRepresentedObject)representedObject;
- (GCTVSettingsProfileController)parentVC;
- (id)indexPathForPreferredFocusedViewInTableView:(id)a3;
- (id)loadSettingGroups;
- (id)prefsStore;
- (id)previewForItemAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)dealloc;
- (void)setParentVC:(id)a3;
- (void)setRepresentedObject:(id)a3;
- (void)viewDidLoad;
@end

@implementation GCTVSettingsElementCustomizationController

- (id)prefsStore
{
  return self->_prefsStoreObj;
}

- (GCTVSettingsElementCustomizationController)initWithMapping:(id)a3 elements:(id)a4 controller:(id)a5 prefsStoreObj:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v44.receiver = self;
  v44.super_class = &OBJC_CLASS___GCTVSettingsElementCustomizationController;
  v14 = -[GCTVSettingsElementCustomizationController init](&v44, "init");
  v15 = v14;
  if (v14)
  {
    id v35 = v13;
    id v37 = v12;
    objc_storeStrong(&v14->_prefsStoreObj, a6);
    v16 = objc_alloc_init(&OBJC_CLASS___GCTVSettingsElementCustomizationControllerRepresentedObject);
    representedObject = v15->_representedObject;
    v36 = v15;
    uint64_t v34 = 24LL;
    v15->_representedObject = v16;

    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id v38 = v11;
    id obj = v11;
    id v18 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v18)
    {
      id v19 = v18;
      v20 = 0LL;
      v21 = 0LL;
      uint64_t v22 = *(void *)v41;
LABEL_4:
      uint64_t v23 = 0LL;
      while (1)
      {
        if (*(void *)v41 != v22) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v40 + 1) + 8 * v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name", v34));
        v26 = (void *)objc_claimAutoreleasedReturnValue([v10 elementKey]);
        unsigned int v27 = [v25 isEqualToString:v26];

        if (v27)
        {
          id v28 = v24;

          v20 = v28;
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue([v24 name]);
        v30 = (void *)objc_claimAutoreleasedReturnValue([v10 mappingKey]);
        unsigned int v31 = [v29 isEqualToString:v30];

        if (v31)
        {
          id v32 = v24;

          v21 = v32;
        }

        if (v20 && v21) {
          break;
        }
        if (v19 == (id)++v23)
        {
          id v19 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
          if (v19) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    else
    {
      v20 = 0LL;
      v21 = 0LL;
    }

    v15 = v36;
    [*(id *)&v36->TSKViewController_opaque[v34] setBaseElement:v20];
    [*(id *)&v36->TSKViewController_opaque[v34] setRemappedElement:v21];
    [*(id *)&v36->TSKViewController_opaque[v34] setMapping:v10];
    [*(id *)&v36->TSKViewController_opaque[v34] setElements:obj];
    id v12 = v37;
    [*(id *)&v36->TSKViewController_opaque[v34] setController:v37];
    [*(id *)&v15->TSKViewController_opaque[v34] setVc:v15];

    id v11 = v38;
    id v13 = v35;
  }

  return v15;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = &OBJC_CLASS___GCTVSettingsElementCustomizationController;
  -[GCTVSettingsElementCustomizationController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsElementCustomizationController tableView](self, "tableView"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___GCTVSettingsElementCell);
  v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___GCTVSettingsElementCell);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 registerClass:v4 forCellReuseIdentifier:v7];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___GCTVSettingsElementCell);
  v9 = NSStringFromClass(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithIdentifier:v10 forIndexPath:v6]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsElementCustomizationController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v6 section]));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsElementCustomizationController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v6));
  v14 = v13;
  if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 representedObject]);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___GCSElement);
    char isKindOfClass = objc_opt_isKindOfClass(v15, v16);

    if ((isKindOfClass & 1) != 0)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 representedObject]);
      id v19 = objc_alloc(&OBJC_CLASS___GCSElementMapping);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v18 name]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v18 name]);
      uint64_t v22 = -[GCSElementMapping initWithElementKey:mappingKey:remappingOrder:]( v19,  "initWithElementKey:mappingKey:remappingOrder:",  v20,  v21,  [v18 remappingKey]);

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsElementCustomizationControllerRepresentedObject elements]( self->_representedObject,  "elements"));
      [v11 setElementMapping:v22 elements:v23 showRemappedIcon:1];
    }

    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v14 keyPath]);
      unsigned int v25 = [v24 isEqualToString:@"invertHorizontally"];

      if (v25)
      {
        v26 = @"arrow.left.and.right.circle";
      }

      else
      {
        unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v14 keyPath]);
        unsigned int v28 = [v27 isEqualToString:@"invertVertically"];

        if (v28)
        {
          v26 = @"arrow.up.and.down.circle";
        }

        else
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue([v14 keyPath]);
          unsigned int v30 = [v29 isEqualToString:@"swapAxes"];

          if (!v30)
          {
            [v11 reset];
            goto LABEL_13;
          }

          v26 = @"arrow.clockwise.circle";
        }
      }

      [v11 setButtonIconSFSymbolsName:v26];
    }

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsElementCustomizationController representedObject](self, "representedObject"));
  __int128 v42 = _NSConcreteStackBlock;
  uint64_t v43 = 3221225472LL;
  objc_super v44 = sub_14AA0;
  v45 = &unk_4CDD0;
  objc_copyWeak(&v46, &location);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v3,  @"elements",  &v42));

  v5 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsElementCustomizationControllerRepresentedObject mapping]( self->_representedObject,  "mapping",  v42,  v43,  v44,  v45));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___GCSDirectionPadMapping);
  char isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsElementCustomizationControllerRepresentedObject mapping]( self->_representedObject,  "mapping"));
    id v9 = sub_EA9C(@"INVERT_HORIZONTALLY_TITLE");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = sub_EA9C(@"INVERT_HORIZONTALLY_DESC");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = TSKLocString(@"SettingsON");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = TSKLocString(@"SettingsOFF");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v10,  v12,  v8,  @"invertHorizontally",  v14,  v16));

    id v18 = sub_EA9C(@"INVERT_VERTICALLY_TITLE");
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    id v20 = sub_EA9C(@"INVERT_VERTICALLY_DESC");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    uint64_t v22 = TSKLocString(@"SettingsON");
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    uint64_t v24 = TSKLocString(@"SettingsOFF");
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v19,  v21,  v8,  @"invertVertically",  v23,  v25));

    id v27 = sub_EA9C(@"SWAP_AXIS_TITLE");
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    id v29 = sub_EA9C(@"SWAP_AXIS_DESC");
    unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    uint64_t v31 = TSKLocString(@"SettingsON");
    id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    uint64_t v33 = TSKLocString(@"SettingsOFF");
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v28,  v30,  v8,  @"swapAxes",  v32,  v34));

    id v36 = sub_EA9C(@"DPAD_CUSTOMIZATION_TITLE");
    id v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v49[0] = v17;
    v49[1] = v26;
    v49[2] = v35;
    id v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 3LL));
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v37,  v38));
  }

  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  &__NSArray0__struct));
  }

  v48[0] = v4;
  v48[1] = v39;
  __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 2LL));

  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);
  return v40;
}

- (id)indexPathForPreferredFocusedViewInTableView:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsElementCustomizationController representedObject](self, "representedObject", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 elements]);
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0LL;
    while (1)
    {
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsElementCustomizationController representedObject](self, "representedObject"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 elements]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v7]);

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsElementCustomizationController representedObject](self, "representedObject"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 remappedElement]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);

      if (v11 == v14) {
        break;
      }

      ++v7;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsElementCustomizationController representedObject](self, "representedObject"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 elements]);
      id v17 = [v16 count];
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v7,  0LL));
  }

  else
  {
LABEL_5:
    id v18 = 0LL;
  }

  return v18;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!self->_appPreviewViewController)
  {
    v5 = objc_alloc(&OBJC_CLASS___GCTVSettingsPreviewViewController);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsElementCustomizationControllerRepresentedObject controller]( self->_representedObject,  "controller"));
    id v7 = objc_msgSend(v6, "tvset_controllerType");
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsElementCustomizationControllerRepresentedObject baseElement]( self->_representedObject,  "baseElement"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tvset_assetName"));
    id v10 = -[GCTVSettingsPreviewViewController initWithControllerType:buttonNamed:]( v5,  "initWithControllerType:buttonNamed:",  v7,  v9);
    appPreviewViewController = self->_appPreviewViewController;
    self->_appPreviewViewController = v10;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedDescriptionForItemInViewController:atIndexPath:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedDescriptionForItemInViewController:atIndexPath:",  self,  v4));
  -[GCTVSettingsPreviewViewController setDescriptionText:](self->_appPreviewViewController, "setDescriptionText:", v12);
  uint64_t v13 = self->_appPreviewViewController;

  return v13;
}

- (void)dealloc
{
  id GCSettingsLogger = getGCSettingsLogger();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(GCSettingsLogger);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Dealloc %@", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = &OBJC_CLASS___GCTVSettingsElementCustomizationController;
  -[GCTVSettingsElementCustomizationController dealloc](&v5, "dealloc");
}

- (GCTVSettingsElementCustomizationControllerRepresentedObject)representedObject
{
  return self->_representedObject;
}

- (void)setRepresentedObject:(id)a3
{
}

- (GCTVSettingsProfileController)parentVC
{
  return (GCTVSettingsProfileController *)objc_loadWeakRetained((id *)&self->_parentVC);
}

- (void)setParentVC:(id)a3
{
}

- (void).cxx_destruct
{
}

@end