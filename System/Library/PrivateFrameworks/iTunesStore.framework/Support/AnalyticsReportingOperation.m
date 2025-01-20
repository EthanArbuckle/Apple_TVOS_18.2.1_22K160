@interface AnalyticsReportingOperation
- (AnalyticsReportingOperation)init;
- (AnalyticsReportingOperation)initWithController:(id)a3;
- (BOOL)_runForReportingURL:(id)a3 suppressUserInfo:(BOOL)a4 error:(id *)a5;
- (BOOL)_runSSMetrics;
- (BOOL)_shouldBackoffAfterError:(id)a3;
- (BOOL)_shouldClearEventsDespiteError:(id)a3;
- (id)_path;
- (id)_signatureWithData:(id)a3 error:(id *)a4;
- (id)finishBlock;
- (id)operation:(id)a3 needNewBodyStream:(id)a4;
- (id)uniqueKey;
- (void)_destroyOutputFile:(id)a3;
- (void)_runAMSMetrics;
- (void)run;
- (void)setFinishBlock:(id)a3;
@end

@implementation AnalyticsReportingOperation

- (AnalyticsReportingOperation)initWithController:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AnalyticsReportingOperation;
  v5 = -[AnalyticsReportingOperation init](&v15, "init");
  if (v5)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    v5->_insertTimestamp = vcvtpd_s64_f64(v6);
    if (v4) {
      v7 = (SSMetricsEventController *)v4;
    }
    else {
      v7 = objc_alloc_init(&OBJC_CLASS___SSMetricsEventController);
    }
    controller = v5->_controller;
    v5->_controller = v7;

    v16[0] = CPSharedResourcesDirectory(v9);
    v16[1] = @"Library";
    v16[2] = @"Caches";
    v16[3] = @"com.apple.itunesstored";
    v16[4] = @"AnalyticsReportingOperation";
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 5LL));
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v10));
    directory = v5->_directory;
    v5->_directory = (NSString *)v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v13,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v5->_directory,  1LL,  0LL,  0LL);
  }

  return v5;
}

- (AnalyticsReportingOperation)init
{
  return -[AnalyticsReportingOperation initWithController:](self, "initWithController:", 0LL);
}

- (id)finishBlock
{
  id v3 = [self->_finishBlock copy];
  -[AnalyticsReportingOperation unlock](self, "unlock");
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setFinishBlock:(id)a3
{
  id v6 = a3;
  -[AnalyticsReportingOperation lock](self, "lock");
  if (self->_finishBlock != v6)
  {
    id v4 = [v6 copy];
    id finishBlock = self->_finishBlock;
    self->_id finishBlock = v4;
  }

  -[AnalyticsReportingOperation unlock](self, "unlock");
}

- (void)run
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMetrics bagSubProfile](&OBJC_CLASS___AMSMetrics, "bagSubProfile"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMetrics bagSubProfileVersion](&OBJC_CLASS___AMSMetrics, "bagSubProfileVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag bagForProfile:profileVersion:](&OBJC_CLASS___AMSBag, "bagForProfile:profileVersion:", v3, v4));

  if (_os_feature_enabled_impl("AppleMediaServices", "iTunesStoreMetrics")
    && objc_msgSend(v5, "asd_iTunesStoreMetricsIsEnabled"))
  {
    -[AnalyticsReportingOperation _runAMSMetrics](self, "_runAMSMetrics");
    BOOL v6 = 0LL;
  }

  else
  {
    BOOL v6 = -[AnalyticsReportingOperation _runSSMetrics](self, "_runSSMetrics");
  }

  unsigned int v7 = -[SSMetricsEventController deleteReportedEvents](self->_controller, "deleteReportedEvents");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v9 = [v8 shouldLog];
  else {
    LODWORD(v10) = v9;
  }
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    uint64_t v10 = v10;
  }
  else {
    v10 &= 2u;
  }
  if ((_DWORD)v10)
  {
    int v26 = 138412546;
    id v27 = (id)objc_opt_class(self);
    __int16 v28 = 1024;
    LODWORD(v29) = v7;
    id v12 = v27;
    v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "[%@] Deleted Reported Events. [Success: %d]",  &v26,  18);

    if (!v13) {
      goto LABEL_17;
    }
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
    free(v13);
    v24 = v11;
    SSFileLog(v8, @"%@");
  }

LABEL_17:
  unsigned int v14 = -[SSMetricsEventController deleteEventsInsertedBefore:]( self->_controller,  "deleteEventsInsertedBefore:",  self->_insertTimestamp - 172800);
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v15) {
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v16 = objc_msgSend(v15, "shouldLog", v24);
  else {
    LODWORD(v17) = v16;
  }
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
    uint64_t v17 = v17;
  }
  else {
    v17 &= 2u;
  }
  if ((_DWORD)v17)
  {
    v19 = (void *)objc_opt_class(self);
    int v26 = 138412802;
    id v27 = v19;
    __int16 v28 = 2048;
    uint64_t v29 = 172800LL;
    __int16 v30 = 1024;
    unsigned int v31 = v14;
    id v20 = v19;
    LODWORD(v25) = 28;
    v21 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  1LL,  "[%@] Deleted Out-Of-Date Events. [Max Age: %lld] [Success: %d]",  &v26,  v25);

    if (!v21) {
      goto LABEL_29;
    }
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v21,  4LL));
    free(v21);
    SSFileLog(v15, @"%@");
  }

LABEL_29:
  -[AnalyticsReportingOperation setSuccess:](self, "setSuccess:", 1LL);
  uint64_t v22 = objc_claimAutoreleasedReturnValue(-[AnalyticsReportingOperation finishBlock](self, "finishBlock"));
  v23 = (void *)v22;
  if (v22)
  {
    (*(void (**)(uint64_t, BOOL))(v22 + 16))(v22, v6);
    -[AnalyticsReportingOperation setFinishBlock:](self, "setFinishBlock:", 0LL);
  }
}

- (id)uniqueKey
{
  return @"com.apple.itunesstored.AnalyticsReportingOperation";
}

- (id)operation:(id)a3 needNewBodyStream:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AnalyticsReportingOperation _path](self, "_path", a3, a4));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v7 = [v6 fileExistsAtPath:self->_path];

  if (v7) {
    v8 = -[NSInputStream initWithFileAtPath:]( objc_alloc(&OBJC_CLASS___NSInputStream),  "initWithFileAtPath:",  self->_path);
  }
  else {
    v8 = 0LL;
  }

  return v8;
}

- (void)_destroyOutputFile:(id)a3
{
  id v4 = a3;
  if (!CFPreferencesGetAppBooleanValue(@"DisableMetricsFileCleanup", kSSUserDefaultsIdentifier, 0LL))
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
    -[NSFileManager removeItemAtPath:error:](v3, "removeItemAtPath:error:", v4, 0LL);
  }
}

- (id)_path
{
  path = self->_path;
  if (!path)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v5 = v4;
    if (v4) {
      BOOL v6 = (NSString *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    }
    else {
      BOOL v6 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%p", self);
    }
    unsigned int v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", v6));
    unsigned int v9 = (NSString *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathExtension:@"gzip"]);
    uint64_t v10 = self->_path;
    self->_path = v9;

    path = self->_path;
  }

  return path;
}

- (BOOL)_runForReportingURL:(id)a3 suppressUserInfo:(BOOL)a4 error:(id *)a5
{
  BOOL v70 = a4;
  id v72 = a3;
  id v67 = 0LL;
  char v65 = 1;
  uint64_t v66 = SSHTTPHeaderXAppleActionSignature;
  while (1)
  {
    v73 = objc_autoreleasePoolPush();
    id v6 = [[SSMetricsEventReportingSession alloc] initWithReportingURL:v72 insertTimestamp:self->_insertTimestamp suppressUserInfo:v70 eventController:self->_controller];
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[AnalyticsReportingOperation _path](self, "_path"));
    context = objc_autoreleasePoolPush();
    v8 = 0LL;
    unsigned int v9 = 1;
    do
    {
      -[AnalyticsReportingOperation _destroyOutputFile:](self, "_destroyOutputFile:", v7);
      id v10 = [[SSGzipOutputStream alloc] initToFileAtPath:v7 append:0];

      [v10 open];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 writeEventsToStream:v10 uncompressedMaxSize:0x80000]);
      [v10 close];
      char v12 = 1;
      if (v11) {
        break;
      }
      v8 = v10;
    }

    while (v9++ <= 1);
    if (!v11)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v53) {
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v54 = [v53 shouldLog];
      else {
        unsigned int v55 = v54;
      }
      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue([v53 OSLogObject]);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        uint64_t v57 = v55;
      }
      else {
        uint64_t v57 = v55 & 2;
      }
      if ((_DWORD)v57)
      {
        v58 = (void *)objc_opt_class(self);
        int v77 = 138412290;
        v78 = v58;
        id v59 = v58;
        LODWORD(v63) = 12;
        v60 = (void *)_os_log_send_and_compose_impl( v57,  0LL,  0LL,  0LL,  &_mh_execute_header,  v56,  16LL,  "[%@]: Metrics post failed. Digest is nil",  &v77,  v63);

        if (v60)
        {
          v56 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v60,  4LL));
          free(v60);
          v62 = v56;
          SSFileLog(v53, @"%@");
          goto LABEL_67;
        }
      }

      else
      {
LABEL_67:
      }

      objc_autoreleasePoolPop(context);
LABEL_69:
      char v12 = 0;
      goto LABEL_70;
    }

    id v14 = [v10 streamContentLength];

    objc_autoreleasePoolPop(context);
    if (!(_DWORD)v14) {
      goto LABEL_69;
    }
    id v15 = v14;
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v17) = [v16 shouldLog];
    unsigned int v18 = [v16 shouldLogToDisk];
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    id v20 = v19;
    if (v18) {
      LODWORD(v17) = v17 | 2;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      uint64_t v17 = v17;
    }
    else {
      v17 &= 2u;
    }
    if (!(_DWORD)v17) {
      goto LABEL_19;
    }
    v21 = (void *)objc_opt_class(self);
    int v77 = 138412546;
    v78 = v21;
    __int16 v79 = 2112;
    id v80 = v72;
    id v22 = v21;
    LODWORD(v63) = 22;
    v23 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  1LL,  "[%@] Reporting analytics events to %@",  &v77,  v63);

    if (v23)
    {
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
      free(v23);
      SSFileLog(v16, @"%@");
LABEL_19:
    }

    v24 = -[SSMutableURLRequestProperties initWithURL:]( objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties),  "initWithURL:",  v72);
    -[SSMutableURLRequestProperties setAllowedRetryCount:](v24, "setAllowedRetryCount:", 0LL);
    -[SSMutableURLRequestProperties setCachePolicy:](v24, "setCachePolicy:", 1LL);
    -[SSMutableURLRequestProperties setNetworkServiceType:](v24, "setNetworkServiceType:", 3LL);
    -[SSMutableURLRequestProperties setShouldDecodeResponse:](v24, "setShouldDecodeResponse:", 0LL);
    -[SSMutableURLRequestProperties setTimeoutInterval:](v24, "setTimeoutInterval:", 10.0);
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v24,  "setValue:forHTTPHeaderField:",  @"gzip",  @"Content-Encoding");
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v24,  "setValue:forHTTPHeaderField:",  @"application/json; charset=utf-8",
      @"Content-Type");
    contexta = v24;
    v71 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionCanaryIdentifier]);
    if (v71 && [v71 length]) {
      -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v24,  "setValue:forHTTPHeaderField:",  v71,  @"X-Apple-Canary-Id");
    }
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", v15));
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( contexta,  "setValue:forHTTPHeaderField:",  v25,  @"Content-Length");

    if (SSDebugShouldLogFullMetricsRequest(-[SSMutableURLRequestProperties setHTTPMethod:](contexta, "setHTTPMethod:", @"POST"))
      && (int v26 = (void *)objc_claimAutoreleasedReturnValue([v72 absoluteString]),
          unsigned int v27 = [v26 containsString:@"xp.apple.com"],
          v26,
          v27))
    {
      __int16 v28 = (NSInputStream *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v7));
      -[SSMutableURLRequestProperties setHTTPBody:](contexta, "setHTTPBody:", v28);
    }

    else
    {
      __int16 v28 = -[NSInputStream initWithFileAtPath:](objc_alloc(&OBJC_CLASS___NSInputStream), "initWithFileAtPath:", v7);
      -[SSMutableURLRequestProperties setHTTPBodyStream:](contexta, "setHTTPBodyStream:", v28);
    }

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( -[AnalyticsReportingOperation _signatureWithData:error:]( self,  "_signatureWithData:error:",  v11,  0LL));
    __int16 v30 = v29;
    if (v29)
    {
      unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue([v29 base64EncodedStringWithOptions:0]);
      -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:](contexta, "setValue:forHTTPHeaderField:", v31, v66);
    }

    id v32 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
    [v32 setDelegate:self];
    [v32 setShouldSuppressUserInfo:v70];
    [v32 setRequestProperties:contexta];
    [v32 setUrlKnownToBeTrusted:1];
    id v76 = 0LL;
    -[AnalyticsReportingOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v32, &v76);
    v68 = v32;
    id v33 = v76;
    v69 = v33;
    if (v33
      && !-[AnalyticsReportingOperation _shouldClearEventsDespiteError:](self, "_shouldClearEventsDespiteError:", v33))
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v45) {
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      LODWORD(v46) = [v45 shouldLog];
      unsigned int v47 = [v45 shouldLogToDisk];
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue([v45 OSLogObject]);
      v49 = v48;
      if (v47) {
        LODWORD(v46) = v46 | 2;
      }
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        uint64_t v46 = v46;
      }
      else {
        v46 &= 2u;
      }
      if ((_DWORD)v46)
      {
        v50 = (void *)objc_opt_class(self);
        int v77 = 138412546;
        v78 = v50;
        __int16 v79 = 2112;
        id v80 = v69;
        id v51 = v50;
        LODWORD(v63) = 22;
        v52 = (void *)_os_log_send_and_compose_impl( v46,  0LL,  0LL,  0LL,  &_mh_execute_header,  v49,  16LL,  "[%@] Error Reporting Events: %@",  &v77,  v63);

        if (v52)
        {
          v49 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v52,  4LL));
          free(v52);
          v62 = v49;
          SSFileLog(v45, @"%@");
          goto LABEL_53;
        }
      }

      else
      {
LABEL_53:
      }

      char v12 = 0;
      char v65 = 0;
      v35 = v67;
      id v67 = v69;
      goto LABEL_55;
    }

    unsigned int v34 = [v6 markEventsAsReported];
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v35) {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v36 = [v35 shouldLog];
    unsigned int v37 = [v35 shouldLogToDisk];
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 OSLogObject]);
    v39 = v38;
    if (v37) {
      unsigned int v40 = v36 | 2;
    }
    else {
      unsigned int v40 = v36;
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO)) {
      uint64_t v41 = v40;
    }
    else {
      uint64_t v41 = v40 & 2;
    }
    if (!(_DWORD)v41) {
      goto LABEL_42;
    }
    v42 = (void *)objc_opt_class(self);
    int v77 = 138412546;
    v78 = v42;
    __int16 v79 = 1024;
    LODWORD(v80) = v34;
    id v43 = v42;
    LODWORD(v63) = 18;
    v44 = (void *)_os_log_send_and_compose_impl( v41,  0LL,  0LL,  0LL,  &_mh_execute_header,  v39,  1LL,  "[%@] Success reporting analytics events. [Marked As Reported: %d]",  &v77,  v63);

    if (v44)
    {
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v44,  4LL));
      free(v44);
      v62 = v39;
      SSFileLog(v35, @"%@");
LABEL_42:
    }

- (void)_runAMSMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[SSMetricsEventController unreportedEventsSince:]( self->_controller,  "unreportedEventsSince:",  self->_insertTimestamp));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMetrics bagSubProfile](&OBJC_CLASS___AMSMetrics, "bagSubProfile"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMetrics bagSubProfileVersion](&OBJC_CLASS___AMSMetrics, "bagSubProfileVersion"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[AMSBag bagForProfile:profileVersion:](&OBJC_CLASS___AMSBag, "bagForProfile:profileVersion:", v3, v4));

  unsigned int v27 = (void *)v5;
  id v6 = [[AMSMetrics alloc] initWithContainerID:@"com.apple.AppleMediaServices" bag:v5];
  unsigned int v7 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v2 count]);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = v2;
  id v8 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        char v12 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        id v13 = objc_alloc(&OBJC_CLASS___AMSMetricsEvent);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 reportingDictionary]);
        id v15 = [v13 initWithUnderlyingDictionary:v14];

        [v6 enqueueEvent:v15];
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v12 persistentID]));
        -[NSMutableArray addObject:](v7, "addObject:", v16);
      }

      id v9 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }

    while (v9);
  }

  unsigned int v17 = -[SSMetricsEventController markEventsAsReported:](self->_controller, "markEventsAsReported:", v7);
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v18) {
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v19 = [v18 shouldLog];
  else {
    unsigned int v20 = v19;
  }
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
    uint64_t v22 = v20;
  }
  else {
    uint64_t v22 = v20 & 2;
  }
  if (!(_DWORD)v22) {
    goto LABEL_19;
  }
  v23 = (void *)objc_opt_class(self);
  int v33 = 138412546;
  unsigned int v34 = v23;
  __int16 v35 = 1024;
  unsigned int v36 = v17;
  id v24 = v23;
  uint64_t v25 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  1LL,  "[%@] Success reporting analytics events. [Marked As Reported: %d]",  &v33,  18);

  if (v25)
  {
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL));
    free(v25);
    SSFileLog(v18, @"%@");
LABEL_19:
  }
}

- (BOOL)_runSSMetrics
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[SSMetricsEventController unreportedEventURLsSince:]( self->_controller,  "unreportedEventURLsSince:",  self->_insertTimestamp));
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v4)
  {
    char v39 = 0;
    uint64_t v41 = *(void *)v45;
    while (1)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v45 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)i);
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", v36));
        if (!v7) {
          unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        LODWORD(v8) = [v7 shouldLog];
        unsigned int v9 = [v7 shouldLogToDisk];
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
        uint64_t v11 = v10;
        if (v9) {
          LODWORD(v8) = v8 | 2;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          uint64_t v8 = v8;
        }
        else {
          v8 &= 2u;
        }
        if (!(_DWORD)v8) {
          goto LABEL_16;
        }
        char v12 = (void *)objc_opt_class(self);
        int v48 = 138412546;
        v49 = v12;
        __int16 v50 = 2112;
        uint64_t v51 = v6;
        id v13 = v12;
        LODWORD(v38) = 22;
        id v14 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "[%@] Submitting events to URL: %@",  &v48,  v38);

        if (v14)
        {
          uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
          free(v14);
          unsigned int v37 = v11;
          SSFileLog(v7, @"%@");
LABEL_16:
        }

        id v43 = 0LL;
        unsigned __int8 v15 = -[AnalyticsReportingOperation _runForReportingURL:suppressUserInfo:error:]( self,  "_runForReportingURL:suppressUserInfo:error:",  v6,  0LL,  &v43);
        id v16 = v43;
        if ((v15 & 1) == 0
          && -[AnalyticsReportingOperation _shouldBackoffAfterError:](self, "_shouldBackoffAfterError:", v16))
        {
          unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
          if (!v17) {
            unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          LODWORD(v18) = objc_msgSend(v17, "shouldLog", v37);
          unsigned int v19 = [v17 shouldLogToDisk];
          unsigned int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
          v21 = v20;
          if (v19) {
            LODWORD(v18) = v18 | 2;
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v18 = v18;
          }
          else {
            v18 &= 2u;
          }
          if ((_DWORD)v18)
          {
            uint64_t v22 = (void *)objc_opt_class(self);
            int v48 = 138412546;
            v49 = v22;
            __int16 v50 = 2112;
            uint64_t v51 = v6;
            id v23 = v22;
            LODWORD(v38) = 22;
            id v24 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "[%@]: Received backoff response for URL (with DSID): %@",  &v48,  v38);

            if (v24)
            {
              v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
              free(v24);
              unsigned int v37 = v21;
              SSFileLog(v17, @"%@");
              goto LABEL_29;
            }
          }

          else
          {
LABEL_29:
          }

          char v39 = 1;
        }

        id v42 = v16;
        unsigned __int8 v25 = -[AnalyticsReportingOperation _runForReportingURL:suppressUserInfo:error:]( self,  "_runForReportingURL:suppressUserInfo:error:",  v6,  1LL,  &v42,  v37);
        id v26 = v42;

        if ((v25 & 1) == 0
          && -[AnalyticsReportingOperation _shouldBackoffAfterError:](self, "_shouldBackoffAfterError:", v26))
        {
          unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
          if (!v27) {
            unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          LODWORD(v28) = [v27 shouldLog];
          unsigned int v29 = [v27 shouldLogToDisk];
          __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
          __int128 v31 = v30;
          if (v29) {
            LODWORD(v28) = v28 | 2;
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v28 = v28;
          }
          else {
            v28 &= 2u;
          }
          if ((_DWORD)v28)
          {
            __int128 v32 = (void *)objc_opt_class(self);
            int v48 = 138412546;
            v49 = v32;
            __int16 v50 = 2112;
            uint64_t v51 = v6;
            id v33 = v32;
            LODWORD(v38) = 22;
            unsigned int v34 = (void *)_os_log_send_and_compose_impl( v28,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  0LL,  "[%@]: Received backoff response for URL (without DSID): %@",  &v48,  v38);

            if (v34)
            {
              __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v34,  4LL));
              free(v34);
              unsigned int v36 = v31;
              SSFileLog(v27, @"%@");
              goto LABEL_43;
            }
          }

          else
          {
LABEL_43:
          }

          char v39 = 1;
        }
      }

      id v4 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (!v4) {
        goto LABEL_49;
      }
    }
  }

  char v39 = 0;
LABEL_49:

  return v39 & 1;
}

- (BOOL)_shouldBackoffAfterError:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:SSErrorHTTPStatusCodeKey]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  BOOL v6 = (objc_opt_isKindOfClass(v4, v5) & 1) != 0 && (char *)[v4 integerValue] - 500 < (char *)0x64;

  return v6;
}

- (BOOL)_shouldClearEventsDespiteError:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:SSErrorHTTPStatusCodeKey]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    char IsEqual = (char *)[v5 integerValue] - 400 < (char *)0x64;
  }
  else {
    char IsEqual = ISErrorIsEqual(v3, NSURLErrorDomain, -1102LL);
  }

  return IsEqual;
}

- (id)_signatureWithData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = sub_100183D08;
  unsigned int v27 = sub_100183D18;
  id v28 = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  unsigned int v20 = sub_100183D08;
  v21 = sub_100183D18;
  id v22 = 0LL;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[SSVFairPlaySAPSession sharedDefaultSession]( &OBJC_CLASS___SSVFairPlaySAPSession,  "sharedDefaultSession"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100183D20;
  v13[3] = &unk_1003508A0;
  unsigned __int8 v15 = &v23;
  id v16 = &v17;
  uint64_t v8 = v6;
  id v14 = v8;
  [v7 signData:v5 completionBlock:v13];
  dispatch_time_t v9 = dispatch_time(0LL, 60000000000LL);
  dispatch_semaphore_wait(v8, v9);
  uint64_t v10 = (void *)v18[5];
  if (a4 && !v10)
  {
    *a4 = (id) v24[5];
    uint64_t v10 = (void *)v18[5];
  }

  id v11 = v10;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (void).cxx_destruct
{
}

@end