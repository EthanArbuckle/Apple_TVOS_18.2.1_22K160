@interface DirectUploadController
+ (BOOL)_isConnectionEntitled:(id)a3;
+ (id)_copyPersistentIdentifiersArrayWithXPCArray:(id)a3;
+ (id)_orderedPostQueryWithDatabase:(id)a3 predicate:(id)a4;
+ (id)_orderedUploadQueryWithDatabase:(id)a3 predicate:(id)a4;
+ (id)sharedController;
+ (void)_sendAccessDeniedErrorWithMessage:(id)a3 connection:(id)a4;
+ (void)_setupDatabase:(id)a3;
+ (void)cancelUploadsWithMessage:(id)a3 connection:(id)a4;
+ (void)getUploadsWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)pauseUploadsWithMessage:(id)a3 connection:(id)a4;
+ (void)registerObserverWithMessage:(id)a3 connection:(id)a4;
+ (void)resumeUploadsWithMessage:(id)a3 connection:(id)a4;
- (BOOL)_cancelUploadsWithPredicate:(id)a3 clientIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_pauseUploadsWithPredicate:(id)a3 clientIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_resumeUploadsWithPredicate:(id)a3 clientIdentifier:(id)a4 resetFailureCount:(BOOL)a5 error:(id *)a6;
- (DirectUploadController)init;
- (id)_authenticationCoordinator;
- (id)_database;
- (id)_databaseIfExists;
- (id)_errorCoordinator;
- (id)_newAddUploadsMessageWithDatabase:(id)a3 hydratedUploadIDs:(id)a4;
- (id)_newSSVDirectUploadWithProgress:(id)a3 state:(int64_t)a4;
- (id)_pollingCoordinator;
- (id)_postOperationQueue;
- (id)_sessionController;
- (void)_cleanupPendingUploads:(id)a3 database:(id)a4;
- (void)_cleanupSessionController;
- (void)_clientDisconnectNotification:(id)a3;
- (void)_enqueueNextReadyMediaSocialPostOperationWithDatabase:(id)a3;
- (void)_enumerateSSVDirectUploadsWithQuery:(id)a3 block:(id)a4;
- (void)_finishPostWithPostIdentifier:(int64_t)a3 response:(id)a4;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5;
- (void)_operationDidFinishForPostIdentifier:(int64_t)a3 response:(id)a4;
- (void)_registerObserverWithMessage:(id)a3 connection:(id)a4;
- (void)_retryFailedEntities;
- (void)_sendChangeUploadsMessageWithUploads:(id)a3;
- (void)_sendRemoveUploadsMessageWithUploadIdentifiers:(id)a3;
- (void)addMediaSocialPostWithDescription:(id)a3 client:(id)a4;
- (void)authenticationCoordinator:(id)a3 didFinishAuthenticationWithResponse:(id)a4;
- (void)dealloc;
- (void)mediaSocialErrorCoordinator:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)pollingCoordinator:(id)a3 didPollWithResponses:(id)a4;
- (void)start;
- (void)uploadSessionController:(id)a3 uploadDidBeginTransferWithDatabaseID:(int64_t)a4;
- (void)uploadSessionController:(id)a3 uploadDidFailWithDatabaseID:(int64_t)a4 error:(id)a5;
- (void)uploadSessionController:(id)a3 uploadDidFinishWithDatabaseID:(int64_t)a4 response:(id)a5;
- (void)uploadSessionController:(id)a3 uploadProgressDidChange:(id)a4;
@end

@implementation DirectUploadController

- (DirectUploadController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DirectUploadController;
  v2 = -[DirectUploadController init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.DirectUploadController", 0LL);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:@"XPCClientDisconnectNotification" object:0];
  if (self->_backgroundTaskObserver)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    [v4 removeBackgroundTaskObserver:self->_backgroundTaskObserver];
  }

  -[MediaSocialAuthenticationCoordinator setDelegate:](self->_authenticationCoordinator, "setDelegate:", 0LL);
  -[MediaSocialErrorCoordinator setDelegate:](self->_errorCoordinator, "setDelegate:", 0LL);
  -[MediaSocialStatusPollingCoordinator setDelegate:](self->_pollingCoordinator, "setDelegate:", 0LL);
  -[DirectUploadSessionController setDelegate:](self->_sessionController, "setDelegate:", 0LL);

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DirectUploadController;
  -[DirectUploadController dealloc](&v5, "dealloc");
}

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100047698;
  block[3] = &unk_10034AC90;
  block[4] = a1;
  if (qword_1003A3298 != -1) {
    dispatch_once(&qword_1003A3298, block);
  }
  return (id)qword_1003A3290;
}

- (void)addMediaSocialPostWithDescription:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100047768;
  block[3] = &unk_10034BCE8;
  id v12 = v7;
  v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)start
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004800C;
  v8[3] = &unk_10034BF60;
  objc_copyWeak(&v9, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 addObserverForBackgroundTaskWithIdentifierPrefix:@"com.apple.itunesstored.DirectUploadController.retry" withBlock:v8]);
  id backgroundTaskObserver = self->_backgroundTaskObserver;
  self->_id backgroundTaskObserver = v4;

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100048094;
  block[3] = &unk_10034AC30;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

+ (void)cancelUploadsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _isConnectionEntitled:v7])
  {
    v8 = (void *)SSXPCConnectionCopyClientIdentifier(v7, 0LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedController]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100048364;
    v12[3] = &unk_10034BFB0;
    id v13 = v6;
    id v14 = v9;
    id v15 = v8;
    id v16 = a1;
    id v10 = v8;
    id v11 = v9;
    [v11 _handleMessage:v13 connection:v7 usingReplyBlock:v12];
  }

  else
  {
    [a1 _sendAccessDeniedErrorWithMessage:v6 connection:v7];
  }
}

+ (void)getUploadsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _isConnectionEntitled:v7])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000486AC;
    v9[3] = &unk_10034C028;
    id v10 = (id)objc_claimAutoreleasedReturnValue([a1 sharedController]);
    id v11 = a1;
    id v8 = v10;
    [v8 _handleMessage:v6 connection:v7 usingReplyBlock:v9];
  }

  else
  {
    [a1 _sendAccessDeniedErrorWithMessage:v6 connection:v7];
  }
}

+ (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:a1 selector:"cancelUploadsWithMessage:connection:" forMessage:154];
  [v4 addObserver:a1 selector:"getUploadsWithMessage:connection:" forMessage:155];
  [v4 addObserver:a1 selector:"pauseUploadsWithMessage:connection:" forMessage:156];
  [v4 addObserver:a1 selector:"registerObserverWithMessage:connection:" forMessage:157];
  [v4 addObserver:a1 selector:"resumeUploadsWithMessage:connection:" forMessage:158];
}

+ (void)pauseUploadsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _isConnectionEntitled:v7])
  {
    id v8 = (void *)SSXPCConnectionCopyClientIdentifier(v7, 0LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedController]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100048A00;
    v12[3] = &unk_10034BFB0;
    id v13 = v6;
    id v14 = v9;
    id v15 = v8;
    id v16 = a1;
    id v10 = v8;
    id v11 = v9;
    [v11 _handleMessage:v13 connection:v7 usingReplyBlock:v12];
  }

  else
  {
    [a1 _sendAccessDeniedErrorWithMessage:v6 connection:v7];
  }
}

+ (void)registerObserverWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _isConnectionEntitled:v7])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100048D10;
    v9[3] = &unk_10034BCE8;
    id v10 = (id)objc_claimAutoreleasedReturnValue([a1 sharedController]);
    id v11 = v6;
    id v12 = v7;
    id v8 = v10;
    [v8 _handleMessage:v11 connection:v12 usingBlock:v9];
  }

  else
  {
    [a1 _sendAccessDeniedErrorWithMessage:v6 connection:v7];
  }
}

+ (void)resumeUploadsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 _isConnectionEntitled:v7])
  {
    id v8 = (void *)SSXPCConnectionCopyClientIdentifier(v7, 0LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedController]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100048E30;
    v12[3] = &unk_10034BFB0;
    id v13 = v6;
    id v14 = v9;
    id v15 = v8;
    id v16 = a1;
    id v10 = v8;
    id v11 = v9;
    [v11 _handleMessage:v13 connection:v7 usingReplyBlock:v12];
  }

  else
  {
    [a1 _sendAccessDeniedErrorWithMessage:v6 connection:v7];
  }
}

- (void)uploadSessionController:(id)a3 uploadDidBeginTransferWithDatabaseID:(int64_t)a4
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100049164;
  v11[3] = &unk_10034C050;
  int64_t v13 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[DirectUploadController _database](self, "_database", a3));
  id v12 = v6;
  [v6 performTransactionWithBlock:v11];
  if (-[NSMutableArray count](self->_clients, "count"))
  {
    id v7 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_progressDictionary, "objectForKey:", v7));
    id v9 = -[DirectUploadController _newSSVDirectUploadWithProgress:state:]( self,  "_newSSVDirectUploadWithProgress:state:",  v8,  1LL);
    [v9 setPersistentIdentifier:a4];
    id v10 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v9, 0LL);
    -[DirectUploadController _sendChangeUploadsMessageWithUploads:](self, "_sendChangeUploadsMessageWithUploads:", v10);
  }
}

- (void)uploadSessionController:(id)a3 uploadDidFailWithDatabaseID:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = 0;
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  v33 = sub_100047A40;
  v34 = sub_100047A50;
  id v35 = 0LL;
  int IsEqual = ISErrorIsEqual(v9, SSErrorDomain, 139LL);
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  v21 = sub_100049434;
  v22 = &unk_10034C078;
  int64_t v28 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[DirectUploadController _database](self, "_database"));
  id v23 = v11;
  id v12 = v9;
  id v24 = v12;
  v25 = self;
  char v29 = IsEqual;
  v26 = &v30;
  v27 = &v36;
  [v11 performTransactionWithBlock:&v19];
  if (IsEqual)
  {
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadController _authenticationCoordinator](self, "_authenticationCoordinator"));
    [v13 authenticateForUploadWithIdentifier:a4 accountIdentifier:v31[5]];
  }

  else if (*((_BYTE *)v37 + 24))
  {
    -[DirectUploadController _scheduleDelayedRetry](self, "_scheduleDelayedRetry");
  }

  if (-[NSMutableArray count](self->_clients, "count"))
  {
    id v14 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a4);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_progressDictionary, "objectForKey:", v14));
    id v16 = -[DirectUploadController _newSSVDirectUploadWithProgress:state:]( self,  "_newSSVDirectUploadWithProgress:state:",  v15,  4LL);
    [v16 setError:v12];
    [v16 setPersistentIdentifier:a4];
    v17 = objc_alloc(&OBJC_CLASS___NSArray);
    v18 = -[NSArray initWithObjects:](v17, "initWithObjects:", v16, 0LL, v19, v20, v21, v22, v23);
    -[DirectUploadController _sendChangeUploadsMessageWithUploads:](self, "_sendChangeUploadsMessageWithUploads:", v18);
  }

  -[DirectUploadController _cleanupSessionController](self, "_cleanupSessionController");

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);
}

- (void)uploadSessionController:(id)a3 uploadDidFinishWithDatabaseID:(int64_t)a4 response:(id)a5
{
  id v7 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10004980C;
  v15[3] = &unk_10034C000;
  int64_t v19 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[DirectUploadController _database](self, "_database"));
  id v16 = v8;
  id v9 = v7;
  id v17 = v9;
  v18 = self;
  [v8 performTransactionWithBlock:v15];
  id v10 = [v9 countOfBytesSent];
  id v11 = objc_alloc_init(&OBJC_CLASS___DirectUploadProgress);
  -[DirectUploadProgress setCountOfBytesExpectedToSend:](v11, "setCountOfBytesExpectedToSend:", v10);
  -[DirectUploadProgress setCountOfBytesSent:](v11, "setCountOfBytesSent:", v10);
  -[DirectUploadProgress setUploadDatabaseIdentifier:](v11, "setUploadDatabaseIdentifier:", a4);
  id v12 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a4);
  -[NSMutableDictionary setObject:forKey:](self->_progressDictionary, "setObject:forKey:", v11, v12);
  if (-[NSMutableArray count](self->_clients, "count"))
  {
    id v13 = -[DirectUploadController _newSSVDirectUploadWithProgress:state:]( self,  "_newSSVDirectUploadWithProgress:state:",  v11,  2LL);
    id v14 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v13, 0LL);
    -[DirectUploadController _sendChangeUploadsMessageWithUploads:](self, "_sendChangeUploadsMessageWithUploads:", v14);
  }

  -[DirectUploadController _cleanupSessionController](self, "_cleanupSessionController");
}

- (void)uploadSessionController:(id)a3 uploadProgressDidChange:(id)a4
{
  id v5 = a4;
  if (-[NSMutableArray count](self->_clients, "count")) {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  else {
    id v6 = 0LL;
  }
  if (!self->_progressDictionary)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    progressDictionary = self->_progressDictionary;
    self->_progressDictionary = v7;
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v15 = -[NSNumber initWithLongLong:]( [NSNumber alloc],  "initWithLongLong:",  objc_msgSend(v14, "uploadDatabaseIdentifier", (void)v17));
        -[NSMutableDictionary setObject:forKey:](self->_progressDictionary, "setObject:forKey:", v14, v15);
        if (v6)
        {
          id v16 = -[DirectUploadController _newSSVDirectUploadWithProgress:state:]( self,  "_newSSVDirectUploadWithProgress:state:",  v14,  1LL);
          -[NSMutableArray addObject:](v6, "addObject:", v16);
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }

  -[DirectUploadController _sendChangeUploadsMessageWithUploads:](self, "_sendChangeUploadsMessageWithUploads:", v6);
}

- (void)authenticationCoordinator:(id)a3 didFinishAuthenticationWithResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 authenticateResponse]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 authenticatedAccount]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueIdentifier]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 accountIdentifier]);
  uint64_t v28 = 0LL;
  char v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = 0;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadController _database](self, "_database"));
  __int128 v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  __int128 v20 = sub_100049BC8;
  v21 = &unk_10034C0C8;
  id v13 = v11;
  id v22 = v13;
  id v14 = v12;
  id v23 = v14;
  id v15 = v10;
  id v24 = v15;
  v25 = self;
  id v16 = v8;
  id v26 = v16;
  v27 = &v28;
  [v14 performTransactionWithBlock:&v18];
  if (-[MediaSocialAuthenticationCoordinator isFinished]( self->_authenticationCoordinator,  "isFinished",  v18,  v19,  v20,  v21))
  {
    -[MediaSocialAuthenticationCoordinator setDelegate:](self->_authenticationCoordinator, "setDelegate:", 0LL);
    authenticationCoordinator = self->_authenticationCoordinator;
    self->_authenticationCoordinator = 0LL;
  }

  if (*((_BYTE *)v29 + 24)) {
    -[DirectUploadController _scheduleDelayedRetry](self, "_scheduleDelayedRetry");
  }

  _Block_object_dispose(&v28, 8);
}

- (void)mediaSocialErrorCoordinator:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 postIdentifiers]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uploadIdentifiers]);

  if (a4 == 1)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadController _database](self, "_database"));
    __int128 v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472LL;
    __int128 v20 = sub_10004AA08;
    v21 = &unk_10034C0F0;
    id v10 = (id *)v22;
    v22[0] = v7;
    v22[1] = self;
    id v11 = &v23;
    id v23 = v16;
    uint64_t v12 = &v24;
    id v24 = v8;
    id v13 = v16;
    id v14 = v13;
    id v15 = &v18;
    goto LABEL_5;
  }

  if (!a4)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadController _database](self, "_database"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10004A394;
    v25[3] = &unk_10034C0F0;
    id v10 = (id *)v26;
    v26[0] = v7;
    v26[1] = self;
    id v11 = &v27;
    v27 = v9;
    uint64_t v12 = &v28;
    id v28 = v8;
    id v13 = v9;
    id v14 = v13;
    id v15 = (void ***)v25;
LABEL_5:
    objc_msgSend(v13, "performTransactionWithBlock:", v15, v18, v19, v20, v21);
  }

  -[MediaSocialErrorCoordinator setDelegate:](self->_errorCoordinator, "setDelegate:", 0LL);
  errorCoordinator = self->_errorCoordinator;
  self->_errorCoordinator = 0LL;
}

- (void)pollingCoordinator:(id)a3 didPollWithResponses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadController _database](self, "_database"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10004B034;
  v23[3] = &unk_10034C118;
  id v10 = v7;
  id v24 = v10;
  id v11 = v8;
  v25 = v11;
  id v12 = v9;
  id v26 = v12;
  [v12 performTransactionWithBlock:v23];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v13 = v11;
  id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v19,  v27,  16LL);
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      __int128 v17 = 0LL;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        -[DirectUploadController _finishPostWithPostIdentifier:response:]( self,  "_finishPostWithPostIdentifier:response:",  objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v17), "postIdentifier", (void)v19),  *(void *)(*((void *)&v19 + 1) + 8 * (void)v17));
        __int128 v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v19,  v27,  16LL);
    }

    while (v15);
  }

  if (![v6 numberOfPollRequests])
  {
    -[MediaSocialStatusPollingCoordinator setDelegate:](self->_pollingCoordinator, "setDelegate:", 0LL);
    pollingCoordinator = self->_pollingCoordinator;
    self->_pollingCoordinator = 0LL;
  }
}

- (void)_clientDisconnectNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004B21C;
  v7[3] = &unk_10034AD58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

+ (id)_copyPersistentIdentifiersArrayWithXPCArray:(id)a3
{
  id v3 = a3;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472LL;
  applier[2] = sub_10004B4EC;
  applier[3] = &unk_10034BBD0;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = v4;
  xpc_array_apply(v3, applier);

  return v4;
}

+ (BOOL)_isConnectionEntitled:(id)a3
{
  id v3 = a3;
  else {
    char HasEntitlement = SSXPCConnectionHasEntitlement(v3, kSSITunesStoreEntitlementUploads);
  }

  return HasEntitlement;
}

+ (id)_orderedPostQueryWithDatabase:(id)a3 predicate:(id)a4
{
  id v10 = @"creation_time";
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MediaSocialPostEntity queryWithDatabase:predicate:orderingProperties:]( &OBJC_CLASS___MediaSocialPostEntity,  "queryWithDatabase:predicate:orderingProperties:",  v6,  v5,  v7,  v10));

  return v8;
}

+ (id)_orderedUploadQueryWithDatabase:(id)a3 predicate:(id)a4
{
  id v10 = @"creation_time";
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[DirectUploadEntity queryWithDatabase:predicate:orderingProperties:]( &OBJC_CLASS___DirectUploadEntity,  "queryWithDatabase:predicate:orderingProperties:",  v6,  v5,  v7,  v10));

  return v8;
}

+ (void)_sendAccessDeniedErrorWithMessage:(id)a3 connection:(id)a4
{
  id v6 = (_xpc_connection_s *)a4;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (!reply)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v9) {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      int v15 = 138412290;
      id v16 = (id)objc_opt_class(a1);
      id v13 = v16;
      id v14 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%@: No reply to send XPC access denied message",  &v15,  12);

      if (!v14) {
        goto LABEL_15;
      }
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
      free(v14);
      SSFileLog(v9, @"%@");
    }

    goto LABEL_15;
  }

  uint64_t v8 = SSError(SSErrorDomain, 107LL, 0LL, 0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  SSXPCDictionarySetObject(reply, "1", v9);
  xpc_connection_send_message(v6, reply);
LABEL_15:
}

+ (void)_setupDatabase:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004B9D0;
  v4[3] = &unk_10034AC08;
  id v5 = a3;
  id v3 = v5;
  [v3 performTransactionWithBlock:v4];
}

- (id)_authenticationCoordinator
{
  authenticationCoordinator = self->_authenticationCoordinator;
  if (!authenticationCoordinator)
  {
    id v4 = -[MediaSocialAuthenticationCoordinator initWithDispatchQueue:]( objc_alloc(&OBJC_CLASS___MediaSocialAuthenticationCoordinator),  "initWithDispatchQueue:",  self->_dispatchQueue);
    id v5 = self->_authenticationCoordinator;
    self->_authenticationCoordinator = v4;

    -[MediaSocialAuthenticationCoordinator setDelegate:](self->_authenticationCoordinator, "setDelegate:", self);
    authenticationCoordinator = self->_authenticationCoordinator;
  }

  return authenticationCoordinator;
}

- (BOOL)_cancelUploadsWithPredicate:(id)a3 clientIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10004BC5C;
  v25[3] = &unk_10034C168;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[DirectUploadController _database](self, "_database"));
  id v26 = v10;
  id v11 = v7;
  id v27 = v11;
  id v28 = self;
  id v12 = v8;
  id v29 = v12;
  id v13 = v9;
  uint64_t v30 = v13;
  [v10 performTransactionWithBlock:v25];
  if (-[NSMutableArray count](v13, "count"))
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v14 = v13;
    id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v21,  v31,  16LL);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        __int128 v18 = 0LL;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          -[NSMutableDictionary removeObjectForKey:]( self->_progressDictionary,  "removeObjectForKey:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)v18),  (void)v21);
          __int128 v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v21,  v31,  16LL);
      }

      while (v16);
    }

    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadController _sessionController](self, "_sessionController"));
    [v19 cancelUploadTasksWithDatabaseIdentifiers:v14];

    -[DirectUploadController _sendRemoveUploadsMessageWithUploadIdentifiers:]( self,  "_sendRemoveUploadsMessageWithUploadIdentifiers:",  v14);
  }

  return 1;
}

- (void)_cleanupSessionController
{
  if (!-[DirectUploadSessionController numberOfTasks](self->_sessionController, "numberOfTasks"))
  {
    -[DirectUploadSessionController setDelegate:](self->_sessionController, "setDelegate:", 0LL);
    -[DirectUploadSessionController invalidURLSessions](self->_sessionController, "invalidURLSessions");
    sessionController = self->_sessionController;
    self->_sessionController = 0LL;
  }

- (void)_cleanupPendingUploads:(id)a3 database:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v71 = @"creation_time";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v71, 1LL));
  id v53 = v6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[DirectUploadEntity queryWithDatabase:predicate:orderingProperties:]( &OBJC_CLASS___DirectUploadEntity,  "queryWithDatabase:predicate:orderingProperties:",  v7,  v6,  v10));

  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = sub_10004C664;
  v61[3] = &unk_10034C190;
  id v12 = v7;
  id v62 = v12;
  id v13 = v8;
  v63 = v13;
  v64 = self;
  id v14 = v9;
  v65 = v14;
  [v11 enumeratePersistentIDsUsingBlock:v61];
  id v15 = &ACSLocateCachingServer_ptr;
  if (-[NSMutableArray count](v13, "count"))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v17 = [v16 shouldLog];
    else {
      unsigned int v18 = v17;
    }
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      uint64_t v20 = v18;
    }
    else {
      uint64_t v20 = v18 & 2;
    }
    if ((_DWORD)v20)
    {
      __int128 v21 = v14;
      __int128 v22 = (void *)objc_opt_class(self);
      id obja = v22;
      id v23 = -[NSMutableArray count](v13, "count");
      int v67 = 138412546;
      v68 = v22;
      id v14 = v21;
      id v15 = &ACSLocateCachingServer_ptr;
      __int16 v69 = 2048;
      id v70 = v23;
      __int128 v24 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  1LL,  "%@: %lu pending upload(s) removed.",  &v67,  22);

      if (!v24)
      {
LABEL_14:

        -[DirectUploadController _sendRemoveUploadsMessageWithUploadIdentifiers:]( self,  "_sendRemoveUploadsMessageWithUploadIdentifiers:",  v13);
        goto LABEL_15;
      }

      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
      free(v24);
      v46 = v19;
      SSFileLog(v16, @"%@");
    }

    goto LABEL_14;
  }

- (id)_database
{
  database = self->_database;
  if (!database)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[DirectUploadDatabaseSchema databasePath](&OBJC_CLASS___DirectUploadDatabaseSchema, "databasePath"));
    id v5 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByDeletingLastPathComponent]);
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v5,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v6,  1LL,  0LL,  0LL);

    id v7 = -[NSURL initFileURLWithPath:isDirectory:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:",  v4,  0LL);
    id v8 = -[SSSQLiteDatabase initWithDatabaseURL:readOnly:protectionType:]( objc_alloc(&OBJC_CLASS___SSSQLiteDatabase),  "initWithDatabaseURL:readOnly:protectionType:",  v7,  0LL,  NSFileProtectionCompleteUntilFirstUserAuthentication);
    id v9 = self->_database;
    self->_database = v8;

    -[SSSQLiteDatabase setSetupBlock:](self->_database, "setSetupBlock:", &stru_10034C1B0);
    database = self->_database;
  }

  return database;
}

- (id)_databaseIfExists
{
  database = self->_database;
  if (database)
  {
    id v3 = database;
  }

  else
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[DirectUploadDatabaseSchema databasePath](&OBJC_CLASS___DirectUploadDatabaseSchema, "databasePath"));
    unsigned int v7 = -[NSFileManager fileExistsAtPath:isDirectory:](v5, "fileExistsAtPath:isDirectory:", v6, 0LL);

    id v3 = 0LL;
    if (v7) {
      id v3 = (SSSQLiteDatabase *)objc_claimAutoreleasedReturnValue(-[DirectUploadController _database](self, "_database"));
    }
  }

  return v3;
}

- (void)_enqueueNextReadyMediaSocialPostOperationWithDatabase:(id)a3
{
  id v19 = a3;
  val = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadController _postOperationQueue](self, "_postOperationQueue"));
  if (![v4 operationCount])
  {
    uint64_t v37 = 0LL;
    uint64_t v38 = &v37;
    uint64_t v39 = 0x3032000000LL;
    v40 = sub_100047A40;
    v41 = sub_100047A50;
    id v42 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v5 = [(id)objc_opt_class(self) _orderedPostQueryWithDatabase:v19 predicate:0];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10004CF58;
    v34[3] = &unk_10034C1D8;
    id v35 = v19;
    uint64_t v36 = &v37;
    [v6 enumeratePersistentIDsUsingBlock:v34];
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id obj = (id)v38[5];
    id v7 = [obj countByEnumeratingWithState:&v30 objects:v44 count:16];
    if (v7)
    {
      uint64_t v22 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          id v10 = [v9 persistentID];
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 operations]);
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          id v12 = v11;
          id v13 = -[MediaSocialPostOperation countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v26,  v43,  16LL);
          id v14 = v4;
          id v15 = v6;
          if (v13)
          {
            uint64_t v16 = *(void *)v27;
            while (2)
            {
              for (j = 0LL; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v27 != v16) {
                  objc_enumerationMutation(v12);
                }
                if ([*(id *)(*((void *)&v26 + 1) + 8 * (void)j) postID] == v10)
                {
                  unsigned int v18 = v12;
                  id v6 = v15;
                  id v4 = v14;
                  goto LABEL_17;
                }
              }

              id v13 = -[MediaSocialPostOperation countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v26,  v43,  16LL);
              if (v13) {
                continue;
              }
              break;
            }
          }

          id v6 = v15;
          id v4 = v14;
          unsigned int v18 = -[MediaSocialPostOperation initWithPostEntity:]( objc_alloc(&OBJC_CLASS___MediaSocialPostOperation),  "initWithPostEntity:",  v9);
          objc_initWeak(&location, val);
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472LL;
          v23[2] = sub_10004CFBC;
          v23[3] = &unk_10034C228;
          objc_copyWeak(v24, &location);
          void v23[4] = val;
          v24[1] = v10;
          -[MediaSocialPostOperation setResultBlock:](v18, "setResultBlock:", v23);
          [v14 addOperation:v18];
          objc_destroyWeak(v24);
          objc_destroyWeak(&location);
LABEL_17:
        }

        id v7 = [obj countByEnumeratingWithState:&v30 objects:v44 count:16];
      }

      while (v7);
    }

    _Block_object_dispose(&v37, 8);
  }
}

- (void)_enumerateSSVDirectUploadsWithQuery:(id)a3 block:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10004D0F0;
  v6[3] = &unk_10034C250;
  v6[4] = self;
  id v7 = a4;
  id v5 = v7;
  [a3 enumerateSSVDirectUploadsUsingBlock:v6];
}

- (void)_finishPostWithPostIdentifier:(int64_t)a3 response:(id)a4
{
  id v6 = a4;
  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  uint64_t v38 = sub_100047A40;
  uint64_t v39 = sub_100047A50;
  id v40 = 0LL;
  if ([v6 result] == (id)5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v8) = [v7 shouldLog];
    unsigned int v9 = [v7 shouldLogToDisk];
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    id v11 = v10;
    if (v9) {
      LODWORD(v8) = v8 | 2;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if (!(_DWORD)v8) {
      goto LABEL_22;
    }
    id v12 = (void *)objc_opt_class(self);
    int v42 = 138412546;
    id v43 = v12;
    __int16 v44 = 2048;
    int64_t v45 = a3;
    id v13 = v12;
    id v14 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "%@: Post failed due to polling timeout, removing from database: %lld",  &v42,  22);

    if (!v14) {
      goto LABEL_23;
    }
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v15) = [v7 shouldLog];
    unsigned int v16 = [v7 shouldLogToDisk];
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    id v11 = v17;
    if (v16) {
      LODWORD(v15) = v15 | 2;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      uint64_t v15 = v15;
    }
    else {
      v15 &= 2u;
    }
    if (!(_DWORD)v15) {
      goto LABEL_22;
    }
    unsigned int v18 = (void *)objc_opt_class(self);
    int v42 = 138412546;
    id v43 = v18;
    __int16 v44 = 2048;
    int64_t v45 = a3;
    id v19 = v18;
    id v14 = (void *)_os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "%@: Post succeeded, removing from database: %lld",  &v42,  22);

    if (!v14) {
      goto LABEL_23;
    }
  }

  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
  free(v14);
  v25 = v11;
  SSFileLog(v7, @"%@");
LABEL_22:

LABEL_23:
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10004D634;
  v30[3] = &unk_10034C278;
  int64_t v34 = a3;
  id v20 = (id)objc_claimAutoreleasedReturnValue(-[DirectUploadController _database](self, "_database"));
  __int128 v32 = self;
  __int128 v33 = &v35;
  id v31 = v20;
  [v20 performTransactionWithBlock:v30];
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v21 = (id)v36[5];
  id v22 = [v21 countByEnumeratingWithState:&v26 objects:v41 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v21);
        }
        -[NSMutableDictionary removeObjectForKey:]( self->_progressDictionary,  "removeObjectForKey:",  *(void *)(*((void *)&v26 + 1) + 8LL * (void)i),  v25);
      }

      id v22 = [v21 countByEnumeratingWithState:&v26 objects:v41 count:16];
    }

    while (v22);
  }

  -[DirectUploadController _sendRemoveUploadsMessageWithUploadIdentifiers:]( self,  "_sendRemoveUploadsMessageWithUploadIdentifiers:",  v36[5]);
  _Block_object_dispose(&v35, 8);
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5
{
  id v6 = a5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  [v7 takeKeepAliveAssertion:@"DirectUploadController"];

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004D74C;
  block[3] = &unk_10034ACB8;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingReplyBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  [v11 takeKeepAliveAssertion:@"DirectUploadController"];

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004D88C;
  block[3] = &unk_10034C2A0;
  id v18 = v9;
  id v19 = v10;
  id v17 = v8;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  dispatch_async(dispatchQueue, block);
}

- (id)_errorCoordinator
{
  errorCoordinator = self->_errorCoordinator;
  if (!errorCoordinator)
  {
    id v4 = -[MediaSocialErrorCoordinator initWithDispatchQueue:]( objc_alloc(&OBJC_CLASS___MediaSocialErrorCoordinator),  "initWithDispatchQueue:",  self->_dispatchQueue);
    id v5 = self->_errorCoordinator;
    self->_errorCoordinator = v4;

    -[MediaSocialErrorCoordinator setDelegate:](self->_errorCoordinator, "setDelegate:", self);
    errorCoordinator = self->_errorCoordinator;
  }

  return errorCoordinator;
}

- (id)_newAddUploadsMessageWithDatabase:(id)a3 hydratedUploadIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)SSXPCCreateMessageDictionary(1013LL);
  xpc_object_t v9 = xpc_array_create(0LL, 0LL);
  id v10 = [(id)objc_opt_class(self) _orderedUploadQueryWithDatabase:v6 predicate:0];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  id v24[2] = sub_10004DB60;
  v24[3] = &unk_10034B548;
  id v12 = v9;
  id v25 = v12;
  [v11 enumeratePersistentIDsUsingBlock:v24];

  xpc_dictionary_set_value(v8, "1", v12);
  xpc_object_t v13 = xpc_array_create(0LL, 0LL);
  id v14 = [v7 count];
  uint64_t v15 = SSSQLEntityPropertyPersistentID;
  if (v14 == (id)1)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v7 firstObject]);

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  v15,  v16));
    id v7 = (id)v16;
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SSSQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  SSSQLEntityPropertyPersistentID,  v7));
  }

  id v18 = [(id)objc_opt_class(self) _orderedUploadQueryWithDatabase:v6 predicate:v17];
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  void v22[2] = sub_10004DB70;
  v22[3] = &unk_10034BFD8;
  id v23 = v13;
  id v20 = v13;
  -[DirectUploadController _enumerateSSVDirectUploadsWithQuery:block:]( self,  "_enumerateSSVDirectUploadsWithQuery:block:",  v19,  v22);

  xpc_dictionary_set_value(v8, "2", v20);
  return v8;
}

- (id)_newSSVDirectUploadWithProgress:(id)a3 state:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___SSVDirectUpload);
  objc_msgSend(v6, "setCountOfBytesExpectedToSend:", objc_msgSend(v5, "countOfBytesExpectedToSend"));
  objc_msgSend(v6, "setCountOfBytesSent:", objc_msgSend(v5, "countOfBytesSent"));
  id v7 = [v5 uploadDatabaseIdentifier];

  [v6 setPersistentIdentifier:v7];
  [v6 setState:a4];
  return v6;
}

- (void)_operationDidFinishForPostIdentifier:(int64_t)a3 response:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadController _database](self, "_database"));
  switch((unint64_t)[v6 result])
  {
    case 0uLL:
      uint64_t v18 = 0LL;
      id v19 = &v18;
      uint64_t v20 = 0x2020000000LL;
      LOBYTE(v21) = 0;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      id v24[2] = sub_10004E3A4;
      v24[3] = &unk_10034C2C8;
      int64_t v29 = a3;
      id v8 = v7;
      id v25 = v8;
      __int128 v26 = self;
      id v27 = v6;
      __int128 v28 = &v18;
      [v8 performTransactionWithBlock:v24];
      if (*((_BYTE *)v19 + 24)) {
        -[DirectUploadController _scheduleDelayedRetry](self, "_scheduleDelayedRetry");
      }

      _Block_object_dispose(&v18, 8);
      break;
    case 1uLL:
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_10004E16C;
      v30[3] = &unk_10034C000;
      int64_t v34 = a3;
      id v31 = v7;
      __int128 v32 = self;
      id v33 = v6;
      [v31 performTransactionWithBlock:v30];

      id v9 = v31;
      goto LABEL_11;
    case 2uLL:
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_10004DF34;
      v35[3] = &unk_10034C000;
      int64_t v39 = a3;
      id v36 = v7;
      uint64_t v37 = self;
      id v38 = v6;
      [v36 performTransactionWithBlock:v35];

      id v9 = v36;
      goto LABEL_11;
    case 3uLL:
      uint64_t v18 = 0LL;
      id v19 = &v18;
      uint64_t v20 = 0x3032000000LL;
      id v21 = sub_100047A40;
      id v22 = sub_100047A50;
      id v23 = 0LL;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10004E644;
      v13[3] = &unk_10034C2F0;
      int64_t v17 = a3;
      id v14 = v7;
      id v15 = v6;
      uint64_t v16 = &v18;
      [v14 performTransactionWithBlock:v13];
      id v10 = (void *)objc_claimAutoreleasedReturnValue([(id)v19[5] activityIdentifier]);
      id v11 = [v10 length];

      if (v11)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadController _pollingCoordinator](self, "_pollingCoordinator"));
        [v12 addPollRequest:v19[5]];
      }

      _Block_object_dispose(&v18, 8);
      id v9 = v23;
LABEL_11:

      break;
    default:
      -[DirectUploadController _finishPostWithPostIdentifier:response:]( self,  "_finishPostWithPostIdentifier:response:",  a3,  v6);
      break;
  }
}

- (BOOL)_pauseUploadsWithPredicate:(id)a3 clientIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (-[NSMutableArray count](self->_clients, "count")) {
    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  else {
    id v10 = 0LL;
  }
  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  uint64_t v20 = sub_10004E8BC;
  id v21 = &unk_10034C340;
  id v22 = self;
  id v23 = (id)objc_claimAutoreleasedReturnValue(-[DirectUploadController _database](self, "_database"));
  id v24 = v7;
  id v11 = v9;
  id v25 = v11;
  __int128 v26 = v10;
  id v27 = v8;
  id v12 = v8;
  xpc_object_t v13 = v10;
  id v14 = v7;
  id v15 = v23;
  [v15 performTransactionWithBlock:&v18];
  if (-[NSMutableArray count](v11, "count", v18, v19, v20, v21, v22))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadController _sessionController](self, "_sessionController"));
    [v16 pauseUploadTasksWithDatabaseIdentifiers:v11];
  }

  -[DirectUploadController _sendChangeUploadsMessageWithUploads:](self, "_sendChangeUploadsMessageWithUploads:", v13);

  return 1;
}

- (id)_pollingCoordinator
{
  pollingCoordinator = self->_pollingCoordinator;
  if (!pollingCoordinator)
  {
    id v4 = -[MediaSocialStatusPollingCoordinator initWithDispatchQueue:]( objc_alloc(&OBJC_CLASS___MediaSocialStatusPollingCoordinator),  "initWithDispatchQueue:",  self->_dispatchQueue);
    id v5 = self->_pollingCoordinator;
    self->_pollingCoordinator = v4;

    -[MediaSocialStatusPollingCoordinator setDelegate:](self->_pollingCoordinator, "setDelegate:", self);
    pollingCoordinator = self->_pollingCoordinator;
  }

  return pollingCoordinator;
}

- (id)_postOperationQueue
{
  postOperationQueue = self->_postOperationQueue;
  if (!postOperationQueue)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    id v5 = self->_postOperationQueue;
    self->_postOperationQueue = v4;

    -[ISOperationQueue setMaxConcurrentOperationCount:]( self->_postOperationQueue,  "setMaxConcurrentOperationCount:",  1LL);
    -[ISOperationQueue setName:]( self->_postOperationQueue,  "setName:",  @"com.apple.itunesstored.DirectUploadController.post");
    postOperationQueue = self->_postOperationQueue;
  }

  return postOperationQueue;
}

- (void)_registerObserverWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a4;
  xpc_object_t value = xpc_dictionary_get_value(a3, "2");
  id v8 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue(value);
  id v9 = v8;
  if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_endpoint)
  {
    xpc_connection_t v10 = xpc_connection_create_from_endpoint(v9);
    if (!v10) {
      goto LABEL_33;
    }
    xpc_object_t v13 = -[XPCClient initWithInputConnection:](objc_alloc(&OBJC_CLASS___XPCClient), "initWithInputConnection:", v6);
    -[XPCClient setOutputConnectionWithConnection:](v13, "setOutputConnectionWithConnection:", v10);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v17 = [v16 shouldLog];
    else {
      LODWORD(v18) = v17;
    }
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      uint64_t v18 = v18;
    }
    else {
      v18 &= 2u;
    }
    if ((_DWORD)v18)
    {
      uint64_t v20 = (void *)objc_opt_class(self);
      id v30 = v20;
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[XPCClient clientIdentifier](v13, "clientIdentifier"));
      int v31 = 138412546;
      id v32 = v20;
      __int16 v33 = 2112;
      int64_t v34 = v21;
      id v22 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  1LL,  "%@: Registered observer client: %@",  &v31,  22);

      if (!v22)
      {
LABEL_27:

        if (!-[NSMutableArray count](self->_clients, "count"))
        {
          id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
          [v23 addObserver:self selector:"_clientDisconnectNotification:" name:@"XPCClientDisconnectNotification" object:0];
        }

        clients = self->_clients;
        if (!clients)
        {
          id v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          __int128 v26 = self->_clients;
          self->_clients = v25;

          clients = self->_clients;
        }

        -[NSMutableArray addObject:](clients, "addObject:", v13, v29);
        xpc_object_t v27 = xpc_dictionary_create(0LL, 0LL, 0LL);
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[XPCClient outputConnection](v13, "outputConnection"));
        [v28 sendMessage:v27];

        goto LABEL_32;
      }

      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
      free(v22);
      int64_t v29 = v19;
      SSFileLog(v16, @"%@");
    }

    goto LABEL_27;
  }

  xpc_connection_t v10 = (xpc_connection_t)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v10) {
    xpc_connection_t v10 = (xpc_connection_t)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v11 = -[_xpc_connection_s shouldLog](v10, "shouldLog");
  else {
    LODWORD(v12) = v11;
  }
  xpc_object_t v13 = (XPCClient *)objc_claimAutoreleasedReturnValue(-[_xpc_connection_s OSLogObject](v10, "OSLogObject"));
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v12 = v12;
  }
  else {
    v12 &= 2u;
  }
  if (!(_DWORD)v12) {
    goto LABEL_32;
  }
  int v31 = 138412290;
  id v32 = (id)objc_opt_class(self);
  id v14 = v32;
  id v15 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%@: Invalid register message, no endpoint",  &v31,  12);

  if (v15)
  {
    xpc_object_t v13 = (XPCClient *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
    free(v15);
    SSFileLog(v10, @"%@");
LABEL_32:
  }

- (BOOL)_resumeUploadsWithPredicate:(id)a3 clientIdentifier:(id)a4 resetFailureCount:(BOOL)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  unsigned int v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (-[NSMutableArray count](self->_clients, "count")) {
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  else {
    uint64_t v12 = 0LL;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10004F200;
  v20[3] = &unk_10034C390;
  v20[4] = self;
  id v21 = (id)objc_claimAutoreleasedReturnValue(-[DirectUploadController _database](self, "_database"));
  id v22 = v9;
  BOOL v26 = a5;
  xpc_object_t v13 = v11;
  id v23 = v13;
  id v24 = v12;
  id v25 = v10;
  id v14 = v10;
  id v15 = v12;
  id v16 = v9;
  id v17 = v21;
  [v17 performTransactionWithBlock:v20];
  if (-[NSMutableArray count](v13, "count"))
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadController _sessionController](self, "_sessionController"));
    [v18 addUploadTasksWithRequests:v13];
  }

  -[DirectUploadController _sendChangeUploadsMessageWithUploads:](self, "_sendChangeUploadsMessageWithUploads:", v15);

  return 1;
}

- (void)_retryFailedEntities
{
  errorCoordinator = self->_errorCoordinator;
  self->_errorCoordinator = 0LL;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10004F6B8;
  v5[3] = &unk_10034BF88;
  v5[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[DirectUploadController _databaseIfExists](self, "_databaseIfExists"));
  id v4 = v6;
  [v4 performTransactionWithBlock:v5];
}

- (void)_sendChangeUploadsMessageWithUploads:(id)a3
{
  id v4 = a3;
  if ([v4 count] && -[NSMutableArray count](self->_clients, "count"))
  {
    id v5 = (void *)SSXPCCreateMessageDictionary(1014LL);
    SSXPCDictionarySetObject(v5, "1", v4);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v6 = self->_clients;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v10),  "outputConnection",  (void)v12));
          [v11 sendMessage:v5];

          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v8);
    }
  }
}

- (void)_sendRemoveUploadsMessageWithUploadIdentifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count] && -[NSMutableArray count](self->_clients, "count"))
  {
    id v5 = (void *)SSXPCCreateMessageDictionary(1015LL);
    SSXPCDictionarySetObject(v5, "1", v4);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v6 = self->_clients;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v10),  "outputConnection",  (void)v12));
          [v11 sendMessage:v5];

          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v8);
    }
  }
}

- (id)_sessionController
{
  sessionController = self->_sessionController;
  if (!sessionController)
  {
    id v4 = -[DirectUploadSessionController initWithDispatchQueue:]( objc_alloc(&OBJC_CLASS___DirectUploadSessionController),  "initWithDispatchQueue:",  self->_dispatchQueue);
    id v5 = self->_sessionController;
    self->_sessionController = v4;

    -[DirectUploadSessionController setDelegate:](self->_sessionController, "setDelegate:", self);
    sessionController = self->_sessionController;
  }

  return sessionController;
}

- (void).cxx_destruct
{
}

@end