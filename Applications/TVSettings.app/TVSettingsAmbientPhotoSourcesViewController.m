@interface TVSettingsAmbientPhotoSourcesViewController
- (TSKPreviewViewController)photosPreviewViewController;
- (TVSettingsAmbientFacade)ambientFacade;
- (TVSettingsAmbientMenuItem)photoSource;
- (TVSettingsAmbientPhotoSourcesViewController)initWithPhotoSource:(id)a3 ambientFacade:(id)a4 previewViewController:(id)a5;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_didSelectOptionItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsAmbientPhotoSourcesViewController

- (TVSettingsAmbientPhotoSourcesViewController)initWithPhotoSource:(id)a3 ambientFacade:(id)a4 previewViewController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientPhotoSourcesViewController;
  v12 = -[TVSettingsAmbientPhotoSourcesViewController init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoSource, a3);
    objc_storeStrong((id *)&v13->_ambientFacade, a4);
    objc_storeStrong((id *)&v13->_photosPreviewViewController, a5);
  }

  return v13;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientPhotoSourcesViewController;
  -[TVSettingsAmbientPhotoSourcesViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPhotoSourcesViewController photoSource](self, "photoSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedName]);
  -[TVSettingsAmbientPhotoSourcesViewController setTitle:](self, "setTitle:", v4);
}

- (id)loadSettingGroups
{
  uint64_t v3 = TSKLocString(@"SaverBackdropPhotoSourceGroupTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPhotoSourcesViewController photoSource](self, "photoSource"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100017148;
  v9[3] = &unk_10018EEF0;
  v9[4] = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v4,  v5,  @"childItems",  v9));

  id v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));

  return v7;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientPhotoSourcesViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  a3));
  photosPreviewViewController = self->_photosPreviewViewController;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  -[TSKPreviewViewController setDescriptionText:](photosPreviewViewController, "setDescriptionText:", v6);

  v7 = self->_photosPreviewViewController;
  return v7;
}

- (void)_didSelectOptionItem:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPhotoSourcesViewController ambientFacade](self, "ambientFacade"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  [v4 setSelectedPhotoSourceWithID:v5];
}

- (TVSettingsAmbientMenuItem)photoSource
{
  return self->_photoSource;
}

- (TVSettingsAmbientFacade)ambientFacade
{
  return self->_ambientFacade;
}

- (TSKPreviewViewController)photosPreviewViewController
{
  return self->_photosPreviewViewController;
}

- (void).cxx_destruct
{
}

@end