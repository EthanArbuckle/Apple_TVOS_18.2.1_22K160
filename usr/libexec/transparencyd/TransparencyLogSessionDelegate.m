@interface TransparencyLogSessionDelegate
- (KTContextStore)contextStore;
- (KTLogClient)logClient;
- (OS_dispatch_workloop)workloop;
- (TransparencyLogSessionDelegate)initWithDataStore:(id)a3 workloop:(id)a4;
- (TransparencyManagedDataStore)dataStore;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)handleDownloadRecord:(id)a3 downloadData:(id)a4 downloadMetadata:(id)a5;
- (void)handleDownloadRecordFailure:(id)a3 task:(id)a4 downloadMetadata:(id)a5 error:(id)a6;
- (void)setContextStore:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setLogClient:(id)a3;
- (void)setWorkloop:(id)a3;
@end

@implementation TransparencyLogSessionDelegate

- (TransparencyLogSessionDelegate)initWithDataStore:(id)a3 workloop:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TransparencyLogSessionDelegate;
  v8 = -[TransparencyLogSessionDelegate init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[TransparencyLogSessionDelegate setDataStore:](v8, "setDataStore:", v6);
    -[TransparencyLogSessionDelegate setWorkloop:](v9, "setWorkloop:", v7);
  }

  return v9;
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v10 = a3;
  id v11 = a4;
  if (qword_1002EEF90 != -1) {
    dispatch_once(&qword_1002EEF90, &stru_10028A540);
  }
  v12 = (void *)qword_1002EEF98;
  if (os_log_type_enabled((os_log_t)qword_1002EEF98, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 currentRequest]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 URL]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 absoluteURL]);
    int v17 = 134218498;
    int64_t v18 = a6;
    __int16 v19 = 2048;
    int64_t v20 = a7;
    __int16 v21 = 2112;
    v22 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Wrote %lld bytes of %lld total bytes for request %@",  (uint8_t *)&v17,  0x20u);
  }
}

- (void)handleDownloadRecord:(id)a3 downloadData:(id)a4 downloadMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSessionDelegate dataStore](self, "dataStore"));
  id v24 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1001D1B88;
  v19[3] = &unk_10028A5A8;
  id v12 = v9;
  id v20 = v12;
  id v13 = v10;
  id v21 = v13;
  v22 = self;
  id v14 = v8;
  id v23 = v14;
  LODWORD(v10) = [v11 performAndWaitForDownloadId:v14 error:&v24 block:v19];
  id v15 = v24;

  if (!(_DWORD)v10 || v15)
  {
    if (qword_1002EEF90 != -1) {
      dispatch_once(&qword_1002EEF90, &stru_10028A5C8);
    }
    v16 = (os_log_s *)qword_1002EEF98;
    if (os_log_type_enabled((os_log_t)qword_1002EEF98, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v14;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to fetch download record %@: %@",  buf,  0x16u);
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"NetworkDownloadEvent",  kKTApplicationIdentifierTLT));
    int64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    [v18 logResultForEvent:v17 hardFailure:1 result:v15];
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_1002EEF90 != -1) {
    dispatch_once(&qword_1002EEF90, &stru_10028A5E8);
  }
  id v11 = (os_log_s *)qword_1002EEF98;
  if (os_log_type_enabled((os_log_t)qword_1002EEF98, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Download task %@ completed successfully",  buf,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 originalRequest]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 response]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "kt_requestId"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v10));
  uint64_t v16 = objc_claimAutoreleasedReturnValue(-[TransparencyLogSessionDelegate workloop](self, "workloop"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1001D2340;
  v25[3] = &unk_10028A610;
  id v17 = v13;
  id v26 = v17;
  __int16 v27 = self;
  id v18 = v14;
  id v28 = v18;
  id v19 = v15;
  id v29 = v19;
  id v20 = v9;
  id v30 = v20;
  +[TransparencyLogSession dispatchToQueue:block:]( &OBJC_CLASS___TransparencyLogSession,  "dispatchToQueue:block:",  v16,  v25);

  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v24 = 0LL;
  LOBYTE(v16) = [v21 removeItemAtURL:v10 error:&v24];
  id v22 = v24;

  if ((v16 & 1) == 0)
  {
    if (qword_1002EEF90 != -1) {
      dispatch_once(&qword_1002EEF90, &stru_10028A630);
    }
    id v23 = (os_log_s *)qword_1002EEF98;
    if (os_log_type_enabled((os_log_t)qword_1002EEF98, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v32 = v10;
      __int16 v33 = 2112;
      id v34 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to delete %@: %@", buf, 0x16u);
    }
  }
}

- (void)handleDownloadRecordFailure:(id)a3 task:(id)a4 downloadMetadata:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSessionDelegate dataStore](self, "dataStore"));
  id v40 = 0LL;
  v31 = _NSConcreteStackBlock;
  uint64_t v32 = 3221225472LL;
  __int16 v33 = sub_1001D26DC;
  id v34 = &unk_10028A6D8;
  id v15 = v13;
  id v35 = v15;
  id v16 = v11;
  id v36 = v16;
  id v17 = v10;
  id v37 = v17;
  id v18 = v12;
  id v38 = v18;
  v39 = self;
  unsigned __int8 v19 = [v14 performAndWaitForDownloadId:v17 error:&v40 block:&v31];
  id v20 = v40;

  id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domain", v31, v32, v33, v34));
  if ([v21 isEqualToString:NSURLErrorDomain])
  {
    id v22 = [v15 code];

    if (v20) {
      unsigned __int8 v23 = 0;
    }
    else {
      unsigned __int8 v23 = v19;
    }
    if ((v23 & 1) != 0) {
      goto LABEL_20;
    }
    if (v22 == (id)-999LL)
    {
      if (qword_1002EEF90 != -1) {
        dispatch_once(&qword_1002EEF90, &stru_10028A718);
      }
      uint64_t v24 = qword_1002EEF98;
      if (os_log_type_enabled((os_log_t)qword_1002EEF98, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v42 = v17;
        v25 = "Failed to fetch cancelled downloadId %{public}@";
        id v26 = (os_log_s *)v24;
        os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
        uint32_t v28 = 12;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v26, v27, v25, buf, v28);
        goto LABEL_20;
      }

      goto LABEL_20;
    }
  }

  else
  {

    if (v20) {
      unsigned __int8 v29 = 0;
    }
    else {
      unsigned __int8 v29 = v19;
    }
    if ((v29 & 1) != 0) {
      goto LABEL_20;
    }
  }

  if (qword_1002EEF90 != -1) {
    dispatch_once(&qword_1002EEF90, &stru_10028A6F8);
  }
  uint64_t v30 = qword_1002EEF98;
  if (os_log_type_enabled((os_log_t)qword_1002EEF98, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v42 = v17;
    __int16 v43 = 2112;
    id v44 = v20;
    v25 = "Failed to fetch downloadId %{public}@ for failed download: %@";
    id v26 = (os_log_s *)v30;
    os_log_type_t v27 = OS_LOG_TYPE_ERROR;
    uint32_t v28 = 22;
    goto LABEL_19;
  }

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v14 originalRequest]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v14 response]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_requestId"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v14 response]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyLogSession createErrorFromURLResonse:data:allowEmptyData:error:]( &OBJC_CLASS___TransparencyLogSession,  "createErrorFromURLResonse:data:allowEmptyData:error:",  v11,  0LL,  1LL,  v7));

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSessionDelegate workloop](self, "workloop"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001D2D80;
    v15[3] = &unk_10028A610;
    v15[4] = self;
    id v16 = v10;
    id v17 = v14;
    id v18 = v9;
    id v19 = v12;
    +[TransparencyLogSession dispatchToQueue:block:]( &OBJC_CLASS___TransparencyLogSession,  "dispatchToQueue:block:",  v13,  v15);
  }
}

- (KTContextStore)contextStore
{
  return (KTContextStore *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setContextStore:(id)a3
{
}

- (KTLogClient)logClient
{
  return (KTLogClient *)objc_loadWeakRetained((id *)&self->_logClient);
}

- (void)setLogClient:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDataStore:(id)a3
{
}

- (OS_dispatch_workloop)workloop
{
  return (OS_dispatch_workloop *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setWorkloop:(id)a3
{
}

- (void).cxx_destruct
{
}

@end