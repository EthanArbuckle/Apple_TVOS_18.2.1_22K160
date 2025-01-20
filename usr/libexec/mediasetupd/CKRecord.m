@interface CKRecord
+ (id)createRecordWithName:(id)a3 recordType:(id)a4 recordZone:(id)a5;
- (id)createMediaServiceObjectFromRecord;
- (id)recordFieldForKey:(id)a3;
- (void)_attemptToLoadPublicInfoAgain;
- (void)populateCKRecordInfo:(id)a3 userInfo:(id)a4 recordType:(id)a5;
- (void)setRecordFieldForKey:(id)a3 value:(id)a4;
@end

@implementation CKRecord

+ (id)createRecordWithName:(id)a3 recordType:(id)a4 recordZone:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  v9,  v7);

  v11 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  v8,  v10);
  return v11;
}

- (id)recordFieldForKey:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](self, "encryptedValues"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

- (void)setRecordFieldForKey:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](self, "encryptedValues"));
  [v8 setObject:v6 forKeyedSubscript:v7];
}

- (void)populateCKRecordInfo:(id)a3 userInfo:(id)a4 recordType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10003E9DC();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v39 = 138478339;
    id v40 = v10;
    __int16 v41 = 2113;
    id v42 = v8;
    __int16 v43 = 2113;
    id v44 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Creating record RecordType: %{private}@ and ServiceInfo: %{private}@ \n and UserInfo %{private}@",  (uint8_t *)&v39,  0x20u);
  }

  if ([v10 isEqualToString:MSServiceAccountRecordType])
  {
    uint64_t v13 = MSHomeParticipantHomeIdentifier;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kCKDatabaseAccessUserInfoHomeIDKey]);
    -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", v13, v14);

    uint64_t v15 = MSHomeParticipantHomeUserIdentifier;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey]);
    -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", v15, v16);

    uint64_t v17 = MediaServiceIdentifier;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceID]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 UUIDString]);
    -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", v17, v19);

    uint64_t v20 = MediaServiceAccountName;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v8 accountName]);
    -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", v20, v21);

    uint64_t v22 = MediaServiceConfigurationURL;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v8 configURL]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 absoluteString]);
    -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", v22, v24);

    uint64_t v25 = MediaServiceUpdateListeningHistory;
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 updateListeningHistoryEnabled]));
    -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", v25, v26);

    uint64_t v27 = MediaServiceAuthFatalError;
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 authFatalError]));
    -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", v27, v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue([v8 authConfiguration]);
    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v8 authConfiguration]);
      v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v30,  1LL,  0LL));

      if (v31) {
        -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", MediaServiceAuthConfiguration, v31);
      }
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue([v8 authCredential]);

    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue([v8 authCredential]);
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v33,  1LL,  0LL));

      if (v34) {
        -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", MediaServiceAuthCredential, v34);
      }
      goto LABEL_13;
    }
  }

  else if ([v10 isEqualToString:MSDefaultServiceRecordType])
  {
    uint64_t v35 = MSHomeParticipantHomeUserIdentifier;
    v36 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey]);
    -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", v35, v36);

    uint64_t v37 = MediaServiceIdentifier;
    v34 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceID]);
    v38 = (void *)objc_claimAutoreleasedReturnValue([v34 UUIDString]);
    -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", v37, v38);

LABEL_13:
  }
}

- (id)createMediaServiceObjectFromRecord
{
  uint64_t v3 = MediaServiceIdentifier;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordFieldForKey:](self, "recordFieldForKey:", MediaServiceIdentifier));
  if (!v4)
  {
    id v33 = sub_10003E9DC();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100032024(v5, v34, v35, v36, v37, v38, v39, v40);
    }
    goto LABEL_23;
  }

  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForServiceID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForServiceID:",  v4));
  if (!v5)
  {
    -[CKRecord _attemptToLoadPublicInfoAgain](self, "_attemptToLoadPublicInfoAgain");
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForServiceID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForServiceID:",  v4));
    id v6 = sub_10003E9DC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100032168((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
    }

    if (!v5)
    {
      id v45 = sub_10003E9DC();
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100032094(v5);
      }
      goto LABEL_23;
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](self, "recordType"));
  unsigned int v15 = [v14 isEqualToString:MSServiceAccountRecordType];

  if (!v15)
  {
    __int16 v41 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](self, "recordType"));
    unsigned int v42 = [v41 isEqualToString:MSDefaultServiceRecordType];

    if (v42)
    {
      uint64_t v17 = -[MediaService initWithMediaServiceIdentifier:]( objc_alloc(&OBJC_CLASS___MediaService),  "initWithMediaServiceIdentifier:",  v4);
      goto LABEL_24;
    }

    id v43 = sub_10003E9DC();
    id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_1000320D4(self, v44);
    }

LABEL_23:
    uint64_t v17 = 0LL;
    goto LABEL_24;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordFieldForKey:](self, "recordFieldForKey:", v3));
  uint64_t v17 = -[MediaService initWithMediaServiceIdentifier:]( objc_alloc(&OBJC_CLASS___MediaService),  "initWithMediaServiceIdentifier:",  v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordFieldForKey:](self, "recordFieldForKey:", MediaServiceUpdateListeningHistory));
  -[MediaService setUpdateListeningHistoryEnabled:]( v17,  "setUpdateListeningHistoryEnabled:",  [v18 BOOLValue]);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordFieldForKey:](self, "recordFieldForKey:", MediaServiceAccountName));
  -[MediaService setAccountName:](v17, "setAccountName:", v19);

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordFieldForKey:](self, "recordFieldForKey:", MediaServiceConfigurationURL));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v20));
  -[MediaService setConfigURL:](v17, "setConfigURL:", v21);

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordFieldForKey:](self, "recordFieldForKey:", MediaServiceAuthFatalError));
  -[MediaService setAuthFatalError:](v17, "setAuthFatalError:", [v22 BOOLValue]);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordFieldForKey:](self, "recordFieldForKey:", MediaServiceAuthConfiguration));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordFieldForKey:](self, "recordFieldForKey:", MediaServiceAuthCredential));
  if (v23)
  {
    id v25 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___CMSAuthenticationConfiguration),  v23,  0LL);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    -[MediaService setAuthConfiguration:](v17, "setAuthConfiguration:", v26);

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService authConfiguration](v17, "authConfiguration"));
    if (!v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[CMSAuthenticationConfiguration authConfigurationFromMSAuthData:]( &OBJC_CLASS___CMSAuthenticationConfiguration,  "authConfigurationFromMSAuthData:",  v23));
      -[MediaService setAuthConfiguration:](v17, "setAuthConfiguration:", v28);
    }
  }

  if (v24)
  {
    id v29 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___CMSAuthenticationCredential),  v24,  0LL);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    -[MediaService setAuthCredential:](v17, "setAuthCredential:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService authCredential](v17, "authCredential"));
    if (!v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[CMSAuthenticationCredential authCredentialFromMSAuthData:]( &OBJC_CLASS___CMSAuthenticationCredential,  "authCredentialFromMSAuthData:",  v24));
      -[MediaService setAuthCredential:](v17, "setAuthCredential:", v32);
    }
  }

LABEL_24:
  return v17;
}

- (void)_attemptToLoadPublicInfoAgain
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](&OBJC_CLASS___MSDPublicDBManager, "shared"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100031FBC;
  v15[3] = &unk_100061A78;
  id v4 = v2;
  v16 = v4;
  [v3 syncDataWithCloudKit:v15];

  dispatch_time_t v5 = dispatch_time(0LL, 1000000000LL * MSMaxWaitInSecondsForFetchDataFromCloudKit);
  if (dispatch_semaphore_wait(v4, v5))
  {
    id v6 = sub_10003E9DC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000321CC(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

@end