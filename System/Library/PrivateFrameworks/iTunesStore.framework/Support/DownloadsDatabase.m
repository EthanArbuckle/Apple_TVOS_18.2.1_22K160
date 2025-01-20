@interface DownloadsDatabase
+ (id)downloadsDatabase;
+ (void)_setupDatabase:(id)a3;
- (DownloadsDatabase)init;
- (id)_modifyUsingTransaction:(id)a3 block:(id)a4;
- (id)_newSessionDescription;
- (id)modifyExternalUsingTransactionBlock:(id)a3;
- (id)modifyUsingPurchaseTransactionBlock:(id)a3;
- (id)modifyUsingTransactionBlock:(id)a3;
- (id)newDispatchSourceWithType:(dispatch_source_type_s *)a3;
- (void)_commitExternalChangesForChangeset:(id)a3;
- (void)dealloc;
- (void)dispatchAfter:(unint64_t)a3 block:(id)a4;
- (void)dispatchBlockAsync:(id)a3;
- (void)dispatchBlockSync:(id)a3;
- (void)downloadHandlerManager:(id)a3 sessionsDidChange:(id)a4;
- (void)modifyAsyncUsingPurchaseTransactionBlock:(id)a3;
- (void)modifyAsyncUsingTransactionBlock:(id)a3;
- (void)modifyExternalAsyncUsingTransactionBlock:(id)a3;
- (void)readUsingTransactionBlock:(id)a3;
@end

@implementation DownloadsDatabase

+ (void)_setupDatabase:(id)a3
{
  id v3 = a3;
  [v3 executeSQL:@"PRAGMA journal_mode=WAL;"];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100002E20;
  v5[3] = &unk_10034AC08;
  id v6 = v3;
  id v4 = v3;
  [v4 performTransactionWithBlock:v5];
}

- (DownloadsDatabase)init
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadDatabaseSchema databasePath](&OBJC_CLASS___DownloadDatabaseSchema, "databasePath"));
  id v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000030D0;
    block[3] = &unk_10034AC30;
    id v29 = v3;
    if (qword_1003A3190 != -1) {
      dispatch_once(&qword_1003A3190, block);
    }
  }

  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___DownloadsDatabase;
  id v5 = -[DownloadsDatabase init](&v27, "init");
  if (v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS___SSSQLiteDatabase);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v4));
    v8 = -[SSSQLiteDatabase initWithDatabaseURL:readOnly:protectionType:]( v6,  "initWithDatabaseURL:readOnly:protectionType:",  v7,  0LL,  NSFileProtectionCompleteUntilFirstUserAuthentication);
    v9 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v8;

    [*((id *)v5 + 1) setSetupBlock:&stru_10034AC70];
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v11 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___ExternalDownloadState);
    v13 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v12;

    v14 = -[DownloadPipeline initWithDownloadsDatabase:]( objc_alloc(&OBJC_CLASS___DownloadPipeline),  "initWithDownloadsDatabase:",  v5);
    v15 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v14;

    v16 = -[DownloadPolicyManager initWithDownloadsDatabase:]( objc_alloc(&OBJC_CLASS___DownloadPolicyManager),  "initWithDownloadsDatabase:",  v5);
    v17 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadHandlerManager handlerManager](&OBJC_CLASS___DownloadHandlerManager, "handlerManager"));
    [v18 addHandlerObserver:v5];

    if (*((void *)v5 + 1))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[SSWeakReference weakReferenceWithObject:]( &OBJC_CLASS___SSWeakReference,  "weakReferenceWithObject:",  v5));
      id v20 = [*((id *)v5 + 1) newDispatchSourceWithType:&_dispatch_source_type_timer];
      v21 = (void *)*((void *)v5 + 7);
      *((void *)v5 + 7) = v20;

      dispatch_source_set_timer(*((dispatch_source_t *)v5 + 7), 0LL, 0x2540BE400uLL, 0LL);
      v22 = (dispatch_source_s *)*((void *)v5 + 7);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100003144;
      v25[3] = &unk_10034AC30;
      id v26 = v19;
      id v23 = v19;
      dispatch_source_set_event_handler(v22, v25);
      dispatch_resume(*((dispatch_object_t *)v5 + 7));
    }
  }

  return (DownloadsDatabase *)v5;
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadHandlerManager handlerManager](&OBJC_CLASS___DownloadHandlerManager, "handlerManager"));
  [v3 removeHandlerObserver:self];

  progressTickTimer = self->_progressTickTimer;
  if (progressTickTimer) {
    dispatch_source_cancel((dispatch_source_t)progressTickTimer);
  }
  dirtyProgressTimer = self->_dirtyProgressTimer;
  if (dirtyProgressTimer) {
    dispatch_source_cancel((dispatch_source_t)dirtyProgressTimer);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DownloadsDatabase;
  -[DownloadsDatabase dealloc](&v6, "dealloc");
}

+ (id)downloadsDatabase
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003260;
  block[3] = &unk_10034AC90;
  void block[4] = a1;
  if (qword_1003A31A0 != -1) {
    dispatch_once(&qword_1003A31A0, block);
  }
  return (id)qword_1003A3198;
}

- (void)dispatchAfter:(unint64_t)a3 block:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  [v7 takeKeepAliveAssertion:@"com.apple.itunesstored.DownloadsDatabase"];

  database = self->_database;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000333C;
  v10[3] = &unk_10034ACB8;
  id v11 = v6;
  id v9 = v6;
  -[SSSQLiteDatabase dispatchAfter:block:](database, "dispatchAfter:block:", a3, v10);
}

- (void)dispatchBlockAsync:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  [v5 takeKeepAliveAssertion:@"com.apple.itunesstored.DownloadsDatabase"];

  database = self->_database;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100003430;
  v8[3] = &unk_10034ACB8;
  id v9 = v4;
  id v7 = v4;
  -[SSSQLiteDatabase dispatchBlockAsync:](database, "dispatchBlockAsync:", v8);
}

- (void)dispatchBlockSync:(id)a3
{
}

- (void)modifyAsyncUsingPurchaseTransactionBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000034F8;
  v4[3] = &unk_10034ACE0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[DownloadsDatabase dispatchBlockAsync:](v5, "dispatchBlockAsync:", v4);
}

- (void)modifyAsyncUsingTransactionBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100003594;
  v4[3] = &unk_10034ACE0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[DownloadsDatabase dispatchBlockAsync:](v5, "dispatchBlockAsync:", v4);
}

- (void)modifyExternalAsyncUsingTransactionBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100003630;
  v4[3] = &unk_10034ACE0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[DownloadsDatabase dispatchBlockAsync:](v5, "dispatchBlockAsync:", v4);
}

- (id)modifyExternalUsingTransactionBlock:(id)a3
{
  id v4 = a3;
  id v5 = -[DownloadsDatabase _newSessionDescription](self, "_newSessionDescription");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  [v6 takeKeepAliveAssertion:@"com.apple.itunesstored.DownloadsDatabase"];

  id v7 = -[DownloadsExternalTransaction initWithSessionDescriptor:]( objc_alloc(&OBJC_CLASS___DownloadsExternalTransaction),  "initWithSessionDescriptor:",  v5);
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  database = self->_database;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000037D4;
  v14[3] = &unk_10034AD08;
  v17 = &v18;
  id v9 = v4;
  id v16 = v9;
  v10 = v7;
  v15 = v10;
  -[SSSQLiteDatabase dispatchBlockSync:](database, "dispatchBlockSync:", v14);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  [v11 releaseKeepAliveAssertion:@"com.apple.itunesstored.DownloadsDatabase"];

  if (*((_BYTE *)v19 + 24)) {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadsExternalTransaction changeset](v10, "changeset"));
  }
  else {
    v12 = 0LL;
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (id)modifyUsingPurchaseTransactionBlock:(id)a3
{
  id v4 = a3;
  id v5 = -[DownloadsDatabase _newSessionDescription](self, "_newSessionDescription");
  id v6 = -[DownloadsExternalTransaction initWithSessionDescriptor:]( objc_alloc(&OBJC_CLASS___PurchaseDownloadsTransaction),  "initWithSessionDescriptor:",  v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadsDatabase _modifyUsingTransaction:block:](self, "_modifyUsingTransaction:block:", v6, v4));

  return v7;
}

- (id)modifyUsingTransactionBlock:(id)a3
{
  id v4 = a3;
  id v5 = -[DownloadsDatabase _newSessionDescription](self, "_newSessionDescription");
  id v6 = -[DownloadsExternalTransaction initWithSessionDescriptor:]( objc_alloc(&OBJC_CLASS___DownloadsTransaction),  "initWithSessionDescriptor:",  v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadsDatabase _modifyUsingTransaction:block:](self, "_modifyUsingTransaction:block:", v6, v4));

  return v7;
}

- (id)newDispatchSourceWithType:(dispatch_source_type_s *)a3
{
  return -[SSSQLiteDatabase newDispatchSourceWithType:](self->_database, "newDispatchSourceWithType:", a3);
}

- (void)readUsingTransactionBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  [v5 takeKeepAliveAssertion:@"com.apple.itunesstored.DownloadsDatabase"];

  database = self->_database;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  id v11 = sub_1000039D8;
  v12 = &unk_10034AD30;
  v13 = self;
  id v14 = v4;
  id v7 = v4;
  -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon", v9, v10, v11, v12, v13));
  [v8 releaseKeepAliveAssertion:@"com.apple.itunesstored.DownloadsDatabase"];
}

- (void)downloadHandlerManager:(id)a3 sessionsDidChange:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100003AB4;
  v5[3] = &unk_10034AD58;
  id v6 = self;
  id v7 = a4;
  id v4 = v7;
  -[DownloadsDatabase dispatchBlockAsync:](v6, "dispatchBlockAsync:", v5);
}

- (void)_commitExternalChangesForChangeset:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 canceledAppDataRestoreIDs]);
  if ([v4 count])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472LL;
    v68[2] = sub_1000040B4;
    v68[3] = &unk_10034AC30;
    id v69 = v4;
    [v5 keepAliveWithAssertion:@"com.apple.itunesstored.DownloadsDatabase" block:v68];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationWorkspaceChanges]);
  if ([v6 count])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ApplicationWorkspace defaultWorkspace](&OBJC_CLASS___ApplicationWorkspace, "defaultWorkspace"));
    [v7 applyWorkspaceChanges:v6];
  }

  v54 = v6;
  v55 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 deletedHTTPCookies]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 HTTPCookies]);
  if ([v8 count] || objc_msgSend(v9, "count"))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSHTTPCookieStorage sharedHTTPCookieStorage]( &OBJC_CLASS___NSHTTPCookieStorage,  "sharedHTTPCookieStorage"));
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v64 objects:v72 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v65;
      do
      {
        v15 = 0LL;
        do
        {
          if (*(void *)v65 != v14) {
            objc_enumerationMutation(v11);
          }
          [v10 deleteCookie:*(void *)(*((void *)&v64 + 1) + 8 * (void)v15)];
          v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v64 objects:v72 count:16];
      }

      while (v13);
    }

    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    id v16 = v9;
    id v17 = [v16 countByEnumeratingWithState:&v60 objects:v71 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v61;
      do
      {
        uint64_t v20 = 0LL;
        do
        {
          if (*(void *)v61 != v19) {
            objc_enumerationMutation(v16);
          }
          [v10 setCookie:*(void *)(*((void *)&v60 + 1) + 8 * (void)v20)];
          uint64_t v20 = (char *)v20 + 1;
        }

        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v60 objects:v71 count:16];
      }

      while (v18);
    }

    [v10 _saveCookies];
  }

  char v21 = (void *)objc_claimAutoreleasedReturnValue([v3 IPodLibraryItems]);
  if ([v21 count])
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[IPodLibrary deviceIPodLibrary](&OBJC_CLASS___IPodLibrary, "deviceIPodLibrary"));
    [v22 scheduleLibraryItems:v21];
  }

  v53 = v8;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deletedIPodLibraryDownloadIDs", v9));
  if ([v23 count])
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[IPodLibrary deviceIPodLibrary](&OBJC_CLASS___IPodLibrary, "deviceIPodLibrary"));
    [v24 removeDownloadsWithIdentifiers:v23 canceled:0];
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v3 canceledIPodLibraryDownloadIDs]);
  if ([v25 count])
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[IPodLibrary deviceIPodLibrary](&OBJC_CLASS___IPodLibrary, "deviceIPodLibrary"));
    [v26 removeDownloadsWithIdentifiers:v25 canceled:1];

    objc_super v27 = (void *)objc_claimAutoreleasedReturnValue(+[PurchaseController sharedController](&OBJC_CLASS___PurchaseController, "sharedController"));
    [v27 cancelPurchasesForDownloadsWithIdentifiers:v25];
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue([v3 SSAppWakeRequests]);
  if ([v28 count])
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[SpringBoardUtility sharedInstance](&OBJC_CLASS___SpringBoardUtility, "sharedInstance"));
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    id v30 = v28;
    id v31 = [v30 countByEnumeratingWithState:&v56 objects:v70 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v57;
      do
      {
        v34 = 0LL;
        do
        {
          if (*(void *)v57 != v33) {
            objc_enumerationMutation(v30);
          }
          [v29 wakeAppUsingRequest:*(void *)(*((void *)&v56 + 1) + 8 * (void)v34)];
          v34 = (char *)v34 + 1;
        }

        while (v32 != v34);
        id v32 = [v30 countByEnumeratingWithState:&v56 objects:v70 count:16];
      }

      while (v32);
    }
  }

  unsigned __int8 v35 = [v3 downloadChangeTypes];
  unsigned __int8 v36 = v35;
  if ((v35 & 0x40) != 0)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[SpringBoardUtility sharedInstance](&OBJC_CLASS___SpringBoardUtility, "sharedInstance"));
    [v42 resetEnabledRemoteNotificationTypes];

    if ((v36 & 4) == 0)
    {
LABEL_39:
      if ((v36 & 0x80) == 0) {
        goto LABEL_40;
      }
LABEL_47:
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 restoreReason]);
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue( +[StoreDownloadQueue sharedDownloadQueue]( &OBJC_CLASS___StoreDownloadQueue,  "sharedDownloadQueue"));
      v38 = v45;
      if (v37) {
        v46 = v37;
      }
      else {
        v46 = @"other";
      }
      -[__CFString restoreAllRestorableDownloadsWithReason:](v45, "restoreAllRestorableDownloadsWithReason:", v46);
      goto LABEL_51;
    }
  }

  else if ((v35 & 4) == 0)
  {
    goto LABEL_39;
  }

  v43 = objc_alloc_init(&OBJC_CLASS___FinishDownloadsOperation);
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
  [v44 addOperation:v43];

  if ((v36 & 0x80) != 0) {
    goto LABEL_47;
  }
LABEL_40:
  if ((v36 & 0x20) != 0)
  {
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 restorableDownloadIDs]);
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 restoreReason]);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[StoreDownloadQueue sharedDownloadQueue](&OBJC_CLASS___StoreDownloadQueue, "sharedDownloadQueue"));
    v40 = v39;
    if (v38) {
      v41 = v38;
    }
    else {
      v41 = @"other";
    }
    [v39 restoreDownloadsWithIdentifiers:v37 reason:v41];

LABEL_51:
  }

  if ((v36 & 8) != 0)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue([v3 changedDownloadKinds]);
    unsigned int v48 = [v47 containsObject:SSDownloadKindInAppContent];

    if (v48)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[MicroPaymentQueue paymentQueue](&OBJC_CLASS___MicroPaymentQueue, "paymentQueue"));
      v50 = (void *)objc_claimAutoreleasedReturnValue([v3 removedPersistentDownloadIDs]);
      [v49 finishDownloadsWithIdentifiers:v50];
    }
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadController controller](&OBJC_CLASS___DownloadController, "controller"));
  [v51 notifyClientsOfChangeset:v3];
}

- (id)_modifyUsingTransaction:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  [v8 takeKeepAliveAssertion:@"com.apple.itunesstored.DownloadsDatabase"];

  database = self->_database;
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_10000423C;
  id v18 = &unk_10034AD80;
  v22 = &v23;
  id v10 = v7;
  id v21 = v10;
  id v11 = v6;
  id v19 = v11;
  uint64_t v20 = self;
  -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", &v15);
  if (*((_BYTE *)v24 + 24))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "changeset", v15, v16, v17, v18));
    -[DownloadsDatabase _commitExternalChangesForChangeset:](self, "_commitExternalChangesForChangeset:", v12);
  }

  else
  {
    id v12 = 0LL;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon", v15, v16, v17, v18));
  [v13 releaseKeepAliveAssertion:@"com.apple.itunesstored.DownloadsDatabase"];

  _Block_object_dispose(&v23, 8);
  return v12;
}

- (id)_newSessionDescription
{
  id v3 = objc_alloc_init(&OBJC_CLASS___DownloadsSessionDescriptor);
  -[DownloadsSessionDescriptor setDatabase:](v3, "setDatabase:", self->_database);
  -[DownloadsSessionDescriptor setExternalState:](v3, "setExternalState:", self->_externalState);
  -[DownloadsSessionDescriptor setPipeline:](v3, "setPipeline:", self->_pipeline);
  -[DownloadsSessionDescriptor setPolicyManager:](v3, "setPolicyManager:", self->_policyManager);
  return v3;
}

- (void).cxx_destruct
{
}

@end