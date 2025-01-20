@interface HIDContinuousRecorder
- (BOOL)captureHIDEvents;
- (BOOL)continuousRecordingDeleteForAllServicesWithRetry:(BOOL)a3;
- (BOOL)continuousRecordingEnabledWithRetry:(BOOL)a3;
- (BOOL)deleteItemAtURL:(id)a3 withRetry:(BOOL)a4;
- (BOOL)enabled;
- (BOOL)fileExistsAtURL:(id)a3 isDirectory:(BOOL)a4 withRetry:(BOOL)a5;
- (BOOL)isKeyboardRecordingURL:(id)a3;
- (BOOL)isPasscodeRecordingURL:(id)a3;
- (BOOL)keyboardRecordingsExist;
- (BOOL)keyboardVisible;
- (BOOL)passcodeVisible;
- (BOOL)recordEvent:(id)a3;
- (HIDContinuousRecorder)initWithService:(id)a3;
- (HIDEventService)service;
- (NSFileHandle)currentRecording;
- (NSMutableArray)filesByCreationDate;
- (NSMutableData)eventData;
- (NSURL)directoryURL;
- (NSURL)oldestKeyboardFileURL;
- (NSXPCConnection)xpcPreferenceProvider;
- (NSXPCConnection)xpcRecordingUpdater;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)keyboardTimer;
- (OS_dispatch_source)timestampTimer;
- (OS_os_log)logHandle;
- (id)createFileAtURL:(id)a3 WithRetry:(BOOL)a4;
- (id)description;
- (id)getNewRecordingURL;
- (id)getTimestampString;
- (int)enableToken;
- (int)extractRecordingNum:(id)a3;
- (int)forceFlushToken;
- (int)keyboardHideToken;
- (int)keyboardShowToken;
- (int)passcodeHideToken;
- (int)passcodeShowToken;
- (unint64_t)appendData:(id)a3 toFileHandle:(id)a4 withRetry:(BOOL)a5;
- (unsigned)filesTotalBytes;
- (unsigned)maxFileSize;
- (unsigned)maxTotalBytes;
- (unsigned)timestampFrequency;
- (void)appendBootSessionUUIDToData:(id)a3;
- (void)appendEventDataToRecording;
- (void)appendHIDPropertiesToData:(id)a3;
- (void)appendHWModelToData:(id)a3;
- (void)appendLabPepperEntryWithDataSource:(unsigned __int16)a3 andPayload:(id)a4 toData:(id)a5;
- (void)appendLabPepperHeaderToData:(id)a3;
- (void)appendMetadataEndToData:(id)a3;
- (void)appendOSVersionToData:(id)a3;
- (void)appendPrivacyTypeToData:(id)a3;
- (void)appendRecordingMetadataToData:(id)a3;
- (void)appendRtpToWallclockMappingToData:(id)a3;
- (void)appendTimezoneToData:(id)a3;
- (void)closeFileWithFileHandle:(id)a3 WithRetry:(BOOL)a4;
- (void)continuousRecordingSetDeleteForAllServices:(BOOL)a3 withRetry:(BOOL)a4;
- (void)createNewRecording;
- (void)createRecordingDirectoryWithRetry:(BOOL)a3;
- (void)deleteExpiredKeyboardRecordings;
- (void)deleteInvalidRecordingsForAllServices;
- (void)deleteRecordingsExceedingMaxTotalBytes;
- (void)disableRecordings;
- (void)enableRecordings;
- (void)getfilesByCreationDateWithRetry:(BOOL)a3;
- (void)setCurrentRecording:(id)a3;
- (void)setEnableToken:(int)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEventData:(id)a3;
- (void)setFilesByCreationDate:(id)a3;
- (void)setForceFlushToken:(int)a3;
- (void)setKeyboardHideToken:(int)a3;
- (void)setKeyboardShowToken:(int)a3;
- (void)setKeyboardTimer:(id)a3;
- (void)setKeyboardVisible:(BOOL)a3;
- (void)setPasscodeHideToken:(int)a3;
- (void)setPasscodeShowToken:(int)a3;
- (void)setPasscodeVisible:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setTimestampTimer:(id)a3;
- (void)start;
- (void)startKeyboardTimer;
- (void)startTimestampTimer;
- (void)stop;
@end

@implementation HIDContinuousRecorder

- (HIDContinuousRecorder)initWithService:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___HIDContinuousRecorder;
  v6 = -[HIDContinuousRecorder init](&v19, "init");
  if (v6)
  {
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.ContinuousRecorder", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_service, a3);
    v6->_maxFileSize = [v5 continuousRecordingFileSize];
    v6->_maxTotalBytes = [v5 continuousRecordingTotalBytes];
    v6->_timestampFrequency = [v5 continuousRecordingTimestampFrequency];
    v6->_captureHIDEvents = [v5 continuousRecordingCaptureHIDEvents];
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 0x20000LL));
    eventData = v6->_eventData;
    v6->_eventData = (NSMutableData *)v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    filesByCreationDate = v6->_filesByCreationDate;
    v6->_filesByCreationDate = v13;

    xpcRecordingUpdater = v6->_xpcRecordingUpdater;
    v6->_xpcRecordingUpdater = 0LL;

    *(void *)&v6->_keyboardShowToken = -1LL;
    *(void *)&v6->_forceFlushToken = -1LL;
    *(void *)&v6->_passcodeShowToken = -1LL;
    os_log_t v16 = os_log_create("com.apple.ContinuousRecording", "SessionFilter");
    logHandle = v6->_logHandle;
    v6->_logHandle = v16;
  }

  return v6;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(&OBJC_CLASS___HIDContinuousRecorder, a2);
  v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = -[HIDContinuousRecorder maxFileSize](self, "maxFileSize");
  uint64_t v7 = -[HIDContinuousRecorder maxTotalBytes](self, "maxTotalBytes");
  uint64_t v8 = -[HIDContinuousRecorder timestampFrequency](self, "timestampFrequency");
  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder service](self, "service"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: maxFileSize %u maxTotalBytes %u timestampFrequency %u HIDEventService %@",  v5,  v6,  v7,  v8,  v9));

  return v10;
}

- (NSXPCConnection)xpcRecordingUpdater
{
  xpcRecordingUpdater = self->_xpcRecordingUpdater;
  if (!xpcRecordingUpdater)
  {
    v4 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.SessionFilterRecordingUpdater");
    id v5 = self->_xpcRecordingUpdater;
    self->_xpcRecordingUpdater = v4;

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SessionFilterRecordingUpdaterProtocol));
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray, v7);
    v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v8,  objc_opt_class(&OBJC_CLASS___NSURL, v9),  0LL);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v6 setClasses:v11 forSelector:"filesSortedByCreationDateInDirectory:withPathExtension:withReply:" argumentIndex:0 ofReply:1];
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcRecordingUpdater, "setRemoteObjectInterface:", v6);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = __44__HIDContinuousRecorder_xpcRecordingUpdater__block_invoke;
    v13[3] = &unk_14558;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcRecordingUpdater, "setInvalidationHandler:", v13);
    -[NSXPCConnection resume](self->_xpcRecordingUpdater, "resume");
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

    xpcRecordingUpdater = self->_xpcRecordingUpdater;
  }

  return xpcRecordingUpdater;
}

void __44__HIDContinuousRecorder_xpcRecordingUpdater__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __44__HIDContinuousRecorder_xpcRecordingUpdater__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    uint64_t v11 = (void *)v2[6];
    v2[6] = 0LL;
  }
}

- (NSXPCConnection)xpcPreferenceProvider
{
  xpcPreferenceProvider = self->_xpcPreferenceProvider;
  if (!xpcPreferenceProvider)
  {
    uint64_t v4 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.SessionFilterPreferenceProvider");
    uint64_t v5 = self->_xpcPreferenceProvider;
    self->_xpcPreferenceProvider = v4;

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SessionFilterPreferenceProviderProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcPreferenceProvider, "setRemoteObjectInterface:", v6);

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    uint64_t v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472LL;
    uint64_t v10 = __46__HIDContinuousRecorder_xpcPreferenceProvider__block_invoke;
    uint64_t v11 = &unk_14558;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcPreferenceProvider, "setInvalidationHandler:", &v8);
    -[NSXPCConnection resume](self->_xpcPreferenceProvider, "resume", v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    xpcPreferenceProvider = self->_xpcPreferenceProvider;
  }

  return xpcPreferenceProvider;
}

void __46__HIDContinuousRecorder_xpcPreferenceProvider__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __46__HIDContinuousRecorder_xpcPreferenceProvider__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    uint64_t v11 = (void *)v2[7];
    v2[7] = 0LL;
  }
}

- (void)createRecordingDirectoryWithRetry:(BOOL)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder xpcRecordingUpdater](self, "xpcRecordingUpdater"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __59__HIDContinuousRecorder_createRecordingDirectoryWithRetry___block_invoke;
  v10[3] = &unk_14580;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 synchronousRemoteObjectProxyWithErrorHandler:v10]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder directoryURL](self, "directoryURL"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __59__HIDContinuousRecorder_createRecordingDirectoryWithRetry___block_invoke_42;
  v8[3] = &unk_145A8;
  objc_copyWeak(&v9, &location);
  [v6 createDirectoryAtURL:v7 withReply:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __59__HIDContinuousRecorder_createRecordingDirectoryWithRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__HIDContinuousRecorder_createRecordingDirectoryWithRetry___block_invoke_cold_1();
    }

    if (*(_BYTE *)(a1 + 40)) {
      [v5 createRecordingDirectoryWithRetry:0];
    }
  }
}

void __59__HIDContinuousRecorder_createRecordingDirectoryWithRetry___block_invoke_42(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__HIDContinuousRecorder_createRecordingDirectoryWithRetry___block_invoke_42_cold_1();
    }
  }
}

- (void)getfilesByCreationDateWithRetry:(BOOL)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder xpcRecordingUpdater](self, "xpcRecordingUpdater"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __57__HIDContinuousRecorder_getfilesByCreationDateWithRetry___block_invoke;
  v10[3] = &unk_14580;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 synchronousRemoteObjectProxyWithErrorHandler:v10]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder directoryURL](self, "directoryURL"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __57__HIDContinuousRecorder_getfilesByCreationDateWithRetry___block_invoke_45;
  v8[3] = &unk_145D0;
  objc_copyWeak(&v9, &location);
  [v6 filesSortedByCreationDateInDirectory:v7 withPathExtension:@".lp5" withReply:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __57__HIDContinuousRecorder_getfilesByCreationDateWithRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__HIDContinuousRecorder_createRecordingDirectoryWithRetry___block_invoke_cold_1();
    }

    if (*(_BYTE *)(a1 + 40)) {
      [v5 getfilesByCreationDateWithRetry:0];
    }
  }
}

void __57__HIDContinuousRecorder_getfilesByCreationDateWithRetry___block_invoke_45( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v19 = v5;
    id v8 = [v5 mutableCopy];
    [WeakRetained setFilesByCreationDate:v8];

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([WeakRetained filesByCreationDate]);
    id v9 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        BOOL v12 = 0LL;
        do
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v12);
          id v22 = 0LL;
          [v13 getResourceValue:&v22 forKey:NSURLFileSizeKey error:0];
          id v14 = v22;
          id v21 = 0LL;
          [v13 getResourceValue:&v21 forKey:NSURLContentModificationDateKey error:0];
          id v15 = v21;
          os_log_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
            *(_DWORD *)buf = 138412802;
            v28 = v17;
            __int16 v29 = 2112;
            id v30 = v14;
            __int16 v31 = 2112;
            id v32 = v15;
            _os_log_debug_impl( &dword_0,  v16,  OS_LOG_TYPE_DEBUG,  "%@: file size %@ bytes, modification date %@",  buf,  0x20u);
          }

          BOOL v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
      }

      while (v10);
    }

    id v5 = v19;
    if (v6)
    {
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __57__HIDContinuousRecorder_getfilesByCreationDateWithRetry___block_invoke_45_cold_1();
      }
    }
  }
}

- (int)extractRecordingNum:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 componentsSeparatedByString:@"_"]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);
  int v5 = [v4 intValue];

  return v5;
}

- (BOOL)fileExistsAtURL:(id)a3 isDirectory:(BOOL)a4 withRetry:(BOOL)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v25 = 0LL;
  __int128 v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder xpcRecordingUpdater](self, "xpcRecordingUpdater"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = __63__HIDContinuousRecorder_fileExistsAtURL_isDirectory_withRetry___block_invoke;
  v19[3] = &unk_145F8;
  objc_copyWeak(&v22, &location);
  BOOL v23 = a5;
  id v21 = &v25;
  id v10 = v8;
  id v20 = v10;
  char v24 = v6;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v19]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __63__HIDContinuousRecorder_fileExistsAtURL_isDirectory_withRetry___block_invoke_49;
  v14[3] = &unk_14620;
  objc_copyWeak(&v17, &location);
  os_log_t v16 = &v25;
  char v18 = v6;
  id v12 = v10;
  id v15 = v12;
  [v11 fileExistsAtURL:v12 isDirectory:v6 withReply:v14];
  LOBYTE(v6) = *((_BYTE *)v26 + 24);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v22);
  _Block_object_dispose(&v25, 8);
  objc_destroyWeak(&location);

  return v6;
}

void __63__HIDContinuousRecorder_fileExistsAtURL_isDirectory_withRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__HIDContinuousRecorder_createRecordingDirectoryWithRetry___block_invoke_cold_1();
    }

    if (*(_BYTE *)(a1 + 56)) {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 fileExistsAtURL:*(void *)(a1 + 32) isDirectory:*(unsigned __int8 *)(a1 + 57) withRetry:0];
    }
  }
}

void __63__HIDContinuousRecorder_fileExistsAtURL_isDirectory_withRetry___block_invoke_49( uint64_t a1,  char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
    {
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __63__HIDContinuousRecorder_fileExistsAtURL_isDirectory_withRetry___block_invoke_49_cold_1(a1);
      }
    }
  }
}

- (BOOL)continuousRecordingEnabledWithRetry:(BOOL)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder xpcPreferenceProvider](self, "xpcPreferenceProvider"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __61__HIDContinuousRecorder_continuousRecordingEnabledWithRetry___block_invoke;
  v11[3] = &unk_14648;
  objc_copyWeak(&v12, &location);
  BOOL v13 = a3;
  v11[4] = &v14;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 synchronousRemoteObjectProxyWithErrorHandler:v11]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __61__HIDContinuousRecorder_continuousRecordingEnabledWithRetry___block_invoke_53;
  v9[3] = &unk_14670;
  objc_copyWeak(&v10, &location);
  v9[4] = &v14;
  [v6 continuousRecordingEnabledWithReply:v9];
  char v7 = *((_BYTE *)v15 + 24);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v12);
  _Block_object_dispose(&v14, 8);
  objc_destroyWeak(&location);
  return v7;
}

void __61__HIDContinuousRecorder_continuousRecordingEnabledWithRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__HIDContinuousRecorder_createRecordingDirectoryWithRetry___block_invoke_cold_1();
    }

    if (*(_BYTE *)(a1 + 48)) {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v5 continuousRecordingEnabledWithRetry:0];
    }
  }
}

void __61__HIDContinuousRecorder_continuousRecordingEnabledWithRetry___block_invoke_53(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  }
}

- (BOOL)continuousRecordingDeleteForAllServicesWithRetry:(BOOL)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder xpcPreferenceProvider](self, "xpcPreferenceProvider"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __74__HIDContinuousRecorder_continuousRecordingDeleteForAllServicesWithRetry___block_invoke;
  v11[3] = &unk_14648;
  objc_copyWeak(&v12, &location);
  BOOL v13 = a3;
  v11[4] = &v14;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 synchronousRemoteObjectProxyWithErrorHandler:v11]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __74__HIDContinuousRecorder_continuousRecordingDeleteForAllServicesWithRetry___block_invoke_54;
  v9[3] = &unk_14670;
  objc_copyWeak(&v10, &location);
  v9[4] = &v14;
  [v6 continuousRecordingDeleteForAllServicesWithReply:v9];
  char v7 = *((_BYTE *)v15 + 24);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v12);
  _Block_object_dispose(&v14, 8);
  objc_destroyWeak(&location);
  return v7;
}

void __74__HIDContinuousRecorder_continuousRecordingDeleteForAllServicesWithRetry___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__HIDContinuousRecorder_createRecordingDirectoryWithRetry___block_invoke_cold_1();
    }

    if (*(_BYTE *)(a1 + 48)) {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v5 continuousRecordingDeleteForAllServicesWithRetry:0];
    }
  }
}

void __74__HIDContinuousRecorder_continuousRecordingDeleteForAllServicesWithRetry___block_invoke_54( uint64_t a1,  char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  }
}

- (void)continuousRecordingSetDeleteForAllServices:(BOOL)a3 withRetry:(BOOL)a4
{
  BOOL v5 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  char v7 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder xpcPreferenceProvider](self, "xpcPreferenceProvider"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __78__HIDContinuousRecorder_continuousRecordingSetDeleteForAllServices_withRetry___block_invoke;
  v9[3] = &unk_14698;
  objc_copyWeak(&v10, &location);
  BOOL v11 = a4;
  BOOL v12 = v5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 synchronousRemoteObjectProxyWithErrorHandler:v9]);

  [v8 continuousRecordingSetDeleteForAllServices:v5];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __78__HIDContinuousRecorder_continuousRecordingSetDeleteForAllServices_withRetry___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__HIDContinuousRecorder_createRecordingDirectoryWithRetry___block_invoke_cold_1();
    }

    if (*(_BYTE *)(a1 + 40)) {
      [v5 continuousRecordingSetDeleteForAllServices:*(unsigned __int8 *)(a1 + 41) withRetry:0];
    }
  }
}

- (BOOL)deleteItemAtURL:(id)a3 withRetry:(BOOL)a4
{
  id v6 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v22 = 0LL;
  BOOL v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 1;
  char v7 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder xpcRecordingUpdater](self, "xpcRecordingUpdater"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = __51__HIDContinuousRecorder_deleteItemAtURL_withRetry___block_invoke;
  v17[3] = &unk_146C0;
  objc_copyWeak(&v20, &location);
  BOOL v21 = a4;
  id v19 = &v22;
  id v8 = v6;
  id v18 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 synchronousRemoteObjectProxyWithErrorHandler:v17]);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __51__HIDContinuousRecorder_deleteItemAtURL_withRetry___block_invoke_55;
  v13[3] = &unk_146E8;
  objc_copyWeak(&v16, &location);
  id v10 = v8;
  id v14 = v10;
  id v15 = &v22;
  [v9 deleteItemAtURL:v10 withReply:v13];
  char v11 = *((_BYTE *)v23 + 24);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v20);
  _Block_object_dispose(&v22, 8);
  objc_destroyWeak(&location);

  return v11;
}

void __51__HIDContinuousRecorder_deleteItemAtURL_withRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__HIDContinuousRecorder_createRecordingDirectoryWithRetry___block_invoke_cold_1();
    }

    if (*(_BYTE *)(a1 + 56)) {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 deleteItemAtURL:*(void *)(a1 + 32) withRetry:0];
    }
    else {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    }
  }
}

void __51__HIDContinuousRecorder_deleteItemAtURL_withRetry___block_invoke_55(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    char v7 = v6;
    if (v3)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __51__HIDContinuousRecorder_deleteItemAtURL_withRetry___block_invoke_55_cold_2();
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    }

    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __51__HIDContinuousRecorder_deleteItemAtURL_withRetry___block_invoke_55_cold_1(a1);
      }
    }
  }
}

- (unsigned)filesTotalBytes
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder filesByCreationDate](self, "filesByCreationDate"));
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    unsigned int v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        id v10 = 0LL;
      }

      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v4);
  }

  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (void)deleteRecordingsExceedingMaxTotalBytes
{
  while (1)
  {
    unsigned int v3 = -[HIDContinuousRecorder filesTotalBytes](self, "filesTotalBytes");
    if (v3 <= -[HIDContinuousRecorder maxTotalBytes](self, "maxTotalBytes")) {
      break;
    }
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder filesByCreationDate](self, "filesByCreationDate"));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]);
    unsigned int v6 = -[HIDContinuousRecorder deleteItemAtURL:withRetry:](self, "deleteItemAtURL:withRetry:", v5, 1LL);

    if (!v6) {
      break;
    }
    char v7 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder filesByCreationDate](self, "filesByCreationDate"));
    [v7 removeObjectAtIndex:0];
  }

- (BOOL)keyboardRecordingsExist
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder filesByCreationDate](self, "filesByCreationDate", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (-[HIDContinuousRecorder isKeyboardRecordingURL:]( self,  "isKeyboardRecordingURL:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)i)))
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (NSURL)oldestKeyboardFileURL
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder filesByCreationDate](self, "filesByCreationDate", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if (-[HIDContinuousRecorder isKeyboardRecordingURL:](self, "isKeyboardRecordingURL:", v8))
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v9 = 0LL;
LABEL_11:

  return (NSURL *)v9;
}

- (void)deleteExpiredKeyboardRecordings
{
  uint64_t v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[HIDContinuousRecorder getfilesByCreationDateWithRetry:](self, "getfilesByCreationDateWithRetry:", 1LL);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder filesByCreationDate](self, "filesByCreationDate"));
  id v4 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v29;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v29 != v6) {
        objc_enumerationMutation(v3);
      }
      BOOL v8 = *(void **)(*((void *)&v28 + 1) + 8 * v7);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder filesByCreationDate](self, "filesByCreationDate"));
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lastObject]);
      unsigned __int8 v11 = [v8 isEqual:v10];

      if ((v11 & 1) != 0) {
        break;
      }
      if (-[HIDContinuousRecorder isKeyboardRecordingURL:](self, "isKeyboardRecordingURL:", v8))
      {
        id v27 = 0LL;
        unsigned int v12 = [v8 getResourceValue:&v27 forKey:NSURLContentModificationDateKey error:0];
        id v13 = v27;
        __int128 v14 = v13;
        if (v12)
        {
          [v13 timeIntervalSinceNow];
          if (v15 > 0.0 || ([v14 timeIntervalSinceNow], v16 <= -300.0)) {
            -[NSMutableArray addObject:](v22, "addObject:", v8);
          }
        }
      }

      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (-[NSMutableArray count](v22, "count"))
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    char v17 = v22;
    id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v23,  v32,  16LL);
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v17);
          }
          -[HIDContinuousRecorder deleteItemAtURL:withRetry:]( self,  "deleteItemAtURL:withRetry:",  *(void *)(*((void *)&v23 + 1) + 8LL * (void)i),  1LL);
        }

        id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v23,  v32,  16LL);
      }

      while (v19);
    }

    -[HIDContinuousRecorder getfilesByCreationDateWithRetry:](self, "getfilesByCreationDateWithRetry:", 1LL);
  }
}

- (void)appendRecordingMetadataToData:(id)a3
{
  id v4 = a3;
  -[HIDContinuousRecorder appendHIDPropertiesToData:](self, "appendHIDPropertiesToData:", v4);
  -[HIDContinuousRecorder appendBootSessionUUIDToData:](self, "appendBootSessionUUIDToData:", v4);
  -[HIDContinuousRecorder appendOSVersionToData:](self, "appendOSVersionToData:", v4);
  -[HIDContinuousRecorder appendHWModelToData:](self, "appendHWModelToData:", v4);
  -[HIDContinuousRecorder appendTimezoneToData:](self, "appendTimezoneToData:", v4);
  -[HIDContinuousRecorder appendRtpToWallclockMappingToData:](self, "appendRtpToWallclockMappingToData:", v4);
  -[HIDContinuousRecorder appendPrivacyTypeToData:](self, "appendPrivacyTypeToData:", v4);
  -[HIDContinuousRecorder appendMetadataEndToData:](self, "appendMetadataEndToData:", v4);
}

- (void)createNewRecording
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder currentRecording](self, "currentRecording"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder filesByCreationDate](self, "filesByCreationDate"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastObject]);
    unsigned int v6 = -[HIDContinuousRecorder fileExistsAtURL:isDirectory:withRetry:]( self,  "fileExistsAtURL:isDirectory:withRetry:",  v5,  0LL,  1LL);

    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 0x20000LL));
      -[HIDContinuousRecorder setEventData:](self, "setEventData:", v7);

      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder eventData](self, "eventData"));
      -[HIDContinuousRecorder appendTimezoneToData:](self, "appendTimezoneToData:", v8);

      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder eventData](self, "eventData"));
      -[HIDContinuousRecorder appendRtpToWallclockMappingToData:](self, "appendRtpToWallclockMappingToData:", v9);

      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder eventData](self, "eventData"));
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder currentRecording](self, "currentRecording"));
      -[HIDContinuousRecorder appendData:toFileHandle:withRetry:]( self,  "appendData:toFileHandle:withRetry:",  v10,  v11,  1LL);
    }

    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder currentRecording](self, "currentRecording"));
    -[HIDContinuousRecorder closeFileWithFileHandle:WithRetry:](self, "closeFileWithFileHandle:WithRetry:", v12, 1LL);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder getNewRecordingURL](self, "getNewRecordingURL"));
  if (-[HIDContinuousRecorder fileExistsAtURL:isDirectory:withRetry:]( self,  "fileExistsAtURL:isDirectory:withRetry:",  v13,  0LL,  1LL))
  {
    do
    {
      +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.001);
      id v22 = (id)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder getNewRecordingURL](self, "getNewRecordingURL"));

      unsigned __int8 v14 = -[HIDContinuousRecorder fileExistsAtURL:isDirectory:withRetry:]( self,  "fileExistsAtURL:isDirectory:withRetry:",  v22,  0LL,  1LL);
      id v15 = v22;
      id v13 = v22;
    }

    while ((v14 & 1) != 0);
  }

  else
  {
    id v15 = v13;
  }

  id v23 = v15;
  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder createFileAtURL:WithRetry:](self, "createFileAtURL:WithRetry:", v15, 1LL));
  -[HIDContinuousRecorder setCurrentRecording:](self, "setCurrentRecording:", v16);

  char v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 0x20000LL));
  -[HIDContinuousRecorder setEventData:](self, "setEventData:", v17);

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder eventData](self, "eventData"));
  -[HIDContinuousRecorder appendLabPepperHeaderToData:](self, "appendLabPepperHeaderToData:", v18);

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder eventData](self, "eventData"));
  -[HIDContinuousRecorder appendRecordingMetadataToData:](self, "appendRecordingMetadataToData:", v19);

  -[HIDContinuousRecorder appendEventDataToRecording](self, "appendEventDataToRecording");
  -[HIDContinuousRecorder deleteRecordingsExceedingMaxTotalBytes](self, "deleteRecordingsExceedingMaxTotalBytes");
  -[HIDContinuousRecorder startTimestampTimer](self, "startTimestampTimer");
  service = self->_service;
  BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v23 path]);
  -[HIDEventService setProperty:forKey:](service, "setProperty:forKey:", v21, @"HCRNewFilePath");
}

- (id)getTimestampString
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
  -[NSISO8601DateFormatter setTimeZone:](v2, "setTimeZone:", v3);

  -[NSISO8601DateFormatter setFormatOptions:]( v2,  "setFormatOptions:",  -[NSISO8601DateFormatter formatOptions](v2, "formatOptions") & 0xFFFFFFFFFFFFF9FFLL);
  -[NSISO8601DateFormatter setFormatOptions:]( v2,  "setFormatOptions:",  -[NSISO8601DateFormatter formatOptions](v2, "formatOptions") | 0x800);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](v2, "stringFromDate:", v4));

  return v5;
}

- (id)getNewRecordingURL
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 64LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder service](self, "service"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 continuousRecordingFilenamePrefix]);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder getTimestampString](self, "getTimestampString"));
  [v3 appendFormat:@"%@_%@", v5, v6];

  if (-[HIDContinuousRecorder passcodeVisible](self, "passcodeVisible"))
  {
    uint64_t v7 = @"passcode";
LABEL_5:
    [v3 appendFormat:@"_%@_%@", @"private", v7];
    goto LABEL_6;
  }

  if (-[HIDContinuousRecorder keyboardVisible](self, "keyboardVisible"))
  {
    uint64_t v7 = @"keyboard";
    goto LABEL_5;
  }

- (BOOL)isPasscodeRecordingURL:(id)a3
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([a3 lastPathComponent]);
  unsigned __int8 v4 = [v3 containsString:@"passcode"];

  return v4;
}

- (BOOL)isKeyboardRecordingURL:(id)a3
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([a3 lastPathComponent]);
  unsigned __int8 v4 = [v3 containsString:@"keyboard"];

  return v4;
}

- (id)createFileAtURL:(id)a3 WithRetry:(BOOL)a4
{
  id v6 = a3;
  uint64_t v23 = 0LL;
  __int128 v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  __int128 v26 = __Block_byref_object_copy_;
  id v27 = __Block_byref_object_dispose_;
  id v28 = 0LL;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder xpcRecordingUpdater](self, "xpcRecordingUpdater"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = __51__HIDContinuousRecorder_createFileAtURL_WithRetry___block_invoke;
  v17[3] = &unk_146C0;
  objc_copyWeak(&v20, &location);
  BOOL v21 = a4;
  id v19 = &v23;
  id v8 = v6;
  id v18 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 synchronousRemoteObjectProxyWithErrorHandler:v17]);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __51__HIDContinuousRecorder_createFileAtURL_WithRetry___block_invoke_73;
  v13[3] = &unk_14710;
  objc_copyWeak(&v16, &location);
  id v15 = &v23;
  id v10 = v8;
  id v14 = v10;
  [v9 createFileAtURL:v10 withReply:v13];
  id v11 = (id)v24[5];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __51__HIDContinuousRecorder_createFileAtURL_WithRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__HIDContinuousRecorder_createRecordingDirectoryWithRetry___block_invoke_cold_1();
    }

    if (*(_BYTE *)(a1 + 56))
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 createFileAtURL:*(void *)(a1 + 32) WithRetry:0]);
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
  }
}

void __51__HIDContinuousRecorder_createFileAtURL_WithRetry___block_invoke_73(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained filesByCreationDate]);
      uint64_t v11 = *(void *)(a1 + 32);
      id v10 = (id *)(a1 + 32);
      [v9 addObject:v11];

      unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __51__HIDContinuousRecorder_createFileAtURL_WithRetry___block_invoke_73_cold_2(v10);
      }
    }

    else
    {
      unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __51__HIDContinuousRecorder_createFileAtURL_WithRetry___block_invoke_73_cold_1();
      }
    }
  }
}

- (void)closeFileWithFileHandle:(id)a3 WithRetry:(BOOL)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder logHandle](self, "logHandle"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[HIDContinuousRecorder closeFileWithFileHandle:WithRetry:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s fileHandle %@", buf, 0x16u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder xpcRecordingUpdater](self, "xpcRecordingUpdater"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __59__HIDContinuousRecorder_closeFileWithFileHandle_WithRetry___block_invoke;
  v13[3] = &unk_14738;
  objc_copyWeak(&v15, (id *)buf);
  BOOL v16 = a4;
  id v9 = v6;
  id v14 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 synchronousRemoteObjectProxyWithErrorHandler:v13]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __59__HIDContinuousRecorder_closeFileWithFileHandle_WithRetry___block_invoke_75;
  v11[3] = &unk_145A8;
  objc_copyWeak(&v12, (id *)buf);
  [v10 closeFileWithFileHandle:v9 withReply:v11];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __59__HIDContinuousRecorder_closeFileWithFileHandle_WithRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__HIDContinuousRecorder_createRecordingDirectoryWithRetry___block_invoke_cold_1();
    }

    if (*(_BYTE *)(a1 + 48)) {
      [v5 closeFileWithFileHandle:*(void *)(a1 + 32) WithRetry:0];
    }
  }
}

void __59__HIDContinuousRecorder_closeFileWithFileHandle_WithRetry___block_invoke_75(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    id v7 = v6;
    if (v3)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __59__HIDContinuousRecorder_closeFileWithFileHandle_WithRetry___block_invoke_75_cold_2();
      }
    }

    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      __59__HIDContinuousRecorder_closeFileWithFileHandle_WithRetry___block_invoke_75_cold_1(v7);
    }
  }
}

- (NSURL)directoryURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder service](self, "service"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 continuousRecordingSubdirectoryName]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mobile/Library/Logs/ContinuousRecordings" stringByAppendingPathComponent:v3]);

  id v5 = objc_alloc(&OBJC_CLASS___NSURL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByStandardizingPath]);
  id v7 = -[NSURL initFileURLWithPath:isDirectory:](v5, "initFileURLWithPath:isDirectory:", v6, 1LL);

  return v7;
}

- (void)appendLabPepperHeaderToData:(id)a3
{
  __int16 v3 = 5;
  [a3 appendBytes:&v3 length:2];
}

- (void)appendLabPepperEntryWithDataSource:(unsigned __int16)a3 andPayload:(id)a4 toData:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((unint64_t)[v8 length] < 0x10000)
  {
    __int16 v12 = v6;
    unsigned __int16 v11 = (unsigned __int16)[v8 length];
    [v9 appendBytes:&v12 length:2];
    [v9 appendBytes:&v11 length:2];
    [v9 appendData:v8];
  }

  else
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder logHandle](self, "logHandle"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[HIDContinuousRecorder appendLabPepperEntryWithDataSource:andPayload:toData:].cold.1(v8, v6, v10);
    }
  }
}

- (void)appendRtpToWallclockMappingToData:(id)a3
{
  id v4 = a3;
  mach_timebase_info info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
  mach_timebase_info(&info);
  *(_DWORD *)id v9 = 1000000000 * (unint64_t)info.denom / info.numer;
  do
  {
    uint64_t v5 = mach_continuous_time();
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate", v5, *(void *)v9);
    *(void *)&void v9[4] = v6;
  }

  while ((mach_continuous_time() - v5) * info.numer / info.denom > 0x1E847F);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v8, 20LL));
  -[HIDContinuousRecorder appendLabPepperEntryWithDataSource:andPayload:toData:]( self,  "appendLabPepperEntryWithDataSource:andPayload:toData:",  205LL,  v7,  v4);
}

- (void)appendTimezoneToData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](&OBJC_CLASS___NSTimeZone, "localTimeZone"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);

  id v7 = v6;
  id v8 = [v7 UTF8String];
  id v11 = v7;
  id v9 = +[NSData dataWithBytes:length:]( NSData,  "dataWithBytes:length:",  v8,  strlen((const char *)[v11 UTF8String]));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[HIDContinuousRecorder appendLabPepperEntryWithDataSource:andPayload:toData:]( self,  "appendLabPepperEntryWithDataSource:andPayload:toData:",  212LL,  v10,  v4);
}

- (void)appendBootSessionUUIDToData:(id)a3
{
  id v4 = a3;
  *(void *)&v10[13] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)in = v5;
  *(_OWORD *)id v10 = v5;
  memset(uu, 170, sizeof(uu));
  size_t v7 = 37LL;
  if (sysctlbyname("kern.bootsessionuuid", in, &v7, 0LL, 0LL) || v7 != 37)
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder logHandle](self, "logHandle"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[HIDContinuousRecorder appendBootSessionUUIDToData:].cold.1();
    }
  }

  else if (uuid_parse(in, uu))
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder logHandle](self, "logHandle"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[HIDContinuousRecorder appendBootSessionUUIDToData:].cold.2();
    }
  }

  else
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", uu, 16LL));
    -[HIDContinuousRecorder appendLabPepperEntryWithDataSource:andPayload:toData:]( self,  "appendLabPepperEntryWithDataSource:andPayload:toData:",  210LL,  v6,  v4);
  }
}

- (void)appendOSVersionToData:(id)a3
{
  id v4 = a3;
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__s = v5;
  __int128 v11 = v5;
  size_t v9 = 32LL;
  if (sysctlbyname("kern.osversion", __s, &v9, 0LL, 0LL)) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v9 > 1;
  }
  if (v6)
  {
    id v8 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", __s, strlen(__s));
    size_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    -[HIDContinuousRecorder appendLabPepperEntryWithDataSource:andPayload:toData:]( self,  "appendLabPepperEntryWithDataSource:andPayload:toData:",  213LL,  v7,  v4);
  }

  else
  {
    size_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder logHandle](self, "logHandle"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[HIDContinuousRecorder appendOSVersionToData:].cold.1();
    }
  }
}

- (void)appendPrivacyTypeToData:(id)a3
{
  id v4 = a3;
  if (-[HIDContinuousRecorder passcodeVisible](self, "passcodeVisible"))
  {
    __int128 v5 = @"passcode";
  }

  else if (-[HIDContinuousRecorder keyboardVisible](self, "keyboardVisible"))
  {
    __int128 v5 = @"keyboard";
  }

  else
  {
    __int128 v5 = @"none";
  }

  BOOL v6 = +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  -[__CFString UTF8String](v5, "UTF8String"),  strlen((const char *)-[__CFString UTF8String](v5, "UTF8String")));
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[HIDContinuousRecorder appendLabPepperEntryWithDataSource:andPayload:toData:]( self,  "appendLabPepperEntryWithDataSource:andPayload:toData:",  278LL,  v7,  v4);
}

- (void)appendHWModelToData:(id)a3
{
  id v4 = a3;
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__s = v5;
  __int128 v11 = v5;
  size_t v9 = 32LL;
  if (sysctlbyname("hw.model", __s, &v9, 0LL, 0LL)) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v9 > 1;
  }
  if (v6)
  {
    id v8 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", __s, strlen(__s));
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    -[HIDContinuousRecorder appendLabPepperEntryWithDataSource:andPayload:toData:]( self,  "appendLabPepperEntryWithDataSource:andPayload:toData:",  214LL,  v7,  v4);
  }

  else
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder logHandle](self, "logHandle"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[HIDContinuousRecorder appendHWModelToData:].cold.1();
    }
  }
}

- (void)appendHIDPropertiesToData:(id)a3
{
  id v4 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder service](self, "service", 0LL));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 hidProperties]);

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v12 = [v11 unsignedShortValue];
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder service](self, "service"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 hidProperties]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v11]);

        -[HIDContinuousRecorder appendLabPepperEntryWithDataSource:andPayload:toData:]( self,  "appendLabPepperEntryWithDataSource:andPayload:toData:",  v12,  v15,  v4);
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }
}

- (void)appendMetadataEndToData:(id)a3
{
  id v4 = a3;
  __int128 v5 = objc_opt_new(&OBJC_CLASS___NSData);
  -[HIDContinuousRecorder appendLabPepperEntryWithDataSource:andPayload:toData:]( self,  "appendLabPepperEntryWithDataSource:andPayload:toData:",  273LL,  v5,  v4);
}

- (void)startTimestampTimer
{
  if (-[HIDContinuousRecorder timestampFrequency](self, "timestampFrequency"))
  {
    uint64_t v3 = 1000000000LL * -[HIDContinuousRecorder timestampFrequency](self, "timestampFrequency");
    dispatch_time_t v4 = dispatch_time(0LL, v3);
    __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder timestampTimer](self, "timestampTimer"));

    if (v5)
    {
      id v12 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder timestampTimer](self, "timestampTimer"));
      dispatch_source_set_timer(v12, v4, v3, 0xF4240uLL);
    }

    else
    {
      BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder queue](self, "queue"));
      dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v6);
      -[HIDContinuousRecorder setTimestampTimer:](self, "setTimestampTimer:", v7);

      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder timestampTimer](self, "timestampTimer"));
      if (v8)
      {
        uint64_t v9 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder timestampTimer](self, "timestampTimer"));
        dispatch_source_set_timer(v9, v4, v3, 0xF4240uLL);

        id location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, self);
        id v10 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder timestampTimer](self, "timestampTimer"));
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472LL;
        handler[2] = __44__HIDContinuousRecorder_startTimestampTimer__block_invoke;
        handler[3] = &unk_14558;
        objc_copyWeak(&v14, &location);
        dispatch_source_set_event_handler(v10, handler);

        __int128 v11 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder timestampTimer](self, "timestampTimer"));
        dispatch_activate(v11);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
    }
  }

void __44__HIDContinuousRecorder_startTimestampTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained eventData]);
    v2 = (char *)[v1 length] - 130995;

    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained eventData]);
    [WeakRetained appendTimezoneToData:v3];

    dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained eventData]);
    [WeakRetained appendRtpToWallclockMappingToData:v4];
  }
}

- (void)startKeyboardTimer
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder keyboardTimer](self, "keyboardTimer"));

  if (!v3)
  {
    dispatch_time_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder queue](self, "queue"));
    dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v4);
    -[HIDContinuousRecorder setKeyboardTimer:](self, "setKeyboardTimer:", v5);

    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder keyboardTimer](self, "keyboardTimer"));
    if (v6)
    {
      dispatch_source_t v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder keyboardTimer](self, "keyboardTimer"));
      dispatch_source_set_timer(v7, 0LL, 0x45D964B800uLL, 0LL);

      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      id v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder keyboardTimer](self, "keyboardTimer"));
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = __43__HIDContinuousRecorder_startKeyboardTimer__block_invoke;
      handler[3] = &unk_14760;
      objc_copyWeak(v11, &location);
      v11[1] = (id)300000000000LL;
      dispatch_source_set_event_handler(v8, handler);

      uint64_t v9 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder keyboardTimer](self, "keyboardTimer"));
      dispatch_activate(v9);

      objc_destroyWeak(v11);
      objc_destroyWeak(&location);
    }
  }

void __43__HIDContinuousRecorder_startKeyboardTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained deleteExpiredKeyboardRecordings];
    if ([v3 keyboardRecordingsExist])
    {
      dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 oldestKeyboardFileURL]);
      id v12 = 0LL;
      unsigned int v5 = [v4 getResourceValue:&v12 forKey:NSURLContentModificationDateKey error:0];
      id v6 = v12;

      if (v5)
      {
        [v6 timeIntervalSinceNow];
        if (v7 < 0.0)
        {
          [v6 timeIntervalSinceNow];
          dispatch_time_t v9 = dispatch_time(0LL, 1000000000 * vcvtpd_u64_f64(v8 + 300.0));
          id v10 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v3 keyboardTimer]);
          dispatch_source_set_timer(v10, v9, *(void *)(a1 + 40), 0LL);
        }
      }
    }

    else
    {
      __int128 v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v3 keyboardTimer]);
      dispatch_source_cancel(v11);

      [v3 setKeyboardTimer:0];
    }
  }
}

- (void)deleteInvalidRecordingsForAllServices
{
  if (-[HIDContinuousRecorder continuousRecordingDeleteForAllServicesWithRetry:]( self,  "continuousRecordingDeleteForAllServicesWithRetry:",  1LL))
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___NSURL);
    dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mobile/Library/Logs/ContinuousRecordings" stringByStandardizingPath]);
    unsigned int v5 = -[NSURL initFileURLWithPath:isDirectory:](v3, "initFileURLWithPath:isDirectory:", v4, 1LL);

    -[HIDContinuousRecorder deleteItemAtURL:withRetry:](self, "deleteItemAtURL:withRetry:", v5, 1LL);
    -[HIDContinuousRecorder continuousRecordingSetDeleteForAllServices:withRetry:]( self,  "continuousRecordingSetDeleteForAllServices:withRetry:",  0LL,  1LL);
  }

- (void)enableRecordings
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder service](self, "service"));
  [v3 enableContinuousRecording:1];
}

- (void)disableRecordings
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder service](self, "service"));
  [v3 enableContinuousRecording:0];

  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 0x20000LL));
  -[HIDContinuousRecorder setEventData:](self, "setEventData:", v4);

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder timestampTimer](self, "timestampTimer"));
  if (v5)
  {
    id v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder timestampTimer](self, "timestampTimer"));
    dispatch_source_cancel(v6);

    -[HIDContinuousRecorder setTimestampTimer:](self, "setTimestampTimer:", 0LL);
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder keyboardTimer](self, "keyboardTimer"));

  if (v7)
  {
    double v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder keyboardTimer](self, "keyboardTimer"));
    dispatch_source_cancel(v8);

    -[HIDContinuousRecorder setKeyboardTimer:](self, "setKeyboardTimer:", 0LL);
  }

  dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder directoryURL](self, "directoryURL"));
  unsigned int v10 = -[HIDContinuousRecorder deleteItemAtURL:withRetry:](self, "deleteItemAtURL:withRetry:", v9, 1LL);

  if (v10)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder filesByCreationDate](self, "filesByCreationDate"));
    [v11 removeAllObjects];
  }

- (void)start
{
  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __30__HIDContinuousRecorder_start__block_invoke;
  block[3] = &unk_14558;
  objc_copyWeak(&v23, location);
  dispatch_async(v3, block);

  dispatch_time_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder queue](self, "queue"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = __30__HIDContinuousRecorder_start__block_invoke_2;
  handler[3] = &unk_14788;
  objc_copyWeak(&v21, location);
  notify_register_dispatch("com.apple.ContinuousRecording.enable.changed", &self->_enableToken, v4, handler);

  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder queue](self, "queue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = __30__HIDContinuousRecorder_start__block_invoke_87;
  v18[3] = &unk_14788;
  objc_copyWeak(&v19, location);
  notify_register_dispatch("com.apple.Carousel.passcodeDidShowNotification", &self->_passcodeShowToken, v5, v18);

  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder queue](self, "queue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = __30__HIDContinuousRecorder_start__block_invoke_2_89;
  v16[3] = &unk_14788;
  objc_copyWeak(&v17, location);
  notify_register_dispatch("com.apple.Carousel.passcodeDidHideNotification", &self->_passcodeHideToken, v6, v16);

  double v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder queue](self, "queue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __30__HIDContinuousRecorder_start__block_invoke_3;
  v14[3] = &unk_14788;
  objc_copyWeak(&v15, location);
  notify_register_dispatch( "com.apple.QuickboardViewService.quickboardDidShowNotification",  &self->_keyboardShowToken,  v7,  v14);

  double v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder queue](self, "queue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __30__HIDContinuousRecorder_start__block_invoke_4;
  v12[3] = &unk_14788;
  objc_copyWeak(&v13, location);
  notify_register_dispatch( "com.apple.QuickboardViewService.quickboardDidHideNotification",  &self->_keyboardHideToken,  v8,  v12);

  dispatch_time_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder queue](self, "queue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __30__HIDContinuousRecorder_start__block_invoke_5;
  v10[3] = &unk_147B0;
  objc_copyWeak(&v11, location);
  void v10[4] = self;
  notify_register_dispatch("com.apple.HIDContinuousRecorder.forceFlush", &self->_forceFlushToken, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(location);
}

void __30__HIDContinuousRecorder_start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setEnabled:", objc_msgSend(WeakRetained, "continuousRecordingEnabledWithRetry:", 1));
    else {
      [v2 disableRecordings];
    }
    id WeakRetained = v2;
  }
}

void __30__HIDContinuousRecorder_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v3 = [WeakRetained enabled];
    objc_msgSend(v2, "setEnabled:", objc_msgSend(v2, "continuousRecordingEnabledWithRetry:", 1));
    dispatch_time_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 logHandle]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = [v2 enabled];
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Continuous recordings enabled: %d", (uint8_t *)v5, 8u);
    }

    if (v3 != [v2 enabled])
    {
      else {
        [v2 disableRecordings];
      }
    }
  }
}

void __30__HIDContinuousRecorder_start__block_invoke_87(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v5 = WeakRetained;
    unsigned __int8 v3 = [WeakRetained passcodeVisible];
    id v2 = v5;
    if ((v3 & 1) == 0)
    {
      [v5 setPasscodeVisible:1];
      unsigned int v4 = [v5 enabled];
      id v2 = v5;
      if (v4)
      {
        [v5 appendEventDataToRecording];
        [v5 createNewRecording];
        id v2 = v5;
      }
    }
  }
}

void __30__HIDContinuousRecorder_start__block_invoke_2_89(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v5 = WeakRetained;
    unsigned int v3 = [WeakRetained passcodeVisible];
    id v2 = v5;
    if (v3)
    {
      [v5 setPasscodeVisible:0];
      unsigned int v4 = [v5 enabled];
      id v2 = v5;
      if (v4)
      {
        [v5 appendEventDataToRecording];
        [v5 createNewRecording];
        id v2 = v5;
      }
    }
  }
}

void __30__HIDContinuousRecorder_start__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v5 = WeakRetained;
    unsigned __int8 v3 = [WeakRetained keyboardVisible];
    id v2 = v5;
    if ((v3 & 1) == 0)
    {
      [v5 setKeyboardVisible:1];
      unsigned int v4 = [v5 enabled];
      id v2 = v5;
      if (v4)
      {
        [v5 appendEventDataToRecording];
        [v5 createNewRecording];
        id v2 = v5;
      }
    }
  }
}

void __30__HIDContinuousRecorder_start__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v5 = WeakRetained;
    unsigned int v3 = [WeakRetained keyboardVisible];
    id v2 = v5;
    if (v3)
    {
      [v5 setKeyboardVisible:0];
      unsigned int v4 = [v5 enabled];
      id v2 = v5;
      if (v4)
      {
        [v5 appendEventDataToRecording];
        [v5 createNewRecording];
        [v5 startKeyboardTimer];
        id v2 = v5;
      }
    }
  }
}

void __30__HIDContinuousRecorder_start__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v3 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Force flush notification received", buf, 2u);
    }

    if ([*(id *)(a1 + 32) enabled])
    {
      unsigned int v5 = *(void **)(a1 + 32);
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 eventData]);
      [v5 appendTimezoneToData:v6];

      double v7 = *(void **)(a1 + 32);
      double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 eventData]);
      [v7 appendRtpToWallclockMappingToData:v8];

      [*(id *)(a1 + 32) appendEventDataToRecording];
    }

    uint32_t v9 = notify_post("com.apple.HIDContinuousRecorder.forceFlushFinished");
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 logHandle]);
    id v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __30__HIDContinuousRecorder_start__block_invoke_5_cold_1(v9, v11);
      }
    }

    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Sent force flush finished notification", v12, 2u);
    }
  }
}

- (void)stop
{
  if (-[HIDContinuousRecorder passcodeShowToken](self, "passcodeShowToken") != -1) {
    notify_cancel(-[HIDContinuousRecorder passcodeShowToken](self, "passcodeShowToken"));
  }
  if (-[HIDContinuousRecorder passcodeHideToken](self, "passcodeHideToken") != -1) {
    notify_cancel(-[HIDContinuousRecorder passcodeHideToken](self, "passcodeHideToken"));
  }
  if (-[HIDContinuousRecorder keyboardShowToken](self, "keyboardShowToken") != -1) {
    notify_cancel(-[HIDContinuousRecorder keyboardShowToken](self, "keyboardShowToken"));
  }
  if (-[HIDContinuousRecorder keyboardHideToken](self, "keyboardHideToken") != -1) {
    notify_cancel(-[HIDContinuousRecorder keyboardHideToken](self, "keyboardHideToken"));
  }
  if (-[HIDContinuousRecorder forceFlushToken](self, "forceFlushToken") != -1) {
    notify_cancel(-[HIDContinuousRecorder forceFlushToken](self, "forceFlushToken"));
  }
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  unsigned int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __29__HIDContinuousRecorder_stop__block_invoke;
  v4[3] = &unk_14558;
  objc_copyWeak(&v5, &location);
  dispatch_sync(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __29__HIDContinuousRecorder_stop__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained timestampTimer]);

    if (v1)
    {
      id v2 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([WeakRetained timestampTimer]);
      dispatch_source_cancel(v2);

      [WeakRetained setTimestampTimer:0];
    }

    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained keyboardTimer]);

    if (v3)
    {
      unsigned int v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([WeakRetained keyboardTimer]);
      dispatch_source_cancel(v4);

      [WeakRetained setKeyboardTimer:0];
    }

    id v5 = WeakRetained[6];
    if (v5)
    {
      [v5 suspend];
      [WeakRetained[6] invalidate];
      id v6 = WeakRetained[6];
      WeakRetained[6] = 0LL;
    }

    id v7 = WeakRetained[7];
    if (v7)
    {
      [v7 suspend];
      [WeakRetained[7] invalidate];
      id v8 = WeakRetained[7];
      WeakRetained[7] = 0LL;
    }
  }
}

- (unint64_t)appendData:(id)a3 toFileHandle:(id)a4 withRetry:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder xpcRecordingUpdater](self, "xpcRecordingUpdater"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = __59__HIDContinuousRecorder_appendData_toFileHandle_withRetry___block_invoke;
  v22[3] = &unk_147D8;
  objc_copyWeak(&v25, &location);
  BOOL v26 = a5;
  id v11 = v8;
  id v23 = v11;
  id v12 = v9;
  id v24 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 synchronousRemoteObjectProxyWithErrorHandler:v22]);

  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  uint64_t v21 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = __59__HIDContinuousRecorder_appendData_toFileHandle_withRetry___block_invoke_94;
  v16[3] = &unk_14800;
  objc_copyWeak(&v17, &location);
  void v16[4] = self;
  v16[5] = &v18;
  [v13 appendData:v11 toFileHandle:v12 withReply:v16];
  unint64_t v14 = v19[3];
  objc_destroyWeak(&v17);
  _Block_object_dispose(&v18, 8);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v14;
}

void __59__HIDContinuousRecorder_appendData_toFileHandle_withRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__HIDContinuousRecorder_createRecordingDirectoryWithRetry___block_invoke_cold_1();
    }

    if (*(_BYTE *)(a1 + 56)) {
      [v5 appendData:*(void *)(a1 + 32) toFileHandle:*(void *)(a1 + 40) withRetry:0];
    }
  }
}

void __59__HIDContinuousRecorder_appendData_toFileHandle_withRetry___block_invoke_94( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained logHandle]);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __59__HIDContinuousRecorder_appendData_toFileHandle_withRetry___block_invoke_94_cold_1();
      }
    }

    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
    }
  }
}

- (void)appendEventDataToRecording
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder directoryURL](self, "directoryURL"));
  unsigned __int8 v4 = -[HIDContinuousRecorder fileExistsAtURL:isDirectory:withRetry:]( self,  "fileExistsAtURL:isDirectory:withRetry:",  v3,  1LL,  1LL);

  if ((v4 & 1) == 0) {
    -[HIDContinuousRecorder createRecordingDirectoryWithRetry:](self, "createRecordingDirectoryWithRetry:", 1LL);
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder filesByCreationDate](self, "filesByCreationDate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
  unsigned __int8 v7 = -[HIDContinuousRecorder fileExistsAtURL:isDirectory:withRetry:]( self,  "fileExistsAtURL:isDirectory:withRetry:",  v6,  0LL,  1LL);

  if ((v7 & 1) == 0)
  {
    -[HIDContinuousRecorder getfilesByCreationDateWithRetry:](self, "getfilesByCreationDateWithRetry:", 1LL);
    -[HIDContinuousRecorder createNewRecording](self, "createNewRecording");
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder eventData](self, "eventData"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder currentRecording](self, "currentRecording"));
  unint64_t v10 = -[HIDContinuousRecorder appendData:toFileHandle:withRetry:]( self,  "appendData:toFileHandle:withRetry:",  v8,  v9,  1LL);

  if (v10 >= -[HIDContinuousRecorder maxFileSize](self, "maxFileSize"))
  {
    -[HIDContinuousRecorder createNewRecording](self, "createNewRecording");
  }

  else
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 0x20000LL));
    -[HIDContinuousRecorder setEventData:](self, "setEventData:", v11);
  }

- (BOOL)recordEvent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 type] == 1
    && [v4 integerValueForField:0x10000] == sub_FF1C
    && [v4 integerValueForField:65537] == &stru_B8.reserved2
    && [v4 integerValueForField:65538] == (char *)&dword_0 + 1;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __37__HIDContinuousRecorder_recordEvent___block_invoke;
  block[3] = &unk_14828;
  objc_copyWeak(&v12, &location);
  BOOL v13 = v5;
  id v10 = v4;
  id v11 = self;
  id v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v5;
}

void __37__HIDContinuousRecorder_recordEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (*(_BYTE *)(a1 + 56))
  {
    id v4 = -[NSData initWithBytes:length:]( [NSData alloc],  "initWithBytes:length:",  [*(id *)(a1 + 32) dataValueForField:65540],  objc_msgSend(*(id *)(a1 + 32), "integerValueForField:", 65539));
    uint64_t v5 = 261LL;
    if (!v4) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }

  if ([*(id *)(a1 + 40) captureHIDEvents])
  {
    unsigned int v6 = [*(id *)(a1 + 32) type];
    id v7 = *(void **)(a1 + 32);
    if (v6 == 3)
    {
      id v8 = [v7 copy];
      [v8 setIntegerValue:0 forField:196609];
      [v8 removeAllEvents];
      id v16 = 0LL;
      id v4 = (NSData *)objc_claimAutoreleasedReturnValue([v8 serialize:0 error:&v16]);
      id v9 = v16;
    }

    else
    {
      id v15 = 0LL;
      id v4 = (NSData *)objc_claimAutoreleasedReturnValue([v7 serialize:0 error:&v15]);
      id v9 = v15;
    }

    if (v9)
    {

      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logHandle]);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __37__HIDContinuousRecorder_recordEvent___block_invoke_cold_1();
      }

      id v4 = 0LL;
    }

    uint64_t v5 = 283LL;
    if (v4)
    {
LABEL_15:
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 eventData]);
      id v12 = (char *)[v11 length];
      BOOL v13 = (char *)-[NSData length](v4, "length") + (void)(v12 - 131069);

      unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 eventData]);
      [v3 appendLabPepperEntryWithDataSource:v5 andPayload:v4 toData:v14];
    }
  }

- (HIDEventService)service
{
  return (HIDEventService *)objc_getProperty(self, a2, 64LL, 1);
}

- (unsigned)maxFileSize
{
  return self->_maxFileSize;
}

- (unsigned)maxTotalBytes
{
  return self->_maxTotalBytes;
}

- (unsigned)timestampFrequency
{
  return self->_timestampFrequency;
}

- (BOOL)captureHIDEvents
{
  return self->_captureHIDEvents;
}

- (NSMutableArray)filesByCreationDate
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setFilesByCreationDate:(id)a3
{
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 80LL, 1);
}

- (NSMutableData)eventData
{
  return (NSMutableData *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setEventData:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)timestampTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setTimestampTimer:(id)a3
{
}

- (OS_dispatch_source)keyboardTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setKeyboardTimer:(id)a3
{
}

- (BOOL)passcodeVisible
{
  return self->_passcodeVisible;
}

- (void)setPasscodeVisible:(BOOL)a3
{
  self->_passcodeVisible = a3;
}

- (BOOL)keyboardVisible
{
  return self->_keyboardVisible;
}

- (void)setKeyboardVisible:(BOOL)a3
{
  self->_keyboardVisible = a3;
}

- (int)passcodeShowToken
{
  return self->_passcodeShowToken;
}

- (void)setPasscodeShowToken:(int)a3
{
  self->_passcodeShowToken = a3;
}

- (int)passcodeHideToken
{
  return self->_passcodeHideToken;
}

- (void)setPasscodeHideToken:(int)a3
{
  self->_passcodeHideToken = a3;
}

- (int)keyboardShowToken
{
  return self->_keyboardShowToken;
}

- (void)setKeyboardShowToken:(int)a3
{
  self->_keyboardShowToken = a3;
}

- (int)keyboardHideToken
{
  return self->_keyboardHideToken;
}

- (void)setKeyboardHideToken:(int)a3
{
  self->_keyboardHideToken = a3;
}

- (int)forceFlushToken
{
  return self->_forceFlushToken;
}

- (void)setForceFlushToken:(int)a3
{
  self->_forceFlushToken = a3;
}

- (int)enableToken
{
  return self->_enableToken;
}

- (void)setEnableToken:(int)a3
{
  self->_enableToken = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSFileHandle)currentRecording
{
  return (NSFileHandle *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setCurrentRecording:(id)a3
{
}

- (void).cxx_destruct
{
}

void __44__HIDContinuousRecorder_xpcRecordingUpdater__block_invoke_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __46__HIDContinuousRecorder_xpcPreferenceProvider__block_invoke_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __59__HIDContinuousRecorder_createRecordingDirectoryWithRetry___block_invoke_cold_1()
{
}

void __59__HIDContinuousRecorder_createRecordingDirectoryWithRetry___block_invoke_42_cold_1()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 directoryURL]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 path]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_0, v3, v4, "Could not create directory %@ due to error %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5();
}

void __57__HIDContinuousRecorder_getfilesByCreationDateWithRetry___block_invoke_45_cold_1()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 service]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_0, v2, v3, "Could not get recordings for service %@ due to error %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

void __63__HIDContinuousRecorder_fileExistsAtURL_isDirectory_withRetry___block_invoke_49_cold_1(uint64_t a1)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) path]);
  OUTLINED_FUNCTION_1(&dword_0, v1, v2, "%s %@ does not exist.", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_5();
}

void __51__HIDContinuousRecorder_deleteItemAtURL_withRetry___block_invoke_55_cold_1(uint64_t a1)
{
  id v1 = [(id)OUTLINED_FUNCTION_14(a1) path];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_9(&dword_0, v3, v4, "Deleted %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __51__HIDContinuousRecorder_deleteItemAtURL_withRetry___block_invoke_55_cold_2()
{
  id v1 = [(id)OUTLINED_FUNCTION_14(v0) path];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_0, v3, v4, "Could not remove %@ due to error %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5();
}

void __51__HIDContinuousRecorder_createFileAtURL_WithRetry___block_invoke_73_cold_1()
{
  id v1 = [(id)OUTLINED_FUNCTION_14(v0) path];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_0, v3, v4, "Could not create file %@ due to error %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5();
}

void __51__HIDContinuousRecorder_createFileAtURL_WithRetry___block_invoke_73_cold_2(id *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 path]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_9(&dword_0, v2, v3, "Created %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

void __59__HIDContinuousRecorder_closeFileWithFileHandle_WithRetry___block_invoke_75_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "closed file handle", v1, 2u);
  OUTLINED_FUNCTION_10();
}

void __59__HIDContinuousRecorder_closeFileWithFileHandle_WithRetry___block_invoke_75_cold_2()
{
}

- (void)appendLabPepperEntryWithDataSource:(void *)a1 andPayload:(uint64_t)a2 toData:(os_log_s *)a3 .cold.1( void *a1,  uint64_t a2,  os_log_s *a3)
{
  __int16 v7 = 1024;
  int v8 = v5;
  __int16 v9 = 2112;
  id v10 = a1;
  _os_log_error_impl( &dword_0,  a3,  OS_LOG_TYPE_ERROR,  "Invalid payload length %lu for type ID %u and payload %@",  v6,  0x1Cu);
}

- (void)appendBootSessionUUIDToData:.cold.1()
{
  uint64_t v0 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(v0);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_0, v1, v2, "Failed to get boot session UUID: error %u %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_7();
}

- (void)appendBootSessionUUIDToData:.cold.2()
{
}

- (void)appendOSVersionToData:.cold.1()
{
  uint64_t v0 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(v0);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_0, v1, v2, "Failed to get OS version: error %u %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_7();
}

- (void)appendHWModelToData:.cold.1()
{
  uint64_t v0 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(v0);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_0, v1, v2, "Failed to get HW model: error %u %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_7();
}

void __30__HIDContinuousRecorder_start__block_invoke_5_cold_1(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "Failed to send force flush finished notification: ret=0x%08X",  (uint8_t *)v2,  8u);
  OUTLINED_FUNCTION_10();
}

void __59__HIDContinuousRecorder_appendData_toFileHandle_withRetry___block_invoke_94_cold_1()
{
  id v1 = [(id)OUTLINED_FUNCTION_14(v0) filesByCreationDate];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 lastObject]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_0, v5, v6, "Could not append to recording %@ due to error %@", v7, v8, v9, v10, v11);
}

void __37__HIDContinuousRecorder_recordEvent___block_invoke_cold_1()
{
}

@end