@interface NSCFLocalDownloadTask
@end

@implementation NSCFLocalDownloadTask

void __37____NSCFLocalDownloadTask_checkWrite__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x186E1578C]();
  if (![*(id *)(a1 + 32) error])
  {
    uint64_t v3 = [*(id *)(a1 + 32) downloadFile];
    if (v3)
    {
      if (*(_DWORD *)(v3 + 188))
      {
        v4 = *(void **)(a1 + 32);
        uint64_t v5 = [v4 downloadFile];
        if (v5)
        {
          uint64_t v6 = *(int *)(v5 + 188);
          if (v4)
          {
LABEL_6:
            uint64_t v7 = [v4 error:*MEMORY[0x189607688] code:v6];
LABEL_7:
            [*(id *)(a1 + 32) setError:v7];
            goto LABEL_8;
          }
        }

        else
        {
          uint64_t v6 = 0LL;
          if (v4) {
            goto LABEL_6;
          }
        }

        uint64_t v7 = 0LL;
        goto LABEL_7;
      }
    }
  }

void __50____NSCFLocalDownloadTask__private_fileCompletion__block_invoke_48(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = v2[88];
    if (!v3) {
      uint64_t v3 = v2[87];
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __50____NSCFLocalDownloadTask__private_fileCompletion__block_invoke_2;
  v5[3] = &unk_189C1A548;
  v5[4] = v2;
  -[__NSCFURLSessionDelegateWrapper task:didFinishCollectingMetrics:completionHandler:](v3, v2, v4, v5);
}

void __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke(uint64_t a1)
{
}

void __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_2(uint64_t a1)
{
}

void __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_3(uint64_t a1)
{
}

uint64_t __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_4(uint64_t a1)
{
  return -[NSURLSession _onqueue_didCompleteTask:withError:]( [*(id *)(a1 + 32) session],  *(void **)(a1 + 32),  (void *)objc_msgSend(*(id *)(a1 + 32), "error"));
}

void __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_5(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = v2[88];
    if (!v3) {
      uint64_t v3 = v2[87];
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_6;
  v5[3] = &unk_189C1A548;
  v5[4] = v2;
  -[__NSCFURLSessionDelegateWrapper downloadTask:didFinishDownloadingToURL:completionHandler:](v3, v2, v4, v5);
}

uint64_t __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:3];
}

uint64_t __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_6(uint64_t a1)
{
  return -[NSURLSession _onqueue_didCompleteTask:withError:]( [*(id *)(a1 + 32) session],  *(void **)(a1 + 32),  (void *)objc_msgSend(*(id *)(a1 + 32), "error"));
}

void __42____NSCFLocalDownloadTask_reportProgress___block_invoke(uint64_t a1, const char *a2)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 1029LL) = 0;
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3 && objc_getProperty(v3, a2, 1008LL, 1))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    if (v5[125])
    {
      -[__NSCFLocalDownloadTask reportProgress:](v5);
    }

    else
    {
      Property = (void (**)(id))objc_getProperty(v5, v4, 1008LL, 1);
      v8 = *(void **)(a1 + 32);
      if (v8) {
        objc_setProperty_atomic_copy(v8, v6, 0LL, 1008LL);
      }
      if (Property) {
        Property[2](Property);
      }
    }
  }

void __63____NSCFLocalDownloadTask__private_errorCompletionAfterMetrics__block_invoke(uint64_t a1)
{
}

void __50____NSCFLocalDownloadTask__private_fileCompletion__block_invoke_2(uint64_t a1)
{
}

uint64_t __43____NSCFLocalDownloadTask_suspendExtractor__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  uint64_t v5 = (os_log_s *)CFNLog::logger;
  if (a3)
  {
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412802;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      v12 = a3;
      __int16 v13 = 2048;
      uint64_t v14 = [a3 code];
      _os_log_error_impl( &dword_18298D000,  v5,  OS_LOG_TYPE_ERROR,  "StreamingZip Error: suspending extractor for task: %@, error: %@ [%ld]",  (uint8_t *)&v9,  0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "cancel_with_error:", a3);
  }

  else if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_debug_impl( &dword_18298D000,  v5,  OS_LOG_TYPE_DEBUG,  "StreamingZip Suspending extractor for task: %@",  (uint8_t *)&v9,  0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __41____NSCFLocalDownloadTask_writeAndResume__block_invoke(uint64_t a1, int a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v4 = (void *)MEMORY[0x186E1578C]();
  if (a2)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v5 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [*(id *)(a1 + 32) _loggableDescription];
      uint64_t v11 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "downloadFile"), "path");
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      __int16 v18 = 1024;
      int v19 = a2;
      _os_log_error_impl( &dword_18298D000,  v5,  OS_LOG_TYPE_ERROR,  "%{public}@ : file write to %@ failed with posix error %d",  buf,  0x1Cu);
    }

    *(_BYTE *)(*(void *)(a1 + 32) + 1028LL) = 1;
    uint64_t v6 = *(void *)(a1 + 32);
    if (!*(_BYTE *)(v6 + 1030))
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 3221225472LL;
      v12[2] = __41____NSCFLocalDownloadTask_writeAndResume__block_invoke_37;
      v12[3] = &unk_189C1A318;
      v12[4] = v6;
      int v13 = a2;
      dispatch_async(global_queue, v12);
      goto LABEL_14;
    }

    if (![*(id *)(a1 + 32) error])
    {
      uint64_t v7 = *(void **)(a1 + 32);
      if (v7)
      {
        uint64_t v8 = [v7 error:*MEMORY[0x189607688] code:a2];
        uint64_t v7 = *(void **)(a1 + 32);
      }

      else
      {
        uint64_t v8 = 0LL;
      }

      [v7 setError:v8];
    }
  }

  else
  {
    -[__NSCFLocalDownloadTask reportProgress:](*(void **)(a1 + 32), *(const char **)(a1 + 40));
    *(_BYTE *)(*(void *)(a1 + 32) + 1028LL) = 1;
  }

  -[__NSCFLocalDownloadTask checkWrite](*(id *)(a1 + 32));
LABEL_14:
  objc_autoreleasePoolPop(v4);
}

uint64_t __41____NSCFLocalDownloadTask_writeAndResume__block_invoke_37(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v2 = [*(id *)(a1 + 32) error:*MEMORY[0x189607688] code:*(int *)(a1 + 40)];
  }
  else {
    uint64_t v2 = 0LL;
  }
  return objc_msgSend(v1, "cancel_with_error:", v2);
}

void *__82____NSCFLocalDownloadTask__task_onqueue_didReceiveDispatchData_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v5 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 138412802;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = a3;
      __int16 v15 = 2048;
      uint64_t v16 = [a3 code];
      _os_log_error_impl( &dword_18298D000,  v5,  OS_LOG_TYPE_ERROR,  "StreamingZip Error - failed in call to prepareForExtractionToPath for task %@.  Error=%@ [%ld]",  (uint8_t *)&v11,  0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "cancel_with_error:", a3);
    return (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    objc_msgSend(*(id *)(a1 + 32), "set_extractorPreparedForExtraction:", 1);
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v7 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      uint64_t v10 = *(void **)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_debug_impl( &dword_18298D000,  v7,  OS_LOG_TYPE_DEBUG,  "StreamingZip Debug - prepared to extract to %@ for task %@",  (uint8_t *)&v11,  0x16u);
    }

    return -[__NSCFLocalDownloadTask _supplyExtractorWithData:completion:]( *(void **)(a1 + 32),  *(dispatch_data_s **)(a1 + 40),  *(void *)(a1 + 48));
  }

uint64_t __63____NSCFLocalDownloadTask__supplyExtractorWithData_completion___block_invoke( uint64_t a1,  void *a2,  int a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v5 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [a2 code];
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v16 = a2;
      __int16 v17 = 2048;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      _os_log_error_impl( &dword_18298D000,  v5,  OS_LOG_TYPE_ERROR,  "StreamingZip Error supplying bytes to extractor: %@ [%ld] for task %@",  buf,  0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "cancel_with_error:", a2);
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  -[__NSCFLocalDownloadTask reportProgress:](*(void **)(a1 + 32), *(const char **)(a1 + 48));
  if (!a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  uint64_t v8 = (os_log_s *)CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v12;
    _os_log_debug_impl( &dword_18298D000,  v8,  OS_LOG_TYPE_DEBUG,  "StreamingZip - decode completed OK for task %@.",  buf,  0xCu);
  }

  if ([*(id *)(a1 + 32) _extractorFinishedDecoding]) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
  uint64_t v9 = (void *)[*(id *)(a1 + 32) _extractor];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __63____NSCFLocalDownloadTask__supplyExtractorWithData_completion___block_invoke_55;
  v13[3] = &unk_189C135B8;
  __int128 v14 = *(_OWORD *)(a1 + 32);
  return [v9 finishStreamWithCompletionBlock:v13];
}

uint64_t __63____NSCFLocalDownloadTask__supplyExtractorWithData_completion___block_invoke_55( uint64_t a1,  void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  v4 = (os_log_s *)CFNLog::logger;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [a2 code];
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412802;
      uint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_error_impl( &dword_18298D000,  v4,  OS_LOG_TYPE_ERROR,  "StreamingZip Error finishing extractor stream decoding: %@ [%ld] for task %@",  (uint8_t *)&v9,  0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "cancel_with_error:", a2);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void **)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_debug_impl( &dword_18298D000,  v4,  OS_LOG_TYPE_DEBUG,  "StreamingZip finishing extractor stream OK for task %@.",  (uint8_t *)&v9,  0xCu);
    }

    *(_BYTE *)(*(void *)(a1 + 32) + 1032LL) = 1;
  }

  objc_msgSend(*(id *)(a1 + 32), "set_extractorFinishedDecoding:", 1);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __66____NSCFLocalDownloadTask_terminateExtractorWithError_completion___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  v4 = (os_log_s *)CFNLog::logger;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138412802;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = a2;
      __int16 v11 = 2048;
      uint64_t v12 = [a2 code];
      _os_log_error_impl( &dword_18298D000,  v4,  OS_LOG_TYPE_ERROR,  "StreamingZip Error: terminating extractor for task: %@, error: %@ [%ld]",  (uint8_t *)&v7,  0x20u);
    }
  }

  else if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_debug_impl( &dword_18298D000,  v4,  OS_LOG_TYPE_DEBUG,  "StreamingZip Terminated extractor for task: %@",  (uint8_t *)&v7,  0xCu);
  }

uint64_t __55____NSCFLocalDownloadTask_cancelByProducingResumeData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_cancelByProducingResumeData:", *(void *)(a1 + 40));
}

uint64_t __64____NSCFLocalDownloadTask__onqueue_cancelByProducingResumeData___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __64____NSCFLocalDownloadTask__onqueue_cancelByProducingResumeData___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __64____NSCFLocalDownloadTask__onqueue_cancelByProducingResumeData___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __48____NSCFLocalDownloadTask_openItemForPath_mode___block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __62____NSCFLocalDownloadTask_initWithTaskGroup_resumeData_ident___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v5 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [*(id *)(a1 + 40) _loggableDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = a3;
      __int16 v15 = 2048;
      uint64_t v16 = [a3 code];
      _os_log_error_impl( &dword_18298D000,  v5,  OS_LOG_TYPE_ERROR,  "%{public}@ StreamingZip Error - init with resumeData failed calling prepareForExtraction. error=%@ [%ld]",  buf,  0x20u);
    }
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = a2;
    [*(id *)(a1 + 32) setValue:objc_msgSend(NSString, "stringWithFormat:", @"bytes=%lld-", a2), 0x18C5AF4D8 forHTTPHeaderField];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v8 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [*(id *)(a1 + 40) _loggableDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2048;
      uint64_t v14 = a2;
      _os_log_debug_impl( &dword_18298D000,  v8,  OS_LOG_TYPE_DEBUG,  "%{public}@ StreamingZip Debug - init with resumeData OK.  Resume offset is %lld.",  buf,  0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "set_extractorPreparedForExtraction:", 1);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end