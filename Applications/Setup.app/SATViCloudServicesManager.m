@interface SATViCloudServicesManager
+ (id)sharedServicesManager;
- (BOOL)isFetchOperationInFlight;
- (CKRecordZoneID)cloudKitZoneIDForUser;
- (NSError)operationError;
- (NSOperationQueue)ckOperationsQueue;
- (OS_dispatch_source)requestTimeoutTimer;
- (SATViCloudServicesManager)init;
- (id)_ckContainerIdentifier;
- (id)_desiredZoneIDWithName:(id)a3 fromMapping:(id)a4;
- (id)_zoneNameWithiCloudCredentials;
- (id)fetchRequestCompletionHandler;
- (void)_cancelFetchingCloudChangesForiCloudUser;
- (void)_cancelRequestTimeoutTimer;
- (void)_startRequestTimeoutTimer;
- (void)beginFetchingCloudChangesForiCloudUser;
- (void)resetInfo;
- (void)setCkOperationsQueue:(id)a3;
- (void)setCloudKitZoneIDForUser:(id)a3;
- (void)setFetchRequestCompletionHandler:(id)a3;
- (void)setIsFetchOperationInFlight:(BOOL)a3;
- (void)setOperationError:(id)a3;
- (void)setRequestTimeoutTimer:(id)a3;
@end

@implementation SATViCloudServicesManager

+ (id)sharedServicesManager
{
  if (qword_1001099D8 != -1) {
    dispatch_once(&qword_1001099D8, &stru_1000CAD38);
  }
  return (id)qword_1001099D0;
}

- (SATViCloudServicesManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATViCloudServicesManager;
  v2 = -[SATViCloudServicesManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    ckOperationsQueue = v2->_ckOperationsQueue;
    v2->_ckOperationsQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_ckOperationsQueue, "setMaxConcurrentOperationCount:", 1LL);
  }

  return v2;
}

- (void)resetInfo
{
  v3 = (os_log_s *)qword_1001099E0;
  if (os_log_type_enabled((os_log_t)qword_1001099E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Resetting all the query related info...",  v4,  2u);
  }

  -[SATViCloudServicesManager setCloudKitZoneIDForUser:](self, "setCloudKitZoneIDForUser:", 0LL);
  -[SATViCloudServicesManager setOperationError:](self, "setOperationError:", 0LL);
  -[SATViCloudServicesManager setIsFetchOperationInFlight:](self, "setIsFetchOperationInFlight:", 0LL);
  -[SATViCloudServicesManager setFetchRequestCompletionHandler:](self, "setFetchRequestCompletionHandler:", 0LL);
  -[SATViCloudServicesManager _cancelRequestTimeoutTimer](self, "_cancelRequestTimeoutTimer");
}

- (void)beginFetchingCloudChangesForiCloudUser
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CKFetchRecordZonesOperation fetchAllRecordZonesOperation]( &OBJC_CLASS___CKFetchRecordZonesOperation,  "fetchAllRecordZonesOperation"));
  objc_initWeak(&location, self);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_10005AED4;
  v18 = &unk_1000CAD60;
  objc_copyWeak(&v19, &location);
  [v3 setFetchRecordZonesCompletionBlock:&v15];
  v4 = (os_log_s *)qword_1001099E0;
  if (os_log_type_enabled((os_log_t)qword_1001099E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Setting the QOS to be user initiated...",  buf,  2u);
  }

  objc_msgSend(v3, "setQualityOfService:", 25, v15, v16, v17, v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATViCloudServicesManager _ckContainerIdentifier](self, "_ckContainerIdentifier"));
  if ([v5 length])
  {
    -[SATViCloudServicesManager setIsFetchOperationInFlight:](self, "setIsFetchOperationInFlight:", 1LL);
    objc_super v6 = (os_log_s *)qword_1001099E0;
    if (os_log_type_enabled((os_log_t)qword_1001099E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Cloudkit container identifier is %@",  buf,  0xCu);
    }

    id v7 = [[CKContainerID alloc] initWithContainerIdentifier:v5 environment:1];
    v8 = -[CKContainer initWithContainerID:](objc_alloc(&OBJC_CLASS___CKContainer), "initWithContainerID:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](v8, "privateCloudDatabase"));
    [v3 setDatabase:v9];

    -[NSOperationQueue addOperation:](self->_ckOperationsQueue, "addOperation:", v3);
    -[SATViCloudServicesManager _startRequestTimeoutTimer](self, "_startRequestTimeoutTimer");
  }

  else
  {
    v10 = (os_log_s *)qword_1001099E0;
    if (os_log_type_enabled((os_log_t)qword_1001099E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Couldn't find a container identifier for some reason. We bail out...",  buf,  2u);
    }

    v21[0] = NSLocalizedDescriptionKey;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"Operation was unsuccessful." value:&stru_1000CB560 table:0]);
    v22[0] = v12;
    v21[1] = NSLocalizedFailureReasonErrorKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"Couldn't find a cloudkit container identifier" value:&stru_1000CB560 table:0]);
    v22[1] = v14;
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));

    v8 = (CKContainer *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CloudKit Domain",  -1LL,  v7));
    -[SATViCloudServicesManager setOperationError:](self, "setOperationError:", v8);
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (BOOL)isFetchOperationInFlight
{
  return self->_isFetchOperationInFlight;
}

- (id)_zoneNameWithiCloudCredentials
{
  v2 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v2, "activeAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_firstName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_lastName"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@", v4, v5));

  return v6;
}

- (id)_desiredZoneIDWithName:(id)a3 fromMapping:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)qword_1001099E0;
  if (os_log_type_enabled((os_log_t)qword_1001099E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v5;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Looking for desired zone ID. {zoneName=%@, recordZonesByZoneID=%@}",  buf,  0x16u);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys", 0));
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
        unsigned int v14 = [v13 isEqualToString:v5];

        if (v14)
        {
          v15 = (os_log_s *)qword_1001099E0;
          if (os_log_type_enabled((os_log_t)qword_1001099E0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v23 = v5;
            __int16 v24 = 2112;
            id v25 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Found zone. {name=%@, recordZoneID=%@}",  buf,  0x16u);
          }

          id v9 = v12;
          goto LABEL_15;
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

- (void)_startRequestTimeoutTimer
{
  v3 = (os_log_s *)qword_1001099E0;
  if (os_log_type_enabled((os_log_t)qword_1001099E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting request timer", buf, 2u);
  }

  v4 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
  requestTimeoutTimer = self->_requestTimeoutTimer;
  self->_requestTimeoutTimer = v4;

  id v6 = self->_requestTimeoutTimer;
  dispatch_time_t v7 = dispatch_time(0LL, 60000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  v8 = self->_requestTimeoutTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10005B544;
  handler[3] = &unk_1000C9468;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v8, handler);
  dispatch_resume((dispatch_object_t)self->_requestTimeoutTimer);
}

- (void)_cancelRequestTimeoutTimer
{
  if (self->_requestTimeoutTimer)
  {
    v3 = (os_log_s *)qword_1001099E0;
    if (os_log_type_enabled((os_log_t)qword_1001099E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Cancelling our request timeout timer...",  v5,  2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_requestTimeoutTimer);
    requestTimeoutTimer = self->_requestTimeoutTimer;
    self->_requestTimeoutTimer = 0LL;
  }

- (void)_cancelFetchingCloudChangesForiCloudUser
{
  v3 = (os_log_s *)qword_1001099E0;
  if (os_log_type_enabled((os_log_t)qword_1001099E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Cancelling existing running operations if any....",  v4,  2u);
  }

  -[NSOperationQueue cancelAllOperations](self->_ckOperationsQueue, "cancelAllOperations");
  -[SATViCloudServicesManager resetInfo](self, "resetInfo");
}

- (id)_ckContainerIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  @"com.apple.HeadBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleURL]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForInfoDictionaryKey:@"HBCKContainerIdentifier"]);

  return v5;
}

- (void)setIsFetchOperationInFlight:(BOOL)a3
{
  self->_isFetchOperationInFlight = a3;
}

- (CKRecordZoneID)cloudKitZoneIDForUser
{
  return self->_cloudKitZoneIDForUser;
}

- (void)setCloudKitZoneIDForUser:(id)a3
{
}

- (NSError)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(id)a3
{
}

- (id)fetchRequestCompletionHandler
{
  return self->_fetchRequestCompletionHandler;
}

- (void)setFetchRequestCompletionHandler:(id)a3
{
}

- (NSOperationQueue)ckOperationsQueue
{
  return self->_ckOperationsQueue;
}

- (void)setCkOperationsQueue:(id)a3
{
}

- (OS_dispatch_source)requestTimeoutTimer
{
  return self->_requestTimeoutTimer;
}

- (void)setRequestTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end