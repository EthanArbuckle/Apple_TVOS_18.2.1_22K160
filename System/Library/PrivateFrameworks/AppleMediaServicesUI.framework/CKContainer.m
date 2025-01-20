@interface CKContainer
- (AMSCloudDataDatabase)privateDatabase;
- (AMSCloudDataDatabase)publicDatabase;
- (AMSCloudDataDatabase)sharedDatabase;
- (BOOL)isAvailable;
- (NSString)hashedDescription;
- (NSString)identifier;
- (id)_acceptShareWithShareMetadata:(id)a3;
- (id)_fetchShareMetadataForURL:(id)a3 withToken:(id)a4;
- (id)acceptShareURL:(id)a3 withToken:(id)a4;
- (id)fetchUserRecordID;
- (id)queryDeviceToDeviceEncryptionAvailability;
@end

@implementation CKContainer

- (NSString)identifier
{
  return -[CKContainer containerIdentifier](self, "containerIdentifier");
}

- (BOOL)isAvailable
{
  id v3 = objc_alloc_init(&OBJC_CLASS___CKAccountInfo);
  if ([v3 accountStatus])
  {
    if ([v3 accountStatus] == (id)1) {
      unsigned __int8 v4 = [v3 supportsDeviceToDeviceEncryption];
    }
    else {
      unsigned __int8 v4 = 0;
    }
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v5) {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class(self);
      uint64_t v8 = AMSLogKey(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      int v11 = 138543618;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] accountInfo.accountStatus == CKAccountStatusCouldNotDetermine",  (uint8_t *)&v11,  0x16u);
    }

    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (AMSCloudDataDatabase)privateDatabase
{
  return (AMSCloudDataDatabase *)-[CKContainer privateCloudDatabase](self, "privateCloudDatabase");
}

- (AMSCloudDataDatabase)publicDatabase
{
  return (AMSCloudDataDatabase *)-[CKContainer publicCloudDatabase](self, "publicCloudDatabase");
}

- (AMSCloudDataDatabase)sharedDatabase
{
  return (AMSCloudDataDatabase *)-[CKContainer sharedCloudDatabase](self, "sharedCloudDatabase");
}

- (NSString)hashedDescription
{
  return (NSString *)-[CKContainer description](self, "description");
}

- (id)acceptShareURL:(id)a3 withToken:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[CKContainer _fetchShareMetadataForURL:withToken:]( self,  "_fetchShareMetadataForURL:withToken:",  a3,  a4));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001570D4;
  v9[3] = &unk_1001B42E0;
  v9[4] = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 thenWithBlock:v9]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 binaryPromiseAdapter]);

  return v7;
}

- (id)fetchUserRecordID
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100157160;
  v5[3] = &unk_1001B4308;
  id v3 = objc_alloc_init(&OBJC_CLASS___AMSPromise);
  v6 = v3;
  -[CKContainer fetchUserRecordIDWithCompletionHandler:](self, "fetchUserRecordIDWithCompletionHandler:", v5);

  return v3;
}

- (id)queryDeviceToDeviceEncryptionAvailability
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001571F0;
  v5[3] = &unk_1001B4330;
  id v3 = objc_alloc_init(&OBJC_CLASS___AMSPromise);
  v6 = v3;
  -[CKContainer accountInfoWithCompletionHandler:](self, "accountInfoWithCompletionHandler:", v5);

  return v3;
}

- (id)_acceptShareWithShareMetadata:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___AMSPromise);
  v6 = objc_alloc(&OBJC_CLASS___CKAcceptSharesOperation);
  id v13 = v4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  uint64_t v8 = -[CKAcceptSharesOperation initWithShareMetadatas:](v6, "initWithShareMetadatas:", v7);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100157388;
  v11[3] = &unk_1001B4358;
  v9 = v5;
  uint64_t v12 = v9;
  -[CKAcceptSharesOperation setPerShareCompletionBlock:](v8, "setPerShareCompletionBlock:", v11);
  -[CKContainer addOperation:](self, "addOperation:", v8);

  return v9;
}

- (id)_fetchShareMetadataForURL:(id)a3 withToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___CKDeviceToDeviceShareInvitationToken);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
    id v9 = v7;
  }
  else {
    id v9 = 0LL;
  }

  v10 = objc_alloc_init(&OBJC_CLASS___AMSPromise);
  int v11 = objc_alloc(&OBJC_CLASS___CKFetchShareMetadataOperation);
  if (v9)
  {
    id v25 = v6;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
    id v23 = v6;
    id v24 = v9;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    v14 = -[CKFetchShareMetadataOperation initWithShareURLs:invitationTokensByShareURL:]( v11,  "initWithShareURLs:invitationTokensByShareURL:",  v12,  v13);
  }

  else
  {
    id v22 = v6;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    v14 = -[CKFetchShareMetadataOperation initWithShareURLs:](v11, "initWithShareURLs:", v12);
  }

  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_100157570;
  v20 = &unk_1001B4380;
  v15 = v10;
  v21 = v15;
  -[CKFetchShareMetadataOperation setPerShareMetadataBlock:](v14, "setPerShareMetadataBlock:", &v17);
  -[CKContainer addOperation:](self, "addOperation:", v14, v17, v18, v19, v20);

  return v15;
}

@end