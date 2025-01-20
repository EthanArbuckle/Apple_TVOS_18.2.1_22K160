@interface TVSettingsAmbientChoosePosterViewController
- (TSKScreenSaverThemePreviewViewController)posterPreviewViewController;
- (TVSettingsAmbientChoosePosterViewController)initWithAmbientFacade:(id)a3 posterBoardFacade:(id)a4;
- (TVSettingsAmbientFacade)ambientFacade;
- (TVSettingsPosterBoardFacade)posterBoardFacade;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_didSelectOptionItem:(id)a3;
- (void)setPosterPreviewViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsAmbientChoosePosterViewController

- (TVSettingsAmbientChoosePosterViewController)initWithAmbientFacade:(id)a3 posterBoardFacade:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientChoosePosterViewController;
  v9 = -[TVSettingsAmbientChoosePosterViewController init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ambientFacade, a3);
    objc_storeStrong((id *)&v10->_posterBoardFacade, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientChoosePosterViewController;
  -[TVSettingsAmbientChoosePosterViewController viewDidLoad](&v5, "viewDidLoad");
  uint64_t v3 = TSKLocString(@"SaverChooseSaverTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[TVSettingsAmbientChoosePosterViewController setTitle:](self, "setTitle:", v4);
}

- (id)loadSettingGroups
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientChoosePosterViewController posterBoardFacade](self, "posterBoardFacade"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000946FC;
  v7[3] = &unk_100192920;
  v7[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v3,  @"availablePosters",  v7));

  id v8 = v4;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  return v5;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientChoosePosterViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 representedObject]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientChoosePosterViewController posterPreviewViewController]( self,  "posterPreviewViewController"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 previewImageAssetName]);

  v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "previewImageNameWithIsMusicAlbumsSelected:",  -[TVSettingsAmbientFacade isMusicAlbumsSelected](self->_ambientFacade, "isMusicAlbumsSelected")));
  if (v9)
  {
    if (([v8 isEqual:v9] & 1) == 0)
    {
      v13 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      objc_super v12 = -[TSKScreenSaverThemePreviewViewController initWithImageAssetName:inBundle:]( objc_alloc(&OBJC_CLASS___TSKScreenSaverThemePreviewViewController),  "initWithImageAssetName:inBundle:",  v9,  v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
      -[TSKScreenSaverThemePreviewViewController setDescriptionText:](v12, "setDescriptionText:", v15);

      -[TVSettingsAmbientChoosePosterViewController setPosterPreviewViewController:]( self,  "setPosterPreviewViewController:",  v12);
      goto LABEL_7;
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientChoosePosterViewController posterPreviewViewController]( self,  "posterPreviewViewController"));
  }

  else
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientChoosePosterViewController;
    id v11 = -[TVSettingsAmbientChoosePosterViewController previewForItemAtIndexPath:]( &v17,  "previewForItemAtIndexPath:",  v4);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v11);
  }

  objc_super v12 = (TSKScreenSaverThemePreviewViewController *)v10;
LABEL_7:

  return v12;
}

- (void)_didSelectOptionItem:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  if ([v6 showICloudSetupWhenSelected])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientChoosePosterViewController ambientFacade](self, "ambientFacade"));
    [v4 setupPhotosWithOptions:1 presentingViewController:self];
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientChoosePosterViewController posterBoardFacade](self, "posterBoardFacade"));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    [v4 setSelectedPosterWithID:v5];
  }
}

- (TVSettingsAmbientFacade)ambientFacade
{
  return self->_ambientFacade;
}

- (TVSettingsPosterBoardFacade)posterBoardFacade
{
  return self->_posterBoardFacade;
}

- (TSKScreenSaverThemePreviewViewController)posterPreviewViewController
{
  return self->_posterPreviewViewController;
}

- (void)setPosterPreviewViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end