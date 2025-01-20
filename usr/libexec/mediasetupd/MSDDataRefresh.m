@interface MSDDataRefresh
+ (void)cacheLastRefreshforHomes:(id)a3;
+ (void)clearLastRefreshTSForHomes;
- (BOOL)_shouldPreformRefresh:(id)a3;
- (BOOL)_shouldProceedWithExecution:(id)a3;
- (MSDDataRefresh)initWithReason:(unint64_t)a3;
- (MSDDataRefresh)initWithReason:(unint64_t)a3 withDelay:(double)a4;
- (double)delay;
- (unint64_t)refreshReason;
- (void)_checkDataSanity:(id)a3 publicDBInfo:(id)a4 home:(id)a5 completion:(id)a6;
- (void)_checkZoneAndDefaultRecordInEachHome:(id)a3 completion:(id)a4;
- (void)_createAndSaveAppleMusicRecord:(id)a3 publicDBInfo:(id)a4 home:(id)a5 completion:(id)a6;
- (void)_deleteRecordZone:(id)a3 completion:(id)a4;
- (void)_deleteZombieRecordZonesIfAnyInHomes:(id)a3 completion:(id)a4;
- (void)_handleCKShareError:(id)a3 home:(id)a4;
- (void)_initializeCKAndServiceInfoForHome:(id)a3 completion:(id)a4;
- (void)_performDataRefresh:(id)a3;
- (void)_refreshDatabases:(id)a3;
- (void)_saveMediaServiceConfigInfo:(id)a3 record:(id)a4 completion:(id)a5;
- (void)_setupShareForParticipant:(id)a3 home:(id)a4 completion:(id)a5;
- (void)_shareThisRecordIfApplicable:(id)a3 home:(id)a4 completion:(id)a5;
- (void)_updateDefaultService:(id)a3 record:(id)a4 completion:(id)a5;
- (void)performRefreshWithCompletion:(id)a3;
- (void)refreshDataAfterDelay;
@end

@implementation MSDDataRefresh

- (MSDDataRefresh)initWithReason:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSDDataRefresh;
  result = -[MSDDataRefresh init](&v5, "init");
  if (result)
  {
    result->_refreshReason = a3;
    result->_delay = 0.0;
  }

  return result;
}

- (MSDDataRefresh)initWithReason:(unint64_t)a3 withDelay:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MSDDataRefresh;
  result = -[MSDDataRefresh init](&v7, "init");
  if (result)
  {
    result->_refreshReason = a3;
    result->_delay = a4;
  }

  return result;
}

- (void)performRefreshWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003E9DC();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    refreshed = MSDDataRefreshReasonToString(self->_refreshReason);
    v8 = (void *)objc_claimAutoreleasedReturnValue(refreshed);
    double delay = self->_delay;
    *(_DWORD *)buf = 136315650;
    v16 = "-[MSDDataRefresh performRefreshWithCompletion:]";
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2048;
    double v20 = delay;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s reason: %@ delay: %f", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCloudManager sharedManager](&OBJC_CLASS___MSDCloudManager, "sharedManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000290A0;
  v12[3] = &unk_100061F40;
  id v11 = v4;
  v12[4] = self;
  id v13 = v11;
  objc_copyWeak(&v14, (id *)buf);
  [v10 isCloudKitAccessAvailable:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)_performDataRefresh:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allHomes]);

  if (v6 && [v6 count])
  {
    id v7 = sub_10003E9DC();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Homes user is part of %{private}@", buf, 0xCu);
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hmf_objectsPassingTest:", &stru_100061F80));
    id v10 = [v9 count];
    id v11 = sub_10003E9DC();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138477827;
        id v24 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Performing update on the following homes: %{private}@",  buf,  0xCu);
      }

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100029604;
      v18[3] = &unk_100061FF8;
      id v20 = v4;
      v18[4] = self;
      id v9 = v9;
      id v19 = v9;
      -[MSDDataRefresh _checkZoneAndDefaultRecordInEachHome:completion:]( self,  "_checkZoneAndDefaultRecordInEachHome:completion:",  v9,  v18);

      id v14 = v20;
    }

    else
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Skipping CloudKit refresh. Homes do not contain valid accessories for media setup.",  buf,  2u);
      }

      if (!v4) {
        goto LABEL_12;
      }
      uint64_t v16 = MSErrorDomain;
      uint64_t v21 = MSUserInfoErrorStringKey;
      v22 = @"Failed to perform refresh. No valid accessories in home to setup.";
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  3LL,  v14));
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v17);
    }

- (void)_checkZoneAndDefaultRecordInEachHome:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v22 = a4;
  id v7 = dispatch_group_create();
  v33[0] = 0LL;
  v33[1] = v33;
  v33[2] = 0x2020000000LL;
  char v34 = 0;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        id v13 = sub_10003E9DC();
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v36 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Starting refresh for Home : %{private}@",  buf,  0xCu);
        }

        if ([v12 isCurrentUserRestrictedGuest])
        {
          id v15 = sub_10003E9DC();
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v12 currentUser]);
            v18 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueIdentifier]);
            *(_DWORD *)buf = 138477827;
            v36 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Determined user (%{private}@) to be a restricted guest. Skipping setting up media in the home",  buf,  0xCu);
          }
        }

        else
        {
          dispatch_group_enter(v7);
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472LL;
          v26[2] = sub_100029D0C;
          v26[3] = &unk_1000613C0;
          v28 = v33;
          v26[4] = v12;
          v27 = v7;
          -[MSDDataRefresh _initializeCKAndServiceInfoForHome:completion:]( self,  "_initializeCKAndServiceInfoForHome:completion:",  v12,  v26);
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }

    while (v9);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100029E14;
  block[3] = &unk_100062020;
  id v24 = v22;
  uint64_t v25 = v33;
  id v21 = v22;
  dispatch_group_notify(v7, v20, block);

  _Block_object_dispose(v33, 8);
}

- (void)_deleteZombieRecordZonesIfAnyInHomes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if ((+[MSDeviceInfo isDeviceAppleTV](&OBJC_CLASS___MSDeviceInfo, "isDeviceAppleTV") & 1) != 0
    || +[MSDeviceInfo isDeviceAudioAccessory](&OBJC_CLASS___MSDeviceInfo, "isDeviceAudioAccessory"))
  {
    id v8 = sub_10003E9DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "** Deletion of recordZones will be handled by the iOS device **",  buf,  2u);
    }

    if (v7) {
      v7[2](v7, 0LL);
    }
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_map:", &stru_100062060));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 privateCloudDatabase]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CKFetchRecordZonesOperation fetchAllRecordZonesOperation]( &OBJC_CLASS___CKFetchRecordZonesOperation,  "fetchAllRecordZonesOperation"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10002A054;
    v17[3] = &unk_100062100;
    id v22 = v7;
    id v18 = v12;
    id v19 = v10;
    id v20 = v6;
    id v21 = self;
    id v14 = v10;
    id v15 = v12;
    [v13 setFetchRecordZonesCompletionBlock:v17];
    [v13 setQualityOfService:17];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 operationConfiguration]);
    [v13 setConfiguration:v16];

    [v15 addOperation:v13];
  }
}

- (void)_deleteRecordZone:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 privateCloudDatabase]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002AA94;
  v11[3] = &unk_100062128;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 deleteRecordZone:v10 withOptions:0 completion:v11];
}

- (void)_refreshDatabases:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_group_create();
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x3032000000LL;
  v21[3] = sub_10002A574;
  v21[4] = sub_10002A584;
  id v22 = 0LL;
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x2020000000LL;
  char v20 = 0;
  dispatch_group_enter(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 privateCloudDatabase]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10002AD50;
  v15[3] = &unk_100062150;
  __int16 v17 = v21;
  id v18 = v19;
  id v7 = v4;
  uint64_t v16 = v7;
  [v6 refreshDatabase:0 completion:v15];

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002ADE8;
  v11[3] = &unk_100062178;
  id v12 = v3;
  id v13 = v19;
  id v14 = v21;
  id v10 = v3;
  dispatch_group_notify(v7, v9, v11);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
}

+ (void)clearLastRefreshTSForHomes
{
  id v2 = sub_10003E9DC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10002DB70(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  [v11 removeObjectForDefault:@"lastDataRefresh"];
}

+ (void)cacheLastRefreshforHomes:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v5 timeIntervalSinceReferenceDate];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v4 setObject:v6 forDefault:@"lastDataRefresh"];

  id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "na_map:", &stru_100062198));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  [v7 setObject:v8 forDefault:@"homesRefreshed"];
}

- (void)refreshDataAfterDelay
{
  id v3 = sub_10003E9DC();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double delay = self->_delay;
    refreshed = MSDDataRefreshReasonToString(self->_refreshReason);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(refreshed);
    *(_DWORD *)buf = 134218242;
    double v13 = delay;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Scheduling Refresh task after %f with reason: %@",  buf,  0x16u);
  }

  dispatch_time_t v8 = dispatch_time(0LL, (uint64_t)(self->_delay * 1000000000.0));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002B324;
  v9[3] = &unk_1000619C8;
  objc_copyWeak(&v10, &location);
  dispatch_after(v8, &_dispatch_main_q, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_initializeCKAndServiceInfoForHome:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = objc_alloc_init(&OBJC_CLASS___MSDFetchCKDataOptions);
  -[MSDFetchCKDataOptions setCreateNewZoneIfMissing:](v8, "setCreateNewZoneIfMissing:", 1LL);
  -[MSDFetchCKDataOptions setUserInitiatedRequest:](v8, "setUserInitiatedRequest:", 0LL);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 privateCloudDatabase]);

  objc_initWeak(&location, self);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v6 currentUser]);
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueIdentifier]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10002B64C;
  v18[3] = &unk_100062210;
  id v16 = v7;
  id v20 = v16;
  objc_copyWeak(&v21, &location);
  id v17 = v6;
  id v19 = v17;
  [v10 fetchRecordZoneFor:v12 user:v15 withOptions:v8 completion:v18];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)_checkDataSanity:(id)a3 publicDBInfo:(id)a4 home:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = objc_alloc(&OBJC_CLASS___CKRecordID);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceID]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneID]);
  id v17 = -[CKRecordID initWithRecordName:zoneID:](v14, "initWithRecordName:zoneID:", v15, v16);

  id v18 = objc_alloc(&OBJC_CLASS___CKRecordID);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneID]);
  id v20 = -[CKRecordID initWithRecordName:zoneID:](v18, "initWithRecordName:zoneID:", MSDefaultServiceRecordName, v19);

  if (v17 && v20)
  {
    objc_initWeak(&location, self);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 privateCloudDatabase]);

    v43[0] = v17;
    v43[1] = v20;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 2LL));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10002BB54;
    v34[3] = &unk_100062260;
    objc_copyWeak(&v41, &location);
    id v40 = v13;
    v35 = v17;
    v36 = v20;
    id v37 = v12;
    id v38 = v10;
    id v39 = v11;
    [v22 fetchRecordWithIDS:v23 withOptions:0 completion:v34];

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

  else
  {
    id v24 = sub_10003E9DC();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10002DD14(v25, v26, v27, v28, v29, v30, v31, v32);
    }

    if (v13)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CKErrorDomain,  12LL,  0LL));
      (*((void (**)(id, void *))v13 + 2))(v13, v33);
    }
  }
}

- (BOOL)_shouldProceedWithExecution:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 CKErrorHasErrorCode:11];
  id v5 = sub_10003E9DC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Unknown item error, Okay to continue, we will create new record",  v9,  2u);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10002DD84();
  }

  return v4;
}

- (void)_createAndSaveAppleMusicRecord:(id)a3 publicDBInfo:(id)a4 home:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_10003E9DC();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v33 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Creating AppleMusic Service record with PublicDB Info : %{private}@",  buf,  0xCu);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceID]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[CKRecord createRecordWithName:recordType:recordZone:]( &OBJC_CLASS___CKRecord,  "createRecordWithName:recordType:recordZone:",  v16,  MSServiceAccountRecordType,  v10));

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueIdentifier]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 UUIDString]);

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v12 currentUser]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 uniqueIdentifier]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);

  id v23 = sub_10003E9DC();
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v33 = v19;
    __int16 v34 = 2113;
    v35 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Adding Home Entries HomeID : %{private}@ HomeUserID : %{private}@",  buf,  0x16u);
  }

  [v17 setRecordFieldForKey:MSHomeParticipantHomeIdentifier value:v19];
  [v17 setRecordFieldForKey:MSHomeParticipantHomeUserIdentifier value:v22];
  objc_initWeak((id *)buf, self);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceID]);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10002C2D0;
  v28[3] = &unk_100062288;
  id v26 = v13;
  id v30 = v26;
  objc_copyWeak(&v31, (id *)buf);
  id v27 = v12;
  id v29 = v27;
  -[MSDDataRefresh _saveMediaServiceConfigInfo:record:completion:]( self,  "_saveMediaServiceConfigInfo:record:completion:",  v25,  v17,  v28);

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);
}

- (void)_shareThisRecordIfApplicable:(id)a3 home:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = sub_10003E9DC();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = [v9 isCurrentUserHomeOwner];
    id v14 = @"NO";
    id v22 = "-[MSDDataRefresh _shareThisRecordIfApplicable:home:completion:]";
    *(_DWORD *)buf = 136315651;
    if (v13) {
      id v14 = @"YES";
    }
    __int16 v23 = 2113;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s %{private}@ CurrentUserOwner: %@",  buf,  0x20u);
  }

  if ([v9 isCurrentUserHomeOwner]
    || [v9 isCurrentUserRestrictedGuest])
  {
    if (v10) {
      v10[2](v10, 0LL);
    }
  }

  else
  {
    id v15 = sub_10003E9DC();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (char *)objc_claimAutoreleasedReturnValue([v8 recordID]);
      *(_DWORD *)buf = 138477827;
      id v22 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Setting up share for participant with recordID %{private}@",  buf,  0xCu);
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10002C774;
    v18[3] = &unk_1000622B0;
    id v19 = v9;
    id v20 = v10;
    -[MSDDataRefresh _setupShareForParticipant:home:completion:]( self,  "_setupShareForParticipant:home:completion:",  v8,  v19,  v18);
  }
}

- (void)_updateDefaultService:(id)a3 record:(id)a4 completion:(id)a5
{
  id v7 = a5;
  uint64_t v8 = MSDefaultServiceRecordName;
  uint64_t v9 = MSDefaultServiceRecordType;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 recordID]);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[CKRecord createRecordWithName:recordType:recordZone:]( &OBJC_CLASS___CKRecord,  "createRecordWithName:recordType:recordZone:",  v8,  v9,  v13));

  uint64_t v15 = MediaServiceIdentifier;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 recordFieldForKey:MediaServiceIdentifier]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 currentUser]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueIdentifier]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 UUIDString]);

  id v20 = sub_10003E9DC();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    uint64_t v28 = v16;
    __int16 v29 = 2113;
    id v30 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Setting default service identifier %{private}@ and homeUserID %{private}@",  buf,  0x16u);
  }

  [v14 setRecordFieldForKey:v15 value:v16];
  [v14 setRecordFieldForKey:MSHomeParticipantHomeUserIdentifier value:v19];
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 privateCloudDatabase]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10002CB24;
  v25[3] = &unk_1000622D8;
  id v26 = v7;
  id v24 = v7;
  [v23 saveRecord:v14 completionHandler:v25];
}

- (void)_saveMediaServiceConfigInfo:(id)a3 record:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = sub_10003E9DC();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Attempting to save record for Apple Music with service info : %{private}@",  buf,  0xCu);
  }

  [v9 setRecordFieldForKey:MediaServiceIdentifier value:v7];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 privateCloudDatabase]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10002CD68;
  v15[3] = &unk_1000622D8;
  id v16 = v8;
  id v14 = v8;
  [v13 saveRecord:v9 withOptions:0 completion:v15];
}

- (void)_setupShareForParticipant:(id)a3 home:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MSDHomeCloudShareCreate cloudShareForHome:]( &OBJC_CLASS___MSDHomeCloudShareCreate,  "cloudShareForHome:",  v8));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10002CF10;
  v14[3] = &unk_100062300;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [v11 setupShareForHomeParticipant:v10 completion:v14];
}

- (BOOL)_shouldPreformRefresh:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForDefault:@"lastDataRefresh"]);
  [v5 doubleValue];
  double v7 = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 dateByAddingTimeInterval:MSPrivateDatabaseRefreshIntervalInSecs]);
  id v11 = [v9 compare:v10];

  if (v11 == (id)-1LL)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForDefault:@"homesRefreshed"]);

    uint64_t v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "na_map:", &stru_100062320));
    id v16 = (void *)v15;
    LOBYTE(v12) = 1;
    if (v14 && v15)
    {
      id v17 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v14);
      id v18 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v16);
      unsigned int v12 = !-[NSSet isEqualToSet:](v17, "isEqualToSet:", v18);
    }
  }

  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (void)_handleCKShareError:(id)a3 home:(id)a4
{
  id v5 = (char *)a3;
  id v6 = a4;
  id v7 = sub_10003E9DC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v29 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Encountered error when trying to share recordZone with owner %@",  buf,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  id v10 = [v5 code];

  if (v10 == (id)8)
  {
    id v11 = sub_10003E9DC();
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "HomeOwner device did not respond in time, hit HomeKit timeout error",  buf,  2u);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"CKShareErrorRetryCount",  v14));

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForDefault:v9]);
    id v17 = (char *)[v16 integerValue];

    if (v17 == (char *)MSCKShareTimeoutErrorMaxRetryCount)
    {
      id v18 = sub_10003E9DC();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Hit max retry count, aborting..", buf, 2u);
      }

      id v20 = objc_alloc(&OBJC_CLASS___MSDBackgroundActivityTask);
      id v21 = -[MSDBackgroundActivityTask initWithIdentifier:]( v20,  "initWithIdentifier:",  kBackgroundActivityUserShareRetryTaskIdentifier);
      -[MSDBackgroundActivityTask invalidate](v21, "invalidate");
    }

    else
    {
      id v22 = v17 + 1;
      id v23 = sub_10003E9DC();
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349315;
        __int16 v29 = v22;
        __int16 v30 = 2113;
        id v31 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Updating value of retry count %{public}lu for %{private}@",  buf,  0x16u);
      }

      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v22));
      [v25 setObject:v26 forDefault:v9];

      id v27 = objc_alloc(&OBJC_CLASS___MSDBackgroundActivityTask);
      id v21 = -[MSDBackgroundActivityTask initWithIdentifier:]( v27,  "initWithIdentifier:",  kBackgroundActivityUserShareRetryTaskIdentifier);
      -[MSDBackgroundActivityTask invalidate](v21, "invalidate");
      -[MSDBackgroundActivityTask setAllowBattery:](v21, "setAllowBattery:", 1LL);
      -[MSDBackgroundActivityTask setRepeats:](v21, "setRepeats:", 0LL);
      -[MSDBackgroundActivityTask setRequireNetworkConnection:](v21, "setRequireNetworkConnection:", 1LL);
      -[MSDBackgroundActivityTask setInterval:](v21, "setInterval:", MSCKShareTimeoutRetryIntervalInSecs);
      -[MSDBackgroundActivityTask setRequireInexpensiveNetworkConnection:]( v21,  "setRequireInexpensiveNetworkConnection:",  1LL);
      -[MSDBackgroundActivityTask setActivityBlock:](v21, "setActivityBlock:", &stru_100062360);
      -[MSDBackgroundActivityTask schedule](v21, "schedule");
    }

LABEL_15:
  }
}

- (unint64_t)refreshReason
{
  return self->_refreshReason;
}

- (double)delay
{
  return self->_delay;
}

  ;
}

@end