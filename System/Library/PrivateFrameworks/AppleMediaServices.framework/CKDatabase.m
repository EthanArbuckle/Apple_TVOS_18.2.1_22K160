@interface CKDatabase
+ (id)_changeTokenKeyForDatabaseScope:(int64_t)a3 recordZoneName:(id)a4;
+ (id)_fetchChangeTokenWithDatabaseScope:(int64_t)a3;
+ (id)_fetchChangeTokenWithDatabaseScope:(int64_t)a3 recordZoneName:(id)a4;
+ (id)_stringForDatabaseScope:(int64_t)a3;
+ (id)_stringForQualityOfService:(int64_t)a3;
- (BOOL)isPrivateDatabase;
- (BOOL)isPublicDatabase;
- (BOOL)isSharedDatabase;
- (NSString)hashedDescription;
- (id)_fetchChangedRecordZonesWithServerChangeToken:(id)a3;
- (id)_fetchChangedRecordsInRecordZonesWithWithRecordZoneIDs:(id)a3 changeTokens:(id)a4;
- (id)_subscribeWithIdentifier:(id)a3 attempt:(unint64_t)a4;
- (id)createRecordWithRecordName:(id)a3 recordType:(id)a4 recordZone:(id)a5;
- (id)createRecordZoneWithRecordZoneName:(id)a3;
- (id)deleteRecordWithRecordIdentifier:(id)a3;
- (id)deleteRecordWithRecordIdentifier:(id)a3 missingEncryptionIdentity:(BOOL)a4;
- (id)deleteRecordZonesWithRecordZoneIdentifiers:(id)a3;
- (id)fetchChangedRecordZones;
- (id)fetchChangedRecordsInRecordZonesWithRecordZoneIdentifiers:(id)a3;
- (id)fetchRecordWithName:(id)a3 zoneIdentifier:(id)a4;
- (id)fetchRecordWithName:(id)a3 zoneIdentifier:(id)a4 qualityOfService:(int64_t)a5;
- (id)fetchRecordWithRecordIdentifier:(id)a3;
- (id)fetchRecordWithRecordIdentifier:(id)a3 qualityOfService:(int64_t)a4;
- (id)fetchRecordZones;
- (id)fetchRecordZonesWithQualityOfService:(int64_t)a3;
- (id)saveRecord:(id)a3;
- (id)saveRecordZone:(id)a3;
- (id)shareForRecordZoneIdentifier:(id)a3;
- (id)subscribeWithIdentifier:(id)a3;
- (unint64_t)type;
- (void)_logFaultIfExcessiveChangeTokens:(id)a3;
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
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p type = %lu>",  objc_opt_class(self, a2),  self,  -[CKDatabase type](self, "type"));
}

- (id)createRecordWithRecordName:(id)a3 recordType:(id)a4 recordZone:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___CKRecordZone, v10);
  if ((objc_opt_isKindOfClass(v7, v11) & 1) != 0) {
    id v12 = v7;
  }
  else {
    id v12 = 0LL;
  }

  v13 = objc_alloc(&OBJC_CLASS___CKRecordID);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);
  v15 = -[CKRecordID initWithRecordName:zoneID:](v13, "initWithRecordName:zoneID:", v9, v14);

  v16 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  v8,  v15);
  return v16;
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
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___CKRecordID, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
    id v9 = v6;
  }
  else {
    id v9 = 0LL;
  }

  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  uint64_t v11 = objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation);
  id v19 = v9;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  v13 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( v11,  "initWithRecordsToSave:recordIDsToDelete:",  0LL,  v12);

  -[CKModifyRecordsOperation setQualityOfService:](v13, "setQualityOfService:", 17LL);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10004899C;
  v17[3] = &unk_1000D80F8;
  v18 = v10;
  v14 = v10;
  -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v13, "setModifyRecordsCompletionBlock:", v17);
  -[CKModifyRecordsOperation setMarkAsParticipantNeedsNewInvitationToken:]( v13,  "setMarkAsParticipantNeedsNewInvitationToken:",  v4);
  -[CKDatabase addOperation:](self, "addOperation:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AMSMutablePromise catchWithBlock:](v14, "catchWithBlock:", &stru_1000D8138));

  return v15;
}

- (id)deleteRecordZonesWithRecordZoneIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    id v7 = v4;
  }
  else {
    id v7 = 0LL;
  }

  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  id v9 = -[CKModifyRecordZonesOperation initWithRecordZonesToSave:recordZoneIDsToDelete:]( objc_alloc(&OBJC_CLASS___CKModifyRecordZonesOperation),  "initWithRecordZonesToSave:recordZoneIDsToDelete:",  0LL,  v7);
  -[CKModifyRecordZonesOperation setQualityOfService:](v9, "setQualityOfService:", 17LL);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100048BD0;
  v13[3] = &unk_1000D80F8;
  v14 = v8;
  uint64_t v10 = v8;
  -[CKModifyRecordZonesOperation setModifyRecordZonesCompletionBlock:](v9, "setModifyRecordZonesCompletionBlock:", v13);
  -[CKDatabase addOperation:](self, "addOperation:", v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AMSMutablePromise catchWithBlock:](v10, "catchWithBlock:", &stru_1000D8158));

  return v11;
}

- (id)fetchChangedRecordsInRecordZonesWithRecordZoneIdentifiers:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ams_mapWithTransformIgnoresNil:", &stru_1000D8198));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100048DD4;
  v8[3] = &unk_1000D81C0;
  v8[4] = self;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_invertedDictionaryUsingTransformIgnoresNil:", v8));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[CKDatabase _fetchChangedRecordsInRecordZonesWithWithRecordZoneIDs:changeTokens:]( self,  "_fetchChangedRecordsInRecordZonesWithWithRecordZoneIDs:changeTokens:",  v4,  v5));

  return v6;
}

- (id)fetchChangedRecordZones
{
  id v3 = objc_msgSend( (id)objc_opt_class(self, a2),  "_fetchChangeTokenWithDatabaseScope:",  -[CKDatabase scope](self, "scope"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[CKDatabase _fetchChangedRecordZonesWithServerChangeToken:]( self,  "_fetchChangedRecordZonesWithServerChangeToken:",  v4));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100048F1C;
  v9[3] = &unk_1000D7148;
  v9[4] = self;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 catchWithBlock:v9]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 catchWithBlock:&stru_1000D81E0]);
  return v7;
}

- (id)fetchRecordWithName:(id)a3 zoneIdentifier:(id)a4
{
  return -[CKDatabase fetchRecordWithName:zoneIdentifier:qualityOfService:]( self,  "fetchRecordWithName:zoneIdentifier:qualityOfService:",  a3,  a4,  17LL);
}

- (id)fetchRecordWithName:(id)a3 zoneIdentifier:(id)a4 qualityOfService:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___CKRecordZoneID, v10);
  if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0) {
    id v12 = v8;
  }
  else {
    id v12 = 0LL;
  }

  v13 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  v9,  v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[CKDatabase fetchRecordWithRecordIdentifier:qualityOfService:]( self,  "fetchRecordWithRecordIdentifier:qualityOfService:",  v13,  a5));

  return v14;
}

- (id)fetchRecordWithRecordIdentifier:(id)a3
{
  return -[CKDatabase fetchRecordWithRecordIdentifier:qualityOfService:]( self,  "fetchRecordWithRecordIdentifier:qualityOfService:",  a3,  17LL);
}

- (id)fetchRecordWithRecordIdentifier:(id)a3 qualityOfService:(int64_t)a4
{
  id v7 = a3;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___CKRecordID, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0) {
    id v10 = v7;
  }
  else {
    id v10 = 0LL;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v11) {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = objc_opt_class(self, v13);
    uint64_t v16 = AMSLogKey(v14, v15);
    id v34 = v7;
    int64_t v17 = a4;
    v18 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v19 = NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v21 = AMSHashIfNeeded(self);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    id v24 = objc_msgSend((id)objc_opt_class(self, v23), "_stringForQualityOfService:", v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    *(_DWORD *)buf = 138544386;
    uint64_t v40 = v14;
    __int16 v41 = 2114;
    v42 = v18;
    __int16 v43 = 2114;
    v44 = v20;
    __int16 v45 = 2114;
    v46 = v22;
    __int16 v47 = 2114;
    v48 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Performing operation: %{public}@  | database: %{public}@ | Quality of Service: %{public}@",  buf,  0x34u);

    a4 = v17;
    id v7 = v34;
  }

  v26 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  v27 = objc_alloc(&OBJC_CLASS___CKFetchRecordsOperation);
  id v38 = v10;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));
  v29 = -[CKFetchRecordsOperation initWithRecordIDs:](v27, "initWithRecordIDs:", v28);

  -[CKFetchRecordsOperation setQualityOfService:](v29, "setQualityOfService:", a4);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100049364;
  v35[3] = &unk_1000D8208;
  id v36 = v10;
  v37 = v26;
  v30 = v26;
  id v31 = v10;
  -[CKFetchRecordsOperation setFetchRecordsCompletionBlock:](v29, "setFetchRecordsCompletionBlock:", v35);
  -[CKDatabase addOperation:](self, "addOperation:", v29);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[AMSMutablePromise catchWithBlock:](v30, "catchWithBlock:", &stru_1000D8228));

  return v32;
}

- (id)fetchRecordZones
{
  return -[CKDatabase fetchRecordZonesWithQualityOfService:](self, "fetchRecordZonesWithQualityOfService:", 17LL);
}

- (id)fetchRecordZonesWithQualityOfService:(int64_t)a3
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v6) {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class(self, v8);
    uint64_t v11 = AMSLogKey(v9, v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = NSStringFromSelector(a2);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = AMSHashIfNeeded(self);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v18 = objc_msgSend((id)objc_opt_class(self, v17), "_stringForQualityOfService:", a3);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    *(_DWORD *)buf = 138544386;
    uint64_t v29 = v9;
    __int16 v30 = 2114;
    id v31 = v12;
    __int16 v32 = 2114;
    v33 = v14;
    __int16 v34 = 2114;
    v35 = v16;
    __int16 v36 = 2114;
    v37 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Performing operation: %{public}@  | database: %{public}@ | Quality of Service: %{public}@",  buf,  0x34u);
  }

  v20 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[CKFetchRecordZonesOperation fetchAllRecordZonesOperation]( &OBJC_CLASS___CKFetchRecordZonesOperation,  "fetchAllRecordZonesOperation"));
  [v21 setQualityOfService:a3];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100049784;
  v26[3] = &unk_1000D8250;
  v22 = v20;
  v27 = v22;
  [v21 setFetchRecordZonesCompletionBlock:v26];
  -[CKDatabase addOperation:](self, "addOperation:", v21);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000498A0;
  v25[3] = &unk_1000D8278;
  v25[4] = self;
  -[AMSMutablePromise addSuccessBlock:](v22, "addSuccessBlock:", v25);
  uint64_t v23 = v22;

  return v23;
}

- (void)persistChangedRecordZonesChangeToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = &OBJC_CLASS___AMSMultiUserService_ptr;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[AMSStorage _valueForKey:]( &OBJC_CLASS___AMSStorage,  "_valueForKey:",  @"AMSDCloudKitDatabaseChangeTokens"));
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
    id v9 = v6;
  }
  else {
    id v9 = 0LL;
  }

  uint64_t v10 = &__NSDictionary0__struct;
  if (v9) {
    uint64_t v10 = v9;
  }
  id v11 = v10;

  id v13 = [v11 mutableCopy];
  if (v4)
  {
    id v31 = 0LL;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v31));
    id v15 = v31;
    if (!v14)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v16) {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = objc_opt_class(self, v18);
        uint64_t v20 = AMSLogKey(v29, v19);
        __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(v20);
        uint64_t v21 = AMSHashIfNeeded(self);
        uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
        uint64_t v23 = AMSHashIfNeeded(v15);
        uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
        *(_DWORD *)buf = 138544130;
        uint64_t v33 = v29;
        __int16 v34 = 2114;
        v35 = v30;
        __int16 v36 = 2114;
        uint64_t v37 = v22;
        v25 = (void *)v22;
        __int16 v38 = 2114;
        uint64_t v39 = v24;
        v26 = (void *)v24;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to archive a database change token. database = %{public}@ | error = %{public}@",  buf,  0x2Au);

        uint64_t v5 = &OBJC_CLASS___AMSMultiUserService_ptr;
      }
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  id v27 = objc_msgSend((id)objc_opt_class(self, v12), "_stringForDatabaseScope:", -[CKDatabase scope](self, "scope"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  [v13 setObject:v14 forKeyedSubscript:v28];
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
    uint64_t v11 = objc_opt_class(self, v10);
    uint64_t v13 = AMSLogKey(v11, v12);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = AMSHashIfNeeded(v7);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138544130;
    uint64_t v47 = v11;
    __int16 v48 = 2114;
    v49 = v14;
    __int16 v50 = 2112;
    id v51 = v6;
    __int16 v52 = 2114;
    v53 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Setting a change token. changeToken = %@ | zoneIdentifier = %{public}@",  buf,  0x2Au);
  }

  uint64_t v17 = &OBJC_CLASS___AMSMultiUserService_ptr;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[AMSStorage _valueForKey:]( &OBJC_CLASS___AMSStorage,  "_valueForKey:",  @"AMSDCloudKitRecordZoneChangeTokens"));
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSDictionary, v19);
  if ((objc_opt_isKindOfClass(v18, v20) & 1) != 0) {
    id v21 = v18;
  }
  else {
    id v21 = 0LL;
  }

  uint64_t v22 = &__NSDictionary0__struct;
  if (v21) {
    uint64_t v22 = v21;
  }
  id v23 = v22;

  id v24 = [v23 mutableCopy];
  v26 = (void *)objc_opt_class(self, v25);
  id v27 = -[CKDatabase scope](self, "scope");
  v28 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v26 _changeTokenKeyForDatabaseScope:v27 recordZoneName:v28]);

  if (v6)
  {
    id v45 = 0LL;
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &v45));
    id v31 = v45;
    if (!v30)
    {
      __int16 v32 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v32) {
        __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 OSLogObject]);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = objc_opt_class(self, v34);
        uint64_t v36 = AMSLogKey(v42, v35);
        v44 = (void *)objc_claimAutoreleasedReturnValue(v36);
        id v41 = -[CKDatabase scope](self, "scope");
        uint64_t v37 = AMSHashIfNeeded(v7);
        __int16 v43 = (void *)objc_claimAutoreleasedReturnValue(v37);
        uint64_t v38 = AMSHashIfNeeded(v31);
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v38);
        *(_DWORD *)buf = 138544386;
        uint64_t v47 = v42;
        __int16 v48 = 2114;
        v49 = v44;
        __int16 v50 = 2048;
        id v51 = v41;
        __int16 v52 = 2114;
        v53 = v43;
        __int16 v54 = 2114;
        v55 = v40;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to archive a record zone change token. databaseScope = %ld | zoneName = %{publ ic}@ | error = %{public}@",  buf,  0x34u);
      }

      uint64_t v17 = &OBJC_CLASS___AMSMultiUserService_ptr;
    }

    objc_msgSend(v24, "setObject:forKeyedSubscript:", v30, v29, v40);
  }

  else
  {
    [v24 removeObjectForKey:v29];
  }

  if (([v23 isEqualToDictionary:v24] & 1) == 0)
  {
    [v17[15] _setValue:v24 forKey:@"AMSDCloudKitRecordZoneChangeTokens"];
    id v39 = [v24 copy];
    -[CKDatabase _logFaultIfExcessiveChangeTokens:](self, "_logFaultIfExcessiveChangeTokens:", v39);
  }
}

- (void)_logFaultIfExcessiveChangeTokens:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 allValues]);
  id v5 = [v4 count];

  if ((unint64_t)v5 >= 0xC9)
  {
    unsigned int v6 = +[AMSUnitTests isRunningUnitTests](&OBJC_CLASS___AMSUnitTests, "isRunningUnitTests");
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    uint64_t v8 = (void *)v7;
    if (v6)
    {
      if (!v7) {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138543362;
        uint64_t v14 = objc_opt_class(self, v10);
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}@: AMSStorage database grown too big when inserting record zone change tokens.",  (uint8_t *)&v13,  0xCu);
      }

      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      [v8 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v11 userInfo:0];
    }

    else
    {
      if (!v7) {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        int v13 = 138543362;
        uint64_t v14 = objc_opt_class(self, v12);
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "%{public}@: AMSStorage database grown too big when inserting record zone change tokens.",  (uint8_t *)&v13,  0xCu);
      }
    }
  }

- (id)saveRecord:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CKRecord, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    id v7 = v4;
  }
  else {
    id v7 = 0LL;
  }

  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  id v9 = objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation);
  id v17 = v7;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  uint64_t v11 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( v9,  "initWithRecordsToSave:recordIDsToDelete:",  v10,  0LL);

  -[CKModifyRecordsOperation setQualityOfService:](v11, "setQualityOfService:", 17LL);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10004A2E8;
  v15[3] = &unk_1000D80F8;
  uint64_t v16 = v8;
  uint64_t v12 = v8;
  -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v11, "setModifyRecordsCompletionBlock:", v15);
  -[CKDatabase addOperation:](self, "addOperation:", v11);
  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[AMSMutablePromise catchWithBlock:](v12, "catchWithBlock:", &stru_1000D8298));

  return v13;
}

- (id)saveRecordZone:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CKRecordZone, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    id v7 = v4;
  }
  else {
    id v7 = 0LL;
  }

  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  id v9 = objc_alloc(&OBJC_CLASS___CKModifyRecordZonesOperation);
  id v17 = v7;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  uint64_t v11 = -[CKModifyRecordZonesOperation initWithRecordZonesToSave:recordZoneIDsToDelete:]( v9,  "initWithRecordZonesToSave:recordZoneIDsToDelete:",  v10,  0LL);

  -[CKModifyRecordZonesOperation setQualityOfService:](v11, "setQualityOfService:", 17LL);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10004A578;
  v15[3] = &unk_1000D80F8;
  uint64_t v16 = v8;
  uint64_t v12 = v8;
  -[CKModifyRecordZonesOperation setModifyRecordZonesCompletionBlock:](v11, "setModifyRecordZonesCompletionBlock:", v15);
  -[CKDatabase addOperation:](self, "addOperation:", v11);
  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[AMSMutablePromise catchWithBlock:](v12, "catchWithBlock:", &stru_1000D82B8));

  return v13;
}

- (id)shareForRecordZoneIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CKRecordZoneID, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  id v7 = -[CKShare initWithRecordZoneID:](objc_alloc(&OBJC_CLASS___CKShare), "initWithRecordZoneID:", v6);
  return v7;
}

- (id)subscribeWithIdentifier:(id)a3
{
  return -[CKDatabase _subscribeWithIdentifier:attempt:](self, "_subscribeWithIdentifier:attempt:", a3, 0LL);
}

- (id)_subscribeWithIdentifier:(id)a3 attempt:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v7) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class(self, v9);
    uint64_t v12 = AMSLogKey(v10, v11);
    int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = AMSHashIfNeeded(self);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138543874;
    uint64_t v33 = v10;
    __int16 v34 = 2114;
    uint64_t v35 = v13;
    __int16 v36 = 2114;
    uint64_t v37 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Setting up a database subscription. database = %{public}@",  buf,  0x20u);
  }

  uint64_t v16 = objc_alloc_init(&OBJC_CLASS___CKNotificationInfo);
  -[CKNotificationInfo setShouldSendContentAvailable:](v16, "setShouldSendContentAvailable:", 1LL);
  id v17 = -[CKDatabaseSubscription initWithSubscriptionID:]( objc_alloc(&OBJC_CLASS___CKDatabaseSubscription),  "initWithSubscriptionID:",  v6);
  -[CKDatabaseSubscription setNotificationInfo:](v17, "setNotificationInfo:", v16);
  uint64_t v18 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  uint64_t v19 = objc_alloc(&OBJC_CLASS___CKModifySubscriptionsOperation);
  id v31 = v17;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
  id v21 = -[CKModifySubscriptionsOperation initWithSubscriptionsToSave:subscriptionIDsToDelete:]( v19,  "initWithSubscriptionsToSave:subscriptionIDsToDelete:",  v20,  0LL);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10004A99C;
  v29[3] = &unk_1000D80F8;
  __int16 v30 = v18;
  uint64_t v22 = v18;
  -[CKModifySubscriptionsOperation setModifySubscriptionsCompletionBlock:]( v21,  "setModifySubscriptionsCompletionBlock:",  v29);
  -[CKDatabase addOperation:](self, "addOperation:", v21);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10004AA5C;
  v26[3] = &unk_1000D8308;
  id v27 = v6;
  unint64_t v28 = a4;
  void v26[4] = self;
  id v23 = v6;
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[AMSMutablePromise continueWithBlock:](v22, "continueWithBlock:", v26));

  return v24;
}

+ (id)_changeTokenKeyForDatabaseScope:(int64_t)a3 recordZoneName:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _stringForDatabaseScope:a3]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%@", v7, v6));

  return v8;
}

- (id)_fetchChangedRecordZonesWithServerChangeToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[CKFetchDatabaseChangesOperation initWithPreviousServerChangeToken:]( objc_alloc(&OBJC_CLASS___CKFetchDatabaseChangesOperation),  "initWithPreviousServerChangeToken:",  v4);

  -[CKFetchDatabaseChangesOperation setQualityOfService:](v5, "setQualityOfService:", 17LL);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10004B124;
  v22[3] = &unk_1000D8330;
  uint64_t v8 = v6;
  id v23 = v8;
  -[CKFetchDatabaseChangesOperation setRecordZoneWithIDChangedBlock:](v5, "setRecordZoneWithIDChangedBlock:", v22);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10004B130;
  v20[3] = &unk_1000D8330;
  uint64_t v9 = v7;
  id v21 = v9;
  -[CKFetchDatabaseChangesOperation setRecordZoneWithIDWasDeletedBlock:](v5, "setRecordZoneWithIDWasDeletedBlock:", v20);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10004B13C;
  v16[3] = &unk_1000D8358;
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  id v17 = v10;
  uint64_t v18 = v8;
  uint64_t v19 = v9;
  uint64_t v11 = v9;
  uint64_t v12 = v8;
  -[CKFetchDatabaseChangesOperation setFetchDatabaseChangesCompletionBlock:]( v5,  "setFetchDatabaseChangesCompletionBlock:",  v16);
  -[CKDatabase addOperation:](self, "addOperation:", v5);
  int v13 = v19;
  uint64_t v14 = v10;

  return v14;
}

- (id)_fetchChangedRecordsInRecordZonesWithWithRecordZoneIDs:(id)a3 changeTokens:(id)a4
{
  id v6 = a3;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_10004B51C;
  v51[3] = &unk_1000D81C0;
  id v31 = a4;
  id v52 = v31;
  __int16 v32 = v6;
  __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_invertedDictionaryUsingTransform:", v51));
  id v7 = -[CKFetchRecordZoneChangesOperation initWithRecordZoneIDs:configurationsByRecordZoneID:]( objc_alloc(&OBJC_CLASS___CKFetchRecordZoneChangesOperation),  "initWithRecordZoneIDs:configurationsByRecordZoneID:",  v6,  v30);
  -[CKFetchRecordZoneChangesOperation setQualityOfService:](v7, "setQualityOfService:", 17LL);
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_10004B588;
  v49[3] = &unk_1000D8380;
  v49[4] = self;
  uint64_t v12 = v8;
  __int16 v50 = v12;
  -[CKFetchRecordZoneChangesOperation setRecordWasChangedBlock:](v7, "setRecordWasChangedBlock:", v49);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_10004B7C4;
  v47[3] = &unk_1000D83A8;
  int v13 = v9;
  __int16 v48 = v13;
  -[CKFetchRecordZoneChangesOperation setRecordWithIDWasDeletedBlock:](v7, "setRecordWithIDWasDeletedBlock:", v47);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_10004B870;
  v42[3] = &unk_1000D83D0;
  uint64_t v14 = v11;
  __int16 v43 = v14;
  uint64_t v15 = v12;
  v44 = v15;
  uint64_t v16 = v13;
  id v45 = v16;
  id v17 = v10;
  v46 = v17;
  -[CKFetchRecordZoneChangesOperation setRecordZoneFetchCompletionBlock:](v7, "setRecordZoneFetchCompletionBlock:", v42);
  uint64_t v18 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  uint64_t v20 = AMSLogKey(v18, v19);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  objc_initWeak(&location, self);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10004B90C;
  v33[3] = &unk_1000D8438;
  id v22 = v21;
  id v34 = v22;
  id v23 = v15;
  uint64_t v35 = v23;
  id v24 = v16;
  __int16 v36 = v24;
  uint64_t v25 = v17;
  uint64_t v37 = v25;
  v26 = v14;
  uint64_t v38 = v26;
  objc_copyWeak(&v40, &location);
  id v27 = v18;
  id v39 = v27;
  -[CKFetchRecordZoneChangesOperation setFetchRecordZoneChangesCompletionBlock:]( v7,  "setFetchRecordZoneChangesCompletionBlock:",  v33);
  -[CKDatabase addOperation:](self, "addOperation:", v7);
  unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[AMSMutablePromise catchWithBlock:](v27, "catchWithBlock:", &stru_1000D8458));

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

  return v28;
}

+ (id)_fetchChangeTokenWithDatabaseScope:(int64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AMSStorage _valueForKey:]( &OBJC_CLASS___AMSStorage,  "_valueForKey:",  @"AMSDCloudKitDatabaseChangeTokens"));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0) {
    id v8 = v5;
  }
  else {
    id v8 = 0LL;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _stringForDatabaseScope:a3]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  if (v10)
  {
    id v25 = 0LL;
    id v12 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___CKServerChangeToken, v11),  v10,  &v25);
    int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = v25;
    if (!v13)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v15) {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = objc_opt_class(a1, v17);
        uint64_t v20 = AMSLogKey(v18, v19);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        uint64_t v22 = AMSHashIfNeeded(v14);
        id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        *(_DWORD *)buf = 138544130;
        uint64_t v27 = v18;
        __int16 v28 = 2114;
        uint64_t v29 = v21;
        __int16 v30 = 2048;
        int64_t v31 = a3;
        __int16 v32 = 2114;
        uint64_t v33 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to unarchive a database change token. databaseScope = %ld | error = %{public}@",  buf,  0x2Au);
      }
    }
  }

  else
  {
    int v13 = 0LL;
  }

  return v13;
}

+ (id)_fetchChangeTokenWithDatabaseScope:(int64_t)a3 recordZoneName:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[AMSStorage _valueForKey:]( &OBJC_CLASS___AMSStorage,  "_valueForKey:",  @"AMSDCloudKitRecordZoneChangeTokens"));
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0) {
    id v10 = v7;
  }
  else {
    id v10 = 0LL;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _changeTokenKeyForDatabaseScope:a3 recordZoneName:v6]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);

  if (v12)
  {
    id v29 = 0LL;
    id v14 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___CKServerChangeToken, v13),  v12,  &v29);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = v29;
    if (!v15)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v17) {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = objc_opt_class(a1, v19);
        uint64_t v21 = AMSLogKey(v28, v20);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        uint64_t v23 = AMSHashIfNeeded(v6);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v23);
        uint64_t v24 = AMSHashIfNeeded(v16);
        id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        *(_DWORD *)buf = 138544386;
        uint64_t v31 = v28;
        __int16 v32 = 2114;
        uint64_t v33 = v22;
        __int16 v34 = 2048;
        int64_t v35 = a3;
        __int16 v36 = 2114;
        uint64_t v37 = v27;
        __int16 v38 = 2114;
        id v39 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to unarchive a record zone change token. databaseScope = %ld | zoneName = %{pu blic}@ | error = %{public}@",  buf,  0x34u);
      }
    }
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  return v15;
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

+ (id)_stringForQualityOfService:(int64_t)a3
{
  if (a3 <= 16)
  {
    if (a3 == -1) {
      return @"Default";
    }
    if (a3 == 9) {
      return @"Background";
    }
  }

  else
  {
    switch(a3)
    {
      case 17LL:
        return @"Utility";
      case 25LL:
        return @"User Initiated";
      case 33LL:
        return @"User Interactive";
    }
  }

  return @"Unknown";
}

@end