@interface PrepareDownloadResponse
- (BOOL)has4K;
- (BOOL)hasHDR;
- (BOOL)ignoresDownloadHandler;
- (BOOL)infersDiscretionary;
- (BOOL)isCellularAllowed;
- (BOOL)isDiscretionary;
- (BOOL)isHLS;
- (BOOL)isLegacyClient;
- (BOOL)isPerDeviceVPP;
- (BOOL)isRestore;
- (BOOL)requiresDownloadHandler;
- (BOOL)requiresPowerPluggedIn;
- (DownloadDataConsumer)dataConsumer;
- (DownloadHandle)downloadHandle;
- (NSArray)backgroundOperations;
- (NSDictionary)AVAssetDownloadSessionOptions;
- (NSError)error;
- (NSNumber)downloadRestoreState;
- (NSNumber)loadingPriority;
- (NSNumber)taskIdentifier;
- (NSString)URLSessionIdentifier;
- (NSString)bundleIdentifier;
- (NSString)clientIdentifier;
- (NSString)clientSecondaryIdentifier;
- (NSString)destinationPath;
- (NSString)kind;
- (NSString)title;
- (NSURLRequest)URLRequest;
- (double)timeoutIntervalForRequest;
- (double)timeoutIntervalForResource;
- (double)transferProgressFraction;
- (id)_getExistingTaskInSession:(id)a3;
- (id)_reuseExistingTaskInSession:(id)a3;
- (id)sessionConfiguration;
- (id)sessionTaskWithSession:(id)a3 error:(id *)a4;
- (int64_t)automaticType;
- (int64_t)bytesPerSecondLimit;
- (int64_t)downloadIdentifier;
- (int64_t)mediaAssetIdentifier;
- (int64_t)mediaAssetSize;
- (int64_t)rentalIdentifier;
- (int64_t)result;
- (int64_t)storeItemIdentifier;
- (int64_t)taskPriority;
- (unint64_t)numAudioSelectionsToBeDownloaded;
- (unint64_t)numSubtitleSelectionsToBeDownloaded;
- (void)setAVAssetDownloadSessionOptions:(id)a3;
- (void)setAutomaticType:(int64_t)a3;
- (void)setBackgroundOperations:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBytesPerSecondLimit:(int64_t)a3;
- (void)setCellularAllowed:(BOOL)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setClientSecondaryIdentifier:(id)a3;
- (void)setDataConsumer:(id)a3;
- (void)setDestinationPath:(id)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setDownloadHandle:(id)a3;
- (void)setDownloadIdentifier:(int64_t)a3;
- (void)setDownloadRestoreState:(id)a3;
- (void)setError:(id)a3;
- (void)setHLS:(BOOL)a3;
- (void)setHas4K:(BOOL)a3;
- (void)setHasHDR:(BOOL)a3;
- (void)setIgnoresDownloadHandler:(BOOL)a3;
- (void)setInfersDiscretionary:(BOOL)a3;
- (void)setIsPerDeviceVPP:(BOOL)a3;
- (void)setKind:(id)a3;
- (void)setLegacyClient:(BOOL)a3;
- (void)setLoadingPriority:(id)a3;
- (void)setMediaAssetIdentifier:(int64_t)a3;
- (void)setMediaAssetSize:(int64_t)a3;
- (void)setNumAudioSelectionsToBeDownloaded:(unint64_t)a3;
- (void)setNumSubtitleSelectionsToBeDownloaded:(unint64_t)a3;
- (void)setRentalIdentifier:(int64_t)a3;
- (void)setRequiresDownloadHandler:(BOOL)a3;
- (void)setRequiresPowerPluggedIn:(BOOL)a3;
- (void)setRestore:(BOOL)a3;
- (void)setResult:(int64_t)a3;
- (void)setStoreItemIdentifier:(int64_t)a3;
- (void)setTaskIdentifier:(id)a3;
- (void)setTaskPriority:(int64_t)a3;
- (void)setTimeoutIntervalForRequest:(double)a3;
- (void)setTimeoutIntervalForResource:(double)a3;
- (void)setTitle:(id)a3;
- (void)setTransferProgressFraction:(double)a3;
- (void)setURLRequest:(id)a3;
@end

@implementation PrepareDownloadResponse

- (id)sessionConfiguration
{
  AVAssetDownloadSessionOptions = self->_AVAssetDownloadSessionOptions;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PrepareDownloadResponse URLSessionIdentifier](self, "URLSessionIdentifier"));
  if (AVAssetDownloadSessionOptions) {
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration _AVBackgroundSessionConfigurationWithIdentifier:]( &OBJC_CLASS___NSURLSessionConfiguration,  "_AVBackgroundSessionConfigurationWithIdentifier:",  v4));
  }
  else {
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:]( &OBJC_CLASS___NSURLSessionConfiguration,  "backgroundSessionConfigurationWithIdentifier:",  v4));
  }
  v6 = (void *)v5;

  objc_msgSend( v6,  "setAllowsCellularAccess:",  -[NSURLRequest allowsCellularAccess](self->_URLRequest, "allowsCellularAccess"));
  objc_msgSend( v6,  "setAllowsExpensiveNetworkAccess:",  -[NSURLRequest allowsExpensiveNetworkAccess](self->_URLRequest, "allowsExpensiveNetworkAccess"));
  [v6 setHTTPCookieAcceptPolicy:1];
  [v6 setHTTPShouldSetCookies:0];
  [v6 setHTTPShouldUsePipelining:1];
  [v6 setRequestCachePolicy:1];
  [v6 setSessionSendsLaunchEvents:1];
  objc_msgSend(v6, "set_allowsRetryForBackgroundDataTasks:", 1);
  objc_msgSend(v6, "set_requiresPowerPluggedIn:", self->_requiresPowerPluggedIn);
  objc_msgSend(v6, "set_sourceApplicationBundleIdentifier:", self->_clientIdentifier);
  objc_msgSend(v6, "set_sourceApplicationSecondaryIdentifier:", self->_clientSecondaryIdentifier);
  if (-[PrepareDownloadResponse infersDiscretionary](self, "infersDiscretionary"))
  {
    [v6 setDiscretionary:0];
    objc_msgSend(v6, "set_infersDiscretionaryFromOriginatingClient:", 1);
  }

  else
  {
    [v6 setDiscretionary:self->_discretionary];
  }

  [v6 setTimeoutIntervalForRequest:self->_timeoutIntervalForRequest];
  [v6 setTimeoutIntervalForResource:self->_timeoutIntervalForResource];
  return v6;
}

- (id)sessionTaskWithSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0LL;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PrepareDownloadResponse _reuseExistingTaskInSession:](self, "_reuseExistingTaskInSession:", v6));
  if (!v7)
  {
    if (self->_isHLS)
    {
LABEL_5:
      v7 = 0LL;
      goto LABEL_10;
    }

    if (self->_AVAssetDownloadSessionOptions)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLRequest URL](self->_URLRequest, "URL"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", self->_destinationPath));
      v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 _AVAssetDownloadTaskWithURL:v8 destinationURL:v9 options:self->_AVAssetDownloadSessionOptions]);
    }

    else
    {
      if (!self->_URLRequest) {
        goto LABEL_5;
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataTaskWithRequest:"));
    }
  }

- (NSString)URLSessionIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"com.apple.itunesstored."));
  v4 = v3;
  if (self->_clientIdentifier)
  {
    objc_msgSend(v3, "appendString:");
    [v4 appendString:@"."];
  }

  if (self->_clientSecondaryIdentifier)
  {
    objc_msgSend(v4, "appendString:");
    [v4 appendString:@"."];
  }

  if (self->_discretionary) {
    [v4 appendString:@"discretionary."];
  }
  if (-[PrepareDownloadResponse infersDiscretionary](self, "infersDiscretionary")) {
    [v4 appendString:@"infersdiscretionary."];
  }
  if (self->_requiresPowerPluggedIn) {
    [v4 appendString:@"powered."];
  }
  if (!-[NSURLRequest allowsCellularAccess](self->_URLRequest, "allowsCellularAccess")) {
    [v4 appendString:@"wifi."];
  }
  if (!-[NSURLRequest allowsExpensiveNetworkAccess](self->_URLRequest, "allowsExpensiveNetworkAccess")) {
    [v4 appendString:@"inexpensive."];
  }
  if (self->_timeoutIntervalForResource > 0.0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"resource_timeout_%f.",  *(void *)&self->_timeoutIntervalForResource));
    [v4 appendString:v5];
  }

  if (self->_timeoutIntervalForRequest > 0.0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"timeout_%f.",  *(void *)&self->_timeoutIntervalForRequest));
    [v4 appendString:v6];
  }

  if (self->_isHLS)
  {
    v7 = @"hls";
  }

  else if (self->_AVAssetDownloadSessionOptions)
  {
    v7 = @"av";
  }

  else
  {
    v7 = @"default";
  }

  [v4 appendString:v7];
  return (NSString *)v4;
}

- (id)_getExistingTaskInSession:(id)a3
{
  id v4 = a3;
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = sub_10012DD50;
  v36 = sub_10012DD60;
  id v37 = 0LL;
  NSUInteger v5 = -[NSNumber unsignedIntegerValue](self->_taskIdentifier, "unsignedIntegerValue");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    unsigned int v7 = [v6 shouldLog];
    unsigned int v8 = [v6 shouldLogToDisk];
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    v10 = v9;
    if (v8) {
      v7 |= 2u;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      uint64_t v11 = v7;
    }
    else {
      uint64_t v11 = v7 & 2;
    }
    if ((_DWORD)v11)
    {
      int64_t downloadIdentifier = self->_downloadIdentifier;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PrepareDownloadResponse URLSessionIdentifier](self, "URLSessionIdentifier"));
      int v38 = 134218498;
      NSUInteger v39 = v5;
      __int16 v40 = 2048;
      int64_t v41 = downloadIdentifier;
      __int16 v42 = 2114;
      v43 = v13;
      v14 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  2LL,  "[Download]: Looking for existing task: %lu for download: %lld in session: %{public}@",  &v38,  32);

      if (!v14) {
        goto LABEL_11;
      }
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
      free(v14);
      SSFileLog(v6, @"%@");
    }

LABEL_11:
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10012DD68;
    v28[3] = &unk_10034F650;
    v30 = &v32;
    NSUInteger v31 = v5;
    v15 = dispatch_semaphore_create(0LL);
    v29 = v15;
    [v4 getAllTasksWithCompletionHandler:v28];
    dispatch_time_t v16 = dispatch_time(0LL, 60000000000LL);
    if (!dispatch_semaphore_wait(v15, v16))
    {
LABEL_22:

      goto LABEL_23;
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    LODWORD(v18) = [v17 shouldLog];
    unsigned int v19 = [v17 shouldLogToDisk];
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
    v21 = v20;
    if (v19) {
      LODWORD(v18) = v18 | 2;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      uint64_t v18 = v18;
    }
    else {
      v18 &= 2u;
    }
    if ((_DWORD)v18)
    {
      int64_t v22 = self->_downloadIdentifier;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PrepareDownloadResponse URLSessionIdentifier](self, "URLSessionIdentifier"));
      int v38 = 134218498;
      NSUInteger v39 = v5;
      __int16 v40 = 2048;
      int64_t v41 = v22;
      __int16 v42 = 2114;
      v43 = v23;
      LODWORD(v27) = 32;
      v24 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  16LL,  "[Download]: Request for existing tasks timed out when looking for existing task: %lu for download: %lld in session: %{public}@",  &v38,  v27);

      if (!v24)
      {
LABEL_21:

        goto LABEL_22;
      }

      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
      free(v24);
      SSFileLog(v17, @"%@");
    }

    goto LABEL_21;
  }

- (id)_reuseExistingTaskInSession:(id)a3
{
  id v4 = a3;
  if (self->_taskIdentifier)
  {
    NSUInteger v5 = (void *)objc_claimAutoreleasedReturnValue(-[PrepareDownloadResponse _getExistingTaskInSession:](self, "_getExistingTaskInSession:", v4));
    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v6) {
        id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v7 = [v6 shouldLog];
      else {
        LODWORD(v8) = v7;
      }
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        uint64_t v8 = v8;
      }
      else {
        v8 &= 2u;
      }
      if ((_DWORD)v8)
      {
        int v43 = 134217984;
        id v44 = [v5 taskIdentifier];
        v10 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  2LL,  "[Download]: We have a task to evaluate: %lu",  &v43);

        if (!v10) {
          goto LABEL_15;
        }
        v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
        free(v10);
        __int16 v40 = v9;
        SSFileLog(v6, @"%@");
      }

LABEL_15:
      unsigned int v11 = [v5 conformsToProtocol:&OBJC_PROTOCOL___AVAssetDownloadDelegate];
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v12) {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v13 = objc_msgSend(v12, "shouldLog", v40);
      else {
        LODWORD(v14) = v13;
      }
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        uint64_t v14 = v14;
      }
      else {
        v14 &= 2u;
      }
      if ((_DWORD)v14)
      {
        id v16 = [v5 taskIdentifier];
        int v43 = 134218240;
        id v44 = v16;
        __int16 v45 = 1024;
        LODWORD(v46) = v11;
        v17 = (void *)_os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  2LL,  "[Download]: Task %lu is an aggregate download: %d",  &v43,  18);

        if (!v17) {
          goto LABEL_27;
        }
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
        free(v17);
        int64_t v41 = v15;
        SSFileLog(v12, @"%@");
      }

LABEL_27:
      if ((objc_opt_respondsToSelector(v5, "URL") & 1) != 0)
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 URL]);
        if ((v11 & 1) != 0) {
          goto LABEL_38;
        }
      }

      else if (v11 & 1 | ((objc_opt_respondsToSelector(v5, "originalRequest") & 1) == 0))
      {
        uint64_t v18 = 0LL;
        if ((v11 & 1) != 0)
        {
LABEL_38:
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", v41));
          if (!v24) {
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          unsigned int v25 = [v24 shouldLog];
          else {
            LODWORD(v26) = v25;
          }
          uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 OSLogObject]);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v26 = v26;
          }
          else {
            v26 &= 2u;
          }
          if ((_DWORD)v26)
          {
            id v28 = [v5 taskIdentifier];
            int64_t downloadIdentifier = self->_downloadIdentifier;
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[PrepareDownloadResponse URLSessionIdentifier](self, "URLSessionIdentifier"));
            int v43 = 134218498;
            id v44 = v28;
            __int16 v45 = 2048;
            int64_t v46 = downloadIdentifier;
            __int16 v47 = 2114;
            v48 = v30;
            LODWORD(v42) = 32;
            NSUInteger v31 = (void *)_os_log_send_and_compose_impl( v26,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "[Download]: Reusing existing task: %lu for download: %lld in session: %{public}@",  &v43,  v42);

            if (!v31)
            {
LABEL_64:

              goto LABEL_65;
            }

            uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v31,  4LL));
            free(v31);
            SSFileLog(v24, @"%@");
          }

- (int64_t)automaticType
{
  return self->_automaticType;
}

- (void)setAutomaticType:(int64_t)a3
{
  self->_automaticType = a3;
}

- (NSDictionary)AVAssetDownloadSessionOptions
{
  return self->_AVAssetDownloadSessionOptions;
}

- (void)setAVAssetDownloadSessionOptions:(id)a3
{
}

- (NSArray)backgroundOperations
{
  return self->_backgroundOperations;
}

- (void)setBackgroundOperations:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (int64_t)bytesPerSecondLimit
{
  return self->_bytesPerSecondLimit;
}

- (void)setBytesPerSecondLimit:(int64_t)a3
{
  self->_bytesPerSecondLimit = a3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)clientSecondaryIdentifier
{
  return self->_clientSecondaryIdentifier;
}

- (void)setClientSecondaryIdentifier:(id)a3
{
}

- (DownloadDataConsumer)dataConsumer
{
  return self->_dataConsumer;
}

- (void)setDataConsumer:(id)a3
{
}

- (BOOL)isDiscretionary
{
  return self->_discretionary;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

- (int64_t)downloadIdentifier
{
  return self->_downloadIdentifier;
}

- (void)setDownloadIdentifier:(int64_t)a3
{
  self->_int64_t downloadIdentifier = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)isHLS
{
  return self->_isHLS;
}

- (void)setHLS:(BOOL)a3
{
  self->_isHLS = a3;
}

- (BOOL)ignoresDownloadHandler
{
  return self->_ignoresDownloadHandler;
}

- (void)setIgnoresDownloadHandler:(BOOL)a3
{
  self->_ignoresDownloadHandler = a3;
}

- (BOOL)infersDiscretionary
{
  return self->_infersDiscretionary;
}

- (void)setInfersDiscretionary:(BOOL)a3
{
  self->_infersDiscretionary = a3;
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (BOOL)isLegacyClient
{
  return self->_legacyClient;
}

- (void)setLegacyClient:(BOOL)a3
{
  self->_legacyClient = a3;
}

- (NSNumber)loadingPriority
{
  return self->_loadingPriority;
}

- (void)setLoadingPriority:(id)a3
{
}

- (int64_t)mediaAssetIdentifier
{
  return self->_mediaAssetIdentifier;
}

- (void)setMediaAssetIdentifier:(int64_t)a3
{
  self->_mediaAssetIdentifier = a3;
}

- (int64_t)mediaAssetSize
{
  return self->_mediaAssetSize;
}

- (void)setMediaAssetSize:(int64_t)a3
{
  self->_mediaAssetSize = a3;
}

- (int64_t)rentalIdentifier
{
  return self->rentalIdentifier;
}

- (void)setRentalIdentifier:(int64_t)a3
{
  self->rentalIdentifier = a3;
}

- (BOOL)requiresDownloadHandler
{
  return self->_requiresDownloadHandler;
}

- (void)setRequiresDownloadHandler:(BOOL)a3
{
  self->_requiresDownloadHandler = a3;
}

- (BOOL)requiresPowerPluggedIn
{
  return self->_requiresPowerPluggedIn;
}

- (void)setRequiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
}

- (int64_t)result
{
  return self->_result;
}

- (void)setResult:(int64_t)a3
{
  self->_result = a3;
}

- (int64_t)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (void)setStoreItemIdentifier:(int64_t)a3
{
  self->_storeItemIdentifier = a3;
}

- (int64_t)taskPriority
{
  return self->_taskPriority;
}

- (void)setTaskPriority:(int64_t)a3
{
  self->_taskPriority = a3;
}

- (NSNumber)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(id)a3
{
}

- (double)timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource;
}

- (void)setTimeoutIntervalForResource:(double)a3
{
  self->_timeoutIntervalForResource = a3;
}

- (double)timeoutIntervalForRequest
{
  return self->_timeoutIntervalForRequest;
}

- (void)setTimeoutIntervalForRequest:(double)a3
{
  self->_timeoutIntervalForRequest = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (double)transferProgressFraction
{
  return self->_transferProgressFraction;
}

- (void)setTransferProgressFraction:(double)a3
{
  self->_transferProgressFraction = a3;
}

- (NSURLRequest)URLRequest
{
  return self->_URLRequest;
}

- (void)setURLRequest:(id)a3
{
}

- (unint64_t)numAudioSelectionsToBeDownloaded
{
  return self->_numAudioSelectionsToBeDownloaded;
}

- (void)setNumAudioSelectionsToBeDownloaded:(unint64_t)a3
{
  self->_numAudioSelectionsToBeDownloaded = a3;
}

- (unint64_t)numSubtitleSelectionsToBeDownloaded
{
  return self->_numSubtitleSelectionsToBeDownloaded;
}

- (void)setNumSubtitleSelectionsToBeDownloaded:(unint64_t)a3
{
  self->_numSubtitleSelectionsToBeDownloaded = a3;
}

- (DownloadHandle)downloadHandle
{
  return self->_downloadHandle;
}

- (void)setDownloadHandle:(id)a3
{
}

- (BOOL)isCellularAllowed
{
  return self->_cellularAllowed;
}

- (void)setCellularAllowed:(BOOL)a3
{
  self->_cellularAllowed = a3;
}

- (BOOL)isRestore
{
  return self->_restore;
}

- (void)setRestore:(BOOL)a3
{
  self->_restore = a3;
}

- (NSNumber)downloadRestoreState
{
  return self->_downloadRestoreState;
}

- (void)setDownloadRestoreState:(id)a3
{
}

- (BOOL)isPerDeviceVPP
{
  return self->_isPerDeviceVPP;
}

- (void)setIsPerDeviceVPP:(BOOL)a3
{
  self->_isPerDeviceVPP = a3;
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
}

- (BOOL)hasHDR
{
  return self->_hasHDR;
}

- (void)setHasHDR:(BOOL)a3
{
  self->_hasHDR = a3;
}

- (BOOL)has4K
{
  return self->_has4K;
}

- (void)setHas4K:(BOOL)a3
{
  self->_has4K = a3;
}

- (void).cxx_destruct
{
}

@end