uint64_t start()
{
  void *v0;
  int AppBooleanValue;
  int v2;
  BOOL v3;
  uint64_t v4;
  int v5;
  os_log_s *v6;
  CFStringRef v7;
  void *v8;
  os_log_s *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v11;
  NSXPCListener *v12;
  NSXPCListener *v13;
  void *v14;
  NSXPCListener *v15;
  NSXPCListener *v16;
  void *v17;
  MCProfileServiceDelegate *v18;
  void *v19;
  void *v20;
  char v22;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  CFStringRef v25;
  MCIsDaemonProcess = 1;
  MCLoggingInitialize();
  +[NSError _setFileNameLocalizationEnabled:](&OBJC_CLASS___NSError, "_setFileNameLocalizationEnabled:", 0LL);
  v0 = objc_autoreleasePoolPush();
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue( kMCInternalAbortOnUnreadableFiles,  kCFPreferencesAnyApplication,  &keyExistsAndHasValidFormat);
  v2 = keyExistsAndHasValidFormat;
  MCFixHostileSymlinks();
  v22 = 0;
  if (v2) {
    v3 = AppBooleanValue == 0;
  }
  else {
    v3 = 1;
  }
  v4 = v3;
  v5 = MCCheckSystemGroupContainerFileReadability(v4, &v22);
  v6 = (os_log_s *)_MCLogObjects[2];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects[2], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "System group container check complete!",  buf,  2u);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects[2], OS_LOG_TYPE_ERROR))
    {
      if (v22) {
        v7 = @"recoverable";
      }
      else {
        v7 = @"unrecoverable";
      }
      *(_DWORD *)buf = 138543362;
      v25 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "System group container check found %{public}@ errors!",  buf,  0xCu);
    }

    if ((v4 & 1) == 0) {
      abort();
    }
  }

  objc_autoreleasePoolPop(v0);
  v8 = objc_autoreleasePoolPush();
  v9 = (os_log_s *)_MCLogObjects[2];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Service starting...", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  0LL,  (CFNotificationCallback)sub_100002D40,  @"com.apple.language.changed",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  +[MCProfileStateHandler addProfileSettingsStateHandler]( &OBJC_CLASS___MCProfileStateHandler,  "addProfileSettingsStateHandler");
  +[MCProfileStateHandler addProfileRestrictionsStateHandler]( &OBJC_CLASS___MCProfileStateHandler,  "addProfileRestrictionsStateHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  [v11 start];
  v12 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  v13 = -[NSXPCListener initWithMachServiceName:](v12, "initWithMachServiceName:", MCProfileServiceName);
  v14 = (void *)qword_1000DBFE8;
  qword_1000DBFE8 = (uint64_t)v13;

  v15 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  v16 = -[NSXPCListener initWithMachServiceName:](v15, "initWithMachServiceName:", MCProfileServicePublicName);
  v17 = (void *)qword_1000DBFF0;
  qword_1000DBFF0 = (uint64_t)v16;

  v18 = objc_opt_new(&OBJC_CLASS___MCProfileServiceDelegate);
  v19 = (void *)qword_1000DBFF8;
  qword_1000DBFF8 = (uint64_t)v18;

  [(id)qword_1000DBFE8 setDelegate:qword_1000DBFF8];
  [(id)qword_1000DBFF0 setDelegate:qword_1000DBFF8];
  [(id)qword_1000DBFE8 resume];
  [(id)qword_1000DBFF0 resume];

  objc_autoreleasePoolPop(v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v20 run];

  return 0LL;
}

uint64_t sub_100002D40()
{
  v0 = (os_log_s *)_MCLogObjects[2];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "System language changed", v2, 2u);
  }

  return xpc_transaction_exit_clean();
}

void sub_100002DE8(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MCProfileServiceServer);
  v2 = (void *)qword_1000DC008;
  qword_1000DC008 = (uint64_t)v1;
}

void sub_10000309C(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workerQueueBackgroundActivityManager]);
  [v2 start];

  if ((MCHasMigrated() & 1) == 0)
  {
    v3 = objc_opt_new(&OBJC_CLASS___MCMigrator);
    v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workerQueue]);
    -[MCMigrator migrateWithPostMigrationTaskQueue:](v3, "migrateWithPostMigrationTaskQueue:", v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12LL));
}

void sub_100003128(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v2 removeOrphanedClientRestrictions];
  [v2 recomputeUserRestrictionsAndEffectiveUserSettings];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v4 = MCEffectiveUserSettingsFilePath();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned __int8 v6 = [v3 fileExistsAtPath:v5];

  if ((v6 & 1) == 0)
  {
    v7 = (os_log_s *)_MCLogObjects[0];
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_FAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "EffectiveUserSettings.plist is missing. Attempting to recreate it...",  (uint8_t *)&v14,  2u);
    }

    [v2 recomputeEffectiveUserSettingsPasscode:0];
  }

  [*(id *)(a1 + 32) workerQueueNotifyUserLoggedIn];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager sharedManager](&OBJC_CLASS___MCPasscodeManager, "sharedManager"));
  unsigned __int8 v9 = [v8 isPasscodeSet];

  if ((v9 & 1) == 0)
  {
    [*(id *)(a1 + 32) notifyFirstUnlock];
    [*(id *)(a1 + 32) notifyDeviceUnlockedWithCompletion:0];
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000337C;
  handler[3] = &unk_1000C29F8;
  handler[4] = *(void *)(a1 + 32);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", 0LL, handler);
  xpc_set_event_stream_handler("com.apple.fsevents.matching", 0LL, &stru_1000C2A38);
  v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appWorkspace]);
  [v10 addObserver:*(void *)(a1 + 32)];

  notify_register_dispatch( "com.apple.message.MailAccountsChanged",  &v14,  *(dispatch_queue_t *)(*(void *)(a1 + 32) + 88LL),  &stru_1000C2A78);
  [*(id *)(a1 + 32) notifyBatterySaverModeChanged];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v11 addObserver:*(void *)(a1 + 32) selector:"localeChanged" name:NSCurrentLocaleDidChangeNotification object:0];

  [*(id *)(a1 + 32) reapplyAppEnforcedRestrictionsWithAssertion:*(void *)(a1 + 40)];
  id v12 = +[MCProfile thisDeviceType](&OBJC_CLASS___MCProfile, "thisDeviceType");
  if (+[MCTargetDeviceResolver purgatorySupportedForDevice:]( &OBJC_CLASS___MCTargetDeviceResolver,  "purgatorySupportedForDevice:",  v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
    [v13 purgePurgatoryProfilesForTargetDevice:v12];
  }
}

void sub_10000337C(uint64_t a1, xpc_object_t xdict)
{
  v3 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(xdict, _xpc_event_key_name));
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  if ([v4 isEqualToString:@"com.apple.system.lowpowermode"])
  {
    [*(id *)(a1 + 32) notifyBatterySaverModeChanged];
  }

  else if ([v4 isEqualToString:@"GracePeriodChanged"])
  {
    [*(id *)(a1 + 32) notifyGracePeriodChanged];
  }

  else if ([v4 isEqualToString:@"ProvisioningProfileInstalled"] {
         || [v4 isEqualToString:@"ProvisioningProfileRemoved"])
  }
  {
    [*(id *)(a1 + 32) notifyProvisioningProfilesChanged];
  }

  else if ([v4 isEqualToString:@"FirstUnlock"])
  {
    [*(id *)(a1 + 32) notifyFirstUnlock];
  }

  else if ([v4 isEqualToString:@"com.apple.LoginKit.isLoggedIn"])
  {
    [*(id *)(a1 + 32) notifyUserLoggedIn];
  }

  else if ([v4 isEqualToString:@"com.apple.keystore.memento.effaced"])
  {
    [*(id *)(a1 + 32) notifyMementoEffaced];
  }
}

void sub_1000034A8(id a1, int a2)
{
}

void sub_1000034E8(id a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[MCBatterySaverMode currentBatterySaverRestrictions]( &OBJC_CLASS___MCBatterySaverMode,  "currentBatterySaverRestrictions"));
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = @"Setting";
    if (!v1) {
      v3 = @"Removing";
    }
    *(_DWORD *)buf = 138543362;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%{public}@ battery saver mode restrictions",  buf,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  uint64_t v5 = kBatterySaverClientType;
  uint64_t v6 = MCLocalizedFormat(@"BATTERY_SAVER_CLIENT_TYPE");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v10 = 0LL;
  [v4 setClientRestrictions:v1 clientType:v5 clientUUID:v5 sender:@"ProfileServiceServer.NotifyBatterySaverModeChanged" localizedClientDescription:v7 localizedWarning:0 outRestrictionsChange d:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:&v10];
  v8 = (__CFString *)v10;

  if (v8)
  {
    unsigned __int8 v9 = _MCLogObjects[2];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to set battery saver restrictions with error %{public}@",  buf,  0xCu);
    }
  }
}

void sub_100003770()
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( +[MCAppEnforcedRestrictions restrictionEnforcingApps]( &OBJC_CLASS___MCAppEnforcedRestrictions,  "restrictionEnforcingApps"));
  id v0 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v0)
  {
    id v1 = v0;
    uint64_t v17 = *(void *)v20;
    uint64_t v2 = kAppEnforcedRestrictionsClientType;
    do
    {
      for (i = 0LL; i != v1; i = (char *)i + 1)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MCAppEnforcedRestrictions enforcedRestrictionsForBundleID:]( &OBJC_CLASS___MCAppEnforcedRestrictions,  "enforcedRestrictionsForBundleID:",  v4));
        id v6 = v4;
        v7 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v6));
        v8 = v7;
        unsigned __int8 v9 = v6;
        if (v7)
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedName]);
          id v11 = [v10 length];

          unsigned __int8 v9 = v6;
          if (v11)
          {
            unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedName]);
          }
        }

        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[MCAppEnforcedRestrictionUtilities clientUUIDForBundleID:]( &OBJC_CLASS___MCAppEnforcedRestrictionUtilities,  "clientUUIDForBundleID:",  v6));
        id v18 = 0LL;
        [v12 setClientRestrictions:v5 clientType:v2 clientUUID:v13 sender:@"ProfileServiceServer.ReapplyAppEnforcedRestrictions" localizedClientDescription:v9 localizedWarning:0 outRestrictions Changed:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:&v18];
        id v14 = v18;

        if (v14)
        {
          v15 = _MCLogObjects[2];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v24 = v6;
            __int16 v25 = 2114;
            id v26 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to set enforced restrictions for app “%{public}@” with error %{public}@",  buf,  0x16u);
          }
        }
      }

      id v1 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
    }

    while (v1);
  }
}

id sub_100003F28(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMemberQueueHasMigrated:1];
}

void sub_100003F34(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    v3 = (os_log_s *)_MCLogObjects[0];
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      uint64_t v5 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Recompute Profile Restrictions error: %@",  (uint8_t *)&v4,  0xCu);
    }
  }
}

id sub_100003FE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) workerQueueRecomputeNagMessage];
}
}

void sub_10000493C(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000819BC();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 verifiedMDMProfileIdentifierWithCleanUp]);
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0LL, v4);
}

void sub_100004A44(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_100081A3C();
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 popProfileDataAtHeadOfInstallationQueue]);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100004B4C(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_100081ABC();
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 peekPurgatoryProfileDataForTargetDevice:*(void *)(a1 + 40)]);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100004CE0(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_100081B3C();
  }
  id v2 = *(id *)(a1 + 32);
  if ([v2 isEqualToString:@"com.apple.WebSheet"])
  {

    id v2 = 0LL;
  }

  if (!*(_BYTE *)(a1 + 72)) {
    goto LABEL_14;
  }
  if (+[DMCMultiUserModeUtilities isSharediPad](&OBJC_CLASS___DMCMultiUserModeUtilities, "isSharediPad"))
  {
    uint64_t v3 = MCInstallationErrorDomain;
    uint64_t v4 = MCErrorArray(@"ERROR_PROFILE_NO_INTERACTIVE_INSTALLATION_IN_MULTI_USER");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = MCErrorTypeFatal;
    uint64_t v7 = v3;
    uint64_t v8 = 4033LL;
LABEL_11:
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v7,  v8,  v5,  v6,  0LL));

    goto LABEL_12;
  }

  __int16 v21 = 0;
  uint64_t v9 = MCSBSSpringBoardServerPort();
  MCSBGetScreenLockStatus(v9, (char *)&v21 + 1, &v21);
  id v10 = 0LL;
  if (HIBYTE(v21) && (_BYTE)v21)
  {
    uint64_t v11 = MCInstallationErrorDomain;
    uint64_t v12 = MCErrorArray(@"ERROR_DEVICE_LOCKED");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v6 = MCErrorTypeFatal;
    uint64_t v7 = v11;
    uint64_t v8 = 4009LL;
    goto LABEL_11;
  }

LABEL_12:
  if (!v10)
  {
LABEL_14:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
    id v14 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100004F0C;
    v16[3] = &unk_1000C2B78;
    v16[4] = *(void *)(a1 + 56);
    id v17 = v14;
    char v20 = *(_BYTE *)(a1 + 72);
    id v18 = v2;
    id v19 = *(id *)(a1 + 64);
    [v13 queueProfileDataForInstallation:v17 originalFileName:v15 completion:v16];

    goto LABEL_15;
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();

LABEL_15:
}
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v8);
  }

  return v5;
}

void sub_100004F0C(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v16 = a2;
  id v7 = a3;
  if ([v16 MCContainsErrorDomain:MCProfileErrorDomain code:1000]
    && [*(id *)(a1 + 32) _isValidProvisioningProfileData:*(void *)(a1 + 40)])
  {
    uint64_t v8 = MCInstallationErrorDomain;
    uint64_t v9 = MCErrorArray(@"ERROR_PROVISIONING_PROFILE_UI_INSTALL_NOT_SUPPORTED");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v8,  4053LL,  v10,  MCErrorTypeFatal));

    id v16 = (id)v11;
  }

  if (v7 && !v16 && *(_BYTE *)(a1 + 64)) {
    [*(id *)(a1 + 32) _handleSettingsJumpWithProfileData:*(void *)(a1 + 40) targetDeviceType:a4 bundleID:*(void *)(a1 + 48)];
  }
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v7 UUID]);
  id v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = (const __CFString *)v13;
  }
  else {
    uint64_t v15 = &stru_1000C4568;
  }
  (*(void (**)(uint64_t, const __CFString *, uint64_t, id))(v12 + 16))(v12, v15, a4, v16);
}

void sub_1000052C8(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_100081BBC();
  }
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  id v3 = [v2 verifiedMDMProfileIdentifierWithCleanUp];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  id v20 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 installProfileData:v5 options:v6 interactionClient:v7 source:v8 outError:&v20]);
  id v10 = v20;

  [*(id *)(a1 + 48) didFinishInstallationWithIdentifier:v9 error:v10];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) workerQueueBackgroundActivityManager]);
  [v11 rescheduleProfileJanitorJob];

  uint64_t v12 = *(void **)(a1 + 80);
  if (v12)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005450;
    block[3] = &unk_1000C2BC8;
    id v19 = v12;
    id v16 = v9;
    id v17 = v10;
    id v18 = *(id *)(a1 + 72);
    dispatch_async(v14, block);
  }
}

uint64_t sub_100005450(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[7] + 16LL))(a1[7], a1[4], a1[5]);
}

void sub_100005588(uint64_t *a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_100081C3C();
  }
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v8 = 0LL;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v2 updateProfileWithIdentifier:v3 interactionClient:v4 source:v5 outError:&v8]);
  id v7 = v8;

  [(id)a1[5] didFinishInstallationWithIdentifier:v6 error:v7];
  (*(void (**)(void))(a1[8] + 16))();
}

void sub_100005750(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_100081CBC();
  }
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  [v2 removeProfileWithIdentifier:*(void *)(a1 + 32) installationType:*(void *)(a1 + 72) source:*(void *)(a1 + 40)];

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) workerQueueBackgroundActivityManager]);
  [v3 rescheduleProfileJanitorJob];

  uint64_t v4 = *(void **)(a1 + 64);
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000585C;
    v7[3] = &unk_1000C2C40;
    id v9 = v4;
    id v8 = *(id *)(a1 + 56);
    dispatch_async(v6, v7);
  }

uint64_t sub_10000585C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100005958(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_100081D3C();
  }
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  [v2 removeUninstalledProfileWithIdentifier:*(void *)(a1 + 32) installationType:*(void *)(a1 + 56) targetDeviceType:*(void *)(a1 + 64)];

  uint64_t v3 = *(void **)(a1 + 48);
  if (v3)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100005A4C;
    v6[3] = &unk_1000C2C40;
    id v8 = v3;
    id v7 = *(id *)(a1 + 40);
    dispatch_async(v5, v6);
  }

uint64_t sub_100005A4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_100005C94(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_100081DBC();
  }
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v2 removeOrphanedClientRestrictions];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100005FF0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

id sub_100006018(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) memberQueueHasMigrated];
  id result = [*(id *)(a1 + 32) memberQueueHasActivationRecordChangesPending];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

uint64_t sub_10000605C(uint64_t a1)
{
  id v2 = (os_log_s *)_MCLogObjects[2];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Now allowing client to proceed.", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0LL);
  }
  return result;
}

LABEL_3:
  uint64_t v11 = 0;
  uint64_t v12 = 1;
LABEL_4:
  uint64_t v13 = 1;
LABEL_5:
  *a5 = v13;
  *a6 = v12;

  return v11;
}

BOOL sub_10000693C(id a1, NSString *a2)
{
  return MCIsAppExemptFromOpenInSourceRestrictions(a2);
}

BOOL sub_100006944(id a1, NSString *a2)
{
  return MCIsAppAccountBasedSourceForOpenIn(a2);
}

uint64_t sub_10000694C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

BOOL sub_100006D3C(id a1, NSString *a2)
{
  return MCIsAppExemptFromImportFromTargetRestrictions(a2);
}

BOOL sub_100006D44(id a1, NSString *a2)
{
  return MCIsAppAccountBasedTargetForOpenIn(a2);
}

uint64_t sub_100006D4C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

uint64_t sub_100007210(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

BOOL sub_100007508(id a1, MailAccount *a2, NSDictionary *a3)
{
  uint64_t v3 = a2;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___LocalAccount);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    LOBYTE(v5) = 0;
  }
  else {
    unsigned int v5 = -[MailAccount restrictedFromSendingExternally](v3, "restrictedFromSendingExternally") ^ 1;
  }

  return v5;
}

BOOL sub_100007560(uint64_t a1, void *a2)
{
  id v3 = a2;
  else {
    BOOL v4 = ([v3 sourceIsManaged] & 1) == 0 && *(_BYTE *)(a1 + 33) != 0;
  }

  return v4;
}

void sub_1000075C4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 identifier]);
  [v2 addObject:v3];
}

uint64_t sub_100007608(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

void sub_100007DE4(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_100081E3C();
  }
  uint64_t v2 = ((uint64_t (*)(void))MCNagUIMetaFilePath)();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v3));

  if (v4 && *(void *)(a1 + 32))
  {
    unsigned int v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Starting password compliance by %{public}@",  (uint8_t *)&v9,  0xCu);
    }

    uint64_t v7 = MCNagUIMetaFilePath([v4 setObject:*(void *)(a1 + 32) forKey:kMCNagMetaTimerExpiryDateKey]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v4 MCWriteToBinaryFile:v8];
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t sub_10000803C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v3 = MCBackupContainsPasscodeFilePath();
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v2 removeItemAtPath:v4 error:0];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v5 notifyHaveSeenComplianceMessageWithLastLockDate:*(void *)(a1 + 32)];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t sub_1000081A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t sub_1000082B8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v2 notifyClientsToRecomputeCompliance];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_1000083D4(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_10008203C();
  }
  uint64_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%@ is attempting to clear the recovery passcode",  (uint8_t *)&v7,  0xCu);
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 clearRecoveryPasscode]);

  if (!v5)
  {
    else {
      uint64_t v6 = 6LL;
    }
    +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:]( &OBJC_CLASS___MCPasscodeAnalytics,  "sendRecoveryPasscodeClearedEventWithReason:",  v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100008640(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000820BC();
  }
  uint64_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    id v20 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%@ is attempting to change the passcode",  buf,  0xCu);
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 32);
  id v18 = 0LL;
  unsigned int v9 = [v4 changePasscodeFrom:v5 to:v6 skipRecovery:v7 senderBundleID:v8 outError:&v18];
  id v10 = v18;

  unsigned int v11 = [*(id *)(a1 + 32) isEqualToString:MCSetupAssistantBundleIdentifier];
  if (v9 && v11)
  {
    uint64_t v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Buddy is changing the passcode; attempting to create unlock token",
        buf,
        2u);
    }

    uint64_t v13 = *(void *)(a1 + 48);
    id v17 = v10;
    char v14 = MCKeybagCreateMDMEscrowWithPasscode(v13, &v17);
    id v15 = v17;

    if ((v14 & 1) == 0)
    {
      id v16 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Can't create escrow keybag. Error: %{public}@",  buf,  0xCu);
      }
    }
  }

  else
  {
    id v15 = v10;
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

void sub_100008970(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_10008213C();
  }
  uint64_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%@ is attempting to change the passcode with recovery passcode",  buf,  0xCu);
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = 0LL;
  [v4 changePasscodeWithRecoveryPasscode:v5 to:v6 skipRecovery:v7 senderBundleID:v8 outError:&v10];
  id v9 = v10;

  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

void sub_100008B6C(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000821BC();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  id v6 = 0LL;
  char v3 = MCKeybagCreateMDMEscrowWithPasscode(v2, &v6);
  id v4 = v6;
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v8 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Can't create escrow keybag. Error: %{public}@",  buf,  0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100008D98(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_10008223C();
  }
  uint64_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%@ is attempting to clear the passcode",  buf,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = 0LL;
  [v4 clearPasscodeWithEscrowKeybagData:v5 secret:v6 senderBundleID:v7 outError:&v9];
  id v8 = v9;

  [*(id *)(a1 + 56) workerQueueRecomputeNagMessage];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
}

void sub_100008F5C(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000822BC();
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager sharedManager](&OBJC_CLASS___MCPasscodeManager, "sharedManager"));
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = 0LL;
  [v2 isPasscodeCompliantWithNamedPolicy:v3 outError:&v5];
  id v4 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_1000090B4(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_10008233C();
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
  [v2 resetPasscodeMetadata];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_1000092A0(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000823BC();
  }
  uint64_t v2 = objc_opt_new(&OBJC_CLASS___MCMigrator);
  -[MCMigrator migratePostDataMigratorWithContext:passcodeWasSetInBackup:]( v2,  "migratePostDataMigratorWithContext:passcodeWasSetInBackup:",  *(unsigned int *)(a1 + 48),  *(unsigned __int8 *)(a1 + 52));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_1000093D4(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_10008243C();
  }
  uint64_t v2 = objc_opt_new(&OBJC_CLASS___MCMigrator);
  -[MCMigrator migrateCleanupMigratorWithContext:](v2, "migrateCleanupMigratorWithContext:", *(unsigned int *)(a1 + 56));
  uint64_t v3 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
  CFPreferencesSetAppValue(kMCHasCheckedForAutoInstalledProfiles, kCFBooleanFalse, kMCNotBackedUpPreferencesDomain);
  CFPreferencesAppSynchronize(v3);
  [*(id *)(a1 + 32) workerQueueCheckForAutoInstallProfiles];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

id sub_100009674(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000824BC();
  }
  LODWORD(v3) = *(_DWORD *)(a1 + 96);
  return objc_msgSend( *(id *)(a1 + 32),  "_workerQueue_setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:senderPID: sender:assertion:completion:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(unsigned __int8 *)(a1 + 100),  *(unsigned __int8 *)(a1 + 101),  *(void *)(a1 + 56),  *(void *)(a1 + 64),  v3,  *(void *)(a1 + 72),  *(void *)(a1 + 80),  *(void *)(a1 + 88));
}

uint64_t sub_10000990C(void *a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_10008253C();
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v2 removeBoolSetting:a1[4] sender:a1[5]];

  return (*(uint64_t (**)(void))(a1[7] + 16LL))();
}

uint64_t sub_100009A80(void *a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000825BC();
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v2 removeValueSetting:a1[4] sender:a1[5]];

  return (*(uint64_t (**)(void))(a1[7] + 16LL))();
}

uint64_t sub_100009BA0(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_10008263C();
  }
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:"));
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    uint64_t v13 = MCSBSApplicationLaunchFromURLOptionUnlockDeviceKey();
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
    char v14 = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    unsigned __int8 v6 = [v3 openSensitiveURL:v2 withOptions:v5];

    if ((v6 & 1) == 0)
    {
      os_log_t v7 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        id v8 = v7;
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v2 absoluteString]);
        int v11 = 138543362;
        uint64_t v12 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Open of URL %{public}@ reported failure",  (uint8_t *)&v11,  0xCu);
      }
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

LABEL_49:
    int v11 = v56;
LABEL_50:

    goto LABEL_51;
  }

  __int16 v21 = _MCLogObjects[2];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "CheckCarrierProfile: Removing all installed carrier profiles as requested.",  buf,  2u);
  }

  -[MCProfileServiceServer _workerQueueRemoveAllCarrierProfiles](self, "_workerQueueRemoveAllCarrierProfiles");
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[MCProfileServiceServer workerQueueBackgroundActivityManager]( self,  "workerQueueBackgroundActivityManager"));
  [v16 rescheduleProfileJanitorJob];
LABEL_54:
}

void sub_10000AD34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v20[2] = sub_10000AF70;
  v20[3] = &unk_1000C2FC0;
  os_log_t v7 = *(void **)(a1 + 40);
  v20[4] = *(void *)(a1 + 32);
  char v22 = *(_BYTE *)(a1 + 48);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  id v21 = v7;
  id v8 = objc_retainBlock(v20);
  id v9 = (void (**)(void, void, void, void, void, void))v8;
  if (v6)
  {
    os_log_t v10 = _MCLogObjects[2];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = v10;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 MCVerboseDescription]);
      *(_DWORD *)buf = 138543362;
      id v24 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "CheckCarrierProfile: Error getting data SIM: %{public}@",  buf,  0xCu);
    }

    ((void (**)(void, void, void, void, void, id))v9)[2](v9, 0LL, 0LL, 0LL, 0LL, v6);
  }

  else if (v5)
  {
    uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 120LL);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10000B0F0;
    v17[3] = &unk_1000C2FE8;
    char v14 = v8;
    uint64_t v15 = *(void *)(a1 + 32);
    id v19 = v14;
    v17[4] = v15;
    id v18 = v5;
    [v13 getSIMStatus:v18 completion:v17];
  }

  else
  {
    id v16 = _MCLogObjects[2];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "CheckCarrierProfile: No SIM is marked as data SIM.",  buf,  2u);
    }

    v9[2](v9, 1LL, 0LL, 0LL, 0LL, 0LL);
  }
}

void sub_10000AF70(uint64_t a1, char a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workerQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000B0A0;
  block[3] = &unk_1000C2F98;
  char v27 = a2;
  id v16 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  char v28 = *(_BYTE *)(a1 + 48);
  id v25 = v14;
  id v26 = v16;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v11;
  dispatch_async(v15, block);
}

uint64_t sub_10000B0A0(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 80)) {
    [*(id *)(a1 + 32) _workerQueueCheckCarrierProfileForCarrierIdentifier:*(void *)(a1 + 40) name:*(void *)(a1 + 48) atPath:*(void *)(a1 + 56) forceReinstallation:*(unsigned __int8 *)(a1 + 81)];
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 64));
  }
  return result;
}

void sub_10000B0F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_log_t v7 = _MCLogObjects[2];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 MCVerboseDescription]);
    *(_DWORD *)buf = 138543618;
    id v20 = v5;
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "CheckCarrierProfile: getSIMStatus status:%{public}@ error:%{public}@)",  buf,  0x16u);
  }

  if (v6)
  {
    os_log_t v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
  }

  else
  {
    if (![v5 isEqualToString:kCTSIMSupportSIMStatusNotInserted])
    {
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = *(void **)(*(void *)(a1 + 32) + 120LL);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10000B2B8;
      v16[3] = &unk_1000C2FE8;
      id v13 = *(id *)(a1 + 48);
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void **)(a1 + 40);
      id v18 = v13;
      v16[4] = v14;
      id v17 = v15;
      [v12 copyCarrierBundleLocation:v11 completion:v16];

      goto LABEL_8;
    }

    os_log_t v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
  }

  v10();
LABEL_8:
}

void sub_10000B2B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    os_log_t v7 = _MCLogObjects[2];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = v7;
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 MCVerboseDescription]);
      int v16 = 138543362;
      id v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "CheckCarrierProfile: Could not find carrier bundle path. Error: %{public}@",  (uint8_t *)&v16,  0xCu);
    }

    os_log_t v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
LABEL_5:
    v10();
    goto LABEL_10;
  }

  if (!v5)
  {
    uint64_t v15 = _MCLogObjects[2];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "CheckCarrierProfile: Could not find carrier bundle path.",  (uint8_t *)&v16,  2u);
    }

    os_log_t v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
    goto LABEL_5;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _carrierIdentifierFromContext:*(void *)(a1 + 40)]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _carrierNameFromContext:*(void *)(a1 + 40)]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"profile.mobileconfig"]);
  uint64_t v14 = _MCLogObjects[2];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "CheckCarrierProfile: Evaluating carrier profile at: %{public}@",  (uint8_t *)&v16,  0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();

LABEL_10:
}

LABEL_8:
    os_log_t v10 = 0LL;
    goto LABEL_9;
  }

  os_log_t v10 = v7;
LABEL_9:

  return v10;
}

  return v14;
}
}

void sub_10000B9A8(uint64_t a1)
{
  if (mach_timebase_info((mach_timebase_info_t)&dword_1000DC018))
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v2 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"MCProfileServiceServer.m" lineNumber:1898 description:@"mach_timebase_info not available"];
  }

  else
  {
    qword_1000DC020 = (1000000000 * dword_1000DC01C);
  }

  byte_1000DC028 = 1;
}

void sub_10000BA34(id a1, NSError *a2)
{
  uint64_t v2 = (os_log_s *)_MCLogObjects[0];
  if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "CheckCarrierProfile: Device was unlocked, check complete.",  v3,  2u);
  }

uint64_t sub_10000BC58(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0LL);
  }
  return result;
}

uint64_t sub_10000BD64(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0LL);
  }
  return result;
}

id sub_10000BDFC(uint64_t a1)
{
  return [*(id *)(a1 + 32) workerQueueReadBiometricState];
}

void sub_10000BE14(id a1)
{
  id v1 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Rereading grace period", v3, 2u);
  }

  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](&OBJC_CLASS___MCServerSideHacks, "sharedHacks"));
  [v2 applyGracePeriodSettingFromKeybagToUserSettings];
}

void sub_10000BEEC(uint64_t a1)
{
  uint64_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Provisioning profiles changed", v8, 2u);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v4, &stru_1000C3098);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workerQueueBackgroundActivityManager]);
  [v5 rescheduleProfileJanitorJob];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workerQueueBackgroundActivityManager]);
  os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 30.0));
  [v6 rescheduleManagedAppValidationJob:v7];
}

void sub_10000BFCC(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[MCProvisioningProfileJanitor sharedJanitor](&OBJC_CLASS___MCProvisioningProfileJanitor, "sharedJanitor"));
  [v1 updateMISTrust];
}

id sub_10000C1A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) workerQueueNotifyUserLoggedIn];
}

id sub_10000C280(uint64_t a1)
{
  return [*(id *)(a1 + 32) workerQueueNotifyMementoEffaced];
}

void sub_10000C30C(uint64_t a1)
{
  uint64_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Applications finished installing", buf, 2u);
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MDMManagedMediaReader attributesByAppID](&OBJC_CLASS___MDMManagedMediaReader, "attributesByAppID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);

  if ([v4 count])
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v5 = *(id *)(a1 + 32);
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)i),  "bundleIdentifier",  (void)v13));
          unsigned __int8 v11 = [v4 containsObject:v10];

          if ((v11 & 1) != 0)
          {

            id v12 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Managed applications finished installing",  buf,  2u);
            }

            id v5 = (id)objc_claimAutoreleasedReturnValue( +[MCProvisioningProfileJanitor sharedJanitor]( &OBJC_CLASS___MCProvisioningProfileJanitor,  "sharedJanitor"));
            [v5 updateMISTrust];
            goto LABEL_16;
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

LABEL_16:
  }
}

  MCSendActivationRecordStoredNotification();
  v6[2](v6, 0LL);
}

  return v10;
}
}

  if (!v10)
  {
    v45 = 1;
    goto LABEL_23;
  }

    id v24 = 0;
    goto LABEL_17;
  }

  id v17 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Beginning installation of MCDeclarationsPayload.",  buf,  2u);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v18 declarations]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[RMProfileStore profileStoreForOwner:]( &OBJC_CLASS___RMProfileStore,  "profileStoreForOwner:",  @"MC.DeclarationsInProfile"));
  id v20 = (void *)objc_opt_new(&OBJC_CLASS___RMSynchronous);
  *(void *)buf = 0LL;
  v38 = buf;
  v39 = 0x3032000000LL;
  v40 = sub_10003C944;
  v41 = sub_10003C954;
  v42 = 0LL;
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10003C95C;
  v34[3] = &unk_1000C32C0;
  v36 = buf;
  id v22 = v20;
  v35 = v22;
  [v19 installProfile:v21 declarations:v33 completionHandler:v34];

  [v22 waitForCompletion];
  id v23 = *((void *)v38 + 5);
  id v24 = v23 == 0;
  id v25 = _MCLogObjects[0];
  id v26 = v25;
  if (v23)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      char v27 = (void *)objc_claimAutoreleasedReturnValue([v18 friendlyName]);
      char v28 = *((void *)v38 + 5);
      *(_DWORD *)v43 = 138543618;
      v44 = v27;
      v45 = 2114;
      v46 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Failed to install declarations profile %{public}@: %{public}@",  v43,  0x16u);
    }

    if (a6) {
      *a6 = *((id *)v38 + 5);
    }
  }

  else
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue([v18 friendlyName]);
      *(_DWORD *)v43 = 138543362;
      v44 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Successfully installed declarations profile %{public}@",  v43,  0xCu);
    }
  }

  _Block_object_dispose(buf, 8);
LABEL_17:

  return v24;
}
  }

  return v6;
}

void sub_10000C5FC(void *a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000826BC();
  }
  uint64_t v2 = MCHCUSetHostCertificateDataForMappedLabel(a1[4], a1[5]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  uint64_t v5 = a1[5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 MCHexString]);
  [v4 addDependent:v5 ofParent:v6 inDomain:kMCDMCertificateToHostIdentifierDependencyKey reciprocalDomain:kMCDMHostIdentifierToCertificateDependencyKey];

  [v4 commitChanges];
  (*(void (**)(void))(a1[7] + 16LL))();
}

void sub_10000C8E0(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_10008273C();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = MISProfileCreateWithData(kCFAllocatorDefault, v2);
    if (v3)
    {
      id v4 = (const void *)v3;
      if ([*(id *)(a1 + 48) length])
      {
        if (MISProvisioningProfileIsForLocalProvisioning(v4))
        {
          uint64_t v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _localProvisioningProfileError]);
          goto LABEL_7;
        }

        uint64_t UUID = MISProvisioningProfileGetUUID(v4);
        if (!UUID)
        {
LABEL_6:
          uint64_t v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _badProvisioningProfileError]);
LABEL_7:
          id v6 = (void *)v5;
LABEL_8:
          CFRelease(v4);
          goto LABEL_10;
        }

        uint64_t v11 = UUID;
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
        uint64_t v13 = kMCDMManagingProfileToProvisioningProfileKey;
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( [v12 dependentsOfParent:*(void *)(a1 + 48) inDomain:kMCDMManagingProfileToProvisioningProfileKey]);
        if (([v14 containsObject:v11] & 1) == 0)
        {
          [v12 addDependent:v11 ofParent:*(void *)(a1 + 48) inDomain:v13 reciprocalDomain:kMCDMProvisioningProfileToManagingProfileKey];
          [v12 commitChanges];
        }
      }

      uint64_t v15 = MISInstallProvisioningProfile(v4);
      if ((_DWORD)v15)
      {
        uint64_t v16 = MCProvisioningProfileErrorDomain;
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v15));
        uint64_t v18 = MCErrorArray(@"PROVISIONING_ERROR_CANNOT_INSTALL_P_CODE");
        id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v16,  25001LL,  v19,  MCErrorTypeFatal,  v17,  0LL));
      }

      else
      {
        id v6 = 0LL;
      }

      goto LABEL_8;
    }
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _badProvisioningProfileError]);
LABEL_10:
  id v7 = *(void **)(a1 + 64);
  if (v7)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000CB54;
    block[3] = &unk_1000C2E08;
    id v23 = v7;
    id v21 = v6;
    id v22 = *(id *)(a1 + 56);
    dispatch_async(v9, block);
  }
}

uint64_t sub_10000CB54(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  *(void *)(a1 + 32));
}

void sub_10000CC8C(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000827BC();
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 removeProvisioningProfileUUID:*(void *)(a1 + 32) sender:*(void *)(a1 + 40)]);

  if (v3)
  {
    uint64_t v4 = MCProvisioningProfileErrorDomain;
    uint64_t v5 = MCErrorArray(@"PROVISIONING_ERROR_CANNOT_REMOVE_P_CODE");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v4,  25002LL,  v6,  MCErrorTypeFatal,  v3,  0LL));
LABEL_7:

    goto LABEL_8;
  }

  if (*(void *)(a1 + 48))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
    [v6 removeDependent:*(void *)(a1 + 32) fromParent:*(void *)(a1 + 48) inDomain:kMCDMManagingProfileToProvisioningProfileKey reciprocalDomain:kMCDMProvisioningProfileToManagingProfileKey];
    [v6 commitChanges];
    id v7 = 0LL;
    goto LABEL_7;
  }

  id v7 = 0LL;
LABEL_8:
  uint64_t v8 = *(void **)(a1 + 64);
  if (v8)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    os_log_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000CE58;
    block[3] = &unk_1000C2E08;
    id v14 = v8;
    id v12 = v7;
    id v13 = *(id *)(a1 + 56);
    dispatch_async(v10, block);
  }
}

uint64_t sub_10000CE58(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  *(void *)(a1 + 32) != 0LL);
}

void sub_10000CF78(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_10008283C();
  }
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10000D408;
  v39[3] = &unk_1000C30E8;
  id v41 = *(id *)(a1 + 56);
  id v40 = *(id *)(a1 + 32);
  uint64_t v2 = objc_retainBlock(v39);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[MDMProvisioningProfileTrust signerIdentitiesFromProvisioningProfileUUID:]( &OBJC_CLASS___MDMProvisioningProfileTrust,  "signerIdentitiesFromProvisioningProfileUUID:",  *(void *)(a1 + 40)));
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
    uint64_t v6 = MCFeatureTrustedCodeSigningIdentities;
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 effectiveUnionValuesForSetting:MCFeatureTrustedCodeSigningIdentities]);
    uint64_t v8 = (void *)v7;
    id v9 = &__NSArray0__struct;
    if (v7) {
      id v9 = (void *)v7;
    }
    id v10 = v9;

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v10));
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v12 = v4;
    id v13 = [v12 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v30 = v6;
      id v31 = v10;
      int v15 = 0;
      uint64_t v16 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
          if (([v11 containsObject:v18] & 1) == 0)
          {
            [v11 addObject:v18];
            ++v15;
          }
        }

        id v14 = [v12 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }

      while (v14);

      id v10 = v31;
      if (v15 > 0)
      {
        id v19 = _MCLogObjects[2];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 67240450;
          *(_DWORD *)v43 = v15;
          *(_WORD *)&v43[4] = 2114;
          *(void *)&v43[6] = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Trusting %{public}d new code signing identities for provisioning profile UUID: %{public}@",  buf,  0x12u);
        }

        id v21 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v11 allObjects]);
        [v21 setUnionValues:v22 forSetting:v30 sender:*(void *)(a1 + 48)];

        id v23 = (void *)objc_claimAutoreleasedReturnValue( +[MCProvisioningProfileJanitor sharedJanitor]( &OBJC_CLASS___MCProvisioningProfileJanitor,  "sharedJanitor"));
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_10000D4F4;
        v32[3] = &unk_1000C3110;
        v34 = v2;
        id v33 = *(id *)(a1 + 32);
        [v23 updateMISTrustAndValidateApps:0 validateManagedApps:0 completion:v32];

        goto LABEL_27;
      }
    }

    else
    {
    }

    char v28 = _MCLogObjects[2];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      *(void *)v43 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "No new code signing identities for provisioning profile UUID: %{public}@",  buf,  0xCu);
    }

    ((void (*)(void *, uint64_t, void))v2[2])(v2, 1LL, 0LL);
  }

  else
  {
    id v24 = _MCLogObjects[2];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      *(void *)v43 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "MCProfileServiceServer missing code signing identities for provisioning profile UUID: %{public}@",  buf,  0xCu);
    }

    uint64_t v26 = MCProvisioningProfileErrorDomain;
    uint64_t v27 = MCErrorArray(@"PROVISIONING_ERROR_NO_SIGNING_IDENTITIES");
    id v10 = (id)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v26,  25005LL,  v10,  MCErrorTypeFatal,  0LL));
    ((void (*)(void *, void, void *))v2[2])(v2, 0LL, v11);
  }

LABEL_27:
}

    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v43,  v44,  v41,  v42,  0LL));

    goto LABEL_28;
  }

  id v19 = 0LL;
  id v10 = v18;
  uint64_t v20 = (void *)v88;
LABEL_29:

LABEL_30:
  if (!v10)
  {
    [v7 setEnrollmentIdentityPersistentID:self->_persistentID];
    [v19 setOTAProfile:v7];
    v60 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v61 = v60;
      v62 = (__CFString *)objc_claimAutoreleasedReturnValue([v19 identifier]);
      *(_DWORD *)buf = 138543362;
      v95 = v62;
      _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "Received final profile: %{public}@",  buf,  0xCu);
    }

    id v19 = v19;
    id v10 = 0LL;
    v59 = v19;
    goto LABEL_42;
  }

  if (!v12)
  {
    uint64_t v25 = a5;
    if (!a5) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }

  v53 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
  uint64_t v26 = [v53 mutableCopy];

  v54 = (void *)objc_claimAutoreleasedReturnValue([v12 absoluteString]);
  [v26 setObject:v54 forKey:MCErrorPermanentlyRedirectedURLString];

  id v24 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
  v55 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v24,  [v10 code],  v26));

  id v10 = (id)v55;
  uint64_t v25 = a5;
LABEL_33:

  if (v25) {
LABEL_34:
  }
    *uint64_t v25 = [v10 MCCopyAsPrimaryError];
LABEL_35:
  v56 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v57 = v56;
    v58 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 MCVerboseDescription]);
    *(_DWORD *)buf = 138543362;
    v95 = v58;
    _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_ERROR,  "Failure occurred while retrieving profile during OTA Profile Enrollment: %{public}@",  buf,  0xCu);
  }

  if (!v11)
  {
    v59 = 0LL;
    goto LABEL_44;
  }

  [v11 remove];
  v59 = 0LL;
LABEL_42:

LABEL_44:
  return v59;
}

            uint64_t v16 = v65;
            a6 = v66;
            id v17 = v73;
            uint64_t v27 = v68;
          }

          if ([v14 isEqualToString:MCFindMyBundleIdentifier]
            && +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedBoolForFeature:withRestrictionsDictionary:",  MCFeatureFindMyDeviceAllowed,  v12) == 2 && +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedBoolForFeature:withRestrictionsDictionary:",  MCFeatureFindMyFriendsAllowed,  v12) == 2)
          {
            v69 = v27;
            v49 = MCRestrictionsErrorDomain;
            v50 = MCErrorArray(@"RESTRICTION_ERROR_RESTRICTION_CONFLICTS_WITH_APPLOCK");
            v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
            v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v49,  3004LL,  v51,  MCErrorTypeFatal,  v14,  0LL));
            v67 = [v52 MCCopyAsPrimaryError];

            uint64_t v27 = v69;
            id v17 = v73;
            uint64_t v25 = v67;
          }
        }

        uint64_t v8 = v71;
      }
    }
  }

  else
  {
    uint64_t v25 = 0LL;
  }

LABEL_36:
  if (v25)
  {
    v53 = MCInstallationErrorDomain;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v55 = (void *)objc_claimAutoreleasedReturnValue([v54 friendlyName]);
    v56 = MCErrorArray(@"ERROR_PAYLOAD_FAILED_P_ID");
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v53,  4001LL,  v57,  v25,  MCErrorTypeFatal,  v55,  0LL));

    if (a6) {
      *a6 = v58;
    }
    v59 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v60 = v59;
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v62 = (void *)objc_claimAutoreleasedReturnValue([v61 friendlyName]);
      v63 = (void *)objc_claimAutoreleasedReturnValue([v58 MCVerboseDescription]);
      *(_DWORD *)buf = 138543618;
      v79 = v62;
      v80 = 2114;
      v81 = v63;
      _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_ERROR,  "Cannot install restrictions payload “%{public}@”. Error: %{public}@",  buf,  0x16u);
    }
  }

  return v25 == 0LL;
}

void sub_10000D408(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000D4DC;
    v9[3] = &unk_1000C30C0;
    id v12 = v6;
    char v13 = a2;
    id v10 = v5;
    id v11 = *(id *)(a1 + 32);
    dispatch_async(v8, v9);
  }
}

uint64_t sub_10000D4DC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 32));
}

uint64_t sub_10000D4F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

id sub_10000D6D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) workerQueueRemoveExpiredProfiles];
}

id sub_10000D78C(uint64_t a1)
{
  return [*(id *)(a1 + 32) workerQueueRevalidateManagedApps];
}

uint64_t sub_10000D830(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_15:
  if (v7) {
LABEL_16:
  }
    v7[2](v7, v12);
LABEL_17:
}

        uint64_t v6 = 0LL;
        goto LABEL_16;
      }
    }

    else
    {
      id v14 = MCCertificateErrorDomain;
      int v15 = (void *)objc_claimAutoreleasedReturnValue([v8 friendlyName]);
      uint64_t v16 = MCErrorArray(@"ERROR_CERTIFICATE_NOT_IDENTITY_P_NAME");
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      char v13 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v14,  9006LL,  v17,  MCErrorTypeFatal,  v15,  0LL));

      if (!v13) {
        goto LABEL_13;
      }
    }

    if (a4) {
      *a4 = v13;
    }
    uint64_t v18 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      id v19 = v18;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v13 MCVerboseDescription]);
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Cannot copy identity: %{public}@", buf, 0xCu);
    }

    goto LABEL_15;
  }

  CFRetain(identity);
  return self->_identity;
}

      id v9 = (char *)v9 + 1;
    }

    while (v6 != v9);
    id v19 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    uint64_t v6 = v19;
  }

  while (v19);
LABEL_22:

  return v7 & 1;
}
}

      id v5 = v25;
    }

    else
    {
      id v11 = 0LL;
      uint64_t v6 = 1;
    }
  }
}

    v34 = EAPOLClientItemIDCreateWithProfile(v24);
    if (!v34)
    {
      v39 = _MCLogObjects[0];
      id v17 = v62;
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        id v40 = v39;
        id v41 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543362;
        v64 = v41;
        v42 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "%{public}@ EAPOLClientItemIDCreateWithProfile() returned NULL",  buf,  0xCu);
      }

      char v28 = 0;
      goto LABEL_48;
    }

    __int128 v35 = (const void *)v34;
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v20 displayName]);

    if (v36)
    {
      __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v20 displayName]);
      EAPOLClientProfileSetUserDefinedName(v24, v37);
    }

    EAPOLClientProfileSetAuthenticationProperties(v24, v62);
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewWiFiPayloadHandler profileMetadata](self, "profileMetadata"));
    if (v38
      && !EAPOLClientProfileSetInformation(v24, @"com.apple.managedconfiguration.profiled.eap", v38))
    {
      v47 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v48 = v47;
        v49 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543362;
        v64 = v49;
        v50 = v49;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%{public}@ EAPOLClientProfileSetInformation() failed",  buf,  0xCu);
      }

      goto LABEL_46;
    }

    if (v13)
    {
      EAPOLClientProfileSetWLANDomain(v24, v15);
      if (!v18) {
        goto LABEL_29;
      }
    }

    else
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue([v15 dataUsingEncoding:4]);
      EAPOLClientProfileSetWLANSSIDAndSecurityType(v24, v43, v61);

      if (!v18) {
        goto LABEL_29;
      }
    }

    if (v19 && !EAPOLClientItemIDSetPasswordItem(v35, 3LL, v18, v19))
    {
      v58 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v52 = v58;
        v59 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543362;
        v64 = v59;
        v54 = v59;
        v55 = "%{public}@ EAPOLClientItemIDSetPasswordItem() failed";
        goto LABEL_45;
      }

      goto LABEL_46;
    }

  return v18 == 0LL;
}

  -[NEProfileIngestionDelegate unlockConfigurations](self->_neProfileIngestionHandler, "unlockConfigurations");
  if (!v16)
  {
LABEL_36:
    v34 = 1;
    goto LABEL_37;
  }

  v85 = v8;
LABEL_17:
  v86 = v25;
  uint64_t v26 = v10;
  if (a6) {
    *a6 = v16;
  }
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  uint64_t v27 = v89;
  char v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v94,  v103,  16LL);
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v95;
    do
    {
      for (j = 0LL; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v95 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void *)(*((void *)&v94 + 1) + 8LL * (void)j);
        id v33 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
        -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:]( self,  "_releaseDependencyBetweenPersistentID:andUUID:",  v32,  v33);
      }

      uint64_t v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v94,  v103,  16LL);
    }

    while (v29);
  }

  v34 = 0;
  id v10 = v26;
  uint64_t v8 = v85;
  uint64_t v25 = v86;
LABEL_37:

  return v34;
}

uint64_t sub_10000DD6C(uint64_t a1)
{
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_1000828BC();
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v2 resetAllSettingsToDefaultsSender:*(void *)(a1 + 32)];

  if (*(_BYTE *)(a1 + 56))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](&OBJC_CLASS___MCServerSideHacks, "sharedHacks"));
    [v3 resetSettingsSender:*(void *)(a1 + 32)];
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t sub_10000DE84(uint64_t a1)
{
  uint64_t v2 = _MCLogObjects[2];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Rereading managed app attributes.", v5, 2u);
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](&OBJC_CLASS___MCServerSideHacks, "sharedHacks"));
  [v3 recomputeAppRulesForNetworkExtension];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10000E38C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

LABEL_25:
  if (v3) {
    v3[2](v3, v16);
  }
}

              id v31 = (void *)objc_claimAutoreleasedReturnValue([v20 UUID]);
              +[MCKeychain setString:forService:account:label:description:useSystemKeychain:outError:]( MCKeychain,  "setString:forService:account:label:description:useSystemKeychain:outError:",  v22,  @"MCProfileRemovalPasscode",  v31,  0,  0,  [v20 isInstalledForSystem],  0,  context);

              id v14 = v35;
            }

            [v20 writeStubToPath:v18];
          }

          else
          {
            uint64_t v30 = _MCLogObjects[12];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "The original profile cannot be decrypted. Removing the lock on the profile.",  buf,  2u);
            }

            [v20 setLocked:0];
            [v20 writeStubToPath:v18];
          }

          uint64_t v8 = v39;

          id v5 = &MailAccountHostname_ptr;
        }

        objc_autoreleasePoolPop(v8);
      }

      __int128 v38 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }

    while (v38);
  }

  v32 = _MCLogObjects[12];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Completed migrating profile removal passwords.",  buf,  2u);
  }

  objc_autoreleasePoolPop(context);
}

id sub_10000EB10(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMemberQueueHasActivationRecordChangesPending:1];
}

void sub_10000EB1C(uint64_t a1)
{
  uint64_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000EB90;
  block[3] = &unk_1000C29D0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_barrier_async(v2, block);
}

id sub_10000EB90(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMemberQueueHasActivationRecordChangesPending:0];
}

uint64_t sub_10000F254(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_10000F30C(uint64_t a1)
{
  return [*(id *)(a1 + 32) waitForEnrollmentToFinishWithPersonaID:*(void *)(a1 + 40)];
}

LABEL_2:
  v3[2](v3, v5, 0LL);
}

uint64_t sub_10000FBA0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workerQueueBackgroundActivityManager]);
  [v2 _rescheduleBackgroundActivity:*(void *)(a1 + 80) startDate:*(void *)(a1 + 40) gracePeriod:*(void *)(a1 + 48) priority:0 repeatingInterval:*(void *)(a1 + 56)];

  uint64_t result = *(void *)(a1 + 72);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0LL);
  }
  return result;
}

void sub_10000FDD8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

LABEL_31:
  return v29;
}

  objc_autoreleasePoolPop(v3);
}
      }

      id v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v46,  v57,  16LL);
    }

    while (v19);
  }

  id v31 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v32 = v5;
  id v33 = [v32 countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v33)
  {
    v34 = v33;
    __int128 v35 = *(void *)v42;
    do
    {
      for (k = 0LL; k != v34; k = (char *)k + 1)
      {
        if (*(void *)v42 != v35) {
          objc_enumerationMutation(v32);
        }
        __int128 v37 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)k);
      }

      v34 = [v32 countByEnumeratingWithState:&v41 objects:v54 count:16];
    }

    while (v34);
  }

  return v31;
}

  return v3;
}

LABEL_9:
    id v22 = 0LL;
    goto LABEL_10;
  }

  if ((objc_opt_isKindOfClass(v20, a4) & 1) == 0)
  {
    if (a10)
    {
      uint64_t v30 = v16;
      char v28 = MCErrorArray(v19);
      id v24 = (void *)objc_claimAutoreleasedReturnValue(v28);
      uint64_t v25 = MCErrorTypeFatal;
      uint64_t v26 = v17;
      uint64_t v27 = a8;
      goto LABEL_8;
    }

    goto LABEL_9;
  }

  id v22 = v21;
LABEL_10:

  return v22;
}

  return v6;
}

  return v6;
}

  if (v11) {
    v11[2](v11, v13);
  }
LABEL_13:
}

LABEL_10:
      id v21 = 0LL;
      goto LABEL_11;
    }
  }

  if (![v19 length])
  {
    if (a9)
    {
      uint64_t v29 = v15;
      uint64_t v27 = MCErrorArray(v17);
      id v23 = (void *)objc_claimAutoreleasedReturnValue(v27);
      id v24 = MCErrorTypeFatal;
      uint64_t v25 = v16;
      uint64_t v26 = a5;
      goto LABEL_9;
    }

    goto LABEL_10;
  }

  id v21 = v19;
LABEL_11:

  return v21;
}

    id v19 = _MCLogObjects[0];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler cannot retrieve custom network set from system configuration.",  buf,  2u);
    }

    uint64_t v8 = v169;
  }

  uint64_t v20 = _MCLogObjects[0];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler attempting to create a new set for the network...",  buf,  2u);
  }

  if (CFArrayGetCount(v13) < 1) {
    goto LABEL_29;
  }
  id v21 = 0LL;
  while (1)
  {
    id v22 = (const __SCNetworkSet *)CFArrayGetValueAtIndex(v13, v21);
    if (-[__CFString isEqualToString:]( (id)SCNetworkSetGetName(v22),  "isEqualToString:",  @"Automatic")) {
      break;
    }
    if (++v21 >= CFArrayGetCount(v13)) {
      goto LABEL_29;
    }
  }

  char v28 = (const __SCNetworkSet *)CFRetain(v22);
  if (!v28)
  {
LABEL_29:
    uint64_t v29 = _MCLogObjects[0];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "MCNewWiFiPayloadHandler cannot get default set; using current set instead.",
        buf,
        2u);
    }

    char v28 = SCNetworkSetCopyCurrent(v10);
    if (!v28)
    {
      v45 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler cannot copy default set from system configuration.",  buf,  2u);
      }

      uint64_t v26 = 0LL;
      v173 = 0LL;
      v174 = 0LL;
      goto LABEL_62;
    }
  }

  uint64_t v30 = SCNetworkSetCreate(v10);
  v174 = v28;
  if (!v30)
  {
    v46 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler cannot create new set.",  buf,  2u);
    }

    uint64_t v26 = 0LL;
    v173 = 0LL;
LABEL_62:
    v39 = 0LL;
    v47 = 0LL;
LABEL_63:
    v48 = 1;
    v49 = 1;
    goto LABEL_131;
  }

  set = v30;
  SCNetworkSetSetName(v30, name);
  id v31 = SCNetworkSetCopyServices(v28);
  if (!v31)
  {
    v62 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler cannot get default services.",  buf,  2u);
    }

    uint64_t v26 = 0LL;
    v173 = 0LL;
    v39 = 0LL;
    v48 = 1;
    v49 = 1;
    v47 = set;
    goto LABEL_131;
  }

  v32 = v31;
  v169 = v8;
  if (CFArrayGetCount(v31) < 1)
  {
    id v33 = v32;
    v64 = v165;
    v63 = v166;
    goto LABEL_109;
  }

  id v33 = 0LL;
  service = 0LL;
  v34 = 0LL;
  do
  {
    __int128 v35 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v32, v34);
    __int128 v36 = SCNetworkServiceGetInterface(v35);
    if (!v36)
    {
LABEL_40:
      v39 = v35;
      goto LABEL_50;
    }

    __int128 v37 = v36;
    while (1)
    {
      __int128 v38 = SCNetworkInterfaceGetInterfaceType(v37);
      if (CFEqual(v38, kSCNetworkInterfaceTypeIEEE80211)) {
        break;
      }
      __int128 v37 = SCNetworkInterfaceGetInterface(v37);
      if (!v37) {
        goto LABEL_40;
      }
    }

    id v40 = _MCLogObjects[0];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler found WiFi interface.",  buf,  2u);
    }

    if (v33)
    {
      v39 = v35;
      goto LABEL_50;
    }

    id v41 = _MCLogObjects[0];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler creating new service...",  buf,  2u);
    }

    v42 = SCNetworkServiceCreate(v10, v37);
    if (!v42)
    {
      v115 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v115,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler cannot create new service.",  buf,  2u);
      }

      v39 = 0LL;
      goto LABEL_92;
    }

    v39 = v42;
    if (!SCNetworkServiceEstablishDefaultConfiguration(v42))
    {
      v116 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler cannot establish new service.",  buf,  2u);
      }

void sub_100011A14(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = a2;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v6 MCShortenedObject:a3]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) MCShortenedObject:v7]);

  [v5 setObject:v9 forKey:v8];
}

LABEL_20:
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v6);
  }
}

  __int128 v36 = self->_UUIDToPersistentIDMap;
  self->_UUIDToPersistentIDMap = 0LL;

  if (v29)
  {
    __int128 v37 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      __int128 v38 = v37;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
      id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 identifier]);
      *(_DWORD *)buf = 138543362;
      v78 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Rolling back installation of profile “%{public}@”...",  buf,  0xCu);
    }

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    id v41 = v62;
    v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v67,  v82,  16LL);
    if (v42)
    {
      v43 = v42;
      v44 = *(void *)v68;
      do
      {
        for (i = 0LL; i != v43; i = (char *)i + 1)
        {
          if (*(void *)v68 != v44) {
            objc_enumerationMutation(v41);
          }
          [*(id *)(*((void *)&v67 + 1) + 8 * (void)i) remove];
        }

        v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v67,  v82,  16LL);
      }

      while (v43);
    }

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v46 = v61;
    v47 = [v46 countByEnumeratingWithState:&v63 objects:v81 count:16];
    if (v47)
    {
      v48 = v47;
      v49 = *(void *)v64;
      do
      {
        for (j = 0LL; j != v48; j = (char *)j + 1)
        {
          if (*(void *)v64 != v49) {
            objc_enumerationMutation(v46);
          }
          [*(id *)(*((void *)&v63 + 1) + 8 * (void)j) unstageFromInstallationWithInstaller:v10];
        }

        v48 = [v46 countByEnumeratingWithState:&v63 objects:v81 count:16];
      }

      while (v48);
    }

    v51 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v52 = v51;
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
      v54 = (void *)objc_claimAutoreleasedReturnValue([v53 identifier]);
      v55 = (void *)objc_claimAutoreleasedReturnValue([v29 MCVerboseDescription]);
      *(_DWORD *)buf = 138543618;
      v78 = v54;
      v79 = 2114;
      v80 = v55;
      _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_ERROR,  "Installation of profile “%{public}@” failed with error: %{public}@",  buf,  0x16u);
    }

    id v11 = v59;
    if (a6) {
      *a6 = v29;
    }
  }

  return v29 == 0LL;
}

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
      [v34 removeIdentifierFromSystemManifest:v14 flag:3];
      goto LABEL_40;
    }

      CFRelease(v9);
    }

    else
    {
      uint64_t v20 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler WiFiManagerClientCopyNetworks returned nil.",  buf,  2u);
      }
    }

    sub_100052CC0();
  }
}

          CFRelease(v6);
          goto LABEL_21;
        }

        id v21 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
          goto LABEL_20;
        }
        char v13 = v21;
        id v23 = 138543362;
        id v24 = (id)objc_opt_class(self);
        id v14 = v24;
        int v15 = "%{public}@ EAPOLClientProfileGetID() returned NULL";
      }

      else
      {
        uint64_t v20 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
          goto LABEL_20;
        }
        char v13 = v20;
        id v23 = 138543362;
        id v24 = (id)objc_opt_class(self);
        id v14 = v24;
        int v15 = "%{public}@ metadata validation failed";
      }
    }

    else
    {
      id v19 = _MCLogObjects[0];
      if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      char v13 = v19;
      id v23 = 138543362;
      id v24 = (id)objc_opt_class(self);
      id v14 = v24;
      int v15 = "%{public}@ EAPOLClientProfileCreate() returned NULL";
    }

void sub_100013DE0(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v9]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v9]);
  if (v4) {
    BOOL v5 = v3 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v3));
    [v7 intersectSet:v6];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
  }
}

uint64_t sub_100014760(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 count] || objc_msgSend(v4, "count")) {
    uint64_t v5 = (uint64_t)[v3 isEqualToDictionary:v4];
  }
  else {
    uint64_t v5 = 1LL;
  }

  return v5;
}

void sub_100014A2C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100014A54(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    os_log_t v4 = _MCLogObjects[8];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = v4;
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 MCVerboseDescription]);
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Request user input error. Error: %{public}@",  (uint8_t *)&v7,  0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100014B34(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = (id *)(a1 + 7);
  id v10 = a5;
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained(v9);
  [WeakRetained _receivedUserInput:v11 preflight:a3 payloadIndex:a4 delegate:a1[4] semaphore:a1[5] error:v10 outResponses:a1[6]];
}

void sub_100014E70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28, uint64_t a29, uint64_t a30, uint64_t a31, char a32)
{
}

uint64_t sub_100014EAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100014EBC(uint64_t a1)
{
}

void sub_100014EC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    os_log_t v4 = _MCLogObjects[8];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = v4;
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 MCVerboseDescription]);
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Request MAID login error. Error: %{public}@",  (uint8_t *)&v7,  0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100014FA4(uint64_t a1, char a2, id obj, char a4)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), obj);
  id v7 = obj;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = a4;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100015190( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1000151C0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    os_log_t v3 = _MCLogObjects[8];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      os_log_t v4 = v3;
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError MCVerboseDescription](v2, "MCVerboseDescription"));
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Request managed restore error. Error: %{public}@",  (uint8_t *)&v6,  0xCu);
    }
  }
}

void sub_100015294(void *a1, int a2, void *a3, int a4)
{
  id v8 = a3;
  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), a3);
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = a4;
  uint64_t v9 = (os_log_s *)_MCLogObjects[8];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109634;
    v10[1] = a2;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 1024;
    int v14 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Request managed restore finished with success: %d, error: %{public}@, cancelled: %d",  (uint8_t *)v10,  0x18u);
  }
}

void sub_1000155BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_1000155E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    os_log_t v4 = _MCLogObjects[8];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = v4;
      int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 MCVerboseDescription]);
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Finish preflight error. Error: %{public}@",  (uint8_t *)&v7,  0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000156C0(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = (id *)(a1 + 7);
  id v10 = a5;
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained(v9);
  [WeakRetained _receivedUserInput:v11 preflight:a3 payloadIndex:a4 delegate:a1[4] semaphore:a1[5] error:v10 outResponses:a1[6]];
}

void sub_100015950( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_100015974(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    os_log_t v5 = _MCLogObjects[8];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = v5;
      int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 MCVerboseDescription]);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Show user warnings error. Error: %{public}@",  (uint8_t *)&v8,  0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100015A74(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100015C48(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    os_log_t v4 = _MCLogObjects[8];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      os_log_t v5 = v4;
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 MCVerboseDescription]);
      int v7 = 138543362;
      int v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Did finish installation error. Error: %{public}@",  (uint8_t *)&v7,  0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100015D28(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100015DE8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    os_log_t v3 = _MCLogObjects[8];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      os_log_t v4 = v3;
      os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError MCVerboseDescription](v2, "MCVerboseDescription"));
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Did update status error. Error: %{public}@",  (uint8_t *)&v6,  0xCu);
    }
  }
}

void sub_100015F54(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    os_log_t v3 = _MCLogObjects[8];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      os_log_t v4 = v3;
      os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError MCVerboseDescription](v2, "MCVerboseDescription"));
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Did begin installating next profile error. Error: %{public}@",  (uint8_t *)&v6,  0xCu);
    }
  }
}

void sub_10001621C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_100016240(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    os_log_t v4 = _MCLogObjects[8];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      os_log_t v5 = v4;
      int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 MCVerboseDescription]);
      int v7 = 138543362;
      int v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Request current passcode error. Error: %{public}@",  (uint8_t *)&v7,  0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100016320(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000173E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    os_log_t v4 = (os_log_s *)_MCLogObjects[0];
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Watch enrollment failed to install MDM profile: %{public}@",  (uint8_t *)&v5,  0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_1000174B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000174C0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v5 = *(void **)(a1 + 32);
  id v6 = a4;
  [v5 setEnrollmentController:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

LABEL_6:
  return v10;
}

  return v11;
}

uint64_t sub_100017CAC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100018858(uint64_t a1)
{
  dispatch_queue_attr_t v2 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
  id v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v2);
  dispatch_queue_t v3 = dispatch_queue_create("MCBackgroundActivityManager work queue", v6);
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v3;
}

void sub_1000188B8(uint64_t a1)
{
  dispatch_queue_attr_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Profile list changed. Rescheduling profile janitor.",  buf,  2u);
  }

  dispatch_queue_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_opt_new(&OBJC_CLASS___MCProfileJanitor);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileJanitor earliestExpiryDate](v4, "earliestExpiryDate"));
  [v3 _workQueueReschedule:0 startDate:v5 gracePeriod:0 priority:XPC_ACTIVITY_PRIORITY_UTILITY repeatingInterval:0];

  id v6 = objc_opt_new(&OBJC_CLASS___MCProfileEventsManager);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager earlistProfileEventExpiry](v6, "earlistProfileEventExpiry"));

  if (v7) {
    [*(id *)(a1 + 32) _workQueueReschedule:1 startDate:v7 gracePeriod:0 priority:XPC_ACTIVITY_PRIORITY_UTILITY repeatingInterval:0];
  }
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue( @"MCOutputLevel",  kCFPreferencesAnyApplication,  &keyExistsAndHasValidFormat);
  CFIndex v9 = CFPreferencesGetAppIntegerValue(@"MCLogLevel", kCFPreferencesAnyApplication, &v13);
  if (keyExistsAndHasValidFormat && v13 && AppIntegerValue == 7 && v9 == 7)
  {
    id v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Log level is heightened. Checking MDM installation status.",  v12,  2u);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](&OBJC_CLASS___MDMConfiguration, "sharedConfiguration"));
    [v11 refreshDetailsFromDisk];
  }
}

void sub_100018A74(uint64_t a1)
{
  dispatch_queue_attr_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Managed applications changed. Rescheduling managed app validation & MIS trust update",  v7,  2u);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v4, &stru_1000C33E8);

  int v5 = *(void **)(a1 + 32);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 60.0));
  [v5 _workQueueReschedule:3 startDate:v6 gracePeriod:0 priority:0 repeatingInterval:0];
}

void sub_100018B40(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[MCProvisioningProfileJanitor sharedJanitor](&OBJC_CLASS___MCProvisioningProfileJanitor, "sharedJanitor"));
  [v1 updateMISTrust];
}

id sub_100018B74(uint64_t a1)
{
  dispatch_queue_attr_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Passcode changed. Rescheduling passcode and recovery passcode expiry checks",  v4,  2u);
  }

  [*(id *)(a1 + 32) _workQueueReschedulePasscodeExpiryJob];
  return [*(id *)(a1 + 32) _workQueueRescheduleRecoveryPasscodeExpiryJob];
}

id sub_100018BEC(uint64_t a1)
{
  dispatch_queue_attr_t v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Passcode policy changed. Rescheduling passcode expiry check",  v4,  2u);
  }

  return [*(id *)(a1 + 32) _workQueueReschedulePasscodeExpiryJob];
}

id sub_100018C5C(uint64_t a1)
{
  dispatch_queue_attr_t v2 = *(void **)(a1 + 32);
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 300.0));
  [v2 _workQueueReschedule:3 startDate:v3 gracePeriod:0 priority:0 repeatingInterval:0];

  uint64_t v4 = *(void **)(a1 + 32);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _nextRegularDate]);
  [v4 _workQueueReschedule:4 startDate:v5 gracePeriod:0 priority:0 repeatingInterval:0];

  id v6 = *(void **)(a1 + 32);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _nextRegularDate]);
  [v6 _workQueueReschedule:7 startDate:v7 gracePeriod:0 priority:0 repeatingInterval:0];

  [*(id *)(a1 + 32) _workQueueReschedulePasscodeExpiryJob];
  return [*(id *)(a1 + 32) _workQueueRescheduleRecoveryPasscodeExpiryJob];
}

void sub_100019558(_Unwind_Exception *a1)
{
}

void sub_10001957C(uint64_t a1, void *a2)
{
  dispatch_queue_t v3 = a2;
  if (xpc_activity_should_defer(v3))
  {
    BOOL v4 = xpc_activity_set_state(v3, 3LL);

    int v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      id v6 = *(void **)(a1 + 64);
      int v23 = 136315394;
      id v24 = v6;
      __int16 v25 = 1024;
      BOOL v26 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Background activity fired but deferred. name %s result %i",  (uint8_t *)&v23,  0x12u);
    }
  }

  else
  {
    xpc_activity_state_t state = xpc_activity_get_state(v3);

    if (state == 2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      CFIndex v9 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        id v10 = *(void **)(a1 + 32);
        int v23 = 138543618;
        id v24 = v10;
        __int16 v25 = 1024;
        BOOL v26 = WeakRetained == 0LL;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Performing %{public}@ (Nil self? %d)…",  (uint8_t *)&v23,  0x12u);
      }

      switch(*(void *)(a1 + 72))
      {
        case 0LL:
          id v11 = (MCProfileEventsManager *)objc_claimAutoreleasedReturnValue([WeakRetained server]);
          -[MCProfileEventsManager removeExpiredProfiles](v11, "removeExpiredProfiles");
          goto LABEL_26;
        case 1LL:
          id v11 = objc_opt_new(&OBJC_CLASS___MCProfileEventsManager);
          -[MCProfileEventsManager removeExpiredProfileEvents](v11, "removeExpiredProfileEvents");
          goto LABEL_26;
        case 2LL:
          +[MCCrypto clearStoredActivationLockBypassCode](&OBJC_CLASS___MCCrypto, "clearStoredActivationLockBypassCode");
          break;
        case 3LL:
          id v11 = (MCProfileEventsManager *)objc_claimAutoreleasedReturnValue([WeakRetained server]);
          -[MCProfileEventsManager revalidateManagedApps](v11, "revalidateManagedApps");
          goto LABEL_26;
        case 4LL:
          sub_100038A48();
          if (*(void *)(a1 + 40)) {
            break;
          }
          id v12 = *(void **)(a1 + 48);
          Boolean v13 = (void *)objc_claimAutoreleasedReturnValue([v12 _nextRegularDate]);
          uint64_t v14 = *(void *)(a1 + 80);
          uint64_t v15 = v12;
          uint64_t v16 = 4LL;
          goto LABEL_23;
        case 5LL:
          id v11 = (MCProfileEventsManager *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
          -[MCProfileEventsManager clearAllPasscodeComplianceCaches](v11, "clearAllPasscodeComplianceCaches");
          LOBYTE(v23) = 0;
          if (!-[MCProfileEventsManager recomputeNagMetadata:](v11, "recomputeNagMetadata:", &v23)
            || (_BYTE)v23)
          {
            [WeakRetained reschedulePasscodeExpiryJob];
          }

          goto LABEL_26;
        case 6LL:
          id v17 = (void *)objc_claimAutoreleasedReturnValue( +[MCPasscodeManagerWriter sharedManager]( &OBJC_CLASS___MCPasscodeManagerWriter,  "sharedManager"));
          id v11 = (MCProfileEventsManager *)objc_claimAutoreleasedReturnValue([v17 clearRecoveryPasscode]);

          if (v11)
          {
            os_log_t v18 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              id v19 = v18;
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager MCVerboseDescription](v11, "MCVerboseDescription"));
              int v23 = 138543362;
              id v24 = v20;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Unable to clear recovery passcode. Error: %{public}@",  (uint8_t *)&v23,  0xCu);
            }

            [WeakRetained rescheduleRecoveryPasscodeExpiryJob];
          }

          else
          {
            +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:]( &OBJC_CLASS___MCPasscodeAnalytics,  "sendRecoveryPasscodeClearedEventWithReason:",  3LL);
          }

          goto LABEL_26;
        case 7LL:
          id v21 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
          [v21 removeOrphanedClientRestrictions];

          if (*(void *)(a1 + 40)) {
            break;
          }
          id v22 = *(void **)(a1 + 48);
          Boolean v13 = (void *)objc_claimAutoreleasedReturnValue([v22 _nextRegularDate]);
          uint64_t v14 = *(void *)(a1 + 80);
          uint64_t v15 = v22;
          uint64_t v16 = 7LL;
LABEL_23:
          [v15 _rescheduleBackgroundActivity:v16 startDate:v13 gracePeriod:0 priority:v14 repeatingInterval:0];

          break;
        case 8LL:
          id v11 = (MCProfileEventsManager *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
          -[MCProfileEventsManager recomputeNagMetadata](v11, "recomputeNagMetadata");
LABEL_26:

          break;
        default:
          break;
      }
    }
  }

id sub_100019AE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _workQueueReschedulePasscodeExpiryJob];
}

id sub_100019BD4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _workQueueRescheduleRecoveryPasscodeExpiryJob];
}

void sub_100019E08(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  XPC_ACTIVITY_INTERVAL_1_MIN));
  [v1 _workQueueReschedule:8 startDate:v3 gracePeriod:v2 priority:XPC_ACTIVITY_PRIORITY_UTILITY repeatingInterval:0];
}

id sub_100019F68(uint64_t a1)
{
  return [*(id *)(a1 + 32) _workQueueReschedule:*(void *)(a1 + 64) startDate:*(void *)(a1 + 40) gracePeriod:*(void *)(a1 + 48) priority:*(void *)(a1 + 72) repeatingInterval:*(void *)(a1 + 56)];
}

void sub_10001B258(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2 == 2)
  {
    id v8 = v5;
    [*(id *)(a1 + 40) _showPromptForHomePodAndWatchWithCompletionBlock:*(void *)(a1 + 32)];
    goto LABEL_8;
  }

  if (a2 == 1)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      id v8 = v5;
      (*(void (**)(uint64_t, id))(v6 + 16))( v6,  +[MCProfile thisDeviceType](&OBJC_CLASS___MCProfile, "thisDeviceType"));
LABEL_8:
      id v5 = v8;
    }
  }

  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      id v8 = v5;
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 99LL);
      goto LABEL_8;
    }
  }
}

uint64_t sub_10001B43C(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v3 = 99LL;
    if (a2 == 2) {
      uint64_t v3 = 2LL;
    }
    if (a2 == 1) {
      uint64_t v4 = 3LL;
    }
    else {
      uint64_t v4 = v3;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  }

  return result;
}

void sub_10001B5BC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v9 = v5;
  if (a2 == 2)
  {
    uint64_t v7 = 3LL;
  }

  else if (a2 == 1)
  {
    id v6 = +[MCProfile thisDeviceType](&OBJC_CLASS___MCProfile, "thisDeviceType", v5);
    id v5 = v9;
    uint64_t v7 = (uint64_t)v6;
  }

  else
  {
    uint64_t v7 = 99LL;
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, v7, v5);
    id v5 = v9;
  }
}

void sub_10001B788(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v9 = v5;
  if (a2 == 2)
  {
    uint64_t v7 = 2LL;
  }

  else if (a2 == 1)
  {
    id v6 = +[MCProfile thisDeviceType](&OBJC_CLASS___MCProfile, "thisDeviceType", v5);
    id v5 = v9;
    uint64_t v7 = (uint64_t)v6;
  }

  else
  {
    uint64_t v7 = 99LL;
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, v7, v5);
    id v5 = v9;
  }
}

LABEL_11:
  return v6;
}

    os_log_t v18 = v14;
    uint64_t v29 = 0LL;
LABEL_12:

    goto LABEL_13;
  }

  os_log_t v18 = 0LL;
LABEL_13:

  return v18;
}

  return v5;
}
}

      CFRelease(v5);
    }

    os_log_t v18 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    sub_100052CC0();
  }
}

  if (-[MCNewGlobalHTTPProxyPayloadHandler _install](self, "_install"))
  {

    id v22 = 0LL;
    int v23 = 1;
  }

  else
  {
    id v24 = MCGlobalHTTPProxyErrorDomain;
    __int16 v25 = MCErrorArray(@"GLOBAL_HTTP_PROXY_ERROR_CANNOT_APPLY");
    BOOL v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v24,  31001LL,  v26,  MCErrorTypeFatal,  0LL));

    int v23 = v22 == 0LL;
    if (a6 && v22)
    {
      id v22 = v22;
      int v23 = 0;
      *a6 = v22;
    }
  }

  return v23;
}

  return (char)v11;
}

uint64_t sub_1000202E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v26 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v25 + 1) + 8 * v8);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
      unsigned __int8 v12 = [v10 isEqual:v11];

      if ((v12 & 1) != 0) {
        goto LABEL_18;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v13 = (uint64_t)[v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v22;
LABEL_11:
    uint64_t v15 = 0LL;
    while (1)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(v4);
      }
      uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier", (void)v21));
      os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
      unsigned __int8 v19 = [v17 isEqual:v18];

      if ((v19 & 1) != 0) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = (uint64_t)[v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v13) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }

LABEL_18:
    uint64_t v13 = 1LL;
  }
    }

    v34 = [v6 countByEnumeratingWithState:&v39 objects:v45 count:16];
  }

  while (v34);

  self = v32;
  if (!v7) {
    goto LABEL_23;
  }
LABEL_26:
  uint64_t v30 = _MCLogObjects[9];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "MCInstaller finished checking for MDM installation",  buf,  2u);
  }

  return v7;
}

  if (v51)
  {
    id v40 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueuePasscodeCompliesWithProfileRestrictions]);

    if (v40)
    {
      id v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueCombinedSystemProfileRestrictions]);
      if (+[MCPasscodeManagerWriter didPasscodePolicyChangeWithOldRestrictions:newRestrictions:]( &OBJC_CLASS___MCPasscodeManagerWriter,  "didPasscodePolicyChangeWithOldRestrictions:newRestrictions:",  v52,  v41))
      {
        [*(id *)(a1 + 32) memberQueueClearProfileRestrictionPasscodeComplianceCache];
      }
    }
  }

  v42 = *(_BYTE **)(a1 + 88);
  if (v42) {
    *v42 = v54;
  }
  v43 = *(_BYTE **)(a1 + 96);
  if (v43) {
    *v43 = v23;
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;

  id v5 = v52;
LABEL_28:
  v44 = *(void *)(*(void *)(a1 + 72) + 8LL);
  v45 = *(void **)(v44 + 40);
  *(void *)(v44 + 40) = v13;
}

  __int128 v22 = error;

  return v22;
}

    uint64_t v13 = 1LL;
  }

LABEL_19:
  return v13;
}

LABEL_20:
  }
}

  v52 = _MCLogObjects[9];
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    v53 = v52;
    v54 = (void *)objc_claimAutoreleasedReturnValue([v24 MCVerboseDescription]);
    *(_DWORD *)buf = 138543362;
    v66 = v54;
    _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "Installation failed. Error: %{public}@",  buf,  0xCu);
  }

  v55 = v63;
  if (a6)
  {
    __int128 v24 = v24;
    v56 = 0LL;
    *a6 = v24;
  }

  else
  {
    v56 = 0LL;
  }

  v57 = v64;
LABEL_27:

  return v56;
}

    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v23, 0xCu);

    goto LABEL_20;
  }

  uint64_t v16 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    id v17 = v16;
    __int128 v23 = 138543362;
    __int128 v24 = (id)objc_opt_class(self);
    os_log_t v18 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL",  (uint8_t *)&v23,  0xCu);
  }
}

        uint64_t v14 = (char *)v14 + 1;
      }

      while (v10 != v14);
      __int128 v22 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
      id v10 = v22;
    }

    while (v22);
  }

  [v24 setPostprocessedPayloadContents:v7];
  return 1;
}

  return v13;
}
          }

          uint64_t v20 = [obj countByEnumeratingWithState:&v85 objects:v91 count:16];
        }

        while (v20);
      }

      id v31 = [v18 count];
      uint64_t v16 = v70;
      if (v31 != -[NSMutableDictionary count](v73, "count")
        || ([v70 setCertificates:v73] & 1) == 0)
      {
        id v10 = v66;
        uint64_t v14 = v68;
        unsigned __int8 v12 = v69;
        if (v65)
        {
          v44 = MCDNSSettingsErrorDomain;
          v45 = MCErrorArray(@"ERROR_DNS_SETTINGS_INVALID_CERTIFICATE");
          v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
          *v65 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v44,  57001LL,  v46,  MCErrorTypeFatal,  0LL));

          uint64_t v16 = v70;
        }

        [v69 unlockConfigurations];
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        id v41 = v71;
        v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v81,  v90,  16LL);
        id v9 = v64;
        if (!v47)
        {
          id v40 = 0;
          goto LABEL_60;
        }

        v48 = v47;
        v49 = *(void *)v82;
        do
        {
          for (j = 0LL; j != v48; j = (char *)j + 1)
          {
            if (*(void *)v82 != v49) {
              objc_enumerationMutation(v41);
            }
            v51 = *(void *)(*((void *)&v81 + 1) + 8LL * (void)j);
            v52 = (void *)objc_claimAutoreleasedReturnValue([v75 UUID]);
            -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:]( self,  "_releaseDependencyBetweenPersistentID:andUUID:",  v51,  v52);
          }

          v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v81,  v90,  16LL);
        }

        while (v48);
        id v40 = 0;
        goto LABEL_58;
      }

      id v9 = v64;
      id v10 = v66;
      uint64_t v14 = v68;
      unsigned __int8 v12 = v69;
    }

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v75 UUID]);
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v75 organization]);
    [v16 setPayloadInfoCommon:v32 payloadOrganization:v33];

    v34 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile UUID](self->_profile, "UUID"));

    if (v35)
    {
      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile UUID](self->_profile, "UUID"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v36, kMCPayloadUUIDKey);
    }

    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile identifier](self->_profile, "identifier"));

    if (v37)
    {
      __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile identifier](self->_profile, "identifier"));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v34,  "setObject:forKeyedSubscript:",  v38,  kMCPayloadIdentifierKey);
    }

    if (v9) {
      -[NSMutableDictionary addEntriesFromDictionary:](v34, "addEntriesFromDictionary:", v9);
    }
    v73 = v34;
    [v16 setProfileInfo:v34];
    [v12 updateDefaultAfterAddingConfiguration];
    v39 = (void *)objc_claimAutoreleasedReturnValue([v16 getConfigurationIdentifier]);
    [v75 setPersistentResourceID:v39];

    v80 = 0LL;
    id v40 = [v12 saveIngestedConfiguration:&v80];
    id v41 = (NSMutableArray *)v80;
    if ((v40 & 1) != 0)
    {
      [v12 unlockConfigurations];
LABEL_60:

LABEL_61:
      goto LABEL_62;
    }

    v70 = v16;
    v67 = v10;
    v68 = v14;
    if (v65)
    {
      v53 = [(id)objc_opt_class(self) internalErrorWithUnderlyingError:v41];
      *v65 = (id)objc_claimAutoreleasedReturnValue(v53);
    }

    v69 = v12;
    [v12 unlockConfigurations];
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v54 = v71;
    v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v54,  "countByEnumeratingWithState:objects:count:",  &v76,  v89,  16LL);
    if (v55)
    {
      v56 = v55;
      v57 = *(void *)v77;
      do
      {
        for (k = 0LL; k != v56; k = (char *)k + 1)
        {
          if (*(void *)v77 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = *(void *)(*((void *)&v76 + 1) + 8LL * (void)k);
          v60 = (void *)objc_claimAutoreleasedReturnValue([v75 UUID]);
          -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:]( self,  "_releaseDependencyBetweenPersistentID:andUUID:",  v59,  v60);
        }

        v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v54,  "countByEnumeratingWithState:objects:count:",  &v76,  v89,  16LL);
      }

      while (v56);
    }

    id v10 = v67;
LABEL_58:
    uint64_t v14 = v68;
    unsigned __int8 v12 = v69;
    uint64_t v16 = v70;
    goto LABEL_60;
  }

  if (a6)
  {
    v42 = [(id)objc_opt_class(self) internalError];
    id v40 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue(v42);
  }

  else
  {
    id v40 = 0;
  }

void sub_10002155C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t sub_1000215BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000215CC(uint64_t a1)
{
}

uint64_t sub_1000215D4(void *a1, uint64_t a2, id obj)
{
  if (obj)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8LL) + 40LL), obj);
  }

  else
  {
    *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
    CFRetain(*(CFTypeRef *)(*(void *)(a1[5] + 8LL) + 24LL));
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8LL) + 40LL));
}

LABEL_32:
  return v3;
}

    uint64_t v8 = 0LL;
  }

  else
  {
    v39 = self->_identity;
    if (!v39) {
      goto LABEL_32;
    }
    CFRetain(v39);
    uint64_t v8 = self->_identity;
  }

LABEL_34:
  return v8;
}

  __int128 v38 = *(void *)(*(void *)(a1 + 104) + 8LL);
  v39 = *(void **)(v38 + 40);
  *(void *)(v38 + 40) = v10;
}

LABEL_17:
  v42 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v43 = v42;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSError MCVerboseDescription](v10, "MCVerboseDescription"));
    *(_DWORD *)buf = 138543362;
    v50 = v44;
    _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "Account validation failed. Error: %{public}@",  buf,  0xCu);
  }

  if (a4)
  {
    id v10 = v10;
    v45 = 0;
    *a4 = v10;
  }

  else
  {
    v45 = 0;
  }

  if (a6 && v14) {
    *a6 = [v14 MCCopyAsPrimaryError];
  }

  return v14 == 0LL;
}
}

LABEL_23:
  return v45;
}

        uint64_t v7 = v38;
        uint64_t v2 = v39;
        unsigned __int8 v12 = v36;
        id v6 = v37;
      }

      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v22));
      [v5 setObject:v29 forKeyedSubscript:v6];

      [v5 setObject:&off_1000CBFC8 forKeyedSubscript:v12];
    }

    uint64_t v30 = MCCloudConfigurationDetailsFilePath(v14);
    id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    [v5 MCWriteToBinaryFile:v31];

    MCSendCloudConfigurationDetailsChangedNotification();
    __int128 v28 = 1;
LABEL_26:
    uint64_t v32 = _MCLogObjects[12];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
      __int128 v35 = [v34 BOOLValue];
      *(_DWORD *)buf = 67109632;
      v45 = v11;
      v46 = 1024;
      v47 = v28;
      v48 = 1024;
      v49 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Correct cloud configuration results: wroteDefaultConfig %d correctedConfig %d supervised %d",  buf,  0x14u);
    }
  }

  objc_autoreleasePoolPop(v2);
}
}

LABEL_13:
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, 0LL);
  Value = (__SecIdentity *)CFDictionaryGetValue(ValueAtIndex, kSecImportItemIdentity);
  id v11 = Value;
  if (Value) {
    CFRetain(Value);
  }
  if (theArray) {
    CFRelease(theArray);
  }
LABEL_17:

  return v11;
}

    if (cf) {
      CFRelease(cf);
    }
    if (v44) {
      CFRelease(v44);
    }
    if (v43) {
      CFRelease(v43);
    }
    if (v6) {
      [v6 didUpdateStatus:0];
    }
    if (v32)
    {
      if (a4) {
        *a4 = v32;
      }
      v34 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        __int128 v35 = v34;
        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v32 MCVerboseDescription]);
        *(_DWORD *)buf = 138543362;
        v47 = v36;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Cannot generate self-signed certificate: %{public}@",  buf,  0xCu);
      }
    }

    else
    {
      __int128 v37 = self->_identity;
      if (v37)
      {
        CFRetain(v37);
        uint64_t v8 = self->_identity;
LABEL_29:

        goto LABEL_30;
      }
    }

    uint64_t v8 = 0LL;
    goto LABEL_29;
  }

  CFRetain(identity);
  uint64_t v8 = self->_identity;
LABEL_30:

  return v8;
}

      uint64_t v16 = (id)objc_claimAutoreleasedReturnValue(-[MCVPNPayloadHandlerBase cannotInstallError](self, "cannotInstallError"));
LABEL_14:
      __int128 v25 = 0LL;
      goto LABEL_15;
    }
  }

  __int128 v38 = objc_claimAutoreleasedReturnValue(-[NEProfileIngestionDelegate ingestedConfiguration](self->_neProfileIngestionHandler, "ingestedConfiguration"));
  if (!v38)
  {
    v46 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v47 = v46;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v49 = (void *)objc_claimAutoreleasedReturnValue([v48 UUID]);
      *(_DWORD *)buf = 138543362;
      v106 = v49;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "NetworkExtension decided to skip installation of payload UUID %{public}@",  buf,  0xCu);
    }

    -[NEProfileIngestionDelegate unlockConfigurations](self->_neProfileIngestionHandler, "unlockConfigurations");
    uint64_t v16 = 0LL;
    __int128 v25 = 0LL;
    goto LABEL_36;
  }

  __int128 v25 = (void *)v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue([v9 nePayloadBase]);
  id v40 = objc_claimAutoreleasedReturnValue([v25 getPendingCertificateInfo:v39]);

  v93 = (void *)v40;
  v85 = v8;
  if (v40)
  {
    id v41 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM]);
    v42 = [v41 BOOLValue];

    v83 = a6;
    v84 = v10;
    v87 = v25;
    if (v42)
    {
      v43 = kMDMPersonaKey;
      v44 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMDMPersonaKey]);
      v45 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v44, v45) & 1) != 0) {
        v88 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v43]);
      }
      else {
        v88 = 0LL;
      }
    }

    else
    {
      v88 = 0LL;
    }

    v91 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v93 count]);
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v93 allKeys]);
    v51 = [obj countByEnumeratingWithState:&v99 objects:v104 count:16];
    if (v51)
    {
      v52 = v51;
      v92 = *(void *)v100;
      do
      {
        for (i = 0LL; i != v52; i = (char *)i + 1)
        {
          if (*(void *)v100 != v92) {
            objc_enumerationMutation(obj);
          }
          v54 = *(void *)(*((void *)&v99 + 1) + 8LL * (void)i);
          v55 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKeyedSubscript:v54]);
          v56 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKeyedSubscript:@"PayloadUUID"]);
          v57 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKeyedSubscript:@"AccessGroup"]);
          if (v57)
          {
            v58 = -[MCVPNPayloadHandlerBase _copyCertificateWithPayloadUUID:intoKeychainAccessGroup:personaID:]( self,  "_copyCertificateWithPayloadUUID:intoKeychainAccessGroup:personaID:",  v56,  v57,  0LL);
            if (!v58) {
              goto LABEL_51;
            }
            v59 = v58;
            v60 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
            -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:]( self,  "_retainDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:",  v59,  v60,  1LL,  0LL,  v88);

            -[NSMutableArray addObject:](v89, "addObject:", v59);
          }

          else
          {
            v61 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
            v59 = (void *)objc_claimAutoreleasedReturnValue([v61 persistentIDForCertificateUUID:v56]);

            if (!v59) {
              goto LABEL_51;
            }
          }

          -[NSMutableDictionary setObject:forKey:](v91, "setObject:forKey:", v59, v54);

LABEL_51:
        }

        v52 = [obj countByEnumeratingWithState:&v99 objects:v104 count:16];
      }

      while (v52);
    }

    v62 = [v93 count];
    if (v62 != -[NSMutableDictionary count](v91, "count") || ![v87 setCertificates:v91])
    {
      v64 = MCVPNErrorDomain;
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v66 = (void *)objc_claimAutoreleasedReturnValue([v65 displayName]);
      v67 = MCErrorArray(@"ERROR_VPN_INVALID_CERTIFICATES");
      v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
      uint64_t v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v64,  15003LL,  v68,  MCErrorTypeFatal,  v66,  0LL));

      id v10 = v84;
      uint64_t v8 = v85;
      a6 = v83;
      __int128 v25 = v87;
      goto LABEL_15;
    }

    id v10 = v84;
    uint64_t v8 = v85;
    a6 = v83;
    __int128 v25 = v87;
  }

  v63 = objc_claimAutoreleasedReturnValue(-[MCVPNPayloadHandlerBase installService:](self, "installService:", v25));
  if (v63)
  {
    uint64_t v16 = (id)v63;
    -[NEProfileIngestionDelegate unlockConfigurations](self->_neProfileIngestionHandler, "unlockConfigurations");
    goto LABEL_17;
  }

  [v25 setPayloadInfoIdentity:v10];
  v69 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
  v70 = (void *)objc_claimAutoreleasedReturnValue([v9 organization]);
  [v25 setPayloadInfoCommon:v69 payloadOrganization:v70];

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v72 = (void *)objc_claimAutoreleasedReturnValue([v71 profile]);

  if (v72)
  {
    v73 = v25;
    v74 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v75 = (void *)objc_claimAutoreleasedReturnValue([v72 UUID]);

    if (v75)
    {
      v76 = (void *)objc_claimAutoreleasedReturnValue([v72 UUID]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v74, "setObject:forKeyedSubscript:", v76, kMCPayloadUUIDKey);
    }

    v77 = (void *)objc_claimAutoreleasedReturnValue([v72 identifier]);

    if (v77)
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue([v72 identifier]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v74,  "setObject:forKeyedSubscript:",  v78,  kMCPayloadIdentifierKey);
    }

    if (v8) {
      -[NSMutableDictionary addEntriesFromDictionary:](v74, "addEntriesFromDictionary:", v8);
    }
    __int128 v25 = v73;
    [v73 setProfileInfo:v74];
  }

  -[NEProfileIngestionDelegate updateDefaultAfterAddingConfiguration]( self->_neProfileIngestionHandler,  "updateDefaultAfterAddingConfiguration");
  v79 = (void *)objc_claimAutoreleasedReturnValue([v25 getConfigurationIdentifier]);
  [v9 setPersistentResourceID:v79];

  v80 = self->_neProfileIngestionHandler;
  v98 = 0LL;
  v81 = -[NEProfileIngestionDelegate saveIngestedConfiguration:]( v80,  "saveIngestedConfiguration:",  &v98);
  uint64_t v16 = v98;
  if ((v81 & 1) == 0)
  {
    v82 = objc_claimAutoreleasedReturnValue( -[MCVPNPayloadHandlerBase cannotInstallErrorWithUnderlyingError:]( self,  "cannotInstallErrorWithUnderlyingError:",  v16));

    uint64_t v16 = (id)v82;
  }

LABEL_37:
            __int128 v23 = v58;
            id v17 = a3;
LABEL_38:
            CFRelease(trust);
LABEL_39:
            CFRelease(v30);
            goto LABEL_40;
          }

          if (v60 == kSecTrustResultDeny)
          {
            v50 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO)) {
              goto LABEL_37;
            }
            *(_WORD *)buf = 0;
            v45 = v50;
            v46 = OS_LOG_TYPE_INFO;
            v47 = "Not using certificate for S/MIME because we are denying this certificate.";
          }

          else
          {
            if ((SecCertificateGetKeyUsage(a3) & 4) != 0)
            {
              log = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v71 = v28;
                _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Saving certificate as the S/MIME encryption certificate for %{public}@",  buf,  0xCu);
              }

              v52 =  +[MFMessageKeychainManager saveEncryptionCertificate:forAddress:]( &OBJC_CLASS___MFMessageKeychainManager,  "saveEncryptionCertificate:forAddress:",  a3,  v28);
              goto LABEL_37;
            }

            v51 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO)) {
              goto LABEL_37;
            }
            *(_WORD *)buf = 0;
            v45 = v51;
            v46 = OS_LOG_TYPE_INFO;
            v47 = "Not using certificate for S/MIME because it doesn't have the Key Encipherment usage.";
          }

          v49 = 2;
        }

        _os_log_impl((void *)&_mh_execute_header, v45, v46, v47, buf, v49);
        goto LABEL_37;
      }

      uint64_t v32 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v71 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Cannot copy S/MIME policy for email address %{public}@",  buf,  0xCu);
      }
  }

  else
  {
    __int128 v35 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "No other payloads are dependent on fully-trusted root cert that is about to be removed. Skipping restore of partial trust.",  buf,  2u);
    }
  }

LABEL_41:
}

          __int128 v37 = 0LL;
LABEL_42:
          uint64_t v13 = v85;
          uint64_t v14 = v81;
          goto LABEL_43;
        }
      }

      else
      {
        v96 = 0uLL;
        v97 = 0uLL;
        v94 = 0uLL;
        v95 = 0uLL;
        os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "esso_URLs"));
        __int128 v28 = [v18 countByEnumeratingWithState:&v94 objects:v117 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          v81 = v14;
          uint64_t v30 = *(void *)v95;
          while (2)
          {
            for (j = 0LL; j != v29; j = (char *)j + 1)
            {
              if (*(void *)v95 != v30) {
                objc_enumerationMutation(v18);
              }
              uint64_t v32 = *(void **)(*((void *)&v94 + 1) + 8LL * (void)j);
              __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v32 normalizedURL]);
              if ([v85 containsObject:v24])
              {
                if ([v9 containsObject:v15])
                {
                  v39 = (void *)objc_claimAutoreleasedReturnValue([v32 absoluteString]);
                  id v40 = MCErrorArray(@"EXTENSIBLE_SSO_INTER_URL_CONFLICT_P_URL");
                  id v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
                  __int128 v37 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v75,  54005LL,  v41,  0LL,  v74,  v39,  0LL));

                  unsigned __int8 v12 = v84;
LABEL_41:

                  goto LABEL_42;
                }

                id v33 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                {
                  v34 = v33;
                  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "esso_extensionIdentifier"));
                  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v32 absoluteString]);
                  *(_DWORD *)buf = 138543618;
                  v119 = v35;
                  v120 = 2114;
                  v121 = v36;
                  _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Found pre-existing conflicting URLs while rebuilding configuration for Extensible SSO payload with e xtension ID %{public}@: %{public}@",  buf,  0x16u);

                  unsigned __int8 v12 = v84;
                }
              }

              else
              {
                [v85 addObject:v24];
              }
            }

            uint64_t v29 = [v18 countByEnumeratingWithState:&v94 objects:v117 count:16];
            if (v29) {
              continue;
            }
            goto LABEL_37;
          }
        }
      }

      __int128 v37 = 0LL;
LABEL_43:

      if (v37)
      {

        if (a6)
        {
          __int128 v37 = v37;
          v69 = 0LL;
          *a6 = v37;
        }

        else
        {
          v69 = 0LL;
        }

        goto LABEL_78;
      }

      if ((id)++v14 == v79)
      {
        v79 = [obj countByEnumeratingWithState:&v102 objects:v123 count:16];
        if (v79) {
          goto LABEL_8;
        }
        break;
      }
    }
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v80 = obj;
  v83 = [v80 countByEnumeratingWithState:&v90 objects:v116 count:16];
  if (v83)
  {
    v82 = *(void *)v91;
    v78 = v42;
    do
    {
      for (k = 0LL; k != v83; k = (char *)k + 1)
      {
        if (*(void *)v91 != v82) {
          objc_enumerationMutation(v80);
        }
        v44 = *(void **)(*((void *)&v90 + 1) + 8LL * (void)k);
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_type"));
        [v45 setObject:v46 forKeyedSubscript:@"Type"];

        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_realm"));
        if (v47)
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_realm"));
          [v45 setObject:v48 forKeyedSubscript:@"Realm"];
        }

        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_teamIdentifier"));
        if (v49)
        {
          v114[0] = @"BundleIdentifier";
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_extensionIdentifier"));
          v115[0] = v50;
          v114[1] = @"TeamIdentifier";
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_teamIdentifier"));
          v115[1] = v51;
          v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v115,  v114,  2LL));
          [v45 setObject:v52 forKeyedSubscript:@"Extension"];
        }

        else
        {
          v112 = @"BundleIdentifier";
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_extensionIdentifier"));
          v113 = v50;
          v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v113,  &v112,  1LL));
          [v45 setObject:v51 forKeyedSubscript:@"Extension"];
        }

        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_extensionData"));
        if (v53)
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_extensionData"));
          [v45 setObject:v54 forKeyedSubscript:@"ExtensionData"];
        }

        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_type"));
        v56 = [v55 isEqualToString:@"Credential"];

        if (v56)
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_hosts"));
          [v45 setObject:v57 forKeyedSubscript:@"Hosts"];
        }

        else
        {
          v58 = v9;
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          v86 = 0u;
          v87 = 0u;
          v88 = 0u;
          v89 = 0u;
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_URLs"));
          v60 = [v59 countByEnumeratingWithState:&v86 objects:v111 count:16];
          if (v60)
          {
            v61 = v60;
            v62 = *(void *)v87;
            do
            {
              for (m = 0LL; m != v61; m = (char *)m + 1)
              {
                if (*(void *)v87 != v62) {
                  objc_enumerationMutation(v59);
                }
                [v57 addObject:v64];
              }

              v61 = [v59 countByEnumeratingWithState:&v86 objects:v111 count:16];
            }

            while (v61);
          }

          [v45 setObject:v57 forKeyedSubscript:@"URLPrefix"];
          id v9 = v58;
          unsigned __int8 v12 = v84;
          v42 = v78;
        }

        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_screenLockedBehavior"));
        if (v65)
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_screenLockedBehavior"));
          [v45 setObject:v66 forKeyedSubscript:@"ScreenLockedBehavior"];
        }

        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_deniedBundleIdentifiers"));

        if (v67)
        {
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_deniedBundleIdentifiers"));
          [v45 setObject:v68 forKeyedSubscript:@"DeniedBundleIdentifiers"];
        }

        [v42 addObject:v45];
      }

      v83 = [v80 countByEnumeratingWithState:&v90 objects:v116 count:16];
    }

    while (v83);
  }

  v109 = @"Profiles";
  v110 = v42;
  v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v110,  &v109,  1LL));

  __int128 v37 = 0LL;
  uint64_t v13 = v85;
LABEL_78:

  return v69;
}

LABEL_40:
      __int128 v27 = (char *)v27 + 1;
    }

    while (v25 != v27);
    v53 = [v23 countByEnumeratingWithState:&v63 objects:v69 count:16];
    __int128 v25 = v53;
  }

  while (v53);
LABEL_53:

  CFRelease(v23);
  uint64_t v15 = v55;
LABEL_54:
  __int128 v21 = v15;
  uint64_t v20 = 0LL;
LABEL_55:

  return v21;
}

LABEL_47:
                    __int128 v21 = v83;
                    __int128 v28 = v84;
                    __int128 v22 = &MailAccountHostname_ptr;
                    __int128 v25 = v85;
                  }
                }
              }
            }

            __int128 v27 = [v25 countByEnumeratingWithState:&v95 objects:v115 count:16];
            __int128 v24 = v81;
            if (v27) {
              continue;
            }
            break;
          }
        }

LABEL_54:
        __int128 v23 = v82 + 1;
      }

      while ((id)(v82 + 1) != v80);
      v45 = [obj countByEnumeratingWithState:&v99 objects:v116 count:16];
      v80 = v45;
    }

    while (v45);
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v46 = v78;
  v47 = [v46 countByEnumeratingWithState:&v87 objects:v113 count:16];
  if (v47)
  {
    v48 = v47;
    v49 = *(void *)v88;
    do
    {
      for (k = 0LL; k != v48; k = (char *)k + 1)
      {
        if (*(void *)v88 != v49) {
          objc_enumerationMutation(v46);
        }
        v51 = *(void **)(*((void *)&v87 + 1) + 8LL * (void)k);
        v52 = (void *)objc_claimAutoreleasedReturnValue([v51 identifier]);
        v53 = _MCLogObjects[12];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v112 = v52;
          _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "MCCleanupMigrator: Removing profile with PayloadIdentifier %@ because it referenced a hardware-bound key",  buf,  0xCu);
        }

        v54 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
        objc_msgSend( v54,  "removeProfileWithIdentifier:installationType:source:",  v52,  objc_msgSend(v51, "installType"),  @"Hardware-bound Profile Removal");
      }

      v48 = [v46 countByEnumeratingWithState:&v87 objects:v113 count:16];
    }

    while (v48);
  }

  objc_autoreleasePoolPop(context);
  if (v74)
  {
    v56 = MCCloudConfigurationDetailsFilePath(v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v57));

    if (v58)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:kCCConfigurationSourceKey]);
      v60 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v59, v60) & 1) != 0 && [v59 intValue] == 1)
      {
        v61 = _MCLogObjects[12];
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "MCCleanupMigrator: Removing cloud configuration for DEP device that was unenrolled due to hardware-bound key",  buf,  2u);
        }

        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        v63 = MCCloudConfigurationDetailsFilePath(v62);
        v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
        [v62 removeItemAtPath:v64 error:0];

        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        v66 = MCLegacyCloudConfigurationDetailsFilePath();
        v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
        [v65 removeItemAtPath:v67 error:0];

        MCSendCloudConfigurationDetailsChangedNotification();
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        v69 = MCPostSetupAutoInstallProfilePath();
        v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
        [v68 removeItemAtPath:v70 error:0];

        v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        v72 = MCLegacyPostSetupAutoInstallProfilePath();
        v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
        [v71 removeItemAtPath:v73 error:0];
      }
    }
  }
}

  if ([v27 containsPayloadOfClass:objc_opt_class(MCGlobalHTTPProxyPayload)])
  {
    v62 = objc_opt_class(&OBJC_CLASS___MCGlobalHTTPProxyPayload);
    v63 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
    uint64_t v29 = (id)objc_claimAutoreleasedReturnValue( -[MCInstaller existingProfileContainingPayloadClass:excludingProfileIdentifier:]( self,  "existingProfileContainingPayloadClass:excludingProfileIdentifier:",  v62,  v63));

    if (v29)
    {
      v196 = MCInstallationErrorDomain;
      v64 = (void *)objc_claimAutoreleasedReturnValue([v29 friendlyName]);
      v182 = v64;
      v65 = MCErrorArray(@"ERROR_PROFILE_MULTIPLE_GLOBAL_HTTP_PROXY_P_OLD_ID");
      v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
      v67 = MCErrorTypeFatal;
      v68 = v196;
      v69 = 4017LL;
      goto LABEL_70;
    }

    __int128 v27 = v193;
    if ((unint64_t)[v193 countOfPayloadsOfClass:objc_opt_class(MCGlobalHTTPProxyPayload)] >= 2)
    {
      v190 = &OBJC_CLASS___NSError;
      v188 = (void *)MCInstallationErrorDomain;
      v70 = (void *)objc_claimAutoreleasedReturnValue([v193 friendlyName]);
      v71 = MCErrorArray(@"ERROR_PROFILE_MULTIPLE_GLOBAL_HTTP_P_ID");
      v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
      v73 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v188,  4017LL,  v72,  MCErrorTypeFatal,  v70,  0LL));

      uint64_t v30 = (id)v73;
      __int128 v27 = v193;
    }
  }

  if ([v27 containsPayloadOfClass:objc_opt_class(MCSingleAppPayload)])
  {
    v74 = objc_opt_class(&OBJC_CLASS___MCSingleAppPayload);
    v75 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
    uint64_t v29 = (id)objc_claimAutoreleasedReturnValue( -[MCInstaller existingProfileContainingPayloadClass:excludingProfileIdentifier:]( self,  "existingProfileContainingPayloadClass:excludingProfileIdentifier:",  v74,  v75));

    if (v29)
    {
      v197 = MCInstallationErrorDomain;
      v64 = (void *)objc_claimAutoreleasedReturnValue([v29 friendlyName]);
      v182 = v64;
      v76 = MCErrorArray(@"ERROR_PROFILE_MULTIPLE_APP_LOCK_P_OLD_ID");
      v66 = (void *)objc_claimAutoreleasedReturnValue(v76);
      v67 = MCErrorTypeFatal;
      v68 = v197;
      v69 = 4019LL;
      goto LABEL_70;
    }

    __int128 v27 = v193;
    if ((unint64_t)[v193 countOfPayloadsOfClass:objc_opt_class(MCSingleAppPayload)] >= 2)
    {
      v190 = &OBJC_CLASS___NSError;
      v188 = (void *)MCInstallationErrorDomain;
      v77 = (void *)objc_claimAutoreleasedReturnValue([v193 friendlyName]);
      v78 = MCErrorArray(@"ERROR_PROFILE_MULTIPLE_APP_LOCK_P_ID");
      v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
      v80 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v188,  4019LL,  v79,  MCErrorTypeFatal,  v77,  0LL));

      uint64_t v30 = (id)v80;
      __int128 v27 = v193;
    }
  }

  if (![v27 containsPayloadOfClass:objc_opt_class(MCHomeScreenLayoutPayload)])
  {
LABEL_73:
    if ([v27 containsPayloadOfClass:objc_opt_class(MCNotificationSettingsPayload)])
    {
      if (v18 == 2) {
        v90 = 9LL;
      }
      else {
        v90 = 19LL;
      }
      v91 = v27;
      v92 = objc_opt_class(&OBJC_CLASS___MCNotificationSettingsPayload);
      v93 = (void *)objc_claimAutoreleasedReturnValue([v91 identifier]);
      uint64_t v29 = (id)objc_claimAutoreleasedReturnValue( -[MCInstaller existingProfileContainingPayloadClass:inProfilesWithFilterFlags:excludingProfileIdentifier:]( self,  "existingProfileContainingPayloadClass:inProfilesWithFilterFlags:excludingProfileIdentifier:",  v92,  v90,  v93));

      if (v29)
      {
        v94 = MCInstallationErrorDomain;
        v95 = (void *)objc_claimAutoreleasedReturnValue([v29 friendlyName]);
        v96 = MCErrorArray(@"ERROR_PROFILE_MULTIPLE_NOTIFICATION_SETTINGS_P_OLD_ID");
        v97 = (void *)objc_claimAutoreleasedReturnValue(v96);
        v98 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v94,  4028LL,  v97,  MCErrorTypeFatal,  v95,  0LL));

        v34 = 0LL;
        uint64_t v30 = (id)v98;
LABEL_87:
        unsigned __int8 v12 = v194;
        goto LABEL_88;
      }

      v186 = v10;
      if ((unint64_t)[v91 countOfPayloadsOfClass:objc_opt_class(MCNotificationSettingsPayload)] < 2)
      {
        __int128 v27 = v91;
      }

      else
      {
        v121 = MCInstallationErrorDomain;
        v122 = (void *)objc_claimAutoreleasedReturnValue([v193 friendlyName]);
        v123 = MCErrorArray(@"ERROR_PROFILE_MULTIPLE_NOTIFICATION_SETTINGS_P_ID");
        v124 = (void *)objc_claimAutoreleasedReturnValue(v123);
        v125 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v121,  4028LL,  v124,  MCErrorTypeFatal,  v122,  0LL));

        uint64_t v30 = (id)v125;
        __int128 v27 = v193;
      }
    }

    else
    {
      v186 = v10;
    }

    if (([v27 containsPayloadOfClass:objc_opt_class(MCAPNPayload)] & 1) != 0
      || [v27 containsPayloadOfClass:objc_opt_class(MCCellularPayload)])
    {
      v99 = objc_opt_class(&OBJC_CLASS___MCAPNPayload);
      v100 = v27;
      v101 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
      uint64_t v29 = (id)objc_claimAutoreleasedReturnValue( -[MCInstaller existingProfileContainingPayloadClass:excludingProfileIdentifier:]( self,  "existingProfileContainingPayloadClass:excludingProfileIdentifier:",  v99,  v101));

      if (v29
        || (v102 = objc_opt_class(&OBJC_CLASS___MCCellularPayload),
            v103 = (void *)objc_claimAutoreleasedReturnValue([v100 identifier]),
            uint64_t v29 = (id)objc_claimAutoreleasedReturnValue( -[MCInstaller existingProfileContainingPayloadClass:excludingProfileIdentifier:]( self,  "existingProfileContainingPayloadClass:excludingProfileIdentifier:",  v102,  v103)),  v103,  v29))
      {
        v104 = MCInstallationErrorDomain;
        v105 = (void *)objc_claimAutoreleasedReturnValue([v29 friendlyName]);
        v106 = MCErrorArray(@"ERROR_PROFILE_MULTIPLE_APN_P_OLD_ID");
        v107 = objc_claimAutoreleasedReturnValue(v106);
        v108 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v104,  4018LL,  v107,  MCErrorTypeFatal,  v105,  0LL));

        uint64_t v30 = (id)v107;
LABEL_85:

        v34 = 0LL;
        uint64_t v30 = (id)v108;
LABEL_86:
        id v10 = v186;
        goto LABEL_87;
      }

      v126 = (char *)[v100 countOfPayloadsOfClass:objc_opt_class(MCAPNPayload)];
      __int128 v27 = v100;
      if (&v126[(void)[v100 countOfPayloadsOfClass:objc_opt_class(MCCellularPayload)]] >= (char *)2)
      {
        v127 = MCInstallationErrorDomain;
        uint64_t v29 = (id)objc_claimAutoreleasedReturnValue([v100 friendlyName]);
        v128 = MCErrorArray(@"ERROR_PROFILE_MULTIPLE_APN_P_ID");
        v105 = (void *)objc_claimAutoreleasedReturnValue(v128);
        v108 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v127,  4018LL,  v105,  MCErrorTypeFatal,  v29,  0LL));
        goto LABEL_85;
      }
    }

    id v10 = v186;
    unsigned __int8 v12 = v194;
    if ([v27 containsPayloadOfClass:objc_opt_class(MCConferenceRoomDisplayPayload)])
    {
      v129 = objc_opt_class(&OBJC_CLASS___MCConferenceRoomDisplayPayload);
      v130 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
      uint64_t v29 = (id)objc_claimAutoreleasedReturnValue( -[MCInstaller existingProfileContainingPayloadClass:excludingProfileIdentifier:]( self,  "existingProfileContainingPayloadClass:excludingProfileIdentifier:",  v129,  v130));

      if (v29)
      {
        v131 = MCInstallationErrorDomain;
        v132 = (void *)objc_claimAutoreleasedReturnValue([v29 friendlyName]);
        v183 = v132;
        v133 = @"ERROR_PROFILE_MULTIPLE_CONFERENCE_ROOM_DISPLAY_P_OLD_ID";
LABEL_120:
        v137 = MCErrorArray(v133);
        v138 = (void *)objc_claimAutoreleasedReturnValue(v137);
        v139 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v131,  4034LL,  v138,  MCErrorTypeFatal,  v183,  0LL));

        v34 = 0LL;
        uint64_t v30 = (id)v139;
        goto LABEL_88;
      }

      __int128 v27 = v193;
      if ((unint64_t)[v193 countOfPayloadsOfClass:objc_opt_class(MCConferenceRoomDisplayPayload)] >= 2)
      {
        v131 = MCInstallationErrorDomain;
        v132 = (void *)objc_claimAutoreleasedReturnValue([v193 friendlyName]);
        v183 = v132;
        v133 = @"ERROR_PROFILE_MULTIPLE_CONFERENCE_ROOM_DISPLAY_P_ID";
        goto LABEL_120;
      }
    }

    if ([v27 containsPayloadOfClass:objc_opt_class(MCPasswordPolicyPayload)])
    {
      v211 = v30;
      v134 = -[MCInstaller _allowsPasswordPoliciesFromProfile:outError:]( self,  "_allowsPasswordPoliciesFromProfile:outError:",  v27,  &v211);
      uint64_t v29 = v211;

      if (!v134)
      {
        uint64_t v30 = 0LL;
        goto LABEL_53;
      }

      uint64_t v30 = v29;
    }

    if ([v27 containsPayloadOfClass:objc_opt_class(MCAirPlaySecurityPayload)])
    {
      v135 = objc_opt_class(&OBJC_CLASS___MCAirPlaySecurityPayload);
      v136 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
      uint64_t v29 = (id)objc_claimAutoreleasedReturnValue( -[MCInstaller existingProfileContainingPayloadClass:excludingProfileIdentifier:]( self,  "existingProfileContainingPayloadClass:excludingProfileIdentifier:",  v135,  v136));

      if (v29)
      {
        v131 = MCInstallationErrorDomain;
        v132 = (void *)objc_claimAutoreleasedReturnValue([v29 friendlyName]);
        v183 = v132;
        v133 = @"ERROR_PROFILE_MULTIPLE_AIRPLAY_SECURITY_P_OLD_ID";
        goto LABEL_120;
      }

      __int128 v27 = v193;
      if ((unint64_t)[v193 countOfPayloadsOfClass:objc_opt_class(MCAirPlaySecurityPayload)] >= 2)
      {
        v131 = MCInstallationErrorDomain;
        v132 = (void *)objc_claimAutoreleasedReturnValue([v193 friendlyName]);
        v183 = v132;
        v133 = @"ERROR_PROFILE_MULTIPLE_AIRPLAY_SECURITY_P_ID";
        goto LABEL_120;
      }
    }

    uint64_t v29 = (id)objc_claimAutoreleasedReturnValue([v27 removalDate]);
    if (v29)
    {
      v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v141 = [v29 compare:v140];

      if (v141 == (id)-1LL)
      {
        v151 = MCInstallationErrorDomain;
        v148 = (id)objc_claimAutoreleasedReturnValue([v193 friendlyName]);
        v152 = MCErrorArray(@"ERROR_PROFILE_REMOVAL_DATE_PAST_P_ID");
        v153 = (void *)objc_claimAutoreleasedReturnValue(v152);
        v154 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v151,  4025LL,  v153,  MCErrorTypeFatal,  v148,  0LL));

        v34 = 0LL;
        uint64_t v30 = (id)v154;
        goto LABEL_163;
      }
    }

    v142 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kMCInstallProfileOptionsIsRMUserEnrollment]);
    v143 = [v142 BOOLValue];
    if ((v143 & 1) != 0) {
      goto LABEL_127;
    }
    v144 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM]);
    if ([v144 BOOLValue])
    {
      v190 = v144;
      v188 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](&OBJC_CLASS___MDMConfiguration, "sharedConfiguration"));
      if ([v188 isUserEnrollment])
      {
        unsigned __int8 v12 = v194;
LABEL_127:
        v145 = objc_opt_class(&OBJC_CLASS___MCProfileServiceProfile);
        isKindOfClass = objc_opt_isKindOfClass(v193, v145);
        if ((v143 & 1) == 0)
        {
        }

        if ((isKindOfClass & 1) != 0)
        {
          v147 = MCInstallationErrorDomain;
          v148 = (id)objc_claimAutoreleasedReturnValue([v193 friendlyName]);
          v149 = MCErrorArray(@"ERROR_PROFILE_FORBIDDEN_USER_ENROLLMENT_AND_OTA");
          v150 = (void *)objc_claimAutoreleasedReturnValue(v149);
          v199 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v147,  4040LL,  v150,  MCErrorTypeFatal,  v148,  0LL));

          v34 = 0LL;
          uint64_t v30 = (id)v199;
LABEL_163:

          goto LABEL_88;
        }

void sub_10002B3B4(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = (os_log_s *)_MCLogObjects[12];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Recompute Profile Restrictions error: %@",  (uint8_t *)&v4,  0xCu);
    }
  }
}

void sub_10002B460(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentRestrictions]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 effectiveUserSettings]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](&OBJC_CLASS___MCServerSideHacks, "sharedHacks"));
  [v7 setUserTrackingTCCAccessOverrideForRestrictions:v4];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](&OBJC_CLASS___MCServerSideHacks, "sharedHacks"));
  [v8 _applyServerSideChangesWithOldRestrictions:&__NSDictionary0__struct newRestrictions:v4 oldEffectiveUserSettings:&__NSDictionary0__struct newEffectiveUserSettings:v6];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v9 recomputeEffectiveUserSettingsPasscode:0];

  MCSendSettingsChangedNotification();
  uint64_t v10 = getpid();
  uint64_t v11 = MCSendEffectiveSettingsChangedNotification(v10);
  MCSendProfileListChangedNotification(v11);
  [*(id *)(a1 + 32) _wakeDaemonsPostMigration];

  objc_autoreleasePoolPop(v2);
}

void sub_10002F5B8(id a1)
{
  uint64_t v1 = MCTagsMappingFilePath(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](&OBJC_CLASS___NSDictionary, "dictionaryWithContentsOfFile:", v2));
  int v4 = (void *)qword_1000DC050;
  qword_1000DC050 = v3;

  uint64_t v5 = qword_1000DC050;
  if (!qword_1000DC050)
  {
    uint64_t v7 = 0LL;
LABEL_6:
    qword_1000DC050 = 0LL;

    return;
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    uint64_t v7 = (void *)qword_1000DC050;
    goto LABEL_6;
  }

void sub_100032094(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = _MCLogObjects[12];
  if (v3)
  {
    if (os_log_type_enabled(_MCLogObjects[12], OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      v9[0] = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Recompute Profile Restrictions error: %@",  (uint8_t *)&v8,  0xCu);
    }
  }

  else if (os_log_type_enabled(_MCLogObjects[12], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    LODWORD(v5) = [v5 count];
    unsigned int v7 = [*(id *)(a1 + 40) count];
    int v8 = 67109376;
    LODWORD(v9[0]) = (_DWORD)v5;
    WORD2(v9[0]) = 1024;
    *(_DWORD *)((char *)v9 + 6) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Done updating. %d system profile and %d user profile restrictions processed.",  (uint8_t *)&v8,  0xEu);
  }
}

void sub_100032EE8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100032F08(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  uint64_t v15 = kMCMDMLostModeLastLocationRequestDateKey;
  uint64_t v16 = *(void *)(a1 + 32);
  int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  if ([v4 writeToURL:v3 atomically:1])
  {
    v13[0] = NSFileProtectionKey;
    v13[1] = NSURLIsExcludedFromBackupKey;
    v14[0] = NSFileProtectionNone;
    v14[1] = &__kCFBooleanTrue;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));
    id v10 = 0LL;
    unsigned __int8 v6 = [v3 setResourceValues:v5 error:&v10];
    id v7 = v10;

    if ((v6 & 1) == 0)
    {
      int v8 = _MCLogObjects[12];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v12 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Could not write device last located time interval URL resource values: %{public}@",  buf,  0xCu);
      }
    }
  }

  else
  {
    id v9 = _MCLogObjects[12];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Could not write device last located time interval",  buf,  2u);
    }
  }
}

uint64_t sub_100038A48()
{
  return AnalyticsSendEventLazy(@"com.apple.managedconfiguration.dailystatus", &stru_1000C3668);
}

NSDictionary *__cdecl sub_100038A5C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  +[MCDailyAnalyticsHelper addCloudConfigInfoWithEventPayload:]( &OBJC_CLASS___MCDailyAnalyticsHelper,  "addCloudConfigInfoWithEventPayload:",  v1);
  +[MCDailyAnalyticsHelper addMDMConfigInfoWithEventPayload:]( &OBJC_CLASS___MCDailyAnalyticsHelper,  "addMDMConfigInfoWithEventPayload:",  v1);
  +[MCDailyAnalyticsHelper addSharediPadInfoWithEventPayload:]( &OBJC_CLASS___MCDailyAnalyticsHelper,  "addSharediPadInfoWithEventPayload:",  v1);
  +[MCDailyAnalyticsHelper addProfileAndPayloadInfoWithEventPayload:]( &OBJC_CLASS___MCDailyAnalyticsHelper,  "addProfileAndPayloadInfoWithEventPayload:",  v1);
  +[MCDailyAnalyticsHelper addRestrictionInfoWithEventPayload:]( &OBJC_CLASS___MCDailyAnalyticsHelper,  "addRestrictionInfoWithEventPayload:",  v1);
  +[MCDailyAnalyticsHelper addSettingsInfoWithEventPayload:]( &OBJC_CLASS___MCDailyAnalyticsHelper,  "addSettingsInfoWithEventPayload:",  v1);
  +[MCDailyAnalyticsHelper addPasscodeInfoWithEventPayload:]( &OBJC_CLASS___MCDailyAnalyticsHelper,  "addPasscodeInfoWithEventPayload:",  v1);
  return (NSDictionary *)v1;
}

void sub_100039464(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = a3;
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedBoolForFeature:withRestrictionsDictionary:",  a2,  v5) == 2) {
    unsigned __int8 v6 = &__kCFBooleanTrue;
  }
  else {
    unsigned __int8 v6 = &__kCFBooleanFalse;
  }
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
}

void sub_1000394E4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = a3;
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedBoolForFeature:withRestrictionsDictionary:",  a2,  v5) == 1) {
    unsigned __int8 v6 = &__kCFBooleanTrue;
  }
  else {
    unsigned __int8 v6 = &__kCFBooleanFalse;
  }
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
}

void sub_100039564(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager objectForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "objectForFeature:withRestrictionsDictionary:",  a2,  v5));
  if (v8) {
    id v7 = &__kCFBooleanTrue;
  }
  else {
    id v7 = &__kCFBooleanFalse;
  }
  [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v6];
}

void sub_1000395F8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "intersectedValuesForFeature:withRestrictionsDictionary:",  a2,  v5));
  if (v8) {
    id v7 = &__kCFBooleanTrue;
  }
  else {
    id v7 = &__kCFBooleanFalse;
  }
  [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v6];
}

void sub_10003968C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "valueForFeature:withRestrictionsDictionary:",  a2,  v5));
  id v8 = [v7 unsignedIntValue];

  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v8));
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v6];
}

void sub_100039BC0(id a1)
{
  v4[0] = @"payload_count_airPlayConfiguration";
  v4[1] = @"payload_count_airPrintConfiguration";
  v4[2] = @"payload_count_alwaysOnVPN";
  v4[3] = @"payload_count_apn";
  v4[4] = @"payload_count_appLayerVPN";
  v4[5] = @"payload_count_calDAVAccount";
  v4[6] = @"payload_count_cardDAVAccount";
  v4[7] = @"payload_count_cellular";
  v4[8] = @"payload_count_dnsProxy";
  v4[9] = @"payload_count_dnsSettings";
  v4[10] = @"payload_count_domains";
  v4[11] = @"payload_count_exchangeAccount";
  v4[12] = @"payload_count_educationConfiguration";
  v4[13] = @"payload_count_emailAccount";
  v4[14] = @"payload_count_encryptedProfileService";
  v4[15] = @"payload_count_font";
  uint8_t v4[16] = @"payload_count_globalHTTPProxy";
  v4[17] = @"payload_count_googleAccount";
  v4[18] = @"payload_count_homeScreenLayout";
  v4[19] = @"payload_count_ldapAccount";
  v4[20] = @"payload_count_logging";
  v4[21] = @"payload_count_mdm";
  v4[22] = @"payload_count_networkUsageRules";
  v4[23] = @"payload_count_notificationSettings";
  v4[24] = @"payload_count_passwordPolicy";
  v4[25] = @"payload_count_plainCertificate";
  v4[26] = @"payload_count_restriction";
  v4[27] = @"payload_count_scep";
  v4[28] = @"payload_count_selfsignedcertificate";
  v4[29] = @"payload_count_sharedDeviceConfiguration";
  v4[30] = @"payload_count_singleAppMode";
  v4[31] = @"payload_count_singleSignOnAccount";
  v4[32] = @"payload_count_subCalAccount";
  v4[33] = @"payload_count_supervisionPolicy";
  v4[34] = @"payload_count_vpn";
  v4[35] = @"payload_count_wapiIdentityCertificate";
  v4[36] = @"payload_count_webClip";
  v4[37] = @"payload_count_webContentFilter";
  v4[38] = @"payload_count_wiFiNetwork";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 39LL));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  id v3 = (void *)qword_1000DC060;
  qword_1000DC060 = v2;
}

void sub_100039E24(id a1)
{
  v3[0] = kMCAirPlayPayloadType;
  v3[1] = kMCAirPrintPayloadType;
  v4[0] = @"payload_count_airPlayConfiguration";
  v4[1] = @"payload_count_airPrintConfiguration";
  v3[2] = kMCAlwaysOnVPNPayloadType;
  v3[3] = kMCAPNPayloadType;
  v4[2] = @"payload_count_alwaysOnVPN";
  v4[3] = @"payload_count_apn";
  v3[4] = kMCAppLayerVPNPayloadType;
  v3[5] = kMCCardDAVAccountPayloadType;
  v4[4] = @"payload_count_appLayerVPN";
  v4[5] = @"payload_count_cardDAVAccount";
  v3[6] = kMCCalDAVAccountPayloadType;
  v3[7] = kMCCellularPayloadType;
  v4[6] = @"payload_count_calDAVAccount";
  v4[7] = @"payload_count_cellular";
  v3[8] = kMCChaperonePayloadType;
  v3[9] = kMCCPRootType;
  v4[8] = @"payload_count_supervisionPolicy";
  v4[9] = @"payload_count_plainCertificate";
  v3[10] = kMCCPPKCS12Type;
  v3[11] = kMCCPPKCS1Type;
  v4[10] = @"payload_count_plainCertificate";
  v4[11] = @"payload_count_plainCertificate";
  v3[12] = kMCCPPEMType;
  v3[13] = kMCCWAPIType;
  v4[12] = @"payload_count_plainCertificate";
  v4[13] = @"payload_count_wapiIdentityCertificate";
  v3[14] = kMCDNSProxyPayloadType;
  v3[15] = kMCDNSSettingsPayloadType;
  v4[14] = @"payload_count_dnsProxy";
  v4[15] = @"payload_count_dnsSettings";
  uint8_t v3[16] = kMCDomainsPayloadType;
  v3[17] = kMCEASAccountPayloadType;
  uint8_t v4[16] = @"payload_count_domains";
  v4[17] = @"payload_count_exchangeAccount";
  v3[18] = kMCEncryptedProfileServicePayloadType;
  v3[19] = kMCEmailAccountPayloadType;
  v4[18] = @"payload_count_encryptedProfileService";
  v4[19] = @"payload_count_emailAccount";
  v3[20] = kMCFontPayloadType;
  v3[21] = kMCGlobalHTTPProxyPayloadType;
  v4[20] = @"payload_count_font";
  v4[21] = @"payload_count_globalHTTPProxy";
  v3[22] = kMCGmailAccountLegacyPayloadType;
  v3[23] = kMCGmailAccountPayloadType;
  v4[22] = @"payload_count_googleAccount";
  v4[23] = @"payload_count_googleAccount";
  v3[24] = kMCHomeScreenLayoutPayloadType;
  v3[25] = kMCLDAPAccountPayloadType;
  v4[24] = @"payload_count_homeScreenLayout";
  v4[25] = @"payload_count_ldapAccount";
  v3[26] = kMCLoggingPayloadType;
  v3[27] = kMCMDMPayloadType;
  v4[26] = @"payload_count_logging";
  v4[27] = @"payload_count_mdm";
  v3[28] = kMCNetworkUsageRulesPayloadType;
  v3[29] = kMCNotificationSettingsPayloadType;
  v4[28] = @"payload_count_networkUsageRules";
  v4[29] = @"payload_count_notificationSettings";
  v3[30] = kMCPasswordPolicyPayloadType;
  v3[31] = kMCRestrictionsPayloadType;
  v4[30] = @"payload_count_passwordPolicy";
  v4[31] = @"payload_count_restriction";
  v3[32] = kMCSCEPPayloadType;
  v3[33] = kMCSelfSignedCertificatePayloadType;
  v4[32] = @"payload_count_scep";
  v4[33] = @"payload_count_selfsignedcertificate";
  v3[34] = kMCSharedDeviceConfigurationPayloadType;
  v3[35] = kMCSingleAppPayloadType;
  v4[34] = @"payload_count_sharedDeviceConfiguration";
  v4[35] = @"payload_count_singleAppMode";
  v3[36] = kMCSingleSignOnPayloadType;
  v3[37] = kMCSubCalAccountPayloadType;
  v4[36] = @"payload_count_singleSignOnAccount";
  v4[37] = @"payload_count_subCalAccount";
  v3[38] = kMCVPNPayloadType;
  v3[39] = kMCWebClipPayloadType;
  v4[38] = @"payload_count_vpn";
  void v4[39] = @"payload_count_webClip";
  v3[40] = kMCWebContentFilterPayloadType;
  v3[41] = kMCWiFiPayloadType;
  v4[40] = @"payload_count_webContentFilter";
  v4[41] = @"payload_count_wiFiNetwork";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  42LL));
  uint64_t v2 = (void *)qword_1000DC070;
  qword_1000DC070 = v1;
}

void sub_10003A2D4(id a1)
{
  v3[0] = MCFeatureAccountModificationAllowed;
  v3[1] = MCFeatureActivityContinuationAllowed;
  v4[0] = @"restriction_allowAccountModification";
  v4[1] = @"restriction_allowActivityContinuation";
  v3[2] = MCFeatureAppInstallationAllowed;
  v3[3] = MCFeatureAppRemovalAllowed;
  v4[2] = @"restriction_allowAppInstallation";
  v4[3] = @"restriction_allowAppRemoval";
  v3[4] = MCFeatureAutoCorrectionAllowed;
  v3[5] = MCFeatureBluetoothModificationAllowed;
  v4[4] = @"restriction_allowAutoCorrection";
  v4[5] = @"restriction_allowBluetoothModification";
  v3[6] = MCFeatureCameraAllowed;
  v3[7] = MCFeatureCloudBackupAllowed;
  v4[6] = @"restriction_allowCamera";
  v4[7] = @"restriction_allowCloudBackup";
  v3[8] = MCFeatureCloudDocumentSyncAllowed;
  v3[9] = MCFeatureDefinitionLookupAllowed;
  v4[8] = @"restriction_allowCloudDocumentSync";
  v4[9] = @"restriction_allowDefinitionLookup";
  v3[10] = MCFeatureSelectedTextSharingAllowed;
  v3[11] = MCFeatureDeviceNameModificationAllowed;
  v4[10] = @"restriction_allowSelectedTextSharing";
  v4[11] = @"restriction_allowDeviceNameModification";
  v3[12] = MCFeatureEnablingRestrictionsAllowed;
  v3[13] = MCFeatureEnterpriseAppTrustAllowed;
  v4[12] = @"restriction_allowEnablingRestrictions";
  v4[13] = @"restriction_allowEnterpriseAppTrust";
  v3[14] = MCFeatureEnterpriseBookBackupAllowed;
  v3[15] = MCFeatureEnterpriseBookMetadataSyncAllowed;
  v4[14] = @"restriction_allowEnterpriseBookBackup";
  v4[15] = @"restriction_allowEnterpriseBookMetadataSync";
  uint8_t v3[16] = MCFeatureEraseContentAndSettingsAllowed;
  v3[17] = MCFeatureFingerprintUnlockAllowed;
  uint8_t v4[16] = @"restriction_allowEraseContentAndSettings";
  v4[17] = @"restriction_allowFingerprintForUnlock";
  v3[18] = MCFeatureHostPairingAllowed;
  v3[19] = MCFeatureManagedAppsCloudSyncAllowed;
  v4[18] = @"restriction_allowHostPairing";
  v4[19] = @"restriction_allowManagedAppsCloudSync";
  v3[20] = MCFeatureOpenFromManagedToUnmanagedAllowed;
  v3[21] = MCFeatureOpenFromUnmanagedToManagedAllowed;
  v4[20] = @"restriction_allowOpenFromManagedToUnmanaged";
  v4[21] = @"restriction_allowOpenFromUnmanagedToManaged";
  v3[22] = MCFeaturePairedWatchAllowed;
  v3[23] = MCFeaturePasscodeModificationAllowed;
  v4[22] = @"restriction_allowPairedWatch";
  v4[23] = @"restriction_allowPasscodeModification";
  v3[24] = MCFeaturePasscodeRecoveryAllowed;
  v3[25] = MCFeaturePredictiveKeyboardAllowed;
  v4[24] = @"restriction_allowPasscodeRecovery";
  v4[25] = @"restriction_allowPredictiveKeyboard";
  v3[26] = MCFeatureRemoteScreenObservationAllowed;
  v3[27] = MCFeatureSafariAllowed;
  v4[26] = @"restriction_allowRemoteScreenObservation";
  v4[27] = @"restriction_allowSafari";
  v3[28] = MCFeatureScreenShotAllowed;
  v3[29] = MCFeatureSpellCheckAllowed;
  v4[28] = @"restriction_allowScreenShot";
  v4[29] = @"restriction_allowSpellCheck";
  v3[30] = MCFeatureUIAppInstallationAllowed;
  v3[31] = MCFeatureAppClipsAllowed;
  v4[30] = @"restriction_allowUIAppInstallation";
  v4[31] = @"restriction_allowAppClips";
  v3[32] = MCFeatureUIConfigurationProfileInstallationAllowed;
  v3[33] = MCFeatureUntrustedTLSPromptAllowed;
  v4[32] = @"restriction_allowUIConfigurationProfileInstallation";
  v4[33] = @"restriction_allowUntrustedTLSPrompt";
  v3[34] = MCFeatureUSBRestrictedModeAllowed;
  v3[35] = MCFeatureWallpaperModificationAllowed;
  v4[34] = @"restriction_allowUSBRestrictedMode";
  v4[35] = @"restriction_allowWallpaperModification";
  v3[36] = MCFeatureiPhoneWidgetsOnMacAllowed;
  v3[37] = MCFeatureHiddenAppsAllowed;
  v4[36] = @"restriction_allowiPhoneWidgetsOnMac";
  v4[37] = @"restriction_allowHidingApps";
  v3[38] = MCFeatureLockedAppsAllowed;
  v4[38] = @"restriction_allowLockingApps";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  39LL));
  uint64_t v2 = (void *)qword_1000DC080;
  qword_1000DC080 = v1;
}

void sub_10003A754(id a1)
{
  v3[0] = MCFeatureAirDropUnmanagedForced;
  v3[1] = MCFeatureDelayedSoftwareUpdatesForced;
  v4[0] = @"restriction_forceAirDropUnmanaged";
  v4[1] = @"restriction_forceDelayedSoftwareUpdates";
  v3[2] = MCFeatureEncryptedBackupRequired;
  v3[3] = MCFeatureLimitAdTrackingForced;
  v4[2] = @"restriction_forceEncryptedBackup";
  v4[3] = @"restriction_forceLimitAdTracking";
  v3[4] = MCFeatureUnpairedExternalBootToRecoveryAllowed;
  v3[5] = MCFeatureWatchWristDetectRequired;
  v4[4] = @"restriction_allowUnpairedExternalBootToRecovery";
  v4[5] = @"restriction_forceWatchWristDetection";
  v3[6] = MCFeatureWiFiWhitelistingForced;
  v4[6] = @"restriction_forceWiFiWhitelisting";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
  uint64_t v2 = (void *)qword_1000DC090;
  qword_1000DC090 = v1;
}

void sub_10003A8B0(id a1)
{
  v3[0] = MCFeatureBlacklistedAppBundleIDs;
  v3[1] = MCFeatureAppLockBundleIDs;
  v4[0] = @"restriction_blacklistedAppBundleIDs";
  v4[1] = @"restriction_whitelistedAppBundleIDs";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
  uint64_t v2 = (void *)qword_1000DC0A0;
  qword_1000DC0A0 = v1;
}

void sub_10003A990(id a1)
{
  uint64_t v3 = MCFeatureAutonomousSingleAppModePermittedAppIDs;
  int v4 = @"restriction_autonomousSingleAppModePermittedAppIDs";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
  uint64_t v2 = (void *)qword_1000DC0B0;
  qword_1000DC0B0 = v1;
}

void sub_10003AA58(id a1)
{
  v3[0] = MCFeatureAutoLockTime;
  v3[1] = MCFeatureMinimumPasscodeLength;
  v4[0] = @"restriction_autoLockTime";
  v4[1] = @"restriction_minimumPasscodeLength";
  void v3[2] = MCFeaturePasscodeHistoryCount;
  v3[3] = MCFeaturePasscodeLockGraceTime;
  void v4[2] = @"restriction_passcodeHistory";
  v4[3] = @"restriction_passcodeLockGraceTime";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
  uint64_t v2 = (void *)qword_1000DC0C0;
  qword_1000DC0C0 = v1;
}

void sub_10003AB68(id a1)
{
  v4[0] = @"settings_allowPasscodeRecovery";
  v4[1] = @"settings_allowUSBRestrictedMode";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 2LL));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  uint64_t v3 = (void *)qword_1000DC0D0;
  qword_1000DC0D0 = v2;
}

void sub_10003AC50(id a1)
{
  v3[0] = MCFeaturePasscodeRecoveryAllowed;
  v3[1] = MCFeatureUSBRestrictedModeAllowed;
  v4[0] = @"settings_allowPasscodeRecovery";
  v4[1] = @"settings_allowUSBRestrictedMode";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
  uint64_t v2 = (void *)qword_1000DC0E0;
  qword_1000DC0E0 = v1;
}

void sub_10003AD30(id a1)
{
  v4[0] = @"settings_allowLockdownMode";
  v4[1] = @"settings_forceLimitAdTracking";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 2LL));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  uint64_t v3 = (void *)qword_1000DC0F0;
  qword_1000DC0F0 = v2;
}

void sub_10003AE18(id a1)
{
  uint64_t v3 = MCFeatureLimitAdTrackingForced;
  int v4 = @"settings_forceLimitAdTracking";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
  uint64_t v2 = (void *)qword_1000DC100;
  qword_1000DC100 = v1;
}

LABEL_24:
            __int128 v25 = v96;
          }

          __int128 v27 = [obj countByEnumeratingWithState:&v108 objects:v114 count:16];
        }

        while (v27);
      }

      __int128 v38 = [v25 count];
      __int128 v23 = v91;
      if (v38 != -[NSMutableDictionary count](v95, "count")
        || ([v91 setCertificates:v95] & 1) == 0)
      {
        id v9 = v87;
        unsigned __int8 v19 = v88;
        id v10 = v92;
        uint64_t v11 = v89;
        if (v86)
        {
          v57 = MCRelayErrorDomain;
          v58 = MCErrorArray(@"ERROR_RELAY_INVALID_CERTIFICATE");
          v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
          *v86 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v57,  61001LL,  v59,  MCErrorTypeFatal,  0LL));
        }

        [v88 unlockConfigurations];
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v52 = v93;
        v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v52,  "countByEnumeratingWithState:objects:count:",  &v104,  v113,  16LL);
        if (v60)
        {
          v61 = v60;
          v62 = *(void *)v105;
          do
          {
            for (j = 0LL; j != v61; j = (char *)j + 1)
            {
              if (*(void *)v105 != v62) {
                objc_enumerationMutation(v52);
              }
              v64 = *(void *)(*((void *)&v104 + 1) + 8LL * (void)j);
              v65 = (void *)objc_claimAutoreleasedReturnValue([v92 UUID]);
              -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:]( self,  "_releaseDependencyBetweenPersistentID:andUUID:",  v64,  v65);
            }

            v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v52,  "countByEnumeratingWithState:objects:count:",  &v104,  v113,  16LL);
          }

          while (v61);
          LOBYTE(a6) = 0;
LABEL_73:
          unsigned __int8 v19 = v88;
          uint64_t v11 = v89;
          goto LABEL_74;
        }
}

          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
          [v17 setObject:v27 forKey:v14];
        }
      }
    }

    id v12 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  }

  while (v12);
LABEL_31:

  uint64_t v29 = v33;
  if (-[MCRestrictionManagerWriter applyConfiguration:toDomain:inNamespace:fromSender:]( v33,  "applyConfiguration:toDomain:inNamespace:fromSender:",  v4,  8LL,  0LL,  @"MCRestrictionManagerWriter.memberQueueCacheClientRestrictionPasscodeCompliance")) {
    MCSendClientTruthChangedNotification( -[MCRestrictionManagerWriter memberQueueCommitClientRestrictionsToDisk]( v33,  "memberQueueCommitClientRestrictionsToDisk"));
  }
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID]( v33,  "memberQueueRecomputePasscodeComplianceForClientUUID",  v33));
  id v31 = [v30 count];

  if (v31)
  {
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( -[MCRestrictionManagerWriter memberQueueRecomputePasscodeComplianceForClientUUID]( v29,  "memberQueueRecomputePasscodeComplianceForClientUUID"));
    [v32 removeAllObjects];
  }
}

LABEL_62:
        LOBYTE(a6) = 0;
LABEL_74:
        __int128 v21 = v90;
        goto LABEL_75;
      }

      id v9 = v87;
      unsigned __int8 v19 = v88;
      id v10 = v92;
      uint64_t v11 = v89;
      a6 = v86;
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue([v10 UUID]);
    id v40 = (void *)objc_claimAutoreleasedReturnValue([v10 organization]);
    [v23 setPayloadInfoCommon:v39 payloadOrganization:v40];

    id v41 = objc_claimAutoreleasedReturnValue([v10 relayUUID]);
    if (!v41
      || (v42 = (void *)v41,
          v43 = (void *)objc_claimAutoreleasedReturnValue([v10 relayUUID]),
          v44 = [v23 setPerAppUUID:v43 andSafariDomains:0],
          v43,
          v42,
          (v44 & 1) != 0))
    {
      if ((objc_msgSend(v23, "setRestrictDomains:", objc_msgSend(v10, "restrictDomains")) & 1) == 0)
      {
        v66 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "Could not set relay domain restrictions",  buf,  2u);
        }

        v67 = MCRelayErrorDomain;
        v95 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
        v52 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary displayName](v95, "displayName"));
        v68 = MCErrorArray(@"ERROR_RELAY_COULD_NOT_INSTALL_RESTRICTIONS_DOMAIN");
        v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
        v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v67,  61002LL,  v69,  MCErrorTypeFatal,  v52,  0LL));
        LOBYTE(a6) = v70 != 0LL;

        goto LABEL_74;
      }

      v45 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile UUID](self->_profile, "UUID"));

      if (v46)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile UUID](self->_profile, "UUID"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", v47, kMCPayloadUUIDKey);
      }

      v95 = v45;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile identifier](self->_profile, "identifier"));

      if (v48)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile identifier](self->_profile, "identifier"));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v45,  "setObject:forKeyedSubscript:",  v49,  kMCPayloadIdentifierKey);
      }

      v50 = a6;
      if (v9) {
        -[NSMutableDictionary addEntriesFromDictionary:](v95, "addEntriesFromDictionary:", v9);
      }
      [v23 setProfileInfo:v95];
      [v19 updateDefaultAfterAddingConfiguration];
      v51 = (void *)objc_claimAutoreleasedReturnValue([v23 getConfigurationIdentifier]);
      [v10 setPersistentResourceID:v51];

      v102 = 0LL;
      LOBYTE(a6) = [v19 saveIngestedConfiguration:&v102];
      v52 = (NSMutableArray *)v102;
      __int128 v21 = v90;
      if ((a6 & 1) != 0)
      {
        [v19 unlockConfigurations];
LABEL_75:

        __int128 v23 = v91;
LABEL_76:

LABEL_77:
LABEL_78:

        goto LABEL_79;
      }

      v89 = v11;
      if (v50)
      {
        v75 = [(id)objc_opt_class(self) internalErrorWithUnderlyingError:v52];
        *v50 = (id)objc_claimAutoreleasedReturnValue(v75);
      }

      v88 = v19;
      [v19 unlockConfigurations];
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v76 = v93;
      v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v76,  "countByEnumeratingWithState:objects:count:",  &v98,  v112,  16LL);
      if (v77)
      {
        v78 = v77;
        v79 = *(void *)v99;
        do
        {
          for (k = 0LL; k != v78; k = (char *)k + 1)
          {
            if (*(void *)v99 != v79) {
              objc_enumerationMutation(v76);
            }
            v81 = *(void *)(*((void *)&v98 + 1) + 8LL * (void)k);
            v82 = (void *)objc_claimAutoreleasedReturnValue([v10 UUID]);
            -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:]( v97,  "_releaseDependencyBetweenPersistentID:andUUID:",  v81,  v82);
          }

          v78 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v76,  "countByEnumeratingWithState:objects:count:",  &v98,  v112,  16LL);
        }

        while (v78);
      }

      goto LABEL_73;
    }

    v71 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "Could not configure relay UUID", buf, 2u);
    }

    if (!a6)
    {
      __int128 v21 = v90;
      goto LABEL_76;
    }

    v72 = MCRelayErrorDomain;
    v95 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v52 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary displayName](v95, "displayName"));
    v73 = MCErrorArray(@"ERROR_RELAY_COULD_NOT_INSTALL");
    v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
    *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v72,  61002LL,  v74,  MCErrorTypeFatal,  v52,  0LL));

    goto LABEL_62;
  }

  if (a6)
  {
    uint64_t v15 = MCRelayErrorDomain;
    uint64_t v16 = MCErrorArray(@"ERROR_RELAY_NO_UUID");
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v15,  61003LL,  v17,  MCErrorTypeFatal,  0LL));

    LOBYTE(a6) = 0;
  }

  return v40;
}

LABEL_79:
  return (char)a6;
}

void sub_10003C91C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_10003C944(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003C954(uint64_t a1)
{
}

void sub_10003C95C(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) complete];
}

void sub_10003CC7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10003CCA4(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) complete];
}

void sub_10003CD30(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MCInstaller);
  uint64_t v2 = (void *)qword_1000DC120;
  qword_1000DC120 = (uint64_t)v1;
}

id sub_10003CEFC()
{
  id v0 = (void *)qword_1000DC118;
  if (!qword_1000DC118)
  {
    uint64_t v1 = MCUserProfileStorageDirectory();
    uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
    uint64_t v3 = (void *)qword_1000DC118;
    qword_1000DC118 = v2;

    id v0 = (void *)qword_1000DC118;
  }

  return v0;
}

id sub_10003CF38()
{
  id v0 = (void *)qword_1000DC110;
  if (!qword_1000DC110)
  {
    uint64_t v1 = MCSystemProfileStorageDirectory();
    uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
    uint64_t v3 = (void *)qword_1000DC110;
    qword_1000DC110 = v2;

    id v0 = (void *)qword_1000DC110;
  }

  return v0;
}

id sub_10003D8AC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _queueProfileData:*(void *)(a1 + 40) profile:*(void *)(a1 + 48) forDevice:a2 completion:*(void *)(a1 + 56)];
}

void sub_10003D8C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _targetDeviceErrorWithUnderlyingError:a2]);
  os_log_t v4 = _MCLogObjects[9];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile stringForDeviceType:]( MCProfile,  "stringForDeviceType:",  [v5 targetDeviceType]));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 MCVerboseDescription]);
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2114;
    id v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Profile-defined target-device-type %{public}@ error: %{public}@",  (uint8_t *)&v9,  0x16u);
  }

  (*(void (**)(void, void *, void, id))(*(void *)(a1 + 48) + 16))( *(void *)(a1 + 48),  v3,  *(void *)(a1 + 40),  [*(id *)(a1 + 40) targetDeviceType]);
}

void sub_10003E018(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 56);
    id v4 = (id)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _uiProfileInstallationDisabledTopLevelErrorWithCause:MCErrorRestrictionCauseStolenDeviceProtection]);
    (*(void (**)(uint64_t, id, void, void))(v3 + 16))(v3, v4, *(void *)(a1 + 40), *(void *)(a1 + 64));
  }

  else
  {
    [*(id *)(a1 + 32) _continueQueueingProfile:*(void *)(a1 + 40) profileData:*(void *)(a1 + 48) forDevice:*(void *)(a1 + 64) completion:*(void *)(a1 + 56)];
  }

void sub_10003E418( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t sub_10003E440(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003E450(uint64_t a1)
{
}

void sub_10003E458(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) identifier]);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id obj = *(id *)(v6 + 40);
  [v2 sendPurgatoryProfileData:v3 identifier:v4 targetDevice:v5 outError:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
}

LABEL_48:
      uint64_t v20 = 1;
LABEL_49:

      goto LABEL_50;
    }

    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
    v78 = 0LL;
    [v23 unlockDeviceWithPasscode:v22 outError:&v78];
    unsigned __int8 v19 = v78;

    if (v19) {
      goto LABEL_43;
    }
    v72 = v22;
    v68 = a7;
    v69 = a6;
    v70 = v14;
    objc_storeStrong((id *)&self->_currentlyInstallingRestrictions, a3);
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 effectiveValueForSetting:MCFeaturePasscodeKeyboardComplexity]);
    __int128 v26 = [v25 intValue];

    __int128 v27 = +[MCPasscodeManagerWriter unlockScreenTypeForRestrictions:outSimplePasscodeType:]( &OBJC_CLASS___MCPasscodeManagerWriter,  "unlockScreenTypeForRestrictions:outSimplePasscodeType:",  v13,  &v77);
    if (v27 <= v26) {
      __int128 v28 = v26;
    }
    else {
      __int128 v28 = v27;
    }
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 effectiveValueForSetting:MCFeatureSimplePasscodeComplexity]);
    id v31 = [v30 intValue];

    id v33 = v77;
    if (v77 < v31)
    {
      v77 = v31;
      id v33 = v31;
    }

    if (v33) {
      v34 = 3;
    }
    else {
      v34 = 4;
    }
    if (v33 == 1) {
      __int128 v35 = 7;
    }
    else {
      __int128 v35 = v34;
    }
    if (v28) {
      __int128 v35 = 3;
    }
    v83[0] = @"0";
    if (v28 == 1) {
      __int128 v36 = 5LL;
    }
    else {
      __int128 v36 = v35;
    }
    v82[0] = kMCIDUUIDKey;
    v82[1] = kMCIDTitleKey;
    __int128 v37 = MCLocalizedString(@"NEW_POLICY_ACCEPT_PROMPT_TITLE", v32);
    v73 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v83[1] = v73;
    v82[2] = kMCIDDescriptionKey;
    v39 = MCLocalizedString(@"NEW_POLICY_ACCEPT_PROMPT_DESCRIPTION", v38);
    id v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v83[2] = v40;
    v82[3] = kMCIDRetypeDescriptionKey;
    v42 = MCLocalizedString(@"NEW_POLICY_ACCEPT_RETYPE_DESCRIPTION", v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    v83[3] = v43;
    v82[4] = kMCIDMismatchDescriptionKey;
    v45 = MCLocalizedString(@"NEW_POLICY_ACCEPT_MISMATCH_DESCRIPTION", v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    v83[4] = v46;
    v82[5] = kMCIDFinePrintKey;
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[MCPasscodeManagerWriter localizedDescriptionOfPasscodePolicyFromRestrictions:]( &OBJC_CLASS___MCPasscodeManagerWriter,  "localizedDescriptionOfPasscodePolicyFromRestrictions:",  v13));
    v83[5] = v47;
    v82[6] = kMCIDFieldTypeKey;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v36));
    v82[7] = kMCIDFlagsKey;
    v83[6] = v48;
    v83[7] = &off_1000CBFF8;
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v83,  v82,  8LL));
    v50 = [v49 mutableCopy];

    v67 = v50;
    v80 = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v80, 1LL));
    v81 = v51;
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v81, 1LL));

    v52 = 0LL;
    v53 = kMCIDResponseKey;
    while (1)
    {
      v76 = 0LL;
      v54 = [v15 requestUserInput:v74 delegate:self outResult:&v76];
      v55 = v76;
      v56 = v55;
      if (!v54 || !v55)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue([v70 profile]);
        v63 = (void *)objc_claimAutoreleasedReturnValue([v57 friendlyName]);
        unsigned __int8 v19 = (id)objc_claimAutoreleasedReturnValue( -[MCInstaller _userCancelledErrorWithFriendlyName:]( self,  "_userCancelledErrorWithFriendlyName:",  v63));

        goto LABEL_34;
      }

      if (![v55 count])
      {
        unsigned __int8 v19 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _invalidInputError](self, "_invalidInputError"));
        goto LABEL_35;
      }

      v57 = (void *)objc_claimAutoreleasedReturnValue([v56 objectAtIndex:0]);
      if (![v57 count]) {
        break;
      }
      v58 = (void *)objc_claimAutoreleasedReturnValue([v56 objectAtIndex:0]);
      v59 = (void *)objc_claimAutoreleasedReturnValue([v58 objectAtIndex:0]);
      v60 = (void *)objc_claimAutoreleasedReturnValue([v59 objectForKey:v53]);

      v52 = v60;
      if ((+[MCPasscodeManagerWriter passcode:compliesWithPolicyFromRestrictions:checkHistory:outError:]( &OBJC_CLASS___MCPasscodeManagerWriter,  "passcode:compliesWithPolicyFromRestrictions:checkHistory:outError:",  v60,  v13,  1LL,  0LL) & 1) != 0) {
        goto LABEL_36;
      }
    }

    unsigned __int8 v19 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _invalidInputError](self, "_invalidInputError"));
LABEL_34:

LABEL_35:
    v60 = v52;
    if (v19) {
      goto LABEL_41;
    }
LABEL_36:
    v75 = 0LL;
    [v71 changePasscodeFrom:v72 to:v60 skipRecovery:0 senderBundleID:@"com.apple.managedconfiguration.profiled.MCInstaller" outError:&v75];
    v64 = v75;
    if (v64)
    {
      unsigned __int8 v19 = v64;
    }

    else
    {
      -[MCInstaller _updateCDPWithNewPasscode:passcodeType:]( self,  "_updateCDPWithNewPasscode:passcodeType:",  v60,  v77);
      if (v69)
      {
        v52 = v60;
        unsigned __int8 v19 = 0LL;
        *v69 = v52;
        goto LABEL_41;
      }

      unsigned __int8 v19 = 0LL;
    }

    v52 = v60;
LABEL_41:

    a6 = v69;
    uint64_t v14 = v70;
    a7 = v68;
    v61 = v71;
    __int128 v22 = v72;
    goto LABEL_42;
  }

  uint64_t v20 = 1;
LABEL_50:

  return v20;
}

void sub_10003F400(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)_MCLogObjects[9];
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects[9], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v12 = 134349314;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      id v15 = v4;
      id v7 = "MCInstaller failed to update CDP with new passcode of type %{public}lu with error: %{public}@";
      id v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }

  else if (os_log_type_enabled((os_log_t)_MCLogObjects[9], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 134349056;
    uint64_t v13 = v11;
    id v7 = "MCInstaller successfully updated CDP with new passcode of type: %{public}lu";
    id v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

LABEL_199:
          -[MCInstaller setSetAsideAccountIdentifiersByPayloadClass:]( self,  "setSetAsideAccountIdentifiersByPayloadClass:",  0LL);
          -[MCInstaller setSetAsideDictionariesByPayloadClass:](self, "setSetAsideDictionariesByPayloadClass:", 0LL);
          v203 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
          v204 = (void *)objc_claimAutoreleasedReturnValue(+[MCPayload accountPayloads](&OBJC_CLASS___MCPayload, "accountPayloads"));
          v205 = [v203 containsAnyPayloadOfClasses:v204];

          v206 = (void *)objc_claimAutoreleasedReturnValue([v32 profile]);
          v207 = (void *)objc_claimAutoreleasedReturnValue(+[MCPayload accountPayloads](&OBJC_CLASS___MCPayload, "accountPayloads"));
          v208 = [v206 containsAnyPayloadOfClasses:v207];

          -[MCInstaller _removeOrphanedResourcesOptions:includingAccounts:]( self,  "_removeOrphanedResourcesOptions:includingAccounts:",  v12,  v205 | v208);
          v209 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](&OBJC_CLASS___MCServerSideHacks, "sharedHacks"));
          v210 = (void *)objc_claimAutoreleasedReturnValue([v262 effectiveUserSettings]);
          [v209 recomputeHacksAfterProfileChangesEffectiveUserSettings:v210 sendNotifications:1];

          v211 = [v209 recomputeAccountVPNAssociations];
          v212 = 0LL;
          if (v110)
          {
            v212 = [v263 copy];
          }

          id v31 = v212;

          uint64_t v13 = v245;
          id v33 = obja;
          goto LABEL_202;
        }

        v49 = 0;
LABEL_16:
        if (v256 == 2) {
          v50 = 2LL;
        }
        else {
          v50 = 1LL;
        }
        id v31 = (id)objc_claimAutoreleasedReturnValue( -[MCInstaller _installedProfileWithIdentifier:installationType:]( self,  "_installedProfileWithIdentifier:installationType:",  v263,  v50));
        if (!v31)
        {
          uint64_t v32 = 0LL;
          v52 = v251;
          goto LABEL_30;
        }

        v51 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
        __int128 v35 = (id)objc_claimAutoreleasedReturnValue( -[MCInstaller _guardAgainstNoMDMPayloadWithNewProfile:oldProfile:]( self,  "_guardAgainstNoMDMPayloadWithNewProfile:oldProfile:",  v51,  v31));

        if (v35)
        {
          uint64_t v32 = 0LL;
          v52 = v251;
          goto LABEL_86;
        }

        if (v241)
        {
LABEL_24:
          v53 = _MCLogObjects[5];
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v291 = v263;
            _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Profile “%{public}@” is replacing an existing profile having the same identifier.",  buf,  0xCu);
          }

          uint64_t v32 = [v31 createHandler];
          [v32 setAsideWithInstaller:self];
          v54 = [v31 isInstalledForUser];
          v55 = (void *)objc_claimAutoreleasedReturnValue([v31 identifier]);
          v52 = v251;
          if (v54) {
            v56 = v38;
          }
          else {
            v56 = v251;
          }
          [v56 removeObjectForKey:v55];

LABEL_30:
          v240 = v38;
          if (v256 == 2) {
            v57 = v38;
          }
          else {
            v57 = v52;
          }
          v58 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKey:v263]);

          if (v58)
          {
            v59 = MCInstallationErrorDomain;
            v60 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
            v61 = (void *)objc_claimAutoreleasedReturnValue([v60 friendlyName]);
            v62 = MCErrorArray(@"ERROR_PROFILE_NONUNIQUE_UUID_P_ID");
            v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
            v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v59,  4002LL,  v63,  MCErrorTypeFatal,  v61,  0LL));
            __int128 v35 = [v64 MCCopyAsPrimaryError];

            v52 = v251;
LABEL_84:

LABEL_85:
            __int128 v38 = v240;
LABEL_86:

            v243 = 0LL;
            id v33 = 0LL;
            if (v35) {
              goto LABEL_87;
            }
LABEL_161:
            obja = v33;
            v157 = (void *)objc_claimAutoreleasedReturnValue([v32 profile]);
            v107 = (id)objc_claimAutoreleasedReturnValue([v157 installOptions]);

            v158 = (void *)objc_claimAutoreleasedReturnValue([v32 profile]);
            v159 = [v158 isInstalledForUser];

            if (!v32)
            {
              v175 = [v12 mutableCopy];
              v176 = +[MCProfile newProfileSignatureVersion](&OBJC_CLASS___MCProfile, "newProfileSignatureVersion");
              [v175 setObject:v176 forKeyedSubscript:kMCInstallProfileOptionSignatureVersion];

              v177 = v175;
              v167 = kMCInstallProfileOptionIsCloudProfile;
              goto LABEL_174;
            }

            v160 = _MCLogObjects[5];
            if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v160,  OS_LOG_TYPE_DEBUG,  "Removing profiles that were set aside...",  buf,  2u);
            }

            [v32 removeWithInstaller:self options:0];
            v161 = (void *)objc_claimAutoreleasedReturnValue([v262 currentRestrictions]);
            [v32 didRemoveOldGlobalRestrictions:v260 newGlobalRestrictions:v161];

            v162 = (void *)objc_claimAutoreleasedReturnValue([v32 profile]);
            v163 = (void *)objc_claimAutoreleasedReturnValue([v162 identifier]);

            v164 = (void *)objc_claimAutoreleasedReturnValue( -[MCInstaller _managingProfileIdentifierForProfileIdentifier:]( self,  "_managingProfileIdentifierForProfileIdentifier:",  v163));
            if (v164) {
              [v255 removeDependent:v163 fromParent:v164 inDomain:kMCDMManagingProfileToManagedProfileKey reciprocalDomain:kMCDMManagedProfileToManagingProfileKey fromSystem:v159 ^ 1 user:v159];
            }

            v165 = [v12 mutableCopy];
            v166 = v165;
            if (v241)
            {
              v167 = kMCInstallProfileOptionIsCloudProfile;
              v168 = (void *)objc_claimAutoreleasedReturnValue([v107 objectForKeyedSubscript:kMCInstallProfileOptionIsCloudProfile]);
              v169 = [v168 BOOLValue];

              if (v169)
              {
                v170 = kMCInstallProfileOptionIsCloudLocked;
                v171 = (void *)objc_claimAutoreleasedReturnValue([v107 objectForKeyedSubscript:kMCInstallProfileOptionIsCloudLocked]);
                v172 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v171 BOOLValue]));
                [v166 setObject:v172 forKeyedSubscript:v170];

                v173 = &__kCFBooleanTrue;
                v174 = v166;
LABEL_173:
                [v174 setObject:v173 forKeyedSubscript:v167];
                v178 = +[MCProfile newProfileSignatureVersion](&OBJC_CLASS___MCProfile, "newProfileSignatureVersion");
                [v166 setObject:v178 forKeyedSubscript:kMCInstallProfileOptionSignatureVersion];

                v177 = v166;
LABEL_174:
                v179 = (void *)objc_claimAutoreleasedReturnValue([v177 objectForKeyedSubscript:v167]);
                if ([v179 BOOLValue])
                {
                  v180 = (void *)objc_claimAutoreleasedReturnValue([v177 objectForKeyedSubscript:kMCInstallProfileOptionIsCloudLocked]);
                  v181 = [v180 BOOLValue];

                  if (!v181) {
                    goto LABEL_178;
                  }
                  v182 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
                  [v182 setLocked:1];

                  v179 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
                  [v179 setRemovalPasscode:0];
                }

LABEL_178:
                v183 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
                [v183 setInstallOptions:v177];

                v184 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
                if (v256 == 2) {
                  v185 = sub_10003CEFC();
                }
                else {
                  v185 = sub_10003CF38();
                }
                v186 = (void *)objc_claimAutoreleasedReturnValue(v185);
                [v184 writeStubToDirectory:v186];

                v187 = +[MCProfile thisDeviceType](&OBJC_CLASS___MCProfile, "thisDeviceType");
                if (+[MCTargetDeviceResolver purgatorySupportedForDevice:]( &OBJC_CLASS___MCTargetDeviceResolver,  "purgatorySupportedForDevice:",  v187))
                {
                  -[MCInstaller purgePurgatoryProfileWithIdentifier:targetDevice:]( self,  "purgePurgatoryProfileWithIdentifier:targetDevice:",  v263,  v187);
                  v188 = (void *)objc_claimAutoreleasedReturnValue( [v177 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledInteractively]);
                  v189 = [v188 BOOLValue];

                  if (v189)
                  {
                    v190 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
                    sub_1000650CC(v190, 0);
                  }
                }

                v191 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
                v192 = v191;
                if ((~v253 & 9) != 0) {
                  [v191 addIdentifierToSystemManifest:v263 flag:v253];
                }
                else {
                  [v191 addIdentifierToUserManifest:v263 flag:v253];
                }

                v193 = (void *)objc_claimAutoreleasedReturnValue([v32 profile]);
                if ([v193 containsPayloadOfClass:objc_opt_class(MCDefaultsPayload)])
                {
                }

                else
                {
                  v194 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
                  v195 = [v194 containsPayloadOfClass:objc_opt_class(MCDefaultsPayload)];

                  if (!v195) {
                    goto LABEL_191;
                  }
                }

                notify_post((const char *)[MCDefaultsDidChangeNotification UTF8String]);
LABEL_191:
                v196 = (void *)objc_claimAutoreleasedReturnValue([v32 profile]);
                if ([v196 containsPayloadOfClass:objc_opt_class(MCAppWhitelistPayloadBase)])
                {
                }

                else
                {
                  v197 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
                  v198 = [v197 containsPayloadOfClass:objc_opt_class(MCAppWhitelistPayloadBase)];

                  if (!v198)
                  {
LABEL_196:
                    v202 = _MCLogObjects[5];
                    if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      v291 = v263;
                      _os_log_impl( (void *)&_mh_execute_header,  v202,  OS_LOG_TYPE_DEFAULT,  "Profile “%{public}@” installed.",  buf,  0xCu);
                    }

                    __int128 v35 = 0LL;
                    v110 = 1;
                    goto LABEL_199;
                  }
                }

                buf[0] = 0;
                v199 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](&OBJC_CLASS___MCServerSideHacks, "sharedHacks"));
                v200 = (void *)objc_claimAutoreleasedReturnValue([v262 effectiveUserSettings]);
                [v199 recomputeAppOptionsEffectiveUserSettings:v200 outEffectiveChangeDetected:buf];

                if (buf[0])
                {
                  MCSendAppWhitelistChangedNotification();
                  v201 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](&OBJC_CLASS___MDMClient, "sharedClient"));
                  [v201 retryNotNowResponse];
                }

                goto LABEL_196;
              }

              [v166 setObject:&__kCFBooleanFalse forKeyedSubscript:kMCInstallProfileOptionIsCloudLocked];
            }

            else
            {
              [v165 setObject:&__kCFBooleanFalse forKeyedSubscript:kMCInstallProfileOptionIsCloudLocked];
              v167 = kMCInstallProfileOptionIsCloudProfile;
            }

            v174 = v166;
            v173 = &__kCFBooleanFalse;
            goto LABEL_173;
          }

          v242 = v57;
          v65 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:kMCInstallProfileOptionIsOTAUpdate]);
          v66 = [v65 BOOLValue];

          v67 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
          if (v66)
          {
            v288 = 0LL;
            v68 = (id *)&v288;
            -[MCInstaller _showWarningsForUpdatingProfile:originalProfile:interactionClient:outError:]( self,  "_showWarningsForUpdatingProfile:originalProfile:interactionClient:outError:",  v67,  v31,  v261,  &v288);
          }

          else
          {
            v287 = 0LL;
            v68 = (id *)&v287;
            -[MCInstaller _showWarningsForProfile:interactionClient:outError:]( self,  "_showWarningsForProfile:interactionClient:outError:",  v67,  v261,  &v287);
          }

          __int128 v35 = *v68;

          if (v35) {
            goto LABEL_85;
          }
          v237 = v49;
          v77 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
          v286 = 0LL;
          v78 = (void *)objc_claimAutoreleasedReturnValue([v77 restrictionsWithHeuristicsAppliedOutError:&v286]);
          __int128 v35 = v286;

          if (v35) {
            goto LABEL_117;
          }
          v79 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledInteractively]);
          v80 = [v79 BOOLValue];

          if (v80)
          {
            v82 = objc_claimAutoreleasedReturnValue( +[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "intersectedValuesForFeature:withRestrictionsDictionary:",  MCFeatureAutonomousSingleAppModePermittedAppIDs,  v78));
            if (v82)
            {
              v83 = (void *)v82;
              v84 = MCInstallationErrorDomain;
              v85 = MCErrorArray(@"ERROR_PROFILE_NO_INTERACTIVE_INSTALLATION");
              v86 = (void *)objc_claimAutoreleasedReturnValue(v85);
              __int128 v35 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v84,  4020LL,  v86,  MCErrorTypeFatal,  0LL));

              if (v35) {
                goto LABEL_117;
              }
            }
          }

          v236 = v78;
          if ((obj & 1) == 0)
          {
            if (qword_1000DC138 != -1) {
              dispatch_once(&qword_1000DC138, &stru_1000C38F0);
            }
            if (!os_variant_has_internal_ui( "com.apple.ManagedConfiguration.OverrideProfileValidation",  v81)
              || !CFPreferencesGetAppBooleanValue( @"AllowMDMOnlyPayloadsWithoutMDM",  kMCNotBackedUpPreferencesDomain,  0LL))
            {
              v284 = 0u;
              v285 = 0u;
              v282 = 0u;
              v283 = 0u;
              v87 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
              v88 = (void *)objc_claimAutoreleasedReturnValue([v87 payloads]);

              v230 = [v88 countByEnumeratingWithState:&v282 objects:v297 count:16];
              if (v230)
              {
                v89 = *(void *)v283;
                v238 = kMCInstallProfileOptionPersonaID;
                v90 = &qword_1000DC000;
                v234 = v88;
                v228 = *(void *)v283;
                while (2)
                {
                  v91 = 0LL;
                  do
                  {
                    if (*(void *)v283 != v89) {
                      objc_enumerationMutation(v88);
                    }
                    v232 = v91;
                    v92 = *(void *)(*((void *)&v282 + 1) + 8 * v91);
                    v278 = 0u;
                    v279 = 0u;
                    v280 = 0u;
                    v281 = 0u;
                    objb = (id)v90[38];
                    v93 = [objb countByEnumeratingWithState:&v278 objects:v296 count:16];
                    if (v93)
                    {
                      v94 = v93;
                      v95 = *(void *)v279;
LABEL_64:
                      v96 = 0LL;
                      while (1)
                      {
                        if (*(void *)v279 != v95) {
                          objc_enumerationMutation(objb);
                        }
                        if ((objc_opt_isKindOfClass(v92, *(void *)(*((void *)&v278 + 1) + 8 * v96)) & 1) != 0)
                        {
                          v97 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v238]);

                          if (!v97) {
                            break;
                          }
                        }

                        if (v94 == (id)++v96)
                        {
                          v94 = [objb countByEnumeratingWithState:&v278 objects:v296 count:16];
                          if (v94) {
                            goto LABEL_64;
                          }
                          goto LABEL_71;
                        }
                      }

                      __int128 v35 = (id)objc_claimAutoreleasedReturnValue( +[MCInstaller notInstalledByMDMError]( &OBJC_CLASS___MCInstaller,  "notInstalledByMDMError"));

                      v52 = v251;
                      v78 = v236;
                      if (v35) {
                        goto LABEL_117;
                      }
                      goto LABEL_99;
                    }

LABEL_71:
                    v91 = v232 + 1;
                    v52 = v251;
                    v88 = v234;
                    v89 = v228;
                    v90 = &qword_1000DC000;
                  }

                  while ((id)(v232 + 1) != v230);
                  v230 = [v234 countByEnumeratingWithState:&v282 objects:v297 count:16];
                  if (v230) {
                    continue;
                  }
                  break;
                }
              }
            }
          }

LABEL_99:
          v119 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
          v120 = [v119 isSupervised];

          if (v120)
          {
            v121 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
            v122 = [v121 payloadsWithClass:objc_opt_class(MCMDMPayload)];
            v123 = (void *)objc_claimAutoreleasedReturnValue(v122);
            v124 = (void *)objc_claimAutoreleasedReturnValue([v123 firstObject]);

            if (v124 && [v124 isUserEnrollment])
            {
              v125 = objc_claimAutoreleasedReturnValue(+[MCInstaller deviceIsSupervisedError](&OBJC_CLASS___MCInstaller, "deviceIsSupervisedError"));
LABEL_114:
              __int128 v35 = (id)v125;
            }

            else
            {
              __int128 v35 = 0LL;
            }
          }

          else
          {
            v276 = 0u;
            v277 = 0u;
            v274 = 0u;
            v275 = 0u;
            v126 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
            v124 = (void *)objc_claimAutoreleasedReturnValue([v126 payloads]);

            __int128 v35 = [v124 countByEnumeratingWithState:&v274 objects:v295 count:16];
            if (v35)
            {
              v127 = *(void *)v275;
              while (2)
              {
                for (i = 0LL; i != v35; i = (char *)i + 1)
                {
                  if (*(void *)v275 != v127) {
                    objc_enumerationMutation(v124);
                  }
                  if (-[MCInstaller deviceSupervisionRequiredForPayload:]( self,  "deviceSupervisionRequiredForPayload:",  *(void *)(*((void *)&v274 + 1) + 8LL * (void)i)))
                  {
                    v125 = objc_claimAutoreleasedReturnValue( +[MCInstaller deviceNotSupervisedError]( &OBJC_CLASS___MCInstaller,  "deviceNotSupervisedError"));
                    goto LABEL_114;
                  }
                }

                __int128 v35 = [v124 countByEnumeratingWithState:&v274 objects:v295 count:16];
                if (v35) {
                  continue;
                }
                break;
              }
            }
          }

          v78 = v236;
          if (v35) {
            goto LABEL_117;
          }
          [v242 setObject:v236 forKey:v263];
          v129 = [v12 copy];
          v130 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
          [v130 setInstallOptions:v129];

          v78 = v236;
          v273 = 0LL;
          [v11 stageForInstallationWithInstaller:self interactionClient:v261 outError:&v273];
          __int128 v35 = v273;
          if (v35)
          {
LABEL_117:

            v243 = 0LL;
            id v33 = 0LL;
            goto LABEL_87;
          }

          objc = v11;
          v244 = (void *)objc_claimAutoreleasedReturnValue([v262 currentRestrictions]);
          v131 = (void *)objc_claimAutoreleasedReturnValue([v262 defaultRestrictions]);
          v132 = (void *)objc_claimAutoreleasedReturnValue([v262 systemClientRestrictions]);
          v133 = (void *)objc_claimAutoreleasedReturnValue([v262 userClientRestrictions]);
          v272 = 0LL;
          v134 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter restrictionsWithCurrentRestrictions:defaultRestrictions:systemProfileRestrictions:userProfileRestrictions:systemClientRestrictions:userClientRestrictions:outRestrictionsChanged:outError:]( &OBJC_CLASS___MCRestrictionManagerWriter,  "restrictionsWithCurrentRestrictions:defaultRestrictions:systemProfileRestrictions:userProfi leRestrictions:systemClientRestrictions:userClientRestrictions:outRestrictionsChanged:outError:",  v244,  v131,  v52,  v240,  v132,  v133,  0LL,  &v272));
          __int128 v35 = v272;

          if (v35)
          {

            id v33 = objc;
            if (objc) {
              [objc unstageFromInstallationWithInstaller:self];
            }
            v243 = 0LL;
            goto LABEL_87;
          }

          v270 = 0LL;
          v271 = &stru_1000C4568;
          id v33 = objc;
          -[MCInstaller _promptUserForComplianceWithRestrictions:handler:interactionClient:outPasscode:outError:]( self,  "_promptUserForComplianceWithRestrictions:handler:interactionClient:outPasscode:outError:",  v134,  objc,  v261,  &v271,  &v270);
          v231 = v271;
          v135 = v270;
          if (v135)
          {
            __int128 v35 = v135;
            v229 = 0;
            v243 = 0LL;
            v136 = 2;
            v137 = v240;
          }

          else
          {
            v243 = objc_alloc_init(&OBJC_CLASS___MCKeybagUnlockAssertion);
            v269 = 0LL;
            [objc installWithInstaller:self options:v12 interactionClient:v261 outError:&v269];
            __int128 v35 = v269;
            v138 = [v12 mutableCopy];
            [v138 removeObjectForKey:kMDMPasscodeKey];
            v225 = v138;
            v226 = [v138 copy];

            v229 = v35 == 0LL;
            if (v35)
            {
              v136 = 2;
              v137 = v240;
            }

            else
            {
              v139 = objc_opt_new(&OBJC_CLASS___MCProfileEventsManager);
              v140 = (void *)objc_claimAutoreleasedReturnValue([objc profile]);
              -[MCProfileEventsManager addEventForProfile:operation:source:]( v139,  "addEventForProfile:operation:source:",  v140,  @"install",  v245);

              if (((v241 | v237) & 1) == 0) {
                -[MCInstaller _sendMDMEnrollmentEventWithInstallationOptions:]( self,  "_sendMDMEnrollmentEventWithInstallationOptions:",  v226);
              }
              v141 = (void *)objc_claimAutoreleasedReturnValue([objc profile]);
              v142 = (void *)objc_claimAutoreleasedReturnValue([v141 loggingID]);
              v268 = 0LL;
              [v262 setSystemProfileRestrictions:v251 userProfileRestrictions:v240 sender:v142 outRestrictionsChanged:0 outEffectiveSettingsC hanged:0 outAppWhitelistSettingsChanged:&v289 outRecomputedNag:0 outError:&v268];
              __int128 v35 = v268;

              if (v35)
              {
                v136 = 2;
              }

              else
              {
                v224 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
                if ([v224 isSupervised]
                  && [v224 isTeslaEnrolled]
                  && (v143 = (void *)objc_claimAutoreleasedReturnValue([v226 objectForKey:kMCInstallProfileOptionIsCloudProfile]),
                      v144 = [v143 BOOLValue],
                      v143,
                      v144)
                  && (v145 = (void *)objc_claimAutoreleasedReturnValue([objc profile]),
                      v146 = [v145 containsPayloadOfClass:objc_opt_class(MCMDMPayload)],  v145,  v146))
                {
                  v239 = (void *)objc_claimAutoreleasedReturnValue( +[MCInstaller considerProfilesInstalledDuringBuddyForManagement]( &OBJC_CLASS___MCInstaller,  "considerProfilesInstalledDuringBuddyForManagement"));
                }

                else
                {
                  v239 = 0LL;
                }

                v147 = (void *)objc_claimAutoreleasedReturnValue([v262 currentRestrictions]);
                [objc didInstallOldGlobalRestrictions:v260 newGlobalRestrictions:v147];

                if ([v259 length]
                  && ([v259 isEqualToString:v263] & 1) == 0)
                {
                  [v255 addDependent:v263 ofParent:v259 inDomain:kMCDMManagingProfileToManagedProfileKey reciprocalDomain:kMCDMManagedProfileToManagingProfileKey toSystem:v256 != 2 user:v256 == 2];
                }

                if ([v258 count])
                {
                  v266 = 0u;
                  v267 = 0u;
                  v264 = 0u;
                  v265 = 0u;
                  v148 = v258;
                  v149 = [v148 countByEnumeratingWithState:&v264 objects:v294 count:16];
                  if (v149)
                  {
                    v150 = v149;
                    v151 = *(void *)v265;
                    v235 = kMCDMManagingProfileToManagedProfileKey;
                    v233 = kMCDMManagedProfileToManagingProfileKey;
                    do
                    {
                      for (j = 0LL; j != v150; j = (char *)j + 1)
                      {
                        if (*(void *)v265 != v151) {
                          objc_enumerationMutation(v148);
                        }
                        v153 = *(void **)(*((void *)&v264 + 1) + 8LL * (void)j);
                        if (([v153 isEqualToString:v263] & 1) == 0
                          && ([v239 containsObject:v153] & 1) == 0)
                        {
                          [v255 addDependent:v153 ofParent:v263 inDomain:v235 reciprocalDomain:v233 toSystem:v256 != 2 user:v256 == 2];
                        }
                      }

                      v150 = [v148 countByEnumeratingWithState:&v264 objects:v294 count:16];
                    }

                    while (v150);
                  }
                }

                v154 = +[MCRestrictionManager isWebContentFilterUIActiveWithRestrictionDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "isWebContentFilterUIActiveWithRestrictionDictionary:",  v260);
                v155 = (void *)objc_claimAutoreleasedReturnValue([v262 currentRestrictions]);
                v156 = +[MCRestrictionManager isWebContentFilterUIActiveWithRestrictionDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "isWebContentFilterUIActiveWithRestrictionDictionary:",  v155);

                if (v154 != v156) {
                  MCSendWebContentFilterUIActiveChangedNotification();
                }

                v136 = 0;
                __int128 v35 = 0LL;
              }

              v137 = v240;
              id v33 = objc;
            }

            int v12 = v226;
          }

          if ((v136 | 2) != 2)
          {
            uint64_t v13 = v245;
LABEL_202:
            id v15 = v255;
            v34 = v243;
            goto LABEL_203;
          }

          if (!v35) {
            goto LABEL_161;
          }
          if (v33)
          {
            [v33 unstageFromInstallationWithInstaller:self];
            v254 = v33;
            if (!v229) {
              goto LABEL_87;
            }
          }

          else
          {
            v254 = 0LL;
            if (!v229)
            {
              id v33 = 0LL;
              goto LABEL_87;
            }
          }

          v214 = (void *)objc_claimAutoreleasedReturnValue([v262 currentRestrictions]);
          v252 = [v214 copy];

          v215 = (void *)objc_claimAutoreleasedReturnValue([v262 systemProfileRestrictions]);
          v216 = [v215 MCMutableDeepCopy];

          v217 = (void *)objc_claimAutoreleasedReturnValue([v262 userProfileRestrictions]);
          v227 = v12;
          v218 = [v217 MCMutableDeepCopy];

          if (v256 == 2) {
            v219 = v218;
          }
          else {
            v219 = v216;
          }
          [v219 removeObjectForKey:v263];
          v220 = (void *)objc_claimAutoreleasedReturnValue([v33 profile]);
          v221 = (void *)objc_claimAutoreleasedReturnValue([v220 loggingID]);
          [v262 setSystemProfileRestrictions:v216 userProfileRestrictions:v218 sender:v221 outRestrictionsChanged:0 outEffectiveSettingsChang ed:0 outAppWhitelistSettingsChanged:0 outRecomputedNag:0 outError:0];

          [v33 removeWithInstaller:self options:0];
          v222 = (void *)objc_claimAutoreleasedReturnValue([v262 currentRestrictions]);
          [v33 didRemoveOldGlobalRestrictions:v252 newGlobalRestrictions:v222];

          id v33 = v254;
          int v12 = v227;
LABEL_87:
          obja = v33;
          if (v32) {
            [v32 unsetAside];
          }
          goto LABEL_89;
        }

        v240 = v38;
        v69 = kMCDMManagedProfileToManagingProfileKey;
        v70 = (void *)objc_claimAutoreleasedReturnValue([v15 dependentsOfParent:v263 inDomain:kMCDMManagedProfileToManagingProfileKey]);
        v71 = [v70 count];

        if (!v259 || v71)
        {
          v98 = (void *)objc_claimAutoreleasedReturnValue([v31 identifier]);
          v99 = (void *)objc_claimAutoreleasedReturnValue([v15 dependentsOfParent:v98 inDomain:v69]);
          v100 = [v99 count];

          v101 = obj;
          if (!v100) {
            v101 = 1;
          }
          if ((v101 & 1) == 0)
          {
            v104 = MCMDMErrorDomain;
            v60 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
            v73 = (void *)objc_claimAutoreleasedReturnValue([v60 friendlyName]);
            v105 = MCErrorArray(@"MDM_ERROR_PROFILE_MANAGED_REMOVE_P_ID");
            v103 = (void *)objc_claimAutoreleasedReturnValue(v105);
            v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v104,  12013LL,  v103,  MCErrorTypeFatal,  v73,  0LL));
            __int128 v35 = [v106 MCCopyAsPrimaryError];

            goto LABEL_82;
          }

          if (!v23 || !v100)
          {
            __int128 v38 = v240;
            if (v259) {
              goto LABEL_24;
            }
            v111 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:kMCInstallProfileOptionIsOTAUpdate]);
            v112 = [v111 BOOLValue];

            if ((v112 & 1) != 0) {
              goto LABEL_24;
            }
            v113 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
            v114 = [v31 doesSigningAllowReplacementWithProfile:v113];

            if ((v114 & 1) != 0) {
              goto LABEL_24;
            }
            v115 = MCInstallationErrorDomain;
            v116 = (void *)objc_claimAutoreleasedReturnValue([v31 friendlyName]);
            v117 = MCErrorArray(@"ERROR_MISMATCHED_SIGNERS_P_ID");
            v118 = (void *)objc_claimAutoreleasedReturnValue(v117);
            v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v115,  4008LL,  v118,  MCErrorTypeFatal,  v116,  0LL));

            __int128 v35 = [v60 MCCopyAsPrimaryError];
LABEL_83:
            uint64_t v32 = 0LL;
            v52 = v251;
            goto LABEL_84;
          }

          v72 = MCMDMErrorDomain;
          v60 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
          v73 = (void *)objc_claimAutoreleasedReturnValue([v60 friendlyName]);
          v223 = v73;
          v74 = @"MDM_ERROR_PROFILE_MANAGED_REMOVE_P_ID";
        }

        else
        {
          v72 = MCMDMErrorDomain;
          v60 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
          v73 = (void *)objc_claimAutoreleasedReturnValue([v60 friendlyName]);
          v223 = v73;
          v74 = @"MDM_ERROR_PROFILE_UNMANAGED_REMOVE_P_ID";
        }

        v102 = MCErrorArray(v74);
        v103 = (void *)objc_claimAutoreleasedReturnValue(v102);
        __int128 v35 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v72,  12013LL,  v103,  MCErrorTypeFatal,  v223,  0LL));
LABEL_82:

        goto LABEL_83;
      }

      v241 = 0;
      id v15 = v255;
      __int128 v38 = v43;
    }

    else
    {

      v241 = 0;
    }

    v49 = 1;
    goto LABEL_16;
  }

  uint64_t v30 = _MCLogObjects[9];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Beginning profile assume ownership...",  buf,  2u);
  }

  id v31 = (id)objc_claimAutoreleasedReturnValue( -[MCInstaller _assumeOwnershipProfileHandler:options:source:outError:]( self,  "_assumeOwnershipProfileHandler:options:source:outError:",  v11,  v12,  v13,  a7));
  uint64_t v32 = 0LL;
  id v33 = 0LL;
  v34 = 0LL;
  __int128 v35 = 0LL;
LABEL_203:

  return v31;
}

void sub_100042488(id a1)
{
  v3[0] = objc_opt_class(&OBJC_CLASS___MCDNSProxyPayload);
  v3[1] = objc_opt_class(&OBJC_CLASS___MCNetworkUsageRulesPayload);
  void v3[2] = objc_opt_class(&OBJC_CLASS___MCExtensibleSingleSignOnPayload);
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 3LL));
  uint64_t v2 = (void *)qword_1000DC130;
  qword_1000DC130 = v1;
}

LABEL_51:
  uint32_t v10 = v185;
  __int128 v27 = v193;
LABEL_52:

  uint64_t v30 = 0LL;
  if (v29)
  {
LABEL_53:
    __int128 v35 = v192;
    goto LABEL_90;
  }

LABEL_134:
        v155 = (void *)objc_claimAutoreleasedReturnValue(+[MCActivationUtilities sharedInstance](&OBJC_CLASS___MCActivationUtilities, "sharedInstance"));
        v156 = [v155 isHRNMode];

        if (v156 <= 1)
        {
          v158 = (void *)objc_claimAutoreleasedReturnValue(+[MCPayload hrnRequiredPayloads](&OBJC_CLASS___MCPayload, "hrnRequiredPayloads"));
          v207 = 0u;
          v208 = 0u;
          v209 = 0u;
          v210 = 0u;
          v191 = (id)objc_claimAutoreleasedReturnValue([v193 payloads]);
          v159 = [v191 countByEnumeratingWithState:&v207 objects:v220 count:16];
          if (v159)
          {
            v160 = v159;
            v161 = *(void *)v208;
            while (2)
            {
              for (j = 0LL; j != v160; j = (char *)j + 1)
              {
                if (*(void *)v208 != v161) {
                  objc_enumerationMutation(v191);
                }
                v163 = *(void **)(*((void *)&v207 + 1) + 8LL * (void)j);
                if ([v158 containsObject:objc_opt_class(v163)])
                {
                  v189 = MCInstallationErrorDomain;
                  v164 = (void *)objc_claimAutoreleasedReturnValue([v163 type]);
                  v165 = MCErrorArray(@"ERROR_HRN_REQUIRED_P_TYPE");
                  v166 = (void *)objc_claimAutoreleasedReturnValue(v165);
                  v167 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v189,  4044LL,  v166,  MCErrorTypeFatal,  v164,  0LL));

                  uint64_t v30 = (id)v167;
                  goto LABEL_145;
                }
              }

              v160 = [v191 countByEnumeratingWithState:&v207 objects:v220 count:16];
              if (v160) {
                continue;
              }
              break;
            }
          }

LABEL_145:
          int v12 = v194;
        }

        if (v30)
        {
          v34 = 0LL;
          uint32_t v10 = v186;
          goto LABEL_88;
        }

        v168 = MCLocalizedString(@"INSTALL_STATUS_INSTALLING_PROFILE", v157);
        v169 = (void *)objc_claimAutoreleasedReturnValue(v168);
        [v12 setDefaultStatus:v169];

        v170 = objc_opt_class(&OBJC_CLASS___MCProfileServiceProfileHandler);
        if ((objc_opt_isKindOfClass(v192, v170) & 1) != 0)
        {
          v206 = 0LL;
          -[MCInstaller _showWarningsForProfile:interactionClient:outError:]( self,  "_showWarningsForProfile:interactionClient:outError:",  v193,  v194,  &v206);
          v171 = v206;
          if (v171)
          {
            uint64_t v30 = v171;
            v34 = 0LL;
            goto LABEL_86;
          }

          v204 = 0LL;
          v205 = 0LL;
          v174 = (void *)objc_claimAutoreleasedReturnValue( [v192 fetchFinalProfileWithClient:v194 outProfileData:&v205 outError:&v204]);
          v148 = v205;
          v175 = v204;
          if (v175)
          {
            uint64_t v30 = v175;
            v172 = v192;
            v176 = v193;
LABEL_162:

            v34 = 0LL;
            v192 = v172;
            v193 = v176;
            uint32_t v10 = v186;
            int v12 = v194;
            goto LABEL_163;
          }

          v177 = v174;

          v176 = v177;
          v172 = [v177 createHandler];

          v178 = _MCLogObjects[9];
          if (os_log_type_enabled(v178, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v219 = v176;
            _os_log_impl( (void *)&_mh_execute_header,  v178,  OS_LOG_TYPE_DEBUG,  "Retrieved Final profile: %{public}@",  buf,  0xCu);
          }

          [v22 setObject:&__kCFBooleanTrue forKeyedSubscript:kMCInstallProfileOptionIsOTAInstallation];
          v203 = 0LL;
          v179 = [v176 mayInstallWithOptions:v22 hasInteractionClient:v194 != 0 outError:&v203];
          uint64_t v30 = v203;
          if (!v179) {
            goto LABEL_162;
          }
          if (v194 && ([v194 didBeginInstallingNextProfileData:v148] & 1) == 0)
          {
            v180 = objc_claimAutoreleasedReturnValue([v172 userCancelledError]);

            uint64_t v30 = (id)v180;
            goto LABEL_162;
          }

          v192 = v172;
          v193 = v176;
        }

        else
        {
          uint64_t v30 = 0LL;
          v172 = v192;
        }

        v202 = v30;
        v173 = v172;
        int v12 = v194;
        v34 = objc_claimAutoreleasedReturnValue( -[MCInstaller _installProfileHandler:options:interactionClient:source:outError:]( self,  "_installProfileHandler:options:interactionClient:source:outError:",  v173,  v22,  v194,  v201,  &v202));
        v148 = v30;
        uint64_t v30 = v202;
        uint32_t v10 = v186;
        goto LABEL_163;
      }

      int v12 = v194;
    }

    goto LABEL_134;
  }

  if (v18 == 2) {
    v81 = 9;
  }
  else {
    v81 = 19;
  }
  LODWORD(v190) = v81;
  v82 = objc_opt_class(&OBJC_CLASS___MCHomeScreenLayoutPayload);
  v83 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
  uint64_t v29 = (id)objc_claimAutoreleasedReturnValue( -[MCInstaller existingProfileContainingPayloadClass:inProfilesWithFilterFlags:excludingProfileIdentifier:]( self,  "existingProfileContainingPayloadClass:inProfilesWithFilterFlags:excludingProfileIdentifier:",  v82,  v190,  v83));

  if (!v29)
  {
    __int128 v27 = v193;
    if ((unint64_t)[v193 countOfPayloadsOfClass:objc_opt_class(MCHomeScreenLayoutPayload)] >= 2)
    {
      v190 = (id)MCInstallationErrorDomain;
      v86 = (void *)objc_claimAutoreleasedReturnValue([v193 friendlyName]);
      v87 = MCErrorArray(@"ERROR_PROFILE_MULTIPLE_HOME_SCREEN_LAYOUT_P_ID");
      v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
      v89 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v190,  4027LL,  v88,  MCErrorTypeFatal,  v86,  0LL));

      uint64_t v30 = (id)v89;
      __int128 v27 = v193;
    }

    goto LABEL_73;
  }

  v198 = MCInstallationErrorDomain;
  v64 = (void *)objc_claimAutoreleasedReturnValue([v29 friendlyName]);
  v182 = v64;
  v84 = MCErrorArray(@"ERROR_PROFILE_MULTIPLE_HOME_SCREEN_LAYOUT_P_OLD_ID");
  v66 = (void *)objc_claimAutoreleasedReturnValue(v84);
  v67 = MCErrorTypeFatal;
  v68 = v198;
  v69 = 4027LL;
LABEL_70:
  v85 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v68,  v69,  v66,  v67,  v182,  0LL));

  v34 = 0LL;
  uint64_t v30 = (id)v85;
LABEL_88:
  __int128 v35 = v192;
LABEL_89:
  v109 = v30;

  uint64_t v30 = (id)v34;
  uint64_t v29 = v109;
  __int128 v27 = v193;
LABEL_90:

LABEL_91:
  v110 = [v26 commitChanges];
  if (v30) {
    MCSendProfileListChangedNotification(v110);
  }
  if (v29)
  {
    v111 = v10;
    v112 = MCInstallationErrorDomain;
    v113 = MCErrorArray(@"ERROR_PROFILE_INSTALLATION_FAILED_TITLE");
    v114 = (void *)objc_claimAutoreleasedReturnValue(v113);
    v115 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v112,  4001LL,  v114,  v29,  MCErrorTypeFatal,  0LL));

    v116 = _MCLogObjects[9];
    if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
    {
      v117 = v116;
      v118 = (void *)objc_claimAutoreleasedReturnValue([v115 MCVerboseDescription]);
      *(_DWORD *)buf = 138543362;
      v219 = v118;
      _os_log_impl( (void *)&_mh_execute_header,  v117,  OS_LOG_TYPE_ERROR,  "Installation failed. Error: %{public}@",  buf,  0xCu);
    }

    uint32_t v10 = v111;
    if (a7) {
      *a7 = v115;
    }

    v119 = 0LL;
  }

  else
  {
    v119 = v30;
  }

  return v119;
}

LABEL_29:
            uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _errorUnacceptablePayload:](v31, "_errorUnacceptablePayload:", v13, v31));
            goto LABEL_30;
          }

          if (!v36)
          {
            __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCPayload cellularRequiredPayloads](&OBJC_CLASS___MCPayload, "cellularRequiredPayloads"));
            id v15 = [v14 containsObject:objc_opt_class(v13)];

            if (v15)
            {
              __int128 v27 = _MCLogObjects[9];
              if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_29;
              }
              id v17 = v27;
              __int128 v28 = (objc_class *)objc_opt_class(v13);
              uint64_t v29 = NSStringFromClass(v28);
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v29);
              __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v13 type]);
              *(_DWORD *)buf = 138543618;
              __int128 v38 = v20;
              v39 = 2114;
              id v40 = v21;
              __int128 v22 = "Payload class %{public}@ (%{public}@) requires a cellular-capable Watch";
LABEL_27:
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v22, buf, 0x16u);
LABEL_28:

              goto LABEL_29;
            }
          }
        }

        uint32_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v43 count:16];
        uint64_t v6 = 0LL;
        if (v10) {
          continue;
        }
        break;
      }
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    if (a9 && !EAPOLClientItemIDSetIdentity(v35, 3LL))
    {
      v56 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v52 = v56;
        v57 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543362;
        v64 = v57;
        v54 = v57;
        v55 = "%{public}@ EAPOLClientItemIDSetIdentity() failed";
        goto LABEL_45;
      }
    }

    else
    {
      if (EAPOLClientConfigurationSave(v22))
      {
        __int128 v28 = 1;
LABEL_47:
        CFRelease(v35);
        id v17 = v62;
LABEL_48:
        CFRelease(v24);
        uint64_t v16 = v61;
LABEL_49:
        CFRelease(v22);
        goto LABEL_50;
      }

      v51 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v52 = v51;
        v53 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543362;
        v64 = v53;
        v54 = v53;
        v55 = "%{public}@ EAPOLClientConfigurationSave() failed";
LABEL_45:
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, v55, buf, 0xCu);
      }
    }

        id v4 = (char *)v4 + 1;
      }

      while (v38 != v4);
      __int128 v28 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
      __int128 v38 = v28;
    }

    while (v28);
  }

  uint64_t v29 = [v35 copy];
  uint64_t v30 = (void *)qword_1000DC1A0;
  qword_1000DC1A0 = (uint64_t)v29;

  id v31 = [v34 copy];
  uint64_t v32 = (void *)qword_1000DC1C0;
  qword_1000DC1C0 = (uint64_t)v31;
}

        uint32_t v10 = 0;
LABEL_30:
        CFRelease(v5);
        goto LABEL_31;
      }

      __int128 v25 = _MCLogObjects[0];
      if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      __int128 v22 = v25;
      __int128 v37 = 138543362;
      __int128 v38 = (id)objc_opt_class(self);
      __int128 v23 = v38;
      __int128 v24 = "%{public}@ metadata validation failed";
    }

    else
    {
      __int128 v21 = _MCLogObjects[0];
      if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      __int128 v22 = v21;
      __int128 v37 = 138543362;
      __int128 v38 = (id)objc_opt_class(self);
      __int128 v23 = v38;
      __int128 v24 = "%{public}@ failed to find EAP profile";
    }

LABEL_30:
  }

  return v6;
}

void sub_100045260(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[MCPayload remoteQueueableWatchPayloadClasses](&OBJC_CLASS___MCPayload, "remoteQueueableWatchPayloadClasses"));
  uint64_t v2 = (void *)qword_1000DC140;
  qword_1000DC140 = v1;
}

LABEL_21:
    __int128 v27 = 0LL;
    os_log_t v18 = 0LL;
    uint64_t v29 = 0LL;
LABEL_41:
    v50 = _MCLogObjects[5];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v62 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "Removed profile “%{public}@” from manifest anyway",  buf,  0xCu);
    }

    goto LABEL_43;
  }

  os_log_t v18 = (void *)v31;
  if (+[MCTargetDeviceResolver purgatorySupportedForDevice:]( &OBJC_CLASS___MCTargetDeviceResolver,  "purgatorySupportedForDevice:",  a6))
  {
    -[MCInstaller purgePurgatoryProfileWithIdentifier:targetDevice:]( self,  "purgePurgatoryProfileWithIdentifier:targetDevice:",  v14,  a6);
  }

  __int128 v27 = 0LL;
  uint64_t v29 = 0LL;
LABEL_43:
  v51 = (void *)objc_claimAutoreleasedReturnValue([v29 profile]);

  return v51;
}
}

void sub_100048644( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10004865C(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100048890( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t sub_1000488AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 installOptions]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM]);
  unsigned __int8 v6 = [v5 BOOLValue];

  if ((v6 & 1) != 0)
  {
    unsigned int v7 = 0;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    else {
      unsigned int v7 = [v3 containsOnlyPayloadsOfClasses:*(void *)(a1 + 40)];
    }
  }

  uint64_t v9 = v7 & [v3 isInstalledForSystem];

  return v9;
}

uint64_t sub_10004896C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 installOptions]);
  uint64_t v5 = kMCInstallProfileOptionIsInstalledByMDM;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM]);
  unsigned __int8 v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    id v8 = [v4 mutableCopy];
    [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:v5];
    [v8 setObject:a1[4] forKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier];
    if (v8)
    {
      id v9 = [v8 copy];
      [v3 setInstallOptions:v9];

      uint64_t v11 = MCSystemProfileStorageDirectory(v10);
      int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      [v3 writeStubToDirectory:v12];
    }

    uint64_t v13 = (void *)a1[5];
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    [v13 addObject:v14];

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    [v15 addDependent:v16 ofParent:a1[4] inDomain:kMCDMManagingProfileToManagedProfileKey reciprocalDomain:kMCDMManagedProfileToManagingProfileKey];

    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }

  return 1LL;
}

void sub_100048FB8(void *a1)
{
  uint64_t v2 = (void *)a1[5];
  id v3 = *(dispatch_queue_s **)(a1[4] + 16LL);
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_10004903C;
  block[3] = &unk_1000C3988;
  block[1] = 3221225472LL;
  id v4 = v2;
  uint64_t v5 = a1[4];
  id v7 = v4;
  uint64_t v8 = v5;
  uint64_t v9 = a1[6];
  dispatch_sync(v3, block);
}

id sub_10004903C(uint64_t a1)
{
  return [*(id *)(a1 + 40) purgePurgatoryProfilesForTargetDevice:*(void *)(a1 + 48)];
}

id sub_100049540(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgatoryWorkerQueue_didPurgePurgatory:", 1);
}

uint64_t sub_100049A70()
{
  return 0LL;
}

uint64_t sub_100049A78()
{
  return 0LL;
}

LABEL_34:
}

uint64_t sub_10004E460(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10004E55C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, BOOL, id))(v4 + 16))(v4, [a2 count] != 0, v5);
}

void sub_10004E88C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
  {
    uint64_t v1 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "Checking for any MDM NotNow response to retry...",  v3,  2u);
    }

    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](&OBJC_CLASS___MDMClient, "sharedClient"));
    [v2 retryNotNowResponse];
  }

uint64_t sub_10004EC38(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t sub_10004EC48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10004EEDC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  unsigned __int8 v6 = *(void **)(a1 + 32);
  if (v6)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004EF94;
    block[3] = &unk_1000C3A28;
    id v11 = v6;
    int v12 = a2;
    id v10 = v5;
    dispatch_async(v8, block);
  }
}

uint64_t sub_10004EF94(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(unsigned int *)(a1 + 48),  *(void *)(a1 + 32));
}

void sub_10004EFA8(uint64_t a1, int a2, void *a3)
{
  id v16 = a3;
  switch(a2)
  {
    case 0:
      id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
      goto LABEL_5;
    case 1:
    case 2:
      id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
LABEL_5:
      v5();
      goto LABEL_8;
    case 3:
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v13 = MCFeaturePromptErrorDomain;
      uint64_t v14 = MCErrorArray(@"FEATURE_PROMPT_CANCELED");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v14);
      uint64_t v10 = MCErrorTypeFatal;
      uint64_t v11 = v13;
      uint64_t v12 = 50000LL;
      goto LABEL_7;
    default:
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = MCFeaturePromptErrorDomain;
      uint64_t v8 = MCErrorArray(@"FEATURE_PROMPT_INVALID_RESPONSE");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v10 = MCErrorTypeFatal;
      uint64_t v11 = v7;
      uint64_t v12 = 50001LL;
LABEL_7:
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v11,  v12,  v9,  v10,  0LL,  v16));
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0LL, v15);

LABEL_8:
      return;
  }

void sub_10004F27C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10004F32C;
    v7[3] = &unk_1000C2C40;
    id v9 = v4;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t sub_10004F32C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t sub_10004F33C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_46:
    __int128 v28 = 0;
    goto LABEL_47;
  }

  __int128 v25 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    __int128 v26 = v25;
    *(_DWORD *)buf = 138543362;
    v64 = (id)objc_opt_class(self);
    __int128 v27 = v64;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL",  buf,  0xCu);
  }

  __int128 v28 = 0;
LABEL_50:

  return v28;
}

  return v11;
}

                __int128 v24 = 0;
                goto LABEL_47;
              }

              id v41 = _MCLogObjects[0];
              if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
                goto LABEL_46;
              }
              v42 = v41;
              v49 = 138543362;
              v50 = (id)objc_opt_class(self);
              v43 = v50;
              v44 = "%{public}@ EAPOLClientConfigurationSetSystemEthernetProfile() failed";
            }

LABEL_33:
        v43 = (void *)qword_1000DC000;
        qword_1000DC000 = 0LL;

LABEL_34:
        CFRelease(v5);
        goto LABEL_35;
      }

      uint64_t v32 = _MCLogObjects[0];
      if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      id v33 = v32;
      v34 = (void *)objc_opt_class(self);
      *(_DWORD *)v47 = 138543362;
      *(void *)&v47[4] = v34;
      __int128 v35 = v34;
      __int128 v36 = "%{public}@ metadata validation failed";
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v36, v47, 0xCu);

      goto LABEL_33;
    }

LABEL_28:
    v39 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    id v33 = v39;
    id v40 = (void *)objc_opt_class(self);
    *(_DWORD *)v47 = 138543362;
    *(void *)&v47[4] = v40;
    __int128 v35 = v40;
    __int128 v36 = "%{public}@ failed to find EAP profile";
    goto LABEL_32;
  }

  uint64_t v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = v13;
    *(_DWORD *)v47 = 138543362;
    *(void *)&v47[4] = objc_opt_class(self);
    id v15 = *(id *)&v47[4];
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL",  v47,  0xCu);
  }

    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v37, 0xCu);

    goto LABEL_29;
  }

  uint64_t v7 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    id v8 = v7;
    __int128 v37 = 138543362;
    __int128 v38 = (id)objc_opt_class(self);
    id v9 = v38;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL",  (uint8_t *)&v37,  0xCu);
  }

  uint64_t v10 = 0;
LABEL_31:

  return v10;
}

LABEL_35:
}

  return v30;
}
        }

        __int128 v37 = [obj countByEnumeratingWithState:&v99 objects:v105 count:16];
      }

      while (v37);
    }

    v48 = [v93 count];
    if (v48 != -[NSMutableDictionary count](v92, "count") || ![v87 setCertificates:v92])
    {
      v65 = MCWebContentFilterErrorDomain;
      v66 = MCErrorArray(@"ERROR_CONTENT_FILTER_INVALID_CERTIFICATE");
      v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
      __int128 v35 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v65,  40001LL,  v67,  MCErrorTypeFatal,  0LL));

      a6 = v85;
      id v8 = v86;
      id v9 = v89;
      uint64_t v20 = v83;
      os_log_t v18 = v84;
      __int128 v24 = v87;
      goto LABEL_54;
    }

    a6 = v85;
    id v8 = v86;
    id v9 = v89;
    uint64_t v20 = v83;
    os_log_t v18 = v84;
    __int128 v24 = v87;
  }

  [v24 setPayloadInfoIdentity:v20];
  v49 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
  v50 = (void *)objc_claimAutoreleasedReturnValue([v9 organization]);
  [v24 setPayloadInfoCommon:v49 payloadOrganization:v50];

  v51 = objc_claimAutoreleasedReturnValue([v9 contentFilterUUID]);
  v52 = v24;
  if (!v51
    || (v53 = (void *)v51,
        v54 = (void *)objc_claimAutoreleasedReturnValue([v9 contentFilterUUID]),
        v55 = [v24 setPerAppUUID:v54 andSafariDomains:0],
        v54,
        v53,
        (v55 & 1) != 0))
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v57 = (void *)objc_claimAutoreleasedReturnValue([v56 profile]);

    if (v57)
    {
      v58 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v59 = (void *)objc_claimAutoreleasedReturnValue([v57 UUID]);

      if (v59)
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue([v57 UUID]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v58, "setObject:forKeyedSubscript:", v60, kMCPayloadUUIDKey);
      }

      v61 = (void *)objc_claimAutoreleasedReturnValue([v57 identifier]);

      if (v61)
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue([v57 identifier]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v58,  "setObject:forKeyedSubscript:",  v62,  kMCPayloadIdentifierKey);
      }

      if (v8) {
        -[NSMutableDictionary addEntriesFromDictionary:](v58, "addEntriesFromDictionary:", v8);
      }
      [v52 setProfileInfo:v58];
    }

    [v18 updateDefaultAfterAddingConfiguration];
    __int128 v24 = v52;
    v63 = objc_claimAutoreleasedReturnValue([v52 getConfigurationIdentifier]);
    [v9 setPersistentResourceID:v63];

    v98 = 0LL;
    LOBYTE(v63) = [v18 saveIngestedConfiguration:&v98];
    __int128 v35 = v98;
    if ((v63 & 1) == 0)
    {
      v64 = objc_claimAutoreleasedReturnValue( +[MCWebContentFilterPayloadHandler internalErrorWithUnderlyingError:]( &OBJC_CLASS___MCWebContentFilterPayloadHandler,  "internalErrorWithUnderlyingError:",  v35));

      __int128 v35 = (id)v64;
    }

LABEL_54:
    [v18 unlockConfigurations];

    if (v35)
    {
      if (a6) {
        *a6 = v35;
      }
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v68 = v90;
      v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v68,  "countByEnumeratingWithState:objects:count:",  &v94,  v104,  16LL);
      if (v69)
      {
        v70 = v69;
        v71 = *(void *)v95;
        do
        {
          for (j = 0LL; j != v70; j = (char *)j + 1)
          {
            if (*(void *)v95 != v71) {
              objc_enumerationMutation(v68);
            }
            v73 = *(void *)(*((void *)&v94 + 1) + 8LL * (void)j);
            v74 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
            -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:]( self,  "_releaseDependencyBetweenPersistentID:andUUID:",  v73,  v74);
          }

          v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v68,  "countByEnumeratingWithState:objects:count:",  &v94,  v104,  16LL);
        }

        while (v70);
      }

LABEL_65:
      uint64_t v30 = 0;
      goto LABEL_66;
    }

    goto LABEL_12;
  }

  v76 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_ERROR,  "Could not configure content filter UUID",  buf,  2u);
  }

  v77 = MCWebContentFilterErrorDomain;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v79 = (void *)objc_claimAutoreleasedReturnValue([v78 displayName]);
  v80 = MCErrorArray(@"ERROR_CONTENT_FILTER_COULD_NOT_INSTALL");
  v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
  v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v77,  40002LL,  v81,  MCErrorTypeFatal,  v79,  0LL));
  uint64_t v30 = v82 != 0LL;

LABEL_66:
  return v30;
}

LABEL_22:
          CFRelease(v6);
          goto LABEL_23;
        }

        uint64_t v20 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
          goto LABEL_22;
        }
        id v17 = v20;
        __int128 v23 = 138543362;
        __int128 v24 = (id)objc_opt_class(self);
        os_log_t v18 = v24;
        unsigned __int8 v19 = "%{public}@ metadata validation failed";
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v23, 0xCu);

        goto LABEL_22;
      }
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 ssid]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v15 dataUsingEncoding:4]);

      ProfileWithWLANDomain = EAPOLClientConfigurationGetProfileWithWLANSSID(v6, v8);
      if (ProfileWithWLANDomain) {
        goto LABEL_4;
      }
    }

    id v16 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    id v17 = v16;
    __int128 v23 = 138543362;
    __int128 v24 = (id)objc_opt_class(self);
    os_log_t v18 = v24;
    unsigned __int8 v19 = "%{public}@ failed to find EAP Profile";
    goto LABEL_21;
  }

  uint64_t v12 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = v12;
    __int128 v23 = 138543362;
    __int128 v24 = (id)objc_opt_class(self);
    uint64_t v14 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL",  (uint8_t *)&v23,  0xCu);
  }

void sub_100052CC0()
{
  id v0 = (os_log_s *)_MCLogObjects[0];
  if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEBUG,  "eapolConfigurationAPIEnabled: returning FALSE",  v1,  2u);
  }

LABEL_190:
                  CFRelease(v52);
                  __int128 v26 = 0LL;
                  v173 = 0LL;
                  v174 = 0LL;
                  v47 = 0LL;
                  v48 = 1;
                  v49 = 1;
                  id v8 = v169;
                  goto LABEL_131;
                }

                if (!SCNetworkServiceEstablishDefaultConfiguration(v59))
                {
                  v118 = _MCLogObjects[0];
                  if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
                    goto LABEL_190;
                  }
                  *(_WORD *)buf = 0;
                  v119 = "MCNewWiFiPayloadHandler cannot establish new service.";
LABEL_189:
                  _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_ERROR, v119, buf, 2u);
                  goto LABEL_190;
                }

                if (!SCNetworkServiceRemove(v54))
                {
                  v118 = _MCLogObjects[0];
                  if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
                    goto LABEL_190;
                  }
                  *(_WORD *)buf = 0;
                  v119 = "MCNewWiFiPayloadHandler cannot remove old service.";
                  goto LABEL_189;
                }

                if (!SCNetworkSetAddService(ValueAtIndex, v39))
                {
                  v118 = _MCLogObjects[0];
                  if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
                    goto LABEL_190;
                  }
                  *(_WORD *)buf = 0;
                  v119 = "MCNewWiFiPayloadHandler cannot add new service.";
                  goto LABEL_189;
                }
              }
            }

LABEL_82:
            ++v53;
          }

          while (v53 < CFArrayGetCount(v52));
          CFRelease(v52);
          id v15 = v160;
          if (!v39)
          {
LABEL_100:
            set = 0LL;
            v174 = 0LL;
            goto LABEL_113;
          }

          v61 = v39;
        }

        CFRelease(v61);
        goto LABEL_100;
      }
    }

LABEL_92:
      id v8 = v169;
      v47 = set;
      CFRelease(v32);
      __int128 v26 = 0LL;
      v173 = 0LL;
      goto LABEL_63;
    }

    service = v35;
    id v33 = v39;
LABEL_50:
    if (!SCNetworkSetAddService(set, v39))
    {
      v65 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler cannot add new service.",  buf,  2u);
      }

      v39 = v33;
      goto LABEL_92;
    }

    ++v34;
  }

  while (v34 < CFArrayGetCount(v32));
  if (v33 && service)
  {
    ServiceOrder = SCNetworkSetGetServiceOrder(v174);
    if (ServiceOrder) {
      MutableCopy = CFArrayCreateMutableCopy(0LL, 0LL, ServiceOrder);
    }
    else {
      MutableCopy = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    }
    v67 = MutableCopy;
    Count = CFArrayGetCount(MutableCopy);
    ServiceID = SCNetworkServiceGetServiceID(service);
    v182.location = 0LL;
    v182.length = Count;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v67, v182, ServiceID);
    if (FirstIndexOfValue == -1)
    {
      v73 = _MCLogObjects[0];
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v179 = v67;
        v180 = 2114;
        v181 = ServiceOrder;
        v74 = "MCNewWiFiPayloadHandler failed to set service order: %{public}@. Maintaining old order: %{public}@";
        v75 = v73;
        v76 = OS_LOG_TYPE_ERROR;
        v77 = 22;
LABEL_107:
        _os_log_impl((void *)&_mh_execute_header, v75, v76, v74, buf, v77);
      }
    }

    else
    {
      v71 = FirstIndexOfValue;
      v72 = SCNetworkServiceGetServiceID(v33);
      CFArraySetValueAtIndex(v67, v71, v72);
      SCNetworkSetSetServiceOrder(set, v67);
      v73 = _MCLogObjects[0];
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v179 = v67;
        v74 = "MCNewWiFiPayloadHandler set service order: %{public}@";
        v75 = v73;
        v76 = OS_LOG_TYPE_DEFAULT;
        v77 = 12;
        goto LABEL_107;
      }
    }

    v64 = v165;

    CFRelease(v67);
    CFRelease(v32);
    v63 = v166;
LABEL_109:
    CFRelease(v33);
  }

  else
  {
    CFRelease(v32);
    v64 = v165;
    v63 = v166;
    if (v33) {
      goto LABEL_109;
    }
  }

  v78 = SCNetworkSetGetSetID(set);
  WiFiNetworkSetProperty(v63, v64, v78);
  v79 = _MCLogObjects[0];
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v179 = (id)v78;
    _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler set system configuration set ID: %{public}@",  buf,  0xCu);
  }

  id v15 = 0LL;
  ValueAtIndex = set;
LABEL_113:
  v80 = (const __CFArray *)WiFiManagerClientCopyDevices(self->_manager, v60);
  v161 = v15;
  if (v80)
  {
    v81 = v80;
    if (CFArrayGetCount(v80))
    {
      v82 = CFArrayGetValueAtIndex(v81, 0LL);
      InterfaceName = WiFiDeviceClientGetInterfaceName(v82);
      servicea = (SCNetworkServiceRef)objc_claimAutoreleasedReturnValue(InterfaceName);
    }

    else
    {
      servicea = 0LL;
    }

    CFRelease(v81);
  }

  else
  {
    servicea = 0LL;
  }

  v84 = SCNetworkSetCopyServices(ValueAtIndex);
  if (!v84) {
    goto LABEL_127;
  }
  v85 = v84;
  if (CFArrayGetCount(v84) < 1)
  {
LABEL_126:
    CFRelease(v85);
    goto LABEL_127;
  }

  v86 = 0LL;
  while (1)
  {
    v87 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v85, v86);
    v88 = SCNetworkServiceGetInterface(v87);
    if (-[__CFString isEqualToString:]( (id)SCNetworkInterfaceGetInterfaceType(v88),  "isEqualToString:",  kSCNetworkInterfaceTypeIEEE80211)) {
      break;
    }
LABEL_125:
    if (++v86 >= CFArrayGetCount(v85)) {
      goto LABEL_126;
    }
  }

  BSDName = SCNetworkInterfaceGetBSDName(v88);
  v90 = (void *)objc_claimAutoreleasedReturnValue(BSDName);
  if (![v90 isEqualToString:servicea])
  {

    goto LABEL_125;
  }

  v102 = _MCLogObjects[0];
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v179 = servicea;
    _os_log_impl( (void *)&_mh_execute_header,  v102,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler found WiFi service matching interface name: %{public}@",  buf,  0xCu);
  }

  v103 = (const __SCNetworkService *)CFRetain(v87);
  CFRelease(v85);
  if (!v103)
  {
LABEL_127:
    v91 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler could not find WiFi service in system configuration.",  buf,  2u);
    }

    v173 = 0LL;
    __int128 v26 = 0LL;
    v48 = 1;
    v49 = 1;
    id v8 = v169;
    v47 = set;
    goto LABEL_130;
  }

  v104 = SCNetworkSetGetServiceOrder(ValueAtIndex);
  v105 = (void *)objc_claimAutoreleasedReturnValue(v104);
  v106 = v103;
  v107 = v105;
  v173 = v106;
  if (([v105 containsObject:SCNetworkServiceGetServiceID(v106)] & 1) == 0)
  {
    v157 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v157 handleFailureInMethod:v162, self, @"MCNewWiFiPayloadHandler.m", 999, @"MCNewWiFiPayloadHandler's new WiFi service %@ isn't in the new network set", v173 object file lineNumber description];
  }

  id v8 = v169;
  v108 = (void *)objc_claimAutoreleasedReturnValue([v169 qosMarkingConfig]);
  if ([v108 count] && !SCNetworkInterfaceSetQoSMarkingPolicy(v88, v108))
  {
    v117 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v117,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler could not set WiFi service QoS Marking Policy in system configuration.",  buf,  2u);
    }

    __int128 v26 = 0LL;
    v48 = 1;
    v49 = 1;
    goto LABEL_238;
  }

  __int128 v26 = SCNetworkServiceCopyProtocol(v173, kSCEntNetProxies);
  if (v26)
  {
    v109 = [v169 proxyType];
    if (v109 == 1)
    {
      v163 = v108;
      v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      v121 = (void *)objc_claimAutoreleasedReturnValue([v169 proxyPACURLString]);

      if (v121)
      {
        [v120 setObject:&off_1000CC040 forKeyedSubscript:kSCPropNetProxiesProxyAutoConfigEnable];
        v122 = (void *)objc_claimAutoreleasedReturnValue([v169 proxyPACURLString]);
        [v120 setObject:v122 forKeyedSubscript:kSCPropNetProxiesProxyAutoConfigURLString];

        else {
          v123 = &off_1000CC058;
        }
        [v120 setObject:v123 forKeyedSubscript:kSCPropNetProxiesFallBackAllowed];
        v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
        v125 = v120;
        v110 = (os_log_t)v120;
      }

      else
      {
        v110 = (os_log_t)v120;
        [v120 setObject:&off_1000CC040 forKeyedSubscript:kSCPropNetProxiesProxyAutoDiscoveryEnable];
        else {
          v129 = &off_1000CC058;
        }
        [v120 setObject:v129 forKeyedSubscript:kSCPropNetProxiesFallBackAllowed];
        v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
        v125 = v120;
      }

      [v125 setObject:v124 forKey:@"HTTPProxyType"];

      v108 = v163;
    }

    else if (v109 == 2)
    {
      v110 = (os_log_t)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      v111 = (void *)objc_claimAutoreleasedReturnValue([v169 proxyServer]);

      if (v111)
      {
        v112 = (void *)objc_claimAutoreleasedReturnValue([v169 proxyServer]);
        -[os_log_s setObject:forKey:](v110, "setObject:forKey:", v112, kSCPropNetProxiesHTTPProxy);

        v113 = (void *)objc_claimAutoreleasedReturnValue([v169 proxyServer]);
        -[os_log_s setObject:forKey:](v110, "setObject:forKey:", v113, kSCPropNetProxiesHTTPSProxy);
      }

      v114 = (void *)objc_claimAutoreleasedReturnValue([v169 proxyServerPort]);
      if (v114)
      {
        -[os_log_s setObject:forKey:](v110, "setObject:forKey:", v114, kSCPropNetProxiesHTTPPort);
      }

      else
      {
        v126 = v110;
        v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 80LL));
        -[os_log_s setObject:forKey:](v126, "setObject:forKey:", v127, kSCPropNetProxiesHTTPPort);

        v110 = v126;
      }

      v128 = (void *)objc_claimAutoreleasedReturnValue([v169 proxyServerPort]);
      if (v128)
      {
        -[os_log_s setObject:forKey:](v110, "setObject:forKey:", v128, kSCPropNetProxiesHTTPSPort);
      }

      else
      {
        v130 = v110;
        v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 80LL));
        -[os_log_s setObject:forKey:](v130, "setObject:forKey:", v131, kSCPropNetProxiesHTTPSPort);

        v110 = v130;
      }

      v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
      -[os_log_s setObject:forKey:](v110, "setObject:forKey:", v132, kSCPropNetProxiesHTTPEnable);

      v133 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
      -[os_log_s setObject:forKey:](v110, "setObject:forKey:", v133, kSCPropNetProxiesHTTPSEnable);

      v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
      -[os_log_s setObject:forKey:](v110, "setObject:forKey:", v134, @"HTTPProxyType");
    }

    else
    {
      v110 = (os_log_t)-[__CFDictionary mutableCopy](SCNetworkProtocolGetConfiguration(v26), "mutableCopy");
    }

    v135 = (void *)objc_claimAutoreleasedReturnValue([v169 proxyUsername]);
    if (v135)
    {

      goto LABEL_210;
    }

    v136 = (void *)objc_claimAutoreleasedReturnValue([v169 proxyPassword]);

    if (v136)
    {
LABEL_210:
      v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
      -[os_log_s setObject:forKey:](v110, "setObject:forKey:", v137, @"HTTPProxyAuthenticated");

      v138 = objc_claimAutoreleasedReturnValue([v169 proxyUsername]);
      v139 = (void *)v138;
      if (v138) {
        v140 = (const __CFString *)v138;
      }
      else {
        v140 = &stru_1000C4568;
      }
      -[os_log_s setObject:forKey:](v110, "setObject:forKey:", v140, @"HTTPProxyUsername");

      -[os_log_s setObject:forKey:](v110, "setObject:forKey:", &stru_1000C4568, @"HTTPProxyPassword");
    }

    SCNetworkProtocolSetConfiguration(v26, v110);
    v141 = _MCLogObjects[0];
    if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v179 = v110;
      _os_log_impl( (void *)&_mh_execute_header,  v141,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler set proxy protocol configuration: %{public}@",  buf,  0xCu);
    }
  }

  else
  {
    v110 = _MCLogObjects[0];
    if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v110,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler cannot find proxy protocol for the WiFi service.",  buf,  2u);
    }
  }

  SCPreferencesCommitChanges(v10);
  SCPreferencesApplyChanges(v10);
  SCPreferencesSynchronize(v10);
  SCPreferencesUnlock(v10);
  v142 = (void *)objc_claimAutoreleasedReturnValue([v169 proxyUsername]);

  if (!v142)
  {
    v48 = 0;
LABEL_235:
    Property = WiFiNetworkGetProperty(v166, v165);
    if (Property) {
      -[MCNewWiFiPayloadHandler _updateWiFiCustomSetWithSetID:forSSID:]( self,  "_updateWiFiCustomSetWithSetID:forSSID:",  Property,  name);
    }
    v49 = 0;
LABEL_238:
    v47 = set;
    goto LABEL_239;
  }

  v164 = v108;
  v143 = (void *)objc_claimAutoreleasedReturnValue([v169 proxyUsername]);
  v144 = (void *)objc_claimAutoreleasedReturnValue([v169 proxyPassword]);
  v145 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredential credentialWithUser:password:persistence:]( &OBJC_CLASS___NSURLCredential,  "credentialWithUser:password:persistence:",  v143,  v144,  2LL));

  v48 = !-[MCNewWiFiPayloadHandler _applyProxyCredential:](self, "_applyProxyCredential:", v145);
  if ((v48 & 1) != 0)
  {
    id v8 = v169;
    goto LABEL_228;
  }

  v146 = (void *)objc_claimAutoreleasedReturnValue([v169 proxyUsername]);
  id v8 = v169;
  v147 = (void *)objc_claimAutoreleasedReturnValue([v169 proxyPassword]);
  v148 = (const void *)CFURLCredentialCreate(0LL, v146, v147, 0LL, 3LL);

  if (!v148)
  {
LABEL_234:

    v108 = v164;
    goto LABEL_235;
  }

  Archive = (const void *)_CFURLCredentialCreateArchive(0LL, v148);
  if (!Archive)
  {
LABEL_233:
    CFRelease(v148);
    goto LABEL_234;
  }

  v150 = Archive;
  Data = CFPropertyListCreateData(0LL, Archive, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
  CFRelease(v150);
  if (!Data)
  {
    v155 = _MCLogObjects[0];
    if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v155,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler cannot serialize credential. Ignoring.",  buf,  2u);
    }

    goto LABEL_232;
  }

  v152 = objc_claimAutoreleasedReturnValue(+[NSString MCMakeUUID](&OBJC_CLASS___NSString, "MCMakeUUID"));
  v170 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v159 = (void *)objc_claimAutoreleasedReturnValue([v170 profile]);
  v177 = 0LL;
  v158 = (os_log_s *)v152;
  +[MCKeychain setData:forService:account:label:description:useSystemKeychain:outError:]( MCKeychain,  "setData:forService:account:label:description:useSystemKeychain:outError:",  Data,  @"MCWiFiCredential",  v152,  0,  0,  [v159 isInstalledForSystem],  &v177);
  v153 = v177;

  CFRelease(Data);
  if (!v153)
  {
    v155 = v158;
    [v8 setCredentialUUID:v158];
LABEL_232:

    goto LABEL_233;
  }

  v154 = _MCLogObjects[0];
  if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v179 = v153;
    _os_log_impl( (void *)&_mh_execute_header,  v154,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler cannot commit credential to keychain with error: %{public}@",  buf,  0xCu);
  }

  CFRelease(v148);
  v48 = 1;
LABEL_228:

  v49 = 0;
  v47 = set;
  v108 = v164;
LABEL_239:

LABEL_130:
  v39 = 0LL;
LABEL_131:

  __int128 v27 = v48 != 0;
  if (v39)
  {
    SCNetworkServiceRemove(v39);
    CFRelease(v39);
  }

  a4 = v172;
  if (v47)
  {
    SCNetworkSetRemove(v47);
    CFRelease(v47);
  }

  if (v174) {
    CFRelease(v174);
  }
  if (!v173)
  {
    if (!v49) {
      goto LABEL_140;
    }
LABEL_139:
    SCPreferencesUnlock(v10);
    goto LABEL_140;
  }

  CFRelease(v173);
  if ((v49 & 1) != 0) {
    goto LABEL_139;
  }
LABEL_140:
  if (v13) {
    CFRelease(v13);
  }
  CFRelease(v10);
  if (v26)
  {
    CFRelease(v26);
    if (v27) {
      goto LABEL_144;
    }
LABEL_150:
    v95 = _MCLogObjects[0];
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      v100 = (void *)objc_claimAutoreleasedReturnValue([v8 ssid]);
      *(_DWORD *)buf = 138543362;
      v179 = v100;
      _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler successfully configured WiFi for SSID: %{public}@",  buf,  0xCu);
    }

    v99 = 1;
LABEL_153:

    goto LABEL_154;
  }

  if (!v27) {
    goto LABEL_150;
  }
LABEL_144:
  v92 = _MCLogObjects[0];
  if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
  {
    v93 = (void *)objc_claimAutoreleasedReturnValue([v8 ssid]);
    *(_DWORD *)buf = 138543362;
    v179 = v93;
    _os_log_impl( (void *)&_mh_execute_header,  v92,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler failed to configure WiFi for SSID: %{public}@",  buf,  0xCu);
  }

  if (a4)
  {
    v94 = MCWiFiErrorDomain;
    v95 = (os_log_s *)objc_claimAutoreleasedReturnValue([@"ERROR_WIFI_COULD_NOT_SETUP_PROXY" MCAppendGreenteaSuffix]);
    v96 = (void *)objc_claimAutoreleasedReturnValue([v8 ssid]);
    v97 = MCErrorArray(v95);
    v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v94,  13005LL,  v98,  MCErrorTypeFatal,  v96,  0LL));

    v99 = 0;
    goto LABEL_153;
  }

  v99 = 0;
LABEL_154:

  return v99;
}

LABEL_14:
        CFRelease(v7);
      }

      sub_100052CC0();
      setAsideuint64_t UUID = self->_setAsideUUID;
      self->_setAsideuint64_t UUID = 0LL;
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v32 credentialUUID]);
    if (v20)
    {
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 profile]);
      __int128 v23 = (const __CFData *)+[MCKeychain dataFromService:account:label:description:useSystemKeychain:outError:]( MCKeychain,  "dataFromService:account:label:description:useSystemKeychain:outError:",  @"MCWiFiCredential",  v20,  0,  0,  [v22 isInstalledForSystem],  0);

      if (v23)
      {
        __int128 v24 = CFPropertyListCreateWithData(0LL, v23, 0LL, 0LL, 0LL);
        if (v24)
        {
          __int128 v25 = v24;
          __int128 v26 = _CFURLCredentialCreateFromArchive(0LL, v24);
          if (v26)
          {
            __int128 v27 = (const void *)v26;
            Username = CFURLCredentialGetUsername();
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(Username);
            uint64_t v30 = (void *)CFURLCredentialCopyPassword(v27);
            id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredential credentialWithUser:password:persistence:]( &OBJC_CLASS___NSURLCredential,  "credentialWithUser:password:persistence:",  v29,  v30,  2LL));
            -[MCNewWiFiPayloadHandler _applyProxyCredential:](self, "_applyProxyCredential:", v31);
            CFRelease(v27);
          }

          CFRelease(v25);
        }
      }
    }
  }

void sub_10005740C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MCProvisioningProfileJanitor);
  uint64_t v2 = (void *)qword_1000DC158;
  qword_1000DC158 = (uint64_t)v1;
}

void sub_10005752C(uint64_t a1)
{
  uint64_t v2 = _MCLogObjects[11];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "MCProvisioningProfileJanitor updating MIS trust...",  buf,  2u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 effectiveUnionValuesForSetting:MCFeatureTrustedCodeSigningIdentities]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) profileTrust]);
  [v5 updateTrustedCodeSigningIdentities:v4 validateBundleIDs:*(void *)(a1 + 40) validateManagedApps:*(unsigned __int8 *)(a1 + 64)];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[MDMProvisioningProfileTrust allTrustedSignerIdentities]( &OBJC_CLASS___MDMProvisioningProfileTrust,  "allTrustedSignerIdentities"));
  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v12 = 0LL;
    [v7 _updateMCTrustedCodeSigningIdentities:v6 outError:&v12];
    id v8 = v12;
  }

  else
  {
    id v9 = _MCLogObjects[2];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "MCProvisioningProfileJanitor skipping MCFeatureTrustedCodeSigningIdentities update after MIS enumeration failed",  v11,  2u);
    }

    id v8 = 0LL;
  }

  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v8);
  }
}

uint64_t sub_1000579D8(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100057ABC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueSystemDomainsDict]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyReader systemStoragePath](&OBJC_CLASS___MCDependencyReader, "systemStoragePath"));
  [v2 MCWriteToBinaryFile:v3];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueUserDomainsDict]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyReader userStoragePath](&OBJC_CLASS___MCDependencyReader, "userStoragePath"));
  [v4 MCWriteToBinaryFile:v5];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueSystemOrphansDict]);
  [v6 removeAllObjects];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueUserOrphansDict]);
  [v7 removeAllObjects];

  MCSendDependencyChangedNotification();
  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v10, v8);
  }

void sub_1000580D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_1000580EC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000580FC(uint64_t a1)
{
}

void sub_100058104(uint64_t a1)
{
  uint64_t v9 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueOrphanedParentsInSystemDomain:*(void *)(a1 + 40)]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueOrphanedParentsInUserDomain:*(void *)(a1 + 40)]);
  if (v9 | v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    if (v9)
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([(id)v9 allObjects]);
      [v3 addObjectsFromArray:v4];
    }

    if (v2)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([(id)v2 allObjects]);
      [v3 addObjectsFromArray:v5];
    }
  }

  else
  {
    id v3 = 0LL;
  }

  id v6 = [v3 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_1000582DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000582F4(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueOrphanedParentsInSystemDomain:*(void *)(a1 + 40)]);
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100058438( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100058450(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueOrphanedParentsInUserDomain:*(void *)(a1 + 40)]);
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_1000586F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) memberQueueAddDependent:*(void *)(a1 + 40) toParent:*(void *)(a1 + 48) inDomain:*(void *)(a1 + 56) toSystem:*(unsigned __int8 *)(a1 + 64) user:*(unsigned __int8 *)(a1 + 65)];
}

void sub_100058B9C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) memberQueueDependentsOfParent:*(void *)(a1 + 40) inSystemDomain:*(void *)(a1 + 48)]);
  id v3 = [v2 count];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) memberQueueDependentsOfParent:*(void *)(a1 + 40) inUserDomain:*(void *)(a1 + 48)]);
  id v5 = [v4 count];

  [*(id *)(a1 + 32) memberQueueRemoveDependent:*(void *)(a1 + 56) fromParent:*(void *)(a1 + 40) inDomain:*(void *)(a1 + 48) fromSystem:*(unsigned __int8 *)(a1 + 64) user:*(unsigned __int8 *)(a1 + 65)];
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) memberQueueDependentsOfParent:*(void *)(a1 + 40) inSystemDomain:*(void *)(a1 + 48)]);
  id v7 = [v6 count];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) memberQueueDependentsOfParent:*(void *)(a1 + 40) inUserDomain:*(void *)(a1 + 48)]);
  id v9 = [v8 count];

  if (v3) {
    BOOL v10 = v7 == 0LL;
  }
  else {
    BOOL v10 = 0;
  }
  char v11 = v10;
  if (v5) {
    BOOL v12 = v9 == 0LL;
  }
  else {
    BOOL v12 = 0;
  }
  int v13 = v12;
  if ((v11 & 1) != 0 || v13) {
    objc_msgSend( *(id *)(a1 + 32),  "memberQueueAddOrphanParent:inDomain:toSystem:user:",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
  }
}

id sub_1000590C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) memberQueueAddDependent:*(void *)(a1 + 48) toParent:*(void *)(a1 + 40) inDomain:*(void *)(a1 + 64) toSystem:*(unsigned __int8 *)(a1 + 72) user:*(unsigned __int8 *)(a1 + 73)];
}

id sub_100059238(uint64_t a1)
{
  return [*(id *)(a1 + 32) memberQueueRemoveDependent:*(void *)(a1 + 48) fromParent:*(void *)(a1 + 40) inDomain:*(void *)(a1 + 64) fromSystem:*(unsigned __int8 *)(a1 + 72) user:*(unsigned __int8 *)(a1 + 73)];
}

void sub_100059518(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MCWatchSettingsMirror);
  id v2 = (void *)qword_1000DC168;
  qword_1000DC168 = (uint64_t)v1;
}

void sub_1000596B8(id a1)
{
  v75[0] = @"com.apple.aac";
  v73[0] = @"bundlePath";
  v73[1] = @"loaderClass";
  v74[0] = @"/System/Library/PrivateFrameworks/AACCore.framework/AACCore";
  v74[1] = @"AEAssessmentAgentService";
  v73[2] = @"loaderSelector";
  v73[3] = @"canOverrideRestrictions";
  v74[2] = @"setOfActiveRestrictionUUIDs:";
  v74[3] = &__kCFBooleanTrue;
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v74,  v73,  4LL));
  v76[0] = v26;
  v75[1] = @"com.apple.accessibility.unmanaged.asam";
  v71[0] = @"bundlePath";
  v71[1] = @"loaderClass";
  v72[0] = @"/System/Library/PrivateFrameworks/AccessibilityUtilities.framework/AccessibilityUtilities";
  v72[1] = @"AXMobileConfigurationInterface";
  v71[2] = @"loaderSelector";
  v72[2] = @"activeRestrictionIdentifiers";
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v72,  v71,  3LL));
  v76[1] = v25;
  v75[2] = @"com.apple.batterysaver";
  v69[0] = @"bundlePath";
  v69[1] = @"loaderClass";
  v70[0] = @"/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration";
  v70[1] = @"MCBatterySaverMode";
  v69[2] = @"loaderSelector";
  v70[2] = @"setOfActiveRestrictionUUIDs";
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v70,  v69,  3LL));
  v76[2] = v24;
  v75[3] = @"com.apple.carousel.noplaytime";
  v67 = @"neverOrphanCheck";
  v68 = &__kCFBooleanTrue;
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v68,  &v67,  1LL));
  v76[3] = v23;
  v75[4] = @"com.apple.dmd";
  v65[0] = @"bundlePath";
  v65[1] = @"loaderClass";
  v66[0] = @"/System/Library/PrivateFrameworks/DeviceManagement.framework/DeviceManagement";
  v66[1] = @"DMFConfigurationSourceClient";
  v65[2] = @"loaderSelector";
  v65[3] = @"orphanCheckMayFail";
  v66[2] = @"setOfActiveRestrictionUUIDs";
  v66[3] = &__kCFBooleanTrue;
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v66,  v65,  4LL));
  v76[4] = v22;
  v75[5] = @"com.apple.FaceTime";
  v63 = @"neverOrphanCheck";
  v64 = &__kCFBooleanTrue;
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v64,  &v63,  1LL));
  v76[5] = v21;
  v75[6] = @"com.apple.eas.account";
  v61[0] = @"bundlePath";
  v61[1] = @"loaderClass";
  v62[0] = @"/System/Library/PrivateFrameworks/DataAccess.framework/DataAccess";
  v62[1] = @"DAAccount";
  v61[2] = @"loaderSelector";
  v61[3] = @"recomputeComplianceSelector";
  v62[2] = @"oneshotListOfAccountIDs";
  v62[3] = @"reacquireClientRestrictions:";
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v62,  v61,  4LL));
  v76[6] = v20;
  v75[7] = @"com.apple.itunesstored";
  v59[0] = @"bundlePath";
  v59[1] = @"loaderClass";
  v60[0] = @"/System/Library/PrivateFrameworks/StoreServices.framework/StoreServices";
  v60[1] = @"SSRestrictions";
  v59[2] = @"loaderSelector";
  v60[2] = @"setOfActiveRestrictionUUIDs";
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v60,  v59,  3LL));
  v76[7] = v19;
  v75[8] = @"com.apple.lsd.appremoval";
  v57 = @"neverOrphanCheck";
  v58 = &__kCFBooleanTrue;
  os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
  v76[8] = v18;
  v75[9] = @"com.apple.managedconfiguration.profilectl";
  v55[0] = @"neverOrphanCheck";
  v55[1] = @"canOverrideRestrictions";
  v56[0] = &__kCFBooleanTrue;
  v56[1] = &__kCFBooleanTrue;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  2LL));
  v76[9] = v17;
  v75[10] = @"com.apple.ManagedSettings";
  v53[0] = @"bundlePath";
  v53[1] = @"loaderClass";
  v54[0] = @"/System/Library/PrivateFrameworks/ManagedSettingsObjC.framework/ManagedSettingsObjC";
  v54[1] = @"MOEffectiveSettingsStore";
  v53[2] = @"loaderSelector";
  v53[3] = @"orphanCheckMayFail";
  v54[2] = @"setOfActiveRestrictionUUIDs";
  v54[3] = &__kCFBooleanTrue;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v54,  v53,  4LL));
  v76[10] = v16;
  v75[11] = @"com.apple.mobilestoredemod";
  v51 = @"neverOrphanCheck";
  v52 = &__kCFBooleanTrue;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL));
  v76[11] = v15;
  v75[12] = @"com.apple.NanoBooksRestrictions";
  v49 = @"neverOrphanCheck";
  v50 = &__kCFBooleanTrue;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
  v76[12] = v14;
  v75[13] = @"com.apple.Passbook";
  v47[0] = @"bundlePath";
  v47[1] = @"loaderClass";
  v48[0] = @"/System/Library/PrivateFrameworks/PassKitCore.framework/PassKitCore";
  v48[1] = @"PKWalletVisibility";
  v47[2] = @"loaderSelector";
  v48[2] = @"setOfActiveRestrictionUUIDs";
  int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  3LL));
  v76[13] = v13;
  v75[14] = @"com.apple.Preferences";
  v45 = @"neverOrphanCheck";
  v46 = &__kCFBooleanTrue;
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
  v76[14] = v12;
  v75[15] = @"com.apple.profiled.appenforced";
  v43[0] = @"bundlePath";
  v43[1] = @"loaderClass";
  v44[0] = @"/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration";
  v44[1] = @"MCAppEnforcedRestrictions";
  v43[2] = @"loaderSelector";
  v44[2] = @"setOfActiveRestrictionUUIDs";
  char v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  3LL));
  v76[15] = v11;
  v75[16] = @"com.apple.profiled.trustedcodesigningidentities";
  id v41 = @"neverOrphanCheck";
  v42 = &__kCFBooleanTrue;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
  v76[16] = v10;
  v75[17] = @"com.apple.remotemanagementd";
  v39 = @"neverOrphanCheck";
  id v40 = &__kCFBooleanTrue;
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
  v76[17] = v1;
  v75[18] = @"com.apple.siri.parsec.HashtagImagesApp";
  v37[0] = @"bundlePath";
  v37[1] = @"loaderClass";
  v38[0] = @"/System/Library/PrivateFrameworks/CoreParsec.framework/CoreParsec";
  v38[1] = @"PARHashtagImagesVisibility";
  v37[2] = @"loaderSelector";
  v38[2] = @"setOfActiveRestrictionUUIDs";
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  3LL));
  v76[18] = v2;
  v75[19] = @"com.apple.siri.parsec.news";
  v35[0] = @"bundlePath";
  v35[1] = @"loaderClass";
  v36[0] = @"/System/Library/PrivateFrameworks/CoreParsec.framework/CoreParsec";
  v36[1] = @"PARNewsVisibility";
  v35[2] = @"loaderSelector";
  v36[2] = @"setOfActiveRestrictionUUIDs";
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  3LL));
  v76[19] = v3;
  v75[20] = @"com.apple.springboard";
  id v33 = @"neverOrphanCheck";
  v34 = &__kCFBooleanTrue;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
  v76[20] = v4;
  v75[21] = @"com.apple.studentd";
  v31[0] = @"bundlePath";
  v31[1] = @"loaderClass";
  v32[0] = @"/System/Library/PrivateFrameworks/ClassroomKit.framework/ClassroomKit";
  v32[1] = @"CRKClassroomConfiguration";
  v31[2] = @"loaderSelector";
  v32[2] = @"setOfActiveRestrictionUUIDs:";
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  3LL));
  v76[21] = v5;
  v75[22] = @"com.apple.WatchListKit.isTVAllowed";
  uint64_t v29 = @"neverOrphanCheck";
  uint64_t v30 = &__kCFBooleanTrue;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
  v76[22] = v6;
  v75[23] = @"NanoPreferencesSync";
  __int128 v27 = @"neverOrphanCheck";
  __int128 v28 = &__kCFBooleanTrue;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  v76[23] = v7;
  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v76,  v75,  24LL));
  id v9 = (void *)qword_1000DC178;
  qword_1000DC178 = v8;
}

void sub_10005ABE4(_Unwind_Exception *a1)
{
}

uint64_t sub_10005AC1C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10005AC2C(uint64_t a1)
{
}

void sub_10005AC34(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

LABEL_64:
  BOOL v12 = v177;
  if (v57)
  {
    [v164 setObject:kSecCMSHashingAlgorithmSHA512 forKeyedSubscript:kSecCMSSignHashAlgorithm];
    v78 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO)) {
      goto LABEL_81;
    }
    *(_WORD *)buf = 0;
    v79 = "SHA-512 is supported.";
    goto LABEL_80;
  }

  if (v58)
  {
    [v164 setObject:kSecCMSHashingAlgorithmSHA256 forKeyedSubscript:kSecCMSSignHashAlgorithm];
    v78 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO)) {
      goto LABEL_81;
    }
    *(_WORD *)buf = 0;
    v79 = "SHA-512 not supported. Falling back to SHA-256 hash.";
    goto LABEL_80;
  }

  if (!v170)
  {
    v143 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v143,  OS_LOG_TYPE_ERROR,  "Insufficient required capability from Certificate Authority. SHA-512, SHA-256, and SHA-1 not supported.",  buf,  2u);
    }

    v144 = MCSCEPErrorDomain;
    v145 = MCErrorArray(@"SCEP_ERROR_INSUFFICIENT_CA_CAPS");
    v125 = objc_claimAutoreleasedReturnValue(v145);
    v126 = MCErrorTypeFatal;
    v127 = v144;
    v128 = 22006LL;
    goto LABEL_128;
  }

  [v164 setObject:kSecCMSHashingAlgorithmSHA1 forKeyedSubscript:kSecCMSSignHashAlgorithm];
  v78 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v79 = "SHA-512 & SHA-256 not supported. Falling back to SHA-1 hash.";
LABEL_80:
    _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, v79, buf, 2u);
  }

LABEL_81:
  v87 = SecSCEPCreateTemporaryIdentity(v189, v188);
  if (!v87)
  {
    v123 = MCSCEPErrorDomain;
    v124 = MCErrorArray(@"SCEP_ERROR_CANNOT_CREATE_TEMP_IDENTITY");
    v125 = objc_claimAutoreleasedReturnValue(v124);
    v126 = MCErrorTypeFatal;
    v127 = v123;
    v128 = 22009LL;
LABEL_128:
    __int128 v27 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v127,  v128,  v125,  v126,  0LL));
    v146 = (void *)v125;
    __int128 v28 = 0LL;
    a4 = v173;
    __int128 v24 = data;
    v76 = v160;
    goto LABEL_146;
  }

  __int128 v28 = (void *)v87;
  v88 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-tempID", v88));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v91 = (void *)objc_claimAutoreleasedReturnValue([v90 profile]);
  v92 = objc_claimAutoreleasedReturnValue( +[MCKeychain saveItem:withLabel:group:useSystemKeychain:]( MCKeychain,  "saveItem:withLabel:group:useSystemKeychain:",  v28,  v89,  v175,  [v91 isInstalledForSystem]));

  v159 = (void *)v92;
  if (!v92)
  {
    v129 = MCSCEPErrorDomain;
    v130 = MCErrorArray(@"SCEP_ERROR_CANNOT_STORE_TEMP_IDENTITY");
    v131 = objc_claimAutoreleasedReturnValue(v130);
    __int128 v27 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v129,  22010LL,  v131,  MCErrorTypeFatal,  0LL));
    v132 = (void *)v131;
    BOOL v12 = v177;
    __int128 v24 = data;
    a4 = v173;
    v76 = v160;
    goto LABEL_145;
  }

  v93 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
  -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:]( self,  "_touchDependencyBetweenPersistentID:andUUID:",  v92,  v93);

  v94 = [v9 subject];
  v95 = SecSCEPGenerateCertificateRequest(v94, v164, v189, v188, v28, v181);
  v158 = (void *)v95;
  if (!v95)
  {
    v139 = MCSCEPErrorDomain;
    v140 = MCErrorArray(@"SCEP_ERROR_CANNOT_CREATE_CSR");
    v141 = objc_claimAutoreleasedReturnValue(v140);
    __int128 v27 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v139,  22011LL,  v141,  MCErrorTypeFatal,  0LL));
    v142 = (void *)v141;
    BOOL v12 = v177;
    __int128 v24 = data;
    a4 = v173;
    v76 = v160;
    goto LABEL_144;
  }

  v96 = (void *)v95;
  v97 = (char *)[v9 retries] + 1;
  v156 = [v9 retryDelay];
  v98 = v96;
  __int128 v27 = 0LL;
  v168 = MCErrorTypeFatal;
  v161 = MCSCEPErrorDomain;
  v157 = 1;
  v162 = v98;
  v169 = v98;
  BOOL v12 = v177;
  a4 = v173;
LABEL_85:
  v99 = v97;
  while (1)
  {
    v176 = (unint64_t)v99;
    v100 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_DEFAULT,  "Attempting to retrieve issued certificate...",  buf,  2u);
    }

    v101 = (void *)objc_claimAutoreleasedReturnValue([v9 URLString]);
    v182 = 0LL;
    v102 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewSCEPPayloadHandler _performPKIOperation:withPayload:usingPost:error:]( self,  "_performPKIOperation:withPayload:usingPost:error:",  v101,  v169,  v167,  &v182));
    __int128 v27 = v182;

    if (v27)
    {

      v176 = 0LL;
      goto LABEL_104;
    }

    v185 = 0LL;
    v171 = v102;
    v103 = SecSCEPVerifyReply(v162, v102, v181, &v185);
    v104 = v185;
    v163 = (void *)v103;
    if (v103) {
      break;
    }
    if (v185)
    {
      v105 = (void *)objc_claimAutoreleasedReturnValue([v185 domain]);
      v106 = [v104 code];
      v107 = (void *)objc_claimAutoreleasedReturnValue([v104 localizedDescription]);
      v108 = MCErrorArrayFromLocalizedDescription(v107);
      v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
      __int128 v27 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v105,  v106,  v109,  v168));

      v110 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v111 = v110;
        v112 = (void *)objc_claimAutoreleasedReturnValue([v27 MCVerboseDescription]);
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v112;
        _os_log_impl( (void *)&_mh_execute_header,  v111,  OS_LOG_TYPE_ERROR,  "Certificate retrieval reported error: %{public}@",  buf,  0xCu);
      }

      v113 = (void *)objc_claimAutoreleasedReturnValue([v104 domain]);
      if ([v113 isEqualToString:@"PENDING"])
      {
        v114 = (void *)objc_claimAutoreleasedReturnValue([v104 userInfo]);

        a4 = v173;
        if (v114)
        {
          v115 = v169;
          v169 = (id)SecSCEPGetCertInitial( v172,  [v9 subject],  0,  objc_msgSend(v104, "userInfo"),  v28,  v181);
          goto LABEL_99;
        }
      }

      else
      {

        a4 = v173;
      }
    }

    else
    {
      __int128 v27 = 0LL;
    }

    v116 = MCErrorArray(@"SCEP_ERROR_INVALID_PKI_RESPONSE");
    v115 = (void *)objc_claimAutoreleasedReturnValue(v116);
    v117 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v161,  22013LL,  v115,  v168,  0LL));

    v176 = 0LL;
    __int128 v27 = (id)v117;
LABEL_99:

    if (v27)
    {
      BOOL v12 = v177;
LABEL_104:
      v118 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        v119 = v118;
        v120 = (void *)objc_claimAutoreleasedReturnValue([v27 MCVerboseDescription]);
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v120;
        _os_log_impl( (void *)&_mh_execute_header,  v119,  OS_LOG_TYPE_DEFAULT,  "Could not retrieve issued certificate: %{public}@",  buf,  0xCu);
      }

      v121 = v176;
      if ((v176 == 0) | v157 & 1)
      {
        v157 &= v176 == 0;
      }

      else
      {
        v122 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v122,  OS_LOG_TYPE_DEFAULT,  "Sleeping before polling SCEP server again.",  buf,  2u);
        }

        sleep(v156);
        v157 = 0;
        v121 = v176;
      }

      v97 = (char *)(v121 - 1);
      if (v121 < 2)
      {
        v163 = 0LL;
        goto LABEL_143;
      }

      goto LABEL_85;
    }

    BOOL v12 = v177;
    v99 = (char *)(v176 - 1);
    if (v176 <= 1) {
      goto LABEL_132;
    }
  }

  v147 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEFAULT, "Issued certificate received.", buf, 2u);
  }

LABEL_132:
  if ([v163 count])
  {
    v148 = [v163 objectAtIndex:0];
    v149 = (__SecIdentity *)SecIdentityCreate(kCFAllocatorDefault, v148, v188);
    self->_identity = v149;
    if (v149)
    {
      __int128 v27 = 0LL;
      goto LABEL_143;
    }

    v155 = MCErrorArray(@"SCEP_ERROR_INVALID_IDENTITY");
    v151 = (void *)objc_claimAutoreleasedReturnValue(v155);
    v152 = v161;
    v153 = 22008LL;
  }

  else
  {
    v150 = MCErrorArray(@"SCEP_ERROR_INVALID_CSR_RESPONSE");
    v151 = (void *)objc_claimAutoreleasedReturnValue(v150);
    v152 = v161;
    v153 = 22007LL;
  }

  __int128 v27 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v152,  v153,  v151,  v168,  0LL));

LABEL_143:
  __int128 v24 = data;
  v76 = v160;
  v142 = v163;
LABEL_144:

  v132 = v158;
LABEL_145:

  v146 = v159;
LABEL_146:

LABEL_147:
  uint64_t v29 = v172;
LABEL_11:

  if (v29) {
    CFRelease(v29);
  }
  uint64_t v30 = v181;
LABEL_17:
  if (v189)
  {
    CFRelease(v189);
    v189 = 0LL;
  }

  if (v188)
  {
    CFRelease(v188);
    v188 = 0LL;
  }

  if (v28) {
    CFRelease(v28);
  }
  if (v6) {
    [v6 didUpdateStatus:0];
  }
  if (v27)
  {
    if (a4) {
      *a4 = v27;
    }
    __int128 v36 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      __int128 v37 = v36;
      __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v27 MCVerboseDescription]);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "Cannot retrieve SCEP identity: %{public}@",  buf,  0xCu);
    }

void sub_10005C808(id a1)
{
  uint64_t v1 = MCGetBaseResourcePath(a1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"enforcedAppWhitelistRestrictions.plist"]);
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v3));

  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "MCSafePropertyListWithData:options:format:error:",  v6,  0LL,  0LL,  0LL));
  id v5 = (void *)qword_1000DC188;
  qword_1000DC188 = v4;
}

void sub_10005CB8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
}

uint64_t sub_10005CBB4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10005CBC4(uint64_t a1)
{
}

void sub_10005CBCC(uint64_t a1)
{
  char v54 = 0;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueRestrictions]);
  id v3 = [v2 copy];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueCombinedSystemProfileRestrictions]);
  id v5 = [v4 copy];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueRestrictions]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) defaultRestrictions]);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueSystemClientRestrictions]);
  char v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueUserClientRestrictions]);
  id v53 = 0LL;
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter restrictionsWithCurrentRestrictions:defaultRestrictions:systemProfileRestrictions:userProfileRestrictions:systemClientRestrictions:userClientRestrictions:outRestrictionsChanged:outError:]( &OBJC_CLASS___MCRestrictionManagerWriter,  "restrictionsWithCurrentRestrictions:defaultRestrictions:systemProfileRestrictions:userProfileRestric tions:systemClientRestrictions:userClientRestrictions:outRestrictionsChanged:outError:",  v6,  v7,  v9,  v8,  v10,  v11,  &v54,  &v53));
  id v13 = v53;

  if (!v12) {
    goto LABEL_28;
  }
  id v52 = v5;
  unsigned int v51 = [*(id *)(a1 + 32) applyConfiguration:*(void *)(a1 + 40) toDomain:6 inNamespace:0 fromSender:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) applyConfiguration:*(void *)(a1 + 48) toDomain:7 inNamespace:0 fromSender:*(void *)(a1 + 56)];
  id v14 = [*(id *)(a1 + 32) applyConfiguration:v12 toDomain:5 inNamespace:0 fromSender:*(void *)(a1 + 56)];
  id v15 = *(void **)(a1 + 40);
  uint64_t v16 = MCSystemProfileRestrictionsFilePath(v14);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  [v15 MCWriteToBinaryFile:v17];

  os_log_t v18 = *(void **)(a1 + 48);
  uint64_t v19 = MCUserProfileRestrictionsFilePath();
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v18 MCWriteToBinaryFile:v20];

  [*(id *)(a1 + 32) memberQueueCommitRestrictionsToDisk];
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueEffectiveUserSettings]);
  id v22 = [v21 MCDeepCopy];

  unsigned int v23 = [*(id *)(a1 + 32) memberQueueRecomputeEffectiveUserSettingsPasscode:0 credentialSet:0];
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueEffectiveUserSettings]);
  [v24 _applyServerSideChangesWithOldRestrictions:v3 newRestrictions:v12 oldEffectiveUserSettings:v22 newEffectiveUserSettings:v25];

  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueSystemUserSettings]);
  id v27 = [v26 MCMutableDeepCopy];

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](&OBJC_CLASS___MCServerSideHacks, "sharedHacks"));
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueEffectiveUserSettings]);
  unsigned int v30 = [v28 applyEffectiveSettings:v29 toSettings:v27 withOldRestrictions:v3 newRestrictions:v12];

  if (v23 && v30)
  {
    [*(id *)(a1 + 32) applyConfiguration:v27 toDomain:0 inNamespace:0 fromSender:*(void *)(a1 + 56)];
    id v31 = [*(id *)(a1 + 32) memberQueueCommitUserSettingsToDisk];
  }

  if (v54)
  {
    MCSendRestrictionChangedNotification(v31);
    if (+[MCPasscodeManagerWriter didPasscodePolicyChangeWithOldRestrictions:newRestrictions:]( &OBJC_CLASS___MCPasscodeManagerWriter,  "didPasscodePolicyChangeWithOldRestrictions:newRestrictions:",  v3,  v12))
    {
      [*(id *)(a1 + 32) memberQueueClearPasscodeHistoryIfNecessary];
      [*(id *)(a1 + 32) memberQueueClearRestrictionPasscodeComplianceCache];
      MCSendPasscodePolicyChangedNotification([*(id *)(a1 + 32) memberQueueClearProfileRestrictionPasscodeComplianceCache]);
    }

    if (*(void *)(a1 + 80))
    {
      uint64_t v32 = MCFeatureAppLockBundleIDs;
      id v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueEffectiveUserSettings]);
      if ((+[MCRestrictionManagerWriter intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManagerWriter,  "intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:",  v32,  v22,  v33) & 1) != 0)
      {
LABEL_16:

LABEL_17:
        **(_BYTE **)(a1 + 80) = 1;
        goto LABEL_18;
      }

      uint64_t v34 = MCFeatureAppLockMultipleAppsAllowed;
      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueEffectiveUserSettings]);
      if ((+[MCRestrictionManagerWriter BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManagerWriter,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  v34,  v22,  v35) & 1) != 0)
      {
LABEL_15:

        goto LABEL_16;
      }

      v50 = v35;
      uint64_t v36 = MCFeatureAppLockAccessWithoutPasscodeAllowed;
      __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueEffectiveUserSettings]);
      if ((+[MCRestrictionManagerWriter BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManagerWriter,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  v36,  v22,  v37) & 1) != 0)
      {
LABEL_14:

        __int128 v35 = v50;
        goto LABEL_15;
      }

      v49 = v37;
      uint64_t v38 = MCFeatureAppLockGrantSupervisorAccessForced;
      v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueEffectiveUserSettings]);
      if ((+[MCRestrictionManagerWriter BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManagerWriter,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  v38,  v22,  v39) & 1) != 0)
      {

        __int128 v37 = v49;
        goto LABEL_14;
      }

      uint64_t v46 = MCFeatureAppLockLogoutAllowed;
      v48 = v39;
      v47 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueEffectiveUserSettings]);
      LOBYTE(v46) = +[MCRestrictionManagerWriter BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:]( &OBJC_CLASS___MCRestrictionManagerWriter,  "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",  v46,  v22,  v47);

      if ((v46 & 1) != 0) {
        goto LABEL_17;
      }
    }
  }

void sub_10005D37C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueUserClientRestrictions]);
  id v12 = [v2 MCMutableDeepCopy];

  uint64_t v3 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = (void *)v3;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueSystemClientRestrictions]);
    id v7 = [v6 MCMutableDeepCopy];

    id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:*(void *)(a1 + 40)]);
    id v12 = v7;
    if (!v5) {
      goto LABEL_11;
    }
  }

  if ([*(id *)(a1 + 48) count]) {
    uint64_t v8 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v8 = 0LL;
  }
  [v5 setObject:v8 forKeyedSubscript:kMCClientRestrictionsUserInfo];
  if (v4)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueSystemClientRestrictions]);
    id v10 = v12;
  }

  else
  {
    id v9 = v12;
    id v10 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueUserClientRestrictions]);
  }

  char v11 = v10;
  [*(id *)(a1 + 32) memberQueueSetSystemClientRestrictions:v9 userClientRestrictions:v10 sender:*(void *)(a1 + 56) outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outError:0];

LABEL_11:
}

void sub_10005DA30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
}

void sub_10005DA58(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[9];
  uint64_t v6 = a1[10];
  id obj = 0LL;
  unsigned __int8 v7 = [v2 memberQueueSetAllClientRestrictions:v3 sender:v4 outRestrictionsChanged:v5 outEffectiveSettingsChanged:v6 outError:&obj];
  id v8 = obj;
  *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = v7;
  objc_storeStrong((id *)(*(void *)(a1[8] + 8LL) + 40LL), v8);
}

void sub_10005DE18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_10005DE48(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 128))
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue([(id)qword_1000DC198 objectForKeyedSubscript:*(void *)(a1 + 32)]);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"canOverrideRestrictions"]);
    if (([v3 BOOLValue] & 1) == 0)
    {
      uint64_t v26 = MCClientRestrictionsErrorDomain;
      uint64_t v40 = *(void *)(a1 + 32);
      uint64_t v27 = MCErrorArray(@"CLIENT_RESTRICTION_ERROR_CANNOT_OVERRIDE_P_CLIENT_TYPE");
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v26,  63000LL,  v28,  MCErrorTypeFatal,  v40,  0LL));

      goto LABEL_32;
    }

    uint64_t v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) memberQueueOverridingRestrictionClientUUID]);
    uint64_t v5 = v4;
    if (v4 && !MCEqualStrings(v4, *(void *)(a1 + 48)))
    {
      uint64_t v29 = MCClientRestrictionsErrorDomain;
      uint64_t v30 = MCErrorArray(@"CLIENT_RESTRICTION_ERROR_ALREADY_OVERRIDDEN");
      id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v29,  63001LL,  v31,  MCErrorTypeFatal,  0LL));

LABEL_31:
      goto LABEL_32;
    }
  }

  id v2 = [*(id *)(a1 + 56) MCMutableDeepCopy];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
  [v6 _applyHeuristicsToRestrictions:v2 forProfile:0 ignoresUnrestrictableApps:*(unsigned __int8 *)(a1 + 128)];

  uint64_t v7 = MCLocalizedErrorFormatByDevice(@"ENCRYPTION_POLICY_CLIENT_FAILURE_TEXT");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCDeviceCapabilities currentDevice](&OBJC_CLASS___MCDeviceCapabilities, "currentDevice"));
  id v44 = 0LL;
  unsigned int v9 = [v8 validateCapabilitiesRequiredByRestrictions:v2 localizedIncompatibilityMessage:v3 outError:&v44];
  id v10 = v44;

  if (v9)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) memberQueueClientRestrictionsForClientUUID:*(void *)(a1 + 48)]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) memberQueueClientTypeForClientUUID:*(void *)(a1 + 48)]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) memberQueueOverridingRestrictionClientUUID]);
    int v13 = *(unsigned __int8 *)(a1 + 128);
    int v14 = MCEqualStrings(v12, *(void *)(a1 + 48));
    if (sub_100014760((void *)v5, v2)
      && MCEqualStrings(v11, *(void *)(a1 + 32))
      && v13 == v14
      || !(v5 | v11) && ![*(id *)(a1 + 56) count])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL) = 1;
LABEL_30:

      goto LABEL_31;
    }

    uint64_t v41 = v11;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) memberQueueSystemClientRestrictions]);
    id v16 = [v15 MCMutableDeepCopy];

    id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) memberQueueUserClientRestrictions]);
    id v18 = [v17 MCMutableDeepCopy];

    if (*(_BYTE *)(a1 + 129)) {
      uint64_t v19 = v16;
    }
    else {
      uint64_t v19 = v18;
    }
    id v20 = v19;
    v42 = v20;
    if (![*(id *)(a1 + 56) count])
    {
      [v20 setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];
      goto LABEL_27;
    }

    v45[0] = kMCClientRestrictionsTruth;
    v45[1] = kMCClientRestrictionsType;
    uint64_t v21 = *(void *)(a1 + 32);
    v46[0] = v2;
    v46[1] = v21;
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  2LL));
    id v23 = [v22 mutableCopy];

    [v23 setObject:*(void *)(a1 + 64) forKeyedSubscript:kMCClientRestrictionsLocalizedClientDescription];
    [v23 setObject:*(void *)(a1 + 72) forKeyedSubscript:kMCClientRestrictionsLocalizedWarning];
    [v23 setObject:*(void *)(a1 + 80) forKeyedSubscript:kMCClientRestrictionsAppsAndOptions];
    if (*(_BYTE *)(a1 + 128))
    {
      [v23 setObject:&__kCFBooleanTrue forKeyedSubscript:kMCClientRestrictionsOverrideRestrictions];
      uint64_t v24 = *(void *)(a1 + 48);
      __int128 v25 = v42;
    }

    else
    {
      __int128 v25 = v42;
      if (!MCEqualStrings(v12, *(void *)(a1 + 48)))
      {
LABEL_26:
        [v25 setObject:v23 forKeyedSubscript:*(void *)(a1 + 48)];

LABEL_27:
        uint64_t v32 = *(void **)(a1 + 40);
        uint64_t v33 = *(void *)(a1 + 88);
        uint64_t v34 = *(void *)(a1 + 112);
        uint64_t v35 = *(void *)(a1 + 120);
        id v43 = v10;
        unsigned __int8 v36 = [v32 memberQueueSetSystemClientRestrictions:v16 userClientRestrictions:v18 sender:v33 outRestrictionsCha nged:v34 outEffectiveSettingsChanged:v35 outError:&v43];
        id v37 = v43;

        *(_BYTE *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL) = v36;
        if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL)) {
          [*(id *)(a1 + 40) setMemberQueueOverridingRestrictionClientUUID:v12];
        }

        id v10 = v37;
        uint64_t v11 = v41;
        goto LABEL_30;
      }

      uint64_t v24 = 0LL;
    }

    [*(id *)(a1 + 40) setMemberQueueOverridingRestrictionClientUUID:v24];
    goto LABEL_26;
  }

void sub_10005EC84(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueSystemClientRestrictions]);
  id v3 = [v2 copy];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) orphanedClientUUIDsForClientRestrictionDictionary:v3]);
  if ([v4 count])
  {
    uint64_t v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Found orphaned system client uuids %{public}@.  Removing them",  (uint8_t *)&v16,  0xCu);
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueSystemClientRestrictions]);
    id v7 = [v6 MCMutableDeepCopy];

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
    [v7 removeObjectsForKeys:v8];

    [*(id *)(a1 + 32) applyConfiguration:v7 toDomain:8 inNamespace:0 fromSender:@"MCRestrictionManagerWriter.RemoveOrphanedClientRestrictions"];
    [*(id *)(a1 + 32) memberQueueMarkToClearPasscodeComplianceCacheWithOldSystemClientRestrictions:v3 newSystemClientRestrictions:v7];
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueUserClientRestrictions]);
  id v10 = [v9 copy];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) orphanedClientUUIDsForClientRestrictionDictionary:v10]);
  if ([v11 count])
  {
    uint64_t v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Found orphaned user client uuids %{public}@.  Removing them",  (uint8_t *)&v16,  0xCu);
    }

    int v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueUserClientRestrictions]);
    id v14 = [v13 MCMutableDeepCopy];

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 allObjects]);
    [v14 removeObjectsForKeys:v15];

    [*(id *)(a1 + 32) applyConfiguration:v14 toDomain:9 inNamespace:0 fromSender:@"MCRestrictionManagerWriter.RemoveOrphanedClientRestrictions"];
  }

  if ([v4 count] || objc_msgSend(v11, "count")) {
    [*(id *)(a1 + 32) memberQueueCommitClientRestrictionsToDisk];
  }
}

void sub_10005EFA4(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueRecomputePasscodeComplianceForClientUUID]);
  if (!v2
    || (id v3 = (void *)v2,
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueRecomputePasscodeComplianceForClientUUID]),
        id v5 = [v4 count],
        v4,
        v3,
        v5))
  {
    [*(id *)(a1 + 32) memberQueueCacheClientRestrictionPasscodeCompliance];
  }

  unsigned int v6 = [*(id *)(a1 + 32) memberQueueCheckPasscodeCompliesWithCurrentRestrictions];
  id v7 = *(_BYTE **)(a1 + 40);
  if (v7) {
    _BYTE *v7 = v6;
  }
  if (v6)
  {
    id v8 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Current passcode complies with restrictions. Removing nag.",  buf,  2u);
    }

    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v10 = MCNagUIMetaFilePath(v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    unsigned int v12 = [v9 fileExistsAtPath:v11];

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v14 = (void *)v13;
    if (!v12)
    {
      uint64_t v28 = MCPasscodeNagKeepAliveFilePath();
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      [v14 removeItemAtPath:v29 error:0];

      return;
    }

    uint64_t v15 = MCNagUIMetaFilePath(v13);
    int v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    [v14 removeItemAtPath:v16 error:0];

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v18 = MCPasscodeNagKeepAliveFilePath();
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v17 removeItemAtPath:v19 error:0];

    goto LABEL_22;
  }

  id v20 = *(void **)(a1 + 32);
  id v48 = 0LL;
  id v21 = [v20 memberQueueIsPasscodeComplianceMandatoryWithOutLocalizedWarning:&v48];
  id v22 = v48;
  uint64_t v23 = MCNagUIMetaFilePath(v22);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v24));
  uint64_t v26 = v25;
  if (v25) {
    id v27 = v25;
  }
  else {
    id v27 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  uint64_t v30 = v27;

  uint64_t v31 = kMCNagMetaMandatoryKey;
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:kMCNagMetaMandatoryKey]);
  uint64_t v33 = v32;
  if (v32 && (_DWORD)v21 == [v32 BOOLValue])
  {
    int v35 = 0;
  }

  else
  {
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v21));
    [v30 setObject:v34 forKeyedSubscript:v31];

    int v35 = 1;
  }

  [v30 setObject:v22 forKeyedSubscript:kMCNagMetaMessageKey];
  [v30 setObject:0 forKeyedSubscript:kMCNagMetaLastLockDateKey];
  unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 localeIdentifier]);
  [v30 setObject:v37 forKeyedSubscript:kMCNagMetaLastLocaleKey];

  uint64_t v39 = MCNagUIMetaFilePath(v38);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  [v30 MCWriteToBinaryFile:v40];

  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v42 = MCPasscodeNagKeepAliveFilePath();
  id v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  unsigned __int8 v44 = [v41 fileExistsAtPath:v43];

  if ((v44 & 1) == 0)
  {
    v45 = objc_opt_new(&OBJC_CLASS___NSDictionary);
    uint64_t v46 = MCPasscodeNagKeepAliveFilePath();
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    -[NSDictionary MCWriteToBinaryFile:](v45, "MCWriteToBinaryFile:", v47);
  }

  if (v35) {
LABEL_22:
  }
    MCSendPasscodeComplianceChangedNotification();
}

id sub_1000605E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) memberQueueClearAllPasscodeComplianceCaches];
}

void sub_1000606D4(id a1)
{
  uint64_t v1 = MCNagUIMetaFilePath(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v2));

  if (v5)
  {
    uint64_t v3 = MCNagUIMetaFilePath([v5 removeObjectForKey:kMCNagMetaLastLockDateKey]);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    [v5 MCWriteToBinaryFile:v4];
  }
}

void sub_1000607EC(uint64_t a1)
{
  uint64_t v2 = MCNagUIMetaFilePath(a1);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v3));

  uint64_t v4 = v8;
  if (v8)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      uint64_t v6 = MCNagUIMetaFilePath([v8 setObject:v5 forKey:kMCNagMetaLastLockDateKey]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      [v8 MCWriteToBinaryFile:v7];

      uint64_t v4 = v8;
    }
  }
}

void sub_100061C88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

id sub_100061CA0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) memberQueueSetParametersForSettingsByType:*(void *)(a1 + 40) configurationUUID:*(void *)(a1 + 48) toSystem:*(unsigned __int8 *)(a1 + 88) user:*(unsigned __int8 *)(a1 + 89) passcode:*(void *)(a1 + 56) credentialSet:*(void *)(a1 + 64) sender:*(void *)(a1 + 72)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

void sub_1000623E0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueSystemUserSettings]);
  id v6 = [v2 mutableCopy];

  uint64_t v3 = MCRestrictedBoolKey;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:MCRestrictedBoolKey]);
  id v5 = [v4 mutableCopy];

  if (v5)
  {
    [v5 removeObjectForKey:*(void *)(a1 + 40)];
    [v6 setObject:v5 forKey:v3];
    [*(id *)(a1 + 32) applyConfiguration:v6 toDomain:0 inNamespace:0 fromSender:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) memberQueueCommitUserSettingsToDisk];
    [*(id *)(a1 + 32) memberQueueRecomputeEffectiveUserSettingsPasscode:0 credentialSet:0];
  }
}

void sub_100062568(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueSystemUserSettings]);
  id v6 = [v2 mutableCopy];

  uint64_t v3 = MCRestrictedValueKey;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:MCRestrictedValueKey]);
  id v5 = [v4 mutableCopy];

  if (v5)
  {
    [v5 removeObjectForKey:*(void *)(a1 + 40)];
    [v6 setObject:v5 forKey:v3];
    [*(id *)(a1 + 32) applyConfiguration:v6 toDomain:0 inNamespace:0 fromSender:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) memberQueueCommitUserSettingsToDisk];
    [*(id *)(a1 + 32) memberQueueRecomputeEffectiveUserSettingsPasscode:0 credentialSet:0];
  }
}

id sub_1000626CC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 defaultSettings]);
  [v2 applyConfiguration:v3 toDomain:0 inNamespace:0 fromSender:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) memberQueueCommitUserSettingsToDisk];
  return [*(id *)(a1 + 32) memberQueueRecomputeEffectiveUserSettingsPasscode:0 credentialSet:0];
}

id sub_1000627CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) memberQueueRecomputeEffectiveUserSettingsPasscode:*(void *)(a1 + 40) credentialSet:0];
}

void sub_100062848(uint64_t a1)
{
  char v20 = 0;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueRestrictions]);
  id v3 = [v2 copy];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueRestrictions]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) defaultRestrictions]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueSystemProfileRestrictions]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueUserProfileRestrictions]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueSystemClientRestrictions]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueUserClientRestrictions]);
  id v19 = 0LL;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter restrictionsWithCurrentRestrictions:defaultRestrictions:systemProfileRestrictions:userProfileRestrictions:systemClientRestrictions:userClientRestrictions:outRestrictionsChanged:outError:]( &OBJC_CLASS___MCRestrictionManagerWriter,  "restrictionsWithCurrentRestrictions:defaultRestrictions:systemProfileRestrictions:userProfileRestric tions:systemClientRestrictions:userClientRestrictions:outRestrictionsChanged:outError:",  v4,  v5,  v6,  v7,  v8,  v9,  &v20,  &v19));
  id v11 = v19;

  if (v10)
  {
    [*(id *)(a1 + 32) applyConfiguration:v10 toDomain:5 inNamespace:0 fromSender:@"MCRestrictionManagerWriter.RecomputeUserRestrictions"];
    [*(id *)(a1 + 32) memberQueueCommitRestrictionsToDisk];
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueEffectiveUserSettings]);
    id v13 = [v12 MCDeepCopy];

    unsigned int v14 = [*(id *)(a1 + 32) memberQueueRecomputeEffectiveUserSettingsPasscode:0 credentialSet:0];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
    int v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) memberQueueEffectiveUserSettings]);
    [v15 _applyServerSideChangesWithOldRestrictions:v3 newRestrictions:v10 oldEffectiveUserSettings:v13 newEffectiveUserSettings:v16];

    if (v20)
    {
      MCSendRestrictionChangedNotification(v17);
      if (+[MCPasscodeManagerWriter didPasscodePolicyChangeWithOldRestrictions:newRestrictions:]( &OBJC_CLASS___MCPasscodeManagerWriter,  "didPasscodePolicyChangeWithOldRestrictions:newRestrictions:",  v3,  v10))
      {
        [*(id *)(a1 + 32) memberQueueClearPasscodeHistoryIfNecessary];
        MCSendPasscodePolicyChangedNotification([*(id *)(a1 + 32) memberQueueClearAllPasscodeComplianceCaches]);
      }
    }

    if (v14) {
      MCSendEffectiveSettingsChangedNotification([*(id *)(a1 + 32) senderPID]);
    }
  }

  else
  {
    uint64_t v18 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_FAULT,  "Failed to recompute user restrictions. Error: %{public}@",  buf,  0xCu);
    }
  }
}

void sub_100062C78(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[MCClientTypeLoaders clientTypeLoaders](&OBJC_CLASS___MCClientTypeLoaders, "clientTypeLoaders"));
  uint64_t v2 = (void *)qword_1000DC198;
  qword_1000DC198 = v1;

  qword_1000DC1A8 = (uint64_t)CFDictionaryCreateMutable( kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  0LL);
  qword_1000DC1B0 = (uint64_t)CFDictionaryCreateMutable( kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  0LL);
  qword_1000DC1B8 = (uint64_t)CFDictionaryCreateMutable( kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  0LL);
  int v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = (id)qword_1000DC198;
  id v38 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v41;
    *(void *)&__int128 v3 = 138543874LL;
    __int128 v33 = v3;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v41 != v37) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(NSString **)(*((void *)&v40 + 1) + 8LL * (void)v4);
        id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000DC198, "objectForKey:", v5, v33));
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"bundlePath"]);
        id v8 = (NSString *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"loaderClass"]);
        unsigned int v9 = (NSString *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"loaderSelector"]);
        aSelectorName = (NSString *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"recomputeComplianceSelector"]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"neverOrphanCheck"]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"orphanCheckMayFail"]);
        if (v10 && [v10 BOOLValue])
        {
          unsigned int v12 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v45 = v5;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Client type %{public}@ is denoted as never orphan check. Skipping client loader.",  buf,  0xCu);
          }

          [v35 addObject:v5];
        }

        else
        {
          if (v7) {
            BOOL v13 = v8 == 0LL;
          }
          else {
            BOOL v13 = 1;
          }
          if (v13 || v9 == 0LL)
          {
            os_log_t v15 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_29;
            }
            *(_DWORD *)buf = 138543618;
            v45 = v5;
            __int16 v46 = 2114;
            v47 = (NSString *)v6;
            int v16 = v15;
            os_log_type_t v17 = OS_LOG_TYPE_ERROR;
            uint64_t v18 = "Could not find a client type loader for client type %{public}@. Found a loader dict of %{public}@";
LABEL_21:
            uint32_t v19 = 22;
LABEL_28:
            _os_log_impl((void *)&_mh_execute_header, v16, v17, v18, buf, v19);
            goto LABEL_29;
          }

          char v20 = v7;
          if (!dlopen(-[NSString cStringUsingEncoding:](v20, "cStringUsingEncoding:", 1LL), 2))
          {
            os_log_t v23 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_29;
            }
            *(_DWORD *)buf = 138543362;
            v45 = v20;
            int v16 = v23;
            os_log_type_t v17 = OS_LOG_TYPE_ERROR;
            uint64_t v18 = "Could not find a bundle at %{public}@";
            uint32_t v19 = 12;
            goto LABEL_28;
          }

          Class v21 = NSClassFromString(v8);
          if (v21)
          {
            CFDictionarySetValue((CFMutableDictionaryRef)qword_1000DC1A8, v5, v21);
            SEL v22 = NSSelectorFromString(v9);
            if (v22)
            {
              CFDictionarySetValue((CFMutableDictionaryRef)qword_1000DC1B0, v5, v22);
            }

            else
            {
              __int128 v25 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v33;
                v45 = v20;
                __int16 v46 = 2114;
                v47 = v9;
                __int16 v48 = 2114;
                v49 = v8;
                _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "Bundle at path %{public}@ does not have selector %{public}@ for class %{public}@.",  buf,  0x20u);
              }
            }

            if (aSelectorName)
            {
              SEL v26 = NSSelectorFromString(aSelectorName);
              if (v26)
              {
                CFDictionarySetValue((CFMutableDictionaryRef)qword_1000DC1B8, v5, v26);
              }

              else
              {
                os_log_t v27 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v33;
                  v45 = v20;
                  __int16 v46 = 2114;
                  v47 = aSelectorName;
                  __int16 v48 = 2114;
                  v49 = v8;
                  int v16 = v27;
                  os_log_type_t v17 = OS_LOG_TYPE_INFO;
                  uint64_t v18 = "Bundle at path %{public}@ does not have selector %{public}@ for class %{public}@.";
                  uint32_t v19 = 32;
                  goto LABEL_28;
                }
              }
            }
          }

          else
          {
            os_log_t v24 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v45 = v8;
              __int16 v46 = 2114;
              v47 = v20;
              int v16 = v24;
              os_log_type_t v17 = OS_LOG_TYPE_ERROR;
              uint64_t v18 = "Could not find class %{public}@ in bundle at path %{public}@";
              goto LABEL_21;
            }
          }
        }

void sub_1000632C0(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___MCCloudConfigurationWriter);
  uint64_t v2 = (void *)qword_1000DC1D0;
  qword_1000DC1D0 = (uint64_t)v1;
}

void sub_100063530( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100063548(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if ((a2 & 1) != 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _isCloudConfigurationActuallyAvailable];
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
    {
      unsigned int v9 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "This device must be configured using DEP.",  v11,  2u);
      }
    }
  }

  else
  {
    uint64_t v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Could not retrieve DEP configuration.",  buf,  2u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100063DC8(_Unwind_Exception *a1)
{
}

uint64_t sub_100063DE4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100063DF4(uint64_t a1)
{
}

uint64_t sub_100063DFC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v7]);
  uint64_t v10 = (void *)v9;
  if (v9 && (objc_opt_isKindOfClass(v9, a3) & 1) == 0)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ value is not a %@",  v7,  v8));
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
    unsigned int v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v11 = 1LL;
  }

  return v11;
}

uint64_t sub_100063EBC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, id, uint64_t, const __CFString *))(v2 + 16))(v2, v3, v4, @"BOOLean");

  return v5;
}

uint64_t sub_100063F20(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, id, uint64_t, const __CFString *))(v2 + 16))(v2, v3, v4, @"number");

  return v5;
}

uint64_t sub_100063F84(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, id, uint64_t, const __CFString *))(v2 + 16))(v2, v3, v4, @"string");

  return v5;
}

uint64_t sub_100063FE8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v7]);
  if (v9 && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v9, v10) & 1) == 0))
  {
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ value is not an array",  v7));
    uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8LL);
    SEL v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    uint64_t v16 = 0LL;
  }

  else
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        os_log_t v15 = 0LL;
        do
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          if ((objc_opt_isKindOfClass(*(void *)(*((void *)&v24 + 1) + 8LL * (void)v15), a3) & 1) == 0)
          {
            uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ element is not a %@",  v7,  v8,  (void)v24));
            uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8LL);
            uint32_t v19 = *(void **)(v18 + 40);
            *(void *)(v18 + 40) = v17;

            uint64_t v16 = 0LL;
            goto LABEL_13;
          }

          os_log_t v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    uint64_t v16 = 1LL;
LABEL_13:
  }

  return v16;
}

uint64_t sub_1000641B8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, id, uint64_t, const __CFString *))(v2 + 16))(v2, v3, v4, @"data");

  return v5;
}

uint64_t sub_10006421C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, id, uint64_t, const __CFString *))(v2 + 16))(v2, v3, v4, @"string");

  return v5;
}

LABEL_44:
    unsigned int v51 = _MCLogObjects[0];
    id v52 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
    if (v52)
    {
      id v53 = kCCIsSupervisedKey;
      char v54 = v51;
      v55 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:v53]);
      *(_DWORD *)buf = 138543362;
      v83 = v55;
      _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "Storing cloud configuration. (supervised: %{public}@)",  buf,  0xCu);
    }

    v56 = MCCloudConfigurationDetailsFilePath(v52);
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
    v58 = -[MCCloudConfigurationWriter _writeDetails:toFile:](self, "_writeDetails:toFile:", v33, v57);

    v59 = _MCLogObjects[0];
    if ((v58 & 1) == 0)
    {
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_ERROR,  "Could not store cloud configuration.",  buf,  2u);
      }

      v77 = MCCloudConfigErrorDomain;
      v78 = MCErrorArray(@"CLOUD_CONFIG_SAVE_ERROR");
      v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
      v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v77,  33023LL,  v79,  MCErrorTypeFatal,  0LL));

      if (a4) {
        *a4 = v80;
      }

      goto LABEL_17;
    }

    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "Updating CloudConfigUIComplete and CloudConfigWasApplied keys for set aside details.",  buf,  2u);
    }

    [v33 setObject:&__kCFBooleanFalse forKeyedSubscript:kCCCloudConfigurationUICompleteKey];
    v60 = MCCloudConfigurationSetAsideDetailsFilePath([v33 setObject:&__kCFBooleanFalse forKeyedSubscript:kCCCloudConfigurationWasAppliedKey]);
    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
    v62 = -[MCCloudConfigurationWriter _writeDetails:toFile:](self, "_writeDetails:toFile:", v33, v61);

    if ((v62 & 1) == 0)
    {
      v64 = _MCLogObjects[0];
      v63 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR);
      if (v63)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "Could not store set aside details.", buf, 2u);
      }
    }

    v65 = MCCloudConfigurationSetAsideDetailsFilePath(v63);
    v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
    v67 = MCSetSkipBackupAttributeToItemAtPath(v66, 1LL);

    uint64_t v32 = v32;
    if ((v67 & 1) == 0)
    {
      v68 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_ERROR,  "Could not mark set aside cloud configuration to be excluded from backup.",  buf,  2u);
      }
    }

    goto LABEL_55;
  }

  uint64_t v17 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Cannot store cloud configuration because this device is not activated.",  buf,  2u);
  }

  uint64_t v18 = MCCloudConfigErrorDomain;
  uint32_t v19 = MCErrorArray(@"CLOUD_CONFIG_NOT_ACTIVATED");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v18,  33003LL,  v20,  MCErrorTypeFatal,  0LL));

  if (!a4) {
    goto LABEL_17;
  }
  id v8 = v8;
  uint64_t v21 = 0;
  *a4 = v8;
LABEL_18:

  return v21;
}

void sub_100065010(void *a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100065088;
  v2[3] = &unk_1000C3DF0;
  id v3 = a1;
  id v1 = v3;
  AnalyticsSendEventLazy(@"com.apple.managedconfiguration.profilepurgatory.enter", v2);
}

NSMutableDictionary *sub_100065088(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  +[MCProfileAnalyticsHelper addContainsPayloadInfoWithProfile:eventPayload:]( &OBJC_CLASS___MCProfileAnalyticsHelper,  "addContainsPayloadInfoWithProfile:eventPayload:",  *(void *)(a1 + 32),  v2);
  return v2;
}

void sub_1000650CC(void *a1, int a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_10006514C;
  v4[3] = &unk_1000C3E18;
  id v5 = a1;
  int v6 = a2;
  id v3 = v5;
  AnalyticsSendEventLazy(@"com.apple.managedconfiguration.profilepurgatory.exit", v4);
}

NSMutableDictionary *sub_10006514C(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  +[MCProfileAnalyticsHelper addContainsPayloadInfoWithProfile:eventPayload:]( &OBJC_CLASS___MCProfileAnalyticsHelper,  "addContainsPayloadInfoWithProfile:eventPayload:",  *(void *)(a1 + 32),  v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40)));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v3, @"exitReason");

  return v2;
}

void sub_100065414(id a1)
{
  v3[0] = kMCEASAccountPayloadType;
  v3[1] = kMCEmailAccountPayloadType;
  v4[0] = @"profile_containsPayload_mailAccount";
  v4[1] = @"profile_containsPayload_mailAccount";
  void v3[2] = kMCGmailAccountLegacyPayloadType;
  void v3[3] = kMCGmailAccountPayloadType;
  void v4[2] = @"profile_containsPayload_mailAccount";
  v4[3] = @"profile_containsPayload_mailAccount";
  void v3[4] = kMCMDMPayloadType;
  v3[5] = kMCPasswordPolicyPayloadType;
  void v4[4] = @"profile_containsPayload_mdm";
  v4[5] = @"profile_containsPayload_passwordPolicy";
  v3[6] = kMCRestrictionsPayloadType;
  v4[6] = @"profile_containsPayload_restrictions";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
  uint64_t v2 = (void *)qword_1000DC1E0;
  qword_1000DC1E0 = v1;
}

void sub_100066A14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100066A2C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100066A3C(uint64_t a1)
{
}

id sub_100066A44(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    uint64_t v9 = MCOTAProfilesErrorDomain;
    uint64_t v10 = MCErrorArray(@"OTA_SERVER_RETURNED_FORBIDDEN_PROFILE_IN_SDP");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v6 = MCErrorTypeFatal;
    uint64_t v7 = v9;
    uint64_t v8 = 24007LL;
    goto LABEL_5;
  }

  if (a2 == 1)
  {
    uint64_t v3 = MCOTAProfilesErrorDomain;
    uint64_t v4 = MCErrorArray(@"OTA_SERVER_RETURNED_FORBIDDEN_PROFILE_IN_SDP");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = MCErrorTypeFatal;
    uint64_t v7 = v3;
    uint64_t v8 = 24005LL;
LABEL_5:
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v7,  v8,  v5,  v6,  0LL));
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }

  return [*(id *)(a1 + 32) complete];
}

void sub_10006B240(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (os_log_s *)_MCLogObjects[0];
  BOOL v7 = os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v13 = 138543362;
      uint64_t v14 = v8;
      uint64_t v9 = "Removed Google account %{public}@";
      uint64_t v10 = v6;
      uint32_t v11 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, v11);
    }
  }

  else if (v7)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138543618;
    uint64_t v14 = v12;
    __int16 v15 = 2114;
    id v16 = v5;
    uint64_t v9 = "Failed to remove Google account %{public}@ with error: %{public}@";
    uint64_t v10 = v6;
    uint32_t v11 = 22;
    goto LABEL_6;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_10006BDF0(uint64_t a1, uint64_t a2)
{
  uint64_t Name = MISProvisioningProfileGetName(a2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(Name);
  uint64_t UUID = MISProvisioningProfileGetUUID(a2);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(UUID);
  uint64_t ExpirationDate = MISProvisioningProfileGetExpirationDate(a2);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(ExpirationDate);
  uint64_t v10 = v9;
  if (v9
    && (uint32_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 earlierDate:*(void *)(a1 + 32)]),
        v11,
        v11 == v10))
  {
    int v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Provisioning profile “%{public}@” has expired and will be removed.",  (uint8_t *)&v15,  0xCu);
    }

    [*(id *)(a1 + 40) addObject:v7];
  }

  else if (!MISProvisioningProfileIncludesDevice(a2, *(void *)(a1 + 48)))
  {
    uint64_t v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Provisioning profile “%{public}@” is not valid for this device and will be removed.",  (uint8_t *)&v15,  0xCu);
    }
  }

  return 1LL;
}

void sub_10006C244( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t sub_10006C280(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10006C290(uint64_t a1)
{
}

uint64_t sub_10006C298(uint64_t a1, uint64_t a2)
{
  uint64_t ExpirationDate = MISProvisioningProfileGetExpirationDate(a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(ExpirationDate);
  id v5 = v4;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (!*(void *)(v6 + 40)) {
    goto LABEL_5;
  }
  if (v4)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "earlierDate:"));

    if (v7 == v5)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
LABEL_5:
      objc_storeStrong((id *)(v6 + 40), v5);
    }
  }

  return 1LL;
}

id sub_100070030(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendPasscodeChangedNotification];
}

LABEL_45:
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, v44, (uint8_t *)&v49, 0xCu);
            goto LABEL_46;
          }

          uint64_t v37 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            uint64_t v34 = v37;
            v49 = 138543362;
            v50 = (id)objc_opt_class(self);
            int v35 = v50;
            unsigned __int8 v36 = "%{public}@ EAPOLClientItemIDCreateWithProfile() returned NULL";
            goto LABEL_32;
          }
        }

        else
        {
          __int128 v33 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            uint64_t v34 = v33;
            v49 = 138543362;
            v50 = (id)objc_opt_class(self);
            int v35 = v50;
            unsigned __int8 v36 = "%{public}@ EAPOLClientProfileGetID() returned NULL";
LABEL_32:
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, v36, (uint8_t *)&v49, 0xCu);
          }
        }

        __int128 v24 = 0;
LABEL_48:
        CFRelease(v18);
        goto LABEL_49;
      }

      uint64_t v32 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        id v29 = v32;
        v49 = 138543362;
        v50 = (id)objc_opt_class(self);
        uint64_t v30 = v50;
        id v31 = "%{public}@ EAPOLClientProfileCreate() returned NULL";
        goto LABEL_26;
      }
    }

    __int128 v24 = 0;
LABEL_49:
    CFRelease(v15);
    goto LABEL_50;
  }

  __int128 v25 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    __int128 v26 = v25;
    v49 = 138543362;
    v50 = (id)objc_opt_class(self);
    __int128 v27 = v50;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL",  (uint8_t *)&v49,  0xCu);
  }

  __int128 v24 = 0;
LABEL_50:

  return v24;
}

void sub_100071FF4(id a1)
{
  uint64_t v5 = MCNewsBundleIdentifier;
  uint64_t v1 = MCNewsServicesFrameworkPath(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v6 = v2;
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
  uint64_t v4 = (void *)qword_1000DC1F0;
  qword_1000DC1F0 = v3;
}

uint64_t sub_100072EE8()
{
  uint64_t result = lockdown_connect();
  if (result)
  {
    uint64_t v1 = result;
    lockdown_set_value();
    return lockdown_disconnect(v1);
  }

  return result;
}

uint64_t sub_100072F5C()
{
  uint64_t result = lockdown_connect();
  if (result)
  {
    uint64_t v1 = result;
    lockdown_set_value();
    return lockdown_disconnect(v1);
  }

  return result;
}

void sub_100072FD4(id a1, BOOL a2, NSError *a3)
{
  uint64_t v4 = a3;
  if (!a2)
  {
    uint64_t v5 = (os_log_s *)_MCLogObjects[0];
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      BOOL v7 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Could not save account. Error: %{public}@",  (uint8_t *)&v6,  0xCu);
    }
  }
}

void sub_100076368(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("MCKeybagUnlockAssertion serialization queue", 0LL);
  uint64_t v2 = (void *)qword_1000DC200;
  qword_1000DC200 = (uint64_t)v1;
}

void sub_1000763C8(id a1)
{
  if (byte_1000DC210 == 1)
  {
    dispatch_queue_t v1 = (os_log_s *)_MCLogObjects[0];
    if (!os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
      return;
    }
    LOWORD(keys[0]) = 0;
    uint64_t v2 = "Attempting to recursively hold keybag unlock assertion. Ignoring.";
    uint64_t v3 = (uint8_t *)keys;
    uint64_t v4 = v1;
    os_log_type_t v5 = OS_LOG_TYPE_ERROR;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v4, v5, v2, v3, 2u);
    return;
  }

  CFTypeRef cf = 0LL;
  int valuePtr = 600;
  CFNumberRef v6 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  *(_OWORD *)keys = *(_OWORD *)&off_1000C3FD8;
  values[0] = @"RemoteProfile";
  values[1] = v6;
  CFDictionaryRef v7 = CFDictionaryCreate( 0LL,  (const void **)keys,  (const void **)values,  2LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  qword_1000DC218 = MKBDeviceLockAssertion(v7, &cf);
  CFRelease(v7);
  CFRelease(v6);
  if (qword_1000DC218)
  {
    byte_1000DC210 = 1;
    uint64_t v8 = (os_log_s *)_MCLogObjects[0];
    if (!os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_WORD *)buf = 0;
    uint64_t v2 = "Holding keybag unlock assertion.";
    uint64_t v3 = buf;
    uint64_t v4 = v8;
    os_log_type_t v5 = OS_LOG_TYPE_INFO;
    goto LABEL_7;
  }

  uint64_t v9 = (os_log_s *)_MCLogObjects[0];
  if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    CFTypeRef v13 = cf;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Could not hold keybag lock assertion. Error: %{public}@",  buf,  0xCu);
  }

  if (cf) {
    CFRelease(cf);
  }
}

void sub_1000765DC(id a1)
{
  if (byte_1000DC210 == 1)
  {
    dispatch_queue_t v1 = (os_log_s *)_MCLogObjects[0];
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Releasing keybag unlock assertion.", v2, 2u);
    }

    CFRelease((CFTypeRef)qword_1000DC218);
    qword_1000DC218 = 0LL;
    byte_1000DC210 = 0;
  }

uint64_t sub_100076D84(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v7 = *(id *)(a1 + 32);
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        uint32_t v11 = 0LL;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v11);
          CFTypeRef v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID", (void)v18));
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 UUID]);
          unsigned __int8 v15 = [v13 isEqualToString:v14];

          if ((v15 & 1) != 0)
          {
            uint64_t v16 = 0LL;
            goto LABEL_12;
          }

          uint32_t v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v16 = 1LL;
LABEL_12:
  }

  else
  {
    uint64_t v16 = 1LL;
  }

  return v16;
}

id sub_1000796D0(uint64_t a1)
{
  v13[0] = @"isClearingPasscode";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 56)));
  v14[0] = v2;
  v13[1] = @"newPasscodeUnlockScreenType";
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 48)));
  v14[1] = v3;
  void v13[2] = @"newPasscodeSimpleType";
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 52)));
  void v14[2] = v4;
  v13[3] = @"oldPasscodeExists";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 57)));
  v14[3] = v5;
  v13[4] = @"passcodeChangeType";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 40)));
  v14[4] = v6;
  v13[5] = @"passcodeRecoveryRestricted";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 58)));
  v14[5] = v7;
  v13[6] = @"passcodeRecoverySupported";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 59)));
  v14[6] = v8;
  v13[7] = @"recoverySkipped";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 60)));
  v13[8] = @"senderBundleID";
  uint64_t v10 = *(void *)(a1 + 32);
  v14[7] = v9;
  v14[8] = v10;
  uint32_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  9LL));

  return v11;
}

id sub_100079910(uint64_t a1)
{
  uint64_t v4 = @"clearReason";
  dispatch_queue_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 32)));
  id v5 = v1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

uint64_t sub_10007ABD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v26 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v25 + 1) + 8 * v8);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
      uint32_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
      unsigned __int8 v12 = [v10 isEqual:v11];

      if ((v12 & 1) != 0) {
        goto LABEL_18;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v13 = (uint64_t)[v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v22;
LABEL_11:
    uint64_t v15 = 0LL;
    while (1)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(v4);
      }
      uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier", (void)v21));
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
      unsigned __int8 v19 = [v17 isEqual:v18];

      if ((v19 & 1) != 0) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = (uint64_t)[v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v13) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }

uint64_t sub_10007B5B0(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10007B690(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (os_log_s *)_MCLogObjects[2];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to remove application with bundle ID: %{public}@, error: %{public}@",  (uint8_t *)&v10,  0x16u);
    }
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
  }
}

uint64_t sub_10007B77C(char a1, uint64_t a2, char a3, uint64_t a4, char a5, uint64_t a6)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10007B7E4;
  v7[3] = &unk_1000C40C8;
  char v8 = a1;
  char v9 = a3;
  void v7[4] = a2;
  v7[5] = a4;
  char v10 = a5;
  v7[6] = a6;
  return AnalyticsSendEventLazy(@"com.apple.webcontentfilter.listchanged", v7);
}

id sub_10007B7E4(uint64_t a1)
{
  v10[0] = @"autoPermitList_changed";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 56)));
  v11[0] = v2;
  v10[1] = @"autoPermitList_count";
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  *(void *)(a1 + 32)));
  v11[1] = v3;
  _DWORD v10[2] = @"blacklist_changed";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 57)));
  v11[2] = v4;
  v10[3] = @"blacklist_count";
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  *(void *)(a1 + 40)));
  v11[3] = v5;
  v10[4] = @"whitelist_changed";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 58)));
  v11[4] = v6;
  v10[5] = @"whitelist_count";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  *(void *)(a1 + 48)));
  v11[5] = v7;
  char v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  6LL));

  return v8;
}

uint64_t sub_10007B964(char a1, char a2, char a3, char a4)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10007B9C8;
  v5[3] = &unk_1000C40E8;
  char v6 = a1;
  char v7 = a2;
  char v8 = a3;
  char v9 = a4;
  return AnalyticsSendEventLazy(@"com.apple.webcontentfilter.modechanged", v5);
}

id sub_10007B9C8(unsigned __int8 *a1)
{
  v8[0] = @"autoFilter_changed";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a1[32]));
  v9[0] = v2;
  v8[1] = @"autoFilter_enabled";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a1[33]));
  v9[1] = v3;
  v8[2] = @"whitelist_changed";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a1[34]));
  void v9[2] = v4;
  v8[3] = @"whitelist_enabled";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a1[35]));
  v9[3] = v5;
  char v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  4LL));

  return v6;
}

uint64_t sub_10007BAF0()
{
  id v8 = 0LL;
  uint64_t v0 = MAERecertifyDeviceWithError(&v8);
  id v1 = v8;
  uint64_t v2 = (os_log_s *)_MCLogObjects[0];
  if ((_DWORD)v0)
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v3 = "Recertification succeeded.";
      id v4 = v2;
      os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
      uint32_t v6 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v4, v5, v3, buf, v6);
    }
  }

  else if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v1;
    id v3 = "Recertification failed: %{public}@";
    id v4 = v2;
    os_log_type_t v5 = OS_LOG_TYPE_ERROR;
    uint32_t v6 = 12;
    goto LABEL_6;
  }

  return v0;
}

LABEL_52:
    __int128 v41 = 0LL;
    goto LABEL_53;
  }

  v45 = (const void *)MCLockdownCopyBuiltInIdentity();
  if (v45 || sub_10007BAF0() && (v45 = (const void *)MCLockdownCopyBuiltInIdentity()) != 0LL)
  {
    DeviceIntermediateCertificates = MCLockdownGetDeviceIntermediateCertificates();
    v47 = objc_claimAutoreleasedReturnValue(DeviceIntermediateCertificates);
    __int16 v48 = (void *)v47;
    if (v47)
    {
      v66 = kSecCMSAdditionalCerts;
      v67 = v47;
      v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v67,  &v66,  1LL));
    }

    else
    {
      v49 = 0LL;
    }

    id v38 = SecCMSCreateSignedData(v45, v31, v49, 0LL, v30);
    CFRelease(v45);

    if (v38) {
      goto LABEL_38;
    }
    goto LABEL_52;
  }

  unsigned int v51 = MCInstallationErrorDomain;
  id v52 = MCErrorArrayByDevice(@"ERROR_INSTALL_NO_IDENTITY", v50);
  unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue(v52);
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v51,  4014LL,  v36,  MCErrorTypeFatal,  0LL));
  uint64_t v37 = [v33 MCCopyAsPrimaryError];
LABEL_39:
  __int128 v41 = v37;

  if (v41)
  {
    __int128 v42 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      __int128 v43 = v42;
      unsigned __int8 v44 = (void *)objc_claimAutoreleasedReturnValue([v41 MCVerboseDescription]);
      *(_DWORD *)buf = 138543362;
      v65 = v44;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "Could not create machine info dictionary. Error: %{public}@",  buf,  0xCu);
    }

    if (a7)
    {
      __int128 v41 = v41;
      *a7 = v41;
    }
  }

LABEL_53:
  return v30;
}

void sub_10007E508( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

uint64_t sub_10007E56C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10007E57C(uint64_t a1)
{
}

void sub_10007E584(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007E638;
  v6[3] = &unk_1000C4170;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  __int128 v5 = *(_OWORD *)(a1 + 64);
  id v4 = (id)v5;
  __int128 v9 = v5;
  [v2 insertAccountType:v3 withCompletionHandler:v6];
}

void sub_10007E638(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2) {
    [*(id *)(a1 + 32) setAccountTypeGUID:*(void *)(a1 + 40)];
  }
  else {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10007E6A4(uint64_t a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007E780;
  block[3] = &unk_1000C41C0;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  __int128 v5 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v5;
  __int128 v10 = v5;
  dispatch_async(v3, block);

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);
}

void sub_10007E780(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007E834;
  v6[3] = &unk_1000C4170;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  __int128 v5 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v5;
  __int128 v9 = v5;
  [v2 saveVerifiedAccount:v3 withCompletionHandler:v6];
}

void sub_10007E834(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v9 = v5;
  if (a2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
    [*(id *)(a1 + 32) setAccountGUID:v6];
  }

  else
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v8 = v5;
    id v6 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10007E8B4(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  void v3[2] = sub_10007E928;
  void v3[3] = &unk_1000C41E8;
  id v4 = *(id *)(a1 + 48);
  [v1 removeAccount:v2 withCompletionHandler:v3];
}

void sub_10007E928(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = (os_log_s *)_MCLogObjects[0];
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      uint64_t v7 = "Rolled back Kerberos account.";
      id v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
      uint32_t v10 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }

  else if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    int v11 = 138543362;
    id v12 = v5;
    uint64_t v7 = "Warning: unable to remove Kerberos account while rolling back installation. Error: %{public}@";
    id v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 12;
    goto LABEL_6;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10007EA20(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  void v3[2] = sub_10007EA94;
  void v3[3] = &unk_1000C41E8;
  id v4 = *(id *)(a1 + 48);
  [v1 removeAccountType:v2 withCompletionHandler:v3];
}

void sub_10007EA94(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = (os_log_s *)_MCLogObjects[0];
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      uint64_t v7 = "Rolled back Kerberos account type.";
      id v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
      uint32_t v10 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }

  else if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    int v11 = 138543362;
    id v12 = v5;
    uint64_t v7 = "Warning: unable to remove Kerberos account type while rolling back installation. Error: %{public}@";
    id v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 12;
    goto LABEL_6;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10007F130(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_10007F1C4;
  v4[3] = &unk_1000C3E88;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 removeAccount:v3 withCompletionHandler:v4];
}

void sub_10007F1C4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = _MCLogObjects[0];
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Remove SSO payload: account removal complete",  (uint8_t *)&v10,  2u);
    }
  }

  else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = v6;
    os_log_type_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 humanReadableName]);
    int v10 = 138543618;
    int v11 = v9;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Warning: Failed to remove Kerberos account for “%{public}@”. Ignoring. Error: %{public}@",  (uint8_t *)&v10,  0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10007F2F0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_10007F384;
  v4[3] = &unk_1000C3E88;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 removeAccountType:v3 withCompletionHandler:v4];
}

void sub_10007F384(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = _MCLogObjects[0];
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Remove SSO payload: account type removal complete",  (uint8_t *)&v10,  2u);
    }
  }

  else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = v6;
    os_log_type_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 humanReadableName]);
    int v10 = 138543618;
    int v11 = v9;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Warning: Failed to remove Kerberos account type for “%{public}@”. Ignoring. Error: %{public}@",  (uint8_t *)&v10,  0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_1000819BC()
{
}

void sub_100081A3C()
{
}

void sub_100081ABC()
{
}

void sub_100081B3C()
{
}

void sub_100081BBC()
{
}

void sub_100081C3C()
{
}

void sub_100081CBC()
{
}

void sub_100081D3C()
{
}

void sub_100081DBC()
{
}

void sub_100081E3C()
{
}

void sub_100081EBC()
{
}

void sub_100081F3C()
{
}

void sub_100081FBC()
{
}

void sub_10008203C()
{
}

void sub_1000820BC()
{
}

void sub_10008213C()
{
}

void sub_1000821BC()
{
}

void sub_10008223C()
{
}

void sub_1000822BC()
{
}

void sub_10008233C()
{
}

void sub_1000823BC()
{
}

void sub_10008243C()
{
}

void sub_1000824BC()
{
}

void sub_10008253C()
{
}

void sub_1000825BC()
{
}

void sub_10008263C()
{
}

void sub_1000826BC()
{
}

void sub_10008273C()
{
}

void sub_1000827BC()
{
}

void sub_10008283C()
{
}

void sub_1000828BC()
{
}

void sub_10008293C()
{
}

void sub_1000829BC()
{
}

void sub_100082A3C()
{
}

void sub_100082ABC()
{
}

void sub_100082B3C()
{
}

void sub_100082BBC()
{
}

void sub_100082C3C()
{
}

void sub_100082CBC()
{
}

void sub_100082D3C()
{
}

id objc_msgSend_MCErrorWithDomain_code_descriptionArray_suggestion_USEnglishSuggestion_underlyingError_errorType_extraUserInfo_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:extraUserInfo:");
}

id objc_msgSend__WiFiAssistConfigurationForPayloads_includingPayloads_excludingPayloads_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_WiFiAssistConfigurationForPayloads:includingPayloads:excludingPayloads:error:");
}

id objc_msgSend__applyServerSideChangesWithOldRestrictions_newRestrictions_oldEffectiveUserSettings_newEffectiveUserSettings_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_applyServerSideChangesWithOldRestrictions:newRestrictions:oldEffectiveUserSettings:newEffectiveUserSettings:");
}

id objc_msgSend__cleanUpAfterRemovingProfileWithIdentifier_installedForUser_profileHandler_oldRestrictions_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanUpAfterRemovingProfileWithIdentifier:installedForUser:profileHandler:oldRestrictions:");
}

id objc_msgSend__createSystemProfileStorageDirectoryMigratingFromLegacyStorageIfNecessary( void *a1, const char *a2, ...)
{
  return [a1 _createSystemProfileStorageDirectoryMigratingFromLegacyStorageIfNecessary];
}

id objc_msgSend__generatedManifestIfNeededFromOrderedProfiles_hiddenProfiles_existingManifest_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generatedManifestIfNeededFromOrderedProfiles:hiddenProfiles:existingManifest:");
}

id objc_msgSend__handleXPCActivity_proposedStartDate_normalizeStartDate_proposedGracePeriod_proposedPriority_repeatingInterval_requireNetwork_requireUnlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_handleXPCActivity:proposedStartDate:normalizeStartDate:proposedGracePeriod:proposedPriority:repeatingInterva l:requireNetwork:requireUnlock:");
}

id objc_msgSend__installEAPConfiguration_isHotspot_securityType_authProperties_username_password_identity_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installEAPConfiguration:isHotspot:securityType:authProperties:username:password:identity:");
}

id objc_msgSend__installWithIncomingAccountInfo_outgoingAccountInfo_isInstalledByMDM_personaID_rmAccountIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_installWithIncomingAccountInfo:outgoingAccountInfo:isInstalledByMDM:personaID:rmAccountIdentifier:");
}

id objc_msgSend__memberQueueNewUserSettingsWithParametersForSettingsByType_currentUserSettings_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_memberQueueNewUserSettingsWithParametersForSettingsByType:currentUserSettings:");
}

id objc_msgSend__migrateBoolRestrictions_withAppID_forKey_valuesToRestrictions_currentBoolUserSettings_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migrateBoolRestrictions:withAppID:forKey:valuesToRestrictions:currentBoolUserSettings:");
}

id objc_msgSend__migrateValueRestrictions_withAppID_forKey_keysToRestricitons_currentValueUserSettings_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migrateValueRestrictions:withAppID:forKey:keysToRestricitons:currentValueUserSettings:");
}

id objc_msgSend__persistentIDForCertificateUUID_notFoundLocErrorString_badLocErrorString_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_persistentIDForCertificateUUID:notFoundLocErrorString:badLocErrorString:outError:");
}

id objc_msgSend__promptUserForComplianceWithRestrictions_handler_interactionClient_outPasscode_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptUserForComplianceWithRestrictions:handler:interactionClient:outPasscode:outError:");
}

id objc_msgSend__reallyRemoveInstalledProfileWithIdentifier_installationType_options_source_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reallyRemoveInstalledProfileWithIdentifier:installationType:options:source:");
}

id objc_msgSend__reallyRemoveProfileWithIdentifier_installationType_profileInstalled_targetDeviceType_options_source_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_reallyRemoveProfileWithIdentifier:installationType:profileInstalled:targetDeviceType:options:source:");
}

id objc_msgSend__rebuildWiFiAssistConfigurationIncludingPayloads_excludingPayloads_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rebuildWiFiAssistConfigurationIncludingPayloads:excludingPayloads:error:");
}

id objc_msgSend__receivedUserInput_preflight_payloadIndex_delegate_semaphore_error_outResponses_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_receivedUserInput:preflight:payloadIndex:delegate:semaphore:error:outResponses:");
}

id objc_msgSend__rescheduleBackgroundActivity_startDate_gracePeriod_priority_repeatingInterval_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:");
}

id objc_msgSend__sendCloudConfigurationChangedNotificationIfWeMigratedLegacyProfileStorage( void *a1, const char *a2, ...)
{
  return [a1 _sendCloudConfigurationChangedNotificationIfWeMigratedLegacyProfileStorage];
}

id objc_msgSend__showWarningsForUpdatingProfile_originalProfile_interactionClient_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showWarningsForUpdatingProfile:originalProfile:interactionClient:outError:");
}

id objc_msgSend__synchronousTransactionWithURL_method_content_contentType_outResponseCode_outContentType_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_synchronousTransactionWithURL:method:content:contentType:outResponseCode:outContentType:outError:");
}

id objc_msgSend__workerQueueCheckCarrierProfileForCarrierIdentifier_name_atPath_forceReinstallation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_workerQueueCheckCarrierProfileForCarrierIdentifier:name:atPath:forceReinstallation:");
}

id objc_msgSend__workerQueue_setParametersForSettingsByType_configurationUUID_toSystem_user_passcode_credentialSet_senderPID_sender_assertion_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_workerQueue_setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:senderPID: sender:assertion:completion:");
}

id objc_msgSend_addTrustedCodeSigningIdentitiesForProvisioningProfileUUID_sender_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:sender:completion:");
}

id objc_msgSend_allowedImportFromAppBundleIDs_importingAppBundleID_importingIsManaged_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedImportFromAppBundleIDs:importingAppBundleID:importingIsManaged:completion:");
}

id objc_msgSend_allowedImportFromAppBundleIDsWithOriginalAppBundleIDs_managedAppBundleIDs_localAppBundleID_localAccountIsManaged_mayOpenFromUnmanagedToManaged_mayOpenFromManagedToUnmanaged_isAppBundleIDExemptBlock_isAppBundleIDAccountBasedBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "allowedImportFromAppBundleIDsWithOriginalAppBundleIDs:managedAppBundleIDs:localAppBundleID:localAccountIsMana ged:mayOpenFromUnmanagedToManaged:mayOpenFromManagedToUnmanaged:isAppBundleIDExemptBlock:isAppBundleIDAccountBasedBlock:");
}

id objc_msgSend_allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_managedAppBundleIDs_hostAppIsManaged_mayOpenFromUnmanagedToManaged_mayOpenFromManagedToUnmanaged_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:managedAppBundleIDs:hostAppIsManaged:mayOpenFromUnmana gedToManaged:mayOpenFromManagedToUnmanaged:");
}

id objc_msgSend_allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs_messageSendingAppBundleID_hostAppBundleID_accountIsManaged_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:messageSendingAppBundleID:hostAppBundleID:accountIsMan aged:completion:");
}

id objc_msgSend_allowedOpenInAppBundleIDs_originatingAppBundleID_originatingIsManaged_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedOpenInAppBundleIDs:originatingAppBundleID:originatingIsManaged:completion:");
}

id objc_msgSend_allowedOpenInAppBundleIDsWithOriginalAppBundleIDs_managedAppBundleIDs_localAppBundleID_localAccountIsManaged_mayOpenFromUnmanagedToManaged_mayOpenFromManagedToUnmanaged_isAppBundleIDExemptBlock_isAppBundleIDAccountBasedBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "allowedOpenInAppBundleIDsWithOriginalAppBundleIDs:managedAppBundleIDs:localAppBundleID:localAccountIsManaged: mayOpenFromUnmanagedToManaged:mayOpenFromManagedToUnmanaged:isAppBundleIDExemptBlock:isAppBundleIDAccountBasedBlock:");
}

id objc_msgSend_applyPairingWatchMDMEnrollmentData_source_usingProfileInstaller_cloudConfigReader_cloudConfigWriter_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "applyPairingWatchMDMEnrollmentData:source:usingProfileInstaller:cloudConfigReader:cloudConfigWriter:completion:");
}

id objc_msgSend_applyRestrictionDictionary_overrideRestrictions_appsAndOptions_clientType_clientUUID_sender_localizedClientDescription_localizedWarningMessage_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "applyRestrictionDictionary:overrideRestrictions:appsAndOptions:clientType:clientUUID:sender:localizedClientDe scription:localizedWarningMessage:completion:");
}

id objc_msgSend_authenticateWithCheckInURL_identity_pinnedSecCertificateRefs_pinningRevocationCheckRequired_topic_useDevelopmentAPNS_signMessage_isUserEnrollment_enrollmentID_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "authenticateWithCheckInURL:identity:pinnedSecCertificateRefs:pinningRevocationCheckRequired:topic:useDevelopm entAPNS:signMessage:isUserEnrollment:enrollmentID:outError:");
}

id objc_msgSend_canonicalPersistentReferenceForItemWithPersistentReference_inSystemKeychain_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canonicalPersistentReferenceForItemWithPersistentReference:inSystemKeychain:");
}

id objc_msgSend_changePasscodeWithRecoveryPasscode_to_skipRecovery_senderBundleID_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changePasscodeWithRecoveryPasscode:to:skipRecovery:senderBundleID:outError:");
}

id objc_msgSend_checkOutCheckInURL_identity_pinnedSecCertificateRefs_pinningRevocationCheckRequired_topic_signMessage_isUserEnrollment_enrollmentID_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "checkOutCheckInURL:identity:pinnedSecCertificateRefs:pinningRevocationCheckRequired:topic:signMessage:isUserE nrollment:enrollmentID:outError:");
}

id objc_msgSend_copyCertificatesWithPersistentIDs_useSystemKeychain_enforcePersonalPersona_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCertificatesWithPersistentIDs:useSystemKeychain:enforcePersonalPersona:");
}

id objc_msgSend_debugRescheduleBackgroundActivity_startDate_gracePeriod_repeatingInterval_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugRescheduleBackgroundActivity:startDate:gracePeriod:repeatingInterval:completion:");
}

id objc_msgSend_defaultAppBundleIDForCommunicationServiceType_forAccountWithIdentifier_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultAppBundleIDForCommunicationServiceType:forAccountWithIdentifier:completion:");
}

id objc_msgSend_displayUserNotificationWithIdentifier_title_message_defaultButtonText_alternateButtonText_otherButtonText_textfieldPlaceholder_displayOnLockScreen_dismissOnLock_displayInAppWhitelistModes_dismissAfterTimeInterval_assertion_completionBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:tex tfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:asser tion:completionBlock:");
}

id objc_msgSend_existingProfileContainingPayloadClass_inProfilesWithFilterFlags_excludingProfileIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "existingProfileContainingPayloadClass:inProfilesWithFilterFlags:excludingProfileIdentifier:");
}

id objc_msgSend_generateSelfSignedCertificatePublicKey_privateKey_keyUsage_extendedKeyUsage_lifetime_outCert_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "generateSelfSignedCertificatePublicKey:privateKey:keyUsage:extendedKeyUsage:lifetime:outCert:");
}

id objc_msgSend_interactionClient_didRequestPreflightUserInputResponses_forPayloadIndex_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interactionClient:didRequestPreflightUserInputResponses:forPayloadIndex:outError:");
}

id objc_msgSend_intersectedValuesForFeature_changedBetweenOldRestrictions_andNewRestrictions_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intersectedValuesForFeature:changedBetweenOldRestrictions:andNewRestrictions:");
}

id objc_msgSend_loadMailAccountsWithAuditToken_filteringEnabled_sourceAccountManagement_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadMailAccountsWithAuditToken:filteringEnabled:sourceAccountManagement:completion:");
}

id objc_msgSend_mayShareToAirDropForOriginatingAppBundleID_originatingAccountIsManaged_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mayShareToAirDropForOriginatingAppBundleID:originatingAccountIsManaged:completion:");
}

id objc_msgSend_mayShareToMessagesForOriginatingAppBundleID_originatingAccountIsManaged_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mayShareToMessagesForOriginatingAppBundleID:originatingAccountIsManaged:completion:");
}

id objc_msgSend_memberQueueMarkToClearPasscodeComplianceCacheWithOldSystemClientRestrictions_newSystemClientRestrictions_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "memberQueueMarkToClearPasscodeComplianceCacheWithOldSystemClientRestrictions:newSystemClientRestrictions:");
}

id objc_msgSend_memberQueueSetAllClientRestrictions_sender_outRestrictionsChanged_outEffectiveSettingsChanged_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "memberQueueSetAllClientRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outError:");
}

id objc_msgSend_memberQueueSetParametersForSettingsByType_configurationUUID_toSystem_user_passcode_credentialSet_sender_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "memberQueueSetParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:sender:");
}

id objc_msgSend_memberQueueSetSystemClientRestrictions_userClientRestrictions_sender_outRestrictionsChanged_outEffectiveSettingsChanged_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "memberQueueSetSystemClientRestrictions:userClientRestrictions:sender:outRestrictionsChanged:outEffectiveSetti ngsChanged:outError:");
}

id objc_msgSend_processPasscodeChangeWithOldPascodeGeneration_oldPublicDict_newPasscodeGeneration_newPublicDict_newPasscodeWasSet_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "processPasscodeChangeWithOldPascodeGeneration:oldPublicDict:newPasscodeGeneration:newPublicDict:newPasscodeWasSet:");
}

id objc_msgSend_promptDictionaryForKey_title_description_retypeDescription_finePrint_defaultValue_placeholderValue_minimumLength_fieldType_flags_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLen gth:fieldType:flags:");
}

id objc_msgSend_queueProfileDataForInstallation_originalFileName_originatingBundleID_transitionToUI_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "queueProfileDataForInstallation:originalFileName:originatingBundleID:transitionToUI:completion:");
}

id objc_msgSend_recomputeHacksAfterProfileChangesEffectiveUserSettings_sendNotifications_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recomputeHacksAfterProfileChangesEffectiveUserSettings:sendNotifications:");
}

id objc_msgSend_recomputeWebContentFilterEffectiveUserSettings_outEffectiveChangeDetected_outMechanismChangedDetected_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recomputeWebContentFilterEffectiveUserSettings:outEffectiveChangeDetected:outMechanismChangedDetected:");
}

id objc_msgSend_removeProvisioningProfileWithUUID_managingProfileIdentifier_sender_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeProvisioningProfileWithUUID:managingProfileIdentifier:sender:completion:");
}

id objc_msgSend_removeUninstalledProfileWithIdentifier_installationType_targetDeviceType_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeUninstalledProfileWithIdentifier:installationType:targetDeviceType:");
}

id objc_msgSend_removeUninstalledProfileWithIdentifier_installationType_targetDeviceType_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeUninstalledProfileWithIdentifier:installationType:targetDeviceType:completion:");
}

id objc_msgSend_restrictionsAfterApplyingRestrictionsDictionary_toRestrictionsDictionary_outChangeDetected_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:");
}

id objc_msgSend_restrictionsWithCurrentRestrictions_defaultRestrictions_systemProfileRestrictions_userProfileRestrictions_systemClientRestrictions_userClientRestrictions_outRestrictionsChanged_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "restrictionsWithCurrentRestrictions:defaultRestrictions:systemProfileRestrictions:userProfileRestrictions:sys temClientRestrictions:userClientRestrictions:outRestrictionsChanged:outError:");
}

id objc_msgSend_saveItem_withLabel_group_useSystemKeychain_enforcePersonalPersona_accessibility_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:accessibility:");
}

id objc_msgSend_sendPasscodeChangedEventWithChangeType_oldPasscodeExists_isClearingPasscode_newPasscodeUnlockScreenType_newPasscodeSimpleType_passcodeRecoverySupported_passcodeRecoveryRestricted_recoverySkipped_senderBundleID_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPa sscodeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:");
}

id objc_msgSend_setAllClientRestrictions_sender_outRestrictionsChanged_outEffectiveSettingsChanged_outRecomputedNag_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setAllClientRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:");
}

id objc_msgSend_setClientRestrictions_clientType_clientUUID_sender_localizedClientDescription_localizedWarning_outRestrictionsChanged_outEffectiveSettingsChanged_outRecomputedNag_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setClientRestrictions:clientType:clientUUID:sender:localizedClientDescription:localizedWarning:outRestriction sChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:");
}

id objc_msgSend_setClientRestrictions_overrideRestrictions_appsAndOptions_system_clientType_clientUUID_sender_localizedClientDescription_localizedWarning_shouldRecomputeNag_outRestrictionsChanged_outEffectiveSettingsChanged_outRecomputedNag_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setClientRestrictions:overrideRestrictions:appsAndOptions:system:clientType:clientUUID:sender:localizedClient Description:localizedWarning:shouldRecomputeNag:outRestrictionsChanged:outEffectiveSettingsChanged:outRecompu tedNag:outError:");
}

id objc_msgSend_setCurrentEphemeralUserPasscodeTypeFromUnlockScreenType_simplePasscodeType_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentEphemeralUserPasscodeTypeFromUnlockScreenType:simplePasscodeType:");
}

id objc_msgSend_setData_forService_account_label_description_access_useSystemKeychain_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:forService:account:label:description:access:useSystemKeychain:outError:");
}

id objc_msgSend_setParametersForSettingsByType_configurationUUID_toSystem_user_passcode_credentialSet_sender_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:sender:");
}

id objc_msgSend_setParametersForSettingsByType_configurationUUID_toSystem_user_passcode_credentialSet_senderPID_sender_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:senderPID:sender:completion:");
}

id objc_msgSend_setString_forService_account_label_description_access_group_useSystemKeychain_sysBound_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:");
}

id objc_msgSend_setString_forService_account_label_description_group_useSystemKeychain_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setString:forService:account:label:description:group:useSystemKeychain:outError:");
}

id objc_msgSend_setString_forService_account_label_description_useSystemKeychain_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setString:forService:account:label:description:useSystemKeychain:outError:");
}

id objc_msgSend_setSystemProfileRestrictions_userProfileRestrictions_sender_outRestrictionsChanged_outEffectiveSettingsChanged_outAppWhitelistSettingsChanged_outRecomputedNag_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setSystemProfileRestrictions:userProfileRestrictions:sender:outRestrictionsChanged:outEffectiveSettingsChange d:outAppWhitelistSettingsChanged:outRecomputedNag:outError:");
}

id objc_msgSend_shouldApplyFilterForBundleID_sourceAccountManagement_outAllowManagedAccounts_outAllowUnmanagedAccounts_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "shouldApplyFilterForBundleID:sourceAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:");
}

id objc_msgSend_stageMDMEnrollmentInfoForPairingWatchWithProfileData_orServiceURL_anchorCertificates_supervised_declarationKeys_declarationConfiguration_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "stageMDMEnrollmentInfoForPairingWatchWithProfileData:orServiceURL:anchorCertificates:supervised:declarationKe ys:declarationConfiguration:completion:");
}

id objc_msgSend_startWatchEnrollmentFlowWithServiceURL_anchorCertificates_restartIfFail_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWatchEnrollmentFlowWithServiceURL:anchorCertificates:restartIfFail:completionHandler:");
}

id objc_msgSend_updatePasscodeHistoryWithOldPasscode_oldPasscodeData_newPrivateDictionary_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePasscodeHistoryWithOldPasscode:oldPasscodeData:newPrivateDictionary:");
}

id objc_msgSend_updateTrustedCodeSigningIdentities_validateBundleIDs_validateManagedApps_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateTrustedCodeSigningIdentities:validateBundleIDs:validateManagedApps:");
}

id objc_msgSend_validateCapabilitiesRequiredByRestrictions_localizedIncompatibilityMessage_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateCapabilitiesRequiredByRestrictions:localizedIncompatibilityMessage:outError:");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}