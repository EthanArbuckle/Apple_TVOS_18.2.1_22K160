@interface StoreDownloadQueue
+ (id)sharedDownloadQueue;
+ (void)cancelRedownloadsWithMessage:(id)a3 connection:(id)a4;
+ (void)getAutomaticDownloadKindsWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)reloadFromServerWithMessage:(id)a3 connection:(id)a4;
+ (void)setAutomaticDownloadKindsWithMessage:(id)a3 connection:(id)a4;
+ (void)synchronizeAutomaticDownloadKindsWithMessage:(id)a3 connection:(id)a4;
+ (void)triggerDownloadsWithMessage:(id)a3 connection:(id)a4;
- (BOOL)_ignoreVideos;
- (BOOL)cancelAllRedownloads;
- (BOOL)checkQueuesWithReason:(id)a3 accountID:(id)a4;
- (NSSet)automaticDownloadKinds;
- (NSSet)downloadKindsBeingChecked;
- (NSSet)enabledDownloadKinds;
- (StoreDownloadQueue)init;
- (id)_automaticDownloadsQueryWithDatabase:(id)a3 accountID:(id)a4;
- (id)_downloadQueryWithQueueRequest:(id)a3 database:(id)a4;
- (id)_newCheckQueueOperationForQueueRequest:(id)a3;
- (id)_newLoadQueueOperationForQueueRequest:(id)a3;
- (id)_newOperationByCommitingAutomaticDownloadKinds:(id)a3 account:(id)a4;
- (id)_newQueueRequestsWithReason:(id)a3 accountID:(id)a4 session:(id)a5;
- (id)_newSetAutomaticDownloadKindsOperationWithDownloadKinds:(id)a3 account:(id)a4;
- (id)_restorableDownloadsQueryInDatabase:(id)a3;
- (id)_validQueueIdentifiersForDaemon;
- (id)_validQueueIdentifiersForPlatform;
- (void)_accountAuthenticatedNotification:(id)a3;
- (void)_accountStoreChangedNotification:(id)a3;
- (void)_addOperationsForRequests:(id)a3 reason:(id)a4;
- (void)_checkAutomaticDownloadQueue:(id)a3;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5;
- (void)_networkTypeChangedNotification:(id)a3;
- (void)_retryCanceledRestoreDownloads;
- (void)_retrySoftFailedRestoreDownloads;
- (void)_setLastCheckedAccountID:(id)a3;
- (void)_synchronizeAutomaticDownloadKinds:(id)a3;
- (void)checkAutomaticDownloadQueue;
- (void)checkQueuesWithRequest:(id)a3;
- (void)commitAutomaticDownloadKinds:(id)a3 markAsDirty:(BOOL)a4;
- (void)dealloc;
- (void)disableAutomaticDownloadsWithReason:(id)a3;
- (void)enableAutomaticDownloadsWithReason:(id)a3;
- (void)restoreAllRestorableDownloadsWithReason:(id)a3;
- (void)restoreDownloadsWithIdentifiers:(id)a3 reason:(id)a4;
- (void)setAutomaticDownloadKinds:(id)a3;
- (void)setAutomaticDownloadKinds:(id)a3 account:(id)a4;
- (void)synchronizeAutomaticDownloadKinds;
@end

@implementation StoreDownloadQueue

- (StoreDownloadQueue)init
{
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___StoreDownloadQueue;
  v2 = -[StoreDownloadQueue init](&v33, "init");
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_automaticDownloadsAreDisabled = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.itunesstored.StoreDownloadQueue", 0LL);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    activeRestoreIDs = v3->_activeRestoreIDs;
    v3->_activeRestoreIDs = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activeAccount]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 uniqueIdentifier]);
    lastCheckedAccountID = v3->_lastCheckedAccountID;
    v3->_lastCheckedAccountID = (NSNumber *)v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    storeQueueRequests = v3->_storeQueueRequests;
    v3->_storeQueueRequests = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    operationQueue = v3->_operationQueue;
    v3->_operationQueue = v14;

    -[ISOperationQueue setAdjustsMaxConcurrentOperationCount:]( v3->_operationQueue,  "setAdjustsMaxConcurrentOperationCount:",  0LL);
    -[ISOperationQueue setMaxConcurrentOperationCount:](v3->_operationQueue, "setMaxConcurrentOperationCount:", 3LL);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    [v16 addKeepAliveOperationQueue:v3->_operationQueue];

    v17 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    restoreOperationQueue = v3->_restoreOperationQueue;
    v3->_restoreOperationQueue = v17;

    -[ISOperationQueue setAdjustsMaxConcurrentOperationCount:]( v3->_restoreOperationQueue,  "setAdjustsMaxConcurrentOperationCount:",  0LL);
    -[ISOperationQueue setMaxConcurrentOperationCount:]( v3->_restoreOperationQueue,  "setMaxConcurrentOperationCount:",  1LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    [v19 addKeepAliveOperationQueue:v3->_restoreOperationQueue];

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v20 addObserver:v3 selector:"_accountAuthenticatedNotification:" name:kSSNotificationAuthenticateFinished object:0];
    [v20 addObserver:v3 selector:"_accountStoreChangedNotification:" name:SSAccountStoreChangedNotification object:0];
    [v20 addObserver:v3 selector:"_networkTypeChangedNotification:" name:ISNetworkTypeChangedNotification object:0];
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[SSWeakReference weakReferenceWithObject:]( &OBJC_CLASS___SSWeakReference,  "weakReferenceWithObject:",  v3));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10008A5EC;
    v31[3] = &unk_10034CD30;
    id v23 = v21;
    id v32 = v23;
    id v24 =  [v22 addObserverForBackgroundTaskWithIdentifierPrefix:@"com.apple.itunesstored.RetryCanceledRestoreDownloads" withBlock:v31];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10008A61C;
    v29[3] = &unk_10034CD30;
    id v30 = v23;
    id v25 = v23;
    id v26 =  [v22 addObserverForBackgroundTaskWithIdentifierPrefix:@"com.apple.itunesstored.RetrySoftFailedRestoreDownloads" withBlock:v29];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v3,  (CFNotificationCallback)sub_10008A64C,  kSSNotificationAutomaticDownloadSettingsChanged,  0LL,  CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v3,  (CFNotificationCallback)sub_10008A6A8,  kSSNotificationTriggerDownloads,  0LL,  CFNotificationSuspensionBehaviorCoalesce);
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:kSSNotificationAuthenticateFinished object:0];
  [v3 removeObserver:self name:SSAccountStoreChangedNotification object:0];
  [v3 removeObserver:self name:ISNetworkTypeChangedNotification object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kSSNotificationAutomaticDownloadSettingsChanged, 0LL);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kSSNotificationTriggerDownloads, 0LL);
  -[LoadDownloadQueueOperation setCompletionBlock:]( self->_loadAutomaticDownloadQueueOperation,  "setCompletionBlock:",  0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  [v5 removeKeepAliveOperationQueue:self->_operationQueue];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  [v6 removeKeepAliveOperationQueue:self->_restoreOperationQueue];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___StoreDownloadQueue;
  -[StoreDownloadQueue dealloc](&v7, "dealloc");
}

+ (id)sharedDownloadQueue
{
  if (qword_1003A32E8 != -1) {
    dispatch_once(&qword_1003A32E8, &stru_10034CD50);
  }
  return (id)qword_1003A32E0;
}

- (NSSet)automaticDownloadKinds
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeAccount]);

  dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 automaticDownloadKinds]);
  if (v4) {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));
  }
  else {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }
  v6 = (void *)v5;

  return (NSSet *)v6;
}

- (BOOL)cancelAllRedownloads
{
  uint64_t v6 = 0LL;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10008AB58;
  v5[3] = &unk_10034CDA0;
  v5[4] = &v6;
  id v3 = [v2 modifyUsingTransactionBlock:v5];

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)checkAutomaticDownloadQueue
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008AD70;
  block[3] = &unk_10034AC30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)checkQueuesWithReason:(id)a3 accountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_10008B7F0;
  id v24 = sub_10008B800;
  id v25 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10008B808;
  v16[3] = &unk_10034CDC8;
  v19 = &v20;
  v16[4] = self;
  id v9 = v6;
  id v17 = v9;
  id v10 = v7;
  id v18 = v10;
  [v8 readUsingTransactionBlock:v16];

  if (v21[5])
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008B844;
    block[3] = &unk_10034CDF0;
    block[4] = self;
    v15 = &v20;
    id v14 = v9;
    dispatch_async(dispatchQueue, block);
  }

  _Block_object_dispose(&v20, 8);
  return 1;
}

- (void)checkQueuesWithRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10008B8D8;
  v7[3] = &unk_10034AD58;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)commitAutomaticDownloadKinds:(id)a3 markAsDirty:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeAccount]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  id v10 = (id)v9;
  if (!v8)
  {
    if (!v9) {
      id v10 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v29 = [v10 shouldLog];
    else {
      LODWORD(v30) = v29;
    }
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      uint64_t v30 = v30;
    }
    else {
      v30 &= 2u;
    }
    if ((_DWORD)v30)
    {
      int v37 = 138543362;
      id v38 = (id)objc_opt_class(self);
      id v32 = v38;
      objc_super v33 = (void *)_os_log_send_and_compose_impl( v30,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  16LL,  "%{public}@: Unable to set automatic download kinds because there's no active iTunes account.",  &v37,  12);

      if (!v33) {
        goto LABEL_45;
      }
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v33,  4LL));
      free(v33);
      SSFileLog(v10, @"%@");
    }

    goto LABEL_45;
  }

  if (!v9) {
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v11 = [v10 shouldLog];
  else {
    LODWORD(v12) = v11;
  }
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v12 = v12;
  }
  else {
    v12 &= 2u;
  }
  if ((_DWORD)v12)
  {
    int v37 = 138412546;
    id v38 = (id)objc_opt_class(self);
    __int16 v39 = 2112;
    id v40 = v6;
    id v14 = v38;
    v15 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%@: Committing automatic download kinds: %@",  &v37,  22);

    if (!v15) {
      goto LABEL_14;
    }
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
    free(v15);
    v34 = v13;
    SSFileLog(v10, @"%@");
  }

LABEL_14:
  v16 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!v4) {
    v16 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  id v17 = (const __CFString *)kSSUserDefaultsIdentifier;
  CFPreferencesSetAppValue(@"DirtyAutoDownloadKinds", *v16, kSSUserDefaultsIdentifier);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  [v8 setAutomaticDownloadKinds:v18];

  id v36 = 0LL;
  unsigned __int8 v19 = [v7 saveAccount:v8 verifyCredentials:0 error:&v36];
  id v10 = v36;
  if ((v19 & 1) != 0) {
    goto LABEL_30;
  }
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v20) {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v21 = objc_msgSend(v20, "shouldLog", v34);
  else {
    LODWORD(v22) = v21;
  }
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    uint64_t v22 = v22;
  }
  else {
    v22 &= 2u;
  }
  if (!(_DWORD)v22) {
    goto LABEL_28;
  }
  id v24 = (void *)objc_opt_class(self);
  int v37 = 138543618;
  id v38 = v24;
  __int16 v39 = 2114;
  id v40 = v10;
  id v25 = v24;
  LODWORD(v35) = 22;
  id v26 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  16LL,  "%{public}@: Failed to save the active account after setting automatic download kinds. error = %{public}@",  &v37,  v35);

  if (v26)
  {
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
    free(v26);
    v34 = v23;
    SSFileLog(v20, @"%@");
LABEL_28:
  }

LABEL_30:
  if (objc_msgSend(v6, "count", v34)) {
    +[SSDevice setPromptWithIdentifier:needsDisplay:]( &OBJC_CLASS___SSDevice,  "setPromptWithIdentifier:needsDisplay:",  SSDevicePromptIdentifierAutomaticDownloadsAvailable,  0LL);
  }
  CFPreferencesAppSynchronize(v17);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v27 postNotificationName:SSDeviceAutomaticDownloadKindsChangedNotification object:0];

  v28 = (void *)objc_claimAutoreleasedReturnValue( +[DistributedNotificationCenter defaultCenter]( &OBJC_CLASS___DistributedNotificationCenter,  "defaultCenter"));
  [v28 postNotificationName:kSSNotificationAutomaticDownloadKindsChanged];

LABEL_45:
}

- (NSSet)downloadKindsBeingChecked
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10008BEEC;
  v9[3] = &unk_10034AD58;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(dispatchQueue, v9);
  id v6 = v10;
  id v7 = (NSSet *)v5;

  return v7;
}

- (void)disableAutomaticDownloadsWithReason:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10008C08C;
  v7[3] = &unk_10034AD58;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)enableAutomaticDownloadsWithReason:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10008C2A0;
  v7[3] = &unk_10034AD58;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (NSSet)enabledDownloadKinds
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownloadQueue automaticDownloadKinds](self, "automaticDownloadKinds", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    id v8 = (void *)SSDownloadKindAudiobook;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((SSDownloadKindIsSoftwareKind(v10) & 1) == 0
          && (!_os_feature_enabled_impl("Books", "bl_use_ams")
           || (SSDownloadKindIsEBookKind(v10) & 1) == 0
           && ([v8 isEqualToString:v10] & 1) == 0))
        {
          -[NSMutableSet addObject:](v3, "addObject:", v10);
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  id v11 = -[NSMutableSet copy](v3, "copy");
  return (NSSet *)v11;
}

- (void)restoreAllRestorableDownloadsWithReason:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  uint64_t v10 = sub_10008C69C;
  id v11 = &unk_10034CE18;
  uint64_t v12 = self;
  uint64_t v7 = v5;
  __int128 v13 = v7;
  [v6 readUsingTransactionBlock:&v8];

  if (-[NSMutableOrderedSet count](v7, "count", v8, v9, v10, v11, v12)) {
    -[StoreDownloadQueue restoreDownloadsWithIdentifiers:reason:]( self,  "restoreDownloadsWithIdentifiers:reason:",  v7,  v4);
  }
}

- (void)restoreDownloadsWithIdentifiers:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008C83C;
  block[3] = &unk_10034BCE8;
  id v12 = v6;
  __int128 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)setAutomaticDownloadKinds:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 activeAccount]);
  -[StoreDownloadQueue setAutomaticDownloadKinds:account:](self, "setAutomaticDownloadKinds:account:", v4, v5);
}

- (void)setAutomaticDownloadKinds:(id)a3 account:(id)a4
{
  id v5 = -[StoreDownloadQueue _newOperationByCommitingAutomaticDownloadKinds:account:]( self,  "_newOperationByCommitingAutomaticDownloadKinds:account:",  a3,  a4);
  if (v5)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
    [v4 addOperation:v5];
  }
}

- (void)synchronizeAutomaticDownloadKinds
{
}

+ (void)cancelRedownloadsWithMessage:(id)a3 connection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10008CEB4;
  v8[3] = &unk_10034AC30;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[StoreDownloadQueue sharedDownloadQueue](&OBJC_CLASS___StoreDownloadQueue, "sharedDownloadQueue"));
  id v7 = v9;
  [v7 _handleMessage:v6 connection:v5 usingBlock:v8];
}

+ (void)getAutomaticDownloadKindsWithMessage:(id)a3 connection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10008CF90;
  v10[3] = &unk_10034BCE8;
  id v11 = v5;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[StoreDownloadQueue sharedDownloadQueue](&OBJC_CLASS___StoreDownloadQueue, "sharedDownloadQueue"));
  id v13 = v6;
  id v7 = v6;
  id v8 = v12;
  id v9 = v5;
  [v8 _handleMessage:v9 connection:v7 usingBlock:v10];
}

+ (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:a1 selector:"cancelRedownloadsWithMessage:connection:" forMessage:187];
  [v4 addObserver:a1 selector:"getAutomaticDownloadKindsWithMessage:connection:" forMessage:74];
  [v4 addObserver:a1 selector:"reloadFromServerWithMessage:connection:" forMessage:5];
  [v4 addObserver:a1 selector:"setAutomaticDownloadKindsWithMessage:connection:" forMessage:75];
  [v4 addObserver:a1 selector:"synchronizeAutomaticDownloadKindsWithMessage:connection:" forMessage:76];
  [v4 addObserver:a1 selector:"triggerDownloadsWithMessage:connection:" forMessage:41];
}

+ (void)reloadFromServerWithMessage:(id)a3 connection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[StoreDownloadQueue sharedDownloadQueue](&OBJC_CLASS___StoreDownloadQueue, "sharedDownloadQueue"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activeAccount]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueIdentifier]);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10008D1BC;
  v13[3] = &unk_10034AD58;
  id v14 = v7;
  id v15 = v10;
  id v11 = v10;
  id v12 = v7;
  [v12 _handleMessage:v6 connection:v5 usingBlock:v13];
}

+ (void)setAutomaticDownloadKindsWithMessage:(id)a3 connection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10008D4F8;
  v10[3] = &unk_10034BCE8;
  id v11 = v5;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[StoreDownloadQueue sharedDownloadQueue](&OBJC_CLASS___StoreDownloadQueue, "sharedDownloadQueue"));
  id v13 = v6;
  id v7 = v6;
  id v8 = v12;
  id v9 = v5;
  [v8 _handleMessage:v9 connection:v7 usingBlock:v10];
}

+ (void)synchronizeAutomaticDownloadKindsWithMessage:(id)a3 connection:(id)a4
{
  id v5 = (_xpc_connection_s *)a4;
  xpc_object_t message = xpc_dictionary_create_reply(a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[StoreDownloadQueue sharedDownloadQueue](&OBJC_CLASS___StoreDownloadQueue, "sharedDownloadQueue"));
  [v6 synchronizeAutomaticDownloadKinds];

  xpc_connection_send_message(v5, message);
}

+ (void)triggerDownloadsWithMessage:(id)a3 connection:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", a3, a4));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if (!(_DWORD)v7) {
    goto LABEL_12;
  }
  int v15 = 138412290;
  id v16 = (id)objc_opt_class(a1);
  id v9 = v16;
  id v10 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  1LL,  "%@: Checking download queues for trigger-downloads",  &v15,  12);

  if (v10)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    SSFileLog(v5, @"%@");
LABEL_12:
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 activeAccount]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueIdentifier]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[StoreDownloadQueue sharedDownloadQueue](&OBJC_CLASS___StoreDownloadQueue, "sharedDownloadQueue"));
  [v14 checkQueuesWithReason:@"trigger-download" accountID:v13];
}

- (void)_accountAuthenticatedNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeAccount]);

  if ([v5 isAuthenticated]
    && CFPreferencesGetAppBooleanValue(@"DirtyAutoDownloadKinds", kSSUserDefaultsIdentifier, 0LL))
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      int v15 = 138412290;
      id v16 = (id)objc_opt_class(self);
      id v10 = v16;
      id v11 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  1LL,  "%@: Resending dirty automatic download kinds",  &v15,  12);

      if (!v11)
      {
LABEL_15:

        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownloadQueue automaticDownloadKinds](self, "automaticDownloadKinds"));
        id v13 = -[StoreDownloadQueue _newSetAutomaticDownloadKindsOperationWithDownloadKinds:account:]( self,  "_newSetAutomaticDownloadKindsOperationWithDownloadKinds:account:",  v12,  v5);

        [v13 setRunsOnlyIfKindsAreDirty:1];
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
        [v14 addOperation:v13];

        goto LABEL_16;
      }

      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
      free(v11);
      SSFileLog(v6, @"%@");
    }

    goto LABEL_15;
  }

- (void)_accountStoreChangedNotification:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008DD18;
  block[3] = &unk_10034AC30;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_networkTypeChangedNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:NSKeyValueChangeOldKey]);

  if (![v5 integerValue])
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10008E170;
    v7[3] = &unk_10034CEB8;
    void v7[4] = self;
    [v6 modifyAsyncUsingTransactionBlock:v7];
  }
}

- (void)_addOperationsForRequests:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v6;
  id v9 = v7;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownloadQueue _validQueueIdentifiersForDaemon](self, "_validQueueIdentifiersForDaemon"));
  [v8 minusSet:self->_storeQueueRequests];
  -[NSMutableSet unionSet:](self->_storeQueueRequests, "unionSet:", v8);
  v52 = v9;
  unsigned int v11 = [v9 isEqualToString:@"trigger-download"];
  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  id v13 = (void *)v12;
  v51 = v8;
  if (v11)
  {
    if (!v12) {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v14 = [v13 shouldLog];
    else {
      unsigned int v15 = v14;
    }
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = v15;
    }
    else {
      uint64_t v17 = v15 & 2;
    }
    if ((_DWORD)v17)
    {
      id v18 = (void *)objc_opt_class(self);
      id v19 = v18;
      int v63 = 138412802;
      v64 = v18;
      __int16 v65 = 2048;
      id v66 = [v8 count];
      __int16 v67 = 2112;
      v68 = v52;
      uint64_t v20 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "%@: Loading %lu queues with reason: %@",  &v63,  32);

      if (!v20) {
        goto LABEL_14;
      }
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
      free(v20);
      v50 = v16;
      SSFileLog(v13, @"%@");
    }

LABEL_14:
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    id v21 = v8;
    id v22 = [v21 countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v58;
      do
      {
        for (i = 0LL; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v58 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "queueIdentifier", v50));
          unsigned int v28 = [v10 containsObject:v27];

          if (v28)
          {
            id v29 = -[StoreDownloadQueue _newLoadQueueOperationForQueueRequest:]( self,  "_newLoadQueueOperationForQueueRequest:",  v26);
            -[ISOperationQueue addOperation:](self->_operationQueue, "addOperation:", v29);
          }

          else
          {
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v26 queueIdentifier]);
            unsigned int v31 = [v30 isEqualToString:@"apps"];

            if (v31)
            {
              -[NSMutableSet removeObject:](self->_storeQueueRequests, "removeObject:", v26);
              +[AppStoreUtility checkDownloadQueue](&OBJC_CLASS___AppStoreUtility, "checkDownloadQueue");
            }
          }
        }

        id v23 = [v21 countByEnumeratingWithState:&v57 objects:v62 count:16];
      }

      while (v23);
    }

    goto LABEL_49;
  }

  if (!v12) {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v32 = [v13 shouldLog];
  else {
    unsigned int v33 = v32;
  }
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v35 = v33;
  }
  else {
    uint64_t v35 = v33 & 2;
  }
  if ((_DWORD)v35)
  {
    id v36 = (void *)objc_opt_class(self);
    id v37 = v36;
    int v63 = 138412802;
    v64 = v36;
    __int16 v65 = 2048;
    id v66 = [v8 count];
    __int16 v67 = 2112;
    v68 = v52;
    id v38 = (void *)_os_log_send_and_compose_impl( v35,  0LL,  0LL,  0LL,  &_mh_execute_header,  v34,  0LL,  "%@: Checking %lu queues with reason: %@",  &v63,  32);

    if (!v38) {
      goto LABEL_38;
    }
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v38,  4LL));
    free(v38);
    v50 = v34;
    SSFileLog(v13, @"%@");
  }

LABEL_38:
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v39 = v8;
  id v40 = [v39 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v54;
    do
    {
      for (j = 0LL; j != v41; j = (char *)j + 1)
      {
        if (*(void *)v54 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)j);
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "queueIdentifier", v50));
        unsigned int v46 = [v10 containsObject:v45];

        if (v46)
        {
          id v47 = -[StoreDownloadQueue _newCheckQueueOperationForQueueRequest:]( self,  "_newCheckQueueOperationForQueueRequest:",  v44);
          -[ISOperationQueue addOperation:](self->_operationQueue, "addOperation:", v47);
        }

        else
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue([v44 queueIdentifier]);
          unsigned int v49 = [v48 isEqualToString:@"apps"];

          if (v49)
          {
            -[NSMutableSet removeObject:](self->_storeQueueRequests, "removeObject:", v44);
            +[AppStoreUtility checkDownloadQueue](&OBJC_CLASS___AppStoreUtility, "checkDownloadQueue");
          }
        }
      }

      id v41 = [v39 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }

    while (v41);
  }

- (id)_automaticDownloadsQueryWithDatabase:(id)a3 accountID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"is_automatic",  1LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"is_from_store",  1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"store_account_id",  v5));

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v7, v8, v9, 0LL));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadEntity queryWithDatabase:predicate:]( &OBJC_CLASS___DownloadEntity,  "queryWithDatabase:predicate:",  v6,  v11));
  return v12;
}

- (id)_downloadQueryWithQueueRequest:(id)a3 database:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 queueIdentifier]);
  id v8 = sub_100092684((uint64_t)v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteCompoundPredicate predicateWithProperty:values:comparisonType:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateWithProperty:values:comparisonType:",  @"kind",  v9,  1LL));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"store_account_id",  v11));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"is_store_queued",  1LL));
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"IFNULL(download_state.phase, SSDownloadPhaseWaiting)",  SSDownloadPhaseFinished,  2LL));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v13, v12, v14, v10, 0LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v15));

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadEntity queryWithDatabase:predicate:]( &OBJC_CLASS___DownloadEntity,  "queryWithDatabase:predicate:",  v5,  v16));
  return v17;
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = (_xpc_connection_s *)a4;
  id v10 = a5;
  if ((SSXPCConnectionHasEntitlement(v9, kSSITunesStorePrivateEntitlement) & 1) != 0)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    [v11 takeKeepAliveAssertion:@"com.apple.itunesstore.StoreDownloadQueue"];

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008EAF4;
    block[3] = &unk_10034ACB8;
    id v15 = v10;
    dispatch_async(dispatchQueue, block);
  }

  else
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v8);
    if (reply) {
      xpc_connection_send_message(v9, reply);
    }
  }
}

- (void)_checkAutomaticDownloadQueue:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if ((_DWORD)v7)
  {
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = (id)objc_opt_class(self);
    id v9 = *(id *)((char *)location + 4);
    id v10 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  1LL,  "[%@]: Checking automatic download queue",  location,  12);

    if (v10)
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
      free(v10);
      SSFileLog(v5, @"%@");
    }
  }

  else
  {
  }

  id v12 = +[LoadDownloadQueueOperation newLoadAutomaticDownloadQueueOperation]( &OBJC_CLASS___LoadDownloadQueueOperation,  "newLoadAutomaticDownloadQueueOperation");
  [v12 setAccountIdentifier:v4];
  objc_initWeak(location, v12);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10008EDAC;
  v14[3] = &unk_10034CF08;
  v14[4] = self;
  objc_copyWeak(&v16, location);
  id v13 = v4;
  id v15 = v13;
  [v12 setCompletionBlock:v14];
  objc_storeStrong((id *)&self->_loadAutomaticDownloadQueueOperation, v12);
  -[ISOperationQueue addOperation:](self->_operationQueue, "addOperation:", self->_loadAutomaticDownloadQueueOperation);

  objc_destroyWeak(&v16);
  objc_destroyWeak(location);
}

- (BOOL)_ignoreVideos
{
  v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  @"com.apple.tv"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationType]);
  if ([v4 isEqualToString:LSSystemApplicationType])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 appState]);
    unsigned int v6 = [v5 isInstalled] ^ 1;
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  if (v3) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }

  objc_autoreleasePoolPop(v2);
  return v7;
}

- (id)_newCheckQueueOperationForQueueRequest:(id)a3
{
  id v4 = a3;
  id v5 = -[CheckDownloadQueueOperation initWithDownloadQueueRequest:]( objc_alloc(&OBJC_CLASS___CheckDownloadQueueOperation),  "initWithDownloadQueueRequest:",  v4);
  objc_initWeak(&location, v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10008F73C;
  v8[3] = &unk_10034CE90;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v9 = v6;
  id v10 = self;
  -[CheckDownloadQueueOperation setCompletionBlock:](v5, "setCompletionBlock:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

- (id)_newLoadQueueOperationForQueueRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 queueContentsURLBagKey]);
  -[SSMutableURLRequestProperties setURLBagKey:](v5, "setURLBagKey:", v6);

  BOOL v7 = -[LoadDownloadQueueOperation initWithRequestProperties:]( objc_alloc(&OBJC_CLASS___LoadDownloadQueueOperation),  "initWithRequestProperties:",  v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
  -[LoadDownloadQueueOperation setAccountIdentifier:](v7, "setAccountIdentifier:", v8);

  -[LoadDownloadQueueOperation setNeedsAuthentication:](v7, "setNeedsAuthentication:", 0LL);
  objc_initWeak(&location, v7);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000902EC;
  v11[3] = &unk_10034CFA8;
  v11[4] = self;
  id v9 = v4;
  id v12 = v9;
  objc_copyWeak(&v13, &location);
  -[LoadDownloadQueueOperation setCompletionBlock:](v7, "setCompletionBlock:", v11);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return v7;
}

- (id)_newOperationByCommitingAutomaticDownloadKinds:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownloadQueue automaticDownloadKinds](self, "automaticDownloadKinds"));
  if ([v6 isEqualToSet:v8])
  {
    id v9 = 0LL;
  }

  else
  {
    -[StoreDownloadQueue commitAutomaticDownloadKinds:markAsDirty:]( self,  "commitAutomaticDownloadKinds:markAsDirty:",  v6,  1LL);
    id v9 = -[StoreDownloadQueue _newSetAutomaticDownloadKindsOperationWithDownloadKinds:account:]( self,  "_newSetAutomaticDownloadKindsOperationWithDownloadKinds:account:",  v6,  v7);
    [v9 setPreviousDownloadKinds:v8];
  }

  return v9;
}

- (id)_newQueueRequestsWithReason:(id)a3 accountID:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v35 = v10;
  if (([v8 isEqualToString:@"account-change"] & 1) == 0)
  {
    v34 = self;
    unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownloadQueue _validQueueIdentifiersForDaemon](self, "_validQueueIdentifiersForDaemon"));
    id v12 = objc_alloc_init(&OBJC_CLASS___SSSQLiteQueryDescriptor);
    [v12 setEntityClass:objc_opt_class(DownloadEntity)];
    [v12 setReturnsDistinctEntities:1];
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"is_store_queued",  1LL));
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[SSSQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SSSQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"store_transaction_id"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"IFNULL(download_state.is_server_finished, 0)",  0LL));
    unsigned int v32 = (void *)v14;
    unsigned int v33 = (void *)v13;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v13, v14, v15, 0LL));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v16));

    [v12 setPredicate:v17];
    id v18 = objc_alloc(&OBJC_CLASS___SSSQLiteQuery);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 database]);
    uint64_t v20 = -[SSSQLiteQuery initWithDatabase:descriptor:](v18, "initWithDatabase:descriptor:", v19, v12);

    v45[0] = @"kind";
    v45[1] = @"store_account_id";
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_100090FE4;
    v40[3] = &unk_10034C4D8;
    id v21 = v31;
    id v41 = v21;
    id v42 = v8;
    v43 = v11;
    -[SSSQLiteQuery enumeratePersistentIDsAndProperties:count:usingBlock:]( v20,  "enumeratePersistentIDsAndProperties:count:usingBlock:",  v45,  2LL,  v40);

    for (uint64_t i = 1LL; i != -1; --i)
    self = v34;
  }

  if (v9)
  {
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownloadQueue _validQueueIdentifiersForPlatform](self, "_validQueueIdentifiersForPlatform"));
    id v24 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v37;
      do
      {
        for (j = 0LL; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v37 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)j);
          id v29 = objc_alloc_init(&OBJC_CLASS___StoreDownloadQueueRequest);
          -[StoreDownloadQueueRequest setAccountIdentifier:](v29, "setAccountIdentifier:", v9);
          -[StoreDownloadQueueRequest setQueueIdentifier:](v29, "setQueueIdentifier:", v28);
          -[StoreDownloadQueueRequest setReason:](v29, "setReason:", v8);
          -[NSMutableSet addObject:](v11, "addObject:", v29);
        }

        id v25 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }

      while (v25);
    }

    id v10 = v35;
  }

  return v11;
}

- (id)_newSetAutomaticDownloadKindsOperationWithDownloadKinds:(id)a3 account:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[SetAutomaticDownloadKindsOperation initWithDownloadKinds:]( objc_alloc(&OBJC_CLASS___SetAutomaticDownloadKindsOperation),  "initWithDownloadKinds:",  v6);

  id v8 = -[SSAuthenticationContext initWithAccount:]( objc_alloc(&OBJC_CLASS___SSAuthenticationContext),  "initWithAccount:",  v5);
  -[SetAutomaticDownloadKindsOperation setAuthenticationContext:](v7, "setAuthenticationContext:", v8);

  return v7;
}

- (void)_retryCanceledRestoreDownloads
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if (!(_DWORD)v5) {
    goto LABEL_12;
  }
  int v11 = 138412290;
  id v12 = (id)objc_opt_class(self);
  id v7 = v12;
  id v8 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "%@: Retrying all canceled restore downloads",  &v11,  12);

  if (v8)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
    free(v8);
    SSFileLog(v3, @"%@");
LABEL_12:
  }

  +[RestoreDownloadsOperation resetShouldSuppressTermsAndConditionsDialogs]( &OBJC_CLASS___RestoreDownloadsOperation,  "resetShouldSuppressTermsAndConditionsDialogs");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
  id v10 = [v9 modifyUsingTransactionBlock:&stru_10034CFE8];
}

- (void)_retrySoftFailedRestoreDownloads
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if (!(_DWORD)v5) {
    goto LABEL_12;
  }
  int v11 = 138412290;
  id v12 = (id)objc_opt_class(self);
  id v7 = v12;
  id v8 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "%@: Retrying all soft-failed restore downloads",  &v11,  12);

  if (v8)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
    free(v8);
    SSFileLog(v3, @"%@");
LABEL_12:
  }

  +[RestoreDownloadsOperation resetShouldSuppressTermsAndConditionsDialogs]( &OBJC_CLASS___RestoreDownloadsOperation,  "resetShouldSuppressTermsAndConditionsDialogs");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
  id v10 = [v9 modifyUsingTransactionBlock:&stru_10034D008];
}

- (id)_restorableDownloadsQueryInDatabase:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"is_restore",  1LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"IFNULL(download.store_item_id, 0)",  v5,  2LL));

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"is_purchase",  0LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"is_from_store",  0LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"IFNULL(download_state.restore_state, 0)",  0LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v4, v6, v7, v8, v9, 0LL));
  int v11 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", @"order_key"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadEntity queryWithDatabase:predicate:orderingProperties:]( &OBJC_CLASS___DownloadEntity,  "queryWithDatabase:predicate:orderingProperties:",  v3,  v11,  v12));

  return v13;
}

- (void)_setLastCheckedAccountID:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000917C0;
  block[3] = &unk_10034AD58;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
}

- (void)_synchronizeAutomaticDownloadKinds:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___GetAutomaticDownloadKindsOperation);
  objc_initWeak(&location, v5);
  int v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  uint64_t v13 = sub_100091940;
  uint64_t v14 = &unk_10034D030;
  objc_copyWeak(&v17, &location);
  id v15 = self;
  id v6 = v4;
  id v16 = v6;
  -[GetAutomaticDownloadKindsOperation setCompletionBlock:](v5, "setCompletionBlock:", &v11);
  id v7 = objc_alloc(&OBJC_CLASS___SSAuthenticationContext);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore", v11, v12, v13, v14, v15));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activeAccount]);
  id v10 = -[SSAuthenticationContext initWithAccount:](v7, "initWithAccount:", v9);

  -[GetAutomaticDownloadKindsOperation setAuthenticationContext:](v5, "setAuthenticationContext:", v10);
  -[ISOperationQueue addOperation:](self->_operationQueue, "addOperation:", v5);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (id)_validQueueIdentifiersForDaemon
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownloadQueue _validQueueIdentifiersForPlatform](self, "_validQueueIdentifiersForPlatform", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  id v10 = -[NSMutableSet copy](v3, "copy");
  return v10;
}

- (id)_validQueueIdentifiersForPlatform
{
  if (MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 4)
  {
    id v8 = @"apps";
    v2 = &v8;
    uint64_t v3 = 1LL;
  }

  else
  {
    v7[0] = @"apps";
    v7[1] = @"books";
    v7[2] = @"media";
    v2 = (const __CFString **)v7;
    uint64_t v3 = 3LL;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v2, v3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));

  return v5;
}

- (void).cxx_destruct
{
}

@end