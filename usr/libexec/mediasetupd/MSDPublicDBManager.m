@interface MSDPublicDBManager
+ (id)_getMatchingObjectForBundleID:(id)a3 bundleID:(id)a4;
+ (id)_getMatchingObjectForServiceID:(id)a3 serviceID:(id)a4;
+ (id)_getMatchingObjectForServiceName:(id)a3 serviceName:(id)a4;
+ (id)getCachedPublicInfo;
+ (id)getCachedPublicInfoForBundleID:(id)a3;
+ (id)getCachedPublicInfoForServiceID:(id)a3;
+ (id)getCachedPublicInfoForServiceName:(id)a3;
+ (id)shared;
+ (void)_fetchData:(id)a3;
+ (void)getPublicInfoForBundleID:(id)a3 completion:(id)a4;
+ (void)getPublicInfoForServiceID:(id)a3 completion:(id)a4;
+ (void)getPublicInfoForServiceName:(id)a3 completion:(id)a4;
- (BOOL)isCurrentlySyncing;
- (BOOL)shouldUseCloudKit;
- (MSDPublicDBManager)init;
- (NSMutableArray)queuedPendingRequests;
- (id)_fetchPreviousChangeToken:(id)a3;
- (id)_handleChangedRecords:(id)a3 localCachedCopy:(id)a4 error:(id *)a5;
- (id)_handleDeletedRecordIDS:(id)a3 localCachedCopy:(id)a4;
- (id)_handleRecordsChanged:(id)a3 deletedRecordIDS:(id)a4 error:(id *)a5;
- (id)createPublicDBInfoObject:(id)a3;
- (id)createPublicDBInfoObjectFromDictionary:(id)a3;
- (unint64_t)retryCount;
- (void)_clearAllDefaultsData;
- (void)_syncDataWithCloudKitWithCompletion:(id)a3;
- (void)_updateDefaultsWithChangeToken:(id)a3 serverChangeToken:(id)a4;
- (void)_updateLastRefreshTS;
- (void)_withLock:(id)a3;
- (void)executePendingRequests:(id)a3 forPublicDBInfo:(id)a4 error:(id)a5;
- (void)setIsCurrentlySyncing:(BOOL)a3;
- (void)setQueuedPendingRequests:(id)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)syncDataWithCloudKit:(id)a3;
@end

@implementation MSDPublicDBManager

+ (id)shared
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100032D20;
  block[3] = &unk_100060A90;
  block[4] = a1;
  if (qword_100070828 != -1) {
    dispatch_once(&qword_100070828, block);
  }
  return (id)qword_100070820;
}

- (MSDPublicDBManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MSDPublicDBManager;
  v2 = -[MSDPublicDBManager init](&v13, "init");
  if (v2)
  {
    id v3 = sub_10003E9DC();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[MSDPublicDBManager init]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    v2->_retryCount = 0LL;
    v2->_isCurrentlySyncing = 0;
    uint64_t v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray, v5);
    queuedPendingRequests = v2->_queuedPendingRequests;
    v2->_queuedPendingRequests = (NSMutableArray *)v6;

    v2->_syncLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mediasetup.publicdb-notify-queue", v9);
    notifyQueue = v2->_notifyQueue;
    v2->_notifyQueue = (OS_dispatch_queue *)v10;
  }

  return v2;
}

- (void)syncDataWithCloudKit:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100032EE8;
  v5[3] = &unk_100061AF0;
  id v6 = a3;
  id v4 = v6;
  -[MSDPublicDBManager _syncDataWithCloudKitWithCompletion:](self, "_syncDataWithCloudKitWithCompletion:", v5);
}

+ (void)getPublicInfoForServiceName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100032F9C;
  v9[3] = &unk_100062640;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v6;
  id v8 = v11;
  [a1 _fetchData:v9];
}

+ (void)getPublicInfoForServiceID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000330EC;
  v9[3] = &unk_100062640;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v6;
  id v8 = v11;
  [a1 _fetchData:v9];
}

+ (void)getPublicInfoForBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10003323C;
  v9[3] = &unk_100062640;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v6;
  id v8 = v11;
  [a1 _fetchData:v9];
}

+ (id)getCachedPublicInfoForServiceName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForDefaultWithCustomClass:@"publicDBData"]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _getMatchingObjectForServiceName:v6 serviceName:v4]);
  return v7;
}

+ (id)getCachedPublicInfoForServiceID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForDefaultWithCustomClass:@"publicDBData"]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _getMatchingObjectForServiceID:v6 serviceID:v4]);
  return v7;
}

+ (id)getCachedPublicInfoForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForDefaultWithCustomClass:@"publicDBData"]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _getMatchingObjectForBundleID:v6 bundleID:v4]);
  return v7;
}

+ (id)getCachedPublicInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForDefaultWithCustomClass:@"publicDBData"]);

  return v3;
}

- (id)createPublicDBInfoObject:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:MediaServiceName]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:MediaServiceIdentifier]);
  id v6 = -[MSPublicDBInfo initWithServiceName:serviceID:]( objc_alloc(&OBJC_CLASS___MSPublicDBInfo),  "initWithServiceName:serviceID:",  v4,  v5);
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 recordID]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 recordName]);
    -[MSPublicDBInfo setRecordName:](v6, "setRecordName:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:MediaServiceType]);
    -[MSPublicDBInfo setServiceType:](v6, "setServiceType:", v9);

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:MediaServiceBundleIdentifier]);
    -[MSPublicDBInfo setBundleIDS:](v6, "setBundleIDS:", v10);

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:MediaServiceIconPath]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v11));
    -[MSPublicDBInfo setServiceIconPath:](v6, "setServiceIconPath:", v12);

    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:MediaServiceConfigurationPublicKey]);
    -[MSPublicDBInfo setConfigurationPublicKey:](v6, "setConfigurationPublicKey:", v13);

    v14 = v6;
  }

  else
  {
    id v15 = sub_10003E9DC();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100035D80();
    }
  }

  return v6;
}

- (id)createPublicDBInfoObjectFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:MediaServiceName]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:MediaServiceIdentifier]);
  id v6 = -[MSPublicDBInfo initWithServiceName:serviceID:]( objc_alloc(&OBJC_CLASS___MSPublicDBInfo),  "initWithServiceName:serviceID:",  v4,  v5);
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:MediaServiceType]);
    -[MSPublicDBInfo setServiceType:](v6, "setServiceType:", v7);

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:MediaServiceBundleIdentifier]);
    -[MSPublicDBInfo setBundleIDS:](v6, "setBundleIDS:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:MediaServiceIconPath]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));
    -[MSPublicDBInfo setServiceIconPath:](v6, "setServiceIconPath:", v10);

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:MediaServiceConfigurationPublicKey]);
    -[MSPublicDBInfo setConfigurationPublicKey:](v6, "setConfigurationPublicKey:", v11);

    id v12 = v6;
  }

  else
  {
    id v13 = sub_10003E9DC();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      v17 = v4;
      __int16 v18 = 2112;
      v19 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Failed to create MSPublicDBInfo object with serviceName %@ service ID: %@",  (uint8_t *)&v16,  0x16u);
    }
  }

  return v6;
}

- (void)_syncDataWithCloudKitWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003E9DC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[MSDPublicDBManager _syncDataWithCloudKitWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v57 = 0LL;
  v58 = &v57;
  uint64_t v59 = 0x2020000000LL;
  char v60 = 0;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_100033F7C;
  v54[3] = &unk_100061938;
  v54[4] = self;
  v56 = &v57;
  id v7 = v4;
  id v55 = v7;
  -[MSDPublicDBManager _withLock:](self, "_withLock:", v54);
  if (v7 && !*((_BYTE *)v58 + 24))
  {
    id v8 = sub_10003E9DC();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "A sync with the public db is already underway. Suspending request to sync with CloudKit until sync is complete.",  (uint8_t *)&buf,  2u);
    }

    goto LABEL_25;
  }

  id v10 = sub_10003E9DC();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Starting sync with public db",  (uint8_t *)&buf,  2u);
  }

  id v12 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
  id v13 = -[CKRecordZoneID initWithZoneName:ownerName:]( v12,  "initWithZoneName:ownerName:",  MSPublicInfoRecordZoneName,  CKCurrentUserDefaultName);
  v9 = v13;
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s zoneName](v13, "zoneName"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPublicDBManager _fetchPreviousChangeToken:](self, "_fetchPreviousChangeToken:", v14));

    v17 = (void *)objc_opt_new(&OBJC_CLASS___CKFetchRecordZoneChangesConfiguration, v16);
    [v17 setPreviousServerChangeToken:v15];
    v38 = v17;
    if (v17)
    {
      v67 = v9;
      v68 = v17;
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v68,  &v67,  1LL,  v17));
      id v19 = sub_10003E9DC();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138477827;
        *(void *)((char *)&buf + 4) = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[Public] Passing Configuration for recordZoneID %{private}@",  (uint8_t *)&buf,  0xCu);
      }

      v21 = objc_alloc(&OBJC_CLASS___CKFetchRecordZoneChangesOperation);
      v66 = v9;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v66, 1LL));
      v23 = -[CKFetchRecordZoneChangesOperation initWithRecordZoneIDs:configurationsByRecordZoneID:]( v21,  "initWithRecordZoneIDs:configurationsByRecordZoneID:",  v22,  v18);

      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v62 = 0x3032000000LL;
      v63 = sub_100034004;
      v64 = sub_100034014;
      id v65 = 0LL;
      v52[0] = 0LL;
      v52[1] = v52;
      v52[2] = 0x3032000000LL;
      v52[3] = sub_100034004;
      v52[4] = sub_100034014;
      id v53 = (id)objc_opt_new(&OBJC_CLASS___NSMutableArray, v24);
      v50[0] = 0LL;
      v50[1] = v50;
      v50[2] = 0x3032000000LL;
      v50[3] = sub_100034004;
      v50[4] = sub_100034014;
      id v51 = (id)objc_opt_new(&OBJC_CLASS___NSMutableArray, v25);
      v48[0] = 0LL;
      v48[1] = v48;
      v48[2] = 0x3032000000LL;
      v48[3] = sub_100034004;
      v48[4] = sub_100034014;
      id v49 = (id)objc_opt_new(&OBJC_CLASS___NSMutableArray, v26);
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_10003401C;
      v47[3] = &unk_100062668;
      v47[4] = v50;
      -[CKFetchRecordZoneChangesOperation setRecordWithIDWasDeletedBlock:](v23, "setRecordWithIDWasDeletedBlock:", v47);
      v27 = (void *)v18;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472LL;
      v46[2] = sub_1000340E4;
      v46[3] = &unk_100062690;
      v46[4] = v52;
      -[CKFetchRecordZoneChangesOperation setRecordWasChangedBlock:](v23, "setRecordWasChangedBlock:", v46);
      objc_initWeak(&location, self);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_10003420C;
      v40[3] = &unk_100062720;
      objc_copyWeak(&v44, &location);
      v40[4] = self;
      v42 = v48;
      p___int128 buf = &buf;
      id v41 = v7;
      -[CKFetchRecordZoneChangesOperation setFetchRecordZoneChangesCompletionBlock:]( v23,  "setFetchRecordZoneChangesCompletionBlock:",  v40);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_100034874;
      v39[3] = &unk_100062748;
      v39[6] = v52;
      v39[7] = v50;
      v39[4] = self;
      v39[5] = &buf;
      -[CKFetchRecordZoneChangesOperation setRecordZoneFetchCompletionBlock:]( v23,  "setRecordZoneFetchCompletionBlock:",  v39);
      -[CKFetchRecordZoneChangesOperation setQualityOfService:](v23, "setQualityOfService:", 17LL);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDPublicCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDPublicCloudKitContainer"));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 publicCloudDatabase]);
      [v29 addOperation:v23];

      objc_destroyWeak(&v44);
      objc_destroyWeak(&location);
      _Block_object_dispose(v48, 8);

      _Block_object_dispose(v50, 8);
      _Block_object_dispose(v52, 8);

      _Block_object_dispose(&buf, 8);
    }

    else
    {
      id v34 = sub_10003E9DC();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_100035E24(v35, v36, v37);
      }

      if (!v7) {
        goto LABEL_23;
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CKErrorDomain,  12LL,  0LL,  0LL));
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v27);
    }

LABEL_23:
    goto LABEL_24;
  }

  id v30 = sub_10003E9DC();
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_100035DEC(v31, v32, v33);
  }

  if (v7)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CKErrorDomain,  12LL,  0LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v15);
LABEL_24:
  }

- (id)_handleRecordsChanged:(id)a3 deletedRecordIDS:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForDefaultWithCustomClass:@"publicDBData"]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[MSDPublicDBManager _handleDeletedRecordIDS:localCachedCopy:]( self,  "_handleDeletedRecordIDS:localCachedCopy:",  v9,  v11));
  if (!v12 || ![v12 count])
  {
    uint64_t v14 = objc_opt_new(&OBJC_CLASS___NSMutableArray, v13);

    id v12 = (void *)v14;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[MSDPublicDBManager _handleChangedRecords:localCachedCopy:error:]( self,  "_handleChangedRecords:localCachedCopy:error:",  v8,  v12,  a5));

  return v15;
}

- (id)_handleDeletedRecordIDS:(id)a3 localCachedCopy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count] && objc_msgSend(v5, "count"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_dictionaryWithKeyGenerator:", &stru_100062788));
    id v8 = sub_10003E9DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138477827;
      id v37 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[Public] RecordIDS deleted on device: %{private}@",  buf,  0xCu);
    }

    id v29 = v6;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v6));
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v30 = v5;
    id v11 = v5;
    id v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v32;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 recordName]);
          unsigned int v19 = [v17 containsObject:v18];

          if (v19)
          {
            id v20 = sub_10003E9DC();
            v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue([v16 recordName]);
              *(_DWORD *)__int128 buf = 138477827;
              id v37 = v22;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[Public] Found match for %{private}@, removing obj from local copy",  buf,  0xCu);
            }

            v23 = (void *)objc_claimAutoreleasedReturnValue([v16 recordName]);
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v23]);

            [v10 removeObject:v24];
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }

      while (v13);
    }

    id v25 = [v10 copy];
    id v6 = v29;
    id v5 = v30;
  }

  else
  {
    id v26 = sub_10003E9DC();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[Public] Deleted recordIDS or cachedData is nil, skipping update",  buf,  2u);
    }

    id v25 = v6;
  }

  return v25;
}

- (id)_handleChangedRecords:(id)a3 localCachedCopy:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v8));
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id v30 = v7;
    id obj = v7;
    id v10 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    id v11 = v8;
    id v31 = v9;
    if (v10)
    {
      id v12 = v10;
      uint64_t v13 = *(void *)v40;
      uint64_t v32 = MSErrorDomain;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v40 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = (void *)objc_claimAutoreleasedReturnValue( -[MSDPublicDBManager createPublicDBInfoObject:]( self,  "createPublicDBInfoObject:",  *(void *)(*((void *)&v39 + 1) + 8LL * (void)i),  v30));
          uint64_t v16 = v15;
          if (v15)
          {
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472LL;
            v35[2] = sub_100035298;
            v35[3] = &unk_100060EB8;
            id v17 = v15;
            id v36 = v17;
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "na_firstObjectPassingTest:", v35));
            if (v18)
            {
              uint64_t v19 = v13;
              id v20 = sub_10003E9DC();
              v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                v22 = v11;
                v23 = (void *)objc_claimAutoreleasedReturnValue([v17 serviceID]);
                *(_DWORD *)__int128 buf = 138477827;
                id v44 = v23;
                _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "A property on a known service (%{private}@) changed",  buf,  0xCu);

                id v11 = v22;
                id v9 = v31;
              }

              [v9 removeObject:v18];
              uint64_t v13 = v19;
            }

            objc_msgSend(v9, "na_safeAddObject:", v17);
          }

          else
          {
            id v24 = sub_10003E9DC();
            id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              sub_100036048(&v37, v38, v25);
            }

            if (a5) {
              *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v32,  1LL,  0LL));
            }
          }
        }

        id v12 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
      }

      while (v12);
    }

    id v26 = v11;
    id v7 = v30;
  }

  else
  {
    id v26 = v8;
    id v27 = sub_10003E9DC();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[Public] Changed records is nil, skipping update",  buf,  2u);
    }

    id v31 = v26;
  }

  return v31;
}

- (void)_clearAllDefaultsData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  [v2 clearObjectForDefault:@"publicDBData"];

  id v3 = (id)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  [v3 clearObjectForDefault:@"publicDBChangeTokenMap"];
}

- (void)_updateLastRefreshTS
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v2 timeIntervalSinceReferenceDate];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v4 setObject:v3 forDefault:@"publicDBLastRefreshTS"];
}

- (BOOL)shouldUseCloudKit
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForDefault:@"publicDBLastRefreshTS"]);
  [v3 doubleValue];
  double v5 = v4;

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:MSPublicDatabaseRefreshIntervalInSecs]);
  BOOL v9 = [v7 compare:v8] != (id)-1;

  return v9;
}

- (id)_fetchPreviousChangeToken:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForDefaultWithCustomClass:@"publicDBChangeTokenMap"]);

  if (v5) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v3]);
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (void)_updateDefaultsWithChangeToken:(id)a3 serverChangeToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForDefaultWithCustomClass:@"publicDBChangeTokenMap"]);
  id v9 = [v8 mutableCopy];

  if (!v9) {
    id v9 = (id)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v10);
  }
  objc_msgSend(v9, "na_safeSetObject:forKey:", v6, v5);
  id v11 = sub_10003E9DC();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138477827;
    id v16 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[Public] Updating value of serverChangeToken %{private}@",  (uint8_t *)&v15,  0xCu);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v14 = [v9 copy];
  [v13 setObjectWithCustomClass:v14 forDefault:@"publicDBChangeTokenMap"];
}

+ (void)_fetchData:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](&OBJC_CLASS___MSDPublicDBManager, "shared"));
  unsigned __int8 v5 = [v4 shouldUseCloudKit];

  if ((v5 & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](&OBJC_CLASS___MSDPublicDBManager, "shared"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000357C8;
    v11[3] = &unk_100061AF0;
    id v12 = v3;
    [v6 syncDataWithCloudKit:v11];

    id v7 = v12;
LABEL_7:

    goto LABEL_8;
  }

  id v8 = sub_10003E9DC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[Public] Returning data from cached copy, last refresh was less than 24 hours back",  buf,  2u);
  }

  if (v3)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForDefaultWithCustomClass:@"publicDBData"]);
    (*((void (**)(id, void *, void))v3 + 2))(v3, v10, 0LL);

    goto LABEL_7;
  }

+ (id)_getMatchingObjectForServiceID:(id)a3 serviceID:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000358D8;
  v8[3] = &unk_100060EB8;
  id v9 = a4;
  id v5 = v9;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "na_firstObjectPassingTest:", v8));

  return v6;
}

+ (id)_getMatchingObjectForBundleID:(id)a3 bundleID:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10003599C;
  v8[3] = &unk_100060EB8;
  id v9 = a4;
  id v5 = v9;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "na_firstObjectPassingTest:", v8));

  return v6;
}

+ (id)_getMatchingObjectForServiceName:(id)a3 serviceName:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100035A60;
  v8[3] = &unk_100060EB8;
  id v9 = a4;
  id v5 = v9;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "na_firstObjectPassingTest:", v8));

  return v6;
}

- (void)executePendingRequests:(id)a3 forPublicDBInfo:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  notifyQueue = (dispatch_queue_s *)self->_notifyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035B68;
  block[3] = &unk_1000627B0;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(notifyQueue, block);
}

- (void)_withLock:(id)a3
{
  p_syncLock = &self->_syncLock;
  double v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_syncLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_syncLock);
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (BOOL)isCurrentlySyncing
{
  return self->_isCurrentlySyncing;
}

- (void)setIsCurrentlySyncing:(BOOL)a3
{
  self->_isCurrentlySyncing = a3;
}

- (NSMutableArray)queuedPendingRequests
{
  return self->_queuedPendingRequests;
}

- (void)setQueuedPendingRequests:(id)a3
{
}

- (void).cxx_destruct
{
}

@end