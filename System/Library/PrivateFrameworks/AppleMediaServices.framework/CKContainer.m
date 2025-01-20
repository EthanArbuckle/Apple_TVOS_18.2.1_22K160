@interface CKContainer
- (AMSDCloudDataDatabase)privateDatabase;
- (AMSDCloudDataDatabase)publicDatabase;
- (AMSDCloudDataDatabase)sharedDatabase;
- (id)_acceptShareWithShareMetadata:(id)a3;
- (id)_fetchShareMetadataForURL:(id)a3 withToken:(id)a4;
- (id)acceptShareURL:(id)a3 withToken:(id)a4;
- (id)status;
@end

@implementation CKContainer

- (AMSDCloudDataDatabase)privateDatabase
{
  return (AMSDCloudDataDatabase *)-[CKContainer privateCloudDatabase](self, "privateCloudDatabase");
}

- (AMSDCloudDataDatabase)publicDatabase
{
  return (AMSDCloudDataDatabase *)-[CKContainer publicCloudDatabase](self, "publicCloudDatabase");
}

- (AMSDCloudDataDatabase)sharedDatabase
{
  return (AMSDCloudDataDatabase *)-[CKContainer sharedCloudDatabase](self, "sharedCloudDatabase");
}

- (id)acceptShareURL:(id)a3 withToken:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[CKContainer _fetchShareMetadataForURL:withToken:]( self,  "_fetchShareMetadataForURL:withToken:",  a3,  a4));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000481C4;
  v9[3] = &unk_1000D8058;
  v9[4] = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 thenWithBlock:v9]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 binaryPromiseAdapter]);

  return v7;
}

- (id)status
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100048250;
  v5[3] = &unk_1000D8080;
  v3 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  v6 = v3;
  -[CKContainer accountStatusWithCompletionHandler:](self, "accountStatusWithCompletionHandler:", v5);

  return v3;
}

- (id)_acceptShareWithShareMetadata:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  v6 = objc_alloc(&OBJC_CLASS___CKAcceptSharesOperation);
  id v13 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  v8 = -[CKAcceptSharesOperation initWithShareMetadatas:](v6, "initWithShareMetadatas:", v7);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000483F4;
  v11[3] = &unk_1000D80A8;
  v9 = v5;
  v12 = v9;
  -[CKAcceptSharesOperation setPerShareCompletionBlock:](v8, "setPerShareCompletionBlock:", v11);
  -[CKContainer addOperation:](self, "addOperation:", v8);

  return v9;
}

- (id)_fetchShareMetadataForURL:(id)a3 withToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___CKDeviceToDeviceShareInvitationToken, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0) {
    id v10 = v7;
  }
  else {
    id v10 = 0LL;
  }

  v11 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  v12 = objc_alloc(&OBJC_CLASS___CKFetchShareMetadataOperation);
  if (v10)
  {
    id v26 = v6;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
    id v24 = v6;
    id v25 = v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    v15 = -[CKFetchShareMetadataOperation initWithShareURLs:invitationTokensByShareURL:]( v12,  "initWithShareURLs:invitationTokensByShareURL:",  v13,  v14);
  }

  else
  {
    id v23 = v6;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
    v15 = -[CKFetchShareMetadataOperation initWithShareURLs:](v12, "initWithShareURLs:", v13);
  }

  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  v20 = sub_1000485DC;
  v21 = &unk_1000D80D0;
  v16 = v11;
  v22 = v16;
  -[CKFetchShareMetadataOperation setPerShareMetadataBlock:](v15, "setPerShareMetadataBlock:", &v18);
  -[CKContainer addOperation:](self, "addOperation:", v15, v18, v19, v20, v21);

  return v16;
}

@end