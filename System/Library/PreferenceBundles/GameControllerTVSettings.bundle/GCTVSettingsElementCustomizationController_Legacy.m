@interface GCTVSettingsElementCustomizationController_Legacy
- (GCController)device;
- (GCControllerButtonInput)button;
- (GCControllerDirectionPad)dpad;
- (GCControllerElement)element;
- (GCControllerElement)mappedElement;
- (GCControllerSettings)settings;
- (GCTVSettingsElementCustomizationControllerRepresentedObject_Legacy)representedObject;
- (GCTVSettingsElementCustomizationController_Legacy)init;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)dealloc;
- (void)setButton:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDpad:(id)a3;
- (void)setElement:(id)a3;
- (void)setMappedElement:(id)a3;
- (void)setRepresentedObject:(id)a3;
- (void)setSettings:(id)a3;
- (void)updateMappableControllerElements;
- (void)viewDidLoad;
@end

@implementation GCTVSettingsElementCustomizationController_Legacy

- (GCTVSettingsElementCustomizationController_Legacy)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GCTVSettingsElementCustomizationController_Legacy;
  v2 = -[GCTVSettingsElementCustomizationController_Legacy init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___GCTVSettingsElementCustomizationControllerRepresentedObject_Legacy);
    representedObject = v2->_representedObject;
    v2->_representedObject = v3;

    -[GCTVSettingsElementCustomizationControllerRepresentedObject_Legacy setController:]( v2->_representedObject,  "setController:",  v2);
  }

  return v2;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GCTVSettingsElementCustomizationController_Legacy;
  -[GCTVSettingsElementCustomizationController_Legacy viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsElementCustomizationController_Legacy tableView](self, "tableView"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___GCTVSettingsButtonCell);
  v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___GCTVSettingsButtonCell);
  objc_super v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 registerClass:v4 forCellReuseIdentifier:v7];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___GCTVSettingsButtonCell);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithIdentifier:v10 forIndexPath:v6]);

  v12 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsElementCustomizationController_Legacy settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v6 section]));
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsElementCustomizationController_Legacy settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v6));
  v14 = v13;
  if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 representedObject]);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___GCControllerElement);
    char isKindOfClass = objc_opt_isKindOfClass(v15, v16);

    if ((isKindOfClass & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v14 representedObject]);
      [v11 setElement:v18 settings:self->_settings showRemappedIcon:0];
    }

    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v14 keyPath]);
      unsigned int v20 = [v19 isEqualToString:@"invertHorizontally"];

      if (v20)
      {
        v21 = @"arrow.left.and.right.circle";
      }

      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue([v14 keyPath]);
        unsigned int v23 = [v22 isEqualToString:@"invertVertically"];

        if (v23)
        {
          v21 = @"arrow.up.and.down.circle";
        }

        else
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue([v14 keyPath]);
          unsigned int v25 = [v24 isEqualToString:@"swapAxes"];

          if (!v25)
          {
            [v11 reset];
            goto LABEL_13;
          }

          v21 = @"arrow.clockwise.circle";
        }
      }

      [v11 setButtonIconSFSymbolsName:v21];
    }

- (void)updateMappableControllerElements
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[GCTVSettingsElementCustomizationController_Legacy device](self, "device"));
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v4 = (void *)v3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[GCTVSettingsElementCustomizationController_Legacy element](self, "element"));
  if (!v5)
  {

    goto LABEL_6;
  }

  id v6 = (void *)v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsElementCustomizationController_Legacy element](self, "element"));
  unsigned __int8 v8 = [v7 remappable];

  if ((v8 & 1) == 0)
  {
LABEL_6:
    id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsElementCustomizationController_Legacy representedObject](self, "representedObject"));
    [v12 setMappableControllerElements:v17];
    goto LABEL_7;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GCController physicalInputProfile](self->_device, "physicalInputProfile"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 _topLevelElements]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
  id v17 = (id)objc_claimAutoreleasedReturnValue([v11 sortedArrayUsingComparator:&stru_4CFA8]);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsElementCustomizationController_Legacy element](self, "element"));
  v13 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF.remappable == YES and SELF.class == %@",  objc_opt_class(v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v17 filteredArrayUsingPredicate:v14]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsElementCustomizationController_Legacy representedObject](self, "representedObject"));
  [v16 setMappableControllerElements:v15];

LABEL_7:
}

- (void)setDevice:(id)a3
{
}

- (void)setElement:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_element, a3);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___GCControllerDirectionPad);
  if ((objc_opt_isKindOfClass(v8, v5) & 1) != 0)
  {
    id v6 = &OBJC_IVAR___GCTVSettingsElementCustomizationController_Legacy__dpad;
LABEL_5:
    objc_storeStrong((id *)&self->TSKViewController_opaque[*v6], a3);
    goto LABEL_6;
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___GCControllerButtonInput);
  if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0)
  {
    id v6 = &OBJC_IVAR___GCTVSettingsElementCustomizationController_Legacy__button;
    goto LABEL_5;
  }

- (id)loadSettingGroups
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[GCControllerSettings mappingForElement:](self->_settings, "mappingForElement:", self->_element));
  -[GCTVSettingsElementCustomizationController_Legacy setMappedElement:](self, "setMappedElement:", v3);

  objc_initWeak(&location, self);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsElementCustomizationController_Legacy representedObject](self, "representedObject"));
  v40 = _NSConcreteStackBlock;
  uint64_t v41 = 3221225472LL;
  v42 = sub_124A0;
  v43 = &unk_4CFF8;
  objc_copyWeak(&v44, &location);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v4,  @"mappableControllerElements",  &v40));

  if (self->_dpad)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[GCControllerSettings settingsForElement:]( self->_settings,  "settingsForElement:",  v40,  v41,  v42,  v43));
    id v7 = sub_EA9C(@"INVERT_HORIZONTALLY_TITLE");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = sub_EA9C(@"INVERT_HORIZONTALLY_DESC");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = TSKLocString(@"SettingsON");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = TSKLocString(@"SettingsOFF");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v8,  v10,  v6,  @"invertHorizontally",  v12,  v14));

    id v16 = sub_EA9C(@"INVERT_VERTICALLY_TITLE");
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = sub_EA9C(@"INVERT_VERTICALLY_DESC");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = TSKLocString(@"SettingsON");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    uint64_t v22 = TSKLocString(@"SettingsOFF");
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v17,  v19,  v6,  @"invertVertically",  v21,  v23));

    id v25 = sub_EA9C(@"SWAP_AXIS_TITLE");
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    id v27 = sub_EA9C(@"SWAP_AXIS_DESC");
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v29 = TSKLocString(@"SettingsON");
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    uint64_t v31 = TSKLocString(@"SettingsOFF");
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v26,  v28,  v6,  @"swapAxes",  v30,  v32));

    id v34 = sub_EA9C(@"DPAD_CUSTOMIZATION_TITLE");
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v47[0] = v15;
    v47[1] = v24;
    v47[2] = v33;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 3LL));
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v35,  v36));
  }

  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  &__NSArray0__struct,  v40,  v41,  v42,  v43));
  }

  v46[0] = v5;
  v46[1] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 2LL));

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);
  return v38;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!self->_appPreviewViewController)
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___GCTVSettingsPreviewViewController);
    int64_t v6 = -[GCController tvset_controllerType](self->_device, "tvset_controllerType");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GCControllerElement tvset_assetName](self->_element, "tvset_assetName"));
    id v8 = -[GCTVSettingsPreviewViewController initWithControllerType:buttonNamed:]( v5,  "initWithControllerType:buttonNamed:",  v6,  v7);
    appPreviewViewController = self->_appPreviewViewController;
    self->_appPreviewViewController = v8;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedDescriptionForItemInViewController:atIndexPath:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedDescriptionForItemInViewController:atIndexPath:",  self,  v4));
  -[GCTVSettingsPreviewViewController setDescriptionText:](self->_appPreviewViewController, "setDescriptionText:", v10);
  uint64_t v11 = self->_appPreviewViewController;

  return v11;
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
  v5.super_class = (Class)&OBJC_CLASS___GCTVSettingsElementCustomizationController_Legacy;
  -[GCTVSettingsElementCustomizationController_Legacy dealloc](&v5, "dealloc");
}

- (GCController)device
{
  return self->_device;
}

- (GCControllerElement)element
{
  return self->_element;
}

- (GCControllerSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (GCTVSettingsElementCustomizationControllerRepresentedObject_Legacy)representedObject
{
  return self->_representedObject;
}

- (void)setRepresentedObject:(id)a3
{
}

- (GCControllerElement)mappedElement
{
  return self->_mappedElement;
}

- (void)setMappedElement:(id)a3
{
}

- (GCControllerDirectionPad)dpad
{
  return self->_dpad;
}

- (void)setDpad:(id)a3
{
}

- (GCControllerButtonInput)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end