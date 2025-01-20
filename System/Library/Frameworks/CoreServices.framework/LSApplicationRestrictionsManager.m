@interface LSApplicationRestrictionsManager
+ (id)activeRestrictionIdentifiers;
+ (id)sharedInstance;
- (BOOL)_LSApplyRestrictedSet:(id)a3 forRestriction:(id)a4;
- (BOOL)cleanRemovedSystemApplicationsList;
- (BOOL)forceUpdateRestrictionKnowledgeWithError:(void *)a1;
- (BOOL)isAllowlistEnabled;
- (BOOL)isAppExtensionRestricted:(BOOL)a1;
- (BOOL)isFeatureAllowed:(id)a3;
- (BOOL)isRatingAllowed:(void *)a1;
- (LSApplicationRestrictionsManager)init;
- (id)_LSResolveIdentifiers:(id)a3;
- (id)_LSResolveIdentifiers:(id)a3 context:(LSContext *)a4;
- (id)_MCRestrictionManager;
- (id)allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:(void *)a3 originatingAppBundleID:(uint64_t)a4 originatingAccountIsManaged:;
- (id)allowlistedBundleIDs;
- (id)calculateSetDifference:(id)a3 and:(id)a4;
- (id)defaultStateProvider;
- (id)isApplicationRestricted:(id *)result;
- (id)isApplicationRestricted:(int)a3 checkFeatureRestrictions:;
- (id)isApplicationRestricted:(uint64_t)a3 checkFlags:;
- (id)maximumRating;
- (id)removedSystemApplicationIdentifiers;
- (id)restrictedBundleIDs;
- (uint64_t)isAdTrackingEnabled;
- (uint64_t)isApplicationRestricted:(int)a3 checkFeatureRestrictions:(void *)a4 stateProvider:;
- (uint64_t)isApplicationRestricted:(uint64_t)a3 checkFlags:(void *)a4 stateProvider:;
- (uint64_t)isLimitAdTrackingForced;
- (uint64_t)isOpenInRestrictionInEffect;
- (uint64_t)isSystemAppDeletionEnabled;
- (uint64_t)setApplication:(int)a3 removed:;
- (void)_MCRestrictionManager;
- (void)_pruneObsoleteTrustedSignerIdentities;
- (void)beginListeningForChanges;
- (void)clearAllValues;
- (void)handleMCEffectiveSettingsChanged;
- (void)locked_setAllowlistedBundleIDs:(uint64_t)a1;
- (void)locked_setRestrictedBundleIDs:(uint64_t)a1;
- (void)schedulePruneObsoleteTrustedSignerIdentities;
- (void)setRemovedSystemApplicationIdentifiers:(void *)a1;
@end

@implementation LSApplicationRestrictionsManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_4);
  }
  return (id)sharedInstance_sharedInstance_0;
}

- (id)defaultStateProvider
{
  if (a1) {
    a1 = -[LSAskManagerMCStateProvider initWithRestrictionsManager:]( (id *)objc_alloc(&OBJC_CLASS___LSAskManagerMCStateProvider),  a1);
  }
  return a1;
}

- (id)maximumRating
{
  if (a1)
  {
    v1 = a1;
    if (!ManagedConfigurationLibrary_frameworkLibrary)
    {
      ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/ManagedConfiguration.f ramework/ManagedConfiguration",  2);
      if (!ManagedConfigurationLibrary_frameworkLibrary) {
        return &unk_189DA7B58;
      }
    }

    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __49__LSApplicationRestrictionsManager_maximumRating__block_invoke;
    v3[3] = &unk_189D72BA0;
    v3[4] = v1;
    _LSLazyLoadObjectWithLock((id *)v1 + 9, (os_unfair_lock_s *)v1 + 2, v3);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (uint64_t)isApplicationRestricted:(uint64_t)a3 checkFlags:(void *)a4 stateProvider:
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = 0LL;
  if (a1 && (a3 & 0x40000000000LL) == 0) {
    uint64_t v9 = -[LSApplicationRestrictionsManager isApplicationRestricted:checkFeatureRestrictions:stateProvider:]( a1,  v7,  1,  v8);
  }

  return v9;
}

- (uint64_t)isApplicationRestricted:(int)a3 checkFeatureRestrictions:(void *)a4 stateProvider:
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = v8;
  if (a1)
  {
    id v10 = v8;
    id v11 = v7;
    if (!ManagedConfigurationLibrary_frameworkLibrary)
    {
      ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/ManagedConfiguration.f ramework/ManagedConfiguration",  2);
      if (!ManagedConfigurationLibrary_frameworkLibrary) {
        goto LABEL_11;
      }
    }

    if ([v10 isAllowlistEnabled])
    {
      [v10 allowlistedBundleIDs];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v13 = [v12 containsObject:v11];

      if (!v13) {
        goto LABEL_7;
      }
    }

    [v10 restrictedBundleIDs];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    char v15 = [v14 containsObject:v11];

    if ((v15 & 1) != 0
      || a3 && _LSIsNewsBundleIdentifier(v11) && (v17 = (void *)getMCFeatureNewsAllowed[0](), !isFeatureAllowed(v17)))
    {
LABEL_7:
      uint64_t v16 = 1LL;
    }

    else
    {
LABEL_11:
      uint64_t v16 = 0LL;
    }
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  return v16;
}

- (BOOL)isAllowlistEnabled
{
  if (!a1) {
    return 0LL;
  }
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __54__LSApplicationRestrictionsManager_isAllowlistEnabled__block_invoke;
  v4[3] = &unk_189D72BA0;
  v4[4] = a1;
  _LSLazyLoadObjectWithLock((id *)(a1 + 32), (os_unfair_lock_s *)(a1 + 8), v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v2 = [v1 integerValue] != 0;

  return v2;
}

- (id)restrictedBundleIDs
{
  if (a1)
  {
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3221225472LL;
    v2[2] = __55__LSApplicationRestrictionsManager_restrictedBundleIDs__block_invoke;
    v2[3] = &unk_189D72BC8;
    v2[4] = a1;
    a1 = _LSLazyLoadObjectWithLock((id *)(a1 + 64), (os_unfair_lock_s *)(a1 + 8), v2);
  }

  return (id)a1;
}

- (id)allowlistedBundleIDs
{
  if (a1)
  {
    v1 = a1;
    if (-[LSApplicationRestrictionsManager isAllowlistEnabled]((uint64_t)a1))
    {
      v3[0] = MEMORY[0x1895F87A8];
      v3[1] = 3221225472LL;
      v3[2] = __56__LSApplicationRestrictionsManager_allowlistedBundleIDs__block_invoke;
      v3[3] = &unk_189D72BC8;
      v3[4] = v1;
      _LSLazyLoadObjectWithLock((id *)v1 + 7, (os_unfair_lock_s *)v1 + 2, v3);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      a1 = 0LL;
    }
  }

  return a1;
}

void __50__LSApplicationRestrictionsManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___LSApplicationRestrictionsManager);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;
}

+ (id)activeRestrictionIdentifiers
{
  if (activeRestrictionIdentifiers_onceToken != -1) {
    dispatch_once(&activeRestrictionIdentifiers_onceToken, &__block_literal_global_67);
  }
  return (id)activeRestrictionIdentifiers_restrictionUUIDs;
}

void __64__LSApplicationRestrictionsManager_activeRestrictionIdentifiers__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189604010] setWithObject:@"com.apple.lsd.appremoval"];
  v1 = (void *)activeRestrictionIdentifiers_restrictionUUIDs;
  activeRestrictionIdentifiers_restrictionUUIDs = v0;
}

- (LSApplicationRestrictionsManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___LSApplicationRestrictionsManager;
  id v2 = -[LSApplicationRestrictionsManager init](&v19, sel_init);
  if (v2)
  {
    if (ManagedConfigurationLibrary_frameworkLibrary
      || (ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/ManagedConfigurati on.framework/ManagedConfiguration",  2)) != 0)
    {
      *((_DWORD *)v2 + 2) = 0;
      dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
      dispatch_queue_t v4 = dispatch_queue_create("com.apple.lsd.restrictionsmanager.signerIdentitySyncQueue", v3);
      v5 = (void *)*((void *)v2 + 2);
      *((void *)v2 + 2) = v4;

      if ([(id)__LSDefaultsGetSharedInstance() isServer])
      {
        objc_initWeak(&location, v2);
        v6 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, *((dispatch_queue_t *)v2 + 2));
        dispatch_time_t v7 = dispatch_time(0LL, 120000000000LL);
        dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        uint64_t v13 = MEMORY[0x1895F87A8];
        uint64_t v14 = 3221225472LL;
        char v15 = __40__LSApplicationRestrictionsManager_init__block_invoke;
        uint64_t v16 = &unk_189D72B78;
        objc_copyWeak(&v17, &location);
        dispatch_source_set_event_handler(v6, &v13);
        dispatch_resume(v6);
        id v8 = (void *)*((void *)v2 + 3);
        *((void *)v2 + 3) = v6;

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }

      if ([(id)__LSDefaultsGetSharedInstance() isServer])
      {
        uint64_t v9 = sel_handleMCEffectiveSettingsChanged;
      }

      else
      {
        uint64_t v9 = sel_clearAllValues;
        DistributedCenter = CFNotificationCenterGetDistributedCenter();
        CFNotificationCenterAddObserver( DistributedCenter,  v2,  (CFNotificationCallback)_applicationStateChangedCallback,  @"com.apple.LaunchServices.applicationStateChanged",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
      }

      objc_msgSend(MEMORY[0x189607958], "defaultCenter", v13, v14, v15, v16);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 addObserver:v2 selector:v9 name:getMCEffectiveSettingsChangedNotification[0]() object:0];
    }
  }

  return (LSApplicationRestrictionsManager *)v2;
}

void __40__LSApplicationRestrictionsManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pruneObsoleteTrustedSignerIdentities];
}

- (id)_MCRestrictionManager
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    _LSDefaultLog();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[LSApplicationRestrictionsManager _MCRestrictionManager].cold.1();
    }
  }

  return v2;
}

id __54__LSApplicationRestrictionsManager_isAllowlistEnabled__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x189607968];
  [*(id *)(a1 + 32) _MCProfileConnection];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithUnsignedInt:", objc_msgSend(v2, "appWhitelistState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)isOpenInRestrictionInEffect
{
  if (!a1) {
    return 0LL;
  }
  [a1 _MCProfileConnection];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  char v2 = [v1 isOpenInRestrictionInEffect];

  if ((v2 & 1) != 0) {
    return 1LL;
  }
  dispatch_queue_t v4 = (void *)CFPreferencesCopyValue( @"LSPretendOpenInRestrictionInEffect",  (CFStringRef)*MEMORY[0x189605170],  (CFStringRef)*MEMORY[0x189605198],  (CFStringRef)*MEMORY[0x189605178]);
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v3 = [v4 BOOLValue];
  }
  else {
    uint64_t v3 = 0LL;
  }

  return v3;
}

id __49__LSApplicationRestrictionsManager_maximumRating__block_invoke(uint64_t a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 effectiveValueForSetting:getMCFeatureMaximumAppsRating[0]()];
  char v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_LSResolveIdentifiers:(id)a3 context:(LSContext *)a4
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }

  else
  {
    [MEMORY[0x189604010] set];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  dispatch_time_t v7 = v6;

  return v7;
}

- (id)_LSResolveIdentifiers:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    [MEMORY[0x189604010] set];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v6 = v5;

  return v6;
}

id __56__LSApplicationRestrictionsManager_allowlistedBundleIDs__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 _MCProfileConnection];
  char v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 effectiveWhitelistedAppBundleIDs];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 _LSResolveIdentifiers:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)locked_setAllowlistedBundleIDs:(uint64_t)a1
{
  if (a1)
  {
    id v3 = (os_unfair_lock_s *)(a1 + 8);
    id v4 = a2;
    os_unfair_lock_assert_owner(v3);
    uint64_t v5 = [v4 copy];

    id v6 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v5;
  }

id __55__LSApplicationRestrictionsManager_restrictedBundleIDs__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 _MCProfileConnection];
  char v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 restrictedAppBundleIDsExcludingRemovedSystemApps];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 _LSResolveIdentifiers:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)locked_setRestrictedBundleIDs:(uint64_t)a1
{
  if (a1)
  {
    id v3 = (os_unfair_lock_s *)(a1 + 8);
    id v4 = a2;
    os_unfair_lock_assert_owner(v3);
    uint64_t v5 = [v4 copy];

    id v6 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = v5;
  }

- (void)beginListeningForChanges
{
  if (a1)
  {
    _LSServer_DatabaseExecutionContext();
    char v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    -[LSDBExecutionContext assertActiveForThisThread](v2);

    if (ManagedConfigurationLibrary_frameworkLibrary
      || (ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/ManagedConfigurati on.framework/ManagedConfiguration",  2)) != 0)
    {
      id v3 = a1 + 2;
      v5[0] = MEMORY[0x1895F87A8];
      v5[1] = 3221225472LL;
      id v6 = __60__LSApplicationRestrictionsManager_beginListeningForChanges__block_invoke;
      dispatch_time_t v7 = &unk_189D72BF0;
      id v8 = a1;
      id v4 = v5;
      os_unfair_lock_lock(v3);
      v6((uint64_t)v4);
      os_unfair_lock_unlock(v3);
    }
  }

void __60__LSApplicationRestrictionsManager_beginListeningForChanges__block_invoke(uint64_t a1)
{
  char v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_183E58000,  v2,  OS_LOG_TYPE_DEFAULT,  "Fetching all restrictions values and listening for change notifications",  buf,  2u);
  }

  id v25 = 0LL;
  *(void *)buf = 0LL;
  int inited = _LSContextInitReturningError((uint64_t)buf, (uint64_t)&v25);
  id v4 = v25;
  if (inited)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    [v5 _MCProfileConnection];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 effectiveWhitelistedAppBundleIDs];
    dispatch_time_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 _LSResolveIdentifiers:v7 context:buf];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[LSApplicationRestrictionsManager locked_setAllowlistedBundleIDs:](*(void *)(a1 + 32), v8);
    uint64_t v9 = *(void **)(a1 + 32);
    [v9 _MCProfileConnection];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 restrictedAppBundleIDsExcludingRemovedSystemApps];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 _LSResolveIdentifiers:v11 context:buf];
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[LSApplicationRestrictionsManager locked_setRestrictedBundleIDs:](*(void *)(a1 + 32), v12);
    _LSContextDestroy((void **)buf);
  }

  else
  {
    _LSDefaultLog();
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      __60__LSApplicationRestrictionsManager_beginListeningForChanges__block_invoke_cold_1( (uint64_t)v4,  (os_log_s *)v8,  v13);
    }
  }

  uint64_t v14 = (void *)MEMORY[0x189607968];
  [*(id *)(a1 + 32) _MCProfileConnection];
  char v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend(v14, "numberWithUnsignedInt:", objc_msgSend(v15, "appWhitelistState"));
  uint64_t v17 = *(void *)(a1 + 32);
  v18 = *(void **)(v17 + 32);
  *(void *)(v17 + 32) = v16;

  [*(id *)(a1 + 32) _MCProfileConnection];
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [v19 effectiveValueForSetting:getMCFeatureMaximumAppsRating[0]()];
  uint64_t v21 = *(void *)(a1 + 32);
  v22 = *(void **)(v21 + 72);
  *(void *)(v21 + 72) = v20;

  int v23 = -[LSApplicationRestrictionsManager isSystemAppDeletionEnabled](*(void *)(a1 + 32));
  uint64_t v24 = 1LL;
  if (!v23) {
    uint64_t v24 = 2LL;
  }
  *(void *)(*(void *)(a1 + 32) + 40LL) = v24;
}

- (uint64_t)isSystemAppDeletionEnabled
{
  if (result)
  {
    v1 = (void *)result;
    if (ManagedConfigurationLibrary_frameworkLibrary) {
      return [v1 isFeatureAllowed:getMCFeatureSystemAppRemovalAllowed[0]()];
    }
    ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/ManagedConfiguration.fra mework/ManagedConfiguration",  2);
    if (ManagedConfigurationLibrary_frameworkLibrary) {
      return [v1 isFeatureAllowed:getMCFeatureSystemAppRemovalAllowed[0]()];
    }
    else {
      return 1LL;
    }
  }

  return result;
}

- (id)calculateSetDifference:(id)a3 and:(id)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  _LSDefaultLog();
  dispatch_time_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationRestrictionsManager calculateSetDifference:and:].cold.1((uint64_t)v5, (uint64_t)v6, v7);
  }

  [MEMORY[0x189603FE0] setWithCapacity:0];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        if (([v6 containsObject:v14] & 1) == 0) {
          [v8 addObject:v14];
        }
      }

      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v11);
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t j = 0LL; j != v17; ++j)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v22 + 1) + 8 * j);
        if ((objc_msgSend(v9, "containsObject:", v20, (void)v22) & 1) == 0) {
          [v8 addObject:v20];
        }
      }

      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v17);
  }

  return v8;
}

- (void)handleMCEffectiveSettingsChanged
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  uint64_t v58 = 0LL;
  v59 = &v58;
  uint64_t v60 = 0x2020000000LL;
  uint64_t v61 = 0LL;
  _LSDefaultLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_183E58000,  v3,  OS_LOG_TYPE_DEFAULT,  "LSAppRestrictionsManager: handleMCEffectiveSettingsChanged.",  buf,  2u);
  }

  p_restrictionsAccessLock = &self->_restrictionsAccessLock;
  v53[0] = MEMORY[0x1895F87A8];
  v53[1] = 3221225472LL;
  v54 = __68__LSApplicationRestrictionsManager_handleMCEffectiveSettingsChanged__block_invoke;
  v55 = &unk_189D72C18;
  v56 = self;
  v57 = &v58;
  id v5 = v53;
  os_unfair_lock_lock(&self->_restrictionsAccessLock);
  v54((uint64_t)v5);
  os_unfair_lock_unlock(&self->_restrictionsAccessLock);

  int v6 = -[LSApplicationRestrictionsManager isSystemAppDeletionEnabled]((uint64_t)self);
  uint64_t v7 = 1LL;
  if (!v6) {
    uint64_t v7 = 2LL;
  }
  uint64_t v42 = v7;
  [MEMORY[0x189603FE0] setWithCapacity:0];
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v9 = (void *)MEMORY[0x189607968];
  -[LSApplicationRestrictionsManager _MCProfileConnection](self, "_MCProfileConnection");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInt:", objc_msgSend(v10, "appWhitelistState"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  unsigned int v11 = [v43 integerValue];
  -[LSApplicationRestrictionsManager _MCProfileConnection](self, "_MCProfileConnection");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 effectiveValueForSetting:getMCFeatureMaximumAppsRating[0]()];
  v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = v11;

  if (v11)
  {
    -[LSApplicationRestrictionsManager _MCProfileConnection](self, "_MCProfileConnection");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 effectiveWhitelistedAppBundleIDs];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSApplicationRestrictionsManager _LSResolveIdentifiers:](self, "_LSResolveIdentifiers:", v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  -[LSApplicationRestrictionsManager _MCProfileConnection](self, "_MCProfileConnection");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 restrictedAppBundleIDsExcludingRemovedSystemApps];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationRestrictionsManager _LSResolveIdentifiers:](self, "_LSResolveIdentifiers:", v18);
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v13 != 0) == -[LSApplicationRestrictionsManager isAllowlistEnabled]((uint64_t)self))
  {
    -[LSApplicationRestrictionsManager maximumRating](self);
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
    int v26 = [v25 intValue];
    LOBYTE(v26) = v26 == -[__CFString intValue](v41, "intValue");

    if ((v26 & 1) != 0)
    {
      if (v13)
      {
        -[LSApplicationRestrictionsManager allowlistedBundleIDs](self);
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[LSApplicationRestrictionsManager calculateSetDifference:and:](self, "calculateSetDifference:and:", v27, v16);
      }

      else
      {
        -[LSApplicationRestrictionsManager restrictedBundleIDs]((uint64_t)self);
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[LSApplicationRestrictionsManager calculateSetDifference:and:](self, "calculateSetDifference:and:", v27, v19);
      }

      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[__CFString unionSet:](v8, "unionSet:", v28);
      _LSDefaultLog();
      __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v8;
        _os_log_impl( &dword_183E58000,  v22,  OS_LOG_TYPE_DEFAULT,  "LSAppRestrictionsManager: settings changed, state changed apps %@",  buf,  0xCu);
      }
    }

    else
    {
      _LSDefaultLog();
      __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v41;
        _os_log_impl( &dword_183E58000,  v29,  OS_LOG_TYPE_DEFAULT,  "LSAppRestrictionsManager: new max rating set to %@",  buf,  0xCu);
      }

      +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
      __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v30 = -[LSApplicationRestrictionsManager maximumRating](self);
      v31 = -[os_log_s scanForApplicationStateChangesFromRank:toRank:]( v22,  "scanForApplicationStateChangesFromRank:toRank:",  v30,  v41);
      -[__CFString unionSet:](v8, "unionSet:", v31);
    }
  }

  else
  {
    _LSDefaultLog();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = @"OFF";
      if (v13) {
        uint64_t v21 = @"ON";
      }
      *(_DWORD *)buf = 138412290;
      v63 = v21;
      _os_log_impl( &dword_183E58000,  v20,  OS_LOG_TYPE_DEFAULT,  "LSAppRestrictionsManager: allowlist turned %@",  buf,  0xCu);
    }

    +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    __int128 v23 = v16;
    if (!v13)
    {
      -[LSApplicationRestrictionsManager allowlistedBundleIDs](self);
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[os_log_s scanForApplicationStateChangesWithAllowlist:](v22, "scanForApplicationStateChangesWithAllowlist:", v23);
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString unionSet:](v8, "unionSet:", v24);

    if (!v13) {
  }
    }

  if (v59[3] != v42)
  {
    +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v32 scanForForDeletableSystemApps];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString unionSet:](v8, "unionSet:", v33);
  }

  if (-[__CFString count](v8, "count"))
  {
    v34 = -[LSUseValuesMCStateProvider initWithAllowlistEnabled:allowlistedBundles:restrictedBundles:]( (id *)objc_alloc(&OBJC_CLASS___LSUseValuesMCStateProvider),  v13 != 0,  v16,  v19);
    v35 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
    [v35 sendApplicationStateChangedNotificationsFor:v8 stateProvider:v34 completion:&__block_literal_global_94];
  }

  v44[0] = MEMORY[0x1895F87A8];
  v44[1] = 3221225472LL;
  v45 = __68__LSApplicationRestrictionsManager_handleMCEffectiveSettingsChanged__block_invoke_2;
  v46 = &unk_189D72C60;
  v47 = self;
  id v36 = v16;
  id v48 = v36;
  id v37 = v19;
  id v49 = v37;
  id v38 = v43;
  id v50 = v38;
  v39 = v41;
  v51 = v39;
  uint64_t v52 = v42;
  v40 = v44;
  os_unfair_lock_lock(p_restrictionsAccessLock);
  v45((uint64_t)v40);
  os_unfair_lock_unlock(p_restrictionsAccessLock);

  _Block_object_dispose(&v58, 8);
}

uint64_t __68__LSApplicationRestrictionsManager_handleMCEffectiveSettingsChanged__block_invoke( uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(void *)(*(void *)(result + 32) + 40LL);
  return result;
}

void __68__LSApplicationRestrictionsManager_handleMCEffectiveSettingsChanged__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 56) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint64_t v5 = [*(id *)(a1 + 64) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v5;

  *(void *)(*(void *)(a1 + 32) + 40LL) = *(void *)(a1 + 72);
}

- (void)clearAllValues
{
  p_restrictionsAccessLock = &self->_restrictionsAccessLock;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  uint64_t v5 = __50__LSApplicationRestrictionsManager_clearAllValues__block_invoke;
  uint64_t v6 = &unk_189D72BF0;
  uint64_t v7 = self;
  uint64_t v3 = v4;
  os_unfair_lock_lock(p_restrictionsAccessLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_restrictionsAccessLock);
}

void __50__LSApplicationRestrictionsManager_clearAllValues__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0LL;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = 0LL;

  -[LSApplicationRestrictionsManager locked_setRestrictedBundleIDs:](*(void *)(a1 + 32), 0LL);
  -[LSApplicationRestrictionsManager locked_setAllowlistedBundleIDs:](*(void *)(a1 + 32), 0LL);
}

- (void)schedulePruneObsoleteTrustedSignerIdentities
{
  if (a1)
  {
    dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 16));
    if ([(id)__LSDefaultsGetSharedInstance() isServer])
    {
      dispatch_time_t v2 = dispatch_time(0LL, 1000000000LL);
      dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 24), v2, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    }
  }

- (void)_pruneObsoleteTrustedSignerIdentities
{
}

void __73__LSApplicationRestrictionsManager__pruneObsoleteTrustedSignerIdentities__block_invoke(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __73__LSApplicationRestrictionsManager__pruneObsoleteTrustedSignerIdentities__block_invoke_cold_1();
  }

  id v3 = objc_alloc(MEMORY[0x189603FE0]);
  [*(id *)(a1 + 32) _MCProfileConnection];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 trustedCodeSigningIdentities];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint8_t v6 = (void *)[v3 initWithArray:v5];

  uint64_t v7 = (void *)[v6 mutableCopy];
  _LSServer_DatabaseExecutionContext();
  id v8 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __73__LSApplicationRestrictionsManager__pruneObsoleteTrustedSignerIdentities__block_invoke_95;
  v12[3] = &unk_189D72C88;
  id v9 = v7;
  id v13 = v9;
  -[LSDBExecutionContext syncRead:](v8, v12);

  if (v6 && [v9 count])
  {
    [v6 minusSet:v9];
    [*(id *)(a1 + 32) _MCProfileConnection];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 allObjects];
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setTrustedCodeSigningIdentities:v11];
  }
}

void __73__LSApplicationRestrictionsManager__pruneObsoleteTrustedSignerIdentities__block_invoke_95( uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  +[LSApplicationRecord enumeratorWithOptions:](&OBJC_CLASS___LSApplicationRecord, "enumeratorWithOptions:", 0LL, 0LL);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6) signerIdentity];
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7) {
          [*(id *)(a1 + 32) removeObject:v7];
        }

        ++v6;
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }
}

- (BOOL)_LSApplyRestrictedSet:(id)a3 forRestriction:(id)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (void *)MEMORY[0x189603FC8];
  id v7 = a4;
  id v8 = a3;
  [v6 dictionary];
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 allObjects];
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 MCSetUnionRestriction:v7 values:v10];
  __int128 v11 = (void *)[v9 copy];
  __int16 v22 = 0;
  _LSDefaultLog();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = (uint64_t)v11;
    __int16 v25 = 2112;
    int v26 = @"com.apple.lsd.appremoval";
    _os_log_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_DEFAULT,  "ManagedConfiguration applyRestrictionDictionary:%@ clientType:%@",  buf,  0x16u);
  }

  -[LSApplicationRestrictionsManager _MCProfileConnection](self, "_MCProfileConnection");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v21 = 0LL;
  uint64_t v14 = [v13 applyRestrictionDictionary:v11 clientType:@"com.apple.lsd.appremoval" clientUUID:@"com.apple.lsd.appremoval" localizedClientDescription:&stru_189D7B4C8 localizedWarningMessage:0 outRestric tionChanged:(char *)&v22 + 1 outEffectiveSettingsChanged:&v22 outError:&v21];
  id v15 = (__CFString *)v21;

  _LSDefaultLog();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [MEMORY[0x189607968] numberWithBool:v14];
    uint64_t v18 = (void *)v17;
    if (v15) {
      objc_super v19 = v15;
    }
    else {
      objc_super v19 = &stru_189D7B4C8;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v17;
    __int16 v25 = 2112;
    int v26 = v19;
    _os_log_impl( &dword_183E58000,  v16,  OS_LOG_TYPE_DEFAULT,  "ManagedConfiguration applyRestrictionDictionary complete with result %@ %@",  buf,  0x16u);
  }

  return v14;
}

- (BOOL)cleanRemovedSystemApplicationsList
{
  return a1 != 0;
}

- (void)setRemovedSystemApplicationIdentifiers:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (ManagedConfigurationLibrary_frameworkLibrary
      || (ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/ManagedConfigurati on.framework/ManagedConfiguration",  2)) != 0)
    {
      [a1 _LSApplyRestrictedSet:v3 forRestriction:getMCFeatureRemovedSystemAppBundleIDs()];
    }
  }
}

- (id)removedSystemApplicationIdentifiers
{
  id v1 = a1;
  if (a1)
  {
    [a1 _MCProfileConnection];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 removedSystemAppBundleIDs];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v1 _LSResolveIdentifiers:v3];
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (uint64_t)setApplication:(int)a3 removed:
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  if (!a1) {
    goto LABEL_15;
  }
  if (!ManagedConfigurationLibrary_frameworkLibrary)
  {
    ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/ManagedConfiguration.fra mework/ManagedConfiguration",  2);
    if (!ManagedConfigurationLibrary_frameworkLibrary)
    {
      a1 = 0LL;
      goto LABEL_15;
    }
  }

  [(id)a1 _MCProfileConnection];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 removedSystemAppBundleIDs];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)a1 _LSResolveIdentifiers:v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v9 = (void *)[v8 mutableCopy];

  if (a3)
  {
    [v9 addObject:v5];
    _LSDefaultLog();
    __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v5;
      __int128 v11 = "Added identifier %@ to removedSystemApplications list";
LABEL_9:
      _os_log_impl(&dword_183E58000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0xCu);
    }
  }

  else
  {
    [v9 removeObject:v5];
    _LSDefaultLog();
    __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v5;
      __int128 v11 = "Removed identifier %@ from removedSystemApplications list";
      goto LABEL_9;
    }
  }

  a1 = [(id)a1 _LSApplyRestrictedSet:v9 forRestriction:getMCFeatureRemovedSystemAppBundleIDs()];
  if ((a1 & 1) == 0)
  {
    _LSDefaultLog();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[LSApplicationRestrictionsManager setApplication:removed:].cold.1(a3, (uint64_t)v5, v12);
    }
  }

LABEL_15:
  return a1;
}

- (BOOL)isRatingAllowed:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    -[LSApplicationRestrictionsManager maximumRating](a1);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (int)[v3 intValue] >= 1)
    {
      int v5 = [v3 intValue];
      BOOL v6 = v5 <= (int)[v4 intValue];
    }

    else
    {
      BOOL v6 = 1LL;
    }
  }

  else
  {
    BOOL v6 = 0LL;
  }

  return v6;
}

- (id)isApplicationRestricted:(id *)result
{
  if (result) {
    return -[LSApplicationRestrictionsManager isApplicationRestricted:checkFlags:](result, a2, 0LL);
  }
  return result;
}

- (id)isApplicationRestricted:(uint64_t)a3 checkFlags:
{
  if (result)
  {
    uint64_t v4 = result;
    id v5 = a2;
    -[LSApplicationRestrictionsManager defaultStateProvider](v4);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = -[LSApplicationRestrictionsManager isApplicationRestricted:checkFlags:stateProvider:]((uint64_t)v4, v5, a3, v6);

    return (id *)v7;
  }

  return result;
}

- (id)isApplicationRestricted:(int)a3 checkFeatureRestrictions:
{
  if (result)
  {
    uint64_t v4 = result;
    id v5 = a2;
    -[LSApplicationRestrictionsManager defaultStateProvider](v4);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = -[LSApplicationRestrictionsManager isApplicationRestricted:checkFeatureRestrictions:stateProvider:]( (uint64_t)v4,  v5,  a3,  v6);

    return (id *)v7;
  }

  return result;
}

- (BOOL)isAppExtensionRestricted:(BOOL)a1
{
  id v3 = a2;
  if (a1) {
    a1 = (ManagedConfigurationLibrary_frameworkLibrary
  }
       || (ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/ManagedConfigurat ion.framework/ManagedConfiguration",  2)) != 0)
      && _LSIsNewsWidgetBundleIdentifier(v3)
      && ![(id)a1 isFeatureAllowed:getMCFeatureNewsTodayAllowed()];

  return a1;
}

- (BOOL)isFeatureAllowed:(id)a3
{
  return isFeatureAllowed(a3);
}

- (id)allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:(void *)a3 originatingAppBundleID:(uint64_t)a4 originatingAccountIsManaged:
{
  id v4 = a1;
  if (a1)
  {
    id v7 = a3;
    id v8 = a2;
    [v4 _MCProfileConnection];
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:v8 originatingAppBundleID:v7 originatingAccountIsManaged:a4];
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      [MEMORY[0x189604010] setWithArray:v10];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v4 = 0LL;
    }
  }

  return v4;
}

- (uint64_t)isAdTrackingEnabled
{
  if (a1
    && (ManagedConfigurationLibrary_frameworkLibrary
     || (ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/ManagedConfiguratio n.framework/ManagedConfiguration",  2)) != 0))
  {
    return [a1 isFeatureAllowed:getMCFeatureIdentifierForAdvertisingAllowed()];
  }

  else
  {
    return 0LL;
  }

- (uint64_t)isLimitAdTrackingForced
{
  if (result)
  {
    id v1 = (void *)result;
    if (ManagedConfigurationLibrary_frameworkLibrary) {
      return [v1 isFeatureAllowed:getMCFeatureLimitAdTrackingForced()];
    }
    ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/ManagedConfiguration.fra mework/ManagedConfiguration",  2);
    if (ManagedConfigurationLibrary_frameworkLibrary) {
      return [v1 isFeatureAllowed:getMCFeatureLimitAdTrackingForced()];
    }
    else {
      return 1LL;
    }
  }

  return result;
}

- (BOOL)forceUpdateRestrictionKnowledgeWithError:(void *)a1
{
  if (a1)
  {
    [a1 _MCRestrictionManager];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 invalidateSettings];

    [a1 _MCRestrictionManager];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 invalidateRestrictions];

    [a1 handleMCEffectiveSettingsChanged];
  }

  return a1 != 0LL;
}

- (void).cxx_destruct
{
}

- (void)_MCRestrictionManager
{
  OUTLINED_FUNCTION_20( &dword_183E58000,  v0,  v1,  "LSRestrictionsManager: [MCRestrictionManager sharedManager] returned nil",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_33();
}

void __60__LSApplicationRestrictionsManager_beginListeningForChanges__block_invoke_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 136315394;
  uint64_t v4 = "-[LSApplicationRestrictionsManager beginListeningForChanges]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_4_0( &dword_183E58000,  a2,  a3,  "Could not set allowlisted or restricted bundleIDs: could not get context in %s: %@",  (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)calculateSetDifference:(os_log_t)log and:.cold.1( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( &dword_183E58000,  log,  OS_LOG_TYPE_DEBUG,  "LSAppRestrictionsManager: comparing old %@ to new %@",  (uint8_t *)&v3,  0x16u);
  OUTLINED_FUNCTION_1();
}

void __73__LSApplicationRestrictionsManager__pruneObsoleteTrustedSignerIdentities__block_invoke_cold_1()
{
}

- (void)setApplication:(os_log_s *)a3 removed:.cold.1(char a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int v3 = @"remove";
  if ((a1 & 1) == 0) {
    int v3 = @"restore";
  }
  int v4 = 138412546;
  __int16 v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  OUTLINED_FUNCTION_4_0(&dword_183E58000, a3, (uint64_t)a3, "Failed to %@ app with bundleID: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

@end