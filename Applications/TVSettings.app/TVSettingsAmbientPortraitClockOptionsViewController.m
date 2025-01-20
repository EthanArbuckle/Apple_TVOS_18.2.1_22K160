@interface TVSettingsAmbientPortraitClockOptionsViewController
- (TSKSettingItem)peopleFilterItem;
- (TVSettingsAmbientFacade)ambientFacade;
- (TVSettingsAmbientPortraitClockOptionsViewController)initWithAmbientFacade:(id)a3;
- (TVSettingsAmbientPreviewViewController)portraitClockPreviewViewController;
- (id)_categoriesGroup;
- (id)_updateFrequencyGroup;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_didSelectOptionItem:(id)a3;
- (void)_settingChangedToHidden:(BOOL)a3 categoryID:(id)a4;
- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5;
- (void)setPeopleFilterItem:(id)a3;
- (void)setUpPreview;
- (void)viewDidLoad;
@end

@implementation TVSettingsAmbientPortraitClockOptionsViewController

- (TVSettingsAmbientPortraitClockOptionsViewController)initWithAmbientFacade:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientPortraitClockOptionsViewController;
  v6 = -[TVSettingsAmbientPortraitClockOptionsViewController init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ambientFacade, a3);
    -[TVSettingsAmbientPortraitClockOptionsViewController setUpPreview](v7, "setUpPreview");
  }

  return v7;
}

- (void)setUpPreview
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"settings-screensaver-portraits"));
  id v3 = [[TSKVibrantImageView alloc] initWithImage:v6];
  v4 = objc_alloc_init(&OBJC_CLASS___TVSettingsAmbientPreviewViewController);
  portraitClockPreviewViewController = self->_portraitClockPreviewViewController;
  self->_portraitClockPreviewViewController = v4;

  -[TVSettingsAmbientPreviewViewController setContentView:]( self->_portraitClockPreviewViewController,  "setContentView:",  v3);
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientPortraitClockOptionsViewController;
  -[TVSettingsAmbientPortraitClockOptionsViewController viewDidLoad](&v5, "viewDidLoad");
  uint64_t v3 = TSKLocString(@"SaverBackdropPortraitClockTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[TVSettingsAmbientPortraitClockOptionsViewController setTitle:](self, "setTitle:", v4);
}

- (id)loadSettingGroups
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPortraitClockOptionsViewController _categoriesGroup](self, "_categoriesGroup"));
  v7[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientPortraitClockOptionsViewController _updateFrequencyGroup]( self,  "_updateFrequencyGroup"));
  v7[1] = v4;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));

  return v5;
}

- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientPortraitClockOptionsViewController;
  id v9 = a5;
  -[TVSettingsAmbientPortraitClockOptionsViewController editingController:didProvideValue:forSettingItem:]( &v13,  "editingController:didProvideValue:forSettingItem:",  a3,  v8,  v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientPortraitClockOptionsViewController peopleFilterItem]( self,  "peopleFilterItem",  v13.receiver,  v13.super_class));

  if (v10 == v9)
  {
    BOOL v11 = TVISPortraitClockCategoryFilterHide == (void)v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsPortraitClockCategoryItem peopleCategoryID]( &OBJC_CLASS___TVSettingsPortraitClockCategoryItem,  "peopleCategoryID"));
    -[TVSettingsAmbientPortraitClockOptionsViewController _settingChangedToHidden:categoryID:]( self,  "_settingChangedToHidden:categoryID:",  v11,  v12);
  }
}

- (id)_categoriesGroup
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPortraitClockOptionsViewController ambientFacade](self, "ambientFacade"));
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPortraitClockOptionsViewController ambientFacade](self, "ambientFacade"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100013C9C;
  v8[3] = &unk_10018ECB8;
  objc_copyWeak(&v11, &location);
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v4,  @"portraitClockCategories",  v8));

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v6;
}

- (id)_updateFrequencyGroup
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = TSKLocString(@"SaverBackdropPortraitClockUpdateFrequencyTitle");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = -[TSKSettingGroup initWithTitle:](v3, "initWithTitle:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPortraitClockOptionsViewController ambientFacade](self, "ambientFacade"));
  id v9 = (void *)objc_opt_new(&OBJC_CLASS___NSDateComponentsFormatter, v8);
  [v9 setUnitsStyle:3];
  [v9 setAllowedUnits:64];
  uint64_t v10 = TSKLocString(@"SaverBackdropPortraitClockChangeEveryActionTitle");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = TSKLocString(@"SaverBackdropPortraitClockChangeEveryDescription");
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v7 availablePortraitClockUpdateIntervals]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v11,  v13,  v7,  @"portraitClockUpdateInterval",  v14));

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10001416C;
  v25[3] = &unk_10018EC30;
  id v26 = (id)objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientPortraitClockOptionsViewController portraitClockPreviewViewController]( self,  "portraitClockPreviewViewController"));
  id v16 = v26;
  [v15 setChildControllerBlock:v25];
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  v22 = sub_1000141AC;
  v23 = &unk_10018E608;
  id v24 = v9;
  id v17 = v9;
  [v15 setUpdateBlock:&v20];
  v27 = v15;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v27,  1LL,  v20,  v21,  v22,  v23));
  -[TSKSettingGroup setSettingItems:](v6, "setSettingItems:", v18);

  return v6;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientPortraitClockOptionsViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  a3));
  portraitClockPreviewViewController = self->_portraitClockPreviewViewController;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  -[TVSettingsAmbientPreviewViewController setDescriptionText:]( portraitClockPreviewViewController,  "setDescriptionText:",  v6);

  v7 = self->_portraitClockPreviewViewController;
  uint64_t v8 = TSKLocString(@"SaverBackdropPortraitClockProcessingDescription");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[TVSettingsAmbientPreviewViewController setSpinnerText:](v7, "setSpinnerText:", v9);

  -[TVSettingsAmbientPreviewViewController setShouldShowSpinner:]( self->_portraitClockPreviewViewController,  "setShouldShowSpinner:",  -[TVSettingsAmbientFacade portraitClockFallback](self->_ambientFacade, "portraitClockFallback"));
  uint64_t v10 = self->_portraitClockPreviewViewController;

  return v10;
}

- (void)_didSelectOptionItem:(id)a3
{
  id v9 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  id v4 = [v9 isActive];
  uint64_t v5 = v4 ^ 1;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  -[TVSettingsAmbientPortraitClockOptionsViewController _settingChangedToHidden:categoryID:]( self,  "_settingChangedToHidden:categoryID:",  v4,  v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPortraitClockOptionsViewController ambientFacade](self, "ambientFacade"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  [v7 updateActiveState:v5 forPortraitClockCategoryWithID:v8];
}

- (void)_settingChangedToHidden:(BOOL)a3 categoryID:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  if (!v4
    || (id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPortraitClockOptionsViewController ambientFacade](self, "ambientFacade")),
        unsigned __int8 v7 = [v6 showCategoryHideAlertWithPresentingViewController:self categoryID:v9],  v6,  (v7 & 1) == 0))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPortraitClockOptionsViewController ambientFacade](self, "ambientFacade"));
    [v8 showFallbackAlertWithPresentingViewController:self categoryID:v9];
  }
}

- (TVSettingsAmbientFacade)ambientFacade
{
  return self->_ambientFacade;
}

- (TSKSettingItem)peopleFilterItem
{
  return self->_peopleFilterItem;
}

- (void)setPeopleFilterItem:(id)a3
{
}

- (TVSettingsAmbientPreviewViewController)portraitClockPreviewViewController
{
  return self->_portraitClockPreviewViewController;
}

- (void).cxx_destruct
{
}

@end