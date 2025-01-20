@interface DownloadController
+ (id)controller;
- (BOOL)_cancelDownloads:(id)a3 client:(id)a4;
- (BOOL)_pauseDownloads:(id)a3 isForced:(BOOL)a4 client:(id)a5;
- (BOOL)_prioritizeDownload:(id)a3 aboveDownload:(id)a4 client:(id)a5 error:(id *)a6;
- (BOOL)_restartDownloads:(id)a3 client:(id)a4;
- (BOOL)_resumeDownloads:(id)a3 client:(id)a4;
- (DownloadController)init;
- (id)_downloadPersistentIDsFromBundleIDs:(id)a3;
- (id)_managerClientForConnection:(id)a3;
- (void)_clientDisconnectNotification:(id)a3;
- (void)_dispatchAsync:(id)a3;
- (void)_filterAndTranslateProperties:(id)a3 usingBlock:(id)a4;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5;
- (void)_handleSessionMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5;
- (void)_handleSessionMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5;
- (void)_rescueStuckPlaceholderWithBundleID:(id)a3;
- (void)_retryRestoreIfNecessaryForTransaction:(id)a3;
- (void)_sendDownloadKindsUsingNetwork:(id)a3;
- (void)applicationInstallsDidCancel:(id)a3;
- (void)applicationInstallsDidPause:(id)a3;
- (void)applicationInstallsDidPrioritize:(id)a3;
- (void)applicationInstallsDidResume:(id)a3;
- (void)beginUsingNetworkForDownloadKind:(id)a3;
- (void)cancelAllDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)cancelDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)connectDownloadHandlerWithMessage:(id)a3 connection:(id)a4;
- (void)dealloc;
- (void)endUsingNetworkForDownloadKind:(id)a3;
- (void)finishDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)finishSessionWithMessage:(id)a3 connection:(id)a4;
- (void)getActiveDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)getCellularNetworkAllowed:(id)a3 connection:(id)a4;
- (void)getDownloadAssetPropertiesWithMessage:(id)a3 connection:(id)a4;
- (void)getDownloadAssetsWithMessage:(id)a3 connection:(id)a4;
- (void)getDownloadKindsUsingNetworkWithMessage:(id)a3 connection:(id)a4;
- (void)getDownloadPropertiesWithMessage:(id)a3 connection:(id)a4;
- (void)getDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)getEntityExistsWithMessage:(id)a3 connection:(id)a4;
- (void)getSessionPropertiesWithMessage:(id)a3 connection:(id)a4;
- (void)insertDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)moveDownloadWithMessage:(id)a3 connection:(id)a4;
- (void)notifyClientsOfChangeset:(id)a3;
- (void)notifyClientsOfExternalPropertyChanges:(id)a3 connection:(id)a4;
- (void)notifyClientsOfExternalPropertyChanges:(id)a3 forDownloadID:(int64_t)a4 downloadKind:(id)a5;
- (void)notifyClientsOfExternalStateChanges:(id)a3 connection:(id)a4;
- (void)notifyClientsOfPropertyChanges:(id)a3 forDownloadID:(int64_t)a4 downloadKind:(id)a5;
- (void)observeXPCServer:(id)a3;
- (void)pauseDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)prioritizeDownloadWithMessage:(id)a3 connection:(id)a4;
- (void)registerClientDownloadManager:(id)a3 connection:(id)a4;
- (void)removePersistenceIDWithMessage:(id)a3 connection:(id)a4;
- (void)resetDisavowedSessionsWithMessage:(id)a3 connection:(id)a4;
- (void)restartDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)resumeDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)retryRestoreDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)setAssetPropertiesWithMessage:(id)a3 connection:(id)a4;
- (void)setCellularNetworkAllowed:(id)a3 connection:(id)a4;
- (void)setClientDownloadHandlerWithMessage:(id)a3 connection:(id)a4;
- (void)setDownloadHandlerWithMessage:(id)a3 connection:(id)a4;
- (void)setDownloadPropertiesWithMessage:(id)a3 connection:(id)a4;
- (void)setDownloadsWithMessage:(id)a3 connection:(id)a4;
- (void)setHandlerPropertiesWithMessage:(id)a3 connection:(id)a4;
- (void)setSessionProgressWithMessage:(id)a3 connection:(id)a4;
- (void)setSessionPropertiesWithMessage:(id)a3 connection:(id)a4;
- (void)setSessionStatusDescriptionWithMessage:(id)a3 connection:(id)a4;
- (void)start;
@end

@implementation DownloadController

- (DownloadController)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___DownloadController;
  v2 = -[DownloadController init](&v16, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.DownloadController", 0LL);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.itunesstored.DownloadController.external", 0LL);
    externalQueue = v2->_externalQueue;
    v2->_externalQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    managerClients = v2->_managerClients;
    v2->_managerClients = v7;

    if ((SSDebugShouldUseAppstored(v9, v10) & 1) == 0)
    {
      v11 = objc_alloc_init(&OBJC_CLASS___WorkspaceDownloadObserver);
      workspaceDownloadObserver = v2->_workspaceDownloadObserver;
      v2->_workspaceDownloadObserver = v11;

      -[WorkspaceDownloadObserver setDelegate:](v2->_workspaceDownloadObserver, "setDelegate:", v2);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ApplicationWorkspace defaultWorkspace](&OBJC_CLASS___ApplicationWorkspace, "defaultWorkspace"));
    [v13 replayIncompleteOperations];

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v2 selector:"_clientDisconnectNotification:" name:@"XPCClientDisconnectNotification" object:0];
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:@"XPCClientDisconnectNotification" object:0];
  -[WorkspaceDownloadObserver setDelegate:](self->_workspaceDownloadObserver, "setDelegate:", 0LL);
  -[WorkspaceDownloadObserver stopObserving](self->_workspaceDownloadObserver, "stopObserving");

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DownloadController;
  -[DownloadController dealloc](&v4, "dealloc");
}

+ (id)controller
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100110CFC;
  block[3] = &unk_10034AC90;
  block[4] = a1;
  if (qword_1003A3488 != -1) {
    dispatch_once(&qword_1003A3488, block);
  }
  return (id)qword_1003A3480;
}

- (void)beginUsingNetworkForDownloadKind:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100110DA0;
  v7[3] = &unk_10034AD58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)endUsingNetworkForDownloadKind:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100110E98;
  v7[3] = &unk_10034AD58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)notifyClientsOfChangeset:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 changedDownloadKinds]);
  if ([v5 count])
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1001110D4;
    v19[3] = &unk_10034BCE8;
    v19[4] = self;
    id v20 = v5;
    id v21 = v4;
    -[DownloadController _dispatchAsync:](self, "_dispatchAsync:", v19);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 finishedDownloadKinds]);
  if ([v6 count])
  {
    v14 = v5;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        v12 = 0LL;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"com.apple.itunesstored.SSDownloadManager.downloadCompleted.%@",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v12));
          CFNotificationCenterPostNotification(DarwinNotifyCenter, v13, 0LL, 0LL, 1u);

          v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v22 count:16];
      }

      while (v10);
    }

    dispatch_queue_t v5 = v14;
  }
}

- (void)notifyClientsOfExternalPropertyChanges:(id)a3 forDownloadID:(int64_t)a4 downloadKind:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001112C4;
    v11[3] = &unk_10034ECE0;
    v11[4] = self;
    id v12 = v9;
    int64_t v14 = a4;
    id v13 = v8;
    dispatch_async(dispatchQueue, v11);
  }
}

- (void)notifyClientsOfPropertyChanges:(id)a3 forDownloadID:(int64_t)a4 downloadKind:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001114B8;
    v11[3] = &unk_10034ECE0;
    v11[4] = self;
    id v12 = v9;
    int64_t v14 = a4;
    id v13 = v8;
    dispatch_async(dispatchQueue, v11);
  }
}

- (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:self selector:"cancelAllDownloadsWithMessage:connection:" forMessage:0];
  [v4 addObserver:self selector:"cancelDownloadsWithMessage:connection:" forMessage:1];
  [v4 addObserver:self selector:"finishDownloadsWithMessage:connection:" forMessage:7];
  [v4 addObserver:self selector:"getActiveDownloadsWithMessage:connection:" forMessage:8];
  [v4 addObserver:self selector:"getDownloadAssetPropertiesWithMessage:connection:" forMessage:26];
  [v4 addObserver:self selector:"getDownloadAssetPropertiesWithMessage:connection:" forMessage:10];
  [v4 addObserver:self selector:"getDownloadAssetsWithMessage:connection:" forMessage:11];
  [v4 addObserver:self selector:"getDownloadKindsUsingNetworkWithMessage:connection:" forMessage:29];
  [v4 addObserver:self selector:"getDownloadPropertiesWithMessage:connection:" forMessage:27];
  [v4 addObserver:self selector:"getDownloadPropertiesWithMessage:connection:" forMessage:13];
  [v4 addObserver:self selector:"getDownloadsWithMessage:connection:" forMessage:14];
  [v4 addObserver:self selector:"getEntityExistsWithMessage:connection:" forMessage:53];
  [v4 addObserver:self selector:"getEntityExistsWithMessage:connection:" forMessage:52];
  [v4 addObserver:self selector:"insertDownloadsWithMessage:connection:" forMessage:15];
  [v4 addObserver:self selector:"moveDownloadWithMessage:connection:" forMessage:16];
  [v4 addObserver:self selector:"notifyClientsOfExternalPropertyChanges:connection:" forMessage:176];
  [v4 addObserver:self selector:"notifyClientsOfExternalStateChanges:connection:" forMessage:177];
  [v4 addObserver:self selector:"pauseDownloadsWithMessage:connection:" forMessage:17];
  [v4 addObserver:self selector:"prioritizeDownloadWithMessage:connection:" forMessage:28];
  [v4 addObserver:self selector:"registerClientDownloadManager:connection:" forMessage:18];
  [v4 addObserver:self selector:"removePersistenceIDWithMessage:connection:" forMessage:6];
  [v4 addObserver:self selector:"resumeDownloadsWithMessage:connection:" forMessage:19];
  [v4 addObserver:self selector:"restartDownloadsWithMessage:connection:" forMessage:20];
  [v4 addObserver:self selector:"retryRestoreDownloadsWithMessage:connection:" forMessage:37];
  [v4 addObserver:self selector:"setAssetPropertiesWithMessage:connection:" forMessage:21];
  [v4 addObserver:self selector:"setDownloadHandlerWithMessage:connection:" forMessage:23];
  [v4 addObserver:self selector:"setDownloadPropertiesWithMessage:connection:" forMessage:24];
  [v4 addObserver:self selector:"setDownloadPropertiesWithMessage:connection:" forMessage:32];
  [v4 addObserver:self selector:"setDownloadsWithMessage:connection:" forMessage:39];
  [v4 addObserver:self selector:"getCellularNetworkAllowed:connection:" forMessage:87];
  [v4 addObserver:self selector:"setCellularNetworkAllowed:connection:" forMessage:88];
  [v4 addObserver:self selector:"finishSessionWithMessage:connection:" forMessage:2];
  [v4 addObserver:self selector:"getSessionPropertiesWithMessage:connection:" forMessage:12];
  [v4 addObserver:self selector:"connectDownloadHandlerWithMessage:connection:" forMessage:3];
  [v4 addObserver:self selector:"resetDisavowedSessionsWithMessage:connection:" forMessage:40];
  [v4 addObserver:self selector:"setClientDownloadHandlerWithMessage:connection:" forMessage:22];
  [v4 addObserver:self selector:"setSessionProgressWithMessage:connection:" forMessage:4];
  [v4 addObserver:self selector:"setHandlerPropertiesWithMessage:connection:" forMessage:31];
  [v4 addObserver:self selector:"setSessionPropertiesWithMessage:connection:" forMessage:30];
  [v4 addObserver:self selector:"setSessionStatusDescriptionWithMessage:connection:" forMessage:51];
}

- (void)start
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
  [v4 modifyAsyncUsingTransactionBlock:&stru_10034ED00];
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[StoreDownloadQueue sharedDownloadQueue](&OBJC_CLASS___StoreDownloadQueue, "sharedDownloadQueue"));
  [v3 restoreAllRestorableDownloadsWithReason:@"other"];
  [v4 dispatchBlockAsync:&stru_10034ED20];
  -[WorkspaceDownloadObserver startObserving](self->_workspaceDownloadObserver, "startObserving");
}

- (void)applicationInstallsDidPause:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) applicationIdentifier]);
        if ([v11 length]) {
          -[NSMutableSet addObject:](v5, "addObject:", v11);
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100111CBC;
  v13[3] = &unk_10034AD58;
  v13[4] = self;
  int64_t v14 = v5;
  id v12 = v5;
  -[DownloadController _dispatchAsync:](self, "_dispatchAsync:", v13);
}

- (void)applicationInstallsDidResume:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) applicationIdentifier]);
        if ([v11 length]) {
          -[NSMutableSet addObject:](v5, "addObject:", v11);
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100111ECC;
  v13[3] = &unk_10034AD58;
  v13[4] = self;
  int64_t v14 = v5;
  id v12 = v5;
  -[DownloadController _dispatchAsync:](self, "_dispatchAsync:", v13);
}

- (void)applicationInstallsDidCancel:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) applicationIdentifier]);
        if ([v11 length]) {
          -[NSMutableSet addObject:](v5, "addObject:", v11);
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001120F8;
  v13[3] = &unk_10034AD58;
  v13[4] = self;
  int64_t v14 = v5;
  id v12 = v5;
  -[DownloadController _dispatchAsync:](self, "_dispatchAsync:", v13);
}

- (void)applicationInstallsDidPrioritize:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * (void)v10) applicationIdentifier]);
        if ([v11 length]) {
          -[NSMutableSet addObject:](v5, "addObject:", v11);
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100112304;
  v13[3] = &unk_10034AD58;
  int64_t v14 = v5;
  __int128 v15 = self;
  id v12 = v5;
  -[DownloadController _dispatchAsync:](self, "_dispatchAsync:", v13);
}

- (void)cancelAllDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100112BC8;
  v7[3] = &unk_10034ED70;
  id v8 = a3;
  uint64_t v9 = self;
  id v6 = v8;
  -[DownloadController _handleMessage:connection:usingReplyBlock:]( self,  "_handleMessage:connection:usingReplyBlock:",  v6,  a4,  v7);
}

- (void)cancelDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100112F54;
  v7[3] = &unk_10034ED70;
  id v8 = a3;
  uint64_t v9 = self;
  id v6 = v8;
  -[DownloadController _handleMessage:connection:usingReplyBlock:]( self,  "_handleMessage:connection:usingReplyBlock:",  v6,  a4,  v7);
}

- (void)finishDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100113088;
  v7[3] = &unk_10034ED70;
  id v8 = a3;
  uint64_t v9 = self;
  id v6 = v8;
  -[DownloadController _handleMessage:connection:usingReplyBlock:]( self,  "_handleMessage:connection:usingReplyBlock:",  v6,  a4,  v7);
}

- (void)getActiveDownloadsWithMessage:(id)a3 connection:(id)a4
{
}

- (void)getDownloadAssetPropertiesWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011377C;
  v7[3] = &unk_10034EE00;
  id v8 = a3;
  id v6 = v8;
  -[DownloadController _handleMessage:connection:usingReplyBlock:]( self,  "_handleMessage:connection:usingReplyBlock:",  v6,  a4,  v7);
}

- (void)getDownloadAssetsWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100113B6C;
  v7[3] = &unk_10034EE00;
  id v8 = a3;
  id v6 = v8;
  -[DownloadController _handleMessage:connection:usingReplyBlock:]( self,  "_handleMessage:connection:usingReplyBlock:",  v6,  a4,  v7);
}

- (void)getDownloadKindsUsingNetworkWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100113E7C;
  v4[3] = &unk_10034EE00;
  v4[4] = self;
  -[DownloadController _handleMessage:connection:usingReplyBlock:]( self,  "_handleMessage:connection:usingReplyBlock:",  a3,  a4,  v4);
}

- (void)getDownloadPropertiesWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100113F58;
  v7[3] = &unk_10034EE00;
  id v8 = a3;
  id v6 = v8;
  -[DownloadController _handleMessage:connection:usingReplyBlock:]( self,  "_handleMessage:connection:usingReplyBlock:",  v6,  a4,  v7);
}

- (void)getDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100114348;
  v6[3] = &unk_10034ED70;
  id v7 = self;
  id v8 = a3;
  id v5 = v8;
  -[DownloadController _handleMessage:connection:usingReplyBlock:]( v7,  "_handleMessage:connection:usingReplyBlock:",  v5,  a4,  v6);
}

- (void)getEntityExistsWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100114D1C;
  v7[3] = &unk_10034EE00;
  id v8 = a3;
  id v6 = v8;
  -[DownloadController _handleMessage:connection:usingReplyBlock:]( self,  "_handleMessage:connection:usingReplyBlock:",  v6,  a4,  v7);
}

- (void)insertDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100114F8C;
  v6[3] = &unk_10034ED70;
  id v7 = self;
  id v8 = a3;
  id v5 = v8;
  -[DownloadController _handleMessage:connection:usingReplyBlock:]( v7,  "_handleMessage:connection:usingReplyBlock:",  v5,  a4,  v6);
}

- (void)moveDownloadWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100115EA4;
  v7[3] = &unk_10034EE00;
  id v8 = a3;
  id v6 = v8;
  -[DownloadController _handleMessage:connection:usingReplyBlock:]( self,  "_handleMessage:connection:usingReplyBlock:",  v6,  a4,  v7);
}

- (void)notifyClientsOfExternalStateChanges:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001160E8;
  v7[3] = &unk_10034ED70;
  id v8 = a3;
  uint64_t v9 = self;
  id v6 = v8;
  -[DownloadController _handleMessage:connection:usingReplyBlock:]( self,  "_handleMessage:connection:usingReplyBlock:",  v6,  a4,  v7);
}

- (void)notifyClientsOfExternalPropertyChanges:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100116648;
  v7[3] = &unk_10034ED70;
  id v8 = a3;
  uint64_t v9 = self;
  id v6 = v8;
  -[DownloadController _handleMessage:connection:usingReplyBlock:]( self,  "_handleMessage:connection:usingReplyBlock:",  v6,  a4,  v7);
}

- (void)pauseDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001167B8;
  v7[3] = &unk_10034ED70;
  id v8 = a3;
  uint64_t v9 = self;
  id v6 = v8;
  -[DownloadController _handleMessage:connection:usingReplyBlock:]( self,  "_handleMessage:connection:usingReplyBlock:",  v6,  a4,  v7);
}

- (void)prioritizeDownloadWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100116900;
  v7[3] = &unk_10034ED70;
  id v8 = a3;
  uint64_t v9 = self;
  id v6 = v8;
  -[DownloadController _handleMessage:connection:usingReplyBlock:]( self,  "_handleMessage:connection:usingReplyBlock:",  v6,  a4,  v7);
}

- (void)registerClientDownloadManager:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)SSXPCConnectionCopyClientIdentifier(v7, 0LL);
  xpc_object_t value = xpc_dictionary_get_value(v6, "2");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(value);
  uint64_t v11 = v10;
  if (v10 && xpc_get_type(v10) == (xpc_type_t)&_xpc_type_endpoint)
  {
    if (v8)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100116D48;
      v21[3] = &unk_10034EFB8;
      id v22 = v11;
      v23 = self;
      id v24 = v8;
      id v25 = v6;
      -[DownloadController _handleMessage:connection:usingBlock:]( self,  "_handleMessage:connection:usingBlock:",  v25,  v7,  v21);

      id v12 = v22;
      goto LABEL_16;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v12) {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v19 = [v12 shouldLog];
    else {
      LODWORD(v20) = v19;
    }
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v20 = v20;
    }
    else {
      v20 &= 2u;
    }
    if (!(_DWORD)v20) {
      goto LABEL_15;
    }
    int v26 = 138412290;
    id v27 = (id)objc_opt_class(self);
    id v16 = v27;
    uint64_t v17 = _os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "%@: No client identifier for client manager",  &v26,  12);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v12) {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v13 = [v12 shouldLog];
    else {
      LODWORD(v14) = v13;
    }
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v14 = v14;
    }
    else {
      v14 &= 2u;
    }
    if (!(_DWORD)v14) {
      goto LABEL_15;
    }
    int v26 = 138412546;
    id v27 = (id)objc_opt_class(self);
    __int16 v28 = 2112;
    v29 = v8;
    id v16 = v27;
    uint64_t v17 = _os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "%@: No endpoint for client manager: %@",  &v26,  22);
  }

  __int128 v18 = (void *)v17;

  if (v18)
  {
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL));
    free(v18);
    SSFileLog(v12, @"%@");
LABEL_15:
  }

- (void)removePersistenceIDWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001173F0;
  v7[3] = &unk_10034EFE0;
  id v8 = a3;
  id v6 = v8;
  -[DownloadController _handleMessage:connection:usingBlock:](self, "_handleMessage:connection:usingBlock:", v6, a4, v7);
}

- (void)resumeDownloadsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t value = xpc_dictionary_get_value(v6, "1");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v10 = v9;
  if (v9 && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_array)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472LL;
    applier[2] = sub_10011761C;
    applier[3] = &unk_10034BBD0;
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    id v16 = v11;
    xpc_array_apply(v10, applier);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100117698;
    v13[3] = &unk_10034ED70;
    void v13[4] = self;
    uint64_t v14 = v11;
    id v12 = v11;
    -[DownloadController _handleMessage:connection:usingReplyBlock:]( self,  "_handleMessage:connection:usingReplyBlock:",  v6,  v7,  v13);
  }
}

- (void)restartDownloadsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t value = xpc_dictionary_get_value(v6, "1");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v10 = v9;
  if (v9 && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_array)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472LL;
    applier[2] = sub_100117828;
    applier[3] = &unk_10034BBD0;
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    id v16 = v11;
    xpc_array_apply(v10, applier);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001178A4;
    v13[3] = &unk_10034ED70;
    void v13[4] = self;
    uint64_t v14 = v11;
    id v12 = v11;
    -[DownloadController _handleMessage:connection:usingReplyBlock:]( self,  "_handleMessage:connection:usingReplyBlock:",  v6,  v7,  v13);
  }
}

- (void)retryRestoreDownloadsWithMessage:(id)a3 connection:(id)a4
{
}

- (void)setAssetPropertiesWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100117AD4;
  v7[3] = &unk_10034EE00;
  id v8 = a3;
  id v6 = v8;
  -[DownloadController _handleMessage:connection:usingReplyBlock:]( self,  "_handleMessage:connection:usingReplyBlock:",  v6,  a4,  v7);
}

- (void)setDownloadHandlerWithMessage:(id)a3 connection:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100117E3C;
  v8[3] = &unk_10034F070;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  -[DownloadController _handleMessage:connection:usingBlock:](self, "_handleMessage:connection:usingBlock:", v7, v6, v8);
}

- (void)setDownloadPropertiesWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100118560;
  v7[3] = &unk_10034EE00;
  id v8 = a3;
  id v6 = v8;
  -[DownloadController _handleMessage:connection:usingReplyBlock:]( self,  "_handleMessage:connection:usingReplyBlock:",  v6,  a4,  v7);
}

- (void)setDownloadsWithMessage:(id)a3 connection:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100118980;
  v6[3] = &unk_10034ED70;
  id v7 = self;
  id v8 = a3;
  id v5 = v8;
  -[DownloadController _handleMessage:connection:usingReplyBlock:]( v7,  "_handleMessage:connection:usingReplyBlock:",  v5,  a4,  v6);
}

- (void)getCellularNetworkAllowed:(id)a3 connection:(id)a4
{
  xpc_object_t original = a3;
  id v5 = (_xpc_connection_s *)a4;
  if (SSXPCConnectionHasEntitlement(v5, kSSITunesStorePrivateEntitlement))
  {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"AllowAutoDownloadOnCellular",  kSSUserDefaultsIdentifier,  0LL);
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    xpc_dictionary_set_BOOL(reply, "1", AppBooleanValue != 0);
    xpc_connection_send_message(v5, reply);
  }
}

- (void)setCellularNetworkAllowed:(id)a3 connection:(id)a4
{
  xpc_object_t xdict = a3;
  if (SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement))
  {
    id v6 = (const __CFString *)kSSUserDefaultsIdentifier;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"AllowAutoDownloadOnCellular",  kSSUserDefaultsIdentifier,  0LL);
    BOOL v8 = xpc_dictionary_get_BOOL(xdict, "1");
    if (AppBooleanValue != v8)
    {
      CFPreferencesSetAppValue( @"AllowAutoDownloadOnCellular",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8),  v6);
      CFPreferencesAppSynchronize(v6);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification( DarwinNotifyCenter,  kSSNotificationAutomaticDownloadSettingsChanged,  0LL,  0LL,  1u);
      dispatch_async((dispatch_queue_t)self->_externalQueue, &stru_10034F108);
    }
  }
}

- (void)connectDownloadHandlerWithMessage:(id)a3 connection:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100119FA4;
  v8[3] = &unk_10034BCE8;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  -[DownloadController _handleSessionMessage:connection:usingBlock:]( self,  "_handleSessionMessage:connection:usingBlock:",  v7,  v6,  v8);
}

- (void)finishSessionWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011A4D4;
  v7[3] = &unk_10034AD58;
  id v8 = a3;
  id v9 = self;
  id v6 = v8;
  -[DownloadController _handleSessionMessage:connection:usingBlock:]( self,  "_handleSessionMessage:connection:usingBlock:",  v6,  a4,  v7);
}

- (void)getSessionPropertiesWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011AA6C;
  v7[3] = &unk_10034D658;
  id v8 = a3;
  id v9 = self;
  id v6 = v8;
  -[DownloadController _handleSessionMessage:connection:usingReplyBlock:]( self,  "_handleSessionMessage:connection:usingReplyBlock:",  v6,  a4,  v7);
}

- (void)resetDisavowedSessionsWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011ADAC;
  v7[3] = &unk_10034AC30;
  id v8 = a3;
  id v6 = v8;
  -[DownloadController _handleSessionMessage:connection:usingBlock:]( self,  "_handleSessionMessage:connection:usingBlock:",  v6,  a4,  v7);
}

- (void)setClientDownloadHandlerWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10011AEAC;
  v9[3] = &unk_10034AD58;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  -[DownloadController _handleSessionMessage:connection:usingBlock:]( self,  "_handleSessionMessage:connection:usingBlock:",  v7,  v8,  v9);
}

- (void)setHandlerPropertiesWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011AFCC;
  v7[3] = &unk_10034AD58;
  id v8 = a3;
  id v9 = self;
  id v6 = v8;
  -[DownloadController _handleSessionMessage:connection:usingBlock:]( self,  "_handleSessionMessage:connection:usingBlock:",  v6,  a4,  v7);
}

- (void)setSessionProgressWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011B420;
  v7[3] = &unk_10034AC30;
  id v8 = a3;
  id v6 = v8;
  -[DownloadController _handleSessionMessage:connection:usingBlock:]( self,  "_handleSessionMessage:connection:usingBlock:",  v6,  a4,  v7);
}

- (void)setSessionPropertiesWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011B56C;
  v7[3] = &unk_10034AC30;
  id v8 = a3;
  id v6 = v8;
  -[DownloadController _handleSessionMessage:connection:usingBlock:]( self,  "_handleSessionMessage:connection:usingBlock:",  v6,  a4,  v7);
}

- (void)setSessionStatusDescriptionWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011B814;
  v7[3] = &unk_10034AC30;
  id v8 = a3;
  id v6 = v8;
  -[DownloadController _handleSessionMessage:connection:usingBlock:]( self,  "_handleSessionMessage:connection:usingBlock:",  v6,  a4,  v7);
}

- (void)_clientDisconnectNotification:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10011B948;
  v5[3] = &unk_10034AD58;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  -[DownloadController _dispatchAsync:](self, "_dispatchAsync:", v5);
}

- (BOOL)_cancelDownloads:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  __int128 v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 1;
  if ([v6 count])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10011BCC4;
    v12[3] = &unk_10034F180;
    id v13 = v6;
    __int128 v15 = self;
    id v16 = &v17;
    id v14 = v7;
    id v9 = [v8 modifyUsingTransactionBlock:v12];
  }

  char v10 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return v10;
}

- (void)_dispatchAsync:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  [v5 takeKeepAliveAssertion:@"com.apple.itunesstored.DownloadController"];

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011C1EC;
  block[3] = &unk_10034ACB8;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, block);
}

- (id)_downloadPersistentIDsFromBundleIDs:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10011C304;
  v11[3] = &unk_10034CE18;
  id v12 = v3;
  id v6 = v4;
  id v13 = v6;
  id v7 = v3;
  [v5 readUsingTransactionBlock:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (void)_filterAndTranslateProperties:(id)a3 usingBlock:(id)a4
{
  id v5 = (void (**)(id, id, id))a4;
  id v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10011C6F0;
  v10[3] = &unk_10034F1A8;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  id v7 = v12;
  id v9 = v11;
  [v6 enumerateObjectsUsingBlock:v10];

  id v8 = -[NSMutableArray copy](v9, "copy");
  v5[2](v5, v7, v8);
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10011C800;
  v9[3] = &unk_10034F1D0;
  id v10 = a4;
  id v11 = a5;
  void v9[4] = self;
  id v7 = v10;
  id v8 = v11;
  -[DownloadController _dispatchAsync:](self, "_dispatchAsync:", v9);
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10011C914;
  v11[3] = &unk_10034EA38;
  id v12 = a3;
  id v13 = self;
  id v14 = a4;
  id v15 = a5;
  id v8 = v14;
  id v9 = v15;
  id v10 = v12;
  -[DownloadController _dispatchAsync:](self, "_dispatchAsync:", v11);
}

- (void)_handleSessionMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10011CA00;
  v7[3] = &unk_10034ACB8;
  id v8 = a5;
  id v6 = v8;
  -[DownloadController _dispatchAsync:](self, "_dispatchAsync:", v7);
}

- (void)_handleSessionMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10011CAD4;
  v12[3] = &unk_10034C2A0;
  id v14 = a4;
  id v15 = a5;
  id v13 = v8;
  id v9 = v14;
  id v10 = v15;
  id v11 = v8;
  -[DownloadController _dispatchAsync:](self, "_dispatchAsync:", v12);
}

- (id)_managerClientForConnection:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = self->_managerClients;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v11 = objc_msgSend(v10, "copyInputConnection", (void)v14);
        if (v11 == v4)
        {
          id v12 = v10;

          if (v12)
          {

            goto LABEL_13;
          }
        }

        else
        {
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v12 = -[DownloadManagerClient initWithInputConnection:]( objc_alloc(&OBJC_CLASS___DownloadManagerClient),  "initWithInputConnection:",  v4);
  -[NSMutableArray addObject:](self->_managerClients, "addObject:", v12);
LABEL_13:

  return v12;
}

- (BOOL)_pauseDownloads:(id)a3 isForced:(BOOL)a4 client:(id)a5
{
  unsigned int v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  char v35 = 1;
  id v10 = [v8 count];
  if (v6) {
    unsigned int v6 = [v9 hasEntitlements];
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v11) {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v12) = [v11 shouldLog];
  unsigned int v13 = [v11 shouldLogToDisk];
  __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
  __int128 v15 = v14;
  if (v13) {
    LODWORD(v12) = v12 | 2;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
    uint64_t v12 = v12;
  }
  else {
    v12 &= 2u;
  }
  if (!(_DWORD)v12) {
    goto LABEL_13;
  }
  __int128 v16 = (void *)objc_opt_class(self);
  int v36 = 138413058;
  v37 = v16;
  __int16 v38 = 2048;
  id v39 = v10;
  __int16 v40 = 2112;
  id v41 = v9;
  __int16 v42 = 1024;
  unsigned int v43 = v6;
  id v17 = v16;
  __int128 v18 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  1LL,  "%@: Pausing %ld downloads for %@, forced: %d",  &v36,  38);

  if (v18)
  {
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL));
    free(v18);
    SSFileLog(v11, @"%@");
LABEL_13:
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10011CF64;
  v25[3] = &unk_10034F1F8;
  id v20 = v8;
  id v26 = v20;
  id v21 = v9;
  id v27 = v21;
  __int16 v28 = self;
  v29 = &v32;
  id v30 = v10;
  char v31 = v6;
  id v22 = [v19 modifyUsingTransactionBlock:v25];

  BOOL v23 = *((_BYTE *)v33 + 24) != 0;
  _Block_object_dispose(&v32, 8);

  return v23;
}

- (BOOL)_prioritizeDownload:(id)a3 aboveDownload:(id)a4 client:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  char v35 = sub_100115530;
  int v36 = sub_100115540;
  id v37 = 0LL;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = 0;
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10011D718;
  v21[3] = &unk_10034F220;
  id v14 = v10;
  id v22 = v14;
  id v15 = v12;
  id v23 = v15;
  id v24 = self;
  id v26 = &v32;
  id v27 = &v28;
  id v16 = v11;
  id v25 = v16;
  id v17 = [v13 modifyUsingTransactionBlock:v21];

  if (a6)
  {
    __int128 v18 = (void *)v33[5];
    if (v18) {
      *a6 = v18;
    }
  }

  char v19 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v19;
}

- (void)_rescueStuckPlaceholderWithBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0 && [v4 length])
  {
    unsigned __int8 v6 = -[NSMutableSet containsObject:](self->_rescuingBundleIdentifiers, "containsObject:", v4);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    id v8 = (RescueAbandonedPlaceholderOperation *)v7;
    if ((v6 & 1) != 0)
    {
      if (!v7) {
        id v8 = (RescueAbandonedPlaceholderOperation *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedConfig]( &OBJC_CLASS___SSLogConfig,  "sharedConfig"));
      }
      unsigned int v9 = -[RescueAbandonedPlaceholderOperation shouldLog](v8, "shouldLog");
      else {
        LODWORD(v10) = v9;
      }
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[RescueAbandonedPlaceholderOperation OSLogObject](v8, "OSLogObject"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
        uint64_t v10 = v10;
      }
      else {
        v10 &= 2u;
      }
      if ((_DWORD)v10)
      {
        int v29 = 138412546;
        id v30 = (id)objc_opt_class(self);
        __int16 v31 = 2112;
        id v32 = v4;
        id v12 = v30;
        unsigned int v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "%@: Ignoring rescue for %@, operation already queued.",  &v29,  22);

        if (!v13)
        {
LABEL_31:

          goto LABEL_32;
        }

        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
        free(v13);
        SSFileLog(v8, @"%@");
      }

      goto LABEL_31;
    }

    if (!v7) {
      id v8 = (RescueAbandonedPlaceholderOperation *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedConfig]( &OBJC_CLASS___SSLogConfig,  "sharedConfig"));
    }
    unsigned int v14 = -[RescueAbandonedPlaceholderOperation shouldLog](v8, "shouldLog");
    else {
      unsigned int v15 = v14;
    }
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[RescueAbandonedPlaceholderOperation OSLogObject](v8, "OSLogObject"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = v15;
    }
    else {
      uint64_t v17 = v15 & 2;
    }
    if ((_DWORD)v17)
    {
      int v29 = 138412290;
      id v30 = v4;
      __int128 v18 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[Download]: Attempting rescue restore for bundle ID: %@",  &v29,  12);

      if (!v18)
      {
LABEL_28:

        rescuingBundleIdentifiers = self->_rescuingBundleIdentifiers;
        if (!rescuingBundleIdentifiers)
        {
          id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          id v21 = self->_rescuingBundleIdentifiers;
          self->_rescuingBundleIdentifiers = v20;

          rescuingBundleIdentifiers = self->_rescuingBundleIdentifiers;
        }

        -[NSMutableSet addObject:](rescuingBundleIdentifiers, "addObject:", v4, v24);
        id v8 = -[RescueAbandonedPlaceholderOperation initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___RescueAbandonedPlaceholderOperation),  "initWithBundleIdentifier:",  v4);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_10011DD98;
        v25[3] = &unk_10034F270;
        id v26 = (id)objc_claimAutoreleasedReturnValue( +[SSWeakReference weakReferenceWithObject:]( &OBJC_CLASS___SSWeakReference,  "weakReferenceWithObject:",  self));
        id v27 = v4;
        uint64_t v28 = self;
        id v22 = v26;
        -[RescueAbandonedPlaceholderOperation setOutputBlock:](v8, "setOutputBlock:", v25);
        id v23 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
        [v23 addOperation:v8];

        goto LABEL_31;
      }

      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL));
      free(v18);
      id v24 = v16;
      SSFileLog(v8, @"%@");
    }

    goto LABEL_28;
  }

- (BOOL)_resumeDownloads:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (uint64_t)[v6 count];
  if (v8 >= 1)
  {
    uint64_t v9 = v8;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v10) {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      int v23 = 138412802;
      id v24 = (id)objc_opt_class(self);
      __int16 v25 = 2048;
      uint64_t v26 = v9;
      __int16 v27 = 2112;
      id v28 = v7;
      id v14 = v24;
      unsigned int v15 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  1LL,  "%@: Resuming %lld downloads for %@",  &v23,  32);

      if (!v15)
      {
LABEL_14:

        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_10011E25C;
        v19[3] = &unk_10034C668;
        id v20 = v6;
        id v21 = v7;
        id v22 = self;
        id v17 = [v16 modifyUsingTransactionBlock:v19];

        goto LABEL_15;
      }

      unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
      free(v15);
      SSFileLog(v10, @"%@");
    }

    goto LABEL_14;
  }

- (BOOL)_restartDownloads:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (uint64_t)[v6 count];
  if (v8 >= 1)
  {
    uint64_t v9 = v8;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v10) {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      int v23 = 138412802;
      id v24 = (id)objc_opt_class(self);
      __int16 v25 = 2048;
      uint64_t v26 = v9;
      __int16 v27 = 2112;
      id v28 = v7;
      id v14 = v24;
      unsigned int v15 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  1LL,  "%@: Restarting %lld downloads for %@",  &v23,  32);

      if (!v15)
      {
LABEL_14:

        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_10011E7C0;
        v19[3] = &unk_10034C668;
        id v20 = v6;
        id v21 = v7;
        id v22 = self;
        id v17 = [v16 modifyUsingTransactionBlock:v19];

        goto LABEL_15;
      }

      unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
      free(v15);
      SSFileLog(v10, @"%@");
    }

    goto LABEL_14;
  }

- (void)_retryRestoreIfNecessaryForTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 changeset]);
  unsigned __int8 v6 = [v5 downloadChangeTypes];

  if ((v6 & 0x20) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      int v15 = 138412290;
      id v16 = (id)objc_opt_class(self);
      id v11 = v16;
      uint64_t v12 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%@: Retrying all failed restore downloads",  &v15,  12);

      if (!v12)
      {
LABEL_14:

        +[RestoreDownloadsOperation resetShouldSuppressTermsAndConditionsDialogs]( &OBJC_CLASS___RestoreDownloadsOperation,  "resetShouldSuppressTermsAndConditionsDialogs");
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
        id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"download_state.restore_state",  v13,  2LL));

        [v4 resetDownloadsMatchingPredicate:v14];
        [v4 addDownloadChangeTypes:128];

        goto LABEL_15;
      }

      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
      free(v12);
      SSFileLog(v7, @"%@");
    }

    goto LABEL_14;
  }

- (void)_sendDownloadKindsUsingNetwork:(id)a3
{
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v5 = self->_managerClients;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)v9);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects", (void)v12));
        [v10 sendDownloadKindsUsingNetwork:v11];

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v7);
  }
}

- (void).cxx_destruct
{
}

@end