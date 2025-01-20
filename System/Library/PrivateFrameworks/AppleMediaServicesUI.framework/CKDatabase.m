@interface CKDatabase
+ (id)_changeTokenKeyForDatabaseScope:(int64_t)a3 recordZoneName:(id)a4;
+ (id)_fetchChangeTokenWithDatabaseScope:(int64_t)a3;
+ (id)_fetchChangeTokenWithDatabaseScope:(int64_t)a3 recordZoneName:(id)a4;
+ (id)_stringForDatabaseScope:(int64_t)a3;
+ (id)_zoneIdentifiersWithExpiredTokensFrom:(id)a3 andErrors:(id)a4;
- (BOOL)_handleError:(id)a3 andErrors:(id)a4;
- (BOOL)isPrivateDatabase;
- (BOOL)isPublicDatabase;
- (BOOL)isSharedDatabase;
- (NSString)hashedDescription;
- (id)_fetchChangedRecordZonesWithServerChangeToken:(id)a3;
- (id)_fetchChangedRecordsInRecordZonesWithWithRecordZoneIDs:(id)a3 changeTokens:(id)a4;
- (id)_subscribeWithIdentifier:(id)a3 recordZoneIdentifier:(id)a4 attempt:(unint64_t)a5;
- (id)addRecordsToSave:(id)a3 recordIdentifiersToDelete:(id)a4;
- (id)createRecordWithRecordName:(id)a3 recordType:(id)a4 recordZone:(id)a5;
- (id)createRecordZoneWithRecordZoneName:(id)a3;
- (id)deleteRecordWithRecordIdentifier:(id)a3;
- (id)deleteRecordWithRecordIdentifier:(id)a3 missingEncryptionIdentity:(BOOL)a4;
- (id)deleteRecordZonesWithRecordZoneIdentifiers:(id)a3;
- (id)fetchChangedRecordZones;
- (id)fetchChangedRecordsInRecordZonesWithRecordZoneIdentifiers:(id)a3;
- (id)fetchRecordWithName:(id)a3 zoneIdentifier:(id)a4;
- (id)fetchRecordWithRecordIdentifier:(id)a3;
- (id)fetchRecordZones;
- (id)saveRecord:(id)a3;
- (id)saveRecordZone:(id)a3;
- (id)shareForRecordZoneIdentifier:(id)a3;
- (id)subscribeWithIdentifier:(id)a3;
- (id)subscribeWithIdentifier:(id)a3 recordZoneIdentifier:(id)a4;
- (unint64_t)type;
- (void)persistChangedRecordZonesChangeToken:(id)a3;
- (void)persistChangedRecordsChangeToken:(id)a3 forRecordZoneIdentifier:(id)a4;
@end

@implementation CKDatabase

- (BOOL)isPrivateDatabase
{
  return -[CKDatabase type](self, "type") == 0;
}

- (BOOL)isPublicDatabase
{
  return (id)-[CKDatabase type](self, "type") == (id)1;
}

- (BOOL)isSharedDatabase
{
  return (id)-[CKDatabase type](self, "type") == (id)2;
}

- (unint64_t)type
{
  CKDatabaseScope v2 = -[CKDatabase databaseScope](self, "databaseScope");
  if (v2 == CKDatabaseScopeShared) {
    return 2LL;
  }
  else {
    return v2 == CKDatabaseScopePublic;
  }
}

- (NSString)hashedDescription
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p type = %ld>",  objc_opt_class(self),  self,  -[CKDatabase type](self, "type"));
}

- (id)addRecordsToSave:(id)a3 recordIdentifiersToDelete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    v8 = objc_alloc_init(&OBJC_CLASS___AMSPromise);
    id v9 = v6;
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
      v11 = (AMSCloudDataSavedRecordsResult *)v9;
    }
    else {
      v11 = 0LL;
    }

    id v12 = v7;
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
      id v14 = v12;
    }
    else {
      id v14 = 0LL;
    }

    v15 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation),  "initWithRecordsToSave:recordIDsToDelete:",  v11,  v14);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10015783C;
    v19[3] = &unk_1001B43A8;
    v20 = v8;
    v16 = v8;
    -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v15, "setModifyRecordsCompletionBlock:", v19);
    -[CKModifyRecordsOperation setSavePolicy:](v15, "setSavePolicy:", 0LL);
    -[CKModifyRecordsOperation setAtomic:](v15, "setAtomic:", 0LL);
    -[CKDatabase addOperation:](self, "addOperation:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AMSPromise catchWithBlock:](v16, "catchWithBlock:", &stru_1001B43E8));
  }

  else
  {
    v11 = -[AMSCloudDataSavedRecordsResult initWithSavedRecords:deletedRecords:error:]( objc_alloc(&OBJC_CLASS___AMSCloudDataSavedRecordsResult),  "initWithSavedRecords:deletedRecords:error:",  v6,  v7,  0LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithResult:](&OBJC_CLASS___AMSPromise, "promiseWithResult:", v11));
  }

  return v17;
}

- (id)createRecordWithRecordName:(id)a3 recordType:(id)a4 recordZone:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___CKRecordZone);
  if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0) {
    id v11 = v7;
  }
  else {
    id v11 = 0LL;
  }

  id v12 = objc_alloc(&OBJC_CLASS___CKRecordID);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneID]);
  id v14 = -[CKRecordID initWithRecordName:zoneID:](v12, "initWithRecordName:zoneID:", v9, v13);

  v15 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  v8,  v14);
  return v15;
}

- (id)createRecordZoneWithRecordZoneName:(id)a3
{
  id v3 = a3;
  v4 = -[CKRecordZone initWithZoneName:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneName:", v3);

  return v4;
}

- (id)deleteRecordWithRecordIdentifier:(id)a3
{
  return -[CKDatabase deleteRecordWithRecordIdentifier:missingEncryptionIdentity:]( self,  "deleteRecordWithRecordIdentifier:missingEncryptionIdentity:",  a3,  0LL);
}

- (id)deleteRecordWithRecordIdentifier:(id)a3 missingEncryptionIdentity:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___CKRecordID);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    id v8 = v6;
  }
  else {
    id v8 = 0LL;
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___AMSPromise);
  uint64_t v10 = objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation);
  id v18 = v8;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  id v12 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( v10,  "initWithRecordsToSave:recordIDsToDelete:",  0LL,  v11);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100157C10;
  v16[3] = &unk_1001B43A8;
  v17 = v9;
  uint64_t v13 = v9;
  -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v12, "setModifyRecordsCompletionBlock:", v16);
  -[CKModifyRecordsOperation setMarkAsParticipantNeedsNewInvitationToken:]( v12,  "setMarkAsParticipantNeedsNewInvitationToken:",  v4);
  -[CKDatabase addOperation:](self, "addOperation:", v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSPromise catchWithBlock:](v13, "catchWithBlock:", &stru_1001B4408));

  return v14;
}

- (id)deleteRecordZonesWithRecordZoneIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }

  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___AMSPromise);
  id v8 = -[CKModifyRecordZonesOperation initWithRecordZonesToSave:recordZoneIDsToDelete:]( objc_alloc(&OBJC_CLASS___CKModifyRecordZonesOperation),  "initWithRecordZonesToSave:recordZoneIDsToDelete:",  0LL,  v6);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100157E3C;
  v12[3] = &unk_1001B43A8;
  uint64_t v13 = v7;
  id v9 = v7;
  -[CKModifyRecordZonesOperation setModifyRecordZonesCompletionBlock:](v8, "setModifyRecordZonesCompletionBlock:", v12);
  -[CKDatabase addOperation:](self, "addOperation:", v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSPromise catchWithBlock:](v9, "catchWithBlock:", &stru_1001B4428));

  return v10;
}

- (id)fetchChangedRecordsInRecordZonesWithRecordZoneIdentifiers:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ams_mapWithTransformIgnoresNil:", &stru_1001B4468));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100158040;
  v8[3] = &unk_1001B4490;
  v8[4] = self;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_invertedDictionaryUsingTransformIgnoresNil:", v8));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CKDatabase _fetchChangedRecordsInRecordZonesWithWithRecordZoneIDs:changeTokens:]( self,  "_fetchChangedRecordsInRecordZonesWithWithRecordZoneIDs:changeTokens:",  v4,  v5));

  return v6;
}

- (id)fetchChangedRecordZones
{
  id v3 = objc_msgSend((id)objc_opt_class(self), "_fetchChangeTokenWithDatabaseScope:", -[CKDatabase scope](self, "scope"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[CKDatabase _fetchChangedRecordZonesWithServerChangeToken:]( self,  "_fetchChangedRecordZonesWithServerChangeToken:",  v4));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100158188;
  v9[3] = &unk_1001B44B8;
  v9[4] = self;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 catchWithBlock:v9]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 catchWithBlock:&stru_1001B44D8]);
  return v7;
}

- (id)fetchRecordWithName:(id)a3 zoneIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___CKRecordZoneID);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
    id v9 = v6;
  }
  else {
    id v9 = 0LL;
  }

  uint64_t v10 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  v7,  v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase fetchRecordWithRecordIdentifier:](self, "fetchRecordWithRecordIdentifier:", v10));

  return v11;
}

- (id)fetchRecordWithRecordIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CKRecordID);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___AMSPromise);
  uint64_t v8 = objc_alloc(&OBJC_CLASS___CKFetchRecordsOperation);
  id v21 = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  uint64_t v10 = -[CKFetchRecordsOperation initWithRecordIDs:](v8, "initWithRecordIDs:", v9);

  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_100158480;
  id v18 = &unk_1001B4500;
  id v19 = v6;
  v20 = v7;
  id v11 = v7;
  id v12 = v6;
  -[CKFetchRecordsOperation setFetchRecordsCompletionBlock:](v10, "setFetchRecordsCompletionBlock:", &v15);
  -[CKDatabase addOperation:](self, "addOperation:", v10, v15, v16, v17, v18);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[AMSPromise catchWithBlock:](v11, "catchWithBlock:", &stru_1001B4520));

  return v13;
}

- (id)fetchRecordZones
{
  id v3 = objc_alloc_init(&OBJC_CLASS___AMSPromise);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CKFetchRecordZonesOperation fetchAllRecordZonesOperation]( &OBJC_CLASS___CKFetchRecordZonesOperation,  "fetchAllRecordZonesOperation"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100158740;
  v9[3] = &unk_1001B4548;
  uint64_t v5 = v3;
  uint64_t v10 = v5;
  [v4 setFetchRecordZonesCompletionBlock:v9];
  -[CKDatabase addOperation:](self, "addOperation:", v4);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10015885C;
  v8[3] = &unk_1001B4598;
  v8[4] = self;
  -[AMSPromise addSuccessBlock:](v5, "addSuccessBlock:", v8);
  id v6 = v5;

  return v6;
}

- (void)persistChangedRecordZonesChangeToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___AMSTokenStorage);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[AMSTokenStorage loadWithName:](v5, "loadWithName:", @"AMSCloudKitDatabaseChangeTokens"));
  id v7 = (void *)v6;
  uint64_t v8 = &__NSDictionary0__struct;
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  id v9 = v8;

  id v10 = [v9 mutableCopy];
  if (v4)
  {
    id v26 = 0LL;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v26));
    id v12 = v26;
    if (!v11)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v13) {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = objc_opt_class(self);
        uint64_t v15 = AMSLogKey(v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v15);
        uint64_t v16 = AMSHashIfNeeded(self);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v16);
        uint64_t v17 = AMSHashIfNeeded(v12);
        uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
        *(_DWORD *)buf = 138544130;
        uint64_t v28 = v22;
        __int16 v29 = 2114;
        v30 = v24;
        __int16 v31 = 2114;
        v32 = v23;
        __int16 v33 = 2114;
        uint64_t v34 = v18;
        id v19 = (void *)v18;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to archive a database change token. database = %{public}@ | error = %{public}@",  buf,  0x2Au);
      }
    }
  }

  else
  {
    id v11 = 0LL;
  }

  id v20 = objc_msgSend((id)objc_opt_class(self), "_stringForDatabaseScope:", -[CKDatabase scope](self, "scope"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  [v10 setObject:v11 forKeyedSubscript:v21];

  if (([v9 isEqualToDictionary:v10] & 1) == 0)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100158B90;
    v25[3] = &unk_1001B45C0;
    v25[4] = self;
    -[AMSTokenStorage save:name:completionHandler:]( v5,  "save:name:completionHandler:",  v10,  @"AMSCloudKitDatabaseChangeTokens",  v25);
  }
}

- (void)persistChangedRecordsChangeToken:(id)a3 forRecordZoneIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v8) {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class(self);
    uint64_t v11 = AMSLogKey(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = AMSHashIfNeeded(v7);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 138544130;
    uint64_t v41 = v10;
    __int16 v42 = 2114;
    v43 = v12;
    __int16 v44 = 2112;
    id v45 = v6;
    __int16 v46 = 2114;
    v47 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Setting a change token. changeToken = %@ | zoneIdentifier = %{public}@",  buf,  0x2Au);
  }

  uint64_t v15 = objc_alloc_init(&OBJC_CLASS___AMSTokenStorage);
  uint64_t v16 = objc_claimAutoreleasedReturnValue(-[AMSTokenStorage loadWithName:](v15, "loadWithName:", @"AMSCloudKitRecordZoneChangeTokens"));
  uint64_t v17 = (void *)v16;
  uint64_t v18 = &__NSDictionary0__struct;
  if (v16) {
    uint64_t v18 = (void *)v16;
  }
  id v19 = v18;

  id v20 = [v19 mutableCopy];
  if (v6)
  {
    id v39 = 0LL;
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &v39));
    id v22 = v39;
    if (!v21)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v23) {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = objc_opt_class(self);
        uint64_t v25 = AMSLogKey(v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue(v25);
        id v33 = -[CKDatabase scope](self, "scope");
        uint64_t v26 = AMSHashIfNeeded(v7);
        v35 = (void *)objc_claimAutoreleasedReturnValue(v26);
        uint64_t v27 = AMSHashIfNeeded(v22);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v27);
        *(_DWORD *)buf = 138544386;
        uint64_t v41 = v34;
        __int16 v42 = 2114;
        v43 = v36;
        __int16 v44 = 2048;
        id v45 = v33;
        __int16 v46 = 2114;
        v47 = v35;
        __int16 v48 = 2114;
        v49 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to archive a record zone change token. databaseScope = %ld | zoneName = %{publ ic}@ | error = %{public}@",  buf,  0x34u);
      }
    }
  }

  else
  {
    id v21 = 0LL;
  }

  uint64_t v28 = (void *)objc_opt_class(self);
  id v29 = -[CKDatabase scope](self, "scope");
  v30 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v28 _changeTokenKeyForDatabaseScope:v29 recordZoneName:v30]);

  [v20 setObject:v21 forKeyedSubscript:v31];
  if (([v19 isEqualToDictionary:v20] & 1) == 0)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_1001590B4;
    v37[3] = &unk_1001B45E8;
    v37[4] = self;
    id v38 = v7;
    -[AMSTokenStorage save:name:completionHandler:]( v15,  "save:name:completionHandler:",  v20,  @"AMSCloudKitRecordZoneChangeTokens",  v37);
  }
}

- (id)saveRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CKRecord);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___AMSPromise);
  uint64_t v8 = objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation);
  id v16 = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  uint64_t v10 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( v8,  "initWithRecordsToSave:recordIDsToDelete:",  v9,  0LL);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10015939C;
  v14[3] = &unk_1001B43A8;
  uint64_t v15 = v7;
  uint64_t v11 = v7;
  -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v10, "setModifyRecordsCompletionBlock:", v14);
  -[CKDatabase addOperation:](self, "addOperation:", v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[AMSPromise catchWithBlock:](v11, "catchWithBlock:", &stru_1001B4608));

  return v12;
}

- (id)saveRecordZone:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CKRecordZone);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___AMSPromise);
  uint64_t v8 = objc_alloc(&OBJC_CLASS___CKModifyRecordZonesOperation);
  id v16 = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  uint64_t v10 = -[CKModifyRecordZonesOperation initWithRecordZonesToSave:recordZoneIDsToDelete:]( v8,  "initWithRecordZonesToSave:recordZoneIDsToDelete:",  v9,  0LL);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100159620;
  v14[3] = &unk_1001B43A8;
  uint64_t v15 = v7;
  uint64_t v11 = v7;
  -[CKModifyRecordZonesOperation setModifyRecordZonesCompletionBlock:](v10, "setModifyRecordZonesCompletionBlock:", v14);
  -[CKDatabase addOperation:](self, "addOperation:", v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[AMSPromise catchWithBlock:](v11, "catchWithBlock:", &stru_1001B4628));

  return v12;
}

- (id)shareForRecordZoneIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___CKRecordZoneID);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  id v6 = -[CKShare initWithRecordZoneID:](objc_alloc(&OBJC_CLASS___CKShare), "initWithRecordZoneID:", v5);
  return v6;
}

- (id)subscribeWithIdentifier:(id)a3
{
  return -[CKDatabase _subscribeWithIdentifier:recordZoneIdentifier:attempt:]( self,  "_subscribeWithIdentifier:recordZoneIdentifier:attempt:",  a3,  0LL,  0LL);
}

- (id)subscribeWithIdentifier:(id)a3 recordZoneIdentifier:(id)a4
{
  return -[CKDatabase _subscribeWithIdentifier:recordZoneIdentifier:attempt:]( self,  "_subscribeWithIdentifier:recordZoneIdentifier:attempt:",  a3,  a4,  0LL);
}

- (id)_subscribeWithIdentifier:(id)a3 recordZoneIdentifier:(id)a4 attempt:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v10) {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class(self);
    uint64_t v13 = AMSLogKey(v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = AMSHashIfNeeded(self);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138543874;
    uint64_t v40 = v12;
    __int16 v41 = 2114;
    __int16 v42 = v14;
    __int16 v43 = 2114;
    __int16 v44 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Setting up a database subscription. database = %{public}@",  buf,  0x20u);
  }

  uint64_t v17 = objc_alloc_init(&OBJC_CLASS___CKNotificationInfo);
  -[CKNotificationInfo setShouldSendContentAvailable:](v17, "setShouldSendContentAvailable:", 1LL);
  id v18 = v9;
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___CKRecordZoneID);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0) {
    id v20 = v18;
  }
  else {
    id v20 = 0LL;
  }

  if (v20) {
    id v21 = -[CKRecordZoneSubscription initWithZoneID:subscriptionID:]( objc_alloc(&OBJC_CLASS___CKRecordZoneSubscription),  "initWithZoneID:subscriptionID:",  v20,  v8);
  }
  else {
    id v21 = -[CKDatabaseSubscription initWithSubscriptionID:]( objc_alloc(&OBJC_CLASS___CKDatabaseSubscription),  "initWithSubscriptionID:",  v8);
  }
  id v22 = v21;
  -[CKRecordZoneSubscription setNotificationInfo:](v21, "setNotificationInfo:", v17);
  v23 = objc_alloc_init(&OBJC_CLASS___AMSPromise);
  v24 = objc_alloc(&OBJC_CLASS___CKModifySubscriptionsOperation);
  id v38 = v22;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));
  uint64_t v26 = -[CKModifySubscriptionsOperation initWithSubscriptionsToSave:subscriptionIDsToDelete:]( v24,  "initWithSubscriptionsToSave:subscriptionIDsToDelete:",  v25,  0LL);

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100159ACC;
  v36[3] = &unk_1001B43A8;
  v37 = v23;
  uint64_t v27 = v23;
  -[CKModifySubscriptionsOperation setModifySubscriptionsCompletionBlock:]( v26,  "setModifySubscriptionsCompletionBlock:",  v36);
  -[CKDatabase addOperation:](self, "addOperation:", v26);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100159B8C;
  v32[3] = &unk_1001B4678;
  v32[4] = self;
  id v33 = v8;
  id v34 = v18;
  unint64_t v35 = a5;
  id v28 = v18;
  id v29 = v8;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[AMSPromise continueWithBlock:](v27, "continueWithBlock:", v32));

  return v30;
}

+ (id)_changeTokenKeyForDatabaseScope:(int64_t)a3 recordZoneName:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _stringForDatabaseScope:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%@", v7, v6));

  return v8;
}

- (id)_fetchChangedRecordZonesWithServerChangeToken:(id)a3
{
  id v4 = a3;
  id v5 = -[CKFetchDatabaseChangesOperation initWithPreviousServerChangeToken:]( objc_alloc(&OBJC_CLASS___CKFetchDatabaseChangesOperation),  "initWithPreviousServerChangeToken:",  v4);

  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10015A260;
  v22[3] = &unk_1001B46A0;
  id v8 = v6;
  v23 = v8;
  -[CKFetchDatabaseChangesOperation setRecordZoneWithIDChangedBlock:](v5, "setRecordZoneWithIDChangedBlock:", v22);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10015A26C;
  v20[3] = &unk_1001B46A0;
  id v9 = v7;
  id v21 = v9;
  -[CKFetchDatabaseChangesOperation setRecordZoneWithIDWasDeletedBlock:](v5, "setRecordZoneWithIDWasDeletedBlock:", v20);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10015A278;
  v16[3] = &unk_1001B46C8;
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___AMSPromise);
  uint64_t v17 = v10;
  id v18 = v8;
  uint64_t v19 = v9;
  uint64_t v11 = v9;
  uint64_t v12 = v8;
  -[CKFetchDatabaseChangesOperation setFetchDatabaseChangesCompletionBlock:]( v5,  "setFetchDatabaseChangesCompletionBlock:",  v16);
  -[CKDatabase addOperation:](self, "addOperation:", v5);
  uint64_t v13 = v19;
  id v14 = v10;

  return v14;
}

- (id)_fetchChangedRecordsInRecordZonesWithWithRecordZoneIDs:(id)a3 changeTokens:(id)a4
{
  id v6 = a3;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_10015A64C;
  v50[3] = &unk_1001B4490;
  id v30 = a4;
  id v51 = v30;
  __int16 v31 = v6;
  id v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_invertedDictionaryUsingTransform:", v50));
  id v7 = -[CKFetchRecordZoneChangesOperation initWithRecordZoneIDs:configurationsByRecordZoneID:]( objc_alloc(&OBJC_CLASS___CKFetchRecordZoneChangesOperation),  "initWithRecordZoneIDs:configurationsByRecordZoneID:",  v6,  v29);
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_10015A6B8;
  v48[3] = &unk_1001B46F0;
  uint64_t v12 = v8;
  v49 = v12;
  -[CKFetchRecordZoneChangesOperation setRecordChangedBlock:](v7, "setRecordChangedBlock:", v48);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_10015A784;
  v46[3] = &unk_1001B4718;
  uint64_t v13 = v9;
  v47 = v13;
  -[CKFetchRecordZoneChangesOperation setRecordWithIDWasDeletedBlock:](v7, "setRecordWithIDWasDeletedBlock:", v46);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_10015A830;
  v41[3] = &unk_1001B4740;
  id v14 = v11;
  __int16 v42 = v14;
  uint64_t v15 = v12;
  __int16 v43 = v15;
  id v16 = v13;
  __int16 v44 = v16;
  uint64_t v17 = v10;
  id v45 = v17;
  -[CKFetchRecordZoneChangesOperation setRecordZoneFetchCompletionBlock:](v7, "setRecordZoneFetchCompletionBlock:", v41);
  id v18 = objc_alloc_init(&OBJC_CLASS___AMSPromise);
  uint64_t v19 = AMSLogKey(v18);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  objc_initWeak(&location, self);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10015A8CC;
  v32[3] = &unk_1001B47A8;
  id v21 = v20;
  id v33 = v21;
  id v22 = v15;
  id v34 = v22;
  v23 = v16;
  unint64_t v35 = v23;
  v24 = v17;
  v36 = v24;
  uint64_t v25 = v14;
  v37 = v25;
  objc_copyWeak(&v39, &location);
  uint64_t v26 = v18;
  id v38 = v26;
  -[CKFetchRecordZoneChangesOperation setFetchRecordZoneChangesCompletionBlock:]( v7,  "setFetchRecordZoneChangesCompletionBlock:",  v32);
  -[CKDatabase addOperation:](self, "addOperation:", v7);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[AMSPromise catchWithBlock:](v26, "catchWithBlock:", &stru_1001B47C8));

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);

  return v27;
}

- (BOOL)_handleError:(id)a3 andErrors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v8 = self;
  v32 = v6;
  id v9 = [(id)objc_opt_class(self) _zoneIdentifiersWithExpiredTokensFrom:v6 andErrors:v7];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v10 countByEnumeratingWithState:&v33 objects:v45 count:16];
  id v12 = v11;
  if (v11)
  {
    id v29 = v7;
    uint64_t v13 = *(void *)v34;
    id v14 = &_s9JetEngine9JSPromiseV5valueSo7JSValueCvg_ptr;
    id v28 = v11;
    __int16 v31 = v8;
    uint64_t v30 = *(void *)v34;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)v15);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14[465] sharedAccountsDaemonConfig]);
        if (!v17) {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14[465] sharedConfig]);
        }
        id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = v12;
          id v20 = v10;
          uint64_t v21 = objc_opt_class(v8);
          uint64_t v22 = AMSLogKey(v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          uint64_t v24 = AMSHashIfNeeded(v32);
          uint64_t v25 = v14;
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v24);
          *(_DWORD *)buf = 138544130;
          uint64_t v38 = v21;
          uint64_t v10 = v20;
          id v12 = v19;
          __int16 v39 = 2114;
          uint64_t v40 = v23;
          __int16 v41 = 2114;
          uint64_t v42 = v16;
          __int16 v43 = 2114;
          __int16 v44 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Change Token Expired for zone %{public}@, removing. error = %{public}@",  buf,  0x2Au);

          id v14 = v25;
          uint64_t v13 = v30;
          id v8 = v31;
        }

        -[CKDatabase persistChangedRecordsChangeToken:forRecordZoneIdentifier:]( v8,  "persistChangedRecordsChangeToken:forRecordZoneIdentifier:",  0LL,  v16);
        uint64_t v15 = (char *)v15 + 1;
      }

      while (v12 != v15);
      id v12 = [v10 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }

    while (v12);

    -[CKDatabase persistChangedRecordZonesChangeToken:](v8, "persistChangedRecordZonesChangeToken:", 0LL);
    id v12 = v28;
    id v7 = v29;
  }

  else
  {
  }

  return v12 != 0LL;
}

+ (id)_zoneIdentifiersWithExpiredTokensFrom:(id)a3 andErrors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int16 v31 = v7;
  id v9 = [v7 mutableCopy];
  uint64_t v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  id v12 = v11;

  if (v6)
  {
    uint64_t v13 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  @"not_a_real_zone_name",  @"fake_owner");
    [v12 setObject:v6 forKeyedSubscript:v13];
  }

  v32 = v6;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v12 allKeys]);
  id v35 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v41 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)i);
        uint64_t v16 = v12;
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v15]);
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 underlyingErrors]);
        id v19 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v37;
          do
          {
            for (j = 0LL; j != v20; j = (char *)j + 1)
            {
              if (*(void *)v37 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = (void *)objc_claimAutoreleasedReturnValue( [a1 _zoneIdentifiersWithExpiredTokensFrom:*(void *)(*((void *)&v36 + 1) + 8 * (void)j) andErrors:0]);
              [v8 unionSet:v23];
            }

            id v20 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }

          while (v20);
        }

        if (objc_msgSend(v17, "amsd_isCKPartialFailureError"))
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v17 userInfo]);
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

          uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0) {
            id v27 = v25;
          }
          else {
            id v27 = 0LL;
          }

          id v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "ams_filterUsingTest:", &stru_1001B4808));
          id v29 = (void *)objc_claimAutoreleasedReturnValue([a1 _zoneIdentifiersWithExpiredTokensFrom:0 andErrors:v28]);
          [v8 unionSet:v29];
        }

        id v12 = v16;
      }

      id v35 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }

    while (v35);
  }

  return v8;
}

+ (id)_fetchChangeTokenWithDatabaseScope:(int64_t)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___AMSTokenStorage);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSTokenStorage loadWithName:](v5, "loadWithName:", @"AMSCloudKitDatabaseChangeTokens"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _stringForDatabaseScope:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);

  if (v8)
  {
    id v20 = 0LL;
    id v9 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___CKServerChangeToken),  v8,  &v20);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = v20;
    if (!v10)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v12) {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = objc_opt_class(a1);
        uint64_t v14 = AMSLogKey(v19);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        uint64_t v16 = AMSHashIfNeeded(v11);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        *(_DWORD *)buf = 138544130;
        uint64_t v22 = v19;
        __int16 v23 = 2114;
        uint64_t v24 = v15;
        __int16 v25 = 2048;
        int64_t v26 = a3;
        __int16 v27 = 2114;
        id v28 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to unarchive a database change token. databaseScope = %ld | error = %{public}@",  buf,  0x2Au);
      }
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

+ (id)_fetchChangeTokenWithDatabaseScope:(int64_t)a3 recordZoneName:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___AMSTokenStorage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSTokenStorage loadWithName:](v7, "loadWithName:", @"AMSCloudKitRecordZoneChangeTokens"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v9) {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class(a1);
    id v12 = a1;
    int64_t v13 = a3;
    uint64_t v14 = v11;
    uint64_t v15 = AMSLogKey(v11);
    __int128 v39 = v7;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    uint64_t v17 = AMSHashIfNeeded(v6);
    id v18 = v6;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v20 = AMSHashIfNeeded(v8);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    *(_DWORD *)buf = 138544386;
    uint64_t v43 = v14;
    a3 = v13;
    a1 = v12;
    __int16 v44 = 2114;
    id v45 = v16;
    __int16 v46 = 2048;
    int64_t v47 = a3;
    __int16 v48 = 2114;
    v49 = v19;
    __int16 v50 = 2114;
    id v51 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Found change token. databaseScope = %ld | zoneName = %{public}@ | changeTokens = %{public}@",  buf,  0x34u);

    id v6 = v18;
    id v7 = v39;
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([a1 _changeTokenKeyForDatabaseScope:a3 recordZoneName:v6]);
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v22]);

  if (v23)
  {
    int64_t v24 = a3;
    id v41 = 0LL;
    id v25 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___CKServerChangeToken),  v23,  &v41);
    int64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    id v27 = v41;
    if (!v26)
    {
      id v38 = v6;
      __int128 v40 = v7;
      id v28 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v28) {
        id v28 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 OSLogObject]);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = objc_opt_class(a1);
        uint64_t v30 = AMSLogKey(v37);
        __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        uint64_t v32 = AMSHashIfNeeded(v38);
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        uint64_t v34 = AMSHashIfNeeded(v27);
        id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        *(_DWORD *)buf = 138544386;
        uint64_t v43 = v37;
        __int16 v44 = 2114;
        id v45 = v31;
        __int16 v46 = 2048;
        int64_t v47 = v24;
        __int16 v48 = 2114;
        v49 = v33;
        __int16 v50 = 2114;
        id v51 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to unarchive a record zone change token. databaseScope = %ld | zoneName = %{pu blic}@ | error = %{public}@",  buf,  0x34u);
      }

      id v6 = v38;
      id v7 = v40;
    }
  }

  else
  {
    int64_t v26 = 0LL;
  }

  return v26;
}

+ (id)_stringForDatabaseScope:(int64_t)a3
{
  id v3 = @"private";
  if (a3 == 1) {
    id v3 = @"public";
  }
  if (a3 == 3) {
    return @"shared";
  }
  else {
    return (id)v3;
  }
}

@end