@interface LibraryService
- (LibraryService)init;
- (void)cancelApp:(id)a3 withReplyHandler:(id)a4;
- (void)catalogRefreshedBundleIDs:(id)a3;
- (void)catalogRegisteredApps:(id)a3;
- (void)catalogUnregisteredBundleIDs:(id)a3;
- (void)executeQueryForUpdatesReloadingFromServer:(BOOL)a3 withReplyHandler:(id)a4;
- (void)executeQueryWithPredicate:(id)a3 withReplyHandler:(id)a4;
- (void)launchApp:(id)a3 extensionType:(int64_t)a4 withReplyHandler:(id)a5;
- (void)launchApp:(id)a3 withReplyHandler:(id)a4;
- (void)lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs:(id)a3 withReplyHandler:(id)a4;
- (void)lookupBundleIDsForDeletableSystemAppsWithItemIDs:(id)a3 withReplyHandler:(id)a4;
- (void)lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs:(id)a3 withReplyHandler:(id)a4;
- (void)lookupItemIDsForDeletableSystemAppsWithBundleIDs:(id)a3 withReplyHandler:(id)a4;
- (void)openableStatusForExecutableAtPath:(id)a3 withReplyHandler:(id)a4;
- (void)pauseApp:(id)a3 withReplyHandler:(id)a4;
- (void)resumeApp:(id)a3 withReplyHandler:(id)a4;
- (void)uninstallApp:(id)a3 requestUserConfirmation:(BOOL)a4 withReplyHandler:(id)a5;
@end

@implementation LibraryService

- (LibraryService)init
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___LibraryService;
  v2 = -[LibraryService init](&v26, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.AppStoreFoundation.LibraryService", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    id v7 = sub_1002B0944((uint64_t)&OBJC_CLASS___ProgressCache);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v27[0] = v8;
    id v9 = sub_1002613EC((uint64_t)&OBJC_CLASS___LaunchServicesCatalog);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v27[1] = v10;
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));
    libraryCatalogs = v2->_libraryCatalogs;
    v2->_libraryCatalogs = (NSArray *)v11;

    id v13 = sub_1002613EC((uint64_t)&OBJC_CLASS___LaunchServicesCatalog);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    libraryOpen = v2->_libraryOpen;
    v2->_libraryOpen = (LibraryOpen *)v14;

    id v16 = sub_10019C708((uint64_t)&OBJC_CLASS___LaunchServicesProgress);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    libraryProgress = v2->_libraryProgress;
    v2->_libraryProgress = (LibraryProgress *)v17;

    v19 = objc_opt_new(&OBJC_CLASS___InstallCoordinationUninstaller);
    libraryUninstall = v2->_libraryUninstall;
    v2->_libraryUninstall = (LibraryUninstall *)v19;

    -[NSArray makeObjectsPerformSelector:withObject:]( v2->_libraryCatalogs,  "makeObjectsPerformSelector:withObject:",  "setObserver:",  v2);
    if (&OBJC_CLASS___XPCNotificationSource)
    {
      v21 = sub_10023FA70( (uint64_t)&OBJC_CLASS___XPCNotificationSource,  ASDAppLibraryServiceNotificationName,  @"Library",  0LL,  &stru_1003F1DE0);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    }

    else
    {
      v22 = 0LL;
    }

    id v23 = sub_1002E78A4((uint64_t)&OBJC_CLASS___XPCNotificationCenter);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    sub_1002E7EE4((uint64_t)v24, v22);
  }

  return v2;
}

- (void)executeQueryWithPredicate:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002D19F0;
  v14[3] = &unk_1003EA5C0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v9;
  id v17 = v7;
  id v11 = v7;
  id v12 = v9;
  id v13 = v6;
  sub_10022ED10(dispatchQueue, v14);
}

- (void)executeQueryForUpdatesReloadingFromServer:(BOOL)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  id v7 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  dispatchQueue = self->_dispatchQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002D2194;
  v12[3] = &unk_1003F0A38;
  BOOL v16 = a3;
  id v13 = v8;
  uint64_t v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v8;
  sub_10022ED10(dispatchQueue, v12);
}

- (void)cancelApp:(id)a3 withReplyHandler:(id)a4
{
}

- (void)pauseApp:(id)a3 withReplyHandler:(id)a4
{
}

- (void)resumeApp:(id)a3 withReplyHandler:(id)a4
{
}

- (void)openableStatusForExecutableAtPath:(id)a3 withReplyHandler:(id)a4
{
  id v7 = a4;
  uint64_t v6 = sub_10029B370((uint64_t)&OBJC_CLASS___FairPlay, a3);
  (*((void (**)(id, void, uint64_t))a4 + 2))(v7, 0LL, v6);
}

- (void)launchApp:(id)a3 extensionType:(int64_t)a4 withReplyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = ASDLogHandleForCategory(15LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 processInfo]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
    int v16 = 138543874;
    id v17 = v11;
    __int16 v18 = 2114;
    v19 = v15;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Launching messages extension for %{public}@: %{public}@",  (uint8_t *)&v16,  0x20u);
  }

  -[LibraryOpen launchApp:extensionType:withResultHandler:]( self->_libraryOpen,  "launchApp:extensionType:withResultHandler:",  v8,  a4,  v9);
}

- (void)launchApp:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = ASDLogHandleForCategory(15LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 processInfo]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
    int v14 = 138543874;
    id v15 = v9;
    __int16 v16 = 2114;
    id v17 = v13;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Launching app for %{public}@: %{public}@",  (uint8_t *)&v14,  0x20u);
  }

  -[LibraryOpen launchApp:withResultHandler:](self->_libraryOpen, "launchApp:withResultHandler:", v6, v7);
}

- (void)lookupBundleIDsForDeletableSystemAppsWithItemIDs:(id)a3 withReplyHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = ASDErrorWithUserInfoAndFormat(909LL, 0LL, @"This lookup is not supported for this platform");
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v7);
}

- (void)lookupItemIDsForDeletableSystemAppsWithBundleIDs:(id)a3 withReplyHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = ASDErrorWithUserInfoAndFormat(909LL, 0LL, @"This lookup is not supported for this platform");
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v7);
}

- (void)lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs:(id)a3 withReplyHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = ASDErrorWithUserInfoAndFormat(909LL, 0LL, @"This lookup is not supported for this platform");
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v7);
}

- (void)lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs:(id)a3 withReplyHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = ASDErrorWithUserInfoAndFormat(909LL, 0LL, @"This lookup is not supported for this platform");
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v7);
}

- (void)uninstallApp:(id)a3 requestUserConfirmation:(BOOL)a4 withReplyHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = ASDLogHandleForCategory(15LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v11 processInfo]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
    *(_DWORD *)buf = 138543874;
    id v23 = v11;
    __int16 v24 = 2114;
    v25 = v15;
    __int16 v26 = 2114;
    id v27 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Uninstalling app for %{public}@: %{public}@",  buf,  0x20u);
  }

  libraryUninstall = self->_libraryUninstall;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1002D2C84;
  v19[3] = &unk_1003EA020;
  id v20 = v8;
  id v21 = v9;
  id v17 = v9;
  id v18 = v8;
  -[LibraryUninstall uninstallApp:requestUserConfirmation:withResultHandler:]( libraryUninstall,  "uninstallApp:requestUserConfirmation:withResultHandler:",  v18,  v6,  v19);
}

- (void)catalogRegisteredApps:(id)a3
{
  id v3 = sub_1002254BC((uint64_t)&OBJC_CLASS___ASDNotification, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue(v3);
  id v4 = sub_1002E78A4((uint64_t)&OBJC_CLASS___XPCNotificationCenter);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1002E79EC((uint64_t)v5, v6);
}

- (void)catalogRefreshedBundleIDs:(id)a3
{
  id v3 = sub_1002252F4((uint64_t)&OBJC_CLASS___ASDNotification, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue(v3);
  id v4 = sub_1002E78A4((uint64_t)&OBJC_CLASS___XPCNotificationCenter);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1002E79EC((uint64_t)v5, v6);
}

- (void)catalogUnregisteredBundleIDs:(id)a3
{
  id v3 = sub_1002255A0((uint64_t)&OBJC_CLASS___ASDNotification, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue(v3);
  id v4 = sub_1002E78A4((uint64_t)&OBJC_CLASS___XPCNotificationCenter);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1002E79EC((uint64_t)v5, v6);
}

- (void).cxx_destruct
{
}

@end