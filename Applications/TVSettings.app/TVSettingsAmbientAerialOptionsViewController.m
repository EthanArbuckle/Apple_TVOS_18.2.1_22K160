@interface TVSettingsAmbientAerialOptionsViewController
- (TSKScreenSaverThemePreviewViewController)frequencePreviewViewController;
- (TSKScreenSaverThemePreviewViewController)themePreviewViewController;
- (TVSettingsAmbientAerialOptionsViewController)initWithAmbientFacade:(id)a3;
- (TVSettingsAmbientFacade)ambientFacade;
- (id)_downloadFrequencyItem;
- (id)_previewForTheme:(id)a3;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_didSelectThemeItem:(id)a3;
- (void)setFrequencePreviewViewController:(id)a3;
- (void)setThemePreviewViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsAmbientAerialOptionsViewController

- (TVSettingsAmbientAerialOptionsViewController)initWithAmbientFacade:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientAerialOptionsViewController;
  v6 = -[TVSettingsAmbientAerialOptionsViewController init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ambientFacade, a3);
    v8 = objc_alloc(&OBJC_CLASS___TSKScreenSaverThemePreviewViewController);
    v9 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = -[TSKScreenSaverThemePreviewViewController initWithImageAssetName:inBundle:]( v8,  "initWithImageAssetName:inBundle:",  @"CurrentSelection-01-Aerials",  v10);
    frequencePreviewViewController = v7->_frequencePreviewViewController;
    v7->_frequencePreviewViewController = v11;

    v13 = v7->_frequencePreviewViewController;
    uint64_t v14 = TSKLocString(@"SaverBackdropRefreshDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[TSKScreenSaverThemePreviewViewController setDescriptionText:](v13, "setDescriptionText:", v15);
  }

  return v7;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientAerialOptionsViewController;
  -[TVSettingsAmbientAerialOptionsViewController viewDidLoad](&v5, "viewDidLoad");
  uint64_t v3 = TSKLocString(@"SaverBackdropAerialsTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[TVSettingsAmbientAerialOptionsViewController setTitle:](self, "setTitle:", v4);
}

- (id)loadSettingGroups
{
  uint64_t v3 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientAerialOptionsViewController _downloadFrequencyItem](self, "_downloadFrequencyItem"));
  uint64_t v14 = v4;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  -[TSKSettingGroup setSettingItems:](v3, "setSettingItems:", v5);

  uint64_t v6 = TSKLocString(@"SaverBackdropTheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientAerialOptionsViewController ambientFacade](self, "ambientFacade"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100084F70;
  v12[3] = &unk_100192058;
  v12[4] = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v7,  v8,  @"aerialThemes",  v12));

  v13[0] = v3;
  v13[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));

  return v10;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (![v4 section])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientAerialOptionsViewController frequencePreviewViewController]( self,  "frequencePreviewViewController"));
    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientAerialOptionsViewController;
    id v9 = -[TVSettingsAmbientAerialOptionsViewController previewForItemAtIndexPath:]( &v12,  "previewForItemAtIndexPath:",  v4);
    id v8 = (id)objc_claimAutoreleasedReturnValue(v9);
    goto LABEL_6;
  }

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientAerialOptionsViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 representedObject]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientAerialOptionsViewController _previewForTheme:](self, "_previewForTheme:", v6));

  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  id v8 = v7;
LABEL_6:
  v10 = v8;

  return v10;
}

- (id)_previewForTheme:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 previewImageURL]);
  if (v5)
  {
    uint64_t v6 = (TSKScreenSaverThemePreviewViewController *)objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientAerialOptionsViewController themePreviewViewController]( self,  "themePreviewViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSKScreenSaverThemePreviewViewController previewImageURL](v6, "previewImageURL"));
    unsigned __int8 v8 = [v5 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      id v9 = -[TSKScreenSaverThemePreviewViewController initWithImageURL:]( objc_alloc(&OBJC_CLASS___TSKScreenSaverThemePreviewViewController),  "initWithImageURL:",  v5);

      v10 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
      -[TSKScreenSaverThemePreviewViewController setDescriptionText:](v9, "setDescriptionText:", v10);

      -[TVSettingsAmbientAerialOptionsViewController setThemePreviewViewController:]( self,  "setThemePreviewViewController:",  v9);
      uint64_t v6 = v9;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (id)_downloadFrequencyItem
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientAerialOptionsViewController ambientFacade](self, "ambientFacade"));
  uint64_t v4 = TSKLocString(@"SaverBackdropRefreshActionTitle");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 availableRefreshIntervals]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v5,  0LL,  v3,  @"aerialRefreshInterval",  v6));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  void v13[2] = sub_10008541C;
  v13[3] = &unk_10018EC30;
  id v14 = (id)objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientAerialOptionsViewController frequencePreviewViewController]( self,  "frequencePreviewViewController"));
  id v8 = v14;
  [v7 setChildControllerBlock:v13];
  uint64_t v9 = TSKLocString(@"SaverBackdropRefreshTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v7 setDetailedLocalizedTitle:v10];

  id v11 = [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_100192078];
  [v7 setLocalizedValueFormatter:v11];

  return v7;
}

- (void)_didSelectThemeItem:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  uint64_t v4 = [v7 isActive] ^ 1;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientAerialOptionsViewController ambientFacade](self, "ambientFacade"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  [v5 updateActiveState:v4 forAerialThemeWithID:v6];
}

- (TVSettingsAmbientFacade)ambientFacade
{
  return self->_ambientFacade;
}

- (TSKScreenSaverThemePreviewViewController)frequencePreviewViewController
{
  return self->_frequencePreviewViewController;
}

- (void)setFrequencePreviewViewController:(id)a3
{
}

- (TSKScreenSaverThemePreviewViewController)themePreviewViewController
{
  return self->_themePreviewViewController;
}

- (void)setThemePreviewViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end