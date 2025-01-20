@interface RMStoreDataFetcher
- (BOOL)_moveDownloadedFile:(id)a3 downloadURL:(id)a4 error:(id *)a5;
- (BOOL)_validateResponseForURL:(id)a3 statusCode:(id)a4 headers:(id)a5 fetchedData:(id)a6 downloadURL:(id)a7 error:(id *)a8;
- (NSURLSession)URLSession;
- (id)_createRequestWithURL:(id)a3 additionalHeaders:(id)a4;
- (id)_dataTaskWithURL:(id)a3 additionalHeaders:(id)a4 completionHandler:(id)a5;
- (id)_dictionaryForResponse:(id)a3 downloadedData:(id)a4 downloadedURL:(id)a5;
- (id)_downloadTaskWithURL:(id)a3 additionalHeaders:(id)a4 completionHandler:(id)a5;
- (id)_makeSession;
- (id)_userAgent;
- (void)_downloadDataAtURL:(id)a3 downloadURL:(id)a4 additionalHeaders:(id)a5 completionHandler:(id)a6;
- (void)_downloadMDMDataAtURL:(id)a3 downloadURL:(id)a4 completionHandler:(id)a5;
- (void)_fetchDataAtURL:(id)a3 additionalHeaders:(id)a4 completionHandler:(id)a5;
- (void)_fetchMDMDataAtURL:(id)a3 completionHandler:(id)a4;
- (void)_processDataResponseWithURL:(id)a3 response:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)_processDownloadResponseWithURL:(id)a3 downloadURL:(id)a4 response:(id)a5 error:(id)a6 completionHandler:(id)a7;
- (void)downloadDataAtURL:(id)a3 downloadURL:(id)a4 extensionToken:(id)a5 useDDM:(BOOL)a6 completionHandler:(id)a7;
- (void)downloadResponseDataAtURL:(id)a3 downloadURL:(id)a4 extensionToken:(id)a5 useDDM:(BOOL)a6 additionalHeaders:(id)a7 completionHandler:(id)a8;
- (void)fetchDataAtURL:(id)a3 useDDM:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchResponseDataAtURL:(id)a3 useDDM:(BOOL)a4 additionalHeaders:(id)a5 completionHandler:(id)a6;
- (void)setURLSession:(id)a3;
@end

@implementation RMStoreDataFetcher

- (void)fetchDataAtURL:(id)a3 useDDM:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000715C8;
  v9[3] = &unk_1000BAD68;
  v10 = self;
  id v11 = a3;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  -[RMStoreDataFetcher fetchResponseDataAtURL:useDDM:additionalHeaders:completionHandler:]( v10,  "fetchResponseDataAtURL:useDDM:additionalHeaders:completionHandler:",  v8,  v6,  0LL,  v9);
}

- (void)fetchResponseDataAtURL:(id)a3 useDDM:(BOOL)a4 additionalHeaders:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void, void *))a6;
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeDataFetcher](&OBJC_CLASS___RMLog, "storeDataFetcher"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100073528();
  }

  if ((+[RMStoreUtility isValidURL:](&OBJC_CLASS___RMStoreUtility, "isValidURL:", v10) & 1) != 0)
  {
    if (v8
      && (v14 = (void *)objc_claimAutoreleasedReturnValue([v10 scheme]),
          id v15 = [v14 caseInsensitiveCompare:@"https"],
          v14,
          !v15))
    {
      -[RMStoreDataFetcher _fetchMDMDataAtURL:completionHandler:]( self,  "_fetchMDMDataAtURL:completionHandler:",  v10,  v12);
    }

    else
    {
      -[RMStoreDataFetcher _fetchDataAtURL:additionalHeaders:completionHandler:]( self,  "_fetchDataAtURL:additionalHeaders:completionHandler:",  v10,  v11,  v12);
    }
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createAssetInvalidURLError:]( &OBJC_CLASS___RMErrorUtilities,  "createAssetInvalidURLError:",  v10));
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeDataFetcher](&OBJC_CLASS___RMLog, "storeDataFetcher"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000734C8();
    }

    v12[2](v12, 0LL, v16);
  }
}

- (void)downloadDataAtURL:(id)a3 downloadURL:(id)a4 extensionToken:(id)a5 useDDM:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (!v14)
  {
    uint64_t v16 = -1LL;
LABEL_7:
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000718FC;
    v20[3] = &unk_1000BADB8;
    v20[4] = self;
    id v21 = v12;
    id v22 = v13;
    uint64_t v24 = v16;
    id v23 = v15;
    -[RMStoreDataFetcher downloadResponseDataAtURL:downloadURL:extensionToken:useDDM:additionalHeaders:completionHandler:]( self,  "downloadResponseDataAtURL:downloadURL:extensionToken:useDDM:additionalHeaders:completionHandler:",  v21,  v22,  0LL,  v8,  0LL,  v20);

    goto LABEL_11;
  }

  uint64_t v16 = (uint64_t)+[RMSandbox consumeToken:](&OBJC_CLASS___RMSandbox, "consumeToken:", v14);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeDataFetcher](&OBJC_CLASS___RMLog, "storeDataFetcher"));
  v18 = v17;
  if (v16 != -1)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_100064E10();
    }

    goto LABEL_7;
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_10007358C();
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
  (*((void (**)(id, void *))v15 + 2))(v15, v19);

LABEL_11:
}

- (void)downloadResponseDataAtURL:(id)a3 downloadURL:(id)a4 extensionToken:(id)a5 useDDM:(BOOL)a6 additionalHeaders:(id)a7 completionHandler:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v18 = (void (**)(id, void, void *))a8;
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeDataFetcher](&OBJC_CLASS___RMLog, "storeDataFetcher"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_100073660();
  }

  if ((+[RMStoreUtility isValidURL:](&OBJC_CLASS___RMStoreUtility, "isValidURL:", v14) & 1) == 0)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createAssetInvalidURLError:]( &OBJC_CLASS___RMErrorUtilities,  "createAssetInvalidURLError:",  v14));
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeDataFetcher](&OBJC_CLASS___RMLog, "storeDataFetcher"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100073600();
    }

    goto LABEL_12;
  }

  if (v16)
  {
    uint64_t v20 = (uint64_t)+[RMSandbox consumeToken:](&OBJC_CLASS___RMSandbox, "consumeToken:", v16);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeDataFetcher](&OBJC_CLASS___RMLog, "storeDataFetcher"));
    id v22 = v21;
    if (v20 != -1)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_100064E10();
      }

      goto LABEL_14;
    }

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10007358C();
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
LABEL_12:
    v18[2](v18, 0LL, v23);

    goto LABEL_21;
  }

  uint64_t v20 = -1LL;
LABEL_14:
  id v33 = v17;
  if (v10)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v14 scheme]);
    BOOL v26 = [v25 caseInsensitiveCompare:@"https"] == 0;
  }

  else
  {
    BOOL v26 = 0;
  }

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100071D5C;
  v38[3] = &unk_1000BADE0;
  BOOL v42 = v26;
  v38[4] = self;
  id v27 = v15;
  id v39 = v27;
  uint64_t v41 = v20;
  v40 = v18;
  v28 = objc_retainBlock(v38);
  v29 = v28;
  if (v26)
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_100071E7C;
    v36[3] = &unk_1000BAE08;
    v30 = (id *)&v37;
    v37 = v28;
    v31 = v28;
    -[RMStoreDataFetcher _downloadMDMDataAtURL:downloadURL:completionHandler:]( self,  "_downloadMDMDataAtURL:downloadURL:completionHandler:",  v14,  v27,  v36);
    id v17 = v33;
  }

  else
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100071E88;
    v34[3] = &unk_1000BAE08;
    v30 = (id *)&v35;
    v35 = v28;
    v32 = v28;
    id v17 = v33;
    -[RMStoreDataFetcher _downloadDataAtURL:downloadURL:additionalHeaders:completionHandler:]( self,  "_downloadDataAtURL:downloadURL:additionalHeaders:completionHandler:",  v14,  v27,  v33,  v34);
  }

LABEL_21:
}

- (id)_makeSession
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v2,  0LL,  0LL));

  return v3;
}

- (void)_fetchMDMDataAtURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100071FA8;
  v9[3] = &unk_1000BAE30;
  id v10 = (id)os_transaction_create("com.apple.RemoteManagement.fetchingData");
  id v11 = v5;
  id v7 = v10;
  id v8 = v5;
  +[RMMCAdapter fetchDataAtURL:completionHandler:]( &OBJC_CLASS___RMMCAdapter,  "fetchDataAtURL:completionHandler:",  v6,  v9);
}

- (void)_fetchDataAtURL:(id)a3 additionalHeaders:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = (void *)os_transaction_create("com.apple.RemoteManagement.fetchingData");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreDataFetcher _makeSession](self, "_makeSession"));
  -[RMStoreDataFetcher setURLSession:](self, "setURLSession:", v12);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100072118;
  v18[3] = &unk_1000BAE58;
  id v13 = v8;
  id v19 = v13;
  id v14 = v9;
  id v21 = v14;
  id v15 = v11;
  id v20 = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreDataFetcher _dataTaskWithURL:additionalHeaders:completionHandler:]( self,  "_dataTaskWithURL:additionalHeaders:completionHandler:",  v13,  v10,  v18));

  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeDataFetcher](&OBJC_CLASS___RMLog, "storeDataFetcher"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_100073730();
  }

  [v16 resume];
}

- (id)_dataTaskWithURL:(id)a3 additionalHeaders:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreDataFetcher _createRequestWithURL:additionalHeaders:]( self,  "_createRequestWithURL:additionalHeaders:",  a3,  a4));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreDataFetcher URLSession](self, "URLSession"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100072294;
  v14[3] = &unk_1000BAE80;
  v14[4] = self;
  id v15 = v8;
  id v11 = v8;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dataTaskWithRequest:v9 completionHandler:v14]);

  return v12;
}

- (void)_processDataResponseWithURL:(id)a3 response:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    id v13 = a6;
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeDataFetcher](&OBJC_CLASS___RMLog, "storeDataFetcher"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000739A4();
    }

    id v15 = v12;
    id v16 = 0LL;
  }

  else
  {
    uint64_t v17 = HTTPResponseKeyBody;
    id v18 = a6;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v17]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:HTTPResponseKeyStatusCode]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:HTTPResponseKeyHeaders]);
    id v29 = 0LL;
    unsigned int v22 = -[RMStoreDataFetcher _validateResponseForURL:statusCode:headers:fetchedData:downloadURL:error:]( self,  "_validateResponseForURL:statusCode:headers:fetchedData:downloadURL:error:",  v10,  v20,  v21,  v19,  0LL,  &v29);
    id v23 = v29;

    if (v22)
    {
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeDataFetcher](&OBJC_CLASS___RMLog, "storeDataFetcher"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        sub_1000738A8(v10, v24);
      }
      id v15 = 0LL;
      v25 = v19;
      id v16 = v19;
    }

    else
    {
      id v26 = [v23 code];
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeDataFetcher](&OBJC_CLASS___RMLog, "storeDataFetcher"));
      BOOL v27 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
      if (v26 == (id)1000)
      {
        if (v27) {
          sub_1000653EC();
        }
      }

      else if (v27)
      {
        sub_100073928();
      }

      id v16 = 0LL;
      v25 = v23;
      id v15 = v23;
    }

    id v28 = v25;
  }

  (*((void (**)(id, void *, id))a6 + 2))(a6, v16, v15);
}

- (void)_downloadMDMDataAtURL:(id)a3 downloadURL:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10007262C;
  v12[3] = &unk_1000BAE30;
  id v13 = (id)os_transaction_create("com.apple.RemoteManagement.downloadingData");
  id v14 = v7;
  id v10 = v13;
  id v11 = v7;
  +[RMMCAdapter downloadDataAtURL:downloadURL:completionHandler:]( &OBJC_CLASS___RMMCAdapter,  "downloadDataAtURL:downloadURL:completionHandler:",  v9,  v8,  v12);
}

- (void)_downloadDataAtURL:(id)a3 downloadURL:(id)a4 additionalHeaders:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = (void *)os_transaction_create("com.apple.RemoteManagement.downloadingData");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreDataFetcher _makeSession](self, "_makeSession"));
  -[RMStoreDataFetcher setURLSession:](self, "setURLSession:", v13);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10007279C;
  v19[3] = &unk_1000BAE58;
  id v14 = v9;
  id v20 = v14;
  id v15 = v10;
  id v22 = v15;
  id v16 = v12;
  id v21 = v16;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreDataFetcher _downloadTaskWithURL:additionalHeaders:completionHandler:]( self,  "_downloadTaskWithURL:additionalHeaders:completionHandler:",  v14,  v11,  v19));

  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeDataFetcher](&OBJC_CLASS___RMLog, "storeDataFetcher"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_100073A20();
  }

  [v17 resume];
}

- (id)_downloadTaskWithURL:(id)a3 additionalHeaders:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreDataFetcher _createRequestWithURL:additionalHeaders:]( self,  "_createRequestWithURL:additionalHeaders:",  a3,  a4));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreDataFetcher URLSession](self, "URLSession"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100072918;
  v14[3] = &unk_1000BAEA8;
  v14[4] = self;
  id v15 = v8;
  id v11 = v8;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 downloadTaskWithRequest:v9 completionHandler:v14]);

  return v12;
}

- (BOOL)_moveDownloadedFile:(id)a3 downloadURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = HTTPResponseKeyStatusCode;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v8]);
  id v11 = [v10 integerValue];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:HTTPResponseKeyDownloadURL]);
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v34 = 0LL;
    unsigned int v14 = [v13 removeItemAtURL:v7 error:&v34];
    id v15 = v34;

    if (v14)
    {
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeDataFetcher](&OBJC_CLASS___RMLog, "storeDataFetcher"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100073C28(v7, v16);
      }

      goto LABEL_6;
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue([v15 domain]);
    if ([v25 isEqualToString:NSCocoaErrorDomain])
    {
      id v26 = [v15 code];

      if (v26 == (id)4)
      {
LABEL_6:
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v33 = v15;
        unsigned int v18 = [v17 moveItemAtURL:v12 toURL:v7 error:&v33];
        id v19 = v33;

        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeDataFetcher](&OBJC_CLASS___RMLog, "storeDataFetcher"));
        id v21 = v20;
        if (v18)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            sub_100073B98();
          }
          BOOL v22 = 1;
          goto LABEL_33;
        }

        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
          v32 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
          *(_DWORD *)buf = 138543874;
          v36 = v31;
          __int16 v37 = 2114;
          v38 = v32;
          __int16 v39 = 2114;
          id v40 = v19;
          _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to relocate downloaded asset file from %{public}@ to %{public}@: %{public}@",  buf,  0x20u);
        }

        if (a5)
        {
          BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createAssetCannotProcessFileErrorWithUnderlyingError:]( &OBJC_CLASS___RMErrorUtilities,  "createAssetCannotProcessFileErrorWithUnderlyingError:",  v19));
          id v21 = v27;
          if (v27)
          {
            id v21 = v27;
            BOOL v22 = 0;
            *a5 = v21;
          }

          else
          {
            BOOL v22 = 0;
          }

- (void)_processDownloadResponseWithURL:(id)a3 downloadURL:(id)a4 response:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v15)
  {
    id v16 = a7;
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeDataFetcher](&OBJC_CLASS___RMLog, "storeDataFetcher"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100073DB4();
    }

    id v18 = (id)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createAssetCannotBeDownloadedErrorWithUnderlyingError:]( &OBJC_CLASS___RMErrorUtilities,  "createAssetCannotBeDownloadedErrorWithUnderlyingError:",  v15));
  }

  else
  {
    uint64_t v19 = HTTPResponseKeyStatusCode;
    id v20 = a7;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v19]);
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:HTTPResponseKeyHeaders]);
    id v29 = 0LL;
    unsigned int v23 = -[RMStoreDataFetcher _validateResponseForURL:statusCode:headers:fetchedData:downloadURL:error:]( self,  "_validateResponseForURL:statusCode:headers:fetchedData:downloadURL:error:",  v12,  v21,  v22,  0LL,  v13,  &v29);
    id v24 = v29;

    if (v23)
    {
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeDataFetcher](&OBJC_CLASS___RMLog, "storeDataFetcher"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        sub_100073D24();
      }

      id v18 = 0LL;
    }

    else
    {
      id v26 = [v24 code];
      BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeDataFetcher](&OBJC_CLASS___RMLog, "storeDataFetcher"));
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
      if (v26 == (id)1000)
      {
        if (v28) {
          sub_1000653EC();
        }
      }

      else if (v28)
      {
        sub_100073928();
      }

      id v18 = v24;
    }
  }

  (*((void (**)(id, id))a7 + 2))(a7, v18);
}

- (id)_dictionaryForResponse:(id)a3 downloadedData:(id)a4 downloadedURL:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  4LL));
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(v7, v11) & 1) != 0)
  {
    id v12 = v7;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v12 statusCode]));
    [v10 setObject:v13 forKeyedSubscript:HTTPResponseKeyStatusCode];

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 allHeaderFields]);
    [v10 setObject:v14 forKeyedSubscript:HTTPResponseKeyHeaders];
  }

  else
  {
    [v10 setObject:&off_1000BEBF0 forKeyedSubscript:HTTPResponseKeyStatusCode];
    [v10 setObject:&__NSDictionary0__struct forKeyedSubscript:HTTPResponseKeyHeaders];
  }

  [v10 setObject:v9 forKeyedSubscript:HTTPResponseKeyBody];

  [v10 setObject:v8 forKeyedSubscript:HTTPResponseKeyDownloadURL];
  id v15 = [v10 copy];

  return v15;
}

- (id)_createRequestWithURL:(id)a3 additionalHeaders:(id)a4
{
  if (a4)
  {
    id v7 = a3;
    id v8 = [a4 mutableCopy];
  }

  else
  {
    id v9 = a3;
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  1LL));
  }

  id v10 = v8;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreDataFetcher _userAgent](self, "_userAgent"));
  [v10 setObject:v11 forKeyedSubscript:@"User-Agent"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", a3));
  [v12 setAllHTTPHeaderFields:v10];

  return v12;
}

- (id)_userAgent
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100073210;
  block[3] = &unk_1000B9150;
  block[4] = self;
  if (qword_1000CF3D8 != -1) {
    dispatch_once(&qword_1000CF3D8, block);
  }
  return (id)qword_1000CF3D0;
}

- (BOOL)_validateResponseForURL:(id)a3 statusCode:(id)a4 headers:(id)a5 fetchedData:(id)a6 downloadURL:(id)a7 error:(id *)a8
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = a4;
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeDataFetcher](&OBJC_CLASS___RMLog, "storeDataFetcher"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100073E94(v12, v16);
  }

  uint64_t v17 = (char *)[v15 integerValue];
  unint64_t v18 = (unint64_t)(v17 - 600);
  if ((unint64_t)(v17 - 600) >= 0xFFFFFFFFFFFFFF38LL)
  {
    if (v14)
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v14));

      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      [v20 removeItemAtURL:v14 error:0];

      id v13 = (id)v19;
    }

    if (v13) {
      id v21 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 base64EncodedStringWithOptions:0]);
    }
    else {
      id v21 = @"Empty Response Body";
    }
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createHTTPErrorWithStatusCode:reason:]( &OBJC_CLASS___RMErrorUtilities,  "createHTTPErrorWithStatusCode:reason:",  v17,  v21));
    unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeDataFetcher](&OBJC_CLASS___RMLog, "storeDataFetcher"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_100073E30();
    }

    if (a8 && v22) {
      *a8 = v22;
    }
  }

  return v18 < 0xFFFFFFFFFFFFFF38LL;
}

- (NSURLSession)URLSession
{
  return self->_URLSession;
}

- (void)setURLSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end