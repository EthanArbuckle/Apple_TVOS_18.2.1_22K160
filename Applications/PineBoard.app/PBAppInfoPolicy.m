@interface PBAppInfoPolicy
+ (BOOL)_checkApplicationIsRestricted:(id)a3;
+ (BOOL)_isAppRestrictionProfileInstalled;
+ (BOOL)_isApplicationHiddenWithPreference:(id)a3;
+ (id)_allowlistDenylistExemptBundleIdentifiers;
+ (id)_notSupportedBundleIdentifiers;
+ (id)_provisioningExemptBundleIdentifiers;
- (BOOL)_queueUpdateCachedPreferences;
- (BOOL)isApplicationEnabled:(id)a3 reasons:(unint64_t *)a4;
- (BOOL)isApplicationHidden:(id)a3;
- (BOOL)isPlaceholderEnabled:(id)a3 reasons:(unint64_t *)a4;
- (BOOL)isPlaceholderHidden:(id)a3;
- (BOOL)queue_enforceSystemAppProvisioning;
- (BOOL)queue_showInternalApps;
- (BOOL)queue_showNonDefaultSystemApps;
- (NSArray)queue_appWhitelistOptions;
- (NSArray)queue_restrictedHomscreenLayout;
- (NSSet)queue_exclusionTags;
- (NSSet)queue_notSupportedBundleIdentifiers;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_source)localeDidChangeDebounceTimer;
- (PBAppInfoPolicy)init;
- (id)configurationForProposedAppInfos:(id)a3;
- (void)_queue_updateNotSupportedApplications;
- (void)_refreshCachedAppWhitelistOptions;
- (void)_refreshCachedManagedAppLayout;
- (void)_setNeedsReload;
- (void)_updateCachedPreferences;
- (void)dealloc;
- (void)localeDidChange:(id)a3;
- (void)managedHomeScreenLayoutChanged:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)profileConnectionDidReceiveAppWhitelistChangedNotification:(id)a3 userInfo:(id)a4;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)programmingGuideDidUpdate:(id)a3;
@end

@implementation PBAppInfoPolicy

- (PBAppInfoPolicy)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PBAppInfoPolicy;
  id v2 = -[PBAppInfoPolicy init](&v23, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.PBAppInfoPolicy.access", 0LL);
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    v5 = (dispatch_queue_s *)*((void *)v2 + 2);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100063E54;
    block[3] = &unk_1003CFF08;
    v6 = (dispatch_source_t *)v2;
    v22 = v6;
    dispatch_sync(v5, block);
    dispatch_source_t v7 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *((dispatch_queue_t *)v2 + 2));
    dispatch_source_t v8 = v6[7];
    v6[7] = v7;

    objc_initWeak(&location, v6);
    dispatch_source_set_timer(v6[7], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
    v9 = v6[7];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100063E80;
    handler[3] = &unk_1003D0890;
    objc_copyWeak(&v19, &location);
    dispatch_source_set_event_handler(v9, handler);
    dispatch_activate(v6[7]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    [v10 registerObserver:v6];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v6 selector:"managedHomeScreenLayoutChanged:" name:MCHomeScreenLayoutChangedNotification object:0];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v6 selector:"programmingGuideDidUpdate:" name:@"PBProgrammingGuideDidUpdateNotification" object:0];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v13 addObserver:v6 selector:"localeDidChange:" name:@"kPBInternationalizationLocaleDidChangeNotification" object:0];

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v14 addObserver:v6 forKeyPath:@"EnforceProvisioningOnSystemApps" options:0 context:&off_1003D26A0];
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults pineBoardServicesUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "pineBoardServicesUserDefaults"));
    [v15 addObserver:v6 forKeyPath:PBSShowInternalAppsPreference options:0 context:&off_1003D26A8];
    [v15 addObserver:v6 forKeyPath:PBSShowNonDefaultSystemAppsPreference options:0 context:&off_1003D26B0];
    -[dispatch_source_t _refreshCachedAppWhitelistOptions](v6, "_refreshCachedAppWhitelistOptions");
    -[dispatch_source_t _refreshCachedManagedAppLayout](v6, "_refreshCachedManagedAppLayout");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v6,  (CFNotificationCallback)sub_100063EAC,  @"com.apple.springboard.appIconVisibilityPreferencesChanged",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return (PBAppInfoPolicy *)v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v3 unregisterObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self name:MCHomeScreenLayoutChangedNotification object:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self name:@"PBProgrammingGuideDidUpdateNotification" object:0];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 removeObserver:self name:@"kPBInternationalizationLocaleDidChangeNotification" object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver( DarwinNotifyCenter,  self,  @"com.apple.springboard.appIconVisibilityPreferencesChanged",  0LL);
  dispatch_source_cancel((dispatch_source_t)self->_localeDidChangeDebounceTimer);
  dispatch_source_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v8 removeObserver:self forKeyPath:@"EnforceProvisioningOnSystemApps"];

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults pineBoardServicesUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "pineBoardServicesUserDefaults"));
  [v9 removeObserver:self forKeyPath:PBSShowInternalAppsPreference];

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults pineBoardServicesUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "pineBoardServicesUserDefaults"));
  [v10 removeObserver:self forKeyPath:PBSShowNonDefaultSystemAppsPreference];

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBAppInfoPolicy;
  -[PBAppInfoPolicy dealloc](&v11, "dealloc");
}

- (BOOL)isApplicationEnabled:(id)a3 reasons:(unint64_t *)a4
{
  id v6 = a3;
  uint64_t v55 = 0LL;
  v56 = &v55;
  uint64_t v57 = 0x2020000000LL;
  char v58 = 1;
  uint64_t v49 = 0LL;
  v50 = &v49;
  uint64_t v51 = 0x3032000000LL;
  v52 = sub_1000645A8;
  v53 = sub_1000645B8;
  id v54 = 0LL;
  uint64_t v43 = 0LL;
  v44 = &v43;
  uint64_t v45 = 0x3032000000LL;
  v46 = sub_1000645A8;
  v47 = sub_1000645B8;
  id v48 = 0LL;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000645D0;
  block[3] = &unk_1003D26C0;
  void block[4] = self;
  block[5] = &v55;
  block[6] = &v49;
  block[7] = &v43;
  dispatch_sync(accessQueue, block);
  if (*((_BYTE *)v56 + 24))
  {
    dispatch_source_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBProgrammingGuide sharedInstance](&OBJC_CLASS___PBProgrammingGuide, "sharedInstance"));
    v41 = (NSSet *)objc_claimAutoreleasedReturnValue([v8 disabledApplicationIdentifiers]);
  }

  else
  {
    v41 = objc_alloc_init(&OBJC_CLASS___NSSet);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBProgrammingGuide sharedInstance](&OBJC_CLASS___PBProgrammingGuide, "sharedInstance"));
  v39 = (void *)objc_claimAutoreleasedReturnValue([v9 provisionedApplicationIdentifiers]);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBProgrammingGuide sharedInstance](&OBJC_CLASS___PBProgrammingGuide, "sharedInstance"));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 applicationIdentifiersByBundleIdentifierMapping]);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 restrictedAppBundleIDs]);
  v14 = v13;
  if (v13) {
    v40 = v13;
  }
  else {
    v40 = objc_alloc_init(&OBJC_CLASS___NSSet);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 effectiveWhitelistedAppBundleIDs]);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v38 = a4;
  if ([v17 isInSingleAppMode])
  {
    v18 = 0LL;
  }

  else
  {
    id v19 = [(id)objc_opt_class(self) _allowlistDenylistExemptBundleIdentifiers];
    v18 = (void *)objc_claimAutoreleasedReturnValue(v19);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v20]);
  if (!v21) {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v6 itemID]);
  }
  else {
    v22 = 0LL;
  }
  id v23 = v22;

  if ([v6 isAlwaysAvailable])
  {
    uint64_t v24 = 0LL;
  }

  else
  {
    if (-[NSSet containsObject:](v40, "containsObject:", v20))
    {
      else {
        uint64_t v25 = 4LL;
      }
    }

    else
    {
      uint64_t v25 = 0LL;
    }

    if ([v16 count]
      && ([v16 containsObject:v20] & 1) == 0
      && ![v18 containsObject:v20])
    {
      v25 |= 8uLL;
    }

    unsigned int v26 = -[NSSet containsObject:](v41, "containsObject:", v23);
    else {
      uint64_t v27 = v25 | v26;
    }
    unsigned int v28 = [(id)objc_opt_class(self) _checkApplicationIsRestricted:v6];
    unsigned int v29 = [(id)v44[5] containsObject:v20];
    uint64_t v30 = v27 | 0x20;
    if (!v28) {
      uint64_t v30 = v27;
    }
    if (v29) {
      uint64_t v24 = v30 | 0x40;
    }
    else {
      uint64_t v24 = v30;
    }
    if ([v6 type] == (id)1 && *((_BYTE *)v56 + 24))
    {
      v31 = objc_alloc(&OBJC_CLASS___NSSet);
      v32 = (void *)objc_claimAutoreleasedReturnValue([v6 tags]);
      v33 = -[NSSet initWithArray:](v31, "initWithArray:", v32);

      if (([(id)v50[5] intersectsSet:v33] & 1) == 0)
      {
        id v34 = [(id)objc_opt_class(self) _provisioningExemptBundleIdentifiers];
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        if ([v35 containsObject:v20])
        {
        }

        else
        {
          uint64_t v36 = [v39 containsObject:v23] ^ 1;

          v24 |= v36;
        }
      }
    }
  }

  if (v38) {
    unint64_t *v38 = v24;
  }

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  return v24 == 0;
}

- (BOOL)isPlaceholderEnabled:(id)a3 reasons:(unint64_t *)a4
{
  return 1;
}

- (BOOL)isApplicationHidden:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000646E4;
  block[3] = &unk_1003D0AD8;
  id v9 = v4;
  v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  LOBYTE(accessQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)accessQueue;
}

- (BOOL)isPlaceholderHidden:(id)a3
{
  return 0;
}

- (id)configurationForProposedAppInfos:(id)a3
{
  id v55 = a3;
  id v54 = objc_alloc_init(&OBJC_CLASS___PBMutableAppInfoConfiguration);
  -[PBMutableAppInfoConfiguration setConfigurationMode:](v54, "setConfigurationMode:", 0LL);
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 kioskAppBundleIdentifier]);
  v5 = (void *)v4;
  if (v4) {
    id v6 = (const __CFString *)v4;
  }
  else {
    id v6 = @"com.apple.HeadBoard";
  }
  -[PBMutableAppInfoConfiguration setKioskAppBundleIdentifier:](v54, "setKioskAppBundleIdentifier:", v6);

  dispatch_source_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBProgrammingGuide sharedInstance](&OBJC_CLASS___PBProgrammingGuide, "sharedInstance"));
  dispatch_source_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 provisionedApplicationIdentifiers]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBProgrammingGuide sharedInstance](&OBJC_CLASS___PBProgrammingGuide, "sharedInstance"));
  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifiersByApplicationIdentifierMapping]);

  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v69;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v69 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v68 + 1) + 8LL * (void)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKey:v14]);
        if (v15)
        {
          -[NSMutableArray addObject:](v10, "addObject:", v15);
        }

        else
        {
          v66[0] = _NSConcreteStackBlock;
          v66[1] = 3221225472LL;
          v66[2] = sub_1000652B4;
          v66[3] = &unk_1003D0B78;
          v66[4] = v14;
          v67 = v10;
          [v55 enumerateKeysAndObjectsUsingBlock:v66];
        }
      }

      id v11 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
    }

    while (v11);
  }

  -[PBMutableAppInfoConfiguration setProvisionedAppBundleIdentifiers:](v54, "setProvisionedAppBundleIdentifiers:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v17 = [v16 isInSingleAppMode];

  if (v17)
  {
    uint64_t v60 = 0LL;
    v61 = &v60;
    uint64_t v62 = 0x3032000000LL;
    v63 = sub_1000645A8;
    v64 = sub_1000645B8;
    id v65 = 0LL;
    accessQueue = (dispatch_queue_s *)self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100065330;
    block[3] = &unk_1003D0210;
    void block[4] = self;
    void block[5] = &v60;
    dispatch_sync(accessQueue, block);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([(id)v61[5] firstObject]);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tvs_stringForKey:", kMCAppWhitelistIdentifierKey));
    if ([v20 length])
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:kMCAppWhitelistOptionsKey]);
      v22 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v21);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:kMCAppWhitelistUserEnabledOptionsKey]);
      uint64_t v24 = (void *)kMCAppWhitelistOptionDisableTouchKey;
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:kMCAppWhitelistOptionDisableTouchKey]);
      if (v25)
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v24]);
        unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v24 BOOLValue] ^ 1));
      }

      else
      {
        unsigned int v26 = &__kCFBooleanTrue;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v26,  @"InputAllowed");
      if (v25)
      {
      }

      unsigned int v28 = (void *)kMCAppWhitelistOptionDisableAutoLockKey;
      unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:kMCAppWhitelistOptionDisableAutoLockKey]);
      if (v29)
      {
        unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v28]);
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v28 BOOLValue] ^ 1));
      }

      else
      {
        uint64_t v30 = &__kCFBooleanTrue;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v30,  @"IdleTimerAllowed");
      if (v29)
      {
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"AppSwitcherAllowed");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"ControlCenterAllowed");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"SiriAndDictationAllowed");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"SystemDialogsAllowed");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"SystemNowPlayingAllowed");
      v31 = (void *)kMCAppWhitelistOptionEnableVoiceOverKey;
      v32 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:kMCAppWhitelistOptionEnableVoiceOverKey]);
      if (v32)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v31]);
        v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v31 BOOLValue]));
      }

      else
      {
        v33 = &__kCFBooleanFalse;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v33,  @"VoiceOverEnabled");
      if (v32)
      {
      }

      id v34 = (void *)kMCAppWhitelistOptionEnableZoomKey;
      v35 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:kMCAppWhitelistOptionEnableZoomKey]);
      if (v35)
      {
        id v34 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v34]);
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v34 BOOLValue]));
      }

      else
      {
        uint64_t v36 = &__kCFBooleanFalse;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v36,  @"ZoomEnabled");
      if (v35)
      {
      }

      v37 = (void *)kMCAppWhitelistOptionEnableInvertColorsKey;
      v38 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:kMCAppWhitelistOptionEnableInvertColorsKey]);
      if (v38)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v37]);
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v37 BOOLValue]));
      }

      else
      {
        v39 = &__kCFBooleanFalse;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v39,  @"InvertColorsEnabled");
      if (v38)
      {
      }

      v40 = (void *)kMCAppWhitelistUserEnabledOptionsVoiceOverKey;
      v41 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:kMCAppWhitelistUserEnabledOptionsVoiceOverKey]);
      if (v41)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v40]);
        v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v40 BOOLValue]));
      }

      else
      {
        v42 = &__kCFBooleanFalse;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v42,  @"VoiceOverShortcutEnabled");
      if (v41)
      {
      }

      uint64_t v43 = (void *)kMCAppWhitelistUserEnabledOptionZoomKey;
      v44 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:kMCAppWhitelistUserEnabledOptionZoomKey]);
      if (v44)
      {
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v43]);
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v43 BOOLValue]));
      }

      else
      {
        uint64_t v45 = &__kCFBooleanFalse;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v45,  @"ZoomShortcutEnabled");
      if (v44)
      {
      }

      v46 = (void *)kMCAppWhitelistUserEnabledOptionInvertColorsKey;
      v47 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:kMCAppWhitelistUserEnabledOptionInvertColorsKey]);
      if (v47)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v46]);
        id v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v46 BOOLValue]));
      }

      else
      {
        id v48 = &__kCFBooleanFalse;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v48,  @"InvertColorsShortcutEnabled");
      if (v47)
      {
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"ClosedCaptionsShortcutEnabled");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"AudioDescriptionsShortcutEnabled");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"SwitchControlShortcutEnabled");
      if (_os_feature_enabled_impl("Accessibility", "HoverText")) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"HoverTextShortcutEnabled");
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"PhotosensitiveMitigationShortcutEnabled");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"ColorAdjustmentsShortcutEnabled");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"LightSensitivityShortcutEnabled");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"ReduceWhitePointShortcutEnabled");
      id v49 = sub_100082574();
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v73 = v20;
        __int16 v74 = 2112;
        v75 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "Single app configuration. Proposed %@. App whitelist options dict %@",  buf,  0x16u);
      }

      -[PBMutableAppInfoConfiguration setConfigurationMode:](v54, "setConfigurationMode:", 2LL);
      -[PBMutableAppInfoConfiguration setKioskAppBundleIdentifier:](v54, "setKioskAppBundleIdentifier:", v20);
      -[PBMutableAppInfoConfiguration setSingleAppModeOptions:](v54, "setSingleAppModeOptions:", v22);
    }

    _Block_object_dispose(&v60, 8);
  }

  else
  {
    uint64_t v60 = 0LL;
    v61 = &v60;
    uint64_t v62 = 0x3032000000LL;
    v63 = sub_1000645A8;
    v64 = sub_1000645B8;
    id v65 = 0LL;
    uint64_t v27 = (dispatch_queue_s *)self->_accessQueue;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_10006536C;
    v58[3] = &unk_1003D0210;
    v58[4] = self;
    v58[5] = &v60;
    dispatch_sync(v27, v58);
    if (v61[5])
    {
      -[PBMutableAppInfoConfiguration setConfigurationMode:](v54, "setConfigurationMode:", 1LL);
      -[PBMutableAppInfoConfiguration setManagedHomeScreenLayout:](v54, "setManagedHomeScreenLayout:", v61[5]);
    }

    _Block_object_dispose(&v60, 8);
  }

  id v51 = -[PBMutableAppInfoConfiguration copy](v54, "copy");

  return v51;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &off_1003D26B0 || a6 == &off_1003D26A0 || a6 == &off_1003D26A8)
  {
    -[PBAppInfoPolicy _updateCachedPreferences](self, "_updateCachedPreferences", a3, a4, a5);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___PBAppInfoPolicy;
    -[PBAppInfoPolicy observeValueForKeyPath:ofObject:change:context:]( &v8,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)managedHomeScreenLayoutChanged:(id)a3
{
}

- (void)profileConnectionDidReceiveAppWhitelistChangedNotification:(id)a3 userInfo:(id)a4
{
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
}

- (void)programmingGuideDidUpdate:(id)a3
{
}

- (void)localeDidChange:(id)a3
{
  localeDidChangeDebounceTimer = self->_localeDidChangeDebounceTimer;
  dispatch_time_t v4 = dispatch_time(0LL, 500000000LL);
  dispatch_source_set_timer((dispatch_source_t)localeDidChangeDebounceTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

- (BOOL)_queueUpdateCachedPreferences
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBAppInfoPolicy accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  int queue_showInternalApps = self->_queue_showInternalApps;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
  self->_int queue_showInternalApps = objc_msgSend(v5, "pbs_shouldShowInternalApps");

  int v6 = self->_queue_showInternalApps;
  BOOL queue_showNonDefaultSystemApps = self->_queue_showNonDefaultSystemApps;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
  self->_BOOL queue_showNonDefaultSystemApps = objc_msgSend(v8, "pbs_shouldShowNonDefaultSystemApps");

  BOOL v9 = queue_showInternalApps != v6 || queue_showNonDefaultSystemApps != self->_queue_showNonDefaultSystemApps;
  BOOL queue_enforceSystemAppProvisioning = self->_queue_enforceSystemAppProvisioning;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  self->_BOOL queue_enforceSystemAppProvisioning = [v11 enforceProvisioningOnSystemAppsEnabled];

  if (v9 || queue_enforceSystemAppProvisioning != self->_queue_enforceSystemAppProvisioning)
  {
    BOOL v12 = 1;
  }

  else
  {
    BOOL v12 = 0;
    if (self->_queue_exclusionTags) {
      return v12;
    }
  }

  uint64_t v13 = objc_alloc(&OBJC_CLASS___NSMutableSet);
  uint64_t v14 = -[NSMutableSet initWithObjects:](v13, "initWithObjects:", PBSHiddenAppTag, 0LL);
  v15 = v14;
  if (!self->_queue_showInternalApps) {
    -[NSMutableSet addObject:](v14, "addObject:", PBSInternalAppTag);
  }
  if (!self->_queue_showNonDefaultSystemApps) {
    -[NSMutableSet addObject:](v15, "addObject:", PBSNonDefaultSystemAppTag);
  }
  v16 = (NSSet *)-[NSMutableSet copy](v15, "copy");
  queue_exclusionTags = self->_queue_exclusionTags;
  self->_queue_exclusionTags = v16;

  return v12;
}

- (void)_queue_updateNotSupportedApplications
{
  dispatch_queue_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  if (qword_100470208 != -1) {
    dispatch_once(&qword_100470208, &stru_1003D2760);
  }
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSInternationalization region](&OBJC_CLASS___TVSInternationalization, "region"));
  unsigned __int8 v5 = [(id)qword_100470200 containsObject:v4];

  if ((v5 & 1) != 0 || (_os_feature_enabled_impl("TelephonyUtilities", "Laguna") & 1) == 0) {
LABEL_7:
  }
    -[NSMutableSet addObject:](v3, "addObject:", @"com.apple.facetime");
  int v6 = (NSSet *)-[NSMutableSet copy](v3, "copy");
  queue_notSupportedBundleIdentifiers = self->_queue_notSupportedBundleIdentifiers;
  self->_queue_notSupportedBundleIdentifiers = v6;

  objc_initWeak(&location, self);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000657B8;
  v10[3] = &unk_1003D0890;
  objc_copyWeak(&v11, &location);
  dispatch_async(v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_updateCachedPreferences
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBAppInfoPolicy accessQueue](self, "accessQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100065898;
  v4[3] = &unk_1003D0890;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_setNeedsReload
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 postNotificationName:@"PBAppInfoStorePolicyDidChangeNotification" object:self];
}

- (void)_refreshCachedAppWhitelistOptions
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 effectiveWhitelistedAppsAndOptions]);

  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100065A2C;
  v7[3] = &unk_1003CFEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

- (void)_refreshCachedManagedAppLayout
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 restrictionEnforcedHomeScreenLayout]);

  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100065B04;
  v7[3] = &unk_1003CFEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

+ (BOOL)_checkApplicationIsRestricted:(id)a3
{
  id v4 = a3;
  if (qword_1004701C8 != -1) {
    dispatch_once(&qword_1004701C8, &stru_1003D26E0);
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  if (![(id)qword_1004701C0 containsObject:v5])
  {
    if ([a1 _isAppRestrictionProfileInstalled] && objc_msgSend(v4, "type") == (id)2)
    {
      id v7 = [v4 ratingRank];
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 effectiveValueForSetting:MCFeatureMaximumAppsRating]);
      id v10 = [v9 integerValue];

      BOOL v11 = (uint64_t)v7 > (uint64_t)v10;
    }

    else
    {
      BOOL v11 = 0;
    }

    goto LABEL_28;
  }

  if ([v5 isEqual:@"com.apple.TVMovies"])
  {
    uint64_t v34 = MCFeatureMaximumMoviesRating;
    id v6 = &v34;
LABEL_14:
    uint64_t v12 = 1LL;
    goto LABEL_15;
  }

  if ([v5 isEqual:@"com.apple.TVShows"])
  {
    uint64_t v33 = MCFeatureMaximumTVShowsRating;
    id v6 = &v33;
    goto LABEL_14;
  }

  if ([v5 isEqual:@"com.apple.TVAppStore"])
  {
    uint64_t v32 = MCFeatureMaximumAppsRating;
    id v6 = &v32;
    goto LABEL_14;
  }

  if (![v5 isEqual:@"com.apple.facetime"])
  {
    uint64_t v13 = 0LL;
    goto LABEL_16;
  }

  v31[0] = MCFeatureCameraAllowed;
  v31[1] = MCFeatureVideoConferencingAllowed;
  id v6 = v31;
  uint64_t v12 = 2LL;
LABEL_15:
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, v12));
LABEL_16:
  id v25 = v4;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    id v16 = v15;
    BOOL v11 = 0;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
        unsigned __int8 v21 = [v20 isSettingLockedDownByRestrictions:v19];

        v22 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 effectiveValueForSetting:v19]);

        if (!v11 && (v21 & 1) != 0) {
          BOOL v11 = [v23 integerValue] == 0;
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v16);
  }

  else
  {
    BOOL v11 = 0;
  }

  id v4 = v25;
LABEL_28:

  return v11;
}

+ (BOOL)_isAppRestrictionProfileInstalled
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  uint64_t v3 = MCFeatureMaximumAppsRating;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 parametersForValueSetting:MCFeatureMaximumAppsRating]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 effectiveParametersForValueSetting:v3]);

  uint64_t v7 = MCSettingParameterRangeMaximumKey;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:MCSettingParameterRangeMaximumKey]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 objectForKey:v7]);
  id v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    LOBYTE(v12) = 0;
  }
  else {
    unsigned int v12 = [v8 isEqual:v9] ^ 1;
  }

  return v12;
}

+ (id)_provisioningExemptBundleIdentifiers
{
  if (qword_1004701D8 != -1) {
    dispatch_once(&qword_1004701D8, &stru_1003D2700);
  }
  return (id)qword_1004701D0;
}

+ (id)_notSupportedBundleIdentifiers
{
  if (qword_1004701E8 != -1) {
    dispatch_once(&qword_1004701E8, &stru_1003D2720);
  }
  return (id)qword_1004701E0;
}

+ (id)_allowlistDenylistExemptBundleIdentifiers
{
  if (qword_1004701F8 != -1) {
    dispatch_once(&qword_1004701F8, &stru_1003D2740);
  }
  return (id)qword_1004701F0;
}

+ (BOOL)_isApplicationHiddenWithPreference:(id)a3
{
  id v3 = a3;
  if (![v3 iconVisibilitySetByPreference])
  {
    LOBYTE(v6) = 0;
    goto LABEL_17;
  }

  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"SBIconVisibility",  (CFStringRef)[v3 bundleIdentifier],  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    BOOL v5 = AppBooleanValue == 0;
    goto LABEL_14;
  }

  if (qword_100470210 != -1) {
    dispatch_once(&qword_100470210, &stru_1003D2780);
  }
  if (qword_100470220 != -1) {
    dispatch_once(&qword_100470220, &stru_1003D27A0);
  }
  int v7 = byte_100470218;
  if (byte_100470218) {
    LOBYTE(v8) = 0;
  }
  else {
    unsigned int v8 = [v3 hasAllowIconVisibilityChangesEntitlement] ^ 1;
  }
  if ([v3 iconVisibilityDefaultVisible])
  {
    BOOL v5 = [v3 iconVisibilityDefaultVisible] == 2;
LABEL_14:
    LOBYTE(v6) = v5;
    goto LABEL_17;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 iconVisibilityDefaultVisibleInstallTypes]);
  BOOL v11 = v10;
  if (v10) {
    char v12 = v8;
  }
  else {
    char v12 = 1;
  }
  if ((v12 & 1) != 0)
  {
    LOBYTE(v6) = 0;
  }

  else
  {
    if (v7) {
      uint64_t v13 = @"carrier";
    }
    else {
      uint64_t v13 = @"user";
    }
    unsigned int v6 = [v10 containsObject:v13] ^ 1;
  }

LABEL_17:
  return v6;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (NSArray)queue_appWhitelistOptions
{
  return self->_queue_appWhitelistOptions;
}

- (NSArray)queue_restrictedHomscreenLayout
{
  return self->_queue_restrictedHomscreenLayout;
}

- (NSSet)queue_exclusionTags
{
  return self->_queue_exclusionTags;
}

- (BOOL)queue_showInternalApps
{
  return self->_queue_showInternalApps;
}

- (BOOL)queue_showNonDefaultSystemApps
{
  return self->_queue_showNonDefaultSystemApps;
}

- (BOOL)queue_enforceSystemAppProvisioning
{
  return self->_queue_enforceSystemAppProvisioning;
}

- (NSSet)queue_notSupportedBundleIdentifiers
{
  return self->_queue_notSupportedBundleIdentifiers;
}

- (OS_dispatch_source)localeDidChangeDebounceTimer
{
  return self->_localeDidChangeDebounceTimer;
}

- (void).cxx_destruct
{
}

@end