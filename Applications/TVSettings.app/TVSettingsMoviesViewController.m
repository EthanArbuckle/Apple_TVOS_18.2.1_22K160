@interface TVSettingsMoviesViewController
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_showPrivacy:(id)a3;
- (void)_videoResolutionSelected:(id)a3;
@end

@implementation TVSettingsMoviesViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  v33 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = TSKLocString(@"SettingsMovieFavoritesSort");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v6,  0LL,  v3,  @"movieFavoritesSortMode",  &off_1001AF088));

  v8 = objc_alloc(&OBJC_CLASS___TSKMappingFormatter);
  uint64_t v9 = TSKLocString(@"SettingsFavoritesSortByDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v36[0] = v10;
  uint64_t v11 = TSKLocString(@"SettingsFavoritesSortAlphabetically");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v36[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 2LL));
  v14 = -[TSKMappingFormatter initWithInputs:outputs:](v8, "initWithInputs:outputs:", &off_1001AF0A0, v13);

  [v7 setLocalizedValueFormatter:v14];
  [v7 setUpdateBlock:&stru_100192C30];
  -[NSMutableArray addObject:](v4, "addObject:", v7);
  uint64_t v15 = TSKLocString(@"SettingsFavoritesSort");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v16,  0LL,  v3,  @"favoritesSortMode",  &off_1001AF0B8));

  v18 = objc_alloc(&OBJC_CLASS___TSKMappingFormatter);
  uint64_t v19 = TSKLocString(@"SettingsFavoritesSortByDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v35[0] = v20;
  uint64_t v21 = TSKLocString(@"SettingsFavoritesSortAlphabetically");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v35[1] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 2LL));
  v24 = -[TSKMappingFormatter initWithInputs:outputs:](v18, "initWithInputs:outputs:", &off_1001AF0D0, v23);

  [v17 setLocalizedValueFormatter:v24];
  [v17 setUpdateBlock:&stru_100192C50];
  -[NSMutableArray addObject:](v4, "addObject:", v17);
  tvFavoritesItem = self->_tvFavoritesItem;
  self->_tvFavoritesItem = (TSKSettingItem *)v17;
  id v26 = v17;

  v27 = (void *)objc_claimAutoreleasedReturnValue( +[OBPrivacyLinkController linkWithBundleIdentifier:]( &OBJC_CLASS___OBPrivacyLinkController,  "linkWithBundleIdentifier:",  @"com.apple.onboarding.itunesstore"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 flow]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 localizedButtonTitle]);

  v30 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v29,  0LL,  0LL,  0LL,  self,  "_showPrivacy:"));
  [v30 setAccessoryTypes:1];
  -[NSMutableArray addObject:](v4, "addObject:", v30);
  -[TSKSettingGroup setSettingItems:](v33, "setSettingItems:", v4);
  v34 = v33;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));

  return v31;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue( -[TVSettingsMoviesViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v4));
  if (v5 == self->_tvFavoritesItem)
  {
    p_tvPreviewViewController = &self->_tvPreviewViewController;
    tvPreviewViewController = self->_tvPreviewViewController;
    if (!tvPreviewViewController)
    {
      v8 = @"com.apple.TVShows";
      goto LABEL_6;
    }
  }

  else
  {
    p_tvPreviewViewController = &self->_moviesPreviewViewController;
    tvPreviewViewController = self->_moviesPreviewViewController;
    if (!tvPreviewViewController)
    {
      v8 = @"com.apple.TVMovies";
LABEL_6:
      uint64_t v9 = -[TSKAppIconPreviewViewController initWithApplicationBundleIdentifier:]( objc_alloc(&OBJC_CLASS___TSKAppIconPreviewViewController),  "initWithApplicationBundleIdentifier:",  v8);
      v10 = *p_tvPreviewViewController;
      *p_tvPreviewViewController = v9;

      tvPreviewViewController = *p_tvPreviewViewController;
    }
  }

  uint64_t v11 = tvPreviewViewController;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedDescriptionForItemInViewController:atIndexPath:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedDescriptionForItemInViewController:atIndexPath:",  self,  v4));
  -[TSKPreviewViewController setDescriptionText:](v11, "setDescriptionText:", v12);

  return v11;
}

- (void)_videoResolutionSelected:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsiTunesMoviesFacade sharedInstance]( &OBJC_CLASS___TVSettingsiTunesMoviesFacade,  "sharedInstance",  a3));
  id v4 = [v3 playbackQuality];

  if (v4) {
    uint64_t v5 = v4 != (id)1;
  }
  else {
    uint64_t v5 = 2LL;
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[TVSettingsiTunesMoviesFacade sharedInstance]( &OBJC_CLASS___TVSettingsiTunesMoviesFacade,  "sharedInstance"));
  [v6 setPlaybackQuality:v5];
}

- (void)_showPrivacy:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:]( &OBJC_CLASS___OBPrivacyPresenter,  "presenterForPrivacySplashWithIdentifier:",  @"com.apple.onboarding.itunesstore"));
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (void).cxx_destruct
{
}

@end