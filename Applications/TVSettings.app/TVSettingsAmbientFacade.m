@interface TVSettingsAmbientFacade
+ (void)_openApplicationWithIdentifer:(id)a3;
+ (void)enableSoundScapeWithID:(id)a3 inItems:(id)a4;
- (AMSBag)amsBag;
- (BOOL)_portraitClockCategoryHideAllowedWithID:(id)a3;
- (BOOL)allowsOverMusic;
- (BOOL)isMusicAlbumsSelected;
- (BOOL)isPortraitClockEnabled;
- (BOOL)portraitClockFallback;
- (BOOL)showCategoryHideAlertWithPresentingViewController:(id)a3 categoryID:(id)a4;
- (BOOL)showFallbackAlertWithPresentingViewController:(id)a3 categoryID:(id)a4;
- (NSArray)aerialThemes;
- (NSArray)availableActivationDelays;
- (NSArray)availablePortraitClockCategoryFilters;
- (NSArray)availablePortraitClockUpdateIntervals;
- (NSArray)availableRefreshIntervals;
- (NSArray)myPhotoSources;
- (NSArray)otherPhotoSources;
- (NSArray)photoSources;
- (NSArray)portraitClockCategories;
- (NSArray)transitionStyles;
- (NSDictionary)leafPhotoSourcesByIdentifier;
- (NSString)aerialRefreshInterval;
- (NSString)portraitClockPeopleFilter;
- (NSString)selectedPhotoSourceValue;
- (NSString)selectedTransitionStyleValue;
- (TVISAmbientSettingsServiceProxy)serviceProxy;
- (TVSPreferences)portraitClockPreferences;
- (TVSPreferences)screenSaverPreferences;
- (TVSettingsAmbientFacade)init;
- (TVSettingsAmbientMenuItem)selectedTransitionStyle;
- (TVSettingsAmbientPhotoSourceMenuItem)selectedPhotoSource;
- (int64_t)activationDelay;
- (int64_t)portraitClockUpdateInterval;
- (void)_updateAerialThemesWithOptions:(id)a3;
- (void)_updatePhotoSourcesWithObjects:(id)a3;
- (void)_updatePortraitClockWithEnabled:(BOOL)a3 fallback:(BOOL)a4 options:(id)a5;
- (void)_updateTransitionStylesWithObjects:(id)a3;
- (void)_updateTrantionStylesViewModel;
- (void)_updateViewModels;
- (void)navigateToPhotoSourceWithID:(id)a3;
- (void)needsRequeryWithService:(id)a3;
- (void)setActivationDelay:(int64_t)a3;
- (void)setAerialRefreshInterval:(id)a3;
- (void)setAerialThemes:(id)a3;
- (void)setAllowsOverMusic:(BOOL)a3;
- (void)setLeafPhotoSourcesByIdentifier:(id)a3;
- (void)setMyPhotoSources:(id)a3;
- (void)setOtherPhotoSources:(id)a3;
- (void)setPhotoSources:(id)a3;
- (void)setPortraitClockCategories:(id)a3;
- (void)setPortraitClockEnabled:(BOOL)a3;
- (void)setPortraitClockPeopleFilter:(id)a3;
- (void)setPortraitClockUpdateInterval:(int64_t)a3;
- (void)setSelectedPhotoSource:(id)a3;
- (void)setSelectedPhotoSourceValue:(id)a3;
- (void)setSelectedPhotoSourceWithID:(id)a3;
- (void)setSelectedTransitionStyle:(id)a3;
- (void)setSelectedTransitionStyleValue:(id)a3;
- (void)setSelectedTransitionStyleWithStyleID:(id)a3 effectID:(id)a4;
- (void)setTransitionStyles:(id)a3;
- (void)setupPhotosWithOptions:(int64_t)a3 presentingViewController:(id)a4;
- (void)updateActiveState:(BOOL)a3 forAerialThemeWithID:(id)a4;
- (void)updateActiveState:(BOOL)a3 forPortraitClockCategoryWithID:(id)a4;
@end

@implementation TVSettingsAmbientFacade

- (TVSettingsAmbientFacade)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientFacade;
  v2 = -[TVSettingsAmbientFacade init](&v14, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[TVSPreferences sharedScreenSaverPreferences](&OBJC_CLASS___TVSPreferences, "sharedScreenSaverPreferences"));
    screenSaverPreferences = v2->_screenSaverPreferences;
    v2->_screenSaverPreferences = (TVSPreferences *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPortraitClockPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPortraitClockPreferences"));
    portraitClockPreferences = v2->_portraitClockPreferences;
    v2->_portraitClockPreferences = (TVSPreferences *)v5;

    v7 = objc_opt_new(&OBJC_CLASS___TVISAmbientSettingsServiceProxy);
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[AMSSyncPasswordSettingsTask bagSubProfile]( &OBJC_CLASS___AMSSyncPasswordSettingsTask,  "bagSubProfile"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[AMSSyncPasswordSettingsTask bagSubProfileVersion]( &OBJC_CLASS___AMSSyncPasswordSettingsTask,  "bagSubProfileVersion"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[AMSBag bagForProfile:profileVersion:](&OBJC_CLASS___AMSBag, "bagForProfile:profileVersion:", v9, v10));
    amsBag = v2->_amsBag;
    v2->_amsBag = (AMSBag *)v11;

    *(_WORD *)&v2->_portraitClockEnabled = 1;
    -[TVSettingsAmbientFacade _updateViewModels](v2, "_updateViewModels");
    -[TVISAmbientSettingsServiceProxy setDelegate:](v2->_serviceProxy, "setDelegate:", v2);
  }

  return v2;
}

- (NSArray)availableActivationDelays
{
  v5[0] = &off_1001AD1B8;
  v5[1] = &off_1001AD1D0;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  TVScreenSaverDefaultActivationDelay));
  v5[2] = v2;
  v5[3] = &off_1001AD1E8;
  v5[4] = &off_1001AD200;
  v5[5] = &off_1001AD218;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 6LL));

  return (NSArray *)v3;
}

- (NSArray)availableRefreshIntervals
{
  v3[0] = TVScreenSaverIdleScreenRefreshIntervalNever;
  v3[1] = TVScreenSaverIdleScreenRefreshIntervalDaily;
  v3[2] = TVScreenSaverIdleScreenRefreshIntervalWeekly;
  v3[3] = TVScreenSaverIdleScreenRefreshIntervalMonthly;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  4LL));
}

- (int64_t)activationDelay
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade screenSaverPreferences](self, "screenSaverPreferences"));
  uint64_t v3 = (uint64_t)[v2 activationDelay];

  return v3 & ~(v3 >> 63);
}

- (void)setActivationDelay:(int64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade screenSaverPreferences](self, "screenSaverPreferences"));
  [v5 setActivationDelay:a3];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade screenSaverPreferences](self, "screenSaverPreferences"));
  [v6 synchronize];
}

- (BOOL)allowsOverMusic
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade screenSaverPreferences](self, "screenSaverPreferences"));
  unsigned __int8 v3 = [v2 allowsScreenSaverOverMusic];

  return v3;
}

- (void)setAllowsOverMusic:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade screenSaverPreferences](self, "screenSaverPreferences"));
  [v5 setAllowsScreenSaverOverMusic:v3];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade screenSaverPreferences](self, "screenSaverPreferences"));
  [v6 synchronize];
}

- (NSString)aerialRefreshInterval
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade screenSaverPreferences](self, "screenSaverPreferences"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringForKey:TVScreenSaverIdleScreenRefreshIntervalKey]);
  v4 = v3;
  if (!v3) {
    BOOL v3 = (void *)TVScreenSaverIdleScreenRefreshIntervalMonthly;
  }
  uint64_t v5 = v3;

  return v5;
}

- (void)setAerialRefreshInterval:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade screenSaverPreferences](self, "screenSaverPreferences"));
  id v6 = [v4 copy];

  [v5 setObject:v6 forKey:TVScreenSaverIdleScreenRefreshIntervalKey];
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade screenSaverPreferences](self, "screenSaverPreferences"));
  [v7 synchronize];
}

- (void)updateActiveState:(BOOL)a3 forAerialThemeWithID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[TVSettingsAmbientFacade updateActiveState:forAerialThemeWithID:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - aerial theme ID: %@",  buf,  0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade aerialThemes](self, "aerialThemes"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10007532C;
  v15[3] = &unk_1001917F8;
  id v8 = v6;
  id v16 = v8;
  id v9 = [v7 indexOfObjectPassingTest:v15];

  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[TVSettingsAmbientFacade updateActiveState:forAerialThemeWithID:]";
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - aerial theme not found for ID: %@",  buf,  0x16u);
    }
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade aerialThemes](self, "aerialThemes"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v9]);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade serviceProxy](self, "serviceProxy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 model]);
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
    [v12 updateActiveStateForAerialThemeWithID:v14 activate:v4 reply:0];

    [v11 setActive:v4];
  }
}

+ (void)enableSoundScapeWithID:(id)a3 inItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        id v13 = [v12 isEqualToString:v5];

        [v11 setActive:v13];
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }
}

- (BOOL)isMusicAlbumsSelected
{
  return -[TVSettingsAmbientPhotoSourceMenuItem isMusicAlbumsOption](self->_selectedPhotoSource, "isMusicAlbumsOption");
}

- (void)setSelectedPhotoSourceWithID:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315394;
    __int16 v19 = "-[TVSettingsAmbientFacade setSelectedPhotoSourceWithID:]";
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - photo source ID: %@",  (uint8_t *)&v18,  0x16u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade leafPhotoSourcesByIdentifier](self, "leafPhotoSourcesByIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (v6)
  {
    if ([v6 isSelected])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315138;
        __int16 v19 = "-[TVSettingsAmbientFacade setSelectedPhotoSourceWithID:]";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - photo source already selected",  (uint8_t *)&v18,  0xCu);
      }
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 model]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade serviceProxy](self, "serviceProxy"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 source]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      [v8 setSelectedPhotoSourceWithSourceID:v10 collectionID:v11 reply:0];

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade selectedPhotoSource](self, "selectedPhotoSource"));
      +[TVSettingsAmbientMenuItem selectItem:unselectItem:]( &OBJC_CLASS___TVSettingsAmbientMenuItem,  "selectItem:unselectItem:",  v6,  v12);

      -[TVSettingsAmbientFacade setSelectedPhotoSource:](self, "setSelectedPhotoSource:", v6);
      id v13 = v6;
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 parentMenuItem]);

      if (v14)
      {
        do
        {
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 parentMenuItem]);

          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 parentMenuItem]);
          id v13 = v15;
        }

        while (v16);
      }

      else
      {
        __int128 v15 = v13;
      }

      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedName]);
      -[TVSettingsAmbientFacade setSelectedPhotoSourceValue:](self, "setSelectedPhotoSourceValue:", v17);

      -[TVSettingsAmbientFacade _updateTrantionStylesViewModel](self, "_updateTrantionStylesViewModel");
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000F8CDC();
  }
}

- (void)navigateToPhotoSourceWithID:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v18 = "-[TVSettingsAmbientFacade navigateToPhotoSourceWithID:]";
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - photo source ID: %@",  buf,  0x16u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade leafPhotoSourcesByIdentifier](self, "leafPhotoSourcesByIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 model]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 source]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 urlScheme]);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v7 source]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 urlScheme]);
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@://open",  v11));
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v12));

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v18 = "-[TVSettingsAmbientFacade navigateToPhotoSourceWithID:]";
        __int16 v19 = 2112;
        id v20 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - navigating by URL: %@",  buf,  0x16u);
      }

      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
      [v14 openURL:v13 withCompletionHandler:0];
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
        *(_DWORD *)buf = 136315394;
        int v18 = "-[TVSettingsAmbientFacade navigateToPhotoSourceWithID:]";
        __int16 v19 = 2112;
        id v20 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - navigating by identifier: %@",  buf,  0x16u);
      }

      __int128 v16 = (void *)objc_opt_class(self);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      [v16 _openApplicationWithIdentifer:v13];
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v18 = "-[TVSettingsAmbientFacade navigateToPhotoSourceWithID:]";
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - photo source not found for ID: %@",  buf,  0x16u);
  }
}

- (void)setSelectedTransitionStyleWithStyleID:(id)a3 effectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[TVSettingsAmbientFacade setSelectedTransitionStyleWithStyleID:effectID:]";
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - styleID: %@, effectID: %@",  buf,  0x20u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade transitionStyles](self, "transitionStyles"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100075CDC;
  v19[3] = &unk_100191820;
  id v9 = v6;
  id v20 = v9;
  id v10 = [v8 indexOfObjectPassingTest:v19];

  if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F8D50();
    }
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade transitionStyles](self, "transitionStyles"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:v10]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade serviceProxy](self, "serviceProxy"));
    [v13 setSelectedPhotoSlideShowStyleWithStyleID:v9 effectID:v7 reply:0];

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade selectedTransitionStyle](self, "selectedTransitionStyle"));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsAmbientMenuItem deepestSelectedItemFromItem:]( &OBJC_CLASS___TVSettingsAmbientMenuItem,  "deepestSelectedItemFromItem:",  v14));

    if (v7) {
      id v16 = (id)objc_claimAutoreleasedReturnValue([v12 queryChildItemWithIdentifier:v7]);
    }
    else {
      id v16 = v12;
    }
    __int128 v17 = v16;
    +[TVSettingsAmbientMenuItem selectItem:unselectItem:]( &OBJC_CLASS___TVSettingsAmbientMenuItem,  "selectItem:unselectItem:",  v16,  v15);
    -[TVSettingsAmbientFacade setSelectedTransitionStyle:](self, "setSelectedTransitionStyle:", v12);
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedName]);
    -[TVSettingsAmbientFacade setSelectedTransitionStyleValue:](self, "setSelectedTransitionStyleValue:", v18);
  }
}

- (void)updateActiveState:(BOOL)a3 forPortraitClockCategoryWithID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v18 = "-[TVSettingsAmbientFacade updateActiveState:forPortraitClockCategoryWithID:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - portrait clock category ID: %@",  buf,  0x16u);
  }

  if (v4
    || -[TVSettingsAmbientFacade _portraitClockCategoryHideAllowedWithID:]( self,  "_portraitClockCategoryHideAllowedWithID:",  v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade portraitClockCategories](self, "portraitClockCategories"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100075FAC;
    v15[3] = &unk_1001917F8;
    id v8 = v6;
    id v16 = v8;
    id v9 = [v7 indexOfObjectPassingTest:v15];

    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v18 = "-[TVSettingsAmbientFacade updateActiveState:forPortraitClockCategoryWithID:]";
        __int16 v19 = 2112;
        id v20 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - portrait clock category not found for ID: %@",  buf,  0x16u);
      }
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade portraitClockCategories](self, "portraitClockCategories"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v9]);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade serviceProxy](self, "serviceProxy"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 model]);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
      [v12 updateActiveStateForPortraitClockCategoryWithID:v14 activate:v4 reply:0];

      [v11 setActive:v4];
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v18 = "-[TVSettingsAmbientFacade updateActiveState:forPortraitClockCategoryWithID:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - Cannot hide portrait clock category since all other categories are hidden",  buf,  0xCu);
  }
}

- (NSArray)availablePortraitClockUpdateIntervals
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  TVSPortraitClockUpdateIntervalTwoMinutes));
  v8[0] = v2;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  TVSPortraitClockUpdateIntervalFiveMinutes));
  v8[1] = v3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  TVSPortraitClockUpdateIntervalTenMinutes));
  v8[2] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  TVSPortraitClockUpdateIntervalFifteenMinutes));
  v8[3] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 4LL));

  return (NSArray *)v6;
}

- (int64_t)portraitClockUpdateInterval
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade portraitClockPreferences](self, "portraitClockPreferences"));
  id v3 = [v2 portraitClockUpdateInterval];

  return (int64_t)v3;
}

- (void)setPortraitClockUpdateInterval:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade portraitClockPreferences](self, "portraitClockPreferences"));
  [v4 setPortraitClockUpdateInterval:a3];
}

- (NSArray)availablePortraitClockCategoryFilters
{
  v3[0] = TVISPortraitClockCategoryFilterAll;
  v3[1] = TVISPortraitClockCategoryFilterFavorites;
  v3[2] = TVISPortraitClockCategoryFilterHide;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  3LL));
}

- (NSString)portraitClockPeopleFilter
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade portraitClockCategories](self, "portraitClockCategories"));
  id v4 = [v3 indexOfObjectPassingTest:&stru_100191860];

  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsPortraitClockCategoryItem peopleCategoryID]( &OBJC_CLASS___TVSettingsPortraitClockCategoryItem,  "peopleCategoryID"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      v12 = "-[TVSettingsAmbientFacade portraitClockPeopleFilter]";
      __int16 v13 = 2114;
      __int128 v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - portrait clock category not found for people, ID: %{public}@",  (uint8_t *)&v11,  0x16u);
    }

    id v6 = TVISPortraitClockCategoryFilterAll;

    return (NSString *)v6;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade portraitClockCategories](self, "portraitClockCategories"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v4]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 categoryFilter]);
    return (NSString *)v10;
  }

- (void)setPortraitClockPeopleFilter:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    __int128 v15 = "-[TVSettingsAmbientFacade setPortraitClockPeopleFilter:]";
    __int16 v16 = 2114;
    id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - portrait clock people category filter: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  if ((id)TVISPortraitClockCategoryFilterHide == v4
    && (id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsPortraitClockCategoryItem peopleCategoryID]( &OBJC_CLASS___TVSettingsPortraitClockCategoryItem,  "peopleCategoryID")),  v6 = -[TVSettingsAmbientFacade _portraitClockCategoryHideAllowedWithID:]( self,  "_portraitClockCategoryHideAllowedWithID:",  v5),  v5,  (v6 & 1) == 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      __int128 v15 = "-[TVSettingsAmbientFacade setPortraitClockPeopleFilter:]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - Cannot hide portrait clock category since all other categories are hidden",  (uint8_t *)&v14,  0xCu);
    }
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade serviceProxy](self, "serviceProxy"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsPortraitClockCategoryItem peopleCategoryID]( &OBJC_CLASS___TVSettingsPortraitClockCategoryItem,  "peopleCategoryID"));
    [v7 updateFilterForPortraitClockCategoryWithID:v8 categoryFilter:v4 reply:&stru_100191880];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade portraitClockCategories](self, "portraitClockCategories"));
    id v10 = [v9 indexOfObjectPassingTest:&stru_1001918A0];

    if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsPortraitClockCategoryItem peopleCategoryID]( &OBJC_CLASS___TVSettingsPortraitClockCategoryItem,  "peopleCategoryID"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315394;
        __int128 v15 = "-[TVSettingsAmbientFacade setPortraitClockPeopleFilter:]";
        __int16 v16 = 2114;
        id v17 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - portrait clock category not found for people, ID: %{public}@",  (uint8_t *)&v14,  0x16u);
      }
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade portraitClockCategories](self, "portraitClockCategories"));
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v10]);

      [v13 setCategoryFilter:v4];
      objc_msgSend(v13, "setActive:", objc_msgSend(v13, "isCategoryFilterEnabled"));
    }
  }
}

- (BOOL)showFallbackAlertWithPresentingViewController:(id)a3 categoryID:(id)a4
{
  id v6 = a4;
  BOOL portraitClockFallback = self->_portraitClockFallback;
  if (self->_portraitClockFallback)
  {
    id v8 = a3;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsPortraitClockCategoryItem peopleCategoryID]( &OBJC_CLASS___TVSettingsPortraitClockCategoryItem,  "peopleCategoryID"));
    unsigned __int8 v10 = [v6 isEqualToString:v9];

    if ((v10 & 1) != 0)
    {
      int v11 = @"PortraitClockFallbackAlertPeopleMessage";
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsPortraitClockCategoryItem petsCategoryID]( &OBJC_CLASS___TVSettingsPortraitClockCategoryItem,  "petsCategoryID"));
      unsigned __int8 v13 = [v6 isEqualToString:v12];

      if ((v13 & 1) != 0)
      {
        int v11 = @"PortraitClockFallbackAlertPetsMessage";
      }

      else
      {
        int v14 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsPortraitClockCategoryItem natureCategoryID]( &OBJC_CLASS___TVSettingsPortraitClockCategoryItem,  "natureCategoryID"));
        unsigned __int8 v15 = [v6 isEqualToString:v14];

        if ((v15 & 1) != 0)
        {
          int v11 = @"PortraitClockFallbackAlertNatureMessage";
        }

        else
        {
          __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsPortraitClockCategoryItem cityscapesCategoryID]( &OBJC_CLASS___TVSettingsPortraitClockCategoryItem,  "cityscapesCategoryID"));
          unsigned int v17 = [v6 isEqualToString:v16];

          if (v17) {
            int v11 = @"PortraitClockFallbackAlertCityscapesMessage";
          }
          else {
            int v11 = @"PortraitClockFallbackAlertDefaultMessage";
          }
        }
      }
    }

    uint64_t v18 = TSKLocString(@"PortraitClockFallbackAlertTitle");
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = TSKLocString(v11);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v19,  v21,  1LL));

    uint64_t v23 = TSKLocString(@"OK");
    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v24,  0LL,  0LL));
    [v22 addAction:v25];

    [v8 presentViewController:v22 animated:1 completion:0];
  }

  return portraitClockFallback;
}

- (BOOL)showCategoryHideAlertWithPresentingViewController:(id)a3 categoryID:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = -[TVSettingsAmbientFacade _portraitClockCategoryHideAllowedWithID:]( self,  "_portraitClockCategoryHideAllowedWithID:",  a4);
  if ((v7 & 1) == 0)
  {
    uint64_t v8 = TSKLocString(@"PortraitClockAllCategoriesHiddenAlertTitle");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = TSKLocString(@"PortraitClockAllCategoriesHiddenAlertMessage");
    int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v9,  v11,  1LL));

    uint64_t v13 = TSKLocString(@"OK");
    int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  0LL,  0LL));
    [v12 addAction:v15];

    [v6 presentViewController:v12 animated:1 completion:0];
  }

  return v7 ^ 1;
}

- (void)needsRequeryWithService:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[TVSettingsAmbientFacade needsRequeryWithService:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s",  (uint8_t *)&v4,  0xCu);
  }

  -[TVSettingsAmbientFacade _updateViewModels](self, "_updateViewModels");
}

- (void)setupPhotosWithOptions:(int64_t)a3 presentingViewController:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userProfilesSnapshot]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 primaryUserProfile]);

  if (v9)
  {
    id v10 = -[TVPiCloudPhotosWelcomeViewController initDisplaySharedAlbums:]( objc_alloc(&OBJC_CLASS___TVPiCloudPhotosWelcomeViewController),  "initDisplaySharedAlbums:",  ((unint64_t)a3 >> 1) & 1);
    objc_initWeak(&location, v10);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100076D74;
    v33[3] = &unk_10018E810;
    objc_copyWeak(&v34, &location);
    int v11 = objc_retainBlock(v33);
    v12 = objc_alloc(&OBJC_CLASS___TVSettingsUser);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade amsBag](self, "amsBag"));
    int v14 = -[TVSettingsUser initWithUserProfile:amsBag:](v12, "initWithUserProfile:amsBag:", v9, v13);

    unsigned __int8 v15 = -[TVSettingsUserProfileFacade initWithUser:]( objc_alloc(&OBJC_CLASS___TVSettingsUserProfileFacade),  "initWithUser:",  v14);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100076E20;
    v29[3] = &unk_1001918E8;
    objc_copyWeak(&v32, &location);
    __int16 v16 = v15;
    v30 = v16;
    unsigned int v17 = v11;
    id v31 = v17;
    [v10 setOnSelection:v29];
    [v6 presentViewController:v10 animated:1 completion:0];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  else
  {
    uint64_t v18 = TSKLocString(@"iCloudPhotoDefaultUserAlertTitle");
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = TSKLocString(@"iCloudPhotoDefaultUserAlertMessage");
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v19,  v21,  1LL));

    uint64_t v23 = TSKLocString(@"iCloudPhotoDefaultUserAlertOKAction");
    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v24,  0LL,  &stru_1001918C0));
    [v22 addAction:v25];

    uint64_t v26 = TSKLocString(@"iCloudPhotoDefaultUserAlertCancelAction");
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v27,  1LL,  0LL));
    [v22 addAction:v28];

    [v6 presentViewController:v22 animated:1 completion:0];
  }
}

- (void)_updateViewModels
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = "-[TVSettingsAmbientFacade _updateViewModels]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade serviceProxy](self, "serviceProxy"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100077194;
  v10[3] = &unk_100190960;
  objc_copyWeak(&v11, (id *)buf);
  [v3 queryAerialThemesWithReply:v10];

  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade serviceProxy](self, "serviceProxy"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000772A4;
  v8[3] = &unk_100190960;
  objc_copyWeak(&v9, (id *)buf);
  [v4 queryPhotoSourceOptionsWithReply:v8];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade serviceProxy](self, "serviceProxy"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000773BC;
  v6[3] = &unk_100191938;
  objc_copyWeak(&v7, (id *)buf);
  [v5 queryPortraitClockStateWithReply:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)_updateTrantionStylesViewModel
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[TVSettingsAmbientFacade _updateTrantionStylesViewModel]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak(&location, self);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade selectedPhotoSource](self, "selectedPhotoSource"));
  if ([v3 isSlideshowOption])
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade serviceProxy](self, "serviceProxy"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000776CC;
    v5[3] = &unk_100190960;
    objc_copyWeak(&v6, &location);
    [v4 queryPhotoSlideShowStylesWithReply:v5];

    objc_destroyWeak(&v6);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v9 = "-[TVSettingsAmbientFacade _updateTrantionStylesViewModel]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - transition style did reset",  buf,  0xCu);
    }

    -[TVSettingsAmbientFacade setTransitionStyles:](self, "setTransitionStyles:", 0LL);
    -[TVSettingsAmbientFacade setSelectedTransitionStyleValue:](self, "setSelectedTransitionStyleValue:", 0LL);
  }

  objc_destroyWeak(&location);
}

- (void)_updateAerialThemesWithOptions:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v20 = "-[TVSettingsAmbientFacade _updateAerialThemesWithOptions:]";
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - themes: %@",  buf,  0x16u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10);
        v12 = objc_alloc(&OBJC_CLASS___TVSettingsAmbientItem);
        uint64_t v13 = -[TVSettingsAmbientItem initWithModel:](v12, "initWithModel:", v11, (void)v14);
        [v5 addObject:v13];

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  -[TVSettingsAmbientFacade setAerialThemes:](self, "setAerialThemes:", v5);
}

- (void)_updatePhotoSourcesWithObjects:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "-[TVSettingsAmbientFacade _updatePhotoSourcesWithObjects:]";
    __int16 v43 = 2112;
    id v44 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - options: %@",  buf,  0x16u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[TVSettingsAmbientPhotoSourceMenuItem initWithPhotoSourceModel:]( objc_alloc(&OBJC_CLASS___TVSettingsAmbientPhotoSourceMenuItem),  "initWithPhotoSourceModel:",  *(void *)(*((void *)&v35 + 1) + 8LL * (void)i));
        [v5 addObject:v11];
      }

      id v8 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }

    while (v8);
  }

  -[TVSettingsAmbientFacade setPhotoSources:](self, "setPhotoSources:", v5);
  id v12 = [v5 mutableCopy];
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 indexesOfObjectsPassingTest:&stru_100191978]);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectsAtIndexes:v13]);
  -[TVSettingsAmbientFacade setMyPhotoSources:](self, "setMyPhotoSources:", v14);

  [v12 removeObjectsAtIndexes:v13];
  -[TVSettingsAmbientFacade setOtherPhotoSources:](self, "setOtherPhotoSources:", v12);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v15 = v5;
  id v16 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
  v30 = (void *)v13;
  if (v16)
  {
    uint64_t v17 = *(void *)v32;
    while (2)
    {
      for (j = 0LL; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v15);
        }
        __int16 v19 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)j);
        if ([v19 isSelected])
        {
          id v16 = v19;
          goto LABEL_20;
        }
      }

      id v16 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

- (void)_updateTransitionStylesWithObjects:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v29 = "-[TVSettingsAmbientFacade _updateTransitionStylesWithObjects:]";
    __int16 v30 = 2112;
    id v31 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - styles: %@",  buf,  0x16u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[TVSettingsAmbientMenuItem initWithTransitionStyleModel:]( objc_alloc(&OBJC_CLASS___TVSettingsAmbientMenuItem),  "initWithTransitionStyleModel:",  *(void *)(*((void *)&v22 + 1) + 8LL * (void)i));
        [v5 addObject:v11];
      }

      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v8);
  }

  -[TVSettingsAmbientFacade setTransitionStyles:](self, "setTransitionStyles:", v5);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v12 = v5;
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (j = 0LL; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)j);
        if (objc_msgSend(v16, "isSelected", (void)v18))
        {
          id v13 = v16;
          goto LABEL_20;
        }
      }

      id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

- (void)_updatePortraitClockWithEnabled:(BOOL)a3 fallback:(BOOL)a4 options:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v24 = "-[TVSettingsAmbientFacade _updatePortraitClockWithEnabled:fallback:options:]";
    __int16 v25 = 2112;
    id v26 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s - categories: %@",  buf,  0x16u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v14);
        id v16 = objc_alloc(&OBJC_CLASS___TVSettingsPortraitClockCategoryItem);
        uint64_t v17 = -[TVSettingsPortraitClockCategoryItem initWithCategoryModel:]( v16,  "initWithCategoryModel:",  v15,  (void)v18);
        [v9 addObject:v17];

        uint64_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v12);
  }

  -[TVSettingsAmbientFacade setPortraitClockCategories:](self, "setPortraitClockCategories:", v9);
  -[TVSettingsAmbientFacade setPortraitClockEnabled:](self, "setPortraitClockEnabled:", v6);
  self->_BOOL portraitClockFallback = a4;
}

- (BOOL)_portraitClockCategoryHideAllowedWithID:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientFacade portraitClockCategories](self, "portraitClockCategories"));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (objc_msgSend(v9, "isActive", (void)v13))
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
          unsigned int v11 = [v10 isEqualToString:v4];

          if (!v11)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

+ (void)_openApplicationWithIdentifer:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 delegate]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 window]);
  [v6 setUserInteractionEnabled:0];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100078408;
  v9[3] = &unk_1001919A0;
  id v10 = v3;
  id v8 = v3;
  [v7 openApplication:v8 withOptions:0 completion:v9];
}

- (NSArray)aerialThemes
{
  return self->_aerialThemes;
}

- (void)setAerialThemes:(id)a3
{
}

- (NSArray)myPhotoSources
{
  return self->_myPhotoSources;
}

- (void)setMyPhotoSources:(id)a3
{
}

- (NSArray)otherPhotoSources
{
  return self->_otherPhotoSources;
}

- (void)setOtherPhotoSources:(id)a3
{
}

- (NSString)selectedPhotoSourceValue
{
  return self->_selectedPhotoSourceValue;
}

- (void)setSelectedPhotoSourceValue:(id)a3
{
}

- (NSArray)transitionStyles
{
  return self->_transitionStyles;
}

- (void)setTransitionStyles:(id)a3
{
}

- (NSString)selectedTransitionStyleValue
{
  return self->_selectedTransitionStyleValue;
}

- (void)setSelectedTransitionStyleValue:(id)a3
{
}

- (NSArray)portraitClockCategories
{
  return self->_portraitClockCategories;
}

- (void)setPortraitClockCategories:(id)a3
{
}

- (BOOL)isPortraitClockEnabled
{
  return self->_portraitClockEnabled;
}

- (void)setPortraitClockEnabled:(BOOL)a3
{
  self->_portraitClockEnabled = a3;
}

- (BOOL)portraitClockFallback
{
  return self->_portraitClockFallback;
}

- (TVSPreferences)screenSaverPreferences
{
  return self->_screenSaverPreferences;
}

- (TVISAmbientSettingsServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (AMSBag)amsBag
{
  return self->_amsBag;
}

- (NSArray)photoSources
{
  return self->_photoSources;
}

- (void)setPhotoSources:(id)a3
{
}

- (TVSettingsAmbientPhotoSourceMenuItem)selectedPhotoSource
{
  return self->_selectedPhotoSource;
}

- (void)setSelectedPhotoSource:(id)a3
{
}

- (NSDictionary)leafPhotoSourcesByIdentifier
{
  return self->_leafPhotoSourcesByIdentifier;
}

- (void)setLeafPhotoSourcesByIdentifier:(id)a3
{
}

- (TVSettingsAmbientMenuItem)selectedTransitionStyle
{
  return self->_selectedTransitionStyle;
}

- (void)setSelectedTransitionStyle:(id)a3
{
}

- (TVSPreferences)portraitClockPreferences
{
  return self->_portraitClockPreferences;
}

- (void).cxx_destruct
{
}

@end