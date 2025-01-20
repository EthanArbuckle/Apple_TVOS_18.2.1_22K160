@interface NDAVAssetDownloadSessionWrapper
- (AVAssetDownloadSession)downloadSession;
- (BOOL)doesAVAssetDownloadSessionSupportMultipleDownloads;
- (BOOL)progressTimerRunning;
- (NDAVAssetDownloadSessionWrapper)initWithURL:(id)a3 destinationURL:(id)a4 options:(id)a5 delegate:(id)a6 queue:(id)a7;
- (NDAVAssetDownloadSessionWrapper)initWithURLAsset:(id)a3 destinationURL:(id)a4 options:(id)a5 delegate:(id)a6 queue:(id)a7;
- (NDAVAssetDownloadSessionWrapperDelegate)delegate;
- (NSDictionary)options;
- (NSURL)URL;
- (NSURL)destinationURL;
- (OS_dispatch_queue)delegateQueue;
- (unint64_t)countOfBytesExpectedToWrite;
- (unint64_t)countOfBytesWritten;
- (unint64_t)downloadToken;
- (unint64_t)taskIdentifier;
- (void)assetDownloadSession:(id)a3 didFailWithError:(id)a4;
- (void)assetDownloadSession:(id)a3 didFinishDownloadForMediaSelection:(id)a4;
- (void)assetDownloadSession:(id)a3 didLoadTimeRange:(id *)a4 totalTimeRangesLoaded:(id)a5 timeRangeExpectedToLoad:(id *)a6 forMediaSelection:(id)a7;
- (void)assetDownloadSession:(id)a3 didResolveMediaSelection:(id)a4;
- (void)assetDownloadSession:(id)a3 didUpdateProgressWithExpectedBytes:(unint64_t)a4 bytesDownloaded:(unint64_t)a5;
- (void)assetDownloadSession:(id)a3 willDownloadVariants:(id)a4;
- (void)assetDownloadSessionDidFinishDownload:(id)a3;
- (void)cancel;
- (void)cancelAndDeliverError:(id)a3;
- (void)disavowSession;
- (void)releasePowerAssertion;
- (void)resume;
- (void)setCountOfBytesExpectedToWrite:(unint64_t)a3;
- (void)setCountOfBytesWritten:(unint64_t)a3;
- (void)setDownloadSession:(id)a3;
- (void)setProgressTimerRunning:(BOOL)a3;
- (void)setTaskIdentifier:(unint64_t)a3;
- (void)startLoadingMetadata;
- (void)suspend;
- (void)takePowerAssertion;
@end

@implementation NDAVAssetDownloadSessionWrapper

- (BOOL)doesAVAssetDownloadSessionSupportMultipleDownloads
{
  return objc_opt_respondsToSelector( &OBJC_CLASS___AVAssetDownloadSession,  "assetDownloadSessionWithAsset:mediaSelections:destinationURL:options:") & 1;
}

- (NDAVAssetDownloadSessionWrapper)initWithURL:(id)a3 destinationURL:(id)a4 options:(id)a5 delegate:(id)a6 queue:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v26 = a7;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NDAVAssetDownloadSessionWrapper;
  v17 = -[NDAVAssetDownloadSessionWrapper init](&v27, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_URL, a3);
    objc_storeStrong((id *)&v18->_destinationURL, a4);
    objc_storeStrong((id *)&v18->_options, a5);
    objc_storeWeak((id *)&v18->_delegate, v16);
    objc_storeStrong((id *)&v18->_delegateQueue, a7);
    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[AVAssetDownloadSession assetDownloadSessionWithURL:destinationURL:options:]( &OBJC_CLASS___AVAssetDownloadSession,  "assetDownloadSessionWithURL:destinationURL:options:",  v13,  v14,  v15));
    downloadSession = v18->_downloadSession;
    v18->_downloadSession = (AVAssetDownloadSession *)v19;

    if (v18->_downloadSession)
    {
      dispatch_queue_attr_t v21 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v22 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v21);
      dispatch_queue_t v23 = dispatch_queue_create("com.apple.nsurlsessionf.avassetdownloadersessionwrappercallback", v22);
      callbackQueue = v18->_callbackQueue;
      v18->_callbackQueue = (OS_dispatch_queue *)v23;

      -[AVAssetDownloadSession setDelegate:queue:]( v18->_downloadSession,  "setDelegate:queue:",  v18,  v18->_callbackQueue);
      v18->_downloadToken = (unint64_t)-[AVAssetDownloadSession downloadToken]( v18->_downloadSession,  "downloadToken");
    }

    else
    {

      v18 = 0LL;
    }
  }

  return v18;
}

- (NDAVAssetDownloadSessionWrapper)initWithURLAsset:(id)a3 destinationURL:(id)a4 options:(id)a5 delegate:(id)a6 queue:(id)a7
{
  id v13 = a3;
  id v53 = a4;
  id v14 = a5;
  id v54 = a6;
  id v52 = a7;
  v64.receiver = self;
  v64.super_class = (Class)&OBJC_CLASS___NDAVAssetDownloadSessionWrapper;
  id v15 = -[NDAVAssetDownloadSessionWrapper init](&v64, "init");
  v55 = v15;
  if (!v15) {
    goto LABEL_34;
  }
  objc_storeStrong((id *)&v15->_asset, a3);
  objc_storeStrong((id *)&v55->_destinationURL, a4);
  if (v14)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"AVAssetDownloadSessionMediaSelectionArrayKey"]);
    BOOL v17 = v16 == 0LL;

    if (v17)
    {
      uint64_t v19 = 0LL;
    }

    else
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"AVAssetDownloadSessionMediaSelectionArrayKey"]);
      id v18 = [v14 mutableCopy];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      id v20 = v50;
      id v21 = [v20 countByEnumeratingWithState:&v60 objects:v66 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v61;
        do
        {
          for (i = 0LL; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v61 != v22) {
              objc_enumerationMutation(v20);
            }
            v24 = -[AVMediaSelection initWithAsset:propertyList:]( objc_alloc(&OBJC_CLASS___AVMediaSelection),  "initWithAsset:propertyList:",  v13,  *(void *)(*((void *)&v60 + 1) + 8LL * (void)i));
            if (v24) {
              [v19 addObject:v24];
            }
          }

          id v21 = [v20 countByEnumeratingWithState:&v60 objects:v66 count:16];
        }

        while (v21);
      }

      [v18 setObject:v19 forKeyedSubscript:@"AVAssetDownloadSessionMediaSelectionArrayKey"];
      if (!v18) {
        goto LABEL_30;
      }
      id v14 = v18;
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue( [v14 objectForKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionsForMultichannelKey"]);
    BOOL v26 = v25 == 0LL;

    if (v26) {
      goto LABEL_28;
    }
    v49 = (void *)objc_claimAutoreleasedReturnValue( [v14 objectForKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionsForMultichannelKey"]);
    id v51 = [v14 mutableCopy];
    objc_super v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id v28 = v49;
    id v29 = [v28 countByEnumeratingWithState:&v56 objects:v65 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v57;
      do
      {
        for (j = 0LL; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v57 != v30) {
            objc_enumerationMutation(v28);
          }
          v32 = -[AVMediaSelection initWithAsset:propertyList:]( objc_alloc(&OBJC_CLASS___AVMediaSelection),  "initWithAsset:propertyList:",  v13,  *(void *)(*((void *)&v56 + 1) + 8LL * (void)j));
          if (v32) {
            [v27 addObject:v32];
          }
        }

        id v29 = [v28 countByEnumeratingWithState:&v56 objects:v65 count:16];
      }

      while (v29);
    }

    [v51 setObject:v27 forKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionsForMultichannelKey"];
    id v14 = v51;
    if (v51)
    {
LABEL_28:
      v33 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionKey"]);
      BOOL v34 = v33 == 0LL;

      if (v34)
      {
        id v36 = v14;
      }

      else
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionKey"]);
        id v36 = [v14 mutableCopy];
        v37 = -[AVMediaSelection initWithAsset:propertyList:]( objc_alloc(&OBJC_CLASS___AVMediaSelection),  "initWithAsset:propertyList:",  v13,  v35);
        [v36 setObject:v37 forKeyedSubscript:AVAssetDownloadSessionMediaSelectionKey];
        [v36 removeObjectForKey:@"AVAssetDownloadTaskMediaSelectionKey"];
      }

      goto LABEL_31;
    }
  }

  else
  {
    uint64_t v19 = 0LL;
  }

- (void)disavowSession
{
  v3 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%p Disavowing AVAssetDownloadSession",  (uint8_t *)&v5,  0xCu);
  }

  -[NDAVAssetDownloadSessionWrapper setDownloadSession:](self, "setDownloadSession:", 0LL);
  callbackQueue = self->_callbackQueue;
  self->_callbackQueue = 0LL;
}

- (void)takePowerAssertion
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_powerAssertion)
  {
    v3 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t downloadToken = v2->_downloadToken;
      unint64_t taskIdentifier = v2->_taskIdentifier;
      *(_DWORD *)buf = 134218240;
      unint64_t v16 = downloadToken;
      __int16 v17 = 2048;
      unint64_t v18 = taskIdentifier;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Taking power assertion for AVAssetDownloadSessionWrapper %llu with taskIdentifier %lu",  buf,  0x16u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v2->_options,  "objectForKeyedSubscript:",  AVAssetDownloadSessionClientBundleIdentifierKey));
    v13[0] = @"AssertType";
    v13[1] = @"AssertLevel";
    v14[0] = @"PreventUserIdleSystemSleep";
    v14[1] = &off_10007B430;
    v13[2] = @"AssertName";
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AVAssetDownloadSessionWrapper %llu (%@)",  v2->_downloadToken,  v6));
    v14[2] = v7;
    v14[3] = &off_10007B448;
    v13[3] = @"TimeoutSeconds";
    v13[4] = @"TimeoutAction";
    v14[4] = @"TimeoutActionTurnOff";
    v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  5LL));

    IOPMAssertionID AssertionID = 0;
    if (IOPMAssertionCreateWithProperties(v8, &AssertionID))
    {
      v9 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        unint64_t v10 = v2->_downloadToken;
        unint64_t v11 = v2->_taskIdentifier;
        *(_DWORD *)buf = 134218240;
        unint64_t v16 = v10;
        __int16 v17 = 2048;
        unint64_t v18 = v11;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to take power assertion for AVAssetDownloadSessionWrapper %llu with taskIdentifier %lu",  buf,  0x16u);
      }
    }

    else
    {
      v2->_powerAssertion = AssertionID;
    }
  }

  objc_sync_exit(v2);
}

- (void)releasePowerAssertion
{
  v2 = self;
  objc_sync_enter(v2);
  IOPMAssertionID powerAssertion = v2->_powerAssertion;
  if (powerAssertion)
  {
    v4 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t downloadToken = v2->_downloadToken;
      unint64_t taskIdentifier = v2->_taskIdentifier;
      int v7 = 134218240;
      unint64_t v8 = downloadToken;
      __int16 v9 = 2048;
      unint64_t v10 = taskIdentifier;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Releasing power assertion for AVAssetDownloadSessionWrapper %llu with taskIdentifier %lu",  (uint8_t *)&v7,  0x16u);
      IOPMAssertionID powerAssertion = v2->_powerAssertion;
    }

    IOPMAssertionRelease(powerAssertion);
    v2->_IOPMAssertionID powerAssertion = 0;
  }

  objc_sync_exit(v2);
}

- (void)resume
{
  v3 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting AVAssetDownloadSession", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NDAVAssetDownloadSessionWrapper downloadSession](self, "downloadSession"));
  [v4 start];
}

- (void)suspend
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NDAVAssetDownloadSessionWrapper downloadSession](self, "downloadSession"));
  [v3 pause];

  -[NDAVAssetDownloadSessionWrapper releasePowerAssertion](self, "releasePowerAssertion");
}

- (void)cancel
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NDAVAssetDownloadSessionWrapper downloadSession](self, "downloadSession"));
  [v3 stop];

  -[NDAVAssetDownloadSessionWrapper disavowSession](self, "disavowSession");
}

- (void)cancelAndDeliverError:(id)a3
{
  id v5 = a3;
  -[NDAVAssetDownloadSessionWrapper cancel](self, "cancel");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained NDAVAssetDownloadSessionWrapper:self didCompleteWithError:v5];
}

- (void)startLoadingMetadata
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[NDAVAssetDownloadSessionWrapper downloadSession](self, "downloadSession"));
  [v2 startLoadingMetadata];
}

- (void)assetDownloadSessionDidFinishDownload:(id)a3
{
  v4 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "AVAssetDownloadSession download complete",  buf,  2u);
  }

  delegateQueue = self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010940;
  block[3] = &unk_100079BE0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)delegateQueue, block);
}

- (void)assetDownloadSession:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  v6 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "AVAssetDownloadSession download failed",  buf,  2u);
  }

  delegateQueue = self->_delegateQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000108E4;
  v9[3] = &unk_100079C30;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)delegateQueue, v9);
}

- (void)assetDownloadSession:(id)a3 didLoadTimeRange:(id *)a4 totalTimeRangesLoaded:(id)a5 timeRangeExpectedToLoad:(id *)a6 forMediaSelection:(id)a7
{
  id v11 = a5;
  id v12 = a7;
  block[1] = 3221225472LL;
  __int128 v13 = *(_OWORD *)&a4->var0.var3;
  __int128 v23 = *(_OWORD *)&a4->var0.var0;
  __int128 v24 = v13;
  __int128 v14 = *(_OWORD *)&a6->var0.var0;
  __int128 v15 = *(_OWORD *)&a6->var0.var3;
  __int128 v25 = *(_OWORD *)&a4->var1.var1;
  __int128 v26 = v14;
  delegateQueue = self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_1000107DC;
  block[3] = &unk_100078D00;
  __int128 v17 = *(_OWORD *)&a6->var1.var1;
  __int128 v27 = v15;
  __int128 v28 = v17;
  block[4] = self;
  id v21 = v11;
  id v22 = v12;
  id v18 = v12;
  id v19 = v11;
  dispatch_async((dispatch_queue_t)delegateQueue, block);
}

- (void)assetDownloadSession:(id)a3 didFinishDownloadForMediaSelection:(id)a4
{
  id v5 = a4;
  v6 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "AVAssetDownloadSession download finished for media selection",  buf,  2u);
  }

  delegateQueue = self->_delegateQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100010760;
  v9[3] = &unk_100079C30;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)delegateQueue, v9);
}

- (void)assetDownloadSession:(id)a3 didResolveMediaSelection:(id)a4
{
  id v5 = a4;
  delegateQueue = self->_delegateQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000106CC;
  v8[3] = &unk_100079C30;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)delegateQueue, v8);
}

- (void)assetDownloadSession:(id)a3 didUpdateProgressWithExpectedBytes:(unint64_t)a4 bytesDownloaded:(unint64_t)a5
{
  delegateQueue = self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010620;
  block[3] = &unk_100078D28;
  block[4] = self;
  void block[5] = a5;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)delegateQueue, block);
}

- (void)assetDownloadSession:(id)a3 willDownloadVariants:(id)a4
{
  id v5 = a4;
  delegateQueue = self->_delegateQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000105CC;
  v8[3] = &unk_100079C30;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)delegateQueue, v8);
}

- (AVAssetDownloadSession)downloadSession
{
  return (AVAssetDownloadSession *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDownloadSession:(id)a3
{
}

- (NDAVAssetDownloadSessionWrapperDelegate)delegate
{
  return (NDAVAssetDownloadSessionWrapperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64LL, 1);
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 72LL, 1);
}

- (NSURL)destinationURL
{
  return (NSURL *)objc_getProperty(self, a2, 80LL, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 88LL, 1);
}

- (unint64_t)downloadToken
{
  return self->_downloadToken;
}

- (unint64_t)countOfBytesWritten
{
  return self->_countOfBytesWritten;
}

- (void)setCountOfBytesWritten:(unint64_t)a3
{
  self->_countOfBytesWritten = a3;
}

- (unint64_t)countOfBytesExpectedToWrite
{
  return self->_countOfBytesExpectedToWrite;
}

- (void)setCountOfBytesExpectedToWrite:(unint64_t)a3
{
  self->_countOfBytesExpectedToWrite = a3;
}

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  self->_unint64_t taskIdentifier = a3;
}

- (BOOL)progressTimerRunning
{
  return self->_progressTimerRunning;
}

- (void)setProgressTimerRunning:(BOOL)a3
{
  self->_progressTimerRunning = a3;
}

- (void).cxx_destruct
{
}

@end