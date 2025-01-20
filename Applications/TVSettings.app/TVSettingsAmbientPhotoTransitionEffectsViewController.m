@interface TVSettingsAmbientPhotoTransitionEffectsViewController
- (TSKPreviewViewController)photosPreviewViewController;
- (TVSettingsAmbientFacade)ambientFacade;
- (TVSettingsAmbientMenuItem)transitionStyle;
- (TVSettingsAmbientPhotoTransitionEffectsViewController)initWithTransitionStyle:(id)a3 ambientFacade:(id)a4 previewViewController:(id)a5;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_didSelectEffectItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsAmbientPhotoTransitionEffectsViewController

- (TVSettingsAmbientPhotoTransitionEffectsViewController)initWithTransitionStyle:(id)a3 ambientFacade:(id)a4 previewViewController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientPhotoTransitionEffectsViewController;
  v12 = -[TVSettingsAmbientPhotoTransitionEffectsViewController init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_transitionStyle, a3);
    objc_storeStrong((id *)&v13->_ambientFacade, a4);
    objc_storeStrong((id *)&v13->_photosPreviewViewController, a5);
  }

  return v13;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientPhotoTransitionEffectsViewController;
  -[TVSettingsAmbientPhotoTransitionEffectsViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPhotoTransitionEffectsViewController transitionStyle](self, "transitionStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedName]);
  -[TVSettingsAmbientPhotoTransitionEffectsViewController setTitle:](self, "setTitle:", v4);
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPhotoTransitionEffectsViewController transitionStyle](self, "transitionStyle"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000566BC;
  v7[3] = &unk_10018EEF0;
  v7[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v3,  @"childItems",  v7));

  v8 = v4;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  return v5;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientPhotoTransitionEffectsViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  a3));
  photosPreviewViewController = self->_photosPreviewViewController;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  -[TSKPreviewViewController setDescriptionText:](photosPreviewViewController, "setDescriptionText:", v6);

  v7 = self->_photosPreviewViewController;
  return v7;
}

- (void)_didSelectEffectItem:(id)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPhotoTransitionEffectsViewController ambientFacade](self, "ambientFacade"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPhotoTransitionEffectsViewController transitionStyle](self, "transitionStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  [v4 setSelectedTransitionStyleWithStyleID:v6 effectID:v7];
}

- (TVSettingsAmbientMenuItem)transitionStyle
{
  return self->_transitionStyle;
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