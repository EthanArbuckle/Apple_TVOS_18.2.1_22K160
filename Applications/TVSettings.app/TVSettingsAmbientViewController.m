@interface TVSettingsAmbientViewController
- (TSKPreviewViewController)screenSaverPreviewViewController;
- (TVSettingsAmbientFacade)ambientFacade;
- (TVSettingsAmbientViewController)init;
- (TVSettingsPosterBoardFacade)posterBoardFacade;
- (id)_activationDelayItem;
- (id)_aerialOptionsItem;
- (id)_chooseScreenSaverItem;
- (id)_photoOptionsItem;
- (id)_portraitClockOptionsItem;
- (id)_showDuringMusicItem;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_didSelectPortraitClockItem:(id)a3;
@end

@implementation TVSettingsAmbientViewController

- (TVSettingsAmbientViewController)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientViewController;
  v2 = -[TVSettingsAmbientViewController init](&v13, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___TVSettingsAmbientFacade);
    ambientFacade = v2->_ambientFacade;
    v2->_ambientFacade = v3;

    v5 = objc_opt_new(&OBJC_CLASS___TVSettingsPosterBoardFacade);
    posterBoardFacade = v2->_posterBoardFacade;
    v2->_posterBoardFacade = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"settings-screensaver-aerials"));
    id v8 = [[TSKVibrantImageView alloc] initWithImage:v7];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](&OBJC_CLASS___UIColor, "tertiaryLabelColor"));
    [v8 setTintColor:v9];

    v10 = objc_alloc_init(&OBJC_CLASS___TSKPreviewViewController);
    screenSaverPreviewViewController = v2->_screenSaverPreviewViewController;
    v2->_screenSaverPreviewViewController = v10;

    -[TSKPreviewViewController setContentView:](v2->_screenSaverPreviewViewController, "setContentView:", v8);
  }

  return v2;
}

- (id)loadSettingGroups
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientViewController _chooseScreenSaverItem](self, "_chooseScreenSaverItem"));
  -[NSMutableArray addObject:](v3, "addObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientViewController _activationDelayItem](self, "_activationDelayItem"));
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientViewController _showDuringMusicItem](self, "_showDuringMusicItem"));
  -[NSMutableArray addObject:](v3, "addObject:", v6);

  v7 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  -[TSKSettingGroup setSettingItems:](v7, "setSettingItems:", v3);
  id v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientViewController _aerialOptionsItem](self, "_aerialOptionsItem"));
  -[NSMutableArray addObject:](v8, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientViewController _photoOptionsItem](self, "_photoOptionsItem"));
  -[NSMutableArray addObject:](v8, "addObject:", v10);

  if (TVISAmbientPosterServiceIsAvailable(TVISAmbientPosterServiceIdentifierPortraitClock))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientViewController _portraitClockOptionsItem](self, "_portraitClockOptionsItem"));
    -[NSMutableArray addObject:](v8, "addObject:", v11);
  }

  v12 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v13 = TSKLocString(@"SaverBackdropCategories");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = -[TSKSettingGroup initWithTitle:](v12, "initWithTitle:", v14);

  -[TSKSettingGroup setSettingItems:](v15, "setSettingItems:", v8);
  v18[0] = v7;
  v18[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));

  return v16;
}

- (id)_chooseScreenSaverItem
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientViewController posterBoardFacade](self, "posterBoardFacade"));
  uint64_t v4 = TSKLocString(@"SaverChooseSaverTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = TSKLocString(@"SaverChooseSaverDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  uint64_t v13 = sub_1000E2AE0;
  v14 = &unk_1001904D0;
  v15 = self;
  id v16 = v3;
  id v8 = v3;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v5,  v7,  v8,  @"selectedPosterItem",  &v11));

  objc_msgSend(v9, "setUpdateBlock:", &stru_100194DD0, v11, v12, v13, v14, v15);
  return v9;
}

- (id)_activationDelayItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientViewController ambientFacade](self, "ambientFacade"));
  uint64_t v3 = TSKLocString(@"SaverStartDelayActionTitle");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = TSKLocString(@"SaverStartDelayDescription");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v2 availableActivationDelays]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v4,  v6,  v2,  @"activationDelay",  v7));

  uint64_t v9 = TSKLocString(@"SaverStartDelayTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v8 setDetailedLocalizedTitle:v10];

  [v8 setEnabledInStoreDemoMode:1];
  [v8 setUpdateBlock:&stru_100194DF0];

  return v8;
}

- (id)_showDuringMusicItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientViewController ambientFacade](self, "ambientFacade"));
  uint64_t v3 = TSKLocString(@"SaverShowDuringMusicTitle");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = TSKLocString(@"SaverShowDuringMusicDescription");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = TSKLocString(@"SaverShowDuringMusicOn");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = TSKLocString(@"SaverShowDuringMusicOff");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v4,  v6,  v2,  @"allowsOverMusic",  v8,  v10));

  [v11 setEnabledInStoreDemoMode:1];
  return v11;
}

- (id)_aerialOptionsItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientViewController ambientFacade](self, "ambientFacade"));
  uint64_t v3 = TSKLocString(@"SaverBackdropAerialsTitle");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = TSKLocString(@"SaverBackdropAerialsDescription");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000E2F90;
  v10[3] = &unk_10018EC30;
  id v11 = v2;
  id v7 = v2;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v4,  v6,  0LL,  0LL,  v10));

  return v8;
}

- (id)_photoOptionsItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientViewController ambientFacade](self, "ambientFacade"));
  uint64_t v3 = TSKLocString(@"SaverBackdropPhotosTitle");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = TSKLocString(@"SaverBackdropPhotosDescription");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000E3098;
  v10[3] = &unk_10018EC30;
  id v11 = v2;
  id v7 = v2;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v4,  v6,  0LL,  0LL,  v10));

  return v8;
}

- (id)_portraitClockOptionsItem
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientViewController ambientFacade](self, "ambientFacade"));
  uint64_t v4 = TSKLocString(@"SaverBackdropPortraitClockTitle");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  0LL,  v3,  @"portraitClockEnabled",  self,  "_didSelectPortraitClockItem:"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000E31A4;
  v9[3] = &unk_10018E608;
  id v10 = v3;
  id v7 = v3;
  [v6 setUpdateBlock:v9];

  return v6;
}

- (void)_didSelectPortraitClockItem:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientViewController ambientFacade](self, "ambientFacade", a3));
  if ([v6 isPortraitClockEnabled])
  {
    uint64_t v4 = -[TVSettingsAmbientPortraitClockOptionsViewController initWithAmbientFacade:]( objc_alloc(&OBJC_CLASS___TVSettingsAmbientPortraitClockOptionsViewController),  "initWithAmbientFacade:",  v6);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientViewController navigationController](self, "navigationController"));
    [v5 pushViewController:v4 animated:1];
  }

  else
  {
    [v6 setupPhotosWithOptions:1 presentingViewController:self];
  }
}

- (id)previewForItemAtIndexPath:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", a3));
  screenSaverPreviewViewController = self->_screenSaverPreviewViewController;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  -[TSKPreviewViewController setDescriptionText:](screenSaverPreviewViewController, "setDescriptionText:", v6);

  id v7 = self->_screenSaverPreviewViewController;
  return v7;
}

- (TVSettingsAmbientFacade)ambientFacade
{
  return self->_ambientFacade;
}

- (TVSettingsPosterBoardFacade)posterBoardFacade
{
  return self->_posterBoardFacade;
}

- (TSKPreviewViewController)screenSaverPreviewViewController
{
  return self->_screenSaverPreviewViewController;
}

- (void).cxx_destruct
{
}

@end