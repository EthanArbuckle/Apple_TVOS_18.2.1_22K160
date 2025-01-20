@interface AAFAnalyticsEventSecurity
+ (BOOL)isAAAFoundationAvailable;
+ (BOOL)isAuthKitAvailable;
+ (id)fetchDeviceSessionIDFromAuthKit:(id)a3;
- (AAFAnalyticsEvent)event;
- (AAFAnalyticsEventSecurity)initWithCKKSMetrics:(id)a3 altDSID:(id)a4 eventName:(id)a5 testsAreEnabled:(BOOL)a6 category:(id)a7 sendMetric:(BOOL)a8;
- (AAFAnalyticsEventSecurity)initWithKeychainCircleMetrics:(id)a3 altDSID:(id)a4 eventName:(id)a5 category:(id)a6;
- (AAFAnalyticsEventSecurity)initWithKeychainCircleMetrics:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 eventName:(id)a7 testsAreEnabled:(BOOL)a8 canSendMetrics:(BOOL)a9 category:(id)a10;
- (BOOL)areTestsEnabled;
- (BOOL)canSendMetrics;
- (BOOL)isAAAFoundationAvailable;
- (BOOL)isAuthKitAvailable;
- (BOOL)permittedToSendMetrics;
- (OS_dispatch_queue)queue;
- (void)addMetrics:(id)a3;
- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3;
- (void)setAreTestsEnabled:(BOOL)a3;
- (void)setCanSendMetrics:(BOOL)a3;
- (void)setEvent:(id)a3;
- (void)setIsAAAFoundationAvailable:(BOOL)a3;
- (void)setIsAuthKitAvailable:(BOOL)a3;
- (void)setQueue:(id)a3;
@end

@implementation AAFAnalyticsEventSecurity

- (BOOL)permittedToSendMetrics
{
  return -[AAFAnalyticsEventSecurity isAAAFoundationAvailable](self, "isAAAFoundationAvailable")
      && -[AAFAnalyticsEventSecurity isAuthKitAvailable](self, "isAuthKitAvailable")
      && !-[AAFAnalyticsEventSecurity areTestsEnabled](self, "areTestsEnabled")
      && -[AAFAnalyticsEventSecurity canSendMetrics](self, "canSendMetrics");
}

- (AAFAnalyticsEventSecurity)initWithKeychainCircleMetrics:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 eventName:(id)a7 testsAreEnabled:(BOOL)a8 canSendMetrics:(BOOL)a9 category:(id)a10
{
  BOOL v10 = a8;
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v16 = a3;
  id v38 = a4;
  id v41 = a5;
  id v17 = a6;
  id v39 = a7;
  id v40 = a10;
  if (+[AAFAnalyticsEventSecurity isAAAFoundationAvailable]( &OBJC_CLASS___AAFAnalyticsEventSecurity,  "isAAAFoundationAvailable")
    && +[AAFAnalyticsEventSecurity isAuthKitAvailable](&OBJC_CLASS___AAFAnalyticsEventSecurity, "isAuthKitAvailable")
    && a9
    && !v10)
  {
    v46.receiver = self;
    v46.super_class = (Class)&OBJC_CLASS___AAFAnalyticsEventSecurity;
    v18 = -[AAFAnalyticsEventSecurity init](&v46, sel_init);
    if (v18)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v19 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
      dispatch_queue_t v20 = dispatch_queue_create("com.apple.security.aafanalyticsevent.queue", v19);
      queue = v18->_queue;
      v18->_queue = (OS_dispatch_queue *)v20;

      v18->_areTestsEnabled = 0;
      v18->_canSendMetrics = a9;
      *(_WORD *)&v18->_isAAAFoundationAvailable = 257;
      uint64_t v53 = 0LL;
      v54 = &v53;
      uint64_t v55 = 0x2050000000LL;
      v22 = (void *)getAAFAnalyticsEventClass_softClass;
      uint64_t v56 = getAAFAnalyticsEventClass_softClass;
      if (!getAAFAnalyticsEventClass_softClass)
      {
        uint64_t v48 = MEMORY[0x1895F87A8];
        uint64_t v49 = 3221225472LL;
        uint64_t v50 = (uint64_t)__getAAFAnalyticsEventClass_block_invoke;
        v51 = &unk_18A135408;
        v52 = &v53;
        __getAAFAnalyticsEventClass_block_invoke((uint64_t)&v48);
        v22 = (void *)v54[3];
      }

      v23 = v22;
      _Block_object_dispose(&v53, 8);
      v24 = (void *)[[v23 alloc] initWithEventName:v39 eventCategory:v40 initData:0];
      if (v41 && ([v41 isEqualToString:&stru_18A137758] & 1) == 0)
      {
        uint64_t v48 = 0LL;
        uint64_t v49 = (uint64_t)&v48;
        uint64_t v50 = 0x2020000000LL;
        v25 = (void *)getkAAFFlowIdSymbolLoc_ptr;
        v51 = (void *)getkAAFFlowIdSymbolLoc_ptr;
        if (!getkAAFFlowIdSymbolLoc_ptr)
        {
          v26 = (void *)AAAFoundationLibrary_1106();
          v25 = dlsym(v26, "kAAFFlowId");
          *(void *)(v49 + 24) = v25;
          getkAAFFlowIdSymbolLoc_ptr = (uint64_t)v25;
        }

        _Block_object_dispose(&v48, 8);
        if (!v25)
        {
          dlerror();
          abort_report_np();
          __break(1u);
        }

        [v24 setObject:v41 forKeyedSubscript:*v25];
      }

      if (v17 && ([v17 isEqualToString:&stru_18A137758] & 1) == 0)
      {
        getkAAFDeviceSessionId();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 setObject:v17 forKeyedSubscript:v27];
      }

      else
      {
        v27 = +[AAFAnalyticsEventSecurity fetchDeviceSessionIDFromAuthKit:]( &OBJC_CLASS___AAFAnalyticsEventSecurity,  "fetchDeviceSessionIDFromAuthKit:",  v38);
        getkAAFDeviceSessionId();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 setObject:v27 forKeyedSubscript:v28];
      }

      if (v16)
      {
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        [v16 allKeys];
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v57 count:16];
        if (v30)
        {
          uint64_t v31 = *(void *)v43;
          do
          {
            for (uint64_t i = 0LL; i != v30; ++i)
            {
              if (*(void *)v43 != v31) {
                objc_enumerationMutation(v29);
              }
              uint64_t v33 = *(void *)(*((void *)&v42 + 1) + 8 * i);
              [v16 objectForKeyedSubscript:v33];
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              [v24 setObject:v34 forKeyedSubscript:v33];
            }

            uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v57 count:16];
          }

          while (v30);
        }
      }

      event = v18->_event;
      v18->_event = (AAFAnalyticsEvent *)v24;
    }
  }

  else
  {
    v47.receiver = self;
    v47.super_class = (Class)&OBJC_CLASS___AAFAnalyticsEventSecurity;
    v18 = -[AAFAnalyticsEventSecurity init](&v47, sel_init);
    if (v18)
    {
      v18->_isAAAFoundationAvailable = +[AAFAnalyticsEventSecurity isAAAFoundationAvailable]( &OBJC_CLASS___AAFAnalyticsEventSecurity,  "isAAAFoundationAvailable");
      v18->_isAuthKitAvailable = +[AAFAnalyticsEventSecurity isAuthKitAvailable]( &OBJC_CLASS___AAFAnalyticsEventSecurity,  "isAuthKitAvailable");
      v18->_areTestsEnabled = v10;
      v18->_canSendMetrics = a9;
    }
  }

  v36 = v18;

  return v36;
}

- (AAFAnalyticsEventSecurity)initWithCKKSMetrics:(id)a3 altDSID:(id)a4 eventName:(id)a5 testsAreEnabled:(BOOL)a6 category:(id)a7 sendMetric:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( self,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  a3,  a4,  0LL,  0LL,  a5,  a6,  v9,  a7);
}

- (AAFAnalyticsEventSecurity)initWithKeychainCircleMetrics:(id)a3 altDSID:(id)a4 eventName:(id)a5 category:(id)a6
{
  LOBYTE(v7) = 1;
  return -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( self,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  a3,  a4,  0LL,  0LL,  a5,  0LL,  v7,  a6);
}

- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3
{
  id v5 = a3;
  if (-[AAFAnalyticsEventSecurity permittedToSendMetrics](self, "permittedToSendMetrics"))
  {
    -[AAFAnalyticsEventSecurity queue](self, "queue");
    v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __75__AAFAnalyticsEventSecurity_populateUnderlyingErrorsStartingWithRootError___block_invoke;
    block[3] = &unk_18A1353B0;
    block[4] = self;
    id v7 = v5;
    dispatch_sync(v4, block);
  }
}

- (void)addMetrics:(id)a3
{
  id v4 = a3;
  if (-[AAFAnalyticsEventSecurity permittedToSendMetrics](self, "permittedToSendMetrics"))
  {
    -[AAFAnalyticsEventSecurity queue](self, "queue");
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __40__AAFAnalyticsEventSecurity_addMetrics___block_invoke;
    v6[3] = &unk_18A1353B0;
    id v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);
  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (AAFAnalyticsEvent)event
{
  return (AAFAnalyticsEvent *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setEvent:(id)a3
{
}

- (BOOL)areTestsEnabled
{
  return self->_areTestsEnabled;
}

- (void)setAreTestsEnabled:(BOOL)a3
{
  self->_areTestsEnabled = a3;
}

- (BOOL)canSendMetrics
{
  return self->_canSendMetrics;
}

- (void)setCanSendMetrics:(BOOL)a3
{
  self->_canSendMetrics = a3;
}

- (BOOL)isAAAFoundationAvailable
{
  return self->_isAAAFoundationAvailable;
}

- (void)setIsAAAFoundationAvailable:(BOOL)a3
{
  self->_isAAAFoundationAvailable = a3;
}

- (BOOL)isAuthKitAvailable
{
  return self->_isAuthKitAvailable;
}

- (void)setIsAuthKitAvailable:(BOOL)a3
{
  self->_isAuthKitAvailable = a3;
}

- (void).cxx_destruct
{
}

void __40__AAFAnalyticsEventSecurity_addMetrics___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 40) event];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 setObject:v8 forKeyedSubscript:v7];
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }
}

void __75__AAFAnalyticsEventSecurity_populateUnderlyingErrorsStartingWithRootError___block_invoke( uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 populateUnderlyingErrorsStartingWithRootError:*(void *)(a1 + 40)];
}

+ (BOOL)isAAAFoundationAvailable
{
  if (isAAAFoundationAvailable_onceToken != -1) {
    dispatch_once(&isAAAFoundationAvailable_onceToken, &__block_literal_global_1122);
  }
  return isAAAFoundationAvailable_available;
}

+ (BOOL)isAuthKitAvailable
{
  if (isAuthKitAvailable_onceToken != -1) {
    dispatch_once(&isAuthKitAvailable_onceToken, &__block_literal_global_17);
  }
  return isAuthKitAvailable_available;
}

+ (id)fetchDeviceSessionIDFromAuthKit:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2050000000LL;
  uint64_t v4 = (void *)getAKAccountManagerClass_softClass;
  uint64_t v17 = getAKAccountManagerClass_softClass;
  if (!getAKAccountManagerClass_softClass)
  {
    *(void *)&__int128 buf = MEMORY[0x1895F87A8];
    *((void *)&buf + 1) = 3221225472LL;
    v19 = __getAKAccountManagerClass_block_invoke;
    dispatch_queue_t v20 = &unk_18A135408;
    v21 = &v14;
    __getAKAccountManagerClass_block_invoke((uint64_t)&buf);
    uint64_t v4 = (void *)v15[3];
  }

  id v5 = v4;
  _Block_object_dispose(&v14, 8);
  [v5 sharedInstance];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = v6;
  if (v3)
  {
    id v13 = 0LL;
    [v6 authKitAccountWithAltDSID:v3 error:&v13];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v13;
    if (v9)
    {
      secLogObjForScope("SecError");
      __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_impl( &dword_187D59000,  v10,  OS_LOG_TYPE_DEFAULT,  "authKitAccountWithAltDSID returned error: %@",  (uint8_t *)&buf,  0xCu);
      }
    }
  }

  else
  {
    [v6 primaryAuthKitAccount];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if ([v7 accountAccessTelemetryOptInForAccount:v8])
  {
    [v7 telemetryDeviceSessionIDForAccount:v8];
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    __int128 v11 = 0LL;
  }

  return v11;
}

void __47__AAFAnalyticsEventSecurity_isAuthKitAvailable__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    __int128 v1 = xmmword_18A1353E8;
    uint64_t v2 = 0LL;
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }

  if (AuthKitLibraryCore_frameworkLibrary)
  {
    isAuthKitAvailable_available = 1;
  }

  else
  {
    secLogObjForScope("SecError");
    v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v1) = 0;
      _os_log_impl( &dword_187D59000,  v0,  OS_LOG_TYPE_DEFAULT,  "aafanalyticsevent-security: failed to softlink AuthKit",  (uint8_t *)&v1,  2u);
    }
  }

void __53__AAFAnalyticsEventSecurity_isAAAFoundationAvailable__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  if (!AAAFoundationLibraryCore_frameworkLibrary_1109)
  {
    __int128 v1 = xmmword_18A1353D0;
    uint64_t v2 = 0LL;
    AAAFoundationLibraryCore_frameworkLibrary_1109 = _sl_dlopen();
  }

  if (AAAFoundationLibraryCore_frameworkLibrary_1109)
  {
    isAAAFoundationAvailable_available = 1;
  }

  else
  {
    secLogObjForScope("SecError");
    v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v1) = 0;
      _os_log_impl( &dword_187D59000,  v0,  OS_LOG_TYPE_DEFAULT,  "aafanalyticsevent-security: failed to softlink AAAFoundation",  (uint8_t *)&v1,  2u);
    }
  }

@end