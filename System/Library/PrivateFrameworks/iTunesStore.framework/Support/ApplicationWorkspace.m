@interface ApplicationWorkspace
+ (BOOL)keepSafeHarborDataForBundleID:(id)a3;
+ (id)defaultWorkspace;
- (ApplicationWorkspace)init;
- (BOOL)_hasThumbnailDownloadOperationForDownloadID:(int64_t)a3;
- (BOOL)_isInstallingForDownloadIdentifier:(int64_t)a3;
- (BOOL)isDownloadingOrInstallingForItemIdentifier:(id)a3;
- (BOOL)isInstalledApp:(id)a3;
- (BOOL)isMultiUser;
- (BOOL)isRemovedSystemApp:(id)a3;
- (BOOL)shouldModifyQuota:(id)a3;
- (id)_copyCombinedApplicationProgress:(id)a3 forApplicationHandle:(id)a4;
- (id)_thumbnailDownloadOperationForDownloadID:(int64_t)a3;
- (id)sinfPathForBundleID:(id)a3;
- (void)_addOperationAtBeginning:(id)a3;
- (void)_addProgressOperation:(id)a3;
- (void)_cancelPlaceholderThumbnailInstallForDownloadID:(int64_t)a3;
- (void)_decrementPendingInstallsForDownloadIdentifier:(int64_t)a3;
- (void)_fireWaitBlocksForSyncTermination;
- (void)_fireWaitBlocksIfNecessaryForDownloadWithIdentifier:(int64_t)a3;
- (void)_incrementPendingInstallsForDownloadIdentifier:(int64_t)a3;
- (void)_performNextOperation;
- (void)_removeApplicationDownloadProgressForApplicationHandle:(id)a3;
- (void)_removeOperationsForDownloadIdentifier:(int64_t)a3;
- (void)_removeOperationsForDownloadIdentifier:(int64_t)a3 operationClass:(Class)a4;
- (void)_stopObservingODRProgress:(id)a3;
- (void)_updatePlaceholderWithODRProgressForApplicationHandle:(id)a3;
- (void)addPlaceholderThumbnailOperation:(id)a3;
- (void)applyWorkspaceChanges:(id)a3;
- (void)cancelPlaceholderInstallationForDownloadIdentifier:(int64_t)a3;
- (void)endExternalInstallationForDownloadIdentifier:(int64_t)a3;
- (void)finishInstallOfApplicationHandle:(id)a3;
- (void)installPlaceholderForApplicationHandle:(id)a3;
- (void)markFailedPlaceholderForApplicationHandle:(id)a3;
- (void)replayIncompleteOperations;
- (void)resetProgressForApplicationHandle:(id)a3;
- (void)restorePlaceholderForApplicationHandle:(id)a3;
- (void)setIconData:(id)a3 forApplicationHandle:(id)a4;
- (void)uninstallPlaceholderForApplicationHandle:(id)a3;
- (void)updatePlaceholderForApplicationHandle:(id)a3;
- (void)updatePlaceholderWithApplicationProgress:(id)a3;
- (void)waitForInstallOfDownloadIdentifier:(int64_t)a3 completionBlock:(id)a4;
@end

@implementation ApplicationWorkspace

- (ApplicationWorkspace)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ApplicationWorkspace;
  id v2 = -[ApplicationWorkspace init](&v19, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.ApplicationWorkspace.callback", 0LL);
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    v5 = (dispatch_object_s *)*((void *)v2 + 2);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_set_target_queue(v5, v7);

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.itunesstored.ApplicationWorkspace", 0LL);
    v9 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v8;

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 3), v7);
    v10 = objc_alloc_init(&OBJC_CLASS___NSLock);
    v11 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v10;

    [*((id *)v2 + 4) setName:@"com.apple.itunesstored.ApplicationWorkspace"];
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v13 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    v15 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v14;

    v16 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    v17 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v16;

    [*((id *)v2 + 7) setAdjustsMaxConcurrentOperationCount:0];
    [*((id *)v2 + 7) setMaxConcurrentOperationCount:1];
    [*((id *)v2 + 7) setName:@"com.apple.itunesstored.ApplicationWorkspace.background"];
  }

  return (ApplicationWorkspace *)v2;
}

+ (id)defaultWorkspace
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C64B0;
  block[3] = &unk_10034AC90;
  block[4] = a1;
  if (qword_1003A3368 != -1) {
    dispatch_once(&qword_1003A3368, block);
  }
  return (id)qword_1003A3360;
}

- (void)applyWorkspaceChanges:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        switch((unint64_t)[v9 changeType])
        {
          case 0uLL:
            v10 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationHandle]);
            -[ApplicationWorkspace installPlaceholderForApplicationHandle:]( self,  "installPlaceholderForApplicationHandle:",  v10);
            goto LABEL_12;
          case 1uLL:
            v10 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationHandle]);
            -[ApplicationWorkspace uninstallPlaceholderForApplicationHandle:]( self,  "uninstallPlaceholderForApplicationHandle:",  v10);
            goto LABEL_12;
          case 2uLL:
            v10 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationHandle]);
            -[ApplicationWorkspace finishInstallOfApplicationHandle:](self, "finishInstallOfApplicationHandle:", v10);
            goto LABEL_12;
          case 3uLL:
            v10 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationHandle]);
            -[ApplicationWorkspace markFailedPlaceholderForApplicationHandle:]( self,  "markFailedPlaceholderForApplicationHandle:",  v10);
            goto LABEL_12;
          case 5uLL:
            v10 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationHandle]);
            -[ApplicationWorkspace updatePlaceholderForApplicationHandle:]( self,  "updatePlaceholderForApplicationHandle:",  v10);
LABEL_12:

            break;
          default:
            continue;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }
}

- (void)addPlaceholderThumbnailOperation:(id)a3
{
  id v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 applicationHandle]);
  if (-[ApplicationWorkspace _hasThumbnailDownloadOperationForDownloadID:]( self,  "_hasThumbnailDownloadOperationForDownloadID:",  [v5 downloadID]))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      unsigned int v8 = v7;
    }
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v8;
    }
    else {
      uint64_t v10 = v8 & 2;
    }
    if (!(_DWORD)v10) {
      goto LABEL_24;
    }
    LODWORD(v16) = 138412290;
    *(void *)((char *)&v16 + 4) = v5;
    uint64_t v11 = _os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[ApplicationWorkspace]: Skipping queing of placeholder thumbnail operation for %@ because we have one",  &v16,  12,  v16);
  }

  else
  {
    -[ISOperationQueue addOperation:](self->_placeholderIconOperationQueue, "addOperation:", v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v12 = [v6 shouldLog];
    else {
      unsigned int v13 = v12;
    }
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = v13 & 2;
    }
    if (!(_DWORD)v14) {
      goto LABEL_24;
    }
    LODWORD(v16) = 138412290;
    *(void *)((char *)&v16 + 4) = v5;
    uint64_t v11 = _os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[ApplicationWorkspace]: Added placeholder thumbnail operation for %@",  &v16,  12,  v16);
  }

  v15 = (void *)v11;

  if (v15)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
    free(v15);
    SSFileLog(v6, @"%@");
LABEL_24:
  }

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)cancelPlaceholderInstallationForDownloadIdentifier:(int64_t)a3
{
  if (-[ApplicationWorkspace _hasThumbnailDownloadOperationForDownloadID:]( self,  "_hasThumbnailDownloadOperationForDownloadID:",  a3))
  {
    -[ApplicationWorkspace _cancelPlaceholderThumbnailInstallForDownloadID:]( self,  "_cancelPlaceholderThumbnailInstallForDownloadID:",  a3);
  }

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)endExternalInstallationForDownloadIdentifier:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000C6984;
  v4[3] = &unk_10034CA90;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)finishInstallOfApplicationHandle:(id)a3
{
  id v4 = a3;
  id v5 = -[ApplicationWorkspaceFinishOperation initWithApplicationHandle:]( objc_alloc(&OBJC_CLASS___ApplicationWorkspaceFinishOperation),  "initWithApplicationHandle:",  v4);
  -[NSLock lock](self->_lock, "lock");
  id v6 = [v4 downloadID];
  -[ApplicationWorkspace _removeApplicationDownloadProgressForApplicationHandle:]( self,  "_removeApplicationDownloadProgressForApplicationHandle:",  v4);

  -[ApplicationWorkspace _removeOperationsForDownloadIdentifier:](self, "_removeOperationsForDownloadIdentifier:", v6);
  -[ApplicationWorkspace _addOperationAtBeginning:](self, "_addOperationAtBeginning:", v5);
  -[NSLock unlock](self->_lock, "unlock");
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C6A84;
  block[3] = &unk_10034AC30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)isDownloadingOrInstallingForItemIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v46 = 0LL;
  v47 = &v46;
  uint64_t v48 = 0x2020000000LL;
  char v49 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  unsigned int v7 = [v5 shouldLogToDisk];
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  v9 = v8;
  if (v7) {
    v6 |= 2u;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = v6 & 2;
  }
  if ((_DWORD)v10)
  {
    int v51 = 138412290;
    id v52 = v4;
    uint64_t v11 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  1LL,  "[ApplicationWorkspace]: Checking if we are installing item with itemIdentifier: %@",  &v51,  12);

    if (!v11) {
      goto LABEL_12;
    }
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
    free(v11);
    v36 = v9;
    SSFileLog(v5, @"%@");
  }

LABEL_12:
  unsigned int v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_1000C7034;
  v42[3] = &unk_10034DA00;
  id v14 = v4;
  id v43 = v14;
  v45 = &v46;
  v15 = v12;
  v44 = v15;
  [v13 readUsingTransactionBlock:v42];

  if (*((_BYTE *)v47 + 24) || !-[NSMutableArray count](v15, "count")) {
    goto LABEL_36;
  }
  -[NSLock lock](self->_lock, "lock");
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v16 = v15;
  id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v38,  v50,  16LL);
  if (!v17) {
    goto LABEL_35;
  }
  uint64_t v18 = *(void *)v39;
  while (2)
  {
    for (i = 0LL; i != v17; i = (char *)i + 1)
    {
      if (*(void *)v39 != v18) {
        objc_enumerationMutation(v16);
      }
      if (-[ApplicationWorkspace _isInstallingForDownloadIdentifier:]( self,  "_isInstallingForDownloadIdentifier:",  objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * (void)i), "longLongValue", v36)))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v20) {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v21 = [v20 shouldLog];
        unsigned int v22 = [v20 shouldLogToDisk];
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
        v24 = v23;
        if (v22) {
          v21 |= 2u;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
          uint64_t v25 = v21;
        }
        else {
          uint64_t v25 = v21 & 2;
        }
        if ((_DWORD)v25)
        {
          int v51 = 138412290;
          id v52 = v14;
          LODWORD(v37) = 12;
          v26 = (void *)_os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  1LL,  "[ApplicationWorkspace]: Workspace is installing item with itemIdentifier: %@",  &v51,  v37,  (void)v38);

          if (!v26)
          {
LABEL_34:

            *((_BYTE *)v47 + 24) = 0;
            goto LABEL_35;
          }

          v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
          free(v26);
          v36 = v24;
          SSFileLog(v20, @"%@");
        }

        goto LABEL_34;
      }
    }

    id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v38,  v50,  16LL);
    if (v17) {
      continue;
    }
    break;
  }

- (BOOL)isMultiUser
{
  return 0;
}

- (void)installPlaceholderForApplicationHandle:(id)a3
{
  id v4 = a3;
  if (!SSDebugShouldUseAppstored(v4, v5))
  {
    unsigned int v12 = -[ApplicationWorkspaceInstallPlaceholderOperation initWithApplicationHandle:forceUpdate:]( objc_alloc(&OBJC_CLASS___ApplicationWorkspaceInstallPlaceholderOperation),  "initWithApplicationHandle:forceUpdate:",  v4,  0LL);

    -[NSLock lock](self->_lock, "lock");
    -[NSMutableArray addObject:](self->_operations, "addObject:", v12);
    -[NSLock unlock](self->_lock, "unlock");
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C76A0;
    block[3] = &unk_10034AC30;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
    goto LABEL_16;
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v6) {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v7 = [v6 shouldLog];
  else {
    LODWORD(v8) = v7;
  }
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
    uint64_t v8 = v8;
  }
  else {
    v8 &= 2u;
  }
  if (!(_DWORD)v8) {
    goto LABEL_13;
  }
  int v15 = 138412290;
  id v16 = (id)objc_opt_class(self);
  id v10 = v16;
  uint64_t v11 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  1LL,  "[%@] Skipping install placeholder because appstored will",  &v15,  12);

  if (v11)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
    free(v11);
    SSFileLog(v6, @"%@");
LABEL_13:
  }

  unsigned int v12 = (ApplicationWorkspaceInstallPlaceholderOperation *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
  +[ApplicationWorkspaceState completeNotificationForInstallingBundleIdentifier:]( &OBJC_CLASS___ApplicationWorkspaceState,  "completeNotificationForInstallingBundleIdentifier:",  v12);
LABEL_16:
}

- (BOOL)isInstalledApp:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v4));
    unsigned int v6 = v5;
    if (v5)
    {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 appState]);
      if ([v7 isInstalled])
      {

LABEL_8:
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 appState]);
        unsigned __int8 v8 = [v11 isValid];

LABEL_10:
        goto LABEL_11;
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue([v6 appState]);
      unsigned int v10 = [v9 isPlaceholder];

      if (v10) {
        goto LABEL_8;
      }
    }

    unsigned __int8 v8 = 0;
    goto LABEL_10;
  }

  unsigned __int8 v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)isRemovedSystemApp:(id)a3
{
  return !-[ApplicationWorkspace isInstalledApp:](self, "isInstalledApp:", a3);
}

+ (BOOL)keepSafeHarborDataForBundleID:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleContainerURL]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"iTunesMetadata.plist"]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v6));
  unsigned __int8 v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"DeviceBasedVPP"]);
    if (v9
      && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber),
          uint64_t v11 = objc_opt_class(v10),
          (objc_opt_isKindOfClass(v9, v11) & 1) != 0))
    {
      unsigned __int8 v12 = [v9 BOOLValue];
    }

    else
    {
      unsigned __int8 v12 = 0;
    }
  }

  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (void)markFailedPlaceholderForApplicationHandle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[ApplicationWorkspaceOperation initWithApplicationHandle:]( objc_alloc(&OBJC_CLASS___ApplicationWorkspaceFailedPlaceholderOperation),  "initWithApplicationHandle:",  v4);
  -[NSLock lock](self->_lock, "lock");
  id v6 = [v4 downloadID];

  -[ApplicationWorkspace _removeOperationsForDownloadIdentifier:](self, "_removeOperationsForDownloadIdentifier:", v6);
  -[ApplicationWorkspace _addOperationAtBeginning:](self, "_addOperationAtBeginning:", v5);
  -[NSLock unlock](self->_lock, "unlock");
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C795C;
  block[3] = &unk_10034AC30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)replayIncompleteOperations
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (int)v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if (!(_DWORD)v7) {
    goto LABEL_12;
  }
  int v16 = 138412546;
  id v17 = (id)objc_opt_class(self);
  __int16 v18 = 2112;
  objc_super v19 = v4;
  id v9 = v17;
  uint64_t v10 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  1LL,  "[%@] Replaying Incomplete Operations before [%@]",  &v16,  22);

  if (v10)
  {
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    SSFileLog(v5, @"%@");
LABEL_12:
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000C7B7C;
  v13[3] = &unk_10034CE68;
  id v14 = v4;
  int v15 = self;
  id v12 = v4;
  [v11 modifyAsyncUsingTransactionBlock:v13];
}

- (void)resetProgressForApplicationHandle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[ApplicationWorkspaceOperation initWithApplicationHandle:]( objc_alloc(&OBJC_CLASS___ApplicationWorkspaceClearProgressOperation),  "initWithApplicationHandle:",  v4);

  -[NSLock lock](self->_lock, "lock");
  -[NSMutableArray addObject:](self->_operations, "addObject:", v5);
  -[NSLock unlock](self->_lock, "unlock");
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C8728;
  block[3] = &unk_10034AC30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)restorePlaceholderForApplicationHandle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[ApplicationWorkspaceFinishOperation initWithApplicationHandle:isPlaceholderRestore:]( objc_alloc(&OBJC_CLASS___ApplicationWorkspaceFinishOperation),  "initWithApplicationHandle:isPlaceholderRestore:",  v4,  1LL);

  -[NSLock lock](self->_lock, "lock");
  -[ApplicationWorkspace _addOperationAtBeginning:](self, "_addOperationAtBeginning:", v5);
  -[NSLock unlock](self->_lock, "unlock");
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C87E4;
  block[3] = &unk_10034AC30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)setIconData:(id)a3 forApplicationHandle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned __int8 v8 = -[ApplicationWorkspaceInstallPlaceholderOperation initWithApplicationHandle:iconData:]( objc_alloc(&OBJC_CLASS___ApplicationWorkspaceInstallPlaceholderOperation),  "initWithApplicationHandle:iconData:",  v6,  v7);

  -[NSLock lock](self->_lock, "lock");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v9) {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v10 = [v9 shouldLog];
  else {
    unsigned int v11 = v10;
  }
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v11 & 2;
  }
  if (!(_DWORD)v13) {
    goto LABEL_12;
  }
  int v17 = 138412290;
  id v18 = v6;
  id v14 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[ApplicationWorkspace]: Setting placeholder thumbnail icon data for %@",  &v17,  12);

  if (v14)
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
    free(v14);
    SSFileLog(v9, @"%@");
LABEL_12:
  }

  -[NSMutableArray addObject:](self->_operations, "addObject:", v8);
  -[NSLock unlock](self->_lock, "unlock");
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C89EC;
  block[3] = &unk_10034AC30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)shouldModifyQuota:(id)a3
{
  id v3 = a3;
  if ((SSDownloadKindIsSoftwareKind(v3) & 1) != 0)
  {
    unsigned __int8 v4 = 0;
  }

  else if ((SSDownloadKindIsEBookKind(v3) & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:SSDownloadKindDocument];
  }

  return v4;
}

- (void)uninstallPlaceholderForApplicationHandle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[ApplicationWorkspaceOperation initWithApplicationHandle:]( objc_alloc(&OBJC_CLASS___ApplicationWorkspaceUninstallOperation),  "initWithApplicationHandle:",  v4);
  -[NSLock lock](self->_lock, "lock");
  id v6 = [v4 downloadID];

  -[ApplicationWorkspace _removeOperationsForDownloadIdentifier:](self, "_removeOperationsForDownloadIdentifier:", v6);
  -[ApplicationWorkspace _addOperationAtBeginning:](self, "_addOperationAtBeginning:", v5);
  -[NSLock unlock](self->_lock, "unlock");
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C8B24;
  block[3] = &unk_10034AC30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)updatePlaceholderForApplicationHandle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[ApplicationWorkspaceInstallPlaceholderOperation initWithApplicationHandle:forceUpdate:]( objc_alloc(&OBJC_CLASS___ApplicationWorkspaceInstallPlaceholderOperation),  "initWithApplicationHandle:forceUpdate:",  v4,  1LL);

  -[NSLock lock](self->_lock, "lock");
  -[NSMutableArray addObject:](self->_operations, "addObject:", v5);
  -[NSLock unlock](self->_lock, "unlock");
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C8BE0;
  block[3] = &unk_10034AC30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)updatePlaceholderWithApplicationProgress:(id)a3
{
  id v4 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v4 applicationHandle]);
  -[NSLock lock](self->_lock, "lock");
  appProgress = self->_appProgress;
  if (!appProgress)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v7 = self->_appProgress;
    self->_appProgress = v6;

    appProgress = self->_appProgress;
  }

  id v8 = [v4 copy];
  -[NSMutableDictionary setObject:forKey:](appProgress, "setObject:forKey:", v8, v11);

  -[NSLock unlock](self->_lock, "unlock");
  id v9 = -[ApplicationWorkspace _copyCombinedApplicationProgress:forApplicationHandle:]( self,  "_copyCombinedApplicationProgress:forApplicationHandle:",  v4,  v11);

  unsigned int v10 = -[ApplicationWorkspaceProgressOperation initWithApplicationDownloadProgress:]( objc_alloc(&OBJC_CLASS___ApplicationWorkspaceProgressOperation),  "initWithApplicationDownloadProgress:",  v9);
  -[ApplicationWorkspace _addProgressOperation:](self, "_addProgressOperation:", v10);
}

- (void)waitForInstallOfDownloadIdentifier:(int64_t)a3 completionBlock:(id)a4
{
  id v6 = [a4 copy];
  -[NSLock lock](self->_lock, "lock");
  if (!-[ApplicationWorkspace _isInstallingForDownloadIdentifier:](self, "_isInstallingForDownloadIdentifier:", a3))
  {
    callbackQueue = (dispatch_queue_s *)self->_callbackQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C8F64;
    block[3] = &unk_10034ACB8;
    uint64_t v25 = (NSNumber *)v6;
    dispatch_async(callbackQueue, block);
    uint64_t v13 = v25;
    goto LABEL_21;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v7) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v8 = [v7 shouldLog];
  else {
    unsigned int v9 = v8;
  }
  unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v9 & 2;
  }
  if (!(_DWORD)v11) {
    goto LABEL_13;
  }
  int v26 = 134217984;
  int64_t v27 = a3;
  id v12 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  2LL,  "[ApplicationWorkspace]: Waiting for pending placeholder installs of download: %lld",  &v26);

  if (v12)
  {
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
    free(v12);
    v23 = v10;
    SSFileLog(v7, @"%@");
LABEL_13:
  }

  uint64_t v13 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
  waitBlocks = self->_waitBlocks;
  if (!waitBlocks)
  {
    int v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    int v16 = self->_waitBlocks;
    self->_waitBlocks = v15;

    waitBlocks = self->_waitBlocks;
  }

  uint64_t v17 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](waitBlocks, "objectForKey:", v13, v23));
  if (v17)
  {
    id v18 = (NSMutableArray *)v17;
    id v19 = objc_retainBlock(v6);
    -[NSMutableArray addObject:](v18, "addObject:", v19);
  }

  else
  {
    unsigned int v21 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    id v22 = objc_retainBlock(v6);
    id v18 = -[NSMutableArray initWithObjects:](v21, "initWithObjects:", v22, 0LL);

    -[NSMutableDictionary setObject:forKey:](self->_waitBlocks, "setObject:forKey:", v18, v13);
  }

LABEL_21:
  -[NSLock unlock](self->_lock, "unlock");
}

- (id)sinfPathForBundleID:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v4));
    id v6 = v5;
    if (v5)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleURL]);
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);

      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleExecutable]);
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathExtension:@"sinf"]);

      if ([v8 length] && objc_msgSend(v10, "length"))
      {
        uint64_t v11 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  v8,  @"SC_Info",  v10,  0LL);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v11));
      }

      else
      {
        id v12 = 0LL;
      }
    }

    else
    {
      id v12 = 0LL;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (void)_addOperationAtBeginning:(id)a3
{
  id v10 = a3;
  uint64_t v4 = (uint64_t)-[NSMutableArray count](self->_operations, "count");
  if (v4 < 1)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0LL;
    while (1)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_operations, "objectAtIndex:", v6));
      uint64_t v8 = objc_opt_class(v7);
      uint64_t v9 = objc_opt_class(v10);

      if (v8 != v9) {
        break;
      }
      if (v5 == ++v6)
      {
        uint64_t v6 = v5;
        break;
      }
    }
  }

  -[NSMutableArray insertObject:atIndex:](self->_operations, "insertObject:atIndex:", v10, v6);
}

- (void)_addProgressOperation:(id)a3
{
  id v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 applicationHandle]);
  id v6 = [v5 downloadID];

  uint64_t v7 = (uint64_t)-[NSMutableArray count](self->_operations, "count");
  if (v7 >= 1)
  {
    uint64_t v8 = v7 + 1;
    while (1)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_operations, "objectAtIndex:", v8 - 2));
      uint64_t v10 = objc_opt_class(v9);
      if (v10 == objc_opt_class(v4))
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationHandle]);
        id v12 = [v11 downloadID];

        if (v12 == v6) {
          break;
        }
      }
    }

    -[NSMutableArray removeObjectAtIndex:](self->_operations, "removeObjectAtIndex:", v8 - 2);
  }

- (void)_cancelPlaceholderThumbnailInstallForDownloadID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[ApplicationWorkspace _thumbnailDownloadOperationForDownloadID:]( self,  "_thumbnailDownloadOperationForDownloadID:",  a3));
  id v4 = v3;
  if (v3)
  {
    [v3 cancel];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v5) {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v6 = [v5 shouldLog];
    else {
      LODWORD(v7) = v6;
    }
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v7 = v7;
    }
    else {
      v7 &= 2u;
    }
    if ((_DWORD)v7)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 applicationHandle]);
      int v11 = 138412290;
      id v12 = v9;
      uint64_t v10 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[ApplicationWorkspace]: Canceled placeholder thumbnail operation for %@ because we are installing",  &v11,  12);

      if (!v10)
      {
LABEL_14:

        goto LABEL_15;
      }

      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
      free(v10);
      SSFileLog(v5, @"%@");
    }

    goto LABEL_14;
  }

- (id)_copyCombinedApplicationProgress:(id)a3 forApplicationHandle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___ApplicationDownloadProgress);
  -[ApplicationDownloadProgress setApplicationHandle:](v7, "setApplicationHandle:", v5);

  id v8 = [v6 completedUnitCount];
  id v9 = [v6 totalUnitCount];

  -[ApplicationDownloadProgress setCompletedUnitCount:](v7, "setCompletedUnitCount:", v8);
  -[ApplicationDownloadProgress setTotalUnitCount:](v7, "setTotalUnitCount:", v9);
  return v7;
}

- (void)_fireWaitBlocksIfNecessaryForDownloadWithIdentifier:(int64_t)a3
{
  if (-[ApplicationWorkspace _isInstallingForDownloadIdentifier:](self, "_isInstallingForDownloadIdentifier:", a3))
  {
    id v5 = 0LL;
  }

  else
  {
    id v6 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_waitBlocks, "objectForKey:", v6));
    id v5 = [v7 copy];

    -[NSMutableDictionary removeObjectForKey:](self->_waitBlocks, "removeObjectForKey:", v6);
  }

  -[NSLock unlock](self->_lock, "unlock");
  if ([v5 count])
  {
    callbackQueue = (dispatch_queue_s *)self->_callbackQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C9664;
    block[3] = &unk_10034AC30;
    id v10 = v5;
    dispatch_async(callbackQueue, block);
  }
}

- (void)_fireWaitBlocksForSyncTermination
{
  id v3 = -[NSMutableArray copy](self->_syncWaitBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_syncWaitBlocks, "removeAllObjects");
  -[NSLock unlock](self->_lock, "unlock");
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C97F4;
  v6[3] = &unk_10034AD58;
  id v7 = v3;
  id v8 = self;
  id v5 = v3;
  dispatch_async(dispatchQueue, v6);
}

- (BOOL)_hasThumbnailDownloadOperationForDownloadID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[ApplicationWorkspace _thumbnailDownloadOperationForDownloadID:]( self,  "_thumbnailDownloadOperationForDownloadID:",  a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (BOOL)_isInstallingForDownloadIdentifier:(int64_t)a3
{
  id v5 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
  if (-[NSCountedSet countForObject:](self->_pendingInstalls, "countForObject:", v5))
  {
    BOOL v6 = 1;
  }

  else
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v7 = self->_operations;
    id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "applicationHandle", (void)v16));
          if ([v13 downloadID] == (id)a3)
          {
            unsigned __int8 v14 = [v12 blocksAppInstallation];

            if ((v14 & 1) != 0)
            {
              BOOL v6 = 1;
              goto LABEL_15;
            }
          }

          else
          {
          }
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      }

      while (v9);
    }

    BOOL v6 = 0;
LABEL_15:
  }

  return v6;
}

- (void)_performNextOperation
{
  if (-[NSMutableArray count](self->_operations, "count"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_operations, "objectAtIndex:", 0LL));
    -[NSMutableArray removeObjectAtIndex:](self->_operations, "removeObjectAtIndex:", 0LL);
    -[NSLock unlock](self->_lock, "unlock");
    if (v3)
    {
      uint64_t v14 = 0LL;
      int v15 = &v14;
      uint64_t v16 = 0x3032000000LL;
      __int128 v17 = sub_1000C9CD0;
      __int128 v18 = sub_1000C9CE0;
      id v19 = 0LL;
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationHandle]);
      id v5 = [v4 downloadID];
      if ([v3 blocksAppInstallation]) {
        -[ApplicationWorkspace _incrementPendingInstallsForDownloadIdentifier:]( self,  "_incrementPendingInstallsForDownloadIdentifier:",  v5);
      }
      id v8 = _NSConcreteStackBlock;
      uint64_t v9 = 3221225472LL;
      uint64_t v10 = sub_1000C9CE8;
      int v11 = &unk_10034DA70;
      uint64_t v13 = &v14;
      BOOL v6 = dispatch_semaphore_create(0LL);
      id v12 = v6;
      [v3 runWithCompletionBlock:&v8];
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
      id v7 = (void *)v15[5];
      if (v7) {
        objc_msgSend(v7, "isFinished", v8, v9, v10, v11);
      }
      if (objc_msgSend(v3, "blocksAppInstallation", v8, v9, v10, v11)) {
        -[ApplicationWorkspace _decrementPendingInstallsForDownloadIdentifier:]( self,  "_decrementPendingInstallsForDownloadIdentifier:",  v5);
      }
      -[ApplicationWorkspace _fireWaitBlocksIfNecessaryForDownloadWithIdentifier:]( self,  "_fireWaitBlocksIfNecessaryForDownloadWithIdentifier:",  v5);

      _Block_object_dispose(&v14, 8);
    }
  }

  else
  {
    -[NSLock unlock](self->_lock, "unlock");
  }

- (void)_removeApplicationDownloadProgressForApplicationHandle:(id)a3
{
  if (!-[NSMutableDictionary count](self->_appProgress, "count"))
  {
    appProgress = self->_appProgress;
    self->_appProgress = 0LL;
  }

- (void)_removeOperationsForDownloadIdentifier:(int64_t)a3
{
}

- (void)_removeOperationsForDownloadIdentifier:(int64_t)a3 operationClass:(Class)a4
{
  uint64_t v7 = (uint64_t)-[NSMutableArray count](self->_operations, "count");
  if (v7 >= 1)
  {
    unint64_t v8 = v7 + 1;
    do
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_operations, "objectAtIndex:", v8 - 2));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationHandle]);
      id v11 = [v10 downloadID];

      if (v11 == (id)a3 && (!a4 || (objc_opt_isKindOfClass(v9, a4) & 1) != 0)) {
        -[NSMutableArray removeObjectAtIndex:](self->_operations, "removeObjectAtIndex:", v8 - 2);
      }

      --v8;
    }

    while (v8 > 1);
  }

- (void)_stopObservingODRProgress:(id)a3
{
  id v4 = a3;
  [v4 removeObserver:self forKeyPath:@"finished" context:0];
  [v4 removeObserver:self forKeyPath:@"fractionCompleted" context:0];
}

- (id)_thumbnailDownloadOperationForDownloadID:(int64_t)a3
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ISOperationQueue operations](self->_placeholderIconOperationQueue, "operations", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationHandle]);
        if ([v10 downloadID] == (id)a3)
        {
          id v11 = v9;

          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v11 = 0LL;
LABEL_11:

  return v11;
}

- (void)_updatePlaceholderWithODRProgressForApplicationHandle:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  -[NSLock lock](lock, "lock");
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_appProgress, "objectForKey:", v5));
  -[NSLock unlock](self->_lock, "unlock");
  id v6 = -[ApplicationWorkspace _copyCombinedApplicationProgress:forApplicationHandle:]( self,  "_copyCombinedApplicationProgress:forApplicationHandle:",  v8,  v5);

  uint64_t v7 = -[ApplicationWorkspaceProgressOperation initWithApplicationDownloadProgress:]( objc_alloc(&OBJC_CLASS___ApplicationWorkspaceProgressOperation),  "initWithApplicationDownloadProgress:",  v6);
  -[ApplicationWorkspace _addProgressOperation:](self, "_addProgressOperation:", v7);
}

- (void)_incrementPendingInstallsForDownloadIdentifier:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  -[NSCountedSet addObject:](self->_pendingInstalls, "addObject:", v5);

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_decrementPendingInstallsForDownloadIdentifier:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  if (!-[NSCountedSet containsObject:](self->_pendingInstalls, "containsObject:", v5))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      int v12 = 138412546;
      id v13 = (id)objc_opt_class(self);
      __int16 v14 = 2048;
      int64_t v15 = a3;
      id v10 = v13;
      id v11 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[%@] Decrementing pending installs for %lld but none found",  &v12,  22);

      if (!v11)
      {
LABEL_15:

        goto LABEL_16;
      }

      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
      free(v11);
      SSFileLog(v6, @"%@");
    }

    goto LABEL_15;
  }

  -[NSCountedSet removeObject:](self->_pendingInstalls, "removeObject:", v5);
LABEL_16:

  -[NSLock unlock](self->_lock, "unlock");
}

- (void).cxx_destruct
{
}

@end