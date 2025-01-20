@interface TVSettingsScreenSaverOptionsViewController
- (TSKScreenSaverThemePreviewViewController)themePreviewViewController;
- (TVSettingsScreenSaverFacade)facade;
- (TVSettingsScreenSaverOptionsViewController)initWithFacade:(id)a3 optionsType:(int64_t)a4;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (id)viewModels;
- (int64_t)optionsType;
- (void)didSelectOptionItem:(id)a3;
- (void)setThemePreviewViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsScreenSaverOptionsViewController

- (TVSettingsScreenSaverOptionsViewController)initWithFacade:(id)a3 optionsType:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverOptionsViewController;
  v8 = -[TVSettingsScreenSaverOptionsViewController init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_facade, a3);
    v9->_optionsType = a4;
  }

  return v9;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverOptionsViewController;
  -[TVSettingsScreenSaverOptionsViewController viewDidLoad](&v7, "viewDidLoad");
  int64_t v3 = -[TVSettingsScreenSaverOptionsViewController optionsType](self, "optionsType");
  if (v3)
  {
    if (v3 != 1) {
      return;
    }
    v4 = @"SaverBackdropLibrary";
  }

  else
  {
    v4 = @"SaverBackdropTheme";
  }

  uint64_t v5 = TSKLocString(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[TVSettingsScreenSaverOptionsViewController setTitle:](self, "setTitle:", v6);
}

- (void)didSelectOptionItem:(id)a3
{
  id v8 = a3;
  int64_t v4 = -[TVSettingsScreenSaverOptionsViewController optionsType](self, "optionsType");
  if (v4 == 1)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 representedObject]);
    facade = self->_facade;
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    -[TVSettingsScreenSaverFacade setIdleScreenLibraryFilterTypeToActiveStateWithIdentifier:]( facade,  "setIdleScreenLibraryFilterTypeToActiveStateWithIdentifier:",  v7);

    goto LABEL_5;
  }

  if (!v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 representedObject]);
    -[TVSettingsScreenSaverFacade setIdleScreenThemeWithViewModel:toActiveState:]( self->_facade,  "setIdleScreenThemeWithViewModel:toActiveState:",  v5,  [v5 isActive] ^ 1);
LABEL_5:
  }
}

- (id)viewModels
{
  int64_t v3 = -[TVSettingsScreenSaverOptionsViewController optionsType](self, "optionsType");
  if (v3 == (void *)1)
  {
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverFacade photosLibraryFilters](self->_facade, "photosLibraryFilters"));
  }

  else if (!v3)
  {
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverFacade idleScreenThemes](self->_facade, "idleScreenThemes"));
  }

  return v3;
}

- (id)loadSettingGroups
{
  int64_t v3 = -[TVSettingsScreenSaverOptionsViewController optionsType](self, "optionsType");
  int64_t v4 = @"photosLibraryFilters";
  if (v3 != 1) {
    int64_t v4 = 0LL;
  }
  if (v3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = @"idleScreenThemes";
  }
  facade = self->_facade;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000B078C;
  v10[3] = &unk_100193730;
  v10[4] = self;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  facade,  v5,  v10));
  objc_super v11 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));

  return v8;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsScreenSaverOptionsViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 representedObject]);

  uint64_t v7 = objc_opt_self(&OBJC_CLASS___TVSettingsScreenSaverViewModel);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
  {
    id v10 = v6;
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 previewImageURL]);
    if (!v11) {
      goto LABEL_4;
    }
    v12 = (void *)v11;
    p_themePreviewViewController = &self->_themePreviewViewController;
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[TSKScreenSaverThemePreviewViewController previewImageURL]( self->_themePreviewViewController,  "previewImageURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v10 previewImageURL]);
    unsigned __int8 v16 = [v14 isEqual:v15];

    if ((v16 & 1) == 0)
    {
      v21 = objc_alloc(&OBJC_CLASS___TSKScreenSaverThemePreviewViewController);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v10 previewImageURL]);
      v20 = -[TSKScreenSaverThemePreviewViewController initWithImageURL:](v21, "initWithImageURL:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescriptionText]);
      -[TSKScreenSaverThemePreviewViewController setDescriptionText:](v20, "setDescriptionText:", v23);

      objc_storeStrong((id *)p_themePreviewViewController, v20);
    }

    else
    {
LABEL_4:
      v17 = (void *)objc_claimAutoreleasedReturnValue([v10 previewImageURL]);

      if (v17)
      {
        v18 = self->_themePreviewViewController;
      }

      else
      {
        v27.receiver = self;
        v27.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverOptionsViewController;
        id v24 = -[TVSettingsScreenSaverOptionsViewController previewForItemAtIndexPath:]( &v27,  "previewForItemAtIndexPath:",  v4);
        v18 = (TSKScreenSaverThemePreviewViewController *)objc_claimAutoreleasedReturnValue(v24);
      }

      v20 = v18;
    }
  }

  else
  {
    v26.receiver = self;
    v26.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverOptionsViewController;
    id v19 = -[TVSettingsScreenSaverOptionsViewController previewForItemAtIndexPath:]( &v26,  "previewForItemAtIndexPath:",  v4);
    v20 = (TSKScreenSaverThemePreviewViewController *)objc_claimAutoreleasedReturnValue(v19);
  }

  return v20;
}

- (TVSettingsScreenSaverFacade)facade
{
  return self->_facade;
}

- (TSKScreenSaverThemePreviewViewController)themePreviewViewController
{
  return self->_themePreviewViewController;
}

- (void)setThemePreviewViewController:(id)a3
{
}

- (int64_t)optionsType
{
  return self->_optionsType;
}

- (void).cxx_destruct
{
}

@end