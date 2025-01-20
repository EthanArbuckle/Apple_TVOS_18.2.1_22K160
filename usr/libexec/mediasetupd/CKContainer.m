@interface CKContainer
+ (id)MSDCloudKitContainer;
+ (id)MSDCloudKitContainerID;
+ (id)MSDPublicCloudKitContainer;
+ (id)MSDPublicCloudKitContainerID;
- (void)acceptShareWithShareMetadata:(id)a3 completion:(id)a4;
- (void)fetchShareMetadataForShareURL:(id)a3 withShareToken:(id)a4 completion:(id)a5;
@end

@implementation CKContainer

+ (id)MSDCloudKitContainer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100032314;
  block[3] = &unk_100060A90;
  block[4] = a1;
  if (qword_100070808 != -1) {
    dispatch_once(&qword_100070808, block);
  }
  return (id)qword_100070800;
}

+ (id)MSDCloudKitContainerID
{
  return kMediaSetupCloudKitContainerIdentifier;
}

+ (id)MSDPublicCloudKitContainer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100032440;
  block[3] = &unk_100060A90;
  block[4] = a1;
  if (qword_100070818 != -1) {
    dispatch_once(&qword_100070818, block);
  }
  return (id)qword_100070810;
}

+ (id)MSDPublicCloudKitContainerID
{
  return kMediaSetupPublicCloudKitContainerIdentifier;
}

- (void)acceptShareWithShareMetadata:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10003E9DC();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315395;
    v24 = "-[CKContainer(MSDCloudDataContainer) acceptShareWithShareMetadata:completion:]";
    __int16 v25 = 2113;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s shareMetaData %{private}@", buf, 0x16u);
  }

  if (v6)
  {
    v10 = objc_alloc(&OBJC_CLASS___CKAcceptSharesOperation);
    id v20 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
    v12 = -[CKAcceptSharesOperation initWithShareMetadatas:](v10, "initWithShareMetadatas:", v11);

    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    v17 = sub_1000326E8;
    v18 = &unk_1000625B8;
    id v19 = v7;
    -[CKAcceptSharesOperation setPerShareCompletionBlock:](v12, "setPerShareCompletionBlock:", &v15);
    -[CKAcceptSharesOperation setQualityOfService:](v12, "setQualityOfService:", 17LL, v15, v16, v17, v18);
    -[CKContainer addOperation:](self, "addOperation:", v12);
    v13 = v19;
LABEL_7:

    goto LABEL_8;
  }

  if (v7)
  {
    uint64_t v14 = MSErrorDomain;
    uint64_t v21 = MSUserInfoErrorStringKey;
    v22 = @"Failed to accept share for Nil ShareMetaData";
    v12 = (CKAcceptSharesOperation *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  1LL,  v12));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v13);
    goto LABEL_7;
  }

- (void)fetchShareMetadataForShareURL:(id)a3 withShareToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10003E9DC();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315651;
    v30 = "-[CKContainer(MSDCloudDataContainer) fetchShareMetadataForShareURL:withShareToken:completion:]";
    __int16 v31 = 2113;
    id v32 = v8;
    __int16 v33 = 2113;
    id v34 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s URL %{private}@ shareToken  %{private}@",  buf,  0x20u);
  }

  if (v8)
  {
    v13 = objc_alloc(&OBJC_CLASS___CKFetchShareMetadataOperation);
    if (v9)
    {
      id v26 = v8;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
      id v24 = v8;
      id v25 = v9;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
      uint64_t v16 = -[CKFetchShareMetadataOperation initWithShareURLs:invitationTokensByShareURL:]( v13,  "initWithShareURLs:invitationTokensByShareURL:",  v14,  v15);
    }

    else
    {
      id v23 = v8;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
      uint64_t v16 = -[CKFetchShareMetadataOperation initWithShareURLs:](v13, "initWithShareURLs:", v14);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100032A54;
    v21[3] = &unk_1000625E0;
    id v22 = v10;
    -[CKFetchShareMetadataOperation setPerShareMetadataBlock:](v16, "setPerShareMetadataBlock:", v21);
    -[CKFetchShareMetadataOperation setFetchShareMetadataCompletionBlock:]( v16,  "setFetchShareMetadataCompletionBlock:",  &stru_100062600);
    -[CKFetchShareMetadataOperation setQualityOfService:](v16, "setQualityOfService:", 17LL);
    -[CKContainer addOperation:](self, "addOperation:", v16);
    id v20 = v22;
    goto LABEL_12;
  }

  id v17 = sub_10003E9DC();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_100032C04(v18);
  }

  if (v10)
  {
    uint64_t v19 = MSErrorDomain;
    uint64_t v27 = MSUserInfoErrorStringKey;
    v28 = @"Failed to fetchShareMetadata for Nil Share URL";
    uint64_t v16 = (CKFetchShareMetadataOperation *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v19,  1LL,  v16));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v20);
LABEL_12:
  }
}

@end