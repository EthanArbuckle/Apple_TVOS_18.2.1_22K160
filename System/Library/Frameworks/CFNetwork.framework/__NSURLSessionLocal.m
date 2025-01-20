@interface __NSURLSessionLocal
- (_BYTE)taskForClassInfo:(_BYTE *)result;
- (__NSURLSessionLocal)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 delegateDispatchQueue:(id)a6;
- (id).cxx_construct;
- (id)AVAggregateAssetDownloadTaskForURLAsset:(id)a3 mediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7;
- (id)AVAssetDownloadTaskForURLAsset:(id)a3 assetTitle:(id)a4 assetArtworkData:(id)a5 options:(id)a6 downloadConfiguration:(id)a7;
- (id)AVAssetDownloadTaskForURLAsset:(id)a3 destinationURL:(id)a4 options:(id)a5;
- (id)_AVAssetDownloadTaskForURL:(id)a3 destinationURL:(id)a4 options:(id)a5;
- (id)_createCanonicalRequestForTask:(id)result;
- (id)_dataTaskWithTaskForClass:(id)a3;
- (id)_downloadTaskWithTaskForClass:(id)a3;
- (id)_protocolClassesForTask:(uint64_t)a1;
- (id)_uploadTaskWithTaskForClass:(id)a3;
- (id)_withXURLCache:(id *)result;
- (id)copyWithZone:(_NSZone *)a3;
- (id)replaceTask:(void *)a3 withTask:;
- (id)webSocketTaskForRequest:(id)a3;
- (id)webSocketTaskForURL:(id)a3 protocols:(id)a4;
- (uint64_t)_cfurlRequest:(CFTypeRef)cf2 isCacheEquivalentTo:;
- (uint64_t)_createXCookieStorage;
- (uint64_t)_createXCredentialStorage;
- (uint64_t)_getCookieHeadersForTask:(uint64_t)a3 completionHandler:;
- (uint64_t)_newURLProtocolForTask:(uint64_t)a1 client:(uint64_t)a2 protocolClass:(void *)a3;
- (uint64_t)_onqueue_configureAndCreateConnection:(void *)a3 task:;
- (uint64_t)_request:(uint64_t)a3 isCacheEquivalentTo:;
- (uint64_t)_withConnectionCache_setCurrentSSLMethod:(uint64_t)a3 forKey:(const void *)a4 scheduling:;
- (unint64_t)nextSeed;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)_flushOrResetStorage:(uint64_t)a3 reset:;
- (void)_onqueue_canonicalizeTaskAndCreateConnection:(uint64_t)a1;
- (void)_onqueue_checkForCompletion;
- (void)_onqueue_completeInvalidation:(BOOL)a3;
- (void)_onqueue_connectUploadTask:(void *)a3 strippedRequest:(uint64_t)a4 bodyStream:(const __CFArray *)a5 bodyParts:;
- (void)_onqueue_flushWithCompletionHandler:(id)a3;
- (void)_onqueue_getTasksWithCompletionHandler:(id)a3;
- (void)_onqueue_handleConnectionsAtAPSleep;
- (void)_onqueue_markConnectionsReusedAfterAPSleepWake;
- (void)_onqueue_resetStorageWithCompletionHandler:(id)a3;
- (void)_protocolClassForRequest:(uint64_t)a1;
- (void)_protocolClassForTask:(uint64_t)a1 skipAppSSO:(void *)a2;
- (void)_useTLSSessionCacheFromSession:(id)a3;
- (void)addConnectionlessTask:(uint64_t)a1;
- (void)addUnresumedTask:(uint64_t)a1;
- (void)dealloc;
- (void)removeConnectionlessTask:(uint64_t)a1;
- (void)removeUnresumedTask:(uint64_t)a1;
- (void)task:(uint64_t)a1 terminatedConnection:(uint64_t)a2;
@end

@implementation __NSURLSessionLocal

- (id)_dataTaskWithTaskForClass:(id)a3
{
  v5 = (void *)objc_opt_class();
  if (a3)
  {
    objc_setProperty_atomic(a3, v6, v5, 8LL);
    v7 = self;
    id v8 = a3;
  }

  else
  {
    v7 = self;
    id v8 = 0LL;
  }

  return -[__NSURLSessionLocal taskForClassInfo:](v7, v8);
}

- (_BYTE)taskForClassInfo:(_BYTE *)result
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v7 = (uint64_t)result;
  if (result[360])
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v7 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18298D000,  (os_log_t)v7,  OS_LOG_TYPE_ERROR,  "Attempted to create a task in a session that has been invalidated",  buf,  2u);
    }

    id v8 = (NSString *)dyld_program_sdk_at_least();
    if (!(_DWORD)v8) {
      return 0LL;
    }
    __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v8);
    goto LABEL_52;
  }

  id v2 = self;
  if (self && objc_getProperty(self, (SEL)self, 16LL, 1))
  {
    id v10 = objc_alloc((Class)objc_getProperty(v2, v9, 8LL, 1));
    id Property = objc_getProperty(v2, v11, 16LL, 1);
    uint64_t v13 = [(id)v7 nextSeed];
    uint64_t v3 = objc_msgSend( v10,  "initWithOriginalRequest:ident:taskGroup:",  Property,  v13,  objc_getProperty(v2, v14, 88, 1));
    os_unfair_lock_lock((os_unfair_lock_t)(v7 + 400));
    [*(id *)(v7 + 184) addObject:v3];
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 400));
    if (objc_getProperty(v2, v15, 24LL, 1)) {
      objc_msgSend((id)v3, "set_uniqueIdentifier:", objc_getProperty(v2, v16, 24, 1));
    }
    if ([*(id *)(v7 + 112) _disableAPWakeOnIdleConnections])
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v7 + 48));
      int v18 = *(_BYTE *)(v7 + 69) & 1;
      *(_BYTE *)(v7 + 69) = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 48));
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      v19 = (os_log_s *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v48 = v18;
        _os_log_impl(&dword_18298D000, v19, OS_LOG_TYPE_DEFAULT, "consumeSystemPowerNotification returns %d", buf, 8u);
      }

      if (v18)
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        v20 = (os_log_s *)CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_18298D000,  v20,  OS_LOG_TYPE_DEFAULT,  "Cleaning up session connections due to _disableAPWakeOnIdleConnections set",  buf,  2u);
        }

        v21 = *(CFDictionaryRef **)(v7 + 168);
        if (v21) {
          XTubeManager::invalidateAllConnections(v21, 0);
        }
      }
    }

    id v22 = objc_getProperty(v2, v17, 48LL, 1);
    uint64_t v4 = MEMORY[0x1895F87A8];
    v5 = &unk_182C9D000;
    if (v22)
    {
      id v24 = objc_getProperty(v2, v23, 48LL, 1);
      newValue[0] = v4;
      newValue[1] = 3221225472LL;
      newValue[2] = __40____NSURLSessionLocal_taskForClassInfo___block_invoke;
      newValue[3] = &unk_189C019E8;
      newValue[4] = v7;
      newValue[5] = _Block_copy(v24);
      if (v3)
      {
        objc_setProperty_atomic_copy((id)v3, v23, newValue, 784LL);
        *(_BYTE *)(v3 + 69) = 0;
      }
    }

    if (objc_getProperty(v2, v23, 40LL, 1))
    {
      v26 = (void *)MEMORY[0x189603F18];
      id v27 = objc_getProperty(v2, v25, 40LL, 1);
      v28 = v26;
      goto LABEL_30;
    }
  }

  else
  {
    __URLSESSION_CLIENT_API_MISUSE_NIL_ARGUMENT__(@"Cannot create task from nil request");
  }

  if (objc_getProperty(v2, v25, 32LL, 1))
  {
    v31 = (dispatch_data_s *)objc_msgSend( MEMORY[0x189603F18],  "arrayWithObject:",  objc_msgSend( NSString,  "stringWithUTF8String:",  objc_msgSend(objc_getProperty(v2, v32, 32, 1), "fileSystemRepresentation")));
    id v34 = objc_getProperty(v2, v33, 32LL, 1);
    if (v3) {
      objc_setProperty_atomic((id)v3, v30, v34, 768LL);
    }
    goto LABEL_37;
  }

  uint64_t v41 = objc_msgSend(objc_getProperty(v2, v32, 16, 1), "HTTPBodyStream");
  if (!v41)
  {
    v31 = (dispatch_data_s *)objc_msgSend(objc_getProperty(v2, v30, 16, 1), "HTTPBody");
    if (!v31) {
      goto LABEL_37;
    }
    objc_getClass("OS_dispatch_data");
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = (void *)[MEMORY[0x189603FA8] array];
      applier[0] = v4;
      applier[1] = v5[132];
      applier[2] = __40____NSURLSessionLocal_taskForClassInfo___block_invoke_2;
      applier[3] = &unk_189C01A10;
      applier[4] = v42;
      dispatch_data_apply(v31, applier);
      v29 = (dispatch_data_s *)(id)[v42 copy];
      goto LABEL_31;
    }

    v28 = (void *)MEMORY[0x189603F18];
    id v27 = v31;
LABEL_30:
    v29 = (dispatch_data_s *)[v28 arrayWithObject:v27];
LABEL_31:
    v31 = v29;
LABEL_37:
    uint64_t v35 = 0LL;
    goto LABEL_38;
  }

  uint64_t v35 = v41;
  v31 = 0LL;
LABEL_38:
  id v36 = objc_getProperty(v2, v30, 32LL, 1);
  v44[0] = v4;
  uint64_t v6 = v5[132];
  v44[1] = v6;
  v44[2] = __40____NSURLSessionLocal_taskForClassInfo___block_invoke_3;
  v44[3] = &unk_189C01A38;
  v44[4] = v36;
  v44[5] = v7;
  v44[6] = v35;
  v44[7] = v31;
  if (v3)
  {
    objc_setProperty_atomic_copy((id)v3, v37, v44, 808LL);
    objc_msgSend((id)v3, "setDelegate:", objc_getProperty(v2, v38, 80, 1));
    uint64_t v39 = *(void *)(v3 + 704);
    if (!v39) {
      uint64_t v39 = *(void *)(v3 + 696);
    }
    goto LABEL_41;
  }

- (unint64_t)nextSeed
{
  unint64_t v3 = *((void *)self + 20);
  *((void *)self + 20) = v3 + 1;
  objc_sync_exit(self);
  return v3;
}

- (void)_onqueue_connectUploadTask:(void *)a3 strippedRequest:(uint64_t)a4 bodyStream:(const __CFArray *)a5 bodyParts:
{
  if (!a1) {
    return;
  }
  uint64_t v10 = [a2 resumableUploadState];
  if (v10 && *(_DWORD *)(v10 + 16) == 2) {
    a4 = objc_msgSend(MEMORY[0x189603F80], "inputStreamWithData:", objc_msgSend(MEMORY[0x189603F48], "data"));
  }
  if ((unint64_t)a5 | a4)
  {
    if (a4)
    {
      uint64_t v12 = [a2 resumableUploadState];
      if (v12) {
        *(_DWORD *)(v12 + 16) = 2;
      }
      CFURLRequestSetHTTPRequestBodyStream(a3, (CFTypeRef)a4);
    }

    else if (a5 && FormContentLengthWithArray(a5) >= 1)
    {
      URLRequest::_setHTTPBodyParts((URLRequest *)[a3 _inner], a5, 0);
    }

    goto LABEL_16;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_16:
    id v13 = -[NSURLRequest _initWithCFURLRequest:](objc_alloc(&OBJC_CLASS___NSURLRequest), "_initWithCFURLRequest:", a3);
    [a2 updateCurrentRequest:v13];

    -[__NSURLSessionLocal _onqueue_canonicalizeTaskAndCreateConnection:](a1, a2);
    return;
  }

  if (a2)
  {
    uint64_t v11 = a2[88];
    if (!v11) {
      uint64_t v11 = a2[87];
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __87____NSURLSessionLocal__onqueue_connectUploadTask_strippedRequest_bodyStream_bodyParts___block_invoke;
  v14[3] = &unk_189C01998;
  v14[4] = a2;
  v14[5] = a1;
  v14[6] = a3;
  -[__NSCFURLSessionDelegateWrapper task:needNewBodyStream:](v11, a2, v14);
}

- (void)_onqueue_canonicalizeTaskAndCreateConnection:(uint64_t)a1
{
  if (a1)
  {
    id v4 = -[__NSURLSessionLocal _createCanonicalRequestForTask:]((id)[a2 session], a2);
    v5 = (void *)objc_msgSend((id)objc_msgSend(a2, "currentRequest"), "URL");
    if (objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v4, "URL"), "scheme"),  "isEqualToString:",  @"https")
      && (objc_msgSend((id)objc_msgSend(v5, "scheme"), "isEqualToString:", @"http") & 1) != 0)
    {
      if (a2)
      {
        uint64_t v6 = a2[88];
        if (!v6) {
          uint64_t v6 = a2[87];
        }
      }

      else
      {
        uint64_t v6 = 0LL;
      }

      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __68____NSURLSessionLocal__onqueue_canonicalizeTaskAndCreateConnection___block_invoke;
      v7[3] = &unk_189C019C0;
      v7[4] = a1;
      v7[5] = a2;
      -[__NSCFURLSessionDelegateWrapper task:_schemeUpgraded:completionHandler:](v6, a2, v4, v7);
    }

    else
    {
      -[__NSURLSessionLocal _onqueue_configureAndCreateConnection:task:](a1, (uint64_t)v4, a2);
    }
  }

- (id)_createCanonicalRequestForTask:(id)result
{
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    objc_msgSend(a2, "set_protocolForTask:", 0);
    id v6 = (id)[a2 currentRequest];
    id v4 = -[__NSURLSessionLocal _protocolClassForTask:skipAppSSO:](v3, a2);
    if (v4)
    {
      v5 = v4;
      id v6 = (id)[v4 canonicalRequestForRequest:v6 task:a2];
      objc_msgSend(a2, "set_protocolForTask:", v5);
    }

    return v6;
  }

  return result;
}

- (void)_protocolClassForTask:(uint64_t)a1 skipAppSSO:(void *)a2
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v3 = -[__NSURLSessionLocal _protocolClassesForTask:](a1, a2);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend(v8, "isSubclassOfClass:", objc_opt_class(), (void)v10) & 1) == 0)
          {
            if (objc_msgSend(v8, "canInitWithRequest:", objc_msgSend(a2, "currentRequest"))) {
              return v8;
            }
          }

          else if (objc_msgSend(v8, "canInitWithTask:", a2, (void)v10))
          {
            return v8;
          }

          ++v7;
        }

        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }

      while (v5);
    }
  }

  return 0LL;
}

- (id)_protocolClassesForTask:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 68) & 1) != 0)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
      if (_localProtocolClassesForDefaultSession)
      {
        id v4 = (id)objc_msgSend( (id)_localProtocolClassesForDefaultSession,  "arrayByAddingObjectsFromArray:",  +[NSURLSessionConfiguration _defaultProtocolClasses]( NSURLSessionConfiguration,  "_defaultProtocolClasses"));
        os_unfair_lock_unlock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
        return v4;
      }

      os_unfair_lock_unlock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
    }

    if (!a2)
    {
      uint64_t v5 = *(void **)(a1 + 112);
      goto LABEL_9;
    }
  }

  else if (!a2)
  {
    uint64_t v5 = 0LL;
    goto LABEL_9;
  }

  uint64_t v5 = (void *)[a2 _effectiveConfiguration];
LABEL_9:
  uint64_t v6 = (void *)[v5 protocolClasses];
  id v4 = +[NSURLSessionConfiguration _defaultProtocolClasses]( &OBJC_CLASS___NSURLSessionConfiguration,  "_defaultProtocolClasses");
  if (v6 && ([v6 isEqualToArray:v4] & 1) == 0)
  {
    uint64_t v7 = (void *)[MEMORY[0x189603FA8] arrayWithArray:v6];
    id v8 = (void *)[MEMORY[0x189603FE0] setWithArray:v7];
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v9 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v4);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (([v8 containsObject:v12] & 1) == 0)
          {
            [v8 addObject:v12];
            [v7 addObject:v12];
          }
        }

        uint64_t v9 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v9);
    }

    return v7;
  }

  return v4;
}

- (uint64_t)_onqueue_configureAndCreateConnection:(void *)a3 task:
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = objc_opt_class();
    [a3 updateCurrentRequest:a2];
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __66____NSURLSessionLocal__onqueue_configureAndCreateConnection_task___block_invoke;
    v7[3] = &unk_189C1A610;
    v7[4] = v5;
    v7[5] = a3;
    void v7[6] = v6;
    return objc_msgSend(a3, "_onqueue_setupNextEffectiveConfigurationWithCompletionHandler:", v7);
  }

  return result;
}

- (uint64_t)_newURLProtocolForTask:(uint64_t)a1 client:(uint64_t)a2 protocolClass:(void *)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v6 = objc_msgSend(a3, "_cf_internalImpl");
    uint64_t v7 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(v6 + 64))(*MEMORY[0x189604DB0], a1, a2, v6);
    if (v7)
    {
      uint64_t v8 = v7;
      return v8 + 16;
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    uint64_t Instance = _CFRuntimeCreateInstance();
    uint64_t v9 = Instance;
    if (Instance)
    {
      *(_OWORD *)(Instance + 16) = 0u;
      uint64_t v9 = Instance + 16;
      *(void *)(Instance + 160) = 0LL;
      *(_OWORD *)(Instance + 128) = 0u;
      *(_OWORD *)(Instance + 144) = 0u;
      *(_OWORD *)(Instance + 96) = 0u;
      *(_OWORD *)(Instance + 112) = 0u;
      *(_OWORD *)(Instance + 64) = 0u;
      *(_OWORD *)(Instance + 80) = 0u;
      *(_OWORD *)(Instance + 32) = 0u;
      *(_OWORD *)(Instance + 48) = 0u;
    }

    *(void *)uint64_t v9 = &off_189C01C50;
    *(void *)(v9 + 8) = &unk_189C01D58;
    *(void *)(v9 + 16) = &unk_189C01D78;
    *(_DWORD *)(v9 + 140) = 0;
    *(void *)(v9 + 112) = a3;
    *(void *)(v9 + 144) = _copyPrivateProtocolSchedulingSet();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v9 + 56LL))(v9, a1, a2);
  }

  return v9;
}

- (id).cxx_construct
{
  *((void *)self + 29) = 850045863LL;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((void *)self + 36) = 0LL;
  *((void *)self + 37) = 850045863LL;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((_OWORD *)self + 21) = 0u;
  *((void *)self + 44) = 0LL;
  return self;
}

- (__NSURLSessionLocal)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 delegateDispatchQueue:(id)a6
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS_____NSURLSessionLocal;
  uint64_t v7 = -[NSURLSession initWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]( &v25,  sel_initWithConfiguration_delegate_delegateQueue_delegateDispatchQueue_,  a3,  a4,  a5,  a6);
  uint64_t v8 = v7;
  if (v7)
  {
    *((void *)v7 + 20) = 1LL;
    *((void *)v7 + 22) = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:0];
    if (a3)
    {
      [a3 getConnectionCacheLimits];
    }

    else
    {
      uint64_t v24 = 0LL;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
    }

    uint64_t v9 = (void *)[MEMORY[0x189603FC8] dictionary];
    objc_setProperty_atomic(v8, v10, v9, 152LL);
    __int128 v11 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t v12 = MEMORY[0x186E12804](*MEMORY[0x189604DB0], 160LL, 0LL);
    uint64_t v13 = v12;
    *(_OWORD *)uint64_t v12 = 0u;
    *(_OWORD *)(v12 + 32) = 0u;
    *(_OWORD *)(v12 + 48) = 0u;
    *(_OWORD *)(v12 + 128) = 0u;
    *(_OWORD *)(v12 + 144) = 0u;
    *(_OWORD *)(v12 + 96) = 0u;
    *(_OWORD *)(v12 + 112) = 0u;
    *(_OWORD *)(v12 + 64) = 0u;
    *(_OWORD *)(v12 + 80) = 0u;
    *(_OWORD *)(v12 + 16) = 0u;
    *(void *)uint64_t v12 = off_189C06BF8;
    *(void *)(v12 + 8) = v11;
    *(_DWORD *)(v12 + 16) = 1;
    if (((v12 + 16) & 3) != 0) {
      __assert_rtn("CFAllocatedReferenceCountedObject", "CFObject.cpp", 25, "(ptrdiff_t(&fRetainCount) & 3) == 0");
    }
    *(void *)uint64_t v12 = off_189C01B48;
    *(void *)(v12 + 24) = off_189C01B90;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( v11,  0LL,  &CFAllocatedReferenceCountedObject::skCFTypeDictionaryKeyCallBacks,  &CFAllocatedReferenceCountedObject::skCFTypeDictionaryValueCallBacks);
    *(void *)(v13 + 144) = 0LL;
    __int128 v15 = (void *)(v13 + 144);
    *(void *)(v13 + 32) = Mutable;
    *(_OWORD *)(v13 + 104) = v22;
    *(_OWORD *)(v13 + 120) = v23;
    *(void *)(v13 + 136) = v24;
    *(void *)(v13 + 152) = 0LL;
    pthread_mutexattr_init(&v26);
    pthread_mutexattr_settype(&v26, 0);
    pthread_mutex_init((pthread_mutex_t *)(v13 + 40), &v26);
    pthread_mutexattr_destroy(&v26);
    *((void *)v8 + 21) = v13;
    uint64_t v16 = *((void *)v8 + 2);
    __int128 v17 = (std::__shared_weak_count *)*((void *)v8 + 3);
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        unint64_t v19 = __ldxr(p_shared_owners);
      while (__stxr(v19 + 1, p_shared_owners));
      std::shared_ptr<__CFString const>::operator=[abi:nn180100](v15, v16, (uint64_t)v17);
      do
        unint64_t v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }

    else
    {
      std::shared_ptr<__CFString const>::operator=[abi:nn180100](v15, v16, 0LL);
    }

    *((_BYTE *)v8 + 224) = 0;
    *((_BYTE *)v8 + 225) = 0;
    *((void *)v8 + 23) = (id)objc_msgSend(MEMORY[0x1896078B8], "weakObjectsHashTable", v22, v23, v24);
    *((_DWORD *)v8 + 100) = 0;
  }

  return v8;
}

- (void)removeUnresumedTask:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 400));
    [*(id *)(a1 + 184) removeObject:a2];
    uint64_t v4 = [*(id *)(a1 + 184) anyObject];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 400));
    if (!v4)
    {
      uint64_t v5 = *(dispatch_queue_s **)(a1 + 120);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __43____NSURLSessionLocal_removeUnresumedTask___block_invoke;
      block[3] = &unk_189C1A548;
      block[4] = a1;
      dispatch_async(v5, block);
    }
  }

- (void)_onqueue_checkForCompletion
{
  if (a1)
  {
    if (*(void *)(a1 + 200))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 400));
      uint64_t v2 = [*(id *)(a1 + 184) anyObject];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 400));
      if (!v2 && ![*(id *)(a1 + 176) count])
      {
        id v3 = *(CFDictionaryRef **)(a1 + 168);
        if (v3) {
          XTubeManager::invalidateAllConnections(v3, 0);
        }
        uint64_t v4 = *(void *)(a1 + 208);
        if (v4)
        {
          (*(void (**)(uint64_t))(*(void *)v4 + 48LL))(v4);
          *(void *)(a1 + 208) = 0LL;
        }

        uint64_t v5 = *(void *)(a1 + 216);
        if (v5)
        {
          (*(void (**)(uint64_t))(*(void *)v5 + 48LL))(v5);
          *(void *)(a1 + 216) = 0LL;
        }

        *(_BYTE *)(a1 + 360) = 1;
        uint64_t v6 = *(void *)(a1 + 200);
        if (v6)
        {
          if (*(void *)(a1 + 192))
          {
            *(void *)(a1 + 200) = 0LL;
            uint64_t v7 = *(dispatch_queue_s **)(a1 + 192);
            *(void *)(a1 + 192) = 0LL;
            block[0] = MEMORY[0x1895F87A8];
            block[1] = 3221225472LL;
            block[2] = __56____NSURLSessionLocal__onqueue_invokeInvalidateCallback__block_invoke;
            block[3] = &unk_189C1A298;
            block[4] = v6;
            dispatch_async(v7, block);
            dispatch_release(v7);
          }
        }
      }
    }
  }

- (void)task:(uint64_t)a1 terminatedConnection:(uint64_t)a2
{
  if (a1)
  {
    [*(id *)(a1 + 176) removeObject:a2];
    id v3 = *(dispatch_queue_s **)(a1 + 120);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __49____NSURLSessionLocal_task_terminatedConnection___block_invoke;
    block[3] = &unk_189C1A548;
    block[4] = a1;
    dispatch_async(v3, block);
  }

- (void)_onqueue_completeInvalidation:(BOOL)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (self)
  {
    if ([*((id *)self + 14) _disableAPWakeOnIdleConnections])
    {
      if (*((_DWORD *)self + 13))
      {
        IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)self + 7), 0LL);
        if (*((_DWORD *)self + 16))
        {
          if (IODeregisterForSystemPower((io_object_t *)self + 16))
          {
            if (CFNLog::onceToken != -1) {
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
            }
            uint64_t v5 = (os_log_s *)CFNLog::logger;
            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl( &dword_18298D000,  v5,  OS_LOG_TYPE_ERROR,  "Failed to IODeregisterForSystemPower",  buf,  2u);
            }
          }

          *((_DWORD *)self + 16) = 0;
        }

        IOServiceClose(*((_DWORD *)self + 13));
        *((_DWORD *)self + 13) = 0;
        uint64_t v6 = (IONotificationPort *)*((void *)self + 7);
        if (v6)
        {
          IONotificationPortDestroy(v6);
          *((void *)self + 7) = 0LL;
        }
      }
    }

    uint64_t v7 = (dispatch_object_s *)*((void *)self + 15);
    aBlock[0] = MEMORY[0x1895F87A8];
    aBlock[1] = 3221225472LL;
    aBlock[2] = __53____NSURLSessionLocal__onqueue_completeInvalidation___block_invoke;
    aBlock[3] = &unk_189C079F8;
    aBlock[4] = self;
    if (*((void *)self + 25))
    {
      __53____NSURLSessionLocal__onqueue_completeInvalidation___block_invoke((uint64_t)aBlock, 0);
    }

    else
    {
      *((void *)self + 25) = _Block_copy(aBlock);
      *((void *)self + 24) = v7;
      if (v7) {
        dispatch_retain(v7);
      }
      if (a3)
      {
        uint64_t v8 = (void *)[*((id *)self + 22) mutableCopy];
        os_unfair_lock_lock((os_unfair_lock_t)self + 100);
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        uint64_t v9 = (void *)*((void *)self + 23);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:buf count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v24;
          do
          {
            for (uint64_t i = 0LL; i != v11; ++i)
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(v9);
              }
              [v8 addObject:*(void *)(*((void *)&v23 + 1) + 8 * i)];
            }

            uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:buf count:16];
          }

          while (v11);
        }

        os_unfair_lock_unlock((os_unfair_lock_t)self + 100);
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        uint64_t v14 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v20;
          do
          {
            for (uint64_t j = 0LL; j != v15; ++j)
            {
              if (*(void *)v20 != v16) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v19 + 1) + 8 * j) cancel];
            }

            uint64_t v15 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }

          while (v15);
        }
      }

      -[__NSURLSessionLocal _onqueue_checkForCompletion]((uint64_t)self);
    }
  }

  else
  {
    objc_msgSend(0, "_disableAPWakeOnIdleConnections", a3);
  }

- (uint64_t)_cfurlRequest:(CFTypeRef)cf2 isCacheEquivalentTo:
{
  if (!cf1) {
    __assert_rtn("-[__NSURLSessionLocal _cfurlRequest:isCacheEquivalentTo:]", "LocalSession.mm", 1818, "a");
  }
  if (cf1 == cf2 || CFEqual(cf1, cf2)) {
    return 1LL;
  }
  id v7 = -[NSURLRequest _initWithCFURLRequest:](objc_alloc(&OBJC_CLASS___NSURLRequest), "_initWithCFURLRequest:", cf1);
  id v8 = -[NSURLRequest _initWithCFURLRequest:](objc_alloc(&OBJC_CLASS___NSURLRequest), "_initWithCFURLRequest:", cf2);
  uint64_t v9 = -[__NSURLSessionLocal _request:isCacheEquivalentTo:](a1, (uint64_t)v7, (uint64_t)v8);

  return v9;
}

- (uint64_t)_request:(uint64_t)a3 isCacheEquivalentTo:
{
  if (!a1) {
    return 0LL;
  }
  if (!a2) {
    __assert_rtn("-[__NSURLSessionLocal _request:isCacheEquivalentTo:]", "LocalSession.mm", 1797, "a");
  }
  if (!a3) {
    __assert_rtn("-[__NSURLSessionLocal _request:isCacheEquivalentTo:]", "LocalSession.mm", 1798, "b");
  }
  uint64_t v6 = -[__NSURLSessionLocal _protocolClassForRequest:](a1, a2);
  id v7 = -[__NSURLSessionLocal _protocolClassForRequest:](a1, a3);
  if (!v6 || !v7 || v6 != v7) {
    return 0LL;
  }
  return objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v6, "canonicalRequestForRequest:", a2), "URL"),  "isEqual:",  objc_msgSend((id)objc_msgSend(v6, "canonicalRequestForRequest:", a3), "URL"));
}

- (void)_protocolClassForRequest:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = -[__NSURLSessionLocal _protocolClassesForTask:](a1, 0LL);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v11;
LABEL_4:
  uint64_t v7 = 0LL;
  while (1)
  {
    if (*(void *)v11 != v6) {
      objc_enumerationMutation(v3);
    }
    id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
    if (objc_msgSend(v8, "canInitWithRequest:", a2, (void)v10)) {
      return v8;
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        goto LABEL_4;
      }
      return 0LL;
    }
  }

- (void)dealloc
{
  uint64_t v3 = *((void *)self + 21);
  if (v3)
  {
    (*(void (**)(uint64_t, SEL))(*(void *)v3 + 48LL))(v3, a2);
    *((void *)self + 21) = 0LL;
  }

  uint64_t v4 = (void *)*((void *)self + 22);
  if (v4)
  {

    *((void *)self + 22) = 0LL;
  }

  uint64_t v5 = *((void *)self + 26);
  if (v5)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 48LL))(v5);
    *((void *)self + 26) = 0LL;
  }

  uint64_t v6 = *((void *)self + 27);
  if (v6)
  {
    (*(void (**)(uint64_t))(*(void *)v6 + 48LL))(v6);
    *((void *)self + 27) = 0LL;
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS_____NSURLSessionLocal;
  -[NSURLSession dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = self;
  return self;
}

- (void)_useTLSSessionCacheFromSession:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS_____NSURLSessionLocal;
  -[NSURLSession _useTLSSessionCacheFromSession:](&v10, sel__useTLSSessionCacheFromSession_, a3);
  uint64_t v4 = *((void *)self + 21);
  uint64_t v5 = *((void *)self + 2);
  uint64_t v6 = (std::__shared_weak_count *)*((void *)self + 3);
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      unint64_t v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
    std::shared_ptr<__CFString const>::operator=[abi:nn180100]((void *)(v4 + 144), v5, (uint64_t)v6);
    do
      unint64_t v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  else
  {
    std::shared_ptr<__CFString const>::operator=[abi:nn180100]((void *)(v4 + 144), v5, 0LL);
  }

- (id)webSocketTaskForRequest:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v5 = (void *)[a3 allHTTPHeaderFields];
  if (![v5 objectForKeyedSubscript:0x18C5AF628]) {
    [a3 setValue:@"13" forHTTPHeaderField:0x18C5AF628];
  }
  if (![v5 objectForKeyedSubscript:0x18C5AF7E8]) {
    [a3 setValue:0x18C5B0038 forHTTPHeaderField:0x18C5AF7E8];
  }
  if (![v5 objectForKeyedSubscript:0x18C5AEDD8]) {
    [a3 setValue:0x18C5B0000 forHTTPHeaderField:0x18C5AEDD8];
  }
  if (![v5 objectForKeyedSubscript:0x18C5AF5B8])
  {
    arc4random_buf(__buf, 0x10uLL);
    objc_msgSend( a3,  "setValue:forHTTPHeaderField:",  objc_msgSend( (id)objc_msgSend(MEMORY[0x189603F48], "dataWithBytesNoCopy:length:freeWhenDone:", __buf, 16, 0),  "base64EncodedStringWithOptions:",  0),  0x18C5AF5B8);
  }

  if (![v5 objectForKeyedSubscript:0x18C5AF580]) {
    [a3 setValue:0x18C5AFF58 forHTTPHeaderField:0x18C5AF580];
  }
  uint64_t v6 = -[__NSCFTaskForClass initWithGroup:]( objc_alloc(&OBJC_CLASS_____NSCFTaskForClass),  -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  objc_super v7 = (void *)objc_opt_class();
  if (v6)
  {
    objc_setProperty_atomic(v6, v8, v7, 8LL);
    objc_setProperty_atomic(v6, v9, a3, 16LL);
  }

  return -[__NSURLSessionLocal taskForClassInfo:](self, v6);
}

- (id)webSocketTaskForURL:(id)a3 protocols:(id)a4
{
  uint64_t v6 = (void *)[MEMORY[0x189607A50] componentsWithURL:a3 resolvingAgainstBaseURL:0];
  if ((objc_msgSend((id)objc_msgSend(v6, "scheme"), "isEqualToString:", 0x18C5B2C30) & 1) != 0
    || objc_msgSend((id)objc_msgSend(v6, "scheme"), "isEqualToString:", 0x18C5B2C68))
  {
    int v7 = objc_msgSend((id)objc_msgSend(v6, "scheme"), "isEqualToString:", 0x18C5B2C30);
    unint64_t v8 = &kCFURLSchemeHTTP;
    if (!v7) {
      unint64_t v8 = &kCFURLSchemeHTTPS;
    }
    [v6 setScheme:*v8];
    SEL v9 =  -[NSURLRequest initWithURL:]( [NSMutableURLRequest alloc],  "initWithURL:",  [v6 URL]);
    -[NSMutableURLRequest setCachePolicy:](v9, "setCachePolicy:", 1LL);
    if (a4)
    {
      id v10 = objc_alloc_init(MEMORY[0x189607940]);
      if ([a4 count])
      {
        unint64_t v11 = 0LL;
        do
        {
          if (v11) {
            objc_msgSend(v10, "appendString:", @", ");
          }
          objc_msgSend(v10, "appendString:", objc_msgSend(a4, "objectAtIndexedSubscript:", v11++));
        }

        while ([a4 count] > v11);
      }

      -[NSMutableURLRequest addValue:forHTTPHeaderField:](v9, "addValue:forHTTPHeaderField:", v10, 0x18C5AF5F0LL);
    }

    return -[NSURLSession webSocketTaskWithRequest:](self, "webSocketTaskWithRequest:", v9);
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"WebSocket tasks can only be created with ws or wss schemes" userInfo:0]);
    return -[__NSURLSessionLocal _uploadTaskWithTaskForClass:](v13, v14, v15);
  }

- (id)_uploadTaskWithTaskForClass:(id)a3
{
  int v7 = (void *)objc_opt_class();
  uint64_t v9 = 0x18C5A7000uLL;
  if (!a3)
  {
    if (*((_BYTE *)self + 360))
    {
LABEL_3:
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      self = (__NSURLSessionLocal *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_18298D000,  (os_log_t)self,  OS_LOG_TYPE_ERROR,  "Attempted to create a task in a session that has been invalidated",  buf,  2u);
      }

      unint64_t v11 = (NSString *)dyld_program_sdk_at_least();
      if (!(_DWORD)v11) {
        return 0LL;
      }
LABEL_43:
      __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v11);
      goto LABEL_44;
    }

- (id)_downloadTaskWithTaskForClass:(id)a3
{
  uint64_t v103 = *MEMORY[0x1895F89C0];
  if (*((_BYTE *)self + 360))
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v3 = (__NSURLSessionLocal *)CFNLog::logger;
    if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    goto LABEL_43;
  }

  id v4 = a3;
  if (!a3 || (uint64_t v3 = self, !objc_getProperty(a3, a2, 16LL, 1)) && !objc_getProperty(v4, v14, 64LL, 1))
  {
    __URLSESSION_CLIENT_API_MISUSE_NIL_ARGUMENT__(@"Cannot create download task without request or resume data");
LABEL_43:
    *(_WORD *)buf = 0;
    _os_log_error_impl( &dword_18298D000,  (os_log_t)v3,  OS_LOG_TYPE_ERROR,  "Attempted to create a task in a session that has been invalidated",  buf,  2u);
LABEL_5:
    uint64_t v12 = (NSString *)dyld_program_sdk_at_least();
    if (!(_DWORD)v12) {
      return 0LL;
    }
    __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v12);
    __break(1u);
LABEL_129:
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
LABEL_116:
    v73 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v99 = 138412290;
      *(void *)&v99[4] = v10;
      _os_log_impl( &dword_18298D000,  v73,  OS_LOG_TYPE_DEFAULT,  "Unsupported Range header value, restarting: %@",  v99,  0xCu);
    }

    objc_msgSend((id)objc_msgSend(MEMORY[0x189603F48], "data"), "writeToFile:atomically:", v8, 0);
    while (1)
    {
LABEL_74:
      uint64_t v61 = [v6 objectForKey:@"NSURLSessionResumeEntityTag"];
      if (!v61) {
        uint64_t v61 = [v6 objectForKey:@"NSURLSessionResumeServerDownloadDate"];
      }
      -[NSMutableURLRequest setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", v61, 0x18C5AF190LL);
      -[__NSURLSessionLocal updateCurrentRequest:](Property, "updateCurrentRequest:", v9);
      *((void *)Property + 123) = *(void *)(*(void *)&v101[8] + 24LL);
      *((void *)Property + 121) = *(void *)(*(void *)&v101[8] + 24LL);
      uint64_t v9 = (NSMutableURLRequest *)objc_msgSend( (id)-[__NSURLSessionLocal _taskGroup](Property, "_taskGroup"),  "_groupConfiguration");
      v66 = objc_alloc(&OBJC_CLASS_____NSCFLocalDownloadFile);
      if (v66)
      {
        v67 = -[__NSCFLocalDownloadFile initQueues](v66);
        if (v67)
        {
          uint64_t v10 = open(-[NSString UTF8String](v8, "UTF8String"), 9, 438LL);
          if ((v10 & 0x80000000) != 0)
          {
            v67[47] = *__error();
            if (CFNLog::onceToken != -1) {
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
            }
            uint64_t v10 = CFNLog::logger;
            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
            {
              int v77 = v67[47];
              *(_DWORD *)v99 = 67109378;
              *(_DWORD *)&v99[4] = v77;
              *(_WORD *)&v99[8] = 2112;
              *(void *)&v99[10] = v8;
              _os_log_error_impl( &dword_18298D000,  (os_log_t)v10,  OS_LOG_TYPE_ERROR,  "__NSCFLocalDownloadFile: error %d opening resume file: %@",  v99,  0x12u);
            }
          }

          else
          {
            [v67 setPath:v8];
            close(v10);
          }
        }
      }

      else
      {
        v67 = 0LL;
      }

      -[__NSURLSessionLocal setDownloadFile:](Property, "setDownloadFile:", v67);
      uint64_t v68 = -[__NSURLSessionLocal downloadFile](Property, "downloadFile");
      if (!v68 || !*(_DWORD *)(v68 + 188)) {
        goto LABEL_98;
      }
      if (!-[__NSURLSessionLocal _extractor](Property, "_extractor")
        || (uint64_t v69 = -[__NSURLSessionLocal downloadFile](Property, "downloadFile")) == 0
        || *(_DWORD *)(v69 + 188) != 21)
      {
        v65 = 0LL;
LABEL_97:
        -[__NSURLSessionLocal setDownloadFile:](Property, "setDownloadFile:", v65);
        goto LABEL_98;
      }

      objc_msgSend((id)-[__NSURLSessionLocal downloadFile](Property, "downloadFile"), "setPath:", v8);
LABEL_98:
      if (-[__NSURLSessionLocal downloadFile](Property, "downloadFile"))
      {
        if (v7) {
          uint64_t v7 = 1LL;
        }
        else {
          uint64_t v7 = -[NSMutableURLRequest skip_download_unlink](v9, "skip_download_unlink");
        }
        uint64_t v70 = -[__NSURLSessionLocal downloadFile](Property, "downloadFile");
        if (v70) {
          *(_BYTE *)(v70 + 185) = v7;
        }
        *((_BYTE *)Property + 1028) = -[__NSURLSessionLocal downloadFile](Property, "downloadFile") != 0;
        *((void *)Property + 124) = v6;
      }

      -[__NSURLSessionLocal set_backgroundPublishingURL:]( Property,  "set_backgroundPublishingURL:",  [v6 objectForKey:@"PublishingURL"]);
      if (-[__NSURLSessionLocal downloadFile](Property, "downloadFile"))
      {
        _Block_object_dispose(v101, 8);
        -[__NSURLSessionLocal set_suspensionThreshhold:](Property, "set_suspensionThreshhold:", 0x80000LL);
        goto LABEL_34;
      }

      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      v71 = (os_log_s *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
      {
        uint64_t v72 = -[__NSURLSessionLocal _loggableDescription](Property, "_loggableDescription");
        *(_DWORD *)v99 = 138543362;
        *(void *)&v99[4] = v72;
        _os_log_error_impl( &dword_18298D000,  v71,  OS_LOG_TYPE_ERROR,  "%{public}@ cannot create download file from resume data",  v99,  0xCu);
      }

      while (1)
      {
        _Block_object_dispose(v101, 8);
LABEL_29:
        id Property = (__NSURLSessionLocal *)objc_getProperty(v4, v20, 16LL, 1);
        uint64_t v6 = (void *)0x18C461000LL;
        if (Property
          || (v29 = +[__NSCFLocalDownloadTask _expandResumeData:]( &OBJC_CLASS_____NSCFLocalDownloadTask,  "_expandResumeData:",  objc_getProperty(v4, v28, 64LL, 1)),  (id Property = (__NSURLSessionLocal *)+[__NSCFLocalDownloadTask _requestFromResumeDataDictionary:]( (uint64_t)&OBJC_CLASS_____NSCFLocalDownloadTask,  v29)) != 0LL))
        {
          v30 = objc_alloc(&OBJC_CLASS_____NSCFLocalDownloadTask);
          id v32 = objc_getProperty(v4, v31, 88LL, 1);
          id v34 = objc_getProperty(v4, v33, 56LL, 1);
          uint64_t v35 = -[__NSURLSessionLocal nextSeed](v3, "nextSeed");
          p_isa = &v30->super.super.super.isa;
          uint64_t v37 = (uint64_t)v32;
          uint64_t v38 = (uint64_t)Property;
          goto LABEL_33;
        }

        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot create download task with corrupt resume data" userInfo:0]);
LABEL_46:
        unint64_t v8 = 0LL;
LABEL_47:
        SEL v50 = (void *)[v6 objectForKey:@"NSURLSessionResumeExtractor"];
        if (!v50) {
          break;
        }
        -[__NSURLSessionLocal set_extractor:](Property, "set_extractor:", v50);
        *(void *)v99 = 0LL;
        *(void *)&v99[8] = v99;
        *(void *)&v99[16] = v11;
        char v100 = 1;
        if (!v8) {
          goto LABEL_60;
        }
        id v51 = dispatch_semaphore_create(0LL);
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        uint64_t v10 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v52 = -[__NSURLSessionLocal _loggableDescription](Property, "_loggableDescription");
          *(_DWORD *)v95 = 138543619;
          uint64_t v96 = v52;
          __int16 v97 = 2113;
          v98 = v8;
          _os_log_impl( &dword_18298D000,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ StreamingZip preparing extraction to %{private}@",  v95,  0x16u);
        }

        *(void *)buf = MEMORY[0x1895F87A8];
        uint64_t v86 = 3221225472LL;
        v87 = __62____NSCFLocalDownloadTask_initWithTaskGroup_resumeData_ident___block_invoke;
        v88 = &unk_189C02570;
        v93 = v99;
        v89 = v9;
        v90 = Property;
        v91 = v51;
        v92 = v101;
        [v50 prepareForExtractionToPath:v8 completionBlock:buf];
        if (dispatch_semaphore_wait(v51, 0xFFFFFFFFFFFFFFFFLL))
        {
          if (CFNLog::onceToken != -1) {
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
          }
          uint64_t v10 = CFNLog::logger;
          if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
          {
            uint64_t v74 = -[__NSURLSessionLocal _loggableDescription](Property, "_loggableDescription");
            *(_DWORD *)v95 = 138543362;
            uint64_t v96 = v74;
            _os_log_error_impl( &dword_18298D000,  (os_log_t)v10,  OS_LOG_TYPE_ERROR,  "%{public}@ StreamingZip Error - timed out waiting for return from prepareForExtraction.",  v95,  0xCu);
          }

          *(_BYTE *)(*(void *)&v99[8] + 24LL) = 0;
        }

        dispatch_release(v51);
        if (*(_BYTE *)(*(void *)&v99[8] + 24LL))
        {
LABEL_60:
          _Block_object_dispose(v99, 8);
          goto LABEL_74;
        }

        _Block_object_dispose(v99, 8);
      }

      uint64_t v53 = objc_msgSend( (id)objc_msgSend(v6, "objectForKey:", @"NSURLSessionResumeBytesReceived"),  "longLongValue");
      *(void *)(*(void *)&v101[8] + 24LL) = v53;
      v54 = (void *)[(id)v10 valueForHTTPHeaderField:0x18C5AF4D8];
      if ([v54 hasPrefix:@"bytes="]
        && (id v55 = (void *)[v54 componentsSeparatedByString:@"="], (v56 = v55) != 0)
        && (unint64_t)[v55 count] >= 2
        && (v57 = (void *)[v56 objectAtIndexedSubscript:1], (uint64_t v10 = (uint64_t)v57) != 0))
      {
        uint64_t v58 = (void *)[v57 componentsSeparatedByString:@"-"];
        if ([v58 count] != 2)
        {
          if (CFNLog::onceToken != -1) {
            goto LABEL_129;
          }
          goto LABEL_116;
        }

        if ([(id)v10 hasPrefix:@"-"])
        {
          uint64_t v59 = objc_msgSend((id)objc_msgSend(v58, "objectAtIndexedSubscript:", 1), "longLongValue");
          uint64_t v10 = objc_msgSend( NSString,  "stringWithFormat:",  @"bytes=-%lld",  v59 - *(void *)(*(void *)&v101[8] + 24));
          -[NSMutableURLRequest setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", v10, 0x18C5AF4D8LL);
          if (CFNLog::onceToken != -1) {
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
          }
          uint64_t v60 = (os_log_s *)CFNLog::logger;
          if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v99 = 138412290;
            *(void *)&v99[4] = v10;
            goto LABEL_114;
          }
        }

        else if ([(id)v10 hasSuffix:@"-"])
        {
          uint64_t v76 = objc_msgSend((id)objc_msgSend(v58, "objectAtIndexedSubscript:", 0), "longLongValue");
          uint64_t v10 = objc_msgSend( NSString,  "stringWithFormat:",  @"bytes=%lld-",  *(void *)(*(void *)&v101[8] + 24) + v76);
          -[NSMutableURLRequest setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", v10, 0x18C5AF4D8LL);
          if (CFNLog::onceToken != -1) {
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
          }
          uint64_t v60 = (os_log_s *)CFNLog::logger;
          if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v99 = 138412290;
            *(void *)&v99[4] = v10;
            goto LABEL_114;
          }
        }

        else
        {
          v78 = (void *)[v58 objectAtIndexedSubscript:0];
          v79 = (void *)[v58 objectAtIndexedSubscript:1];
          uint64_t v80 = [v78 longLongValue];
          uint64_t v81 = [v79 longLongValue];
          uint64_t v10 = objc_msgSend( NSString,  "stringWithFormat:",  @"bytes=%lld-%lld",  *(void *)(*(void *)&v101[8] + 24) + v80,  v81);
          -[NSMutableURLRequest setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", v10, 0x18C5AF4D8LL);
          if (CFNLog::onceToken != -1) {
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
          }
          uint64_t v60 = (os_log_s *)CFNLog::logger;
          if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v99 = 138412290;
            *(void *)&v99[4] = v10;
LABEL_114:
            _os_log_debug_impl(&dword_18298D000, v60, OS_LOG_TYPE_DEBUG, "Request Range header value: %@", v99, 0xCu);
          }
        }
      }

      else
      {
        uint64_t v10 = objc_msgSend( NSString,  "stringWithFormat:",  @"bytes=%lld-",  *(void *)(*(void *)&v101[8] + 24));
        -[NSMutableURLRequest setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", v10, 0x18C5AF4D8LL);
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        uint64_t v60 = (os_log_s *)CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v99 = 138412290;
          *(void *)&v99[4] = v10;
          goto LABEL_114;
        }
      }
    }

    uint64_t v62 = objc_alloc(&OBJC_CLASS_____NSCFLocalDownloadFile);
    if (v62)
    {
      v63 = -[__NSCFLocalDownloadFile initQueues](v62);
      uint64_t v64 = v63;
      if (v63)
      {
        [v63 setPath:v8];
        v64[24] = Property;
      }
    }

    else
    {
      uint64_t v64 = 0LL;
    }

    v65 = v64;
    goto LABEL_97;
  }

  id v15 = objc_getProperty(v4, v14, 64LL, 1);
  uint64_t v7 = objc_alloc(&OBJC_CLASS_____NSCFLocalDownloadTask);
  uint64_t v17 = -[NSURLSession defaultTaskGroup](v3, "defaultTaskGroup");
  if (v15)
  {
    id v18 = objc_getProperty(v4, v16, 64LL, 1);
    uint64_t v19 = -[__NSURLSessionLocal nextSeed](v3, "nextSeed");
    if (!v7) {
      goto LABEL_29;
    }
    uint64_t v21 = v19;
    *(void *)(v7 + 984) = -1LL;
    id v22 = +[__NSCFLocalDownloadTask _expandResumeData:]( &OBJC_CLASS_____NSCFLocalDownloadTask,  "_expandResumeData:",  v18);
    if (!v22
      || (uint64_t v6 = v22,
          (__int128 v23 = +[__NSCFLocalDownloadTask _requestFromResumeDataDictionary:]( (uint64_t)&OBJC_CLASS_____NSCFLocalDownloadTask,  v22)) == 0LL))
    {

      goto LABEL_29;
    }

    uint64_t v9 = v23;
    v94.receiver = (id)v7;
    v94.super_class = (Class)&OBJC_CLASS_____NSCFLocalDownloadTask;
    id Property = -[__NSURLSessionLocal initWithOriginalRequest:ident:taskGroup:]( &v94,  sel_initWithOriginalRequest_ident_taskGroup_,  v23,  v21,  v17);
    if (!Property) {
      goto LABEL_29;
    }
    uint64_t v10 = (uint64_t)+[__NSCFLocalDownloadTask _requestFromResumeDataDictionary:key:]( (uint64_t)&OBJC_CLASS_____NSCFLocalDownloadTask,  v6,  (uint64_t)@"NSURLSessionResumeOriginalRequest");
    if (v10) {
      -[__NSURLSessionLocal setOriginalRequest:](Property, "setOriginalRequest:", v10);
    }
    uint64_t v24 = [v6 objectForKeyedSubscript:@"NSURLSessionResumeResponse"];
    if (v24)
    {
      *(void *)v99 = 0LL;
      -[__NSURLSessionLocal setResponse:]( Property,  "setResponse:",  [MEMORY[0x189607908] unarchivedObjectOfClass:objc_opt_class() fromData:v24 error:v99]);
      if (!-[__NSURLSessionLocal response](Property, "response"))
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        unint64_t v25 = (os_log_s *)CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          uint64_t v75 = -[__NSURLSessionLocal _loggableDescription](Property, "_loggableDescription");
          *(_DWORD *)v101 = 138543618;
          *(void *)&v101[4] = v75;
          *(_WORD *)&v101[12] = 2112;
          *(void *)&v101[14] = *(void *)v99;
          _os_log_error_impl( &dword_18298D000,  v25,  OS_LOG_TYPE_ERROR,  "%{public}@ failed to unarchive response: %@",  v101,  0x16u);
        }
      }
    }

    *(void *)v101 = 0LL;
    *(void *)&v101[8] = v101;
    uint64_t v11 = 0x2020000000LL;
    *(void *)&v101[16] = 0x2020000000LL;
    uint64_t v102 = -1LL;
    uint64_t v7 = [v6 objectForKey:@"NSURLSessionResumeInfoLocalPath"];
    unint64_t v8 = (NSString *)v7;
    if (v7) {
      goto LABEL_47;
    }
    SEL v26 = (NSString *)[-[__NSCFLocalDownloadTask explicitDownloadDirectory](Property) path];
    if (!v26) {
      SEL v26 = NSTemporaryDirectory();
    }
    uint64_t v27 = [v6 objectForKey:@"NSURLSessionResumeInfoTempFileName"];
    if (v27)
    {
      unint64_t v8 = -[NSString stringByAppendingPathComponent:](v26, "stringByAppendingPathComponent:", v27);
      goto LABEL_47;
    }

    goto LABEL_46;
  }

  id v39 = objc_getProperty(v4, v16, 16LL, 1);
  id v34 = objc_getProperty(v4, v40, 56LL, 1);
  uint64_t v35 = -[__NSURLSessionLocal nextSeed](v3, "nextSeed");
  p_isa = (void *)v7;
  uint64_t v37 = v17;
  uint64_t v38 = (uint64_t)v39;
LABEL_33:
  id Property = (__NSURLSessionLocal *)-[__NSCFLocalDownloadTask initWithTaskGroup:request:filePath:ident:]( p_isa,  v37,  v38,  (uint64_t)v34,  v35);
  if (Property)
  {
LABEL_34:
    os_unfair_lock_lock((os_unfair_lock_t)v3 + 100);
    [*((id *)v3 + 23) addObject:Property];
    os_unfair_lock_unlock((os_unfair_lock_t)v3 + 100);
    if (objc_getProperty(v4, v41, 72LL, 1))
    {
      id v43 = objc_getProperty(v4, v42, 72LL, 1);
      uint64_t v44 = _Block_copy(v43);
      newValue[0] = MEMORY[0x1895F87A8];
      newValue[1] = 3221225472LL;
      newValue[2] = __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke;
      newValue[3] = &unk_189C01A88;
      newValue[4] = v3;
      newValue[5] = v44;
      objc_setProperty_atomic_copy(Property, v45, newValue, 936LL);
    }

    uint64_t v46 = MEMORY[0x1895F87A8];
    v83[0] = MEMORY[0x1895F87A8];
    v83[1] = 3221225472LL;
    v83[2] = __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke_2;
    v83[3] = &unk_189C01AB0;
    v83[4] = v3;
    objc_setProperty_atomic_copy(Property, v42, v83, 808LL);
    -[__NSURLSessionLocal setDelegate:](Property, "setDelegate:", objc_getProperty(v4, v47, 80LL, 1));
    uint64_t v48 = *((void *)Property + 88);
    if (!v48) {
      uint64_t v48 = *((void *)Property + 87);
    }
    -[__NSCFURLSessionDelegateWrapper didCreateTask:](v48, Property);
    if (-[__NSURLSessionLocal state](Property, "state") != 1)
    {
      uint64_t v49 = (dispatch_queue_s *)*((void *)v3 + 15);
      block[0] = v46;
      block[1] = 3221225472LL;
      block[2] = __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke_3;
      block[3] = &unk_189C1A548;
      block[4] = Property;
      dispatch_async(v49, block);
    }
  }

  return Property;
}

- (id)_AVAssetDownloadTaskForURL:(id)a3 destinationURL:(id)a4 options:(id)a5
{
  return -[__NSURLSessionLocal AVAssetDownloadTaskForURLAsset:destinationURL:options:](v5, v6, v7, v8, v9);
}

- (id)AVAssetDownloadTaskForURLAsset:(id)a3 destinationURL:(id)a4 options:(id)a5
{
  return -[__NSURLSessionLocal AVAssetDownloadTaskForURLAsset:assetTitle:assetArtworkData:options:downloadConfiguration:]( v5,  v6,  v7,  v8,  v9,  v10,  v11);
}

- (id)AVAssetDownloadTaskForURLAsset:(id)a3 assetTitle:(id)a4 assetArtworkData:(id)a5 options:(id)a6 downloadConfiguration:(id)a7
{
  return -[__NSURLSessionLocal AVAggregateAssetDownloadTaskForURLAsset:mediaSelections:assetTitle:assetArtworkData:options:]( v7,  v8,  v9,  v10,  v11,  v12,  v13);
}

- (id)AVAggregateAssetDownloadTaskForURLAsset:(id)a3 mediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7
{
  return result;
}

- (void)_onqueue_handleConnectionsAtAPSleep
{
  if (self)
  {
    uint64_t v3 = *((void *)self + 21);
    if (v3)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v3 + 40));
      CFDictionaryApplyFunction( *(CFDictionaryRef *)(v3 + 32),  (CFDictionaryApplierFunction)RetainableTypedDict<CoreSchedulingSet const*,GlueTubeManager *>::_visit,  &__block_literal_global_342);
      pthread_mutex_unlock((pthread_mutex_t *)(v3 + 40));
      id v4 = (CFDictionaryRef *)*((void *)self + 21);
      if (v4) {
        XTubeManager::invalidateAllConnections(v4, 1);
      }
    }
  }

- (void)_onqueue_resetStorageWithCompletionHandler:(id)a3
{
}

- (void)_onqueue_flushWithCompletionHandler:(id)a3
{
}

- (void)_onqueue_getTasksWithCompletionHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v5 = (void *)[*((id *)self + 22) copy];
  SEL v6 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:0];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 state] <= 1) {
          [v6 addObject:v11];
        }
      }

      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __62____NSURLSessionLocal__onqueue_getTasksWithCompletionHandler___block_invoke;
  v12[3] = &unk_189C1A2E8;
  v12[4] = v6;
  v12[5] = a3;
  -[NSURLSession runDelegateBlock:]((uint64_t)self, v12);
}

- (void)_onqueue_markConnectionsReusedAfterAPSleepWake
{
  if (self)
  {
    uint64_t v2 = *((void *)self + 21);
    if (v2)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v2 + 40));
      CFDictionaryApplyFunction( *(CFDictionaryRef *)(v2 + 32),  (CFDictionaryApplierFunction)RetainableTypedDict<CoreSchedulingSet const*,GlueTubeManager *>::_visit,  &__block_literal_global_345);
      pthread_mutex_unlock((pthread_mutex_t *)(v2 + 40));
    }
  }

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  if (a4)
  {

    *((void *)self + 47) = 0LL;
    *((_BYTE *)self + 384) = 1;
  }

- (void)_flushOrResetStorage:(uint64_t)a3 reset:
{
  if (a1)
  {
    SEL v6 = (void *)MEMORY[0x186E1578C]();
    uint64_t v7 = dispatch_group_create();
    uint64_t XCookie = -[__NSURLSessionLocal _createXCookieStorage](a1);
    uint64_t v9 = MEMORY[0x1895F87A8];
    if (XCookie)
    {
      uint64_t v10 = XCookie;
      dispatch_group_enter(v7);
      v18[0] = v9;
      v18[1] = 3221225472LL;
      v18[2] = __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke;
      v18[3] = &unk_189C1A570;
      v18[4] = v7;
      v18[5] = v10;
      (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v10 + 72LL))(v10, a3, v18);
    }

    uint64_t XCredential = -[__NSURLSessionLocal _createXCredentialStorage](a1);
    if (XCredential)
    {
      uint64_t v12 = XCredential;
      dispatch_group_enter(v7);
      v17[0] = v9;
      v17[1] = 3221225472LL;
      v17[2] = __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_2;
      v17[3] = &unk_189C1A570;
      v17[4] = v7;
      v17[5] = v12;
      (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v12 + 96LL))(v12, a3, v17);
    }

    v15[0] = v9;
    v15[1] = 3221225472LL;
    v15[2] = __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_3;
    v15[3] = &unk_189C01A60;
    v15[4] = v7;
    char v16 = a3;
    -[__NSURLSessionLocal _withXURLCache:]((id *)a1, (uint64_t)v15);
    __int128 v13 = *(dispatch_queue_s **)(a1 + 120);
    block[0] = v9;
    block[1] = 3221225472LL;
    block[2] = __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_5;
    block[3] = &unk_189C1A298;
    block[4] = a2;
    dispatch_group_notify(v7, v13, block);
    dispatch_release(v7);
    objc_autoreleasePoolPop(v6);
  }

- (uint64_t)_createXCookieStorage
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (std::mutex *)(result + 232);
    std::mutex::lock((std::mutex *)(result + 232));
    if (!*(_BYTE *)(v1 + 224))
    {
      EmptyXCookieStorage = (XCookieStorage *)[*(id *)(v1 + 112) HTTPCookieStorage];
      if (!EmptyXCookieStorage
        || (XCookieStorage::createNSXCookieStorage(EmptyXCookieStorage, v4), !EmptyXCookieStorage))
      {
        EmptyXCookieStorage = (XCookieStorage *)XCookieStorage::createEmptyXCookieStorage(EmptyXCookieStorage, v4);
      }

      *(void *)(v1 + 208) = EmptyXCookieStorage;
      *(_BYTE *)(v1 + 224) = 1;
    }

    std::mutex::unlock(v2);
    id result = *(void *)(v1 + 208);
    if (result)
    {
      (*(void (**)(uint64_t))(*(void *)result + 40LL))(result);
      return *(void *)(v1 + 208);
    }
  }

  return result;
}

- (uint64_t)_createXCredentialStorage
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (std::mutex *)(result + 296);
    std::mutex::lock((std::mutex *)(result + 296));
    if (!*(_BYTE *)(v1 + 225))
    {
      uint64_t v3 = (const void *)[*(id *)(v1 + 112) URLCredentialStorage];
      if (v3)
      {
        id v4 = (NSXCredentialStorage *)MEMORY[0x186E12804](*MEMORY[0x189604DB0], 32LL, 0LL);
        *(_OWORD *)id v4 = 0u;
        *((_OWORD *)v4 + 1) = 0u;
        NSXCredentialStorage::NSXCredentialStorage(v4, v3);
      }

      else
      {
        EmptyXCredentialStorage = XCredentialStorage::createEmptyXCredentialStorage(0LL);
      }

      *(void *)(v1 + 216) = EmptyXCredentialStorage;
      *(_BYTE *)(v1 + 225) = 1;
    }

    std::mutex::unlock(v2);
    id result = *(void *)(v1 + 216);
    if (result)
    {
      (*(void (**)(uint64_t))(*(void *)result + 40LL))(result);
      return *(void *)(v1 + 216);
    }
  }

  return result;
}

- (id)_withXURLCache:(id *)result
{
  if (result)
  {
    uint64_t v3 = (NSURLSession *)result;
    id result = (id *)[result[14] URLCache];
    if (result)
    {
      id result = (id *)XURLCache::createNSXURLCache((XURLCache *)result, v3, v4);
      if (result)
      {
        uint64_t v5 = result;
        (*(void (**)(uint64_t, id *))(a2 + 16))(a2, result);
        return (id *)(*((uint64_t (**)(id *))*v5 + 1))(v5);
      }
    }
  }

  return result;
}

- (id)replaceTask:(void *)a3 withTask:
{
  if (result)
  {
    uint64_t v5 = result;
    if ([a2 _powerAssertion])
    {
      objc_msgSend(a3, "set_powerAssertion:", objc_msgSend(a2, "_powerAssertion"));
      objc_msgSend(a2, "set_powerAssertion:", 0);
      CFStringRef v6 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"NSURLSessionTask %p", a3);
      if (v6)
      {
        CFStringRef v7 = v6;
        IOPMAssertionSetProperty([a3 _powerAssertion], @"AssertName", v6);
        CFRelease(v7);
      }
    }

    id v8 = a2;
    [v5[22] addObject:a3];
    [v5[22] removeObject:a2];
    return (id *)a2;
  }

  return result;
}

- (void)addConnectionlessTask:(uint64_t)a1
{
  if (a1)
  {
    [*(id *)(a1 + 176) addObject:a2];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 400));
    [*(id *)(a1 + 184) removeObject:a2];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 400));
  }

- (void)removeConnectionlessTask:(uint64_t)a1
{
  if (a1)
  {
    [*(id *)(a1 + 176) removeObject:a2];
    if (![*(id *)(a1 + 176) count])
    {
      uint64_t v3 = *(dispatch_queue_s **)(a1 + 120);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __48____NSURLSessionLocal_removeConnectionlessTask___block_invoke;
      block[3] = &unk_189C1A548;
      block[4] = a1;
      dispatch_async(v3, block);
    }
  }

- (void)addUnresumedTask:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 400));
    [*(id *)(a1 + 184) addObject:a2];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 400));
  }

- (uint64_t)_getCookieHeadersForTask:(uint64_t)a3 completionHandler:
{
  if (result)
  {
    uint64_t v5 = objc_msgSend( a2,  "currentRequest",  MEMORY[0x1895F87A8],  3221225472,  __66____NSURLSessionLocal__getCookieHeadersForTask_completionHandler___block_invoke,  &unk_189C01AD8,  a2,  a3);
    if (v5
      && (CFStringRef v6 = (void *)v5, [a2 shouldHandleCookiesAndSchemeIsAppropriate])
      && (uint64_t v7 = [a2 _createXCookieStorage]) != 0)
    {
      id v8 = (void *)v7;
      uint64_t v9 = *(void *)([v6 _inner] + 56);
      if (v9)
      {
        uint64_t v10 = *(const void **)(v9 + 184);
        if (v10)
        {
          CFTypeRef v11 = CFRetain(v10);
          if (v11)
          {
            uint64_t v12 = v11;
            __int128 v13 = (const __CFAllocator *)*MEMORY[0x189604DB0];
            uint64_t v14 = MEMORY[0x186E12804](*MEMORY[0x189604DB0], 40LL, 0LL);
            *(void *)(v14 + 28) = 0LL;
            *(void *)(v14 + 20) = 0LL;
            *(_DWORD *)(v14 + 36) = 0;
            *(void *)uint64_t v14 = off_189C06BF8;
            *(void *)(v14 + 8) = v13;
            *(_DWORD *)(v14 + 16) = 1;
            if (((v14 + 16) & 3) != 0) {
              __assert_rtn( "CFAllocatedReferenceCountedObject",  "CFObject.cpp",  25,  "(ptrdiff_t(&fRetainCount) & 3) == 0");
            }
            __int128 v15 = (void *)v14;
            *(void *)uint64_t v14 = off_189C15280;
            *(void *)(v14 + 24) = v8;
            (*(void (**)(void *))(*v8 + 40LL))(v8);
            v15[4] = _CookieStorageCreateInMemory(v13, v16);
            (*(void (**)(void *))(*v8 + 48LL))(v8);
            (*(void (**)(void *, const void *))(*v15 + 80LL))(v15, v12);
            CFRelease(v12);
            id v8 = v15;
          }
        }
      }

      (*(void (**)(void *, void *, uint64_t *))(*v8 + 88LL))(v8, a2, &v17);
      return (*(uint64_t (**)(void *))(*v8 + 48LL))(v8);
    }

    else
    {
      return __66____NSURLSessionLocal__getCookieHeadersForTask_completionHandler___block_invoke((uint64_t)&v17, 0LL);
    }
  }

  return result;
}

- (uint64_t)_withConnectionCache_setCurrentSSLMethod:(uint64_t)a3 forKey:(const void *)a4 scheduling:
{
  uint64_t result = *(void *)(a1 + 168);
  if (result)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = ___ZN12XTubeManager25setCurrentSSLMethodForKeyEPK22HTTPConnectionCacheKeyPK10__CFStringPK17CoreSchedulingSet_block_invoke;
    v5[3] = &__block_descriptor_48_e9_v16__0_v8l;
    v5[4] = a3;
    v5[5] = a2;
    return XTubeManager::withTubeManager(result, a4, (uint64_t)v5);
  }

  return result;
}

@end