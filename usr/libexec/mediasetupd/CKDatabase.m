@interface CKDatabase
- (BOOL)_attemptToRecordServiceRequestLapse:(id)a3 fromRecords:(id)a4;
- (id)_checkIfRecordZonePresentForUser:(id)a3;
- (id)_fetchPlaceholderRecordData:(id)a3 error:(id *)a4;
- (id)_fetchRefreshTokenForRecordZoneID:(id)a3;
- (id)_getOperationConfiguration;
- (id)_handleChangedRecords:(id)a3 andDeletedRecordIDS:(id)a4;
- (id)_handleChangesInChangedRecords:(id)a3 withDataInLocalCopy:(id)a4;
- (id)_handleDeletedRecordIDS:(id)a3 withDataInLocalCopy:(id)a4;
- (id)_handleRecordZonesChanged:(id)a3 deletedRecordZones:(id)a4;
- (id)operationConfiguration;
- (void)_addSubscriptionWithIdentifier:(id)a3 completion:(id)a4;
- (void)_checkShareStatusIfApplicable:(id)a3;
- (void)_deleteRecord:(id)a3 completion:(id)a4;
- (void)_handleCKErrorChangeTokenExpired:(id)a3 userInfo:(id)a4;
- (void)_handleManateeLossOnPrivateDatabase:(id)a3 homeUserID:(id)a4;
- (void)_handleManateeLossOnSharedDatabase:(id)a3 completion:(id)a4;
- (void)_notifyObserversDataChanged:(id)a3 cachedData:(id)a4;
- (void)_populateRecordZoneWithCachedInfo:(id)a3 cachedInfo:(id)a4;
- (void)_purgeDeletedZonesFromDefaults:(id)a3;
- (void)_saveRecordZone:(id)a3 withAttribution:(id)a4 andOptions:(id)a5 completion:(id)a6;
- (void)_serviceConfigInfoFor:(id)a3 homeUserIDS:(id)a4 serviceID:(id)a5 completion:(id)a6;
- (void)_updateDefaultService:(id)a3 serviceID:(id)a4 userInfo:(id)a5 completion:(id)a6;
- (void)_updateServerChangeTokenMap:(id)a3 serverChangeToken:(id)a4;
- (void)_updateUserInfoToRecordZoneIDMap:(id)a3 userID:(id)a4;
- (void)addMediaService:(id)a3 usingSetupBundles:(id)a4 transaction:(id)a5 completion:(id)a6;
- (void)addSubscriptionForDatabaseWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteRecord:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)deleteRecordWithID:(id)a3 missingManateeIdentity:(BOOL)a4 withOptions:(id)a5 completion:(id)a6;
- (void)deleteRecordZone:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)fetchAllRecordsForRecordZoneID:(id)a3 userInfo:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)fetchRecordWithID:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)fetchRecordWithIDS:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)fetchRecordZoneFor:(id)a3 user:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)fetchRecordZoneFor:(id)a3 user:(id)a4 withOptions:(id)a5 withAttribution:(id)a6 completion:(id)a7;
- (void)getAvailableServices:(id)a3 completion:(id)a4;
- (void)getDefaultMediaService:(id)a3 completion:(id)a4;
- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5;
- (void)handleCKErrorMissingManateeIdentity:(id)a3 homeUserID:(id)a4;
- (void)handleCKErrorMissingManateeIdentity:(id)a3 homeUserIDS:(id)a4;
- (void)modifyCKRecordWithRecordsToSave:(id)a3 recordIDSToDelete:(id)a4 missingManateeIdentity:(BOOL)a5 withAttribution:(id)a6 withOptions:(id)a7 completion:(id)a8;
- (void)refreshDatabase:(id)a3 completion:(id)a4;
- (void)removeMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5;
- (void)removeMediaServices:(id)a3 withUserInfo:(id)a4 completion:(id)a5;
- (void)saveRecord:(id)a3 withAttribution:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)saveRecord:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)switchUserAccountInfo:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6;
- (void)updateAuthRenewalForMediaService:(id)a3 userInfo:(id)a4 completion:(id)a5;
- (void)updateDefaultMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5;
- (void)updateProperty:(id)a3 propertyInfo:(id)a4 withUserInfo:(id)a5 completion:(id)a6;
@end

@implementation CKDatabase

- (void)addSubscriptionForDatabaseWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc(&OBJC_CLASS___CKFetchSubscriptionsOperation);
  id v18 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  v10 = -[CKFetchSubscriptionsOperation initWithSubscriptionIDs:](v8, "initWithSubscriptionIDs:", v9);

  -[CKFetchSubscriptionsOperation setQualityOfService:](v10, "setQualityOfService:", 17LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase _getOperationConfiguration](self, "_getOperationConfiguration"));
  -[CKFetchSubscriptionsOperation setConfiguration:](v10, "setConfiguration:", v11);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000A464;
  v14[3] = &unk_100060D50;
  id v15 = v6;
  v16 = self;
  id v17 = v7;
  id v12 = v7;
  id v13 = v6;
  -[CKFetchSubscriptionsOperation setFetchSubscriptionCompletionBlock:]( v10,  "setFetchSubscriptionCompletionBlock:",  v14);
  -[CKDatabase addOperation:](self, "addOperation:", v10);
}

- (void)_addSubscriptionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___CKNotificationInfo);
  -[CKNotificationInfo setShouldSendContentAvailable:](v8, "setShouldSendContentAvailable:", 1LL);
  v9 = -[CKDatabaseSubscription initWithSubscriptionID:]( objc_alloc(&OBJC_CLASS___CKDatabaseSubscription),  "initWithSubscriptionID:",  v7);

  -[CKDatabaseSubscription setNotificationInfo:](v9, "setNotificationInfo:", v8);
  if (v9)
  {
    v10 = objc_alloc(&OBJC_CLASS___CKModifySubscriptionsOperation);
    id v18 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
    id v12 = -[CKModifySubscriptionsOperation initWithSubscriptionsToSave:subscriptionIDsToDelete:]( v10,  "initWithSubscriptionsToSave:subscriptionIDsToDelete:",  v11,  0LL);

    -[CKModifySubscriptionsOperation setQualityOfService:](v12, "setQualityOfService:", 17LL);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase _getOperationConfiguration](self, "_getOperationConfiguration"));
    -[CKModifySubscriptionsOperation setConfiguration:](v12, "setConfiguration:", v13);

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000A864;
    v16[3] = &unk_100060D78;
    id v17 = v6;
    -[CKModifySubscriptionsOperation setModifySubscriptionsCompletionBlock:]( v12,  "setModifySubscriptionsCompletionBlock:",  v16);
    -[CKDatabase addOperation:](self, "addOperation:", v12);

LABEL_7:
    goto LABEL_8;
  }

  id v14 = sub_10003E9DC();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10000A998(v15);
  }

  if (v6)
  {
    id v12 = (CKModifySubscriptionsOperation *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  1LL,  0LL));
    (*((void (**)(id, void, CKModifySubscriptionsOperation *))v6 + 2))(v6, 0LL, v12);
    goto LABEL_7;
  }

- (id)_getOperationConfiguration
{
  return (id)objc_opt_new(&OBJC_CLASS___CKOperationConfiguration, a2);
}

- (void)addMediaService:(id)a3 usingSetupBundles:(id)a4 transaction:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc(&OBJC_CLASS___MSServiceEvent);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceID]);
  id v16 = [v14 initWithEventType:0 serviceID:v15];

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 stopwatch]);
  [v17 start];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10000EF70;
  v33[3] = &unk_100060E90;
  id v34 = v16;
  id v18 = v16;
  v19 = objc_retainBlock(v33);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](&OBJC_CLASS___MSDPublicDBManager, "shared"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10000EFE4;
  v26[3] = &unk_100060F80;
  id v31 = v19;
  id v32 = v13;
  id v27 = v10;
  id v28 = v11;
  v29 = self;
  id v30 = v12;
  id v21 = v12;
  id v22 = v11;
  id v23 = v13;
  v24 = v19;
  id v25 = v10;
  [v20 syncDataWithCloudKit:v26];
}

- (void)getAvailableServices:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    v8 = objc_alloc_init(&OBJC_CLASS___MSDFetchCKDataOptions);
    -[MSDFetchCKDataOptions setCreateNewZoneIfMissing:](v8, "setCreateNewZoneIfMissing:", 0LL);
    -[MSDFetchCKDataOptions setUserInitiatedRequest:](v8, "setUserInitiatedRequest:", 1LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kCKDatabaseAccessUserInfoHomeIDKey]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000FD94;
    v16[3] = &unk_100060FD0;
    id v19 = v7;
    void v16[4] = self;
    id v17 = v6;
    id v18 = v8;
    id v11 = v8;
    -[CKDatabase fetchRecordZoneFor:user:withOptions:completion:]( self,  "fetchRecordZoneFor:user:withOptions:completion:",  v9,  v10,  v11,  v16);

    id v12 = v19;
LABEL_8:

    goto LABEL_9;
  }

  id v13 = sub_10003E9DC();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_100015360();
  }

  if (v7)
  {
    uint64_t v15 = MSErrorDomain;
    uint64_t v20 = MSUserInfoErrorStringKey;
    id v21 = @"Failed to fetch available services, NIL HomeID and HomeUserID";
    id v11 = (MSDFetchCKDataOptions *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  1LL,  v11));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v12);
    goto LABEL_8;
  }

- (void)updateDefaultMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && [v9 count])
  {
    objc_initWeak(&location, self);
    id v11 = objc_alloc_init(&OBJC_CLASS___MSDFetchCKDataOptions);
    -[MSDFetchCKDataOptions setCreateNewZoneIfMissing:](v11, "setCreateNewZoneIfMissing:", 0LL);
    -[MSDFetchCKDataOptions setUserInitiatedRequest:](v11, "setUserInitiatedRequest:", 1LL);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kCKDatabaseAccessUserInfoHomeIDKey]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100010634;
    v18[3] = &unk_100061020;
    id v21 = v10;
    objc_copyWeak(&v22, &location);
    id v19 = v8;
    id v20 = v9;
    -[CKDatabase fetchRecordZoneFor:user:withOptions:completion:]( self,  "fetchRecordZoneFor:user:withOptions:completion:",  v12,  v13,  v11,  v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  else
  {
    id v14 = sub_10003E9DC();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000153FC();
    }

    if (v10)
    {
      uint64_t v24 = MSUserInfoErrorStringKey;
      id v25 = @"Failed to update default service, NIL HomeID and HomeUserID";
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  1LL,  v16));
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v17);
    }
  }
}

- (void)_updateDefaultService:(id)a3 serviceID:(id)a4 userInfo:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000108E0;
  v18[3] = &unk_100061070;
  id v14 = v10;
  id v19 = v14;
  id v15 = v13;
  id v22 = v15;
  objc_copyWeak(&v23, &location);
  id v16 = v12;
  id v20 = v16;
  id v17 = v11;
  id v21 = v17;
  -[CKDatabase fetchRecordWithID:completionHandler:](self, "fetchRecordWithID:completionHandler:", v14, v18);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)getDefaultMediaService:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    id v8 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kCKDatabaseAccessUserInfoHomeIDKey]);
    id v10 = -[NSUUID initWithUUIDString:](v8, "initWithUUIDString:", v9);

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey]);
    objc_initWeak(&location, self);
    id v12 = objc_alloc_init(&OBJC_CLASS___MSDFetchCKDataOptions);
    -[MSDFetchCKDataOptions setCreateNewZoneIfMissing:](v12, "setCreateNewZoneIfMissing:", 0LL);
    -[MSDFetchCKDataOptions setUserInitiatedRequest:](v12, "setUserInitiatedRequest:", 1LL);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v10, "UUIDString"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100010F50;
    v18[3] = &unk_1000610C0;
    id v22 = v7;
    objc_copyWeak(&v23, &location);
    id v19 = v6;
    id v14 = v12;
    id v20 = v14;
    id v15 = v11;
    id v21 = v15;
    -[CKDatabase fetchRecordZoneFor:user:withOptions:completion:]( self,  "fetchRecordZoneFor:user:withOptions:completion:",  v13,  v15,  v14,  v18);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
LABEL_8:

    goto LABEL_9;
  }

  id v16 = sub_10003E9DC();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_1000154D0();
  }

  if (v7)
  {
    uint64_t v25 = MSUserInfoErrorStringKey;
    v26 = @"Failed to fetch default media service, NIL HomeID and HomeUserID";
    id v10 = (NSUUID *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  1LL,  v10));
    (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v15);
    goto LABEL_8;
  }

- (void)removeMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && [v9 count])
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___MSDFetchCKDataOptions);
    -[MSDFetchCKDataOptions setCreateNewZoneIfMissing:](v11, "setCreateNewZoneIfMissing:", 0LL);
    -[MSDFetchCKDataOptions setUserInitiatedRequest:](v11, "setUserInitiatedRequest:", 1LL);
    id v12 = objc_alloc(&OBJC_CLASS___MSServiceEvent);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceID]);
    id v14 = [v12 initWithEventType:1 serviceID:v13];

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stopwatch]);
    [v15 start];

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100011914;
    v31[3] = &unk_100060E90;
    id v32 = v14;
    id v16 = v14;
    id v17 = objc_retainBlock(v31);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kCKDatabaseAccessUserInfoHomeIDKey]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey]);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100011988;
    v25[3] = &unk_100061188;
    id v29 = v17;
    id v30 = v10;
    v25[4] = self;
    id v26 = v9;
    id v27 = v11;
    id v28 = v8;
    id v20 = v11;
    id v21 = v17;
    -[CKDatabase fetchRecordZoneFor:user:withOptions:completion:]( self,  "fetchRecordZoneFor:user:withOptions:completion:",  v18,  v19,  v20,  v25);

LABEL_8:
    goto LABEL_9;
  }

  id v22 = sub_10003E9DC();
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Failed to remove service, NIL HomeID and NIL HomeUserID",  buf,  2u);
  }

  if (v10)
  {
    uint64_t v24 = MSErrorDomain;
    uint64_t v34 = MSUserInfoErrorStringKey;
    v35 = @"Failed to remove service, NIL HomeID and HomeUserID";
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
    id v20 = (MSDFetchCKDataOptions *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v24,  1LL,  v16));
    (*((void (**)(id, void, MSDFetchCKDataOptions *))v10 + 2))(v10, 0LL, v20);
    goto LABEL_8;
  }

- (void)_deleteRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10003E9DC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315395;
    id v15 = "-[CKDatabase(MediaService) _deleteRecord:completion:]";
    __int16 v16 = 2113;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Attempting to delete record %{private}@",  buf,  0x16u);
  }

  id v10 = objc_alloc_init(&OBJC_CLASS___MSDFetchCKDataOptions);
  -[MSDFetchCKDataOptions setUserInitiatedRequest:](v10, "setUserInitiatedRequest:", 1LL);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000125B8;
  v12[3] = &unk_100060FF8;
  id v13 = v7;
  id v11 = v7;
  -[CKDatabase deleteRecord:withOptions:completion:](self, "deleteRecord:withOptions:completion:", v6, v10, v12);
}

- (void)updateProperty:(id)a3 propertyInfo:(id)a4 withUserInfo:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12 && [v12 count])
  {
    id v14 = objc_alloc_init(&OBJC_CLASS___MSDFetchCKDataOptions);
    -[MSDFetchCKDataOptions setCreateNewZoneIfMissing:](v14, "setCreateNewZoneIfMissing:", 0LL);
    -[MSDFetchCKDataOptions setUserInitiatedRequest:](v14, "setUserInitiatedRequest:", 1LL);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:kCKDatabaseAccessUserInfoHomeIDKey]);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100012818;
    v21[3] = &unk_100061200;
    id v26 = v13;
    id v22 = v10;
    id v23 = self;
    id v24 = v12;
    id v25 = v11;
    -[CKDatabase fetchRecordZoneFor:user:withOptions:completion:]( self,  "fetchRecordZoneFor:user:withOptions:completion:",  v15,  v16,  v14,  v21);

    id v17 = v26;
LABEL_8:

    goto LABEL_9;
  }

  id v18 = sub_10003E9DC();
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_100015590();
  }

  if (v13)
  {
    uint64_t v20 = MSErrorDomain;
    uint64_t v27 = MSUserInfoErrorStringKey;
    id v28 = @"Failed to updateProperty, NIL HomeID and HomeUserID";
    id v14 = (MSDFetchCKDataOptions *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v20,  1LL,  v14));
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0LL, v17);
    goto LABEL_8;
  }

- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v8 count])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CKFetchRecordZonesOperation fetchAllRecordZonesOperation]( &OBJC_CLASS___CKFetchRecordZonesOperation,  "fetchAllRecordZonesOperation"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100012FBC;
    v14[3] = &unk_100061290;
    void v14[4] = self;
    id v15 = v8;
    id v17 = v10;
    id v16 = v9;
    [v11 setFetchRecordZonesCompletionBlock:v14];
    [v11 setQualityOfService:25];
    -[CKDatabase addOperation:](self, "addOperation:", v11);

LABEL_6:
    goto LABEL_7;
  }

  if (v10)
  {
    uint64_t v12 = MSErrorDomain;
    uint64_t v18 = MSUserInfoErrorStringKey;
    id v19 = @"Failed to fetch service config info, HomeUserIDS cannot be nil";
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v12,  1LL,  v11));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v13);

    goto LABEL_6;
  }

- (void)_serviceConfigInfoFor:(id)a3 homeUserIDS:(id)a4 serviceID:(id)a5 completion:(id)a6
{
  id v31 = a3;
  id v34 = a4;
  id v10 = a5;
  id v12 = a6;
  if (v12)
  {
    if (v10)
    {
      v50[0] = 0LL;
      v50[1] = v50;
      v50[2] = 0x3032000000LL;
      v50[3] = sub_10000F5A8;
      v50[4] = sub_10000F5B8;
      id v51 = 0LL;
      id v13 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v11);
      id v30 = v12;
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForServiceID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForServiceID:",  v14));

      id v15 = dispatch_group_create();
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      id obj = v31;
      id v16 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v47;
        do
        {
          for (i = 0LL; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v47 != v17) {
              objc_enumerationMutation(obj);
            }
            id v19 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
            uint64_t v20 = objc_alloc(&OBJC_CLASS___CKRecordID);
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneID]);
            id v23 = -[CKRecordID initWithRecordName:zoneID:](v20, "initWithRecordName:zoneID:", v21, v22);

            id v24 = sub_10003E9DC();
            id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v53 = v23;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Fetching records for recordID: %@",  buf,  0xCu);
            }

            dispatch_group_enter(v15);
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3221225472LL;
            v39[2] = sub_100013654;
            v39[3] = &unk_1000612B8;
            id v40 = v34;
            v41 = v15;
            id v42 = v10;
            id v43 = v33;
            id v44 = v13;
            v45 = v50;
            -[CKDatabase fetchRecordWithID:withOptions:completion:]( self,  "fetchRecordWithID:withOptions:completion:",  v23,  0LL,  v39);
          }

          id v16 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
        }

        while (v16);
      }

      dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
      uint64_t v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100013874;
      block[3] = &unk_1000612E0;
      id v36 = v13;
      id v37 = v30;
      v38 = v50;
      id v28 = v13;
      dispatch_group_notify(v15, v27, block);

      _Block_object_dispose(v50, 8);
      id v12 = v30;
    }

    else
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void *))v12 + 2))(v12, 0LL, v29);
    }
  }
}

- (void)removeMediaServices:(id)a3 withUserInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v8 count])
  {
    if (v9 && [v9 count])
    {
      uint64_t v11 = objc_alloc_init(&OBJC_CLASS___MSDFetchCKDataOptions);
      -[MSDFetchCKDataOptions setCreateNewZoneIfMissing:](v11, "setCreateNewZoneIfMissing:", 0LL);
      -[MSDFetchCKDataOptions setUserInitiatedRequest:](v11, "setUserInitiatedRequest:", 0LL);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kCKDatabaseAccessUserInfoHomeIDKey]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey]);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100013B18;
      v28[3] = &unk_100060FD0;
      id v32 = v10;
      id v29 = v8;
      id v30 = self;
      id v31 = v11;
      id v14 = v11;
      -[CKDatabase fetchRecordZoneFor:user:withOptions:completion:]( self,  "fetchRecordZoneFor:user:withOptions:completion:",  v12,  v13,  v14,  v28);

      id v15 = v32;
LABEL_13:

      goto LABEL_14;
    }

    id v19 = sub_10003E9DC();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10001567C(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    if (v10)
    {
      uint64_t v16 = MSErrorDomain;
      uint64_t v33 = MSUserInfoErrorStringKey;
      id v34 = @"Failed to remove services, NIL identifiers passed";
      uint64_t v17 = &v34;
      uint64_t v18 = &v33;
      goto LABEL_12;
    }
  }

  else if (v10)
  {
    uint64_t v16 = MSErrorDomain;
    uint64_t v35 = MSUserInfoErrorStringKey;
    id v36 = @"ServiceIDs specified is nil";
    uint64_t v17 = &v36;
    uint64_t v18 = &v35;
LABEL_12:
    id v14 = (MSDFetchCKDataOptions *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v18,  1LL));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  1LL,  v14));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v15);
    goto LABEL_13;
  }

- (void)updateAuthRenewalForMediaService:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && [v9 count])
  {
    if (v8)
    {
      id v11 = sub_10003E9DC();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 authCredential]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 authConfiguration]);
        *(_DWORD *)buf = 138478083;
        id v29 = v13;
        __int16 v30 = 2113;
        id v31 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Updating CloudKit with AuthCredential %{private}@, AuthConfig %{private}@",  buf,  0x16u);
      }

      id v15 = objc_alloc_init(&OBJC_CLASS___MSDFetchCKDataOptions);
      -[MSDFetchCKDataOptions setCreateNewZoneIfMissing:](v15, "setCreateNewZoneIfMissing:", 0LL);
      -[MSDFetchCKDataOptions setUserInitiatedRequest:](v15, "setUserInitiatedRequest:", 1LL);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kCKDatabaseAccessUserInfoHomeIDKey]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey]);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10001415C;
      v23[3] = &unk_100060FD0;
      id v27 = v10;
      id v24 = v8;
      uint64_t v25 = self;
      uint64_t v26 = v15;
      uint64_t v18 = v15;
      -[CKDatabase fetchRecordZoneFor:user:withOptions:completion:]( self,  "fetchRecordZoneFor:user:withOptions:completion:",  v16,  v17,  v18,  v23);

      id v19 = v27;
      goto LABEL_10;
    }

    if (!v10) {
      goto LABEL_11;
    }
    uint64_t v20 = MSErrorDomain;
    uint64_t v32 = MSUserInfoErrorStringKey;
    uint64_t v33 = @"Failed to updateAuthRenewalInfo, NIL MediaService";
    uint64_t v21 = &v33;
    uint64_t v22 = &v32;
LABEL_9:
    uint64_t v18 = (MSDFetchCKDataOptions *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v22,  1LL));
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v20,  1LL,  v18));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v19);
LABEL_10:

    goto LABEL_11;
  }

  if (v10)
  {
    uint64_t v20 = MSErrorDomain;
    uint64_t v34 = MSUserInfoErrorStringKey;
    uint64_t v35 = @"Failed to updateAuthRenewalInfo, NIL UserInfo";
    uint64_t v21 = &v35;
    uint64_t v22 = &v34;
    goto LABEL_9;
  }

- (void)switchUserAccountInfo:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10 && v11 && v12)
  {
    v31[0] = 0LL;
    v31[1] = v31;
    v31[2] = 0x3032000000LL;
    v31[3] = sub_10000F5A8;
    void v31[4] = sub_10000F5B8;
    id v32 = 0LL;
    id v14 = dispatch_group_create();
    dispatch_group_enter(v14);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000148F4;
    v27[3] = &unk_1000613C0;
    __int16 v30 = v31;
    id v15 = v14;
    id v28 = v15;
    id v16 = v10;
    id v29 = v16;
    +[MSAuthTokenProvider fetchAuthTokensForMediaService:networkActivity:completion:]( &OBJC_CLASS___MSAuthTokenProvider,  "fetchAuthTokensForMediaService:networkActivity:completion:",  v16,  0LL,  v27);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
    uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100014A64;
    block[3] = &unk_1000614A8;
    uint64_t v26 = v31;
    id v25 = v13;
    void block[4] = self;
    id v22 = v11;
    id v23 = v12;
    id v24 = v16;
    dispatch_group_notify(v15, v18, block);

    _Block_object_dispose(v31, 8);
  }

  else
  {
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    uint64_t v34 = @"Failed to switch User Account Info, NIL attributes provided";
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  1LL,  v19));
    (*((void (**)(id, void *))v13 + 2))(v13, v20);
  }
}

- (void)refreshDatabase:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10003E9DC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = CKDatabaseScopeString(-[CKDatabase databaseScope](self, "databaseScope"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 136315395;
    id v36 = "-[CKDatabase(MSDCloudDatabase) refreshDatabase:completion:]";
    __int16 v37 = 2113;
    v38 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s databaseScope %{private}@", buf, 0x16u);
  }

  if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)3) {
    id v12 = @"sharedDatabaseChangesKey";
  }
  else {
    id v12 = @"privateDatabaseChangesKey";
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForDefaultWithCustomClass:v12]);

  id v16 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v15);
  uint64_t v18 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v17);
  id v19 = -[CKFetchDatabaseChangesOperation initWithPreviousServerChangeToken:]( objc_alloc(&OBJC_CLASS___CKFetchDatabaseChangesOperation),  "initWithPreviousServerChangeToken:",  v14);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000363C4;
  v30[3] = &unk_100062830;
  v30[4] = self;
  id v34 = v6;
  id v20 = v16;
  id v31 = v20;
  id v21 = v18;
  id v32 = v21;
  NSErrorUserInfoKey v33 = (__CFString *)v12;
  id v22 = v6;
  -[CKFetchDatabaseChangesOperation setFetchDatabaseChangesCompletionBlock:]( v19,  "setFetchDatabaseChangesCompletionBlock:",  v30);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000365E0;
  v28[3] = &unk_100062858;
  id v29 = v20;
  id v23 = v20;
  -[CKFetchDatabaseChangesOperation setRecordZoneWithIDChangedBlock:](v19, "setRecordZoneWithIDChangedBlock:", v28);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000365EC;
  v26[3] = &unk_100062858;
  id v27 = v21;
  id v24 = v21;
  -[CKFetchDatabaseChangesOperation setRecordZoneWithIDWasDeletedBlock:]( v19,  "setRecordZoneWithIDWasDeletedBlock:",  v26);
  LODWORD(v21) = [v7 userInitiatedRequest];

  if ((_DWORD)v21)
  {
    -[CKFetchDatabaseChangesOperation setQualityOfService:](v19, "setQualityOfService:", 25LL);
  }

  else
  {
    -[CKFetchDatabaseChangesOperation setQualityOfService:](v19, "setQualityOfService:", 17LL);
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase operationConfiguration](self, "operationConfiguration"));
    -[CKFetchDatabaseChangesOperation setConfiguration:](v19, "setConfiguration:", v25);
  }

  -[CKDatabase addOperation:](self, "addOperation:", v19);
}

- (void)fetchRecordZoneFor:(id)a3 user:(id)a4 withOptions:(id)a5 completion:(id)a6
{
}

- (void)fetchRecordZoneFor:(id)a3 user:(id)a4 withOptions:(id)a5 withAttribution:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void *, void))a7;
  id v17 = sub_10003E9DC();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v35 = v13;
    __int16 v36 = 2113;
    id v37 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Fetching Zone for HomeUserID: %{private}@, options: %{private}@",  buf,  0x16u);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase _checkIfRecordZonePresentForUser:](self, "_checkIfRecordZonePresentForUser:", v13));
  id v20 = sub_10003E9DC();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v22)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneID]);
      *(_DWORD *)buf = 138478083;
      id v35 = v23;
      __int16 v36 = 2113;
      id v37 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "RecordZone %{private}@ for user %{private}@",  buf,  0x16u);
    }

    if (v16) {
      v16[2](v16, v19, 0LL);
    }
  }

  else
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Possibly missing cached value on device, checking with CloudKit",  buf,  2u);
    }

    objc_initWeak((id *)buf, self);
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[CKFetchRecordZonesOperation fetchAllRecordZonesOperation]( &OBJC_CLASS___CKFetchRecordZonesOperation,  "fetchAllRecordZonesOperation"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100036964;
    v27[3] = &unk_100062940;
    id v32 = v16;
    void v27[4] = self;
    id v28 = v13;
    objc_copyWeak(&v33, (id *)buf);
    id v29 = v12;
    id v25 = v14;
    id v30 = v25;
    id v31 = v15;
    [v24 setFetchRecordZonesCompletionBlock:v27];
    if ([v25 userInitiatedRequest])
    {
      [v24 setQualityOfService:25];
    }

    else
    {
      [v24 setQualityOfService:17];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase operationConfiguration](self, "operationConfiguration"));
      [v24 setConfiguration:v26];
    }

    -[CKDatabase addOperation:](self, "addOperation:", v24);

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);
  }
}

- (id)_checkIfRecordZonePresentForUser:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForDefaultWithCustomClass:@"kUserIDToRecordZoneIDMap"]);

  if (v5 && (uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 objectForKey:v3])) != 0)
  {
    id v7 = (void *)v6;
    id v8 = -[CKRecordZone initWithZoneID:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneID:", v6);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (void)_updateUserInfoToRecordZoneIDMap:(id)a3 userID:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForDefaultWithCustomClass:@"kUserIDToRecordZoneIDMap"]);
  id v8 = [v7 mutableCopy];

  if (![v8 count])
  {
    uint64_t v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v9);

    id v8 = (id)v10;
  }

  [v8 setObject:v13 forKey:v5];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v12 = [v8 copy];
  [v11 setObjectWithCustomClass:v12 forDefault:@"kUserIDToRecordZoneIDMap"];
}

- (void)deleteRecordZone:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_alloc(&OBJC_CLASS___CKModifyRecordZonesOperation);
  id v18 = v8;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  id v13 = -[CKModifyRecordZonesOperation initWithRecordZonesToSave:recordZoneIDsToDelete:]( v11,  "initWithRecordZonesToSave:recordZoneIDsToDelete:",  0LL,  v12);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100037D10;
  v16[3] = &unk_100060D78;
  id v17 = v9;
  id v14 = v9;
  -[CKModifyRecordZonesOperation setModifyRecordZonesCompletionBlock:](v13, "setModifyRecordZonesCompletionBlock:", v16);
  LODWORD(v9) = [v10 userInitiatedRequest];

  if ((_DWORD)v9)
  {
    -[CKModifyRecordZonesOperation setQualityOfService:](v13, "setQualityOfService:", 25LL);
  }

  else
  {
    -[CKModifyRecordZonesOperation setQualityOfService:](v13, "setQualityOfService:", 17LL);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase operationConfiguration](self, "operationConfiguration"));
    -[CKModifyRecordZonesOperation setConfiguration:](v13, "setConfiguration:", v15);
  }

  -[CKDatabase addOperation:](self, "addOperation:", v13);
}

- (void)fetchRecordWithID:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v18 = v8;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100037F34;
    v15[3] = &unk_100062968;
    id v17 = v10;
    id v16 = v8;
    -[CKDatabase fetchRecordWithIDS:withOptions:completion:]( self,  "fetchRecordWithIDS:withOptions:completion:",  v11,  v9,  v15);

    id v12 = v17;
LABEL_7:

    goto LABEL_8;
  }

  id v13 = sub_10003E9DC();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_10003E050();
  }

  if (v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CKErrorDomain,  12LL,  0LL));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v12);
    goto LABEL_7;
  }

- (void)fetchRecordWithIDS:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v8 count])
  {
    id v11 = -[CKFetchRecordsOperation initWithRecordIDs:]( objc_alloc(&OBJC_CLASS___CKFetchRecordsOperation),  "initWithRecordIDs:",  v8);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10003814C;
    v15[3] = &unk_100061C88;
    id v16 = v10;
    -[CKFetchRecordsOperation setFetchRecordsCompletionBlock:](v11, "setFetchRecordsCompletionBlock:", v15);
    if ([v9 userInitiatedRequest])
    {
      -[CKFetchRecordsOperation setQualityOfService:](v11, "setQualityOfService:", 25LL);
    }

    else
    {
      -[CKFetchRecordsOperation setQualityOfService:](v11, "setQualityOfService:", 17LL);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase operationConfiguration](self, "operationConfiguration"));
      -[CKFetchRecordsOperation setConfiguration:](v11, "setConfiguration:", v14);
    }

    -[CKDatabase addOperation:](self, "addOperation:", v11);

    goto LABEL_11;
  }

  id v12 = sub_10003E9DC();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10003E07C();
  }

  if (v10)
  {
    id v11 = (CKFetchRecordsOperation *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CKErrorDomain,  12LL,  0LL));
    (*((void (**)(id, void, CKFetchRecordsOperation *))v10 + 2))(v10, 0LL, v11);
LABEL_11:
  }
}

- (void)fetchAllRecordsForRecordZoneID:(id)a3 userInfo:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v36 = a4;
  id v35 = a5;
  id v12 = a6;
  if (v10)
  {
    v57[0] = 0LL;
    v57[1] = v57;
    v57[2] = 0x3032000000LL;
    v57[3] = sub_1000372A8;
    v57[4] = sub_1000372B8;
    id v58 = 0LL;
    v55[0] = 0LL;
    v55[1] = v55;
    v55[2] = 0x3032000000LL;
    v55[3] = sub_1000372A8;
    v55[4] = sub_1000372B8;
    id v56 = (id)objc_opt_new(&OBJC_CLASS___NSMutableArray, v11);
    v53[0] = 0LL;
    v53[1] = v53;
    v53[2] = 0x3032000000LL;
    v53[3] = sub_1000372A8;
    v53[4] = sub_1000372B8;
    id v54 = (id)objc_opt_new(&OBJC_CLASS___NSMutableArray, v13);
    v51[0] = 0LL;
    v51[1] = v51;
    v51[2] = 0x3032000000LL;
    v51[3] = sub_1000372A8;
    v51[4] = sub_1000372B8;
    id v52 = 0LL;
    id v14 = [[MSServiceEvent alloc] initWithEventType:2];
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stopwatch]);
    [v15 start];

    if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)3) {
      id v16 = @"sharedDatabaseData";
    }
    else {
      id v16 = @"privateDatabaseData";
    }
    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase _fetchRefreshTokenForRecordZoneID:](self, "_fetchRefreshTokenForRecordZoneID:", v10));
    id v17 = sub_10003E9DC();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315395;
      v61 = "-[CKDatabase(MSDCloudDatabase) fetchAllRecordsForRecordZoneID:userInfo:withOptions:completion:]";
      __int16 v62 = 2113;
      v63 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s Passing Config information %{private}@",  buf,  0x16u);
    }

    id v19 = objc_alloc(&OBJC_CLASS___CKFetchRecordZoneChangesOperation);
    id v59 = v10;
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v59, 1LL));
    id v21 = -[CKFetchRecordZoneChangesOperation initWithRecordZoneIDs:configurationsByRecordZoneID:]( v19,  "initWithRecordZoneIDs:configurationsByRecordZoneID:",  v20,  v34);

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10003867C;
    v40[3] = &unk_100062A58;
    id v22 = v14;
    __int128 v47 = v57;
    id v41 = v22;
    id v42 = self;
    id v43 = v10;
    id v44 = v36;
    v45 = (__CFString *)v16;
    id v46 = v12;
    __int128 v48 = v55;
    __int128 v49 = v53;
    v50 = v51;
    -[CKFetchRecordZoneChangesOperation setFetchRecordZoneChangesCompletionBlock:]( v21,  "setFetchRecordZoneChangesCompletionBlock:",  v40);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_1000391E4;
    v39[3] = &unk_100062A80;
    void v39[4] = self;
    v39[5] = v57;
    v39[6] = v55;
    v39[7] = v53;
    v39[8] = v51;
    -[CKFetchRecordZoneChangesOperation setRecordZoneFetchCompletionBlock:]( v21,  "setRecordZoneFetchCompletionBlock:",  v39);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_10003945C;
    v38[3] = &unk_100062AA8;
    v38[4] = self;
    v38[5] = v53;
    -[CKFetchRecordZoneChangesOperation setRecordWithIDWasDeletedBlock:](v21, "setRecordWithIDWasDeletedBlock:", v38);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100039568;
    v37[3] = &unk_100062AD0;
    v37[4] = self;
    v37[5] = v55;
    -[CKFetchRecordZoneChangesOperation setRecordWasChangedBlock:](v21, "setRecordWasChangedBlock:", v37);
    if ([v35 userInitiatedRequest])
    {
      -[CKFetchRecordZoneChangesOperation setQualityOfService:](v21, "setQualityOfService:", 25LL);
    }

    else
    {
      -[CKFetchRecordZoneChangesOperation setQualityOfService:](v21, "setQualityOfService:", 17LL);
      id v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase operationConfiguration](self, "operationConfiguration"));
      -[CKFetchRecordZoneChangesOperation setConfiguration:](v21, "setConfiguration:", v33);
    }

    -[CKDatabase addOperation:](self, "addOperation:", v21);

    _Block_object_dispose(v51, 8);
    _Block_object_dispose(v53, 8);

    _Block_object_dispose(v55, 8);
    _Block_object_dispose(v57, 8);
  }

  else
  {
    id v23 = sub_10003E9DC();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10003E0A8(v24, v25, v26, v27, v28, v29, v30, v31);
    }

    if (v12)
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CKErrorDomain,  12LL,  0LL));
      (*((void (**)(id, void, void *))v12 + 2))(v12, 0LL, v32);
    }
  }
}

- (id)_handleRecordZonesChanged:(id)a3 deletedRecordZones:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count]) {
    -[CKDatabase _purgeDeletedZonesFromDefaults:](self, "_purgeDeletedZonesFromDefaults:", v7);
  }
  id v18 = v7;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = sub_1000372A8;
  uint64_t v31 = sub_1000372B8;
  id v32 = 0LL;
  id v8 = dispatch_group_create();
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    int64_t v11 = 1000000000LL * MSMaxWaitInSecondsForFetchDataFromCloudKit;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v12);
        dispatch_group_enter(v8);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_100039964;
        v20[3] = &unk_100062AF8;
        v20[4] = v13;
        v20[5] = self;
        id v22 = &v27;
        id v14 = v8;
        id v21 = v14;
        -[CKDatabase fetchAllRecordsForRecordZoneID:userInfo:withOptions:completion:]( self,  "fetchAllRecordsForRecordZoneID:userInfo:withOptions:completion:",  v13,  0LL,  0LL,  v20,  v18);
        dispatch_time_t v15 = dispatch_time(0LL, v11);
        dispatch_group_wait(v14, v15);

        id v12 = (char *)v12 + 1;
      }

      while (v9 != v12);
      id v9 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
    }

    while (v9);
  }

  id v16 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v16;
}

- (void)_purgeDeletedZonesFromDefaults:(id)a3
{
  id v4 = a3;
  if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)3) {
    id v5 = @"sharedDatabaseData";
  }
  else {
    id v5 = @"privateDatabaseData";
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_map:", &stru_100062B38));
  id v7 = sub_10003E9DC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    __int128 v49 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Purging recordZoneData with recordZoneNames %{private}@",  buf,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForDefaultWithCustomClass:v5]);
  id v11 = [v10 mutableCopy];

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_100039EF0;
  v46[3] = &unk_100060D00;
  id v12 = v6;
  id v47 = v12;
  id v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "na_filter:", v46));
  objc_msgSend(v11, "removeObjectsInArray:");
  id v13 = sub_10003E9DC();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = CKDatabaseScopeString(-[CKDatabase databaseScope](self, "databaseScope"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138412547;
    __int128 v49 = v16;
    __int16 v50 = 2113;
    id v51 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[%@] Updating Data in defaults after recordZone deleted %{private}@",  buf,  0x16u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  [v17 setObjectWithCustomClass:v11 forDefault:v5];

  if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)3) {
    id v18 = @"sharedDatabaseKeyRefreshTokens";
  }
  else {
    id v18 = @"privateDatabaseKeyRefreshTokens";
  }
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForDefaultWithCustomClass:v18]);
  id v21 = [v20 mutableCopy];

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_100039F34;
  v44[3] = &unk_100062B60;
  id v22 = v12;
  id v45 = v22;
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "na_map:", v44));
  [v21 removeObjectsForKeys:v23];
  id v24 = sub_10003E9DC();
  __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = CKDatabaseScopeString(-[CKDatabase databaseScope](self, "databaseScope"));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    *(_DWORD *)buf = 138412547;
    __int128 v49 = v27;
    __int16 v50 = 2113;
    id v51 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[%@] Updating Server tokens in defaults after recordZone deleted %{private}@",  buf,  0x16u);
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  [v28 setObjectWithCustomClass:v21 forDefault:v18];

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForDefaultWithCustomClass:@"kUserIDToRecordZoneIDMap"]);
  id v31 = [v30 mutableCopy];

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100039F80;
  v41[3] = &unk_100062BB0;
  id v42 = v4;
  id v33 = (id)objc_opt_new(&OBJC_CLASS___NSMutableArray, v32);
  id v43 = v33;
  id v34 = v4;
  objc_msgSend(v31, "na_each:", v41);
  [v31 removeObjectsForKeys:v33];
  id v35 = sub_10003E9DC();
  id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v37 = CKDatabaseScopeString(-[CKDatabase databaseScope](self, "databaseScope"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    *(_DWORD *)buf = 138412547;
    __int128 v49 = v38;
    __int16 v50 = 2113;
    id v51 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "[%@] Updating the UserIDToRecordZoneID Map to %{private}@",  buf,  0x16u);
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  [v39 setObjectWithCustomClass:v31 forDefault:@"kUserIDToRecordZoneIDMap"];
}

- (void)_saveRecordZone:(id)a3 withAttribution:(id)a4 andOptions:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (v9)
  {
    id v12 = objc_alloc(&OBJC_CLASS___CKModifyRecordZonesOperation);
    id v21 = v9;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    id v14 = -[CKModifyRecordZonesOperation initWithRecordZonesToSave:recordZoneIDsToDelete:]( v12,  "initWithRecordZonesToSave:recordZoneIDsToDelete:",  v13,  0LL);

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10003A2D4;
    v18[3] = &unk_100060D78;
    id v19 = v11;
    -[CKModifyRecordZonesOperation setModifyRecordZonesCompletionBlock:]( v14,  "setModifyRecordZonesCompletionBlock:",  v18);
    if ([v10 userInitiatedRequest])
    {
      -[CKModifyRecordZonesOperation setQualityOfService:](v14, "setQualityOfService:", 25LL);
    }

    else
    {
      -[CKModifyRecordZonesOperation setQualityOfService:](v14, "setQualityOfService:", 17LL);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase operationConfiguration](self, "operationConfiguration"));
      -[CKModifyRecordZonesOperation setConfiguration:](v14, "setConfiguration:", v17);
    }

    -[CKDatabase addOperation:](self, "addOperation:", v14);

    goto LABEL_10;
  }

  id v15 = sub_10003E9DC();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Failed to save recordZone - NIL CKRecordZone",  buf,  2u);
  }

  if (v11)
  {
    id v14 = (CKModifyRecordZonesOperation *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CKErrorDomain,  12LL,  0LL));
    (*((void (**)(id, void, CKModifyRecordZonesOperation *))v11 + 2))(v11, 0LL, v14);
LABEL_10:
  }
}

- (id)_handleChangedRecords:(id)a3 andDeletedRecordIDS:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)3) {
    id v8 = @"sharedDatabaseData";
  }
  else {
    id v8 = @"privateDatabaseData";
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForDefaultWithCustomClass:v8]);

  if (v10 && [v10 count]) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_opt_new(&OBJC_CLASS___NSArray, v11);
  }
  id v13 = v12;
  id v14 = [v7 count];
  if (v10) {
    BOOL v15 = v14 == 0LL;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue( -[CKDatabase _handleDeletedRecordIDS:withDataInLocalCopy:]( self,  "_handleDeletedRecordIDS:withDataInLocalCopy:",  v7,  v10));

    id v13 = (void *)v16;
  }

  if ([v6 count])
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue( -[CKDatabase _handleChangesInChangedRecords:withDataInLocalCopy:]( self,  "_handleChangesInChangedRecords:withDataInLocalCopy:",  v6,  v13));

    id v13 = (void *)v17;
  }

  return v13;
}

- (id)_handleDeletedRecordIDS:(id)a3 withDataInLocalCopy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v25 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v6));
    id v23 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_dictionaryWithKeyGenerator:", &stru_100062BF0));
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v24 = v5;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 recordName]);
          BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneID]);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneName]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  v14,  v16));

          id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
          LODWORD(v14) = [v18 containsObject:v17];

          if ((_DWORD)v14)
          {
            id v19 = sub_10003E9DC();
            id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              id v31 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Found match for %{private}@, removing obj from default",  buf,  0xCu);
            }

            id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v17]);
            [v25 removeObject:v21];
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }

      while (v10);
    }

    id v6 = v23;
    id v5 = v24;
  }

  else
  {
    id v25 = 0LL;
  }

  return v25;
}

- (id)_handleChangesInChangedRecords:(id)a3 withDataInLocalCopy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v6));
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id v37 = v5;
    id obj = v5;
    id v46 = [obj countByEnumeratingWithState:&v54 objects:v68 count:16];
    if (v46)
    {
      uint64_t v44 = MSHomeParticipantHomeIdentifier;
      uint64_t v45 = *(void *)v55;
      uint64_t v43 = MSHomeParticipantHomeUserIdentifier;
      uint64_t v41 = MSDefaultServiceRecordType;
      v38 = v7;
      id v39 = v6;
      while (2)
      {
        for (i = 0LL; i != v46; i = (char *)i + 1)
        {
          if (*(void *)v55 != v45) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
          id v10 = objc_alloc(&OBJC_CLASS___NSUUID);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 recordFieldForKey:v44]);
          id v12 = -[NSUUID initWithUUIDString:](v10, "initWithUUIDString:", v11);

          id v13 = objc_alloc(&OBJC_CLASS___NSUUID);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 recordFieldForKey:v43]);
          BOOL v15 = -[NSUUID initWithUUIDString:](v13, "initWithUUIDString:", v14);

          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 createMediaServiceObjectFromRecord]);
          if (v16)
          {
            uint64_t v17 = -[MSDDefaultsInfo initWithService:homeID:homeUserID:]( objc_alloc(&OBJC_CLASS___MSDDefaultsInfo),  "initWithService:homeID:homeUserID:",  v16,  v12,  v15);
            if (v17)
            {
              id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 recordID]);
              id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 recordName]);
              -[MSDDefaultsInfo setRecordName:](v17, "setRecordName:", v19);

              id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 recordType]);
              -[MSDDefaultsInfo setRecordType:](v17, "setRecordType:", v20);

              id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 recordID]);
              id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 zoneID]);
              id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 zoneName]);
              -[MSDDefaultsInfo setRecordZoneName:](v17, "setRecordZoneName:", v23);

              id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordType](v17, "recordType"));
              LODWORD(v22) = [v24 isEqualToString:v41];

              if ((_DWORD)v22)
              {
                v49[0] = _NSConcreteStackBlock;
                v49[1] = 3221225472LL;
                v49[2] = sub_10003ACD4;
                v49[3] = &unk_100060D28;
                __int16 v50 = v15;
                id v51 = v17;
                id v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_firstObjectPassingTest:", v49));

                __int128 v26 = (id *)&v50;
              }

              else
              {
                v47[0] = _NSConcreteStackBlock;
                v47[1] = 3221225472LL;
                v47[2] = sub_10003AD9C;
                v47[3] = &unk_100060D00;
                __int128 v48 = v17;
                id v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_firstObjectPassingTest:", v47));
                __int128 v26 = (id *)&v48;
              }

              if (v25)
              {
                id v30 = sub_10003E9DC();
                id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v25 recordType]);
                  id v40 = (void *)objc_claimAutoreleasedReturnValue([v25 service]);
                  id v33 = (void *)objc_claimAutoreleasedReturnValue([v40 serviceID]);
                  id v34 = (void *)objc_claimAutoreleasedReturnValue([v25 homeUserID]);
                  *(_DWORD *)buf = 138478595;
                  id v59 = v32;
                  __int16 v60 = 2113;
                  v61 = v33;
                  __int16 v62 = 2113;
                  v63 = v34;
                  __int16 v64 = 2113;
                  v65 = v17;
                  _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "A property on a known service changed (RecordType: %{private}@, ServiceID: %{private}@, homeUserID: %{private}@) | Updating cachedInfo with %{private}@",  buf,  0x2Au);

                  id v6 = v39;
                  id v7 = v38;
                }

                [v7 removeObject:v25];
              }

              objc_msgSend(v7, "na_safeAddObject:", v17);
              int v28 = 0;
            }

            else
            {
              id v29 = sub_10003E9DC();
              id v25 = (void *)objc_claimAutoreleasedReturnValue(v29);
              if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR)) {
                sub_10003E4AC(&v52, v53, (os_log_t)v25);
              }
              int v28 = 1;
            }
          }

          else
          {
            id v27 = sub_10003E9DC();
            uint64_t v17 = (MSDDefaultsInfo *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_10003E420(v66, v9, &v67, v17);
            }
            int v28 = 1;
          }

          if (v28)
          {

            id v35 = 0LL;
            goto LABEL_29;
          }
        }

        id v46 = [obj countByEnumeratingWithState:&v54 objects:v68 count:16];
        if (v46) {
          continue;
        }
        break;
      }
    }

    id v35 = [v7 copy];
LABEL_29:

    id v5 = v37;
  }

  else
  {
    id v35 = 0LL;
  }

  return v35;
}

- (void)saveRecord:(id)a3 withOptions:(id)a4 completion:(id)a5
{
}

- (void)saveRecord:(id)a3 withAttribution:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    id v20 = v10;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10003B0E4;
    v18[3] = &unk_100060D78;
    id v19 = v13;
    -[CKDatabase modifyCKRecordWithRecordsToSave:recordIDSToDelete:missingManateeIdentity:withAttribution:withOptions:completion:]( self,  "modifyCKRecordWithRecordsToSave:recordIDSToDelete:missingManateeIdentity:withAttribution:withOptions:completion:",  v14,  0LL,  0LL,  v11,  v12,  v18);

    BOOL v15 = v19;
LABEL_7:

    goto LABEL_8;
  }

  id v16 = sub_10003E9DC();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_10003E4E8();
  }

  if (v13)
  {
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CKErrorDomain,  12LL,  0LL));
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0LL, v15);
    goto LABEL_7;
  }

- (void)deleteRecord:(id)a3 withOptions:(id)a4 completion:(id)a5
{
}

- (void)deleteRecordWithID:(id)a3 missingManateeIdentity:(BOOL)a4 withOptions:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v10)
  {
    id v20 = v10;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10003B30C;
    v17[3] = &unk_100060D78;
    id v18 = v12;
    -[CKDatabase modifyCKRecordWithRecordsToSave:recordIDSToDelete:missingManateeIdentity:withAttribution:withOptions:completion:]( self,  "modifyCKRecordWithRecordsToSave:recordIDSToDelete:missingManateeIdentity:withAttribution:withOptions:completion:",  0LL,  v13,  v8,  0LL,  v11,  v17);

    id v14 = v18;
LABEL_7:

    goto LABEL_8;
  }

  id v15 = sub_10003E9DC();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Failed to delete record - NIL CKRecordID",  buf,  2u);
  }

  if (v12)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CKErrorDomain,  12LL,  0LL));
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0LL, v14);
    goto LABEL_7;
  }

- (void)modifyCKRecordWithRecordsToSave:(id)a3 recordIDSToDelete:(id)a4 missingManateeIdentity:(BOOL)a5 withAttribution:(id)a6 withOptions:(id)a7 completion:(id)a8
{
  BOOL v10 = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  if ([v13 count] || objc_msgSend(v14, "count"))
  {
    if (v10)
    {
      id v17 = sub_10003E9DC();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Creating Modify Records Operation with markAsParticipantNeedsNewInvitationToken: YES",  buf,  2u);
      }
    }

    id v19 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation),  "initWithRecordsToSave:recordIDsToDelete:",  v13,  v14);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10003B540;
    v23[3] = &unk_100060D78;
    id v24 = v16;
    -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v19, "setModifyRecordsCompletionBlock:", v23);
    if ([v15 userInitiatedRequest])
    {
      -[CKModifyRecordsOperation setQualityOfService:](v19, "setQualityOfService:", 25LL);
    }

    else
    {
      -[CKModifyRecordsOperation setQualityOfService:](v19, "setQualityOfService:", 17LL);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase operationConfiguration](self, "operationConfiguration"));
      -[CKModifyRecordsOperation setConfiguration:](v19, "setConfiguration:", v20);
    }

    -[CKModifyRecordsOperation setMarkAsParticipantNeedsNewInvitationToken:]( v19,  "setMarkAsParticipantNeedsNewInvitationToken:",  v10);
    -[CKDatabase addOperation:](self, "addOperation:", v19);

    goto LABEL_11;
  }

  id v21 = sub_10003E9DC();
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_10003E514();
  }

  if (v16)
  {
    id v19 = (CKModifyRecordsOperation *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CKErrorDomain,  12LL,  0LL));
    (*((void (**)(id, void, void, CKModifyRecordsOperation *))v16 + 2))(v16, 0LL, 0LL, v19);
LABEL_11:
  }
}

- (id)_fetchPlaceholderRecordData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = sub_1000372A8;
  __int128 v26 = sub_1000372B8;
  id v27 = (id)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v7);
  BOOL v8 = objc_alloc(&OBJC_CLASS___CKRecordID);
  id v9 = -[CKRecordID initWithRecordName:zoneID:](v8, "initWithRecordName:zoneID:", MSPlaceholderRecordName, v6);
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  id v18 = sub_10003B81C;
  id v19 = &unk_100062C18;
  id v21 = &v22;
  BOOL v10 = dispatch_semaphore_create(0LL);
  id v20 = v10;
  -[CKDatabase fetchRecordWithID:withOptions:completion:]( self,  "fetchRecordWithID:withOptions:completion:",  v9,  0LL,  &v16);
  dispatch_time_t v11 = dispatch_time(0LL, 1000000000LL * MSMaxWaitInSecondsForFetchDataFromCloudKit);
  if (dispatch_semaphore_wait(v10, v11))
  {
    id v12 = sub_10003E9DC();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003E540();
    }

    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSCloudKitErrorDomain,  10LL,  0LL,  v16,  v17,  v18,  v19));
    }
  }

  id v14 = objc_msgSend((id)v23[5], "copy", v16, v17, v18, v19);

  _Block_object_dispose(&v22, 8);
  return v14;
}

- (id)_fetchRefreshTokenForRecordZoneID:(id)a3
{
  id v4 = a3;
  if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)3) {
    id v5 = @"sharedDatabaseKeyRefreshTokens";
  }
  else {
    id v5 = @"privateDatabaseKeyRefreshTokens";
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForDefaultWithCustomClass:v5]);

  if (v7)
  {
    id v8 = sub_10003E9DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = CKDatabaseScopeString(-[CKDatabase databaseScope](self, "databaseScope"));
      dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138412290;
      id v25 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%@] There exists an entry for Change token",  buf,  0xCu);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
    id v13 = (CKFetchRecordZoneChangesConfiguration *)objc_claimAutoreleasedReturnValue([v12 objectForDefaultWithCustomClass:v5]);

    id v15 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v14);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10003BB54;
    v21[3] = &unk_100062C40;
    id v22 = v4;
    id v16 = v15;
    id v23 = v16;
    -[CKFetchRecordZoneChangesConfiguration na_each:](v13, "na_each:", v21);
    uint64_t v17 = v23;
    id v18 = v16;
  }

  else
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___CKFetchRecordZoneChangesConfiguration);
    -[CKFetchRecordZoneChangesConfiguration setPreviousServerChangeToken:](v13, "setPreviousServerChangeToken:", 0LL);
    id v18 = (id)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v19);
    objc_msgSend(v18, "na_safeSetObject:forKey:", v13, v4);
  }

  return v18;
}

- (void)_updateServerChangeTokenMap:(id)a3 serverChangeToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)3) {
    id v8 = @"sharedDatabaseKeyRefreshTokens";
  }
  else {
    id v8 = @"privateDatabaseKeyRefreshTokens";
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForDefaultWithCustomClass:v8]);
  id v11 = [v10 mutableCopy];

  if (!v11) {
    id v11 = (id)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v12);
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
  objc_msgSend(v11, "na_safeSetObject:forKey:", v7, v13);

  id v14 = sub_10003E9DC();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = CKDatabaseScopeString(-[CKDatabase databaseScope](self, "databaseScope"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    int v20 = 138412546;
    id v21 = v17;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%@] Updating Server Change Token Map %@",  (uint8_t *)&v20,  0x16u);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  id v19 = [v11 copy];
  [v18 setObjectWithCustomClass:v19 forDefault:v8];
}

- (void)_handleCKErrorChangeTokenExpired:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v23 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
    -[CKDatabase _purgeDeletedZonesFromDefaults:](self, "_purgeDeletedZonesFromDefaults:", v8);

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003BEF4;
    block[3] = &unk_1000627B0;
    void block[4] = self;
    id v21 = v6;
    id v22 = v7;
    dispatch_async(v10, block);
  }

  else
  {
    id v11 = sub_10003E9DC();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003E5CC(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)handleCKErrorMissingManateeIdentity:(id)a3 homeUserIDS:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v8 = sub_10003E9DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003E63C();
    }
    goto LABEL_12;
  }

  if ((id)-[CKDatabase databaseScope](self, "databaseScope") != (id)3)
  {
    if ((id)-[CKDatabase databaseScope](self, "databaseScope") != (id)2) {
      goto LABEL_13;
    }
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 objectForDefaultWithCustomClass:@"privateDatabaseData"]);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10003C130;
    v17[3] = &unk_100060D00;
    id v11 = v6;
    id v18 = v11;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s na_firstObjectPassingTest:](v9, "na_firstObjectPassingTest:", v17));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 homeUserID]);

    if (v13)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
      -[CKDatabase _handleManateeLossOnPrivateDatabase:homeUserID:]( self,  "_handleManateeLossOnPrivateDatabase:homeUserID:",  v11,  v14);

      uint64_t v15 = -[MSDDataRefresh initWithReason:withDelay:]( objc_alloc(&OBJC_CLASS___MSDDataRefresh),  "initWithReason:withDelay:",  7LL,  90.0);
      -[MSDDataRefresh performRefreshWithCompletion:](v15, "performRefreshWithCompletion:", 0LL);
    }

    else
    {
      id v16 = sub_10003E9DC();
      uint64_t v15 = (MSDDataRefresh *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
        sub_10003E668(v11, (os_log_s *)v15);
      }
    }

LABEL_12:
    goto LABEL_13;
  }

  -[CKDatabase _handleManateeLossOnSharedDatabase:completion:]( self,  "_handleManateeLossOnSharedDatabase:completion:",  v6,  &stru_100062C60);
LABEL_13:
}

- (void)handleCKErrorMissingManateeIdentity:(id)a3 homeUserID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10003E9DC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = CKDatabaseScopeString(-[CKDatabase databaseScope](self, "databaseScope"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      int v19 = 138412290;
      uint64_t v20 = (uint64_t)v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Manatee loss detected on Database scope: %@",  (uint8_t *)&v19,  0xCu);
    }

    id v13 = sub_10003E9DC();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
      int v19 = 138412546;
      uint64_t v20 = (uint64_t)v15;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Attempting to recover from Manatee loss for %@ and homeUserID %@",  (uint8_t *)&v19,  0x16u);
    }

    if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)3)
    {
      -[CKDatabase _handleManateeLossOnSharedDatabase:completion:]( self,  "_handleManateeLossOnSharedDatabase:completion:",  v6,  &stru_100062C80);
    }

    else if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)2)
    {
      -[CKDatabase _handleManateeLossOnPrivateDatabase:homeUserID:]( self,  "_handleManateeLossOnPrivateDatabase:homeUserID:",  v6,  v7);
      id v16 = sub_10003E9DC();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 134217984;
        uint64_t v20 = 90LL;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Scheduling PrivateDatabase refresh after %lu sec",  (uint8_t *)&v19,  0xCu);
      }

      id v18 = -[MSDDataRefresh initWithReason:withDelay:]( objc_alloc(&OBJC_CLASS___MSDDataRefresh),  "initWithReason:withDelay:",  7LL,  90.0);
      -[MSDDataRefresh performRefreshWithCompletion:](v18, "performRefreshWithCompletion:", 0LL);
    }
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003E63C();
    }
  }
}

- (void)_handleManateeLossOnSharedDatabase:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[CKShare initWithRecordZoneID:](objc_alloc(&OBJC_CLASS___CKShare), "initWithRecordZoneID:", v7);

  id v9 = sub_10003E9DC();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attempting to delete shareID %@", buf, 0xCu);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKShare recordID](v8, "recordID"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003C5D0;
  v13[3] = &unk_100062128;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  -[CKDatabase deleteRecordWithID:missingManateeIdentity:withOptions:completion:]( self,  "deleteRecordWithID:missingManateeIdentity:withOptions:completion:",  v11,  1LL,  0LL,  v13);
}

- (void)_handleManateeLossOnPrivateDatabase:(id)a3 homeUserID:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10003C7E4;
    v9[3] = &unk_100062CD0;
    v9[4] = self;
    id v10 = v5;
    -[CKDatabase deleteRecordZone:withOptions:completion:]( self,  "deleteRecordZone:withOptions:completion:",  v10,  0LL,  v9);
  }

  else
  {
    id v7 = sub_10003E9DC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[CKDatabase(MSDCloudDatabase) _handleManateeLossOnPrivateDatabase:homeUserID:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Failed to recover from Manatee Loss - NIL recordZoneID",  buf,  0xCu);
    }
  }
}

- (void)_populateRecordZoneWithCachedInfo:(id)a3 cachedInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "na_firstObjectPassingTest:", &stru_100062D10));
  uint64_t v11 = v10;
  __int16 v64 = v6;
  if (v10)
  {
    id v59 = self;
    v81[0] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 homeUserID]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
    v82[0] = v13;
    v81[1] = kCKDatabaseAccessUserInfoHomeIDKey;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 homeID]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
    v82[1] = v15;
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v82,  v81,  2LL));

    uint64_t v17 = MSPlaceholderRecordName;
    uint64_t v18 = MSPlaceholderRecordType;
    int v19 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
    __int16 v62 = (void *)objc_claimAutoreleasedReturnValue( +[CKRecord createRecordWithName:recordType:recordZone:]( &OBJC_CLASS___CKRecord,  "createRecordWithName:recordType:recordZone:",  v17,  v18,  v19));

    id v20 = sub_10003E9DC();
    __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v11 homeID]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v11 homeUserID]);
      *(_DWORD *)buf = 138412546;
      v78 = v22;
      __int16 v79 = 2112;
      v80 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Placeholder recordInfo HomeID: %@, HomeUserID: %@",  buf,  0x16u);
    }

    uint64_t v24 = MSHomeParticipantHomeIdentifier;
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v11 homeID]);
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 UUIDString]);
    [v62 setRecordFieldForKey:v24 value:v26];

    uint64_t v27 = MSHomeParticipantHomeUserIdentifier;
    __int16 v60 = v11;
    int v28 = (void *)objc_claimAutoreleasedReturnValue([v11 homeUserID]);
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 UUIDString]);
    [v62 setRecordFieldForKey:v27 value:v29];

    objc_msgSend(v9, "na_safeAddObject:", v62);
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    id v61 = v7;
    id obj = v7;
    id v30 = v6;
    id v31 = &APSEnvironmentProduction_ptr;
    id v69 = [obj countByEnumeratingWithState:&v72 objects:v76 count:16];
    if (v69)
    {
      uint64_t v68 = *(void *)v73;
      uint64_t v32 = MSDefaultServiceRecordType;
      uint64_t v67 = MSServiceAccountRecordType;
      uint64_t v65 = MSDefaultServiceRecordName;
      v63 = v16;
      do
      {
        for (i = 0LL; i != v69; i = (char *)i + 1)
        {
          uint64_t v34 = v32;
          if (*(void *)v73 != v68) {
            objc_enumerationMutation(obj);
          }
          id v35 = *(void **)(*((void *)&v72 + 1) + 8LL * (void)i);
          id v36 = sub_10003E9DC();
          id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue([v35 service]);
            id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 serviceID]);
            *(_DWORD *)buf = 138412290;
            v78 = v39;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Repopulating info for %@", buf, 0xCu);
          }

          id v40 = (void *)objc_claimAutoreleasedReturnValue([v35 recordType]);
          uint64_t v32 = v34;
          unsigned int v41 = [v40 isEqualToString:v34];

          if (v41)
          {
            id v42 = v31[80];
            uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v30 zoneID]);
            uint64_t v44 = objc_claimAutoreleasedReturnValue([v42 createRecordWithName:v65 recordType:v34 recordZone:v43]);
            uint64_t v45 = v34;
            id v46 = (void *)v44;
          }

          else
          {
            id v47 = (void *)objc_claimAutoreleasedReturnValue([v35 recordType]);
            unsigned int v48 = [v47 isEqualToString:v67];

            if (!v48) {
              continue;
            }
            __int128 v49 = v31[80];
            uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v35 service]);
            __int16 v50 = v9;
            id v51 = (void *)objc_claimAutoreleasedReturnValue([v43 serviceID]);
            uint8_t v52 = (void *)objc_claimAutoreleasedReturnValue([v51 UUIDString]);
            v53 = (void *)objc_claimAutoreleasedReturnValue([v30 zoneID]);
            __int128 v54 = v49;
            uint64_t v45 = v67;
            id v46 = (void *)objc_claimAutoreleasedReturnValue([v54 createRecordWithName:v52 recordType:v67 recordZone:v53]);

            id v30 = v64;
            id v31 = &APSEnvironmentProduction_ptr;

            id v9 = v50;
            id v16 = v63;
          }

          __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v35 service]);
          [v46 populateCKRecordInfo:v55 userInfo:v16 recordType:v45];

          objc_msgSend(v9, "na_safeAddObject:", v46);
          uint64_t v32 = v34;
        }

        id v69 = [obj countByEnumeratingWithState:&v72 objects:v76 count:16];
      }

      while (v69);
    }

    if ([v9 count])
    {
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472LL;
      v70[2] = sub_10003D2BC;
      v70[3] = &unk_100062D38;
      v71 = v9;
      -[CKDatabase modifyCKRecordWithRecordsToSave:recordIDSToDelete:missingManateeIdentity:withAttribution:withOptions:completion:]( v59,  "modifyCKRecordWithRecordsToSave:recordIDSToDelete:missingManateeIdentity:withAttribution:withOptions:completion:",  v71,  0LL,  0LL,  0LL,  0LL,  v70);
      __int128 v56 = v71;
    }

    else
    {
      id v58 = sub_10003E9DC();
      __int128 v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_10003E890();
      }
    }

    uint64_t v11 = v60;
    id v7 = v61;
  }

  else
  {
    id v57 = sub_10003E9DC();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "There are no cached services configured on account",  buf,  2u);
    }
  }
}

- (void)_checkShareStatusIfApplicable:(id)a3
{
  id v4 = a3;
  if ((id)-[CKDatabase databaseScope](self, "databaseScope") == (id)2)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentHome]);

    if (v6
      && ([v6 isCurrentUserHomeOwner] & 1) == 0
      && ([v6 isCurrentUserRestrictedGuest] & 1) == 0)
    {
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___CKShare);
      id v8 = v4;
      if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0) {
        id v9 = v8;
      }
      else {
        id v9 = 0LL;
      }
      id v10 = v9;

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 participants]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "na_firstObjectPassingTest:", &stru_100062D58));

      id v13 = sub_10003E9DC();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v15)
        {
          uint64_t v16 = CKStringFromParticipantInvitationTokenStatus([v12 invitationTokenStatus]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          *(_DWORD *)buf = 138412290;
          __int16 v21 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "There exists a participant whose invitation token status : %@",  buf,  0xCu);
        }

        [v12 setWantsNewInvitationToken:1];
        [v10 addParticipant:v12];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_10003D628;
        v18[3] = &unk_100062DC0;
        int v19 = (os_log_s *)v8;
        -[CKDatabase saveRecord:withOptions:completion:](self, "saveRecord:withOptions:completion:", v10, 0LL, v18);
        id v14 = v19;
      }

      else if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "No eligible participant on the share (NeedsNewToken - NO)",  buf,  2u);
      }
    }
  }
}

- (id)operationConfiguration
{
  return (id)objc_opt_new(&OBJC_CLASS___CKOperationConfiguration, a2);
}

- (void)_notifyObserversDataChanged:(id)a3 cachedData:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_10003E9DC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Posting notification a property changed on service object",  v10,  2u);
  }

  notify_post((const char *)[kMediaSetupServicesChanged UTF8String]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MSDServicesUpdated servicesUpdated:cachedData:]( &OBJC_CLASS___MSDServicesUpdated,  "servicesUpdated:cachedData:",  v6,  v5));

  [v9 processChangesInServices];
}

- (BOOL)_attemptToRecordServiceRequestLapse:(id)a3 fromRecords:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  uint64_t v8 = kMissedServiceRequestKey;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForDefault:kMissedServiceRequestKey]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kMissedServiceRequestServiceKey]);
  uint64_t v11 = v10;
  if (v10)
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10003DBA8;
    v32[3] = &unk_100060D00;
    id v12 = v10;
    id v33 = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "na_firstObjectPassingTest:", v32));
    if (v13)
    {
      id v14 = sub_10003E9DC();
      BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Noticed a request for a missing service while adding it.",  buf,  2u);
      }

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
      [v16 removeObjectForDefault:v8];

      id v30 = v6;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_firstObjectPassingTest:", &stru_100062DE0));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kMissedServiceRequestDateLastRequestedKey]);
      int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 creationDate]);
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v19 components:16 fromDate:v18 toDate:v20 options:0]);

      uint64_t v22 = (uint64_t)[v21 day];
      BOOL v23 = v22 < 2;
      if (v22 < 2)
      {
        id v27 = [[MSServiceRequestLapseEvent alloc] initWithServiceID:v12];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v17 creationDate]);
        [v27 setRecordCreationDate:v24];

        id v25 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kMissedServiceRequestTimeLastRequestedKey]);
        objc_msgSend(v27, "setTimeOfRequest:", objc_msgSend(v25, "unsignedLongLongValue"));

        [v27 setDateOfRequest:v18];
        [v27 setEndTime:mach_absolute_time()];
        +[MSAnalytics sendServiceRequestLapseEvent:](&OBJC_CLASS___MSAnalytics, "sendServiceRequestLapseEvent:", v27);
      }

      else
      {
        id v26 = sub_10003E9DC();
        id v27 = (id)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v27,  OS_LOG_TYPE_DEFAULT,  "Request for service over a day old. Skipping noting it as a lapse event.",  buf,  2u);
        }
      }

      id v6 = v30;
    }

    else
    {
      BOOL v23 = 0;
    }
  }

  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

@end