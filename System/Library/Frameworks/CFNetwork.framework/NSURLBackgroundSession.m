@interface NSURLBackgroundSession
@end

@implementation NSURLBackgroundSession

void __67____NSURLBackgroundSession__onqueue_getTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
}

void __58____NSURLBackgroundSession__onqueue_completeInvalidation___block_invoke(uint64_t a1, int a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    *(_BYTE *)(v3 + 265) = 1;
    -[NSURLSession finalizeDelegateWithError:](*(void *)(a1 + 32));
    return;
  }

  if (v3) {
    v4 = *(void **)(v3 + 112);
  }
  else {
    v4 = 0LL;
  }
  int v5 = [v4 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  v6 = (os_log_s *)CFNLog::logger;
  BOOL v7 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      return;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      uint64_t v9 = *(void *)(v8 + 128);
    }
    else {
      uint64_t v9 = 0LL;
    }
    int v13 = 138543618;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    v10 = "ProxySession <%{public}@> Already invalidating %@";
  }

  else
  {
    if (!v7) {
      return;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      uint64_t v12 = *(void *)(v11 + 128);
    }
    else {
      uint64_t v12 = 0LL;
    }
    int v13 = 138543618;
    uint64_t v14 = v12;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    v10 = "BackgroundSession <%{public}@> Already invalidating %@";
  }

  _os_log_impl(&dword_18298D000, v6, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0x16u);
}

void __51____NSURLBackgroundSession_sendInvalidationRequest__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    v2 = *(dispatch_queue_s **)(v1 + 120);
  }
  else {
    v2 = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51____NSURLBackgroundSession_sendInvalidationRequest__block_invoke_2;
  block[3] = &unk_189C1A548;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __61____NSURLBackgroundSession__onqueue_invokeInvalidateCallback__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 284);
  if (v3)
  {
    notify_cancel(v3);
    *(_DWORD *)(*(void *)(a1 + 32) + 284LL) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }

  *(void *)(*(void *)(a1 + 32) + 168LL) = 0LL;
  [*(id *)(*(void *)(a1 + 32) + 176) invalidate];

  *(void *)(*(void *)(a1 + 32) + 176LL) = 0LL;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  _Block_release(*(const void **)(a1 + 40));
}

void __51____NSURLBackgroundSession_sendInvalidationRequest__block_invoke_2(uint64_t a1)
{
}

void __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    int v5 = *(void **)(v4 + 112);
  }
  else {
    int v5 = 0LL;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  BOOL v7 = (os_log_s *)CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (v9) {
        uint64_t v9 = *(void *)(v9 + 128);
      }
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = a2;
      v10 = "ProxySession <%{public}@> an error occurred on the xpc connection to setup the background session: %@";
LABEL_15:
      _os_log_error_impl(&dword_18298D000, v7, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x16u);
    }
  }

  else if (v8)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      uint64_t v11 = *(void *)(v11 + 128);
    }
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    uint64_t v15 = a2;
    v10 = "BackgroundSession <%{public}@> an error occurred on the xpc connection to setup the background session: %@";
    goto LABEL_15;
  }

void __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke_46( uint64_t a1,  void *a2,  void *a3,  char a4)
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    uint64_t v9 = *(void **)(v8 + 112);
  }
  else {
    uint64_t v9 = 0LL;
  }
  int v10 = [v9 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  uint64_t v11 = &TrustExceptionManager::_isSharingdProcess(void)::onceToken;
  int v12 = (os_log_s *)CFNLog::logger;
  BOOL v13 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (!v13) {
      goto LABEL_15;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14)
    {
      uint64_t v15 = *(void *)(v14 + 128);
      uint64_t v16 = *(void **)(v14 + 112);
    }

    else
    {
      uint64_t v15 = 0LL;
      uint64_t v16 = 0LL;
    }

    *(_DWORD *)buf = 138543874;
    uint64_t v65 = v15;
    __int16 v66 = 2112;
    uint64_t v67 = v14;
    __int16 v68 = 2112;
    uint64_t v69 = [v16 identifier];
    uint64_t v17 = "ProxySession <%{public}@> background session setup reply received: session %@ with identifier %@";
  }

  else
  {
    if (!v13) {
      goto LABEL_15;
    }
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18)
    {
      uint64_t v19 = *(void *)(v18 + 128);
      v20 = *(void **)(v18 + 112);
    }

    else
    {
      uint64_t v19 = 0LL;
      v20 = 0LL;
    }

    *(_DWORD *)buf = 138543874;
    uint64_t v65 = v19;
    __int16 v66 = 2112;
    uint64_t v67 = v18;
    __int16 v68 = 2112;
    uint64_t v69 = [v20 identifier];
    uint64_t v17 = "BackgroundSession <%{public}@> background session setup reply received: session %@ with identifier %@";
  }

  _os_log_impl(&dword_18298D000, v12, OS_LOG_TYPE_DEFAULT, v17, buf, 0x20u);
LABEL_15:
  if (!a2)
  {
    if (objc_msgSend( (id)objc_msgSend(a3, "objectForKey:", @"kNSURLSessionThrowImmediateAVExceptionKey"),  "BOOLValue"))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      return;
    }

    if ([a3 objectForKey:@"kNSURLSessionImmediateInvalidationErrorKey"])
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = (id)[a3 objectForKey:@"kNSURLSessionImmediateInvalidationErrorKey"];
      return;
    }

    uint64_t v45 = *(void *)(a1 + 32);
    if (v45) {
      v46 = *(void **)(v45 + 112);
    }
    else {
      v46 = 0LL;
    }
    int v47 = [v46 _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    v48 = (os_log_s *)CFNLog::logger;
    BOOL v49 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v47)
    {
      if (!v49) {
        return;
      }
      uint64_t v50 = *(void *)(a1 + 32);
      if (v50)
      {
        uint64_t v51 = *(void *)(v50 + 128);
        v52 = *(void **)(v50 + 112);
      }

      else
      {
        uint64_t v51 = 0LL;
        v52 = 0LL;
      }

      uint64_t v53 = [v52 identifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v65 = v51;
      __int16 v66 = 2112;
      uint64_t v67 = v50;
      __int16 v68 = 2112;
      uint64_t v69 = v53;
      v54 = "ProxySession <%{public}@> Failed to setup background NSURLSession for session %@ with identifier %@";
    }

    else
    {
      if (!v49) {
        return;
      }
      uint64_t v55 = *(void *)(a1 + 32);
      if (v55)
      {
        uint64_t v56 = *(void *)(v55 + 128);
        v57 = *(void **)(v55 + 112);
      }

      else
      {
        uint64_t v56 = 0LL;
        v57 = 0LL;
      }

      uint64_t v58 = [v57 identifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v65 = v56;
      __int16 v66 = 2112;
      uint64_t v67 = v55;
      __int16 v68 = 2112;
      uint64_t v69 = v58;
      v54 = "BackgroundSession <%{public}@> Failed to setup background NSURLSession for session %@ with identifier %@";
    }

    _os_log_error_impl(&dword_18298D000, v48, OS_LOG_TYPE_ERROR, v54, buf, 0x20u);
    return;
  }

  *(void *)(*(void *)(a1 + 32) + 168LL) = a2;
  *(_BYTE *)(*(void *)(a1 + 32) + 264LL) = a4;
  if (a3)
  {
    uint64_t v21 = [a3 objectForKeyedSubscript:@"NDBackgroundSessionManagerKeySessionUUID"];
    if (v21)
    {
      v23 = (void *)v21;
      v24 = *(void **)(a1 + 32);
      if (v24) {
        objc_setProperty_nonatomic_copy(v24, v22, v23, 128LL);
      }
    }

    uint64_t v25 = [a3 objectForKeyedSubscript:@"NDBackgroundSessionManagerRestoredStateKeyTLSSessionCachePrefix"];
    if (v25) {
      objc_msgSend(*(id *)(a1 + 32), "set_tlsSessionCachePrefix:", v25);
    }
    v26 = (void *)[a3 objectForKeyedSubscript:@"NDBackgroundSessionManagerRestoredStateKeyTasks"];
    uint64_t v27 = *(void *)(a1 + 32);
    if (v27)
    {
      v28 = v26;
      v63[0] = MEMORY[0x1895F87A8];
      v63[1] = 3221225472LL;
      v63[2] = __50____NSURLBackgroundSession_recreateExistingTasks___block_invoke;
      v63[3] = &unk_189C07560;
      v63[4] = v27;
      [v26 enumerateKeysAndObjectsUsingBlock:v63];
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      v29 = *(void **)(v27 + 184);
      uint64_t v30 = [v29 countByEnumeratingWithState:&v59 objects:buf count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v60;
        do
        {
          for (uint64_t i = 0LL; i != v31; ++i)
          {
            if (*(void *)v60 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void *)(*((void *)&v59 + 1) + 8 * i);
            if (![v28 objectForKey:v34]) {
              [*(id *)(v27 + 192) addObject:v34];
            }
          }

          uint64_t v31 = [v29 countByEnumeratingWithState:&v59 objects:buf count:16];
        }

        while (v31);
      }
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    uint64_t v11 = &TrustExceptionManager::_isSharingdProcess(void)::onceToken;
  }

  else
  {
    uint64_t v35 = [*(id *)(*(void *)(a1 + 32) + 184) count];
    v36 = *(id **)(a1 + 32);
    if (v35) {
      objc_msgSend(v36[24], "addObjectsFromArray:", objc_msgSend(v36[23], "allKeys"));
    }
    else {
      objc_msgSend(v36[21], "setTLSSessionCachePrefix:", objc_msgSend(v36, "_tlsSessionCachePrefix"));
    }
  }

  uint64_t v37 = *(void *)(a1 + 32);
  if (v37) {
    v38 = *(void **)(v37 + 112);
  }
  else {
    v38 = 0LL;
  }
  int v39 = [v38 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  v40 = (os_log_s *)v11[93];
  BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
  if (v39)
  {
    if (!v41) {
      return;
    }
    uint64_t v42 = *(void *)(a1 + 32);
    if (v42) {
      uint64_t v42 = *(void *)(v42 + 128);
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v65 = v42;
    v43 = "ProxySession <%{public}@> background session setup complete";
  }

  else
  {
    if (!v41) {
      return;
    }
    uint64_t v44 = *(void *)(a1 + 32);
    if (v44) {
      uint64_t v44 = *(void *)(v44 + 128);
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v65 = v44;
    v43 = "BackgroundSession <%{public}@> background session setup complete";
  }

  _os_log_impl(&dword_18298D000, v40, OS_LOG_TYPE_DEFAULT, v43, buf, 0xCu);
}

void __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke_59(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    int v5 = *(void **)(v4 + 112);
  }
  else {
    int v5 = 0LL;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  BOOL v7 = (os_log_s *)CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (v9) {
        uint64_t v9 = *(void *)(v9 + 128);
      }
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = a2;
      int v10 = "ProxySession <%{public}@> An error occurred on the xpc connection requesting pending callbacks for the backg"
            "round session: %@";
LABEL_15:
      _os_log_error_impl(&dword_18298D000, v7, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x16u);
    }
  }

  else if (v8)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      uint64_t v11 = *(void *)(v11 + 128);
    }
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    uint64_t v15 = a2;
    int v10 = "BackgroundSession <%{public}@> An error occurred on the xpc connection requesting pending callbacks for the ba"
          "ckground session: %@";
    goto LABEL_15;
  }

void __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke_60(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    int v3 = *(void **)(v2 + 112);
  }
  else {
    int v3 = 0LL;
  }
  int v4 = [v3 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  int v5 = (os_log_s *)CFNLog::logger;
  BOOL v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6) {
      goto LABEL_15;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      uint64_t v7 = *(void *)(v7 + 128);
    }
    LODWORD(v12) = 138543362;
    *(void *)((char *)&v12 + 4) = v7;
    BOOL v8 = "ProxySession <%{public}@> Reconnection to existing session and state complete";
  }

  else
  {
    if (!v6) {
      goto LABEL_15;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    LODWORD(v12) = 138543362;
    *(void *)((char *)&v12 + 4) = v9;
    BOOL v8 = "BackgroundSession <%{public}@> Reconnection to existing session and state complete";
  }

  _os_log_impl(&dword_18298D000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 0xCu);
LABEL_15:
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    uint64_t v11 = *(dispatch_queue_s **)(v10 + 120);
    *(void *)&__int128 v12 = MEMORY[0x1895F87A8];
    *((void *)&v12 + 1) = 3221225472LL;
    uint64_t v13 = __49____NSURLBackgroundSession_failDisconnectedTasks__block_invoke;
    __int16 v14 = &unk_189C1A548;
    uint64_t v15 = v10;
    dispatch_async(v11, &v12);
  }

uint64_t __49____NSURLBackgroundSession_failDisconnectedTasks__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 192LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    uint64_t v6 = *MEMORY[0x189607740];
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        uint64_t v9 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), [v8 unsignedIntegerValue]);
        uint64_t v10 = *(void *)(a1 + 32);
        if (v10) {
          uint64_t v11 = *(void **)(v10 + 112);
        }
        else {
          uint64_t v11 = 0LL;
        }
        if ([v11 _allowsRetryForBackgroundDataTasks]
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          -[__NSURLBackgroundSession _onqueue_retryDataTaskWithIdentifier:]( *(void *)(a1 + 32),  [v8 unsignedIntegerValue]);
        }

        else
        {
          uint64_t v12 = *(void *)(a1 + 32);
          if ([v9 _isAVAssetTask]) {
            uint64_t v13 = 0LL;
          }
          else {
            uint64_t v13 = objc_msgSend((id)objc_msgSend(v9, "currentRequest"), "URL");
          }
          if (v12) {
            uint64_t v14 = objc_msgSend(MEMORY[0x189607870], "_web_errorWithDomain:code:URL:", v6, -997, v13);
          }
          else {
            uint64_t v14 = 0LL;
          }
          objc_msgSend(v9, "_onqueue_didFinishWithError:", v14);
        }

        ++v7;
      }

      while (v4 != v7);
      uint64_t v15 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v4 = v15;
    }

    while (v15);
  }

  return [*(id *)(*(void *)(a1 + 32) + 192) removeAllObjects];
}

void __65____NSURLBackgroundSession__onqueue_retryDataTaskWithIdentifier___block_invoke(uint64_t a1, char a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      uint64_t v4 = *(void **)(v3 + 112);
    }
    else {
      uint64_t v4 = 0LL;
    }
    int v5 = [v4 _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v6 = (os_log_s *)CFNLog::logger;
    BOOL v7 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v7)
      {
        uint64_t v8 = *(void *)(a1 + 32);
        if (v8) {
          uint64_t v8 = *(void *)(v8 + 128);
        }
        uint64_t v9 = *(void *)(a1 + 40);
        int v13 = 138543618;
        uint64_t v14 = v8;
        __int16 v15 = 2048;
        uint64_t v16 = v9;
        uint64_t v10 = "ProxySession <%{public}@> failed to retry background data task with identifier %lu";
LABEL_16:
        _os_log_error_impl(&dword_18298D000, v6, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v13, 0x16u);
      }
    }

    else if (v7)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      if (v11) {
        uint64_t v11 = *(void *)(v11 + 128);
      }
      uint64_t v12 = *(void *)(a1 + 40);
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2048;
      uint64_t v16 = v12;
      uint64_t v10 = "BackgroundSession <%{public}@> failed to retry background data task with identifier %lu";
      goto LABEL_16;
    }
  }

void __50____NSURLBackgroundSession_recreateExistingTasks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = [a2 unsignedIntegerValue];
  if (objc_msgSend( *(id *)(*(void *)(a1 + 32) + 184),  "objectForKeyedSubscript:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(a3, "identifier"))))
  {
    uint64_t v6 = (void *)objc_msgSend( *(id *)(*(void *)(a1 + 32) + 184),  "objectForKeyedSubscript:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(a3, "identifier")));
    objc_msgSend(v6, "setCountOfBytesReceived:", objc_msgSend(a3, "countOfBytesReceived"));
    objc_msgSend(v6, "setCountOfBytesExpectedToReceive:", objc_msgSend(a3, "countOfBytesExpectedToReceive"));
    objc_msgSend(v6, "setCountOfBytesSent:", objc_msgSend(a3, "countOfBytesSent"));
    objc_msgSend(v6, "setCountOfBytesExpectedToSend:", objc_msgSend(a3, "countOfBytesExpectedToSend"));
    if ([a3 taskKind] != 3 && objc_msgSend(a3, "taskKind") != 5)
    {
      objc_msgSend(v6, "setResponse:", objc_msgSend(a3, "response"));
      objc_msgSend(v6, "updateCurrentRequest:", objc_msgSend(a3, "currentRequest"));
    }

    return;
  }

  if ([a3 taskKind])
  {
    if ([a3 taskKind] == 1)
    {
      BOOL v7 = off_189BFE238;
    }

    else if ([a3 taskKind] == 2)
    {
      BOOL v7 = off_189BFE228;
    }

    else if ([a3 taskKind] == 3)
    {
      BOOL v7 = off_189BFE220;
    }

    else if ([a3 taskKind] == 5)
    {
      BOOL v7 = off_189BFE218;
    }

    else
    {
      if ([a3 taskKind] != 4)
      {
        uint64_t v8 = 0LL;
        goto LABEL_18;
      }

      BOOL v7 = off_189BFE210;
    }
  }

  else
  {
    BOOL v7 = off_189BFE230;
  }

  uint64_t v8 = (void *)objc_msgSend( objc_alloc(*v7),  "initWithTaskInfo:taskGroup:ident:",  a3,  objc_msgSend(*(id *)(a1 + 32), "defaultTaskGroup"),  v5);
LABEL_18:
  uint64_t v9 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v8, "taskIdentifier"));
  if (v8) {
    [*(id *)(*(void *)(a1 + 32) + 184) setObject:v8 forKeyedSubscript:v9];
  }

  uint64_t v10 = *(void *)(a1 + 32);
  unint64_t v11 = *(void *)(v10 + 160);
  if (v5 >= v11) {
    unint64_t v11 = v5 + 1;
  }
  *(void *)(v10 + 160) = v11;
}

void __46____NSURLBackgroundSession_setupXPCConnection__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(dispatch_queue_s **)(v1 + 120);
  }
  else {
    uint64_t v2 = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __46____NSURLBackgroundSession_setupXPCConnection__block_invoke_2;
  block[3] = &unk_189C1A548;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __46____NSURLBackgroundSession_setupXPCConnection__block_invoke_2_18(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 112);
  }
  else {
    uint64_t v3 = 0LL;
  }
  int v4 = [v3 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  unint64_t v5 = (os_log_s *)CFNLog::logger;
  BOOL v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6) {
      return;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      uint64_t v7 = *(void *)(v7 + 128);
    }
    int v10 = 138543362;
    uint64_t v11 = v7;
    uint64_t v8 = "ProxySession <%{public}@> connection to background transfer daemon invalidated";
  }

  else
  {
    if (!v6) {
      return;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    int v10 = 138543362;
    uint64_t v11 = v9;
    uint64_t v8 = "BackgroundSession <%{public}@> connection to background transfer daemon invalidated";
  }

  _os_log_impl(&dword_18298D000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
}

void __46____NSURLBackgroundSession_setupXPCConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 112);
  }
  else {
    uint64_t v3 = 0LL;
  }
  int v4 = [v3 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  unint64_t v5 = (os_log_s *)CFNLog::logger;
  BOOL v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6) {
      goto LABEL_15;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      uint64_t v7 = *(void *)(v7 + 128);
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v7;
    uint64_t v8 = "ProxySession <%{public}@> connection to background transfer daemon interrupted";
  }

  else
  {
    if (!v6) {
      goto LABEL_15;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v9;
    uint64_t v8 = "BackgroundSession <%{public}@> connection to background transfer daemon interrupted";
  }

  _os_log_impl(&dword_18298D000, v5, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
LABEL_15:
  [*(id *)(*(void *)(a1 + 32) + 176) invalidate];

  *(void *)(*(void *)(a1 + 32) + 176LL) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 168LL) = 0LL;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    uint64_t v11 = *(void **)(v10 + 112);
  }
  else {
    uint64_t v11 = 0LL;
  }
  int v12 = [v11 _isProxySession];
  uint64_t v13 = *(void *)(a1 + 32);
  if (v12)
  {
    -[__NSURLBackgroundSession setupXPCConnection](v13);
    -[__NSURLBackgroundSession setupBackgroundSession](*(void *)(a1 + 32));
    uint64_t v14 = *(void *)(a1 + 32);
    if (*(void *)(v14 + 216)) {
      -[__NSURLBackgroundSession sendInvalidationRequest](v14);
    }
  }

  else
  {
    *(_BYTE *)(v13 + 280) = 1;
    uint64_t v15 = *(void *)(a1 + 32);
    if (*(_BYTE *)(v15 + 281))
    {
      *(_BYTE *)(v15 + 281) = 0;
      uint64_t v16 = *(void *)(a1 + 32);
      if (v16) {
        uint64_t v17 = *(dispatch_queue_s **)(v16 + 120);
      }
      else {
        uint64_t v17 = 0LL;
      }
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __46____NSURLBackgroundSession_setupXPCConnection__block_invoke_16;
      block[3] = &unk_189C1A548;
      block[4] = v16;
      dispatch_async(v17, block);
    }
  }

uint64_t __46____NSURLBackgroundSession_setupXPCConnection__block_invoke_16(uint64_t a1)
{
  return -[__NSURLBackgroundSession ensureRemoteSession](*(void *)(a1 + 32));
}

void __68____NSURLBackgroundSession_backgroundSessionDidFinishAppWake_reply___block_invoke(uint64_t *a1)
{
  uint64_t v83 = *MEMORY[0x1895F89C0];
  if (![(id)a1[4] appWakeUUID]
    || !objc_msgSend((id)a1[5], "isEqualToString:", objc_msgSend((id)a1[4], "appWakeUUID")))
  {
    uint64_t v14 = a1[4];
    if (v14) {
      uint64_t v15 = *(void **)(v14 + 112);
    }
    else {
      uint64_t v15 = 0LL;
    }
    int v16 = [v15 _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v17 = (os_log_s *)CFNLog::logger;
    BOOL v18 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG);
    if (v16)
    {
      if (v18)
      {
        __int128 v19 = (void *)a1[4];
        if (v19) {
          uint64_t v20 = v19[16];
        }
        else {
          uint64_t v20 = 0LL;
        }
        uint64_t v21 = [v19 appWakeUUID];
        uint64_t v22 = a1[4];
        uint64_t v23 = a1[5];
        if (v22) {
          v24 = *(void **)(v22 + 112);
        }
        else {
          v24 = 0LL;
        }
        *(_DWORD *)buf = 138544386;
        *(void *)v76 = v20;
        *(_WORD *)&v76[8] = 2112;
        *(void *)&v76[10] = v21;
        __int16 v77 = 2112;
        uint64_t v78 = v23;
        __int16 v79 = 2112;
        uint64_t v80 = v22;
        __int16 v81 = 2112;
        uint64_t v82 = [v24 identifier];
        uint64_t v25 = "ProxySession <%{public}@> appWakeUUID %@ does not match uuid %@ for session %@ with identifier %@";
LABEL_74:
        _os_log_debug_impl(&dword_18298D000, v17, OS_LOG_TYPE_DEBUG, v25, buf, 0x34u);
      }
    }

    else if (v18)
    {
      v64 = (void *)a1[4];
      if (v64) {
        uint64_t v65 = v64[16];
      }
      else {
        uint64_t v65 = 0LL;
      }
      uint64_t v66 = [v64 appWakeUUID];
      uint64_t v67 = a1[4];
      uint64_t v68 = a1[5];
      if (v67) {
        uint64_t v69 = *(void **)(v67 + 112);
      }
      else {
        uint64_t v69 = 0LL;
      }
      *(_DWORD *)buf = 138544386;
      *(void *)v76 = v65;
      *(_WORD *)&v76[8] = 2112;
      *(void *)&v76[10] = v66;
      __int16 v77 = 2112;
      uint64_t v78 = v68;
      __int16 v79 = 2112;
      uint64_t v80 = v67;
      __int16 v81 = 2112;
      uint64_t v82 = [v69 identifier];
      uint64_t v25 = "BackgroundSession <%{public}@> appWakeUUID %@ does not match uuid %@ for session %@ with identifier %@";
      goto LABEL_74;
    }

    (*(void (**)(void))(a1[6] + 16))();
    return;
  }

  v70[0] = MEMORY[0x1895F87A8];
  v70[1] = 3221225472LL;
  v71 = __68____NSURLBackgroundSession_backgroundSessionDidFinishAppWake_reply___block_invoke_2;
  v72 = &unk_189C079D0;
  __int128 v73 = *((_OWORD *)a1 + 2);
  uint64_t v74 = a1[6];
  uint64_t v2 = [*(id *)(v73 + 200) count];
  uint64_t v3 = a1[4];
  if (v3) {
    int v4 = *(void **)(v3 + 112);
  }
  else {
    int v4 = 0LL;
  }
  int v5 = [v4 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  BOOL v6 = (os_log_s *)CFNLog::logger;
  BOOL v7 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (!v2)
  {
    if (v5)
    {
      if (v7)
      {
        uint64_t v26 = a1[4];
        if (v26)
        {
          uint64_t v27 = *(void *)(v26 + 128);
          v28 = *(void **)(v26 + 112);
        }

        else
        {
          uint64_t v27 = 0LL;
          v28 = 0LL;
        }

        uint64_t v29 = a1[5];
        *(_DWORD *)buf = 138544130;
        *(void *)v76 = v27;
        *(_WORD *)&v76[8] = 2112;
        *(void *)&v76[10] = v29;
        __int16 v77 = 2112;
        uint64_t v78 = v26;
        __int16 v79 = 2112;
        uint64_t v80 = [v28 identifier];
        uint64_t v30 = "ProxySession <%{public}@> no outstanding tasks getting auth headers, finishing wake up for uuid %@ for ses"
              "sion %@ with identifier %@";
LABEL_67:
        _os_log_impl(&dword_18298D000, v6, OS_LOG_TYPE_DEFAULT, v30, buf, 0x2Au);
      }
    }

    else if (v7)
    {
      uint64_t v60 = a1[4];
      if (v60)
      {
        uint64_t v61 = *(void *)(v60 + 128);
        __int128 v62 = *(void **)(v60 + 112);
      }

      else
      {
        uint64_t v61 = 0LL;
        __int128 v62 = 0LL;
      }

      uint64_t v63 = a1[5];
      *(_DWORD *)buf = 138544130;
      *(void *)v76 = v61;
      *(_WORD *)&v76[8] = 2112;
      *(void *)&v76[10] = v63;
      __int16 v77 = 2112;
      uint64_t v78 = v60;
      __int16 v79 = 2112;
      uint64_t v80 = [v62 identifier];
      uint64_t v30 = "BackgroundSession <%{public}@> no outstanding tasks getting auth headers, finishing wake up for uuid %@ for "
            "session %@ with identifier %@";
      goto LABEL_67;
    }

    v71(v70, 1);
    return;
  }

  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = a1[4];
      if (v8)
      {
        uint64_t v9 = *(void *)(v8 + 128);
        uint64_t v10 = *(void **)(v8 + 112);
      }

      else
      {
        uint64_t v9 = 0LL;
        uint64_t v10 = 0LL;
      }

      uint64_t v11 = [v10 identifier];
      uint64_t v12 = *(void *)(a1[4] + 200);
      *(_DWORD *)buf = 138544130;
      *(void *)v76 = v9;
      *(_WORD *)&v76[8] = 2112;
      *(void *)&v76[10] = v8;
      __int16 v77 = 2112;
      uint64_t v78 = v11;
      __int16 v79 = 2112;
      uint64_t v80 = v12;
      uint64_t v13 = "ProxySession <%{public}@> Have outstanding tasks getting auth headers for session %@ with identifier %@ outs"
            "tanding auth tasks %@";
LABEL_36:
      _os_log_impl(&dword_18298D000, v6, OS_LOG_TYPE_DEFAULT, v13, buf, 0x2Au);
    }
  }

  else if (v7)
  {
    uint64_t v31 = a1[4];
    if (v31)
    {
      uint64_t v32 = *(void *)(v31 + 128);
      v33 = *(void **)(v31 + 112);
    }

    else
    {
      uint64_t v32 = 0LL;
      v33 = 0LL;
    }

    uint64_t v34 = [v33 identifier];
    uint64_t v35 = *(void *)(a1[4] + 200);
    *(_DWORD *)buf = 138544130;
    *(void *)v76 = v32;
    *(_WORD *)&v76[8] = 2112;
    *(void *)&v76[10] = v31;
    __int16 v77 = 2112;
    uint64_t v78 = v34;
    __int16 v79 = 2112;
    uint64_t v80 = v35;
    uint64_t v13 = "BackgroundSession <%{public}@> Have outstanding tasks getting auth headers for session %@ with identifier %@ o"
          "utstanding auth tasks %@";
    goto LABEL_36;
  }

  uint64_t v36 = a1[4];
  uint64_t v37 = *(void *)(v36 + 224);
  if (!v37
    || ((unint64_t v39 = *(void *)(v37 + 8), v38 = *(void *)(v37 + 16), v41 = v38 == 0, v40 = v38 & 1 | v39, !v41)
      ? (BOOL v41 = v40 == 0)
      : (BOOL v41 = 1),
        v41 ? (char v42 = 0) : (char v42 = 1),
        (uint64_t (*)())v39 == BlockHolderVar<BOOL>::invoke_reseted && (v42 & 1) == 0))
  {
    int v43 = [*(id *)(v36 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v44 = (os_log_s *)CFNLog::logger;
    BOOL v45 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
    if (v43)
    {
      if (!v45) {
        goto LABEL_58;
      }
      uint64_t v46 = a1[4];
      if (v46)
      {
        uint64_t v47 = *(void *)(v46 + 128);
        v48 = *(void **)(v46 + 112);
      }

      else
      {
        uint64_t v47 = 0LL;
        v48 = 0LL;
      }

      uint64_t v49 = a1[5];
      uint64_t v50 = [v48 identifier];
      *(_DWORD *)buf = 138544130;
      *(void *)v76 = v47;
      *(_WORD *)&v76[8] = 2112;
      *(void *)&v76[10] = v49;
      __int16 v77 = 2112;
      uint64_t v78 = v46;
      __int16 v79 = 2112;
      uint64_t v80 = v50;
      uint64_t v51 = "ProxySession <%{public}@> Storing work to do when ready to wake app for uuid %@ for session %@ with identifier %@";
    }

    else
    {
      if (!v45) {
        goto LABEL_58;
      }
      uint64_t v52 = a1[4];
      if (v52)
      {
        uint64_t v53 = *(void *)(v52 + 128);
        v54 = *(void **)(v52 + 112);
      }

      else
      {
        uint64_t v53 = 0LL;
        v54 = 0LL;
      }

      uint64_t v55 = a1[5];
      uint64_t v56 = [v54 identifier];
      *(_DWORD *)buf = 138544130;
      *(void *)v76 = v53;
      *(_WORD *)&v76[8] = 2112;
      *(void *)&v76[10] = v55;
      __int16 v77 = 2112;
      uint64_t v78 = v52;
      __int16 v79 = 2112;
      uint64_t v80 = v56;
      uint64_t v51 = "BackgroundSession <%{public}@> Storing work to do when ready to wake app for uuid %@ for session %@ with identifier %@";
    }

    _os_log_impl(&dword_18298D000, v44, OS_LOG_TYPE_DEFAULT, v51, buf, 0x2Au);
LABEL_58:
    SmartBlockWithArgs<BOOL>::SmartBlockWithArgs(buf, v70);
    std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100](a1[4] + 224, (__int128 *)buf);
    v57 = *(std::__shared_weak_count **)&v76[4];
    if (*(void *)&v76[4])
    {
      uint64_t v58 = (unint64_t *)(*(void *)&v76[4] + 8LL);
      do
        unint64_t v59 = __ldaxr(v58);
      while (__stlxr(v59 - 1, v58));
      if (!v59)
      {
        ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
        std::__shared_weak_count::__release_weak(v57);
      }
    }
  }

uint64_t __68____NSURLBackgroundSession_backgroundSessionDidFinishAppWake_reply___block_invoke_2( void *a1,  int a2)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  uint64_t v4 = a1[4];
  if (v4) {
    int v5 = *(void **)(v4 + 112);
  }
  else {
    int v5 = 0LL;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  BOOL v7 = (os_log_s *)CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_15;
    }
    uint64_t v9 = a1[4];
    if (v9)
    {
      uint64_t v10 = *(void *)(v9 + 128);
      uint64_t v11 = *(void **)(v9 + 112);
    }

    else
    {
      uint64_t v10 = 0LL;
      uint64_t v11 = 0LL;
    }

    uint64_t v12 = a1[5];
    *(_DWORD *)unint64_t v39 = 138544386;
    *(void *)&v39[4] = v10;
    *(_WORD *)&v39[12] = 2112;
    *(void *)&v39[14] = v12;
    *(_WORD *)&v39[22] = 2112;
    uint64_t v40 = v9;
    *(_WORD *)BOOL v41 = 2112;
    *(void *)&v41[2] = [v11 identifier];
    *(_WORD *)&v41[10] = 1024;
    *(_DWORD *)&v41[12] = a2;
    uint64_t v13 = "ProxySession <%{public}@> Ready to wake app for uuid %@ for session %@ with identifier %@ invoked=%d";
  }

  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    uint64_t v14 = a1[4];
    if (v14)
    {
      uint64_t v15 = *(void *)(v14 + 128);
      int v16 = *(void **)(v14 + 112);
    }

    else
    {
      uint64_t v15 = 0LL;
      int v16 = 0LL;
    }

    uint64_t v17 = a1[5];
    *(_DWORD *)unint64_t v39 = 138544386;
    *(void *)&v39[4] = v15;
    *(_WORD *)&v39[12] = 2112;
    *(void *)&v39[14] = v17;
    *(_WORD *)&v39[22] = 2112;
    uint64_t v40 = v14;
    *(_WORD *)BOOL v41 = 2112;
    *(void *)&v41[2] = [v16 identifier];
    *(_WORD *)&v41[10] = 1024;
    *(_DWORD *)&v41[12] = a2;
    uint64_t v13 = "BackgroundSession <%{public}@> Ready to wake app for uuid %@ for session %@ with identifier %@ invoked=%d";
  }

  _os_log_impl(&dword_18298D000, v7, OS_LOG_TYPE_DEFAULT, v13, v39, 0x30u);
LABEL_15:
  BOOL v18 = (void *)a1[4];
  if (!a2)
  {
    if (v18) {
      BOOL v18 = (void *)v18[14];
    }
    int v22 = objc_msgSend(v18, "_isProxySession", *(_OWORD *)v39, *(void *)&v39[16], v40, *(_OWORD *)v41);
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v23 = (os_log_s *)CFNLog::logger;
    BOOL v24 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (!v24) {
        return (*(uint64_t (**)(void))(a1[6] + 16LL))();
      }
      uint64_t v25 = a1[4];
      if (v25)
      {
        uint64_t v26 = *(void *)(v25 + 128);
        uint64_t v27 = *(void **)(v25 + 112);
      }

      else
      {
        uint64_t v26 = 0LL;
        uint64_t v27 = 0LL;
      }

      uint64_t v28 = a1[5];
      uint64_t v29 = [v27 identifier];
      uint64_t v30 = *(void *)(a1[4] + 200LL);
      *(_DWORD *)unint64_t v39 = 138544386;
      *(void *)&v39[4] = v26;
      *(_WORD *)&v39[12] = 2112;
      *(void *)&v39[14] = v28;
      *(_WORD *)&v39[22] = 2112;
      uint64_t v40 = v25;
      *(_WORD *)BOOL v41 = 2112;
      *(void *)&v41[2] = v29;
      *(_WORD *)&v41[10] = 2112;
      *(void *)&v41[12] = v30;
      uint64_t v31 = "ProxySession <%{public}@> backgroundSessionDidFinishAppWake block not invoked for UUID %@ for session %@ wit"
            "h identifier %@ outstanding auth tasks %@";
    }

    else
    {
      if (!v24) {
        return (*(uint64_t (**)(void))(a1[6] + 16LL))();
      }
      uint64_t v33 = a1[4];
      if (v33)
      {
        uint64_t v34 = *(void *)(v33 + 128);
        uint64_t v35 = *(void **)(v33 + 112);
      }

      else
      {
        uint64_t v34 = 0LL;
        uint64_t v35 = 0LL;
      }

      uint64_t v36 = a1[5];
      uint64_t v37 = [v35 identifier];
      uint64_t v38 = *(void *)(a1[4] + 200LL);
      *(_DWORD *)unint64_t v39 = 138544386;
      *(void *)&v39[4] = v34;
      *(_WORD *)&v39[12] = 2112;
      *(void *)&v39[14] = v36;
      *(_WORD *)&v39[22] = 2112;
      uint64_t v40 = v33;
      *(_WORD *)BOOL v41 = 2112;
      *(void *)&v41[2] = v37;
      *(_WORD *)&v41[10] = 2112;
      *(void *)&v41[12] = v38;
      uint64_t v31 = "BackgroundSession <%{public}@> backgroundSessionDidFinishAppWake block not invoked for UUID %@ for session %"
            "@ with identifier %@ outstanding auth tasks %@";
    }

    _os_log_error_impl(&dword_18298D000, v23, OS_LOG_TYPE_ERROR, v31, v39, 0x34u);
    return (*(uint64_t (**)(void))(a1[6] + 16LL))();
  }

  [v18 setAppWakeUUID:0];
  uint64_t v20 = a1[4];
  if (v20) {
    uint64_t v21 = *(void *)(v20 + 72);
  }
  else {
    uint64_t v21 = 0LL;
  }
  -[__NSCFURLSessionDelegateWrapper didFinishEventsForBackgroundURLSession](v21, v19);
  return (*(uint64_t (**)(void))(a1[6] + 16LL))();
}

uint64_t __67____NSURLBackgroundSession_backgroundSessionDidStartAppWake_reply___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if ([*(id *)(a1 + 32) appWakeUUID])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2) {
      uint64_t v3 = *(void **)(v2 + 112);
    }
    else {
      uint64_t v3 = 0LL;
    }
    int v4 = [v3 _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    int v5 = (os_log_s *)CFNLog::logger;
    BOOL v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v6)
      {
        uint64_t v10 = *(void **)(a1 + 32);
        if (v10) {
          uint64_t v11 = v10[16];
        }
        else {
          uint64_t v11 = 0LL;
        }
        uint64_t v12 = *(void *)(a1 + 40);
        int v18 = 138543874;
        uint64_t v19 = v11;
        __int16 v20 = 2112;
        uint64_t v21 = v12;
        __int16 v22 = 2112;
        uint64_t v23 = [v10 appWakeUUID];
        uint64_t v13 = "ProxySession <%{public}@> backgroundSessionDidStartAppWake: called with ID: %@, when we already had an app"
              " wake with ID: %@";
LABEL_17:
        _os_log_debug_impl(&dword_18298D000, v5, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v18, 0x20u);
      }
    }

    else if (v6)
    {
      uint64_t v15 = *(void **)(a1 + 32);
      if (v15) {
        uint64_t v16 = v15[16];
      }
      else {
        uint64_t v16 = 0LL;
      }
      uint64_t v17 = *(void *)(a1 + 40);
      int v18 = 138543874;
      uint64_t v19 = v16;
      __int16 v20 = 2112;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      uint64_t v23 = [v15 appWakeUUID];
      uint64_t v13 = "BackgroundSession <%{public}@> backgroundSessionDidStartAppWake: called with ID: %@, when we already had an "
            "app wake with ID: %@";
      goto LABEL_17;
    }
  }

  else
  {
    [*(id *)(a1 + 32) setAppWakeUUID:*(void *)(a1 + 40)];
  }

  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  v7,  v8,  v9);
}

uint64_t __105____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didFinishDownloadForMediaSelectionPropertyList___block_invoke( uint64_t a1)
{
  return objc_msgSend( -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 48)),  "_onqueue_didFinishDownloadforMediaSelectionPropertyList:",  *(void *)(a1 + 40));
}

uint64_t __85____NSURLBackgroundSession_backgroundAVAssetDownloadTask_willDownloadVariants_reply___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t __76____NSURLBackgroundSession_backgroundAVAssetDownloadTask_willDownloadToURL___block_invoke( uint64_t a1)
{
  return objc_msgSend( -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 48)),  "_onqueue_willDownloadToURL:",  *(void *)(a1 + 40));
}

uint64_t __100____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didResolveMediaSelectionProperyList_reply___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t __151____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelectionPropertyList___block_invoke( uint64_t a1)
{
  return objc_msgSend( -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 72)),  "_onqueue_didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelectionPropertyList:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 64));
}

void __82____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didReceiveDownloadToken___block_invoke( uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40));
  [v2 setAVAssetDownloadToken:*(void *)(a1 + 48)];
  if (*(void *)(a1 + 32))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v3 = *(void *)(a1 + 32);
      if (v3)
      {
        uint64_t v4 = *(void *)(a1 + 48);
        v6[0] = MEMORY[0x1895F87A8];
        v6[1] = 3221225472LL;
        v6[2] = __69__NSURLSession_delegate_AVAssetDownloadTask_didReceiveDownloadToken___block_invoke;
        v6[3] = &unk_189C13670;
        int v5 = *(dispatch_queue_s **)(v3 + 88);
        v6[4] = *(void *)(v3 + 96);
        v6[5] = v3;
        v6[6] = v2;
        v6[7] = v4;
        if (v5) {
          dispatch_async(v5, v6);
        }
        else {
          [*(id *)(v3 + 80) addOperationWithBlock:v6];
        }
      }
    }
  }

uint64_t __119____NSURLBackgroundSession_backgroundAVAssetDownloadTaskDidUpdateProgress_totalBytesWritten_totalBytesExpectedToWrite___block_invoke( uint64_t a1)
{
  return objc_msgSend( -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40)),  "_onqueue_didReceiveProgressUpdateWithTotalBytesWritten:totalBytesExpectedToWrite:",  *(void *)(a1 + 48),  *(void *)(a1 + 56));
}

void __88____NSURLBackgroundSession_backgroundDownloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke( uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40));
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    [v2 setCountOfBytesReceived:v4];
    [v3 setCountOfBytesExpectedToReceive:v5];
    uint64_t v6 = (uint64_t)v3[88];
    if (!v6) {
      uint64_t v6 = (uint64_t)v3[87];
    }
    -[__NSCFURLSessionDelegateWrapper downloadTask:didResumeAtOffset:expectedTotalBytes:](v6, v3, v4, v5);
  }

void __108____NSURLBackgroundSession_backgroundDownloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke( uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40));
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    [v2 setCountOfBytesReceived:v5];
    [v3 setCountOfBytesExpectedToReceive:v6];
    uint64_t v7 = (uint64_t)v3[88];
    if (!v7) {
      uint64_t v7 = (uint64_t)v3[87];
    }
    -[__NSCFURLSessionDelegateWrapper downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:completionHandler:]( v7,  v3,  v4,  v5,  v6,  &__block_literal_global_6794);
  }

uint64_t __92____NSURLBackgroundSession_backgroundDownloadTask_didFinishDownloadingToURL_response_reply___block_invoke( uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 64));
  [v2 setResponse:*(void *)(a1 + 40)];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v2)
    {
      uint64_t v3 = *(void **)(a1 + 48);
      uint64_t v4 = (uint64_t)v2[88];
      if (!v4) {
        uint64_t v4 = (uint64_t)v2[87];
      }
      *(void *)uint64_t v24 = MEMORY[0x1895F87A8];
      *(void *)&v24[8] = 3221225472LL;
      *(void *)&v24[16] = __67____NSCFBackgroundDownloadTask__onqueue_didFinishDownloadingToURL___block_invoke;
      *(void *)&__int128 v25 = &unk_189C1A270;
      *((void *)&v25 + 1) = v2;
      uint64_t v26 = v3;
      -[__NSCFURLSessionDelegateWrapper downloadTask:didFinishDownloadingToURL:completionHandler:](v4, v2, v3, v24);
    }
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "_onqueue_didFinishDownloadingToURL:", *(void *)(a1 + 48));
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[__NSCFBackgroundDataTask _onqueue_didReceiveData:withCompletion:]( v2,  (void *)objc_msgSend(MEMORY[0x189603F48], "dataWithContentsOfFile:", objc_msgSend(*(id *)(a1 + 48), "path")),  &__block_literal_global_179);
        if (unlink((const char *)[*(id *)(a1 + 48) fileSystemRepresentation]))
        {
          uint64_t v5 = *(void *)(a1 + 32);
          if (v5) {
            uint64_t v6 = *(void **)(v5 + 112);
          }
          else {
            uint64_t v6 = 0LL;
          }
          int v7 = [v6 _isProxySession];
          if (CFNLog::onceToken != -1) {
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
          }
          uint64_t v8 = (os_log_s *)CFNLog::logger;
          BOOL v9 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
          if (v7)
          {
            if (!v9) {
              return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
            }
            uint64_t v10 = *(void *)(a1 + 32);
            if (v10) {
              uint64_t v11 = *(void *)(v10 + 128);
            }
            else {
              uint64_t v11 = 0LL;
            }
            uint64_t v12 = [*(id *)(a1 + 48) fileSystemRepresentation];
            int v13 = *__error();
            uint64_t v14 = __error();
            uint64_t v15 = strerror(*v14);
            *(_DWORD *)uint64_t v24 = 138544130;
            *(void *)&v24[4] = v11;
            *(_WORD *)&v24[12] = 2080;
            *(void *)&v24[14] = v12;
            *(_WORD *)&v24[22] = 1024;
            LODWORD(v25) = v13;
            WORD2(v25) = 2080;
            *(void *)((char *)&v25 + 6) = v15;
            uint64_t v16 = "ProxySession <%{public}@> FAILED to UNLINK download file: %s, errno:%d, desc: %s";
          }

          else
          {
            if (!v9) {
              return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
            }
            uint64_t v18 = *(void *)(a1 + 32);
            if (v18) {
              uint64_t v19 = *(void *)(v18 + 128);
            }
            else {
              uint64_t v19 = 0LL;
            }
            uint64_t v20 = [*(id *)(a1 + 48) fileSystemRepresentation];
            int v21 = *__error();
            __int16 v22 = __error();
            uint64_t v23 = strerror(*v22);
            *(_DWORD *)uint64_t v24 = 138544130;
            *(void *)&v24[4] = v19;
            *(_WORD *)&v24[12] = 2080;
            *(void *)&v24[14] = v20;
            *(_WORD *)&v24[22] = 1024;
            LODWORD(v25) = v21;
            WORD2(v25) = 2080;
            *(void *)((char *)&v25 + 6) = v23;
            uint64_t v16 = "BackgroundSession <%{public}@> FAILED to UNLINK download file: %s, errno:%d, desc: %s";
          }

          _os_log_error_impl(&dword_18298D000, v8, OS_LOG_TYPE_ERROR, v16, v24, 0x26u);
        }
      }
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void __85____NSURLBackgroundSession_willRetryBackgroundDataTask_withError_transactionMetrics___block_invoke( uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 56));
  objc_msgSend(v2, "set_backgroundTransactionMetrics:", *(void *)(a1 + 40));
  [v2 _logUnlistedTracker:*(void *)(a1 + 40)];
  if (v2)
  {
    -[__NSCFBackgroundDataTask _onqueue_finishStream:]((uint64_t)v2, 1u);
    uint64_t v3 = (uint64_t)v2[88];
    if (!v3) {
      uint64_t v3 = (uint64_t)v2[87];
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  -[__NSCFURLSessionDelegateWrapper _willRetryBackgroundDataTask:withError:](v3, v2, *(void **)(a1 + 48));
}

void __68____NSURLBackgroundSession_backgroundDataTaskDidBecomeDownloadTask___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x189607968] numberWithUnsignedInteger:*(void *)(a1 + 40)];
  uint64_t v3 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40));
  uint64_t v4 =  -[__NSCFBackgroundSessionTask initWithBackgroundTask:]( objc_alloc(&OBJC_CLASS_____NSCFBackgroundDownloadTask),  "initWithBackgroundTask:",  v3);
  [*(id *)(*(void *)(a1 + 32) + 184) setObject:v4 forKeyedSubscript:v2];
  if (v3)
  {
    uint64_t v5 = (uint64_t)v3[88];
    if (!v5) {
      uint64_t v5 = (uint64_t)v3[87];
    }
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  -[__NSCFURLSessionDelegateWrapper dataTask:didBecomeDownloadTask:completionHandler:]( v5,  v3,  v4,  &__block_literal_global_178);
}

uint64_t __75____NSURLBackgroundSession_backgroundTask_getAuthHeadersForResponse_reply___block_invoke( uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 56));
  uint64_t v3 = [MEMORY[0x189607968] numberWithUnsignedInteger:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 200) addObject:v3];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 112);
  }
  else {
    uint64_t v5 = 0LL;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  int v7 = (os_log_s *)CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (v9)
      {
        uint64_t v10 = *(void *)(v9 + 128);
        uint64_t v11 = *(void **)(v9 + 112);
      }

      else
      {
        uint64_t v10 = 0LL;
        uint64_t v11 = 0LL;
      }

      uint64_t v12 = [v11 identifier];
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 200LL);
      *(_DWORD *)buf = 138544386;
      uint64_t v23 = v10;
      __int16 v24 = 2114;
      __int128 v25 = v2;
      __int16 v26 = 2112;
      uint64_t v27 = v9;
      __int16 v28 = 2112;
      uint64_t v29 = v12;
      __int16 v30 = 2112;
      uint64_t v31 = v13;
      uint64_t v14 = "ProxySession <%{public}@> %{public}@ getting auth headers for session %@ with identifier %@ outstanding auth tasks %@";
LABEL_14:
      _os_log_impl(&dword_18298D000, v7, OS_LOG_TYPE_DEFAULT, v14, buf, 0x34u);
    }
  }

  else if (v8)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15)
    {
      uint64_t v16 = *(void *)(v15 + 128);
      uint64_t v17 = *(void **)(v15 + 112);
    }

    else
    {
      uint64_t v16 = 0LL;
      uint64_t v17 = 0LL;
    }

    uint64_t v18 = [v17 identifier];
    uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 200LL);
    *(_DWORD *)buf = 138544386;
    uint64_t v23 = v16;
    __int16 v24 = 2114;
    __int128 v25 = v2;
    __int16 v26 = 2112;
    uint64_t v27 = v15;
    __int16 v28 = 2112;
    uint64_t v29 = v18;
    __int16 v30 = 2112;
    uint64_t v31 = v19;
    uint64_t v14 = "BackgroundSession <%{public}@> %{public}@ getting auth headers for session %@ with identifier %@ outstanding auth tasks %@";
    goto LABEL_14;
  }

  uint64_t v20 = (void *)[v2 authenticator];
  return objc_msgSend( v20,  "getAuthenticationHeadersForTask:task:response:completionHandler:",  MEMORY[0x1895F87A8],  3221225472,  __75____NSURLBackgroundSession_backgroundTask_getAuthHeadersForResponse_reply___block_invoke_176,  &unk_189C07940,  *(void *)(a1 + 32),  v2,  v3,  *(void *)(a1 + 48));
}

void __75____NSURLBackgroundSession_backgroundTask_getAuthHeadersForResponse_reply___block_invoke_176( uint64_t a1,  char a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v4 = *(void *)(v4 + 120);
  }
  block[1] = 3221225472LL;
  __int128 v5 = *(_OWORD *)(a1 + 48);
  __int128 v7 = *(_OWORD *)(a1 + 32);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __75____NSURLBackgroundSession_backgroundTask_getAuthHeadersForResponse_reply___block_invoke_2;
  block[3] = &unk_189C07918;
  char v11 = a2;
  uint64_t v8 = a3;
  uint64_t v9 = a4;
  __int128 v10 = v5;
  dispatch_async((dispatch_queue_t)v4, block);
}

void __75____NSURLBackgroundSession_backgroundTask_getAuthHeadersForResponse_reply___block_invoke_2( uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 112);
  }
  else {
    uint64_t v3 = 0LL;
  }
  int v4 = [v3 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  __int128 v5 = (os_log_s *)CFNLog::logger;
  BOOL v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6) {
      goto LABEL_15;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      uint64_t v10 = *(void *)(v9 + 128);
      char v11 = *(void **)(v9 + 112);
    }

    else
    {
      uint64_t v10 = 0LL;
      char v11 = 0LL;
    }

    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)unint64_t v59 = 138544130;
    *(void *)&v59[4] = v10;
    *(_WORD *)&v59[12] = 2114;
    *(void *)&v59[14] = v12;
    *(_WORD *)&v59[22] = 2112;
    uint64_t v60 = v9;
    LOWORD(v61) = 2112;
    *(void *)((char *)&v61 + 2) = [v11 identifier];
    uint64_t v13 = "ProxySession <%{public}@> %{public}@ finished getting auth headers for session %@ with identifier %@";
  }

  else
  {
    if (!v6) {
      goto LABEL_15;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14)
    {
      uint64_t v15 = *(void *)(v14 + 128);
      uint64_t v16 = *(void **)(v14 + 112);
    }

    else
    {
      uint64_t v15 = 0LL;
      uint64_t v16 = 0LL;
    }

    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)unint64_t v59 = 138544130;
    *(void *)&v59[4] = v15;
    *(_WORD *)&v59[12] = 2114;
    *(void *)&v59[14] = v17;
    *(_WORD *)&v59[22] = 2112;
    uint64_t v60 = v14;
    LOWORD(v61) = 2112;
    *(void *)((char *)&v61 + 2) = [v16 identifier];
    uint64_t v13 = "BackgroundSession <%{public}@> %{public}@ finished getting auth headers for session %@ with identifier %@";
  }

  _os_log_impl(&dword_18298D000, v5, OS_LOG_TYPE_DEFAULT, v13, v59, 0x2Au);
LABEL_15:
  (*(void (**)(void, void, void, void, uint64_t, uint64_t))(*(void *)(a1 + 72) + 16LL))( *(void *)(a1 + 72),  *(unsigned __int8 *)(a1 + 80),  *(void *)(a1 + 48),  *(void *)(a1 + 56),  v7,  v8);
  [*(id *)(*(void *)(a1 + 32) + 200) removeObject:*(void *)(a1 + 64)];
  uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 200) count];
  uint64_t v19 = *(void *)(a1 + 32);
  if (!v18)
  {
    uint64_t v30 = *(void *)(v19 + 224);
    if (!v30) {
      return;
    }
    unint64_t v32 = *(void *)(v30 + 8);
    uint64_t v31 = *(void *)(v30 + 16);
    BOOL v34 = v31 == 0;
    unint64_t v33 = v31 & 1 | v32;
    BOOL v34 = v34 || v33 == 0;
    BOOL v35 = !v34;
    int v37 = [*(id *)(v19 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v38 = (os_log_s *)CFNLog::logger;
    BOOL v39 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
    if (v37)
    {
      if (!v39) {
        goto LABEL_54;
      }
      uint64_t v40 = *(void *)(a1 + 32);
      if (v40)
      {
        uint64_t v41 = *(void *)(v40 + 128);
        uint64_t v42 = *(void **)(v40 + 112);
      }

      else
      {
        uint64_t v41 = 0LL;
        uint64_t v42 = 0LL;
      }

      uint64_t v43 = objc_msgSend(v42, "identifier", *(void *)v59, *(_OWORD *)&v59[8], v60, v61);
      *(_DWORD *)unint64_t v59 = 138543874;
      *(void *)&v59[4] = v41;
      *(_WORD *)&v59[12] = 2112;
      *(void *)&v59[14] = v40;
      *(_WORD *)&v59[22] = 2112;
      uint64_t v60 = v43;
      uint64_t v44 = "ProxySession <%{public}@> All tasks completed getting auth headers, sending did finish app wake for session "
            "%@ with identifier %@";
    }

    else
    {
      if (!v39) {
        goto LABEL_54;
      }
      uint64_t v50 = *(void *)(a1 + 32);
      if (v50)
      {
        uint64_t v51 = *(void *)(v50 + 128);
        uint64_t v52 = *(void **)(v50 + 112);
      }

      else
      {
        uint64_t v51 = 0LL;
        uint64_t v52 = 0LL;
      }

      uint64_t v53 = objc_msgSend(v52, "identifier", *(void *)v59, *(_OWORD *)&v59[8], v60, v61);
      *(_DWORD *)unint64_t v59 = 138543874;
      *(void *)&v59[4] = v51;
      *(_WORD *)&v59[12] = 2112;
      *(void *)&v59[14] = v50;
      *(_WORD *)&v59[22] = 2112;
      uint64_t v60 = v53;
      uint64_t v44 = "BackgroundSession <%{public}@> All tasks completed getting auth headers, sending did finish app wake for ses"
            "sion %@ with identifier %@";
    }

    _os_log_impl(&dword_18298D000, v38, OS_LOG_TYPE_DEFAULT, v44, v59, 0x20u);
LABEL_54:
    uint64_t v54 = *(void *)(*(void *)(a1 + 32) + 224LL);
    if (v54)
    {
      uint64_t v55 = *(void (**)(void *, uint64_t))(v54 + 8);
      uint64_t v56 = *(void *)(v54 + 16);
      v57 = (void *)(v54 + (v56 >> 1));
      if ((v56 & 1) != 0) {
        uint64_t v55 = *(void (**)(void *, uint64_t))(*v57 + v55);
      }
      v55(v57, 1LL);
      uint64_t v58 = *(void *)(*(void *)(a1 + 32) + 224LL);
      if (v58)
      {
        *(void *)(v58 + 8) = BlockHolderVar<BOOL>::invoke_reseted;
        *(void *)(v58 + 16) = 0LL;
      }
    }

    return;
  }

  if (v19) {
    uint64_t v20 = *(void **)(v19 + 112);
  }
  else {
    uint64_t v20 = 0LL;
  }
  int v21 = objc_msgSend(v20, "_isProxySession", *(_OWORD *)v59, *(void *)&v59[16], v60, v61);
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  __int16 v22 = (os_log_s *)CFNLog::logger;
  BOOL v23 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (!v23) {
      return;
    }
    uint64_t v24 = *(void *)(a1 + 32);
    if (v24)
    {
      uint64_t v25 = *(void *)(v24 + 128);
      __int16 v26 = *(void **)(v24 + 112);
    }

    else
    {
      uint64_t v25 = 0LL;
      __int16 v26 = 0LL;
    }

    uint64_t v27 = [v26 identifier];
    uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 200LL);
    *(_DWORD *)unint64_t v59 = 138544130;
    *(void *)&v59[4] = v25;
    *(_WORD *)&v59[12] = 2112;
    *(void *)&v59[14] = v24;
    *(_WORD *)&v59[22] = 2112;
    uint64_t v60 = v27;
    LOWORD(v61) = 2112;
    *(void *)((char *)&v61 + 2) = v28;
    uint64_t v29 = "ProxySession <%{public}@> Have outstanding tasks getting auth headers for session %@ with identifier %@ outsta"
          "nding auth tasks %@";
  }

  else
  {
    if (!v23) {
      return;
    }
    uint64_t v45 = *(void *)(a1 + 32);
    if (v45)
    {
      uint64_t v46 = *(void *)(v45 + 128);
      uint64_t v47 = *(void **)(v45 + 112);
    }

    else
    {
      uint64_t v46 = 0LL;
      uint64_t v47 = 0LL;
    }

    uint64_t v48 = [v47 identifier];
    uint64_t v49 = *(void *)(*(void *)(a1 + 32) + 200LL);
    *(_DWORD *)unint64_t v59 = 138544130;
    *(void *)&v59[4] = v46;
    *(_WORD *)&v59[12] = 2112;
    *(void *)&v59[14] = v45;
    *(_WORD *)&v59[22] = 2112;
    uint64_t v60 = v48;
    LOWORD(v61) = 2112;
    *(void *)((char *)&v61 + 2) = v49;
    uint64_t v29 = "BackgroundSession <%{public}@> Have outstanding tasks getting auth headers for session %@ with identifier %@ o"
          "utstanding auth tasks %@";
  }

  _os_log_impl(&dword_18298D000, v22, OS_LOG_TYPE_DEFAULT, v29, v59, 0x2Au);
}

void __72____NSURLBackgroundSession_backgroundDataTask_didReceiveData_withReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 56));
  -[__NSCFBackgroundDataTask _onqueue_didReceiveData:withCompletion:](v2, *(void **)(a1 + 40), *(void **)(a1 + 48));
}

void __87____NSURLBackgroundSession_backgroundTask_didCompleteWithError_taskMetrics_info_reply___block_invoke( uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 72));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    int v4 = *(void **)(v3 + 112);
  }
  else {
    int v4 = 0LL;
  }
  if ([v4 _allowsRetryForBackgroundDataTasks]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (__int128 v5 = (void *)[*(id *)(a1 + 40) domain],
        [v5 isEqualToString:*MEMORY[0x189607740]])
    && [*(id *)(a1 + 40) code] == -997)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
    -[__NSURLBackgroundSession _onqueue_retryDataTaskWithIdentifier:](*(void *)(a1 + 32), *(void *)(a1 + 72));
  }

  else
  {
    objc_msgSend(v2, "set_metrics:", *(void *)(a1 + 48));
    uint64_t v7 = *(void **)(a1 + 48);
    if (v7) {
      id Property = objc_getProperty(v7, v6, 96LL, 1);
    }
    else {
      id Property = 0LL;
    }
    objc_msgSend(v2, "set_backgroundTransactionMetrics:", Property);
    uint64_t v10 = *(void **)(a1 + 48);
    if (v10) {
      id v11 = objc_getProperty(v10, v9, 96LL, 1);
    }
    else {
      id v11 = 0LL;
    }
    [v2 _logUnlistedTracker:v11];
    objc_msgSend(v2, "set_trailers:", objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", @"trailers"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      -[__NSURLBackgroundSession setCookiesFromResponse:forCurrentRequest:partitionIdentifier:]( *(void *)(a1 + 32),  (void *)[v2 response],  (void *)objc_msgSend(v2, "currentRequest"),  (const void *)objc_msgSend(v2, "_storagePartitionIdentifier"));
    }
    [v2 _finishProgressReporting];
    if (*(void *)(a1 + 48))
    {
      if (v2)
      {
        uint64_t v12 = (uint64_t)v2[88];
        if (!v12) {
          uint64_t v12 = (uint64_t)v2[87];
        }
      }

      else
      {
        uint64_t v12 = 0LL;
      }

      uint64_t v13 =  -[NSURLSessionTaskMetrics initWithMetrics:]( (id *)objc_alloc(&OBJC_CLASS___NSURLSessionTaskMetrics),  *(void **)(a1 + 48));
      -[__NSCFURLSessionDelegateWrapper task:didFinishCollectingMetrics:completionHandler:]( v12,  v2,  v13,  &__block_literal_global_175);
    }

    objc_msgSend(v2, "_onqueue_didFinishWithError:", *(void *)(a1 + 40));
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

void __71____NSURLBackgroundSession_backgroundTask_needNewBodyStream_withReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 48));
  if (v2) {
    -[__NSCFBackgroundDataTask _onqueue_needNewBodyStream:withCompletion:]( v2,  *(_BYTE *)(a1 + 56),  *(void *)(a1 + 40));
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void __99____NSURLBackgroundSession_backgroundTask_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke( uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40));
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    [v2 setCountOfBytesSent:v5];
    [v3 setCountOfBytesExpectedToSend:v6];
    uint64_t v7 = (uint64_t)v3[88];
    if (!v7) {
      uint64_t v7 = (uint64_t)v3[87];
    }
    -[__NSCFURLSessionDelegateWrapper task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:](v7, v3, v4, v5, v6);
  }

void __87____NSURLBackgroundSession_backgroundTask_didReceiveResponse_transactionMetrics_reply___block_invoke( uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 64));
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, "set_backgroundTransactionMetrics:", *(void *)(a1 + 40));
    [v3 _logUnlistedTracker:*(void *)(a1 + 40)];
    uint64_t v4 = *(void **)(a1 + 48);
    uint64_t v5 = *(void **)(a1 + 56);
    objc_msgSend(v3, "_onqueue_didReceiveResponse:", v4);
    uint64_t v6 = (uint64_t)v3[88];
    if (!v6) {
      uint64_t v6 = (uint64_t)v3[87];
    }
    -[__NSCFURLSessionDelegateWrapper dataTask:didReceiveResponse:completionHandler:](v6, v3, v4, v5);
    -[__NSURLBackgroundSession setCookiesFromResponse:forCurrentRequest:partitionIdentifier:]( *(void *)(a1 + 32),  (void *)[v3 response],  (void *)objc_msgSend(v3, "currentRequest"),  (const void *)objc_msgSend(v3, "_storagePartitionIdentifier"));
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

uint64_t __81____NSURLBackgroundSession_backgroundTask_didReceiveResponse_transactionMetrics___block_invoke( uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 56));
  objc_msgSend(v2, "set_backgroundTransactionMetrics:", *(void *)(a1 + 40));
  [v2 _logUnlistedTracker:*(void *)(a1 + 40)];
  return objc_msgSend(v2, "_onqueue_didReceiveResponse:", *(void *)(a1 + 48));
}

uint64_t __75____NSURLBackgroundSession_backgroundTask_didReceiveInformationalResponse___block_invoke( uint64_t a1)
{
  return objc_msgSend( -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 48)),  "_onqueue_didReceiveInformationalResponse:",  *(void *)(a1 + 40));
}

void __73____NSURLBackgroundSession_backgroundTask_hasConnectionWaitingWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 48));
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (uint64_t)v2[88];
    if (!v4) {
      uint64_t v4 = (uint64_t)v3[87];
    }
    -[__NSCFURLSessionDelegateWrapper task:_isWaitingForConnectionWithError:](v4, v3, *(void **)(a1 + 40));
  }

void __74____NSURLBackgroundSession_backgroundTask_hasConnectionWaitingWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40));
  -[__NSCFBackgroundSessionTask _onqueue_connectionWaitingWithReason:](v2, *(void *)(a1 + 48));
}

void __63____NSURLBackgroundSession_backgroundTaskHasConnectionWaiting___block_invoke(uint64_t a1)
{
  uint64_t v1 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40));
  -[__NSCFBackgroundSessionTask _onqueue_connectionWaitingWithReason:](v1, 0LL);
}

uint64_t __90____NSURLBackgroundSession_backgroundTask__willSendRequestForEstablishedConnection_reply___block_invoke( uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 56));
  if (!v2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __90____NSURLBackgroundSession_backgroundTask__willSendRequestForEstablishedConnection_reply___block_invoke_2;
  v6[3] = &unk_189C07880;
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[4] = v2;
  v6[5] = v4;
  return objc_msgSend(v2, "_onqueue_willSendRequestForEstablishedConnection:withCompletion:", v3, v6);
}

uint64_t __90____NSURLBackgroundSession_backgroundTask__willSendRequestForEstablishedConnection_reply___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __91____NSURLBackgroundSession_backgroundTask_willPerformHTTPRedirection_withNewRequest_reply___block_invoke( uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 64));
  -[__NSURLBackgroundSession setCookiesFromResponse:forCurrentRequest:partitionIdentifier:]( *(void *)(a1 + 32),  *(void **)(a1 + 40),  (void *)[v2 currentRequest],  (const void *)objc_msgSend(v2, "_storagePartitionIdentifier"));
  if (objc_msgSend((id)objc_msgSend(v2, "originalRequest"), "valueForHTTPHeaderField:", 0x18C5AEF60)
    || ![*(id *)(a1 + 48) valueForHTTPHeaderField:0x18C5AEF60])
  {
    id v3 = *(id *)(a1 + 48);
  }

  else
  {
    uint64_t v4 = (void *)[*(id *)(a1 + 48) mutableCopy];
    [v4 setValue:0 forHTTPHeaderField:0x18C5AEF60];
    id v3 = v4;
  }

  uint64_t v10 = MEMORY[0x1895F87A8];
  uint64_t v11 = 3221225472LL;
  uint64_t v12 = __91____NSURLBackgroundSession_backgroundTask_willPerformHTTPRedirection_withNewRequest_reply___block_invoke_2;
  uint64_t v13 = &unk_189C07858;
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v14 = v2;
  uint64_t v15 = v5;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(void **)(v6 + 112);
  }
  else {
    uint64_t v7 = 0LL;
  }
  if (objc_msgSend(v7, "_overridesBackgroundSessionAutoRedirect", v10, v11, v12, v13, v14, v15))
  {
    if (v2)
    {
      uint64_t v8 = (uint64_t)v2[88];
      if (!v8) {
        uint64_t v8 = (uint64_t)v2[87];
      }
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    -[__NSCFURLSessionDelegateWrapper task:willPerformHTTPRedirection:newRequest:completionHandler:]( v8,  v2,  *(void **)(a1 + 40),  v3,  &v10);
  }

  else
  {
    uint64_t v9 = [v2 requestWithCookiesApplied:v3];
    [v2 updateCurrentRequest:v9];
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v9);
  }

uint64_t __91____NSURLBackgroundSession_backgroundTask_willPerformHTTPRedirection_withNewRequest_reply___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __73____NSURLBackgroundSession_backgroundTask_willBeginDelayedRequest_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 56));
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = (uint64_t)v2[88];
    if (!v4) {
      uint64_t v4 = (uint64_t)v3[87];
    }
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __73____NSURLBackgroundSession_backgroundTask_willBeginDelayedRequest_reply___block_invoke_2;
    v7[3] = &unk_189C0B708;
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v7[4] = v3;
    v7[5] = v6;
    -[__NSCFURLSessionDelegateWrapper task:willBeginDelayedRequest:completionHandler:](v4, v3, v5, v7);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

uint64_t __73____NSURLBackgroundSession_backgroundTask_willBeginDelayedRequest_reply___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (a2 == 1 && a3)
  {
    objc_msgSend( *(id *)(a1 + 32),  "updateCurrentRequest:",  objc_msgSend(*(id *)(a1 + 32), "requestWithCookiesApplied:"));
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  else
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  return v4();
}

void __69____NSURLBackgroundSession_backgroundTask_didReceiveChallenge_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 56));
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(NSURLAuthenticationChallenge **)(a1 + 40);
    uint64_t v5 = -[NSURLAuthenticationChallenge protectionSpace](v4, "protectionSpace");
    if (-[NSString isEqualToString:]( -[NSURLProtectionSpace authenticationMethod](v5, "authenticationMethod"),  "isEqualToString:",  @"NSURLAuthenticationMethodServerTrust"))
    {
      uint64_t v6 = 0LL;
    }

    else
    {
      uint64_t v13 = *(void *)(a1 + 32);
      if (v13) {
        uint64_t v14 = *(void **)(v13 + 112);
      }
      else {
        uint64_t v14 = 0LL;
      }
      uint64_t v6 = (void *)objc_msgSend( (id)objc_msgSend(v14, "URLCredentialStorage"),  "defaultCredentialForProtectionSpace:",  v5);
      if (![*(id *)(a1 + 40) proposedCredential] && v6 && objc_msgSend(v6, "hasPassword")) {
        uint64_t v4 =  -[NSURLAuthenticationChallenge initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:]( [NSURLAuthenticationChallenge alloc],  "initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:",  v5,  v6,  [*(id *)(a1 + 40) previousFailureCount],  objc_msgSend(*(id *)(a1 + 40), "failureResponse"),  objc_msgSend(*(id *)(a1 + 40), "error"),  objc_msgSend(*(id *)(a1 + 40), "sender"));
      }
    }

    [v3 currentRequest];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __69____NSURLBackgroundSession_backgroundTask_didReceiveChallenge_reply___block_invoke_2;
    v15[3] = &unk_189C07830;
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    v15[4] = v4;
    v15[5] = v7;
    v15[6] = v6;
    v15[7] = v3;
    v15[8] = v8;
    if (!isSessionChallenge(v4)) {
      goto LABEL_11;
    }
    uint64_t v10 = (uint64_t)v3[88];
    if (!v10) {
      uint64_t v10 = (uint64_t)v3[87];
    }
    if (-[__NSCFURLSessionDelegateWrapper sessionDidReceiveChallenge](v10, v9))
    {
      uint64_t v11 = (uint64_t)v3[88];
      if (!v11) {
        uint64_t v11 = (uint64_t)v3[87];
      }
      -[__NSCFURLSessionDelegateWrapper didReceiveChallenge:completionHandler:](v11, v4, v15);
    }

    else
    {
LABEL_11:
      uint64_t v12 = (uint64_t)v3[88];
      if (!v12) {
        uint64_t v12 = (uint64_t)v3[87];
      }
      -[__NSCFURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:](v12, v3, v4, v15);
    }
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

void __69____NSURLBackgroundSession_backgroundTask_didReceiveChallenge_reply___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  if (a2 == 1)
  {
    if (*(void *)(a1 + 32) == *(void *)(a1 + 40))
    {
      uint64_t v5 = 1LL;
    }

    else
    {
      uint64_t v5 = 0LL;
      a3 = *(void **)(a1 + 48);
    }
  }

  else
  {
    uint64_t v5 = a2;
  }

  uint64_t v6 = (void *)[a3 identity];
  if (v6)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x18960AFC0]) initWithIdentity:v6];
    objc_initWeak(&location, *(id *)(a1 + 56));
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __69____NSURLBackgroundSession_backgroundTask_didReceiveChallenge_reply___block_invoke_3;
    v7[3] = &unk_189C07808;
    v7[4] = v6;
    objc_copyWeak(&v8, &location);
    [v6 setClientDisconnectionHandler:v7];
    [*(id *)(a1 + 56) addSecKeyProxy:v6];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  (*(void (**)(void, uint64_t, void *, uint64_t))(*(void *)(a1 + 64) + 16))( *(void *)(a1 + 64),  v5,  a3,  [v6 endpoint]);
}

uint64_t __69____NSURLBackgroundSession_backgroundTask_didReceiveChallenge_reply___block_invoke_3( uint64_t result,  int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) invalidate];
    [*(id *)(v2 + 32) setClientDisconnectionHandler:0];
    return [objc_loadWeak((id *)(v2 + 40)) removeSecKeyProxy:*(void *)(v2 + 32)];
  }

  return result;
}

uint64_t __53____NSURLBackgroundSession_backgroundTaskDidSuspend___block_invoke(uint64_t a1)
{
  return objc_msgSend( -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40)),  "setState:",  1);
}

uint64_t __52____NSURLBackgroundSession_backgroundTaskDidResume___block_invoke(uint64_t a1)
{
  return objc_msgSend( -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(void *)(a1 + 40)),  "setState:",  0);
}

uint64_t __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_189C07728;
  v4[4] = *(void *)(a1 + 32);
  v4[5] = a2;
  return [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  dispatch_async(global_queue, *(dispatch_block_t *)(a1 + 32));
}

void __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  dispatch_async(global_queue, *(dispatch_block_t *)(a1 + 32));
}

uint64_t __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return [*(id *)(a1 + 32) removeCredential:a3 forProtectionSpace:*(void *)(a1 + 40)];
}

void *__120____NSURLBackgroundSession_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke( void *a1,  double a2)
{
  uint64_t v7 = a1;
  uint64_t v148 = *MEMORY[0x1895F89C0];
  id v8 = (void *)a1[4];
  if (!v8) {
    goto LABEL_16;
  }
  uint64_t v9 = &v139;
  if (!*((_BYTE *)v8 + 265))
  {
    uint64_t v4 = (void *)a1[5];
    id newValue = (id)a1[6];
    uint64_t v5 = (void *)a1[7];
    id v121 = (id)a1[8];
    v125 = (void *)a1[9];
    int v15 = -[__NSURLBackgroundSession doesAVAssetDownloadSessionSupportMultipleDownloads](a2);
    uint64_t v16 = (void *)0x18C5A7000LL;
    uint64_t v2 = *((void *)v8 + 34);
    if (v15)
    {
      uint64_t v17 = objc_alloc(&OBJC_CLASS_____NSCFBackgroundAVAggregateAssetDownloadTaskNoChildTask);
      uint64_t v18 = [v8 defaultTaskGroup];
      uint64_t v19 = *((void *)v8 + 20);
      *((void *)v8 + 20) = v19 + 1;
      if (!v17) {
        goto LABEL_75;
      }
      v139.id receiver = v17;
      v139.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundAVAggregateAssetDownloadTaskNoChildTask;
      id v3 = objc_msgSendSuper2( &v139,  sel_initWithTaskGroup_URLAsset_URL_destinationURL_temporaryDestinationURL_assetTitle_assetArtworkData_ident_enableSPIDelegateCallbacks_,  v18,  v4,  0,  0,  0,  v5,  v121,  v19,  0);
      if (!v2) {
        goto LABEL_11;
      }
LABEL_55:
      if (v3) {
        objc_setProperty_atomic(v3, v20, *((id *)v8 + 34), 776LL);
      }
      goto LABEL_111;
    }

    uint64_t v117 = *((void *)v8 + 34);
    BOOL v35 = objc_alloc(&OBJC_CLASS_____NSCFBackgroundAVAggregateAssetDownloadTask);
    uint64_t v36 = [v8 defaultTaskGroup];
    uint64_t v38 = *((void *)v8 + 20);
    *((void *)v8 + 20) = v38 + 1;
    if (v35)
    {
      BOOL v39 = (void *)v36;
      gotLoadHelper_x8__OBJC_CLASS___AVAssetDownloadSession(v37);
      if (!objc_opt_class())
      {
        _os_crash();
        __break(1u);
        goto LABEL_119;
      }

      v133.id receiver = v35;
      v133.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundAVAggregateAssetDownloadTask;
      uint64_t v40 = objc_msgSendSuper2(&v133, sel_initWithOriginalRequest_ident_taskGroup_, 0, v38, v39);
      id v3 = v40;
      if (v40)
      {
        v124 = v4;
        [v40 setURLAsset:v4];
        objc_setProperty_atomic(v3, v41, newValue, 808LL);
        objc_setProperty_atomic_copy(v3, v42, v5, 816LL);
        objc_setProperty_atomic_copy(v3, v43, v121, 824LL);
        v3[105] = [objc_alloc(NSString) initWithFormat:@"%@.%lu.childAssetDownloadTasks", objc_msgSend((id)objc_msgSend(v3, "_effectiveConfiguration"), "identifier"), v38];
        uint64_t v44 = (void *)[v39 _groupConfiguration];
        uint64_t v45 = v3[105];
        objc_opt_self();
        uint64_t v46 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:]( &OBJC_CLASS___NSURLSessionConfiguration,  "backgroundSessionConfigurationWithIdentifier:",  v45);
        -[NSURLSessionConfiguration set_sourceApplicationBundleIdentifier:]( v46,  "set_sourceApplicationBundleIdentifier:",  [v44 _sourceApplicationBundleIdentifier]);
        -[NSURLSessionConfiguration set_sourceApplicationSecondaryIdentifier:]( v46,  "set_sourceApplicationSecondaryIdentifier:",  [v44 _sourceApplicationSecondaryIdentifier]);
        -[NSURLSessionConfiguration set_sourceApplicationAuditTokenData:]( v46,  "set_sourceApplicationAuditTokenData:",  [v44 _sourceApplicationAuditTokenData]);
        -[NSURLSessionConfiguration setTLSMaximumSupportedProtocol:]( v46,  "setTLSMaximumSupportedProtocol:",  [v44 TLSMaximumSupportedProtocol]);
        -[NSURLSessionConfiguration setTLSMinimumSupportedProtocol:]( v46,  "setTLSMinimumSupportedProtocol:",  [v44 TLSMinimumSupportedProtocol]);
        [v44 timeoutIntervalForRequest];
        -[NSURLSessionConfiguration setTimeoutIntervalForRequest:](v46, "setTimeoutIntervalForRequest:");
        [v44 timeoutIntervalForResource];
        -[NSURLSessionConfiguration setTimeoutIntervalForResource:](v46, "setTimeoutIntervalForResource:");
        -[NSURLSessionConfiguration setConnectionProxyDictionary:]( v46,  "setConnectionProxyDictionary:",  [v44 connectionProxyDictionary]);
        -[NSURLSessionConfiguration setHTTPAdditionalHeaders:]( v46,  "setHTTPAdditionalHeaders:",  [v44 HTTPAdditionalHeaders]);
        -[NSURLSessionConfiguration setHTTPMaximumConnectionsPerHost:]( v46,  "setHTTPMaximumConnectionsPerHost:",  [v44 HTTPMaximumConnectionsPerHost]);
        -[NSURLSessionConfiguration setHTTPCookieStorage:]( v46,  "setHTTPCookieStorage:",  [v44 HTTPCookieStorage]);
        -[NSURLSessionConfiguration setURLCache:](v46, "setURLCache:", [v44 URLCache]);
        -[NSURLSessionConfiguration setURLCredentialStorage:]( v46,  "setURLCredentialStorage:",  [v44 URLCredentialStorage]);
        -[NSURLSessionConfiguration setNetworkServiceType:]( v46,  "setNetworkServiceType:",  [v44 networkServiceType]);
        -[NSURLSessionConfiguration setAllowsCellularAccess:]( v46,  "setAllowsCellularAccess:",  [v44 allowsCellularAccess]);
        -[NSURLSessionConfiguration set_TCPAdaptiveReadTimeout:]( v46,  "set_TCPAdaptiveReadTimeout:",  [v44 _TCPAdaptiveReadTimeout]);
        -[NSURLSessionConfiguration set_TCPAdaptiveWriteTimeout:]( v46,  "set_TCPAdaptiveWriteTimeout:",  [v44 _TCPAdaptiveWriteTimeout]);
        -[NSURLSessionConfiguration setDiscretionary:](v46, "setDiscretionary:", [v44 isDiscretionary]);
        uint64_t v47 = +[AVAssetDownloadURLSession sessionWithConfiguration:assetDownloadDelegate:delegateQueue:]( &OBJC_CLASS___AVAssetDownloadURLSession,  "sessionWithConfiguration:assetDownloadDelegate:delegateQueue:",  v46,  v3,  0LL);
        uint64_t v48 = v125;
        uint64_t v49 = (void *)[v125 objectForKey:@"AVAssetDownloadTaskMediaSelectionPrefersMultichannelKey"];
        v115 = v8;
        v116 = v7;
        int v114 = objc_msgSend( (id)objc_msgSend( v125,  "objectForKey:",  @"AVAssetDownloadTaskMediaSelectionPrefersMultichannelForMostPreferredLanguageOnlyKey"),  "BOOLValue");
        if ((v114 & 1) != 0)
        {
          int v50 = 0;
        }

        else if (v49)
        {
          int v50 = [v49 BOOLValue];
        }

        else
        {
          int v50 = 1;
        }

        v120 = (void *)[MEMORY[0x189603FA8] array];
        __int128 buf = 0u;
        __int128 v145 = 0u;
        __int128 v146 = 0u;
        __int128 v147 = 0u;
        uint64_t v56 = [newValue countByEnumeratingWithState:&buf objects:&v139 count:16];
        id v57 = v121;
        if (v56)
        {
          uint64_t v58 = v56;
          uint64_t v59 = *(void *)v145;
          do
          {
            for (uint64_t i = 0LL; i != v58; ++i)
            {
              __int128 v61 = v5;
              if (*(void *)v145 != v59) {
                objc_enumerationMutation(newValue);
              }
              uint64_t v62 = *(void *)(*((void *)&buf + 1) + 8 * i);
              if (v48) {
                id v63 = (id)[v48 mutableCopy];
              }
              else {
                id v63 = (id)[MEMORY[0x189603FC8] dictionary];
              }
              v64 = v63;
              [v63 setObject:v62 forKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionKey"];
              [v64 setObject:MEMORY[0x189604A80] forKeyedSubscript:@"AVAssetDownloadSessionMediaSelectionPrefersMultichannelKey"];
              objc_msgSend( v64,  "setObject:forKeyedSubscript:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v3, "taskIdentifier")),  @"AVAggregateAssetDownloadTaskIdentifierKey");
              uint64_t v5 = v61;
              uint64_t v65 = v61;
              id v57 = v121;
              uint64_t v66 = -[AVAssetDownloadURLSession assetDownloadTaskWithURLAsset:assetTitle:assetArtworkData:options:]( v47,  "assetDownloadTaskWithURLAsset:assetTitle:assetArtworkData:options:",  v124,  v65,  v121,  v64);
              if (v66) {
                [v120 addObject:v66];
              }
              if (v50)
              {
                id v67 = v125
                    ? (id)[v64 mutableCopy]
                    : (id)[MEMORY[0x189603FC8] dictionary];
                id v68 = v67;
                [v67 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"AVAssetDownloadSessionMediaSelectionPrefersMultichannelKey"];
                uint64_t v69 = -[AVAssetDownloadURLSession assetDownloadTaskWithURLAsset:assetTitle:assetArtworkData:options:]( v47,  "assetDownloadTaskWithURLAsset:assetTitle:assetArtworkData:options:",  v124,  v5,  v121,  v68);
                if (v69) {
                  [v120 addObject:v69];
                }
              }

              uint64_t v48 = v125;
            }

            uint64_t v58 = [newValue countByEnumeratingWithState:&buf objects:&v139 count:16];
          }

          while (v58);
        }

        id v8 = v115;
        if (v114)
        {
          id v70 = v48
              ? (id)[v48 mutableCopy]
              : (id)[MEMORY[0x189603FC8] dictionary];
          v71 = v70;
          [v70 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"AVAssetDownloadSessionMediaSelectionPrefersMultichannelKey"];
          objc_msgSend( v71,  "setObject:forKeyedSubscript:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v3, "taskIdentifier")),  @"AVAggregateAssetDownloadTaskIdentifierKey");
          uint64_t v72 = -[AVAssetDownloadURLSession assetDownloadTaskWithURLAsset:assetTitle:assetArtworkData:options:]( v47,  "assetDownloadTaskWithURLAsset:assetTitle:assetArtworkData:options:",  v124,  v5,  v57,  v71);
          if (v72) {
            [v120 addObject:v72];
          }
        }

        v3[107] = [v120 copy];
        v3[106] = v47;
        uint64_t v7 = v116;
        uint64_t v4 = v124;
        if (v117) {
          goto LABEL_55;
        }
        goto LABEL_79;
      }
    }

    else
    {
      id v3 = 0LL;
    }

    if (v117) {
      goto LABEL_55;
    }
LABEL_79:
    uint64_t v16 = (void *)[MEMORY[0x189603FA8] array];
    __int128 buf = 0u;
    __int128 v145 = 0u;
    __int128 v146 = 0u;
    __int128 v147 = 0u;
    uint64_t v86 = [newValue countByEnumeratingWithState:&buf objects:&v139 count:16];
    if (v86)
    {
      uint64_t v87 = v86;
      uint64_t v88 = *(void *)v145;
      do
      {
        for (uint64_t j = 0LL; j != v87; ++j)
        {
          if (*(void *)v145 != v88) {
            objc_enumerationMutation(newValue);
          }
          objc_msgSend(v16, "addObject:", objc_msgSend(*(id *)(*((void *)&buf + 1) + 8 * j), "propertyList"));
        }

        uint64_t v87 = [newValue countByEnumeratingWithState:&buf objects:&v139 count:16];
      }

      while (v87);
    }

    v90 = v4;
    BOOL v39 = (void *)[v4 URL];
    v91 = (void *)*((void *)v8 + 21);
    if (v91)
    {
      v92 = (__NSCFBackgroundAVAggregateAssetDownloadTask *)MEMORY[0x1895F87A8];
      v133.id receiver = (id)MEMORY[0x1895F87A8];
      uint64_t v6 = 3221225472LL;
      v133.super_class = (Class)3221225472LL;
      v134 = __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke_161;
      v135 = &unk_189C075F8;
      v136 = v8;
      v137 = v3;
      v138 = v39;
      uint64_t v93 = [v91 synchronousRemoteObjectProxyWithErrorHandler:&v133];
      v125 = -[__NSURLBackgroundSession serializableAVAssetDownloadTaskOptionsFromOptions:mediaSelections:downloadConfiguration:]( v125,  newValue,  0LL);
      id v126 = 0LL;
      uint64_t v94 = [v90 propertyListForNSURLSessionAssetReturningError:&v126];
      if (v94)
      {
        uint64_t v9 = (objc_super *)v94;
        v119 = (void *)v93;
        v122 = v5;
        uint64_t v5 = v8;
        uint64_t v38 = [v90 downloadToken];
        BOOL v35 = v92;
        if (v3)
        {
          uint64_t v95 = v3[105];
LABEL_90:
          uint64_t v96 = [v3 taskIdentifier];
          uint64_t v97 = [v3 _uniqueIdentifier];
          *(void *)&__int128 v127 = v35;
          *((void *)&v127 + 1) = v6;
          v128 = __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke_162;
          v129 = &unk_189C07620;
          v130 = v3;
          v131 = v5;
          v132 = v39;
          uint64_t v112 = v95;
          id v8 = v5;
          [v119 avAggregateAssetDownloadTaskWithDownloadToken:v38 serializedMediaSelections:v16 assetTitle:v122 assetArtworkData:v121 options:v125  assetOptions:v9 childDownloadSessionIdentifier:v112 identifier:v96 uniqueIdentifier:v97 reply:&v127];
          goto LABEL_109;
        }

void __68____NSURLBackgroundSession_performBlockOnQueueAndRethrowExceptions___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 168);
  if (v3)
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __68____NSURLBackgroundSession_performBlockOnQueueAndRethrowExceptions___block_invoke_2;
    v14[3] = &unk_189C07588;
    v14[4] = &v15;
    objc_msgSend( (id)objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v14),  "pingForXPCObjectValidityWithReply:",  &__block_literal_global_4423);
    uint64_t v2 = *(void *)(a1 + 32);
    if (*((_BYTE *)v16 + 24))
    {
      [*(id *)(v2 + 176) invalidate];

      *(void *)(*(void *)(a1 + 32) + 176LL) = 0LL;
      *(void *)(*(void *)(a1 + 32) + 168LL) = 0LL;
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }

  if (*(_BYTE *)(v2 + 280) || *((_BYTE *)v16 + 24))
  {
    if ([*(id *)(v2 + 112) _isProxySession])
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v4 = (os_log_s *)CFNLog::logger;
      if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5) {
        uint64_t v6 = *(void *)(v5 + 128);
      }
      else {
        uint64_t v6 = 0LL;
      }
      if (*(_BYTE *)(v5 + 280)) {
        int v7 = 89;
      }
      else {
        int v7 = 78;
      }
      if (*((_BYTE *)v16 + 24)) {
        int v8 = 89;
      }
      else {
        int v8 = 78;
      }
      *(_DWORD *)__int128 buf = 138543874;
      uint64_t v20 = v6;
      __int16 v21 = 1024;
      int v22 = v7;
      __int16 v23 = 1024;
      int v24 = v8;
      uint64_t v9 = "ProxySession <%{public}@> attempting to reconnect to background transfer daemon prior to NSURLSessionTask cre"
           "ation, reconnect=%c, invalid=%c";
    }

    else
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v4 = (os_log_s *)CFNLog::logger;
      if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      uint64_t v10 = *(void *)(a1 + 32);
      if (v10) {
        uint64_t v11 = *(void *)(v10 + 128);
      }
      else {
        uint64_t v11 = 0LL;
      }
      if (*(_BYTE *)(v10 + 280)) {
        int v12 = 89;
      }
      else {
        int v12 = 78;
      }
      if (*((_BYTE *)v16 + 24)) {
        int v13 = 89;
      }
      else {
        int v13 = 78;
      }
      *(_DWORD *)__int128 buf = 138543874;
      uint64_t v20 = v11;
      __int16 v21 = 1024;
      int v22 = v12;
      __int16 v23 = 1024;
      int v24 = v13;
      uint64_t v9 = "BackgroundSession <%{public}@> attempting to reconnect to background transfer daemon prior to NSURLSessionTas"
           "k creation, reconnect=%c, invalid=%c";
    }

    _os_log_impl(&dword_18298D000, v4, OS_LOG_TYPE_DEFAULT, v9, buf, 0x18u);
LABEL_32:
    -[__NSURLBackgroundSession setupXPCConnection](*(void *)(a1 + 32));
    -[__NSURLBackgroundSession setupBackgroundSession](*(void *)(a1 + 32));
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  _Block_object_dispose(&v15, 8);
}

uint64_t __68____NSURLBackgroundSession_performBlockOnQueueAndRethrowExceptions___block_invoke_2( uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  return result;
}

void __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 112);
  }
  else {
    uint64_t v5 = 0LL;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  int v7 = (os_log_s *)CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      uint64_t v10 = *(void *)(v10 + 128);
    }
    int v14 = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = a2;
    uint64_t v11 = "ProxySession <%{public}@> error requesting an AVAggregateAssetDownloadTask from background transfer daemon: %@";
  }

  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      uint64_t v13 = *(void *)(v13 + 128);
    }
    int v14 = 138543618;
    uint64_t v15 = v13;
    __int16 v16 = 2112;
    uint64_t v17 = a2;
    uint64_t v11 = "BackgroundSession <%{public}@> error requesting an AVAggregateAssetDownloadTask from background transfer daemon: %@";
  }

  _os_log_error_impl(&dword_18298D000, v7, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v14, 0x16u);
LABEL_11:
  int v12 = *(void **)(a1 + 40);
  if (v12) {
    objc_setProperty_atomic(v12, v9, *(id *)(*(void *)(a1 + 32) + 272LL), 776LL);
  }
}

void __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke_160( uint64_t a1,  const char *a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    if (v3) {
      objc_setProperty_atomic(v3, a2, *(id *)(*(void *)(a1 + 40) + 272LL), 776LL);
    }
  }

void __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke_161( void *a1,  uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v4 = a1[4];
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 112);
  }
  else {
    uint64_t v5 = 0LL;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  int v7 = (os_log_s *)CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v10 = a1[4];
    if (v10) {
      uint64_t v10 = *(void *)(v10 + 128);
    }
    int v15 = 138543618;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = a2;
    uint64_t v11 = "ProxySession <%{public}@> error requesting an AVAggregateAssetDownloadTask from background transfer daemon: %@";
  }

  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v14 = a1[4];
    if (v14) {
      uint64_t v14 = *(void *)(v14 + 128);
    }
    int v15 = 138543618;
    uint64_t v16 = v14;
    __int16 v17 = 2112;
    uint64_t v18 = a2;
    uint64_t v11 = "BackgroundSession <%{public}@> error requesting an AVAggregateAssetDownloadTask from background transfer daemon: %@";
  }

  _os_log_error_impl(&dword_18298D000, v7, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, 0x16u);
LABEL_11:
  int v12 = (void *)a1[5];
  if (a1[4])
  {
    uint64_t v13 = (void *)objc_msgSend(MEMORY[0x189607870], "_web_errorWithDomain:code:URL:", *MEMORY[0x189607740], -1, a1[6]);
    if (!v12) {
      return;
    }
  }

  else
  {
    uint64_t v13 = 0LL;
    if (!v12) {
      return;
    }
  }

  objc_setProperty_atomic(v12, v9, v13, 776LL);
}

void __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke_162( void *a1,  const char *a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = (void *)a1[4];
    if (a1[5])
    {
      id v3 = (void *)objc_msgSend( MEMORY[0x189607870],  "_web_errorWithDomain:code:URL:",  *MEMORY[0x189607740],  -1,  a1[6]);
      if (!v2) {
        return;
      }
    }

    else
    {
      id v3 = 0LL;
      if (!v2) {
        return;
      }
    }

    objc_setProperty_atomic(v2, a2, v3, 776LL);
  }

uint64_t __116____NSURLBackgroundSession_serializableAVAssetDownloadTaskOptionsFromOptions_mediaSelections_downloadConfiguration___block_invoke()
{
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (gotLoadHelper_x8__OBJC_CLASS___AVAssetDownloadConfiguration(v0),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v1 = 0;
  }

  else
  {
    objc_opt_class();
    char v1 = objc_opt_isKindOfClass() ^ 1;
  }

  return v1 & 1;
}

id *__117____NSURLBackgroundSession_AVAssetDownloadTaskForURLAsset_assetTitle_assetArtworkData_options_downloadConfiguration___block_invoke( uint64_t a1)
{
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v2 = [*(id *)(a1 + 32) _destinationURL];
  }
  else {
    uint64_t v2 = 0LL;
  }
  result = -[__NSURLBackgroundSession _onqueue_AVAssetDownloadTaskForURLAsset:URL:destinationURL:assetTitle:assetArtworkData:options:downloadConfiguration:enableSPIDelegateCallbacks:]( *(id **)(a1 + 40),  *(void **)(a1 + 48),  0LL,  v2,  *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void **)(a1 + 72),  *(void *)(a1 + 32),  0);
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL) = result;
  return result;
}

void __172____NSURLBackgroundSession__onqueue_AVAssetDownloadTaskForURLAsset_URL_destinationURL_assetTitle_assetArtworkData_options_downloadConfiguration_enableSPIDelegateCallbacks___block_invoke( void *a1,  uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v4 = a1[4];
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 112);
  }
  else {
    uint64_t v5 = 0LL;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  int v7 = (os_log_s *)CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v10 = a1[4];
    if (v10) {
      uint64_t v10 = *(void *)(v10 + 128);
    }
    int v15 = 138543618;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = a2;
    uint64_t v11 = "ProxySession <%{public}@> error requesting an AVAssetDownloadTask from background transfer daemon: %@";
  }

  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v14 = a1[4];
    if (v14) {
      uint64_t v14 = *(void *)(v14 + 128);
    }
    int v15 = 138543618;
    uint64_t v16 = v14;
    __int16 v17 = 2112;
    uint64_t v18 = a2;
    uint64_t v11 = "BackgroundSession <%{public}@> error requesting an AVAssetDownloadTask from background transfer daemon: %@";
  }

  _os_log_error_impl(&dword_18298D000, v7, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, 0x16u);
LABEL_11:
  int v12 = (void *)a1[5];
  if (a1[4])
  {
    uint64_t v13 = (void *)objc_msgSend(MEMORY[0x189607870], "_web_errorWithDomain:code:URL:", *MEMORY[0x189607740], -1, a1[6]);
    if (!v12) {
      return;
    }
  }

  else
  {
    uint64_t v13 = 0LL;
    if (!v12) {
      return;
    }
  }

  objc_setProperty_atomic(v12, v9, v13, 776LL);
}

void __172____NSURLBackgroundSession__onqueue_AVAssetDownloadTaskForURLAsset_URL_destinationURL_assetTitle_assetArtworkData_options_downloadConfiguration_enableSPIDelegateCallbacks___block_invoke_159( void *a1,  const char *a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = (void *)a1[4];
    if (a1[5])
    {
      id v3 = (void *)objc_msgSend( MEMORY[0x189607870],  "_web_errorWithDomain:code:URL:",  *MEMORY[0x189607740],  -1,  a1[6]);
      if (!v2) {
        return;
      }
    }

    else
    {
      id v3 = 0LL;
      if (!v2) {
        return;
      }
    }

    objc_setProperty_atomic(v2, a2, v3, 776LL);
  }

id *__82____NSURLBackgroundSession_AVAssetDownloadTaskForURLAsset_destinationURL_options___block_invoke( uint64_t a1)
{
  result = -[__NSURLBackgroundSession _onqueue_AVAssetDownloadTaskForURLAsset:URL:destinationURL:assetTitle:assetArtworkData:options:downloadConfiguration:enableSPIDelegateCallbacks:]( *(id **)(a1 + 32),  *(void **)(a1 + 40),  0LL,  *(void *)(a1 + 48),  0LL,  0LL,  *(void **)(a1 + 56),  0LL,  0);
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = result;
  return result;
}

id *__78____NSURLBackgroundSession__AVAssetDownloadTaskForURL_destinationURL_options___block_invoke( uint64_t a1)
{
  result = -[__NSURLBackgroundSession _onqueue_AVAssetDownloadTaskForURLAsset:URL:destinationURL:assetTitle:assetArtworkData:options:downloadConfiguration:enableSPIDelegateCallbacks:]( *(id **)(a1 + 32),  0LL,  *(void *)(a1 + 40),  *(void *)(a1 + 48),  0LL,  0LL,  *(void **)(a1 + 56),  0LL,  1);
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = result;
  return result;
}

void __58____NSURLBackgroundSession__downloadTaskWithTaskForClass___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v103 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t Property = (uint64_t)objc_getProperty(*(id *)(a1 + 40), a2, 16LL, 1);
    int v7 = (NSData *)objc_getProperty(v4, v6, 64LL, 1);
    id v9 = objc_getProperty(v4, v8, 72LL, 1);
  }

  else
  {
    int v7 = 0LL;
    uint64_t Property = 0LL;
    id v9 = 0LL;
  }

  -[__NSURLBackgroundSession validateSerializabilityForRequest:completion:](Property, (uint64_t)v9);
  if (!(Property | (unint64_t)v7))
  {
    if (dyld_program_sdk_at_least())
    {
      uint64_t v88 = (_Unwind_Exception *)__URLSESSION_CLIENT_API_MISUSE_NIL_ARGUMENT__(&CFSTR("Cannot create download task without requ"
                                                                                      "est or resume data").isa);
      _Unwind_Resume(v88);
    }

    goto LABEL_6;
  }

  if (*(void *)(v3 + 272))
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    p_isa = -[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:]( (void *)v3,  v11,  *(void **)(v3 + 272));
    goto LABEL_9;
  }

  if (!*(_BYTE *)(v3 + 265))
  {
    if (!v7) {
      goto LABEL_32;
    }
    BOOL v16 = -[NSData _isSafeResumeDataForBackgroundDownload](v7, "_isSafeResumeDataForBackgroundDownload");
    id v17 = copyDecodedResumeData(v7);
    if (objc_msgSend( (id)objc_msgSend(v17, "objectForKeyedSubscript:", @"NSURLSessionResumeInfoVersion"),  "intValue") == 1)
    {
      uint64_t v18 = (void *)[MEMORY[0x1896079E8] propertyListWithData:v7 options:0 format:0 error:0];
      uint64_t v19 = (void *)[v18 objectForKeyedSubscript:@"NSURLSessionResumeInfoLocalPath"];
      id v20 = (id)[v18 mutableCopy];
      [v20 setObject:&unk_189C46B60 forKeyedSubscript:@"NSURLSessionResumeInfoVersion"];
      objc_msgSend( v20,  "setObject:forKeyedSubscript:",  objc_msgSend(v19, "lastPathComponent"),  @"NSURLSessionResumeInfoTempFileName");
      int v7 = (NSData *)[MEMORY[0x1896079E8] dataWithPropertyList:v20 format:200 options:0 error:0];
    }

    if (![*(id *)(v3 + 112) _directoryForDownloadedFiles])
    {
      __int16 v21 = -[__NSURLBackgroundSession backgroundDownloadsDirectory](v3);
      if (v21)
      {
        int v22 = v21;
        __int16 v23 = NSTemporaryDirectory();
        -[__NSURLBackgroundSession moveFileForResumeData:fromDirectory:toDirectory:]( v3,  v7,  v23,  (void *)[v22 path]);
      }
    }

    id v24 = copyDecodedResumeData(v7);
    uint64_t v25 = [v24 objectForKey:@"NSURLSessionResumeCurrentRequest"];
    id v26 = (id)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v25 error:0];
    [v26 setDecodingFailurePolicy:0];
    uint64_t v27 = (void *)[v26 decodeObjectOfClasses:resumeDataClasses(void)::resumeDataClasses forKey:@"NSKeyedArchiveRootObjectKey"];
    [v26 finishDecoding];
    uint64_t v28 = [v24 objectForKey:@"NSURLSessionResumeOriginalRequest"];
    id v29 = (id)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v28 error:0];
    [v29 setDecodingFailurePolicy:0];
    uint64_t v30 = [v29 decodeObjectOfClasses:resumeDataClasses(void)::resumeDataClasses forKey:@"NSKeyedArchiveRootObjectKey"];
    [v29 finishDecoding];

    if (v16)
    {
      uint64_t v31 = objc_alloc(&OBJC_CLASS_____NSCFBackgroundDownloadTask);
      uint64_t v32 = *(void *)(v3 + 160);
      *(void *)(v3 + 160) = v32 + 1;
      unint64_t v33 = -[__NSCFBackgroundSessionTask initWithOriginalRequest:ident:taskGroup:]( v31,  "initWithOriginalRequest:ident:taskGroup:",  v27,  v32,  [(id)v3 defaultTaskGroup]);
      -[NSURLSessionTask setOriginalRequest:](v33, "setOriginalRequest:", v30);
      BOOL v34 = *(void **)(v3 + 168);
      if (v34)
      {
        *(void *)__str = MEMORY[0x1895F87A8];
        *(void *)&__str[8] = 3221225472LL;
        *(void *)&__str[16] = __63____NSURLBackgroundSession__onqueue_downloadTaskForResumeData___block_invoke;
        v99 = &unk_189C075F8;
        BOOL v100 = (__NSCFBackgroundDownloadTask *)v3;
        v101 = v33;
        uint64_t v102 = (uint64_t)v27;
        uint64_t v89 = MEMORY[0x1895F87A8];
        uint64_t v90 = 3221225472LL;
        v91 = __63____NSURLBackgroundSession__onqueue_downloadTaskForResumeData___block_invoke_119;
        v92 = &unk_189C07620;
        uint64_t v93 = v33;
        uint64_t v94 = (__NSCFBackgroundDownloadTask *)v3;
        uint64_t v95 = (uint64_t)v27;
        objc_msgSend( (id)objc_msgSend(v34, "synchronousRemoteObjectProxyWithErrorHandler:", __str),  "downloadTaskWithResumeData:identifier:uniqueIdentifier:reply:",  v7,  -[NSURLSessionTask taskIdentifier](v33, "taskIdentifier"),  -[NSURLSessionTask _uniqueIdentifier](v33, "_uniqueIdentifier"),  &v89);
LABEL_74:
        uint64_t v59 = v33;
        goto LABEL_81;
      }

      int v60 = [*(id *)(v3 + 112) _isProxySession];
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      __int128 v61 = (os_log_s *)CFNLog::logger;
      BOOL v62 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
      if (v60)
      {
        if (!v62) {
          goto LABEL_72;
        }
        uint64_t v63 = *(void *)(v3 + 128);
        *(_DWORD *)__int128 buf = 138543362;
        uint64_t v97 = v63;
        v64 = "ProxySession <%{public}@> failed to create a background NSURLSessionDownloadTask, as remote session is unavailable";
      }

      else
      {
        if (!v62) {
          goto LABEL_72;
        }
        uint64_t v86 = *(void *)(v3 + 128);
        *(_DWORD *)__int128 buf = 138543362;
        uint64_t v97 = v86;
        v64 = "BackgroundSession <%{public}@> failed to create a background NSURLSessionDownloadTask, as remote session is unavailable";
      }

      _os_log_error_impl(&dword_18298D000, v61, OS_LOG_TYPE_ERROR, v64, buf, 0xCu);
LABEL_72:
      uint64_t v78 = [v27 URL];
      __int16 v79 = (void *)objc_msgSend(MEMORY[0x189607870], "_web_errorWithDomain:code:URL:", *MEMORY[0x189607740], -1, v78);
      if (v33) {
        objc_setProperty_atomic(v33, v80, v79, 776LL);
      }
      goto LABEL_74;
    }

    int v45 = [*(id *)(v3 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v46 = (os_log_s *)CFNLog::logger;
    BOOL v47 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
    if (v45)
    {
      if (v47)
      {
        uint64_t v48 = *(void *)(v3 + 128);
        *(_DWORD *)__int128 buf = 138543362;
        uint64_t v97 = v48;
        uint64_t v49 = "ProxySession <%{public}@> Invalid resume data for background download. Background downloads must use http "
              "or https and must download to an accessible file.";
LABEL_53:
        _os_log_impl(&dword_18298D000, v46, OS_LOG_TYPE_DEFAULT, v49, buf, 0xCu);
      }
    }

    else if (v47)
    {
      uint64_t v56 = *(void *)(v3 + 128);
      *(_DWORD *)__int128 buf = 138543362;
      uint64_t v97 = v56;
      uint64_t v49 = "BackgroundSession <%{public}@> Invalid resume data for background download. Background downloads must use ht"
            "tp or https and must download to an accessible file.";
      goto LABEL_53;
    }

    id v57 = (void *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607740] code:-3003 userInfo:0];
    uint64_t v58 = (objc_class *)objc_opt_class();
    uint64_t v59 = (__NSCFBackgroundDownloadTask *)-[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:]( (void *)v3,  v58,  v57);
    goto LABEL_81;
  }

  int v12 = [*(id *)(v3 + 112) _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  uint64_t Property = CFNLog::logger;
  BOOL v13 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v12)
  {
    if (!v13) {
      goto LABEL_30;
    }
    uint64_t v14 = *(void *)(v3 + 128);
    *(_DWORD *)__str = 138543362;
    *(void *)&__str[4] = v14;
    int v15 = "ProxySession <%{public}@> attempted to create a NSURLSessionDownloadTask in a session that has been invalidated";
  }

  else
  {
    if (!v13) {
      goto LABEL_30;
    }
    uint64_t v81 = *(void *)(v3 + 128);
    *(_DWORD *)__str = 138543362;
    *(void *)&__str[4] = v81;
    int v15 = "BackgroundSession <%{public}@> attempted to create a NSURLSessionDownloadTask in a session that has been invalidated";
  }

  _os_log_error_impl(&dword_18298D000, (os_log_t)Property, OS_LOG_TYPE_ERROR, v15, __str, 0xCu);
LABEL_30:
  BOOL v35 = (NSString *)dyld_program_sdk_at_least();
  if (!(_DWORD)v35)
  {
LABEL_6:
    p_isa = 0LL;
    goto LABEL_9;
  }

  __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v35);
  __break(1u);
LABEL_32:
  if (([(id)Property _isSafeRequestForBackgroundDownload] & 1) == 0)
  {
    int v50 = [*(id *)(v3 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    int v51 = (os_log_s *)CFNLog::logger;
    BOOL v52 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
    if (v50)
    {
      if (v52)
      {
        uint64_t v53 = *(void *)(v3 + 128);
        uint64_t v54 = objc_msgSend((id)objc_msgSend((id)Property, "URL"), "scheme");
        *(_DWORD *)__str = 138543618;
        *(void *)&__str[4] = v53;
        *(_WORD *)&__str[12] = 2112;
        *(void *)&__str[14] = v54;
        uint64_t v55 = "ProxySession <%{public}@> Invalid URL scheme for background downloads: %@. Valid schemes are http or https";
LABEL_62:
        _os_log_impl(&dword_18298D000, v51, OS_LOG_TYPE_DEFAULT, v55, __str, 0x16u);
      }
    }

    else if (v52)
    {
      uint64_t v65 = *(void *)(v3 + 128);
      uint64_t v66 = objc_msgSend((id)objc_msgSend((id)Property, "URL"), "scheme");
      *(_DWORD *)__str = 138543618;
      *(void *)&__str[4] = v65;
      *(_WORD *)&__str[12] = 2112;
      *(void *)&__str[14] = v66;
      uint64_t v55 = "BackgroundSession <%{public}@> Invalid URL scheme for background downloads: %@. Valid schemes are http or https";
      goto LABEL_62;
    }

    id v67 = (void *)MEMORY[0x189607870];
    uint64_t v68 = [(id)Property URL];
    uint64_t v69 = (void *)objc_msgSend(v67, "_web_errorWithDomain:code:URL:", *MEMORY[0x189607740], -1002, v68);
    id v70 = (objc_class *)objc_opt_class();
    uint64_t v59 = (__NSCFBackgroundDownloadTask *)-[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:]( (void *)v3,  v70,  v69);
    goto LABEL_81;
  }

  uint64_t v36 = objc_alloc(&OBJC_CLASS_____NSCFBackgroundDownloadTask);
  uint64_t v37 = *(void *)(v3 + 160);
  *(void *)(v3 + 160) = v37 + 1;
  uint64_t v38 = -[__NSCFBackgroundSessionTask initWithOriginalRequest:ident:taskGroup:]( v36,  "initWithOriginalRequest:ident:taskGroup:",  Property,  v37,  [(id)v3 defaultTaskGroup]);
  -[NSURLSessionTask updateCurrentRequest:](v38, "updateCurrentRequest:", Property);
  BOOL v39 = *(void **)(v3 + 168);
  if (!v39)
  {
    int v73 = [*(id *)(v3 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    int v74 = (os_log_s *)CFNLog::logger;
    BOOL v75 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v73)
    {
      if (!v75) {
        goto LABEL_78;
      }
      uint64_t v76 = *(void *)(v3 + 128);
      *(_DWORD *)__str = 138543362;
      *(void *)&__str[4] = v76;
      __int16 v77 = "ProxySession <%{public}@> failed to create a background NSURLSessionDownloadTask, as remote session is unavailable";
    }

    else
    {
      if (!v75) {
        goto LABEL_78;
      }
      uint64_t v87 = *(void *)(v3 + 128);
      *(_DWORD *)__str = 138543362;
      *(void *)&__str[4] = v87;
      __int16 v77 = "BackgroundSession <%{public}@> failed to create a background NSURLSessionDownloadTask, as remote session is unavailable";
    }

    _os_log_error_impl(&dword_18298D000, v74, OS_LOG_TYPE_ERROR, v77, __str, 0xCu);
LABEL_78:
    uint64_t v82 = [(id)Property URL];
    uint64_t v83 = (void *)objc_msgSend(MEMORY[0x189607870], "_web_errorWithDomain:code:URL:", *MEMORY[0x189607740], -1, v82);
    if (v38) {
      objc_setProperty_atomic(v38, v84, v83, 776LL);
    }
    goto LABEL_80;
  }

  uint64_t v40 = MEMORY[0x1895F87A8];
  uint64_t v89 = MEMORY[0x1895F87A8];
  uint64_t v90 = 3221225472LL;
  v91 = __60____NSURLBackgroundSession__onqueue_downloadTaskForRequest___block_invoke;
  v92 = &unk_189C075F8;
  uint64_t v93 = (__NSCFBackgroundDownloadTask *)v3;
  uint64_t v94 = v38;
  uint64_t v95 = Property;
  SEL v41 = (void *)[v39 synchronousRemoteObjectProxyWithErrorHandler:&v89];
  if (!*(_BYTE *)(v3 + 264)) {
    goto LABEL_64;
  }
  if (__CFNProcessIsMobileAssetDaemon::onceToken != -1) {
    dispatch_once(&__CFNProcessIsMobileAssetDaemon::onceToken, &__block_literal_global_18);
  }
  if ((!__CFNProcessIsMobileAssetDaemon::result || geteuid())
    && (SEL v42 = -[__NSURLBackgroundSession backgroundDownloadsDirectory](v3)) != 0LL)
  {
    snprintf( __str,  0x400uLL,  "%s",  (const char *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v42, "path"),  "stringByAppendingPathComponent:",  @"CFNetworkDownload_XXXXXX.tmp"),  "UTF8String"));
    int v43 = mkstemps(__str, 4);
    close(v43);
    id v44 = (id)[objc_alloc(NSString) initWithUTF8String:__str];
  }

  else
  {
LABEL_64:
    id v44 = 0LL;
  }

  uint64_t v71 = -[NSURLSessionTask taskIdentifier](v38, "taskIdentifier");
  uint64_t v72 = -[NSURLSessionTask _uniqueIdentifier](v38, "_uniqueIdentifier");
  *(void *)__str = v40;
  *(void *)&__str[8] = 3221225472LL;
  *(void *)&__str[16] = __60____NSURLBackgroundSession__onqueue_downloadTaskForRequest___block_invoke_123;
  v99 = &unk_189C07620;
  BOOL v100 = v38;
  v101 = (__NSCFBackgroundDownloadTask *)v3;
  uint64_t v102 = Property;
  [v41 downloadTaskWithRequest:Property originalRequest:Property downloadFilePath:v44 identifier:v71 uniqueIdentifier:v72 reply:__str];
LABEL_80:
  uint64_t v59 = v38;
LABEL_81:
  p_isa = &v59->super.super.super.isa;
  if (v59)
  {
    objc_msgSend( *(id *)(v3 + 184),  "setObject:forKeyedSubscript:",  v59,  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[NSURLSessionTask taskIdentifier](v59, "taskIdentifier")));
    uint64_t v85 = p_isa[88];
    if (!v85) {
      uint64_t v85 = p_isa[87];
    }
    -[__NSCFURLSessionDelegateWrapper didCreateTask:](v85, p_isa);
  }

void __60____NSURLBackgroundSession__onqueue_downloadTaskForRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 112);
  }
  else {
    uint64_t v5 = 0LL;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  int v7 = (os_log_s *)CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    *(_DWORD *)id v17 = 138543618;
    *(void *)&v17[4] = v9;
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = a2;
    uint64_t v10 = "ProxySession <%{public}@> error requesting a NSURLSessionDownloadTask from background transfer daemon: %@";
  }

  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      uint64_t v16 = *(void *)(v16 + 128);
    }
    *(_DWORD *)id v17 = 138543618;
    *(void *)&v17[4] = v16;
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = a2;
    uint64_t v10 = "BackgroundSession <%{public}@> error requesting a NSURLSessionDownloadTask from background transfer daemon: %@";
  }

  _os_log_error_impl(&dword_18298D000, v7, OS_LOG_TYPE_ERROR, v10, v17, 0x16u);
LABEL_11:
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 48), "URL", *(_OWORD *)v17, *(void *)&v17[16], v18);
  if (v12)
  {
    int v15 = (void *)objc_msgSend(MEMORY[0x189607870], "_web_errorWithDomain:code:URL:", *MEMORY[0x189607740], -1, v13);
    if (!v11) {
      return;
    }
  }

  else
  {
    int v15 = 0LL;
    if (!v11) {
      return;
    }
  }

  objc_setProperty_atomic(v11, v14, v15, 776LL);
}

void __60____NSURLBackgroundSession__onqueue_downloadTaskForRequest___block_invoke_123(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 48) URL];
    if (v3)
    {
      int v6 = (void *)objc_msgSend(MEMORY[0x189607870], "_web_errorWithDomain:code:URL:", *MEMORY[0x189607740], -1, v4);
      if (!v2) {
        return;
      }
    }

    else
    {
      int v6 = 0LL;
      if (!v2) {
        return;
      }
    }

    objc_setProperty_atomic(v2, v5, v6, 776LL);
  }

void __63____NSURLBackgroundSession__onqueue_downloadTaskForResumeData___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 112);
  }
  else {
    uint64_t v5 = 0LL;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  int v7 = (os_log_s *)CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    *(_DWORD *)id v17 = 138543618;
    *(void *)&v17[4] = v9;
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = a2;
    uint64_t v10 = "ProxySession <%{public}@> error requesting a NSURLSessionDownloadTask from background transfer daemon: %@";
  }

  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      uint64_t v16 = *(void *)(v16 + 128);
    }
    *(_DWORD *)id v17 = 138543618;
    *(void *)&v17[4] = v16;
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = a2;
    uint64_t v10 = "BackgroundSession <%{public}@> error requesting a NSURLSessionDownloadTask from background transfer daemon: %@";
  }

  _os_log_error_impl(&dword_18298D000, v7, OS_LOG_TYPE_ERROR, v10, v17, 0x16u);
LABEL_11:
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 48), "URL", *(_OWORD *)v17, *(void *)&v17[16], v18);
  if (v12)
  {
    int v15 = (void *)objc_msgSend(MEMORY[0x189607870], "_web_errorWithDomain:code:URL:", *MEMORY[0x189607740], -1, v13);
    if (!v11) {
      return;
    }
  }

  else
  {
    int v15 = 0LL;
    if (!v11) {
      return;
    }
  }

  objc_setProperty_atomic(v11, v14, v15, 776LL);
}

void __63____NSURLBackgroundSession__onqueue_downloadTaskForResumeData___block_invoke_119( uint64_t a1,  char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 48) URL];
    if (v3)
    {
      int v6 = (void *)objc_msgSend(MEMORY[0x189607870], "_web_errorWithDomain:code:URL:", *MEMORY[0x189607740], -1, v4);
      if (!v2) {
        return;
      }
    }

    else
    {
      int v6 = 0LL;
      if (!v2) {
        return;
      }
    }

    objc_setProperty_atomic(v2, v5, v6, 776LL);
  }

uint64_t __56____NSURLBackgroundSession__uploadTaskWithTaskForClass___block_invoke( uint64_t result,  const char *a2)
{
  uint64_t v2 = result;
  uint64_t v100 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(__NSCFBackgroundUploadTask **)(result + 32);
  if (v3)
  {
    uint64_t v4 = *(__NSCFResumableUploadState **)(result + 40);
    if (v4)
    {
      id Property = objc_getProperty(*(id *)(result + 40), a2, 16LL, 1);
      int v7 = (NSURL *)objc_getProperty(v4, v6, 32LL, 1);
      id v9 = objc_getProperty(v4, v8, 40LL, 1);
      id v11 = objc_getProperty(v4, v10, 48LL, 1);
    }

    else
    {
      id v9 = 0LL;
      id Property = 0LL;
      int v7 = 0LL;
      id v11 = 0LL;
    }

    if (![Property HTTPBody] && !objc_msgSend(Property, "HTTPBodyStream")) {
      goto LABEL_17;
    }
    if (__CFNIsRunningInXcode::envCheckOnce != -1) {
      dispatch_once(&__CFNIsRunningInXcode::envCheckOnce, &__block_literal_global_29);
    }
    if (__CFNIsRunningInXcode::runningInXcode == 1)
    {
      if (__CFNRuntimeIssuesLogHandle::onceToken != -1) {
        dispatch_once(&__CFNRuntimeIssuesLogHandle::onceToken, &__block_literal_global_4_4722);
      }
      uint64_t v13 = (os_log_s *)__CFNRuntimeIssuesLogHandle::logger;
      if (os_log_type_enabled((os_log_t)__CFNRuntimeIssuesLogHandle::logger, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
      }
    }

    if ([Property HTTPBody]
      && (unint64_t)objc_msgSend((id)objc_msgSend(Property, "HTTPBody"), "length") > 0x4000)
    {
      id v14 = (id)[Property mutableCopy];
      [v14 setHTTPBody:0];
      if (v7)
      {
        char v15 = 0;
      }

      else
      {
        uint64_t v16 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"), "temporaryDirectory");
        int v7 = (NSURL *)objc_msgSend( v16,  "URLByAppendingPathComponent:isDirectory:",  objc_msgSend((id)objc_msgSend(MEMORY[0x189607AB8], "UUID"), "UUIDString"),  0);
        objc_msgSend((id)objc_msgSend(Property, "HTTPBody"), "writeToURL:atomically:", v7, 0);
        char v15 = 1;
      }

      id Property = v14;
    }

    else
    {
LABEL_17:
      char v15 = 0;
    }

    uint64_t v17 = MEMORY[0x1895F87A8];
    v84[0] = MEMORY[0x1895F87A8];
    v84[1] = 3221225472LL;
    uint64_t v85 = __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke;
    uint64_t v86 = &unk_189C1A340;
    char v88 = v15;
    uint64_t v87 = v7;
    if (v4)
    {
      id v18 = objc_getProperty(v4, v12, 64LL, 1);
      if (v18)
      {
        uint64_t v19 = +[__NSCFResumableUploadState rusWithResumeData:]((uint64_t)&OBJC_CLASS_____NSCFResumableUploadState, v18);
        uint64_t v4 = v19;
        if (v19)
        {
          id Property = objc_getProperty(v19, v20, 32LL, 1);
          int bodyType = v4->_bodyType;
          if (bodyType)
          {
            if (bodyType == 1) {
              int v7 = -[__NSCFResumableUploadState uploadFile](v4, "uploadFile");
            }
          }

          else
          {
            id v9 = objc_getProperty(v4, v21, 40LL, 1);
          }

          char v23 = 0;
LABEL_35:
          -[__NSURLBackgroundSession validateSerializabilityForRequest:completion:]((uint64_t)Property, (uint64_t)v11);
          if (!v7) {
            goto LABEL_38;
          }
          if (-[NSURL isFileURL](v7, "isFileURL"))
          {
            if (-[NSURL _isSafeFileForBackgroundUploadForMe](v7, "_isSafeFileForBackgroundUploadForMe"))
            {
LABEL_38:
              char v27 = v23 ^ 1;
              if (Property) {
                char v27 = 1;
              }
              if ((v27 & 1) == 0)
              {
                if (dyld_program_sdk_at_least())
                {
                  __URLSESSION_CLIENT_API_MISUSE_NIL_ARGUMENT__(@"Cannot create upload task without request or resume data");
                  while (1)
                  {
LABEL_152:
                    __break(1u);
LABEL_153:
                    uint64_t v80 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"Upload tasks from NSData are not supported in background sessions." userInfo:0];
LABEL_151:
                    objc_exception_throw(v80);
                  }
                }

                goto LABEL_59;
              }

              if (BYTE1(v3->super.super.super._resumableUploadState))
              {
                if ([*(id *)&v3->super.super.super._allowsConstrainedOverride _isProxySession])
                {
                  if (CFNLog::onceToken != -1) {
                    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
                  }
                  uint64_t v28 = (os_log_s *)CFNLog::logger;
                  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v29 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
                    LODWORD(buf) = 138543362;
                    *(void *)((char *)&buf + 4) = v29;
                    uint64_t v30 = "ProxySession <%{public}@> attempted to create a NSURLSessionUploadTask in a session that has been invalidated";
LABEL_97:
                    _os_log_error_impl(&dword_18298D000, v28, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&buf, 0xCu);
                  }
                }

                else
                {
                  if (CFNLog::onceToken != -1) {
                    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
                  }
                  uint64_t v28 = (os_log_s *)CFNLog::logger;
                  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v56 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
                    LODWORD(buf) = 138543362;
                    *(void *)((char *)&buf + 4) = v56;
                    uint64_t v30 = "BackgroundSession <%{public}@> attempted to create a NSURLSessionUploadTask in a session that "
                          "has been invalidated";
                    goto LABEL_97;
                  }
                }

                unint64_t v33 = (NSString *)dyld_program_sdk_at_least();
                if ((_DWORD)v33)
                {
                  __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v33);
                  goto LABEL_152;
                }

                goto LABEL_59;
              }

              if (*(void *)&v3->super.super.super._startTime)
              {
                uint64_t v31 = (objc_class *)objc_opt_class();
                uint64_t v32 = (__NSCFBackgroundUploadTask *)-[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:]( v3,  v31,  *(void **)&v3->super.super.super._startTime);
LABEL_138:
                uint64_t v3 = v32;
                goto LABEL_60;
              }

              if (!v7 && v9) {
                goto LABEL_153;
              }
              BOOL v34 = objc_alloc(&OBJC_CLASS_____NSCFBackgroundUploadTask);
              uint64_t originalRequest = (uint64_t)v3->super.super.super._originalRequest;
              v3->super.super.super._uint64_t originalRequest = (NSURLRequest *)(originalRequest + 1);
              uint64_t v36 = -[__NSCFBackgroundDataTask initWithOriginalRequest:ident:taskGroup:]( v34,  "initWithOriginalRequest:ident:taskGroup:",  Property,  originalRequest,  -[__NSCFBackgroundUploadTask defaultTaskGroup](v3, "defaultTaskGroup"));
              uint64_t v38 = v36;
              if (v36) {
                objc_setProperty_atomic_copy(v36, v37, v7, 848LL);
              }
              -[NSURLSessionTask updateCurrentRequest:](v38, "updateCurrentRequest:", Property);
              currentRequest = v3->super.super.super._currentRequest;
              if (currentRequest)
              {
                *(void *)&__int128 buf = v17;
                *((void *)&buf + 1) = 3221225472LL;
                uint64_t v95 = __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_105;
                uint64_t v96 = &unk_189C075F8;
                uint64_t v97 = v3;
                int v98 = v38;
                id v99 = Property;
                uint64_t v81 = (void *)-[NSURLRequest synchronousRemoteObjectProxyWithErrorHandler:]( currentRequest,  "synchronousRemoteObjectProxyWithErrorHandler:",  &buf);
                if (!v7)
                {
                  uint64_t v47 = 0LL;
                  goto LABEL_130;
                }

                -[NSURL fileSystemRepresentation](v7, "fileSystemRepresentation");
                uint64_t v40 = (const char *)sandbox_extension_issue_file();
                if ([*(id *)&v3->super.super.super._allowsConstrainedOverride _isProxySession])
                {
                  if (CFNLog::onceToken != -1) {
                    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
                  }
                  SEL v41 = (os_log_s *)CFNLog::logger;
                  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v42 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
                    *(_DWORD *)uint64_t v89 = 138544130;
                    *(void *)&v89[4] = v42;
                    *(_WORD *)&v89[12] = 2114;
                    *(void *)&v89[14] = v38;
                    *(_WORD *)&v89[22] = 2112;
                    uint64_t v90 = v7;
                    LOWORD(v91) = 1024;
                    *(_DWORD *)((char *)&v91 + 2) = v40 != 0LL;
                    int v43 = "ProxySession <%{public}@> %{public}@ issued sandbox extension for file %@, succeeded = %{BOOL}d";
LABEL_83:
                    _os_log_impl(&dword_18298D000, v41, OS_LOG_TYPE_DEFAULT, v43, v89, 0x26u);
                  }
                }

                else
                {
                  if (CFNLog::onceToken != -1) {
                    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
                  }
                  SEL v41 = (os_log_s *)CFNLog::logger;
                  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v48 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
                    *(_DWORD *)uint64_t v89 = 138544130;
                    *(void *)&v89[4] = v48;
                    *(_WORD *)&v89[12] = 2114;
                    *(void *)&v89[14] = v38;
                    *(_WORD *)&v89[22] = 2112;
                    uint64_t v90 = v7;
                    LOWORD(v91) = 1024;
                    *(_DWORD *)((char *)&v91 + 2) = v40 != 0LL;
                    int v43 = "BackgroundSession <%{public}@> %{public}@ issued sandbox extension for file %@, succeeded = %{BOOL}d";
                    goto LABEL_83;
                  }
                }

                if (v40)
                {
                  uint64_t v47 = [MEMORY[0x189603F48] dataWithBytesNoCopy:v40 length:strlen(v40) + 1];
                  goto LABEL_104;
                }

                if ([*(id *)&v3->super.super.super._allowsConstrainedOverride _isProxySession])
                {
                  if (CFNLog::onceToken != -1) {
                    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
                  }
                  BOOL v52 = (os_log_s *)CFNLog::logger;
                  if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_103;
                  }
                  uint64_t v53 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
                  int v54 = *__error();
                  *(_DWORD *)uint64_t v89 = 138543874;
                  *(void *)&v89[4] = v53;
                  *(_WORD *)&v89[12] = 2112;
                  *(void *)&v89[14] = v7;
                  *(_WORD *)&v89[22] = 1024;
                  LODWORD(v90) = v54;
                  uint64_t v55 = "ProxySession <%{public}@> Failed to issue sandbox extension for file %@, errno = %{errno}d";
                }

                else
                {
                  if (CFNLog::onceToken != -1) {
                    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
                  }
                  BOOL v52 = (os_log_s *)CFNLog::logger;
                  if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_103;
                  }
                  uint64_t v74 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
                  int v75 = *__error();
                  *(_DWORD *)uint64_t v89 = 138543874;
                  *(void *)&v89[4] = v74;
                  *(_WORD *)&v89[12] = 2112;
                  *(void *)&v89[14] = v7;
                  *(_WORD *)&v89[22] = 1024;
                  LODWORD(v90) = v75;
                  uint64_t v55 = "BackgroundSession <%{public}@> Failed to issue sandbox extension for file %@, errno = %{errno}d";
                }

                _os_log_error_impl(&dword_18298D000, v52, OS_LOG_TYPE_ERROR, v55, v89, 0x1Cu);
LABEL_103:
                uint64_t v47 = 0LL;
LABEL_104:
                if (-[NSURL getResourceValue:forKey:error:]( v7,  "getResourceValue:forKey:error:",  &v83,  *MEMORY[0x189603BD0],  &v82))
                {
                  if (v83 == *MEMORY[0x189603BB8] || v83 == *MEMORY[0x189603BC0])
                  {
                    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
                      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4727);
                    }
                    uint64_t v58 = (os_log_s *)__CFNAPIMisuseFaultLogHandle::logger;
                    if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)uint64_t v89 = 138412546;
                      *(void *)&v89[4] = v7;
                      *(_WORD *)&v89[12] = 2112;
                      *(void *)&v89[14] = v83;
                      _os_log_fault_impl( &dword_18298D000,  v58,  OS_LOG_TYPE_FAULT,  "API MISUSE: Background upload from a file %@ with %@ is not supported. Please reduce the file protection class.",  v89,  0x16u);
                    }
                  }

                  goto LABEL_119;
                }

                if ([*(id *)&v3->super.super.super._allowsConstrainedOverride _isProxySession])
                {
                  if (CFNLog::onceToken != -1) {
                    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
                  }
                  uint64_t v59 = (os_log_s *)CFNLog::logger;
                  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v60 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
                    *(_DWORD *)uint64_t v89 = 138543618;
                    *(void *)&v89[4] = v60;
                    *(_WORD *)&v89[12] = 2112;
                    *(void *)&v89[14] = v82;
                    __int128 v61 = "ProxySession <%{public}@> Failed to check file protection class %@";
LABEL_142:
                    _os_log_debug_impl(&dword_18298D000, v59, OS_LOG_TYPE_DEBUG, v61, v89, 0x16u);
                  }
                }

                else
                {
                  if (CFNLog::onceToken != -1) {
                    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
                  }
                  uint64_t v59 = (os_log_s *)CFNLog::logger;
                  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v73 = *(void *)&v3->super.super.super._requiresDNSSECValidation;
                    *(_DWORD *)uint64_t v89 = 138543618;
                    *(void *)&v89[4] = v73;
                    *(_WORD *)&v89[12] = 2112;
                    *(void *)&v89[14] = v82;
                    __int128 v61 = "BackgroundSession <%{public}@> Failed to check file protection class %@";
                    goto LABEL_142;
                  }
                }

uint64_t __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 40)) {
    return objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "removeItemAtURL:error:",  *(void *)(result + 32),  0);
  }
  return result;
}

void __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_105(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 112);
  }
  else {
    uint64_t v5 = 0LL;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  int v7 = (os_log_s *)CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    *(_DWORD *)uint64_t v17 = 138543618;
    *(void *)&v17[4] = v9;
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = a2;
    SEL v10 = "ProxySession <%{public}@> error requesting a NSURLSessionUploadTask from background transfer daemon: %@";
  }

  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      uint64_t v16 = *(void *)(v16 + 128);
    }
    *(_DWORD *)uint64_t v17 = 138543618;
    *(void *)&v17[4] = v16;
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = a2;
    SEL v10 = "BackgroundSession <%{public}@> error requesting a NSURLSessionUploadTask from background transfer daemon: %@";
  }

  _os_log_error_impl(&dword_18298D000, v7, OS_LOG_TYPE_ERROR, v10, v17, 0x16u);
LABEL_11:
  uint64_t v12 = *(void *)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 48), "URL", *(_OWORD *)v17, *(void *)&v17[16], v18);
  if (v12)
  {
    char v15 = (void *)objc_msgSend(MEMORY[0x189607870], "_web_errorWithDomain:code:URL:", *MEMORY[0x189607740], -1, v13);
    if (!v11) {
      return;
    }
  }

  else
  {
    char v15 = 0LL;
    if (!v11) {
      return;
    }
  }

  objc_setProperty_atomic(v11, v14, v15, 776LL);
}

void __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_109(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 48) URL];
    if (v3)
    {
      int v6 = (void *)objc_msgSend(MEMORY[0x189607870], "_web_errorWithDomain:code:URL:", *MEMORY[0x189607740], -1, v4);
      if (!v2) {
        return;
      }
    }

    else
    {
      int v6 = 0LL;
      if (!v2) {
        return;
      }
    }

    objc_setProperty_atomic(v2, v5, v6, 776LL);
  }

void __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 48) URL];
    if (v3)
    {
      int v6 = (void *)objc_msgSend(MEMORY[0x189607870], "_web_errorWithDomain:code:URL:", *MEMORY[0x189607740], -1, v4);
      if (!v2) {
        return;
      }
    }

    else
    {
      int v6 = 0LL;
      if (!v2) {
        return;
      }
    }

    objc_setProperty_atomic(v2, v5, v6, 776LL);
  }

__NSCFBackgroundDataTask *__54____NSURLBackgroundSession__dataTaskWithTaskForClass___block_invoke( uint64_t a1,  const char *a2)
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3) {
    goto LABEL_27;
  }
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id Property = objc_getProperty(*(id *)(a1 + 40), a2, 16LL, 1);
    id v7 = objc_getProperty(v4, v6, 48LL, 1);
  }

  else
  {
    id Property = 0LL;
    id v7 = 0LL;
  }

  -[__NSURLBackgroundSession validateSerializabilityForRequest:completion:]((uint64_t)Property, (uint64_t)v7);
  if (([Property _isSafeRequestForBackgroundDownload] & 1) == 0)
  {
    int v13 = [*(id *)(v3 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    id v14 = (os_log_s *)CFNLog::logger;
    BOOL v15 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        uint64_t v16 = *(void *)(v3 + 128);
        *(_DWORD *)__int128 buf = 138543618;
        *(void *)&uint8_t buf[4] = v16;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = objc_msgSend((id)objc_msgSend(Property, "URL"), "scheme");
        uint64_t v17 = "ProxySession <%{public}@> Invalid URL scheme for background tasks: %@. Valid schemes are http or https";
LABEL_19:
        _os_log_impl(&dword_18298D000, v14, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);
      }
    }

    else if (v15)
    {
      uint64_t v18 = *(void *)(v3 + 128);
      *(_DWORD *)__int128 buf = 138543618;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = objc_msgSend((id)objc_msgSend(Property, "URL"), "scheme");
      uint64_t v17 = "BackgroundSession <%{public}@> Invalid URL scheme for background tasks: %@. Valid schemes are http or https";
      goto LABEL_19;
    }

    uint64_t v19 = (void *)MEMORY[0x189607870];
    uint64_t v20 = [Property URL];
    __int16 v21 = (void *)objc_msgSend(v19, "_web_errorWithDomain:code:URL:", *MEMORY[0x189607740], -1002, v20);
    int v22 = (objc_class *)objc_opt_class();
    result = (__NSCFBackgroundDataTask *)-[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:]( (void *)v3,  v22,  v21);
LABEL_28:
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = result;
    return result;
  }

  if (!Property)
  {
    if (!dyld_program_sdk_at_least())
    {
LABEL_27:
      result = 0LL;
      goto LABEL_28;
    }

    __URLSESSION_CLIENT_API_MISUSE_NIL_ARGUMENT__(@"Cannot create task from nil request");
LABEL_23:
    if (*(void *)(v3 + 272))
    {
      id v24 = (objc_class *)objc_opt_class();
      result = (__NSCFBackgroundDataTask *)-[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:]( (void *)v3,  v24,  *(void **)(v3 + 272));
      goto LABEL_28;
    }

    id v26 = objc_alloc(&OBJC_CLASS_____NSCFBackgroundDataTask);
    uint64_t v27 = *(void *)(v3 + 160);
    *(void *)(v3 + 160) = v27 + 1;
    uint64_t v29 = -[__NSCFBackgroundDataTask initWithOriginalRequest:ident:taskGroup:]( v26,  "initWithOriginalRequest:ident:taskGroup:",  Property,  v27,  [(id)v3 defaultTaskGroup]);
    if (v4 && objc_getProperty(v4, v28, 24LL, 1)) {
      -[NSURLSessionTask set_uniqueIdentifier:](v29, "set_uniqueIdentifier:", objc_getProperty(v4, v30, 24LL, 1));
    }
    -[NSURLSessionTask updateCurrentRequest:](v29, "updateCurrentRequest:", Property);
    uint64_t v31 = *(void **)(v3 + 168);
    if (v31)
    {
      *(void *)__int128 buf = MEMORY[0x1895F87A8];
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = __62____NSURLBackgroundSession__onqueue_dataTaskWithTaskForClass___block_invoke;
      uint64_t v45 = &unk_189C075F8;
      uint64_t v46 = v3;
      uint64_t v47 = v29;
      id v48 = Property;
      v43[0] = MEMORY[0x1895F87A8];
      v43[1] = 3221225472LL;
      v43[2] = __62____NSURLBackgroundSession__onqueue_dataTaskWithTaskForClass___block_invoke_95;
      v43[3] = &unk_189C07620;
      v43[4] = v29;
      v43[5] = v3;
      v43[6] = Property;
      objc_msgSend( (id)objc_msgSend(v31, "synchronousRemoteObjectProxyWithErrorHandler:", buf),  "dataTaskWithRequest:originalRequest:identifier:uniqueIdentifier:reply:",  Property,  Property,  -[NSURLSessionTask taskIdentifier](v29, "taskIdentifier"),  -[NSURLSessionTask _uniqueIdentifier](v29, "_uniqueIdentifier"),  v43);
      if (!v29)
      {
LABEL_46:
        result = v29;
        goto LABEL_28;
      }

void __62____NSURLBackgroundSession__onqueue_dataTaskWithTaskForClass___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 112);
  }
  else {
    uint64_t v5 = 0LL;
  }
  int v6 = [v5 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  id v7 = (os_log_s *)CFNLog::logger;
  BOOL v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    *(_DWORD *)uint64_t v17 = 138543618;
    *(void *)&v17[4] = v9;
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = a2;
    BOOL v10 = "ProxySession <%{public}@> error requesting a NSURLSessionDataTask from background transfer daemon: %@";
  }

  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      uint64_t v16 = *(void *)(v16 + 128);
    }
    *(_DWORD *)uint64_t v17 = 138543618;
    *(void *)&v17[4] = v16;
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = a2;
    BOOL v10 = "BackgroundSession <%{public}@> error requesting a NSURLSessionDataTask from background transfer daemon: %@";
  }

  _os_log_error_impl(&dword_18298D000, v7, OS_LOG_TYPE_ERROR, v10, v17, 0x16u);
LABEL_11:
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 48), "URL", *(_OWORD *)v17, *(void *)&v17[16], v18);
  if (v12)
  {
    BOOL v15 = (void *)objc_msgSend(MEMORY[0x189607870], "_web_errorWithDomain:code:URL:", *MEMORY[0x189607740], -1, v13);
    if (!v11) {
      return;
    }
  }

  else
  {
    BOOL v15 = 0LL;
    if (!v11) {
      return;
    }
  }

  objc_setProperty_atomic(v11, v14, v15, 776LL);
}

void __62____NSURLBackgroundSession__onqueue_dataTaskWithTaskForClass___block_invoke_95(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 48) URL];
    if (v3)
    {
      int v6 = (void *)objc_msgSend(MEMORY[0x189607870], "_web_errorWithDomain:code:URL:", *MEMORY[0x189607740], -1, v4);
      if (!v2) {
        return;
      }
    }

    else
    {
      int v6 = 0LL;
      if (!v2) {
        return;
      }
    }

    objc_setProperty_atomic(v2, v5, v6, 776LL);
  }

uint64_t __59____NSURLBackgroundSession__useTLSSessionCacheFromSession___block_invoke(uint64_t a1)
{
  return objc_msgSend( (id)-[__NSURLBackgroundSession ensureRemoteSession](*(void *)(a1 + 32)),  "setTLSSessionCachePrefix:",  objc_msgSend(*(id *)(a1 + 32), "_tlsSessionCachePrefix"));
}

uint64_t __63____NSURLBackgroundSession_appWasLaunchedForBackgroundSession___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 112);
  }
  else {
    uint64_t v3 = 0LL;
  }
  int v4 = [v3 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  uint64_t v5 = (os_log_s *)CFNLog::logger;
  BOOL v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        uint64_t v7 = *(void *)(v7 + 128);
      }
      int v11 = 138543362;
      uint64_t v12 = v7;
      BOOL v8 = "ProxySession <%{public}@> client was launched for background session";
LABEL_14:
      _os_log_impl(&dword_18298D000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0xCu);
    }
  }

  else if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    int v11 = 138543362;
    uint64_t v12 = v9;
    BOOL v8 = "BackgroundSession <%{public}@> client was launched for background session";
    goto LABEL_14;
  }

  *(_BYTE *)(*(void *)(a1 + 32) + 281LL) = 1;
  return -[__NSURLBackgroundSession ensureRemoteSession](*(void *)(a1 + 32));
}

uint64_t __47____NSURLBackgroundSession_cameIntoForeground___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 112);
  }
  else {
    uint64_t v3 = 0LL;
  }
  int v4 = [v3 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  uint64_t v5 = (os_log_s *)CFNLog::logger;
  BOOL v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        uint64_t v7 = *(void *)(v7 + 128);
      }
      *(_DWORD *)int v11 = 138543362;
      *(void *)&v11[4] = v7;
      BOOL v8 = "ProxySession <%{public}@> client transitioning to foreground";
LABEL_14:
      _os_log_impl(&dword_18298D000, v5, OS_LOG_TYPE_DEFAULT, v8, v11, 0xCu);
    }
  }

  else if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    *(_DWORD *)int v11 = 138543362;
    *(void *)&v11[4] = v9;
    BOOL v8 = "BackgroundSession <%{public}@> client transitioning to foreground";
    goto LABEL_14;
  }

  *(_BYTE *)(*(void *)(a1 + 32) + 281LL) = 1;
  objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 176), "remoteObjectProxy", *(_OWORD *)v11), "boost");
  return -[__NSURLBackgroundSession ensureRemoteSession](*(void *)(a1 + 32));
}

uint64_t __45____NSURLBackgroundSession_wentToBackground___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 112);
  }
  else {
    uint64_t v3 = 0LL;
  }
  int v4 = [v3 _isProxySession];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  uint64_t v5 = (os_log_s *)CFNLog::logger;
  BOOL v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        uint64_t v7 = *(void *)(v7 + 128);
      }
      int v11 = 138543362;
      uint64_t v12 = v7;
      BOOL v8 = "ProxySession <%{public}@> client transitioning to background";
LABEL_14:
      _os_log_impl(&dword_18298D000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0xCu);
    }
  }

  else if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 128);
    }
    int v11 = 138543362;
    uint64_t v12 = v9;
    BOOL v8 = "BackgroundSession <%{public}@> client transitioning to background";
    goto LABEL_14;
  }

  -[__NSURLBackgroundSession ensureRemoteSession](*(void *)(a1 + 32));
  return objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 176), "remoteObjectProxy"), "dropBoost");
}

void __95____NSURLBackgroundSession_initWithConfiguration_delegate_delegateQueue_delegateDispatchQueue___block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 168) && *(_DWORD *)(v2 + 284))
  {
    -[__NSURLBackgroundSession setupXPCConnection](v2);
    -[__NSURLBackgroundSession setupBackgroundSession](*(void *)(a1 + 32));
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(void *)(v3 + 216)) {
      -[__NSURLBackgroundSession sendInvalidationRequest](v3);
    }
  }

uint64_t __41____NSURLBackgroundSession_cleanupConfig__block_invoke(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if ([a2 HTTPAdditionalHeaders])
  {
    int v4 = (void *)objc_msgSend((id)objc_msgSend(a2, "HTTPAdditionalHeaders"), "mutableCopy");
    uint64_t v5 = v4;
    if (!a1[6]) {
      [v4 setObject:a1[4] forKeyedSubscript:0x18C5AF900];
    }
    if (!a1[7]) {
      [v5 setObject:a1[5] forKeyedSubscript:0x18C5AEC18];
    }
    return [a2 setHTTPAdditionalHeaders:v5];
  }

  else
  {
    v7[0] = 0x18C5AF900LL;
    v7[1] = 0x18C5AEC18LL;
    __int128 v8 = *((_OWORD *)a1 + 2);
    return objc_msgSend( a2,  "setHTTPAdditionalHeaders:",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v8, v7, 2));
  }

@end