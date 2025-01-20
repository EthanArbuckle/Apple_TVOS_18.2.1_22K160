@interface NSCFLocalSessionTask
@end

@implementation NSCFLocalSessionTask

uint64_t __88____NSCFLocalSessionTask__onqueue_setupNextEffectiveConfigurationWithCompletionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (!a2) {
    return [*(id *)(a1 + 32) cancel];
  }
  if (*(void *)(a1 + 40) != a2) {
    objc_msgSend( *(id *)(a1 + 32),  "_onqueue_adoptEffectiveConfiguration:",  +[NSURLSessionConfiguration immutableEffectiveConfigurationFromConfig:]( NSURLSessionConfiguration,  "immutableEffectiveConfigurationFromConfig:",  a2));
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t __67____NSCFLocalSessionTask_connection_didReceiveResponse_completion___block_invoke(uint64_t *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __67____NSCFLocalSessionTask_connection_didReceiveResponse_completion___block_invoke_2;
  v6[3] = &unk_189C1A5C0;
  uint64_t v4 = a1[6];
  v6[4] = v2;
  v6[5] = v4;
  return objc_msgSend(v2, "_onqueue_didReceiveResponse:completion:", v3, v6);
}

uint64_t __67____NSCFLocalSessionTask_connection_didReceiveResponse_completion___block_invoke_2( uint64_t a1,  __int128 *a2,  uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5 && *(void *)(v5 + 912))
  {
    int v6 = *(_DWORD *)(v5 + 920);
    if (v6 <= 0) {
      __assert_rtn( "-[__NSCFLocalSessionTask _onqueue_resumeWorkQueue]",  "LocalSessionTask.mm",  1325,  "_connectionWorkQueueSuspensionCount > 0");
    }
    int v7 = v6 - 1;
    *(_DWORD *)(v5 + 920) = v7;
    if (!v7) {
      [*(id *)(v5 + 912) setSuspended:0];
    }
  }

  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v11 = *((void *)a2 + 2);
  __int128 v10 = *a2;
  return (*(uint64_t (**)(uint64_t, __int128 *, uint64_t))(v8 + 16))(v8, &v10, a3);
}

void __49____NSCFLocalSessionTask__task_onqueue_didFinish__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = v1[88];
    if (!v2) {
      uint64_t v2 = v1[87];
    }
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  -[__NSCFURLSessionDelegateWrapper task:didFinishCollectingMetrics:completionHandler:]( v2,  v1,  *(void **)(a1 + 40),  *(void **)(a1 + 48));
}

void __49____NSCFLocalSessionTask__task_onqueue_didFinish__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(_BYTE **)(a1 + 32);
  if (!v3) {
    goto LABEL_12;
  }
  id Property = objc_getProperty(v3, a2, 784LL, 1);
  uint64_t v3 = *(_BYTE **)(a1 + 32);
  if (!Property)
  {
    if (v3)
    {
      if ((v3[927] & 1) != 0) {
        goto LABEL_14;
      }
      v3[927] = 1;
      uint64_t v3 = *(_BYTE **)(a1 + 32);
    }

void __81____NSCFLocalSessionTask__onqueue_startTimer_withTimeoutInNanos_streamErrorCode___block_invoke_2( uint64_t a1)
{
}

uint64_t __72____NSCFLocalSessionTask_connection_didReceiveTCPConnection_extraBytes___block_invoke( uint64_t a1)
{
  std::shared_ptr<__CFString const>::operator=[abi:nn180100]( (void *)(*(void *)(a1 + 32) + 888LL),  *(void *)(a1 + 48),  *(void *)(a1 + 56));
  uint64_t result = [*(id *)(a1 + 40) copy];
  *(void *)(*(void *)(a1 + 32) + 904LL) = result;
  return result;
}

id __78____NSCFLocalSessionTask_connection_didReceiveSocketInputStream_outputStream___block_invoke( uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 872LL) = *(id *)(a1 + 40);
  id result = *(id *)(a1 + 48);
  *(void *)(*(void *)(a1 + 32) + 880LL) = result;
  return result;
}

uint64_t __60____NSCFLocalSessionTask_connection_alternatePathAvailable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_alternatePathAvailable:", *(unsigned int *)(a1 + 40));
}

uint64_t __69____NSCFLocalSessionTask_connection__conditionalRequirementsChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_conditionalRequirementsChanged:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __55____NSCFLocalSessionTask_connection_waitingWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_connectionWaitingWithReason:", *(void *)(a1 + 40));
}

uint64_t __89____NSCFLocalSessionTask_connection__willSendRequestForEstablishedConnection_completion___block_invoke( uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onqueue_willSendRequestForEstablishedConnection:withCompletion:",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
}

uint64_t __76____NSCFLocalSessionTask_connection_sentBodyBytes_totalBytes_expectedBytes___block_invoke( id *a1)
{
  return objc_msgSend( a1[4],  "_onqueue_didSendBodyBytes:totalBytesSent:totalBytesExpectedToSend:",  objc_msgSend(a1[5], "longLongValue"),  objc_msgSend(a1[6], "longLongValue"),  objc_msgSend(a1[7], "longLongValue"));
}

uint64_t __63____NSCFLocalSessionTask_connection_didReceiveData_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onqueue_didReceiveDispatchData:completion:",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
}

uint64_t __61____NSCFLocalSessionTask_connection_challenged_authCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onqueue_didReceiveChallenge:request:withCompletion:",  *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 32), "currentRequest"),  *(void *)(a1 + 48));
}

uint64_t __83____NSCFLocalSessionTask_connection_request_needsNewBodyStreamFromOffset_callback___block_invoke( uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onqueue_needNewBodyStream:fromOffset:withCompletion:",  *(void *)(a1 + 40),  *(void *)(a1 + 56),  *(void *)(a1 + 48));
}

uint64_t __72____NSCFLocalSessionTask_connection_request_needsNewBodyStreamCallback___block_invoke( uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onqueue_needNewBodyStream:withCompletion:",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
}

uint64_t __63____NSCFLocalSessionTask_connection_didFinishLoadingWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_didFinishWithError:", *(void *)(a1 + 40));
}

uint64_t __54____NSCFLocalSessionTask_connectionWillFinishLoading___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _releasePreventIdleSleepAssertionIfAppropriate];
}

uint64_t __72____NSCFLocalSessionTask_connection_willCacheResponse_responseCallback___block_invoke( uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onqueue_willCacheResponse:withCompletion:",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
}

void __69____NSCFLocalSessionTask_connection_didReceiveInformationalResponse___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void **)(a1 + 40);
    uint64_t v3 = v1[88];
    if (!v3) {
      uint64_t v3 = v1[87];
    }
    -[__NSCFURLSessionDelegateWrapper task:didReceiveInformationalResponse:](v3, v1, v2);
  }

uint64_t __79____NSCFLocalSessionTask_connection_wasRedirected_newRequest_responseCallback___block_invoke( uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onqueue_didReceiveResponse:redirectRequest:withCompletion:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56));
}

void __57____NSCFLocalSessionTask_set_timeoutIntervalForResource___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    double v2 = *(double *)(a1 + 40);
    uint64_t v3 = (dispatch_source_s *)v1[102];
    v1[102] = 0LL;
    if (v3)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v4 = (os_log_s *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
      {
        int v5 = 138543618;
        uint64_t v6 = [v1 _loggableDescription];
        __int16 v7 = 2048;
        double v8 = v2;
        _os_log_impl( &dword_18298D000,  v4,  OS_LOG_TYPE_INFO,  "%{public}@ timeout changed to %f, should restart timer",  (uint8_t *)&v5,  0x16u);
      }

      dispatch_source_cancel(v3);
      dispatch_release(v3);
      -[__NSCFLocalSessionTask _onqueue_startResourceTimer:]((uint64_t)v1, v2);
    }
  }

uint64_t __81____NSCFLocalSessionTask__onqueue_startTimer_withTimeoutInNanos_streamErrorCode___block_invoke( uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onqueue_cancel_with_error:",  -[__NSCFLocalSessionTask timeoutErrorWithStreamErrorCode:](*(void **)(a1 + 32), *(unsigned int *)(a1 + 40)));
}

void __44____NSCFLocalSessionTask_startResourceTimer__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    [*(id *)(a1 + 32) _timeoutIntervalForResource];
    -[__NSCFLocalSessionTask _onqueue_startResourceTimer:](v1, v3);
    uint64_t v4 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  -[__NSCFLocalSessionTask _onqueue_startStartTimer](v4);
}

uint64_t __65____NSCFLocalSessionTask_set_TLSMaximumSupportedProtocolVersion___block_invoke(uint64_t a1)
{
  return objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 32), "cfConn"),  "setTLSMaximumSupportedProtocolVersion:",  *(unsigned __int16 *)(a1 + 40));
}

uint64_t __65____NSCFLocalSessionTask_set_TLSMinimumSupportedProtocolVersion___block_invoke(uint64_t a1)
{
  return objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 32), "cfConn"),  "setTLSMinimumSupportedProtocolVersion:",  *(unsigned __int16 *)(a1 + 40));
}

uint64_t __44____NSCFLocalSessionTask_cancel_with_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_cancel_with_error:", *(void *)(a1 + 40));
}

void __90____NSCFLocalSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v4 = *(dispatch_source_s **)(*(void *)(a1 + 40) + 864LL);
  if (v4)
  {
    dispatch_source_cancel(v4);
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 40) + 864LL));
    *(void *)(*(void *)(a1 + 40) + 864LL) = 0LL;
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v6 = *(void (***)(void, void))(v5 + 40);
  if (v6)
  {
    *(void *)(v5 + 40) = 0LL;
    v6[2](v6, a2);
    _Block_release(v6);
  }

uint64_t __90____NSCFLocalSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke_2( uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  double v2 = (os_log_s *)CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = [*(id *)(a1 + 32) _loggableDescription];
    int v5 = 138543618;
    uint64_t v6 = v4;
    __int16 v7 = 1024;
    int v8 = 180;
    _os_log_error_impl( &dword_18298D000,  v2,  OS_LOG_TYPE_ERROR,  "%{public}@ will be canceled, because client didn't respond to delegate with new request in %d seconds",  (uint8_t *)&v5,  0x12u);
  }

  [*(id *)(a1 + 32) cancel];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __90____NSCFLocalSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke_102( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __49____NSCFLocalSessionTask__task_onqueue_didFinish__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(dispatch_object_s **)(v2 + 776);
  *(void *)(v2 + 776) = 0LL;
  uint64_t v4 = 0LL;
  if (![*(id *)(a1 + 32) error])
  {
    uint64_t v4 = (uint64_t)v3;
    if (!v3) {
      uint64_t v4 = [MEMORY[0x189603F48] data];
    }
  }

  +[__NSURLSessionStatistics reportMetricsToSymptoms:]( &OBJC_CLASS_____NSURLSessionStatistics,  "reportMetricsToSymptoms:",  *(void *)(a1 + 32));
  (*(void (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  v4,  [*(id *)(a1 + 32) response],  objc_msgSend(*(id *)(a1 + 32), "error"));
  if (v3) {
    dispatch_release(v3);
  }
  _Block_release(*(const void **)(a1 + 40));
  -[NSURLSessionTask _resetTaskDelegate](*(void *)(a1 + 32), v5);
}

uint64_t __85____NSCFLocalSessionTask__onqueue_didReceiveResponse_redirectRequest_withCompletion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (!a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
  [*(id *)(a1 + 32) updateCurrentRequest:a2];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __85____NSCFLocalSessionTask__onqueue_didReceiveResponse_redirectRequest_withCompletion___block_invoke_2;
  v7[3] = &unk_189C1A2E8;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[4] = a2;
  v7[5] = v5;
  return objc_msgSend(v4, "_onqueue_setupNextEffectiveConfigurationWithCompletionHandler:", v7);
}

uint64_t __85____NSCFLocalSessionTask__onqueue_didReceiveResponse_redirectRequest_withCompletion___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

_BYTE *__84____NSCFLocalSessionTask__private_onqueue_didReceiveResponseDisposition_completion___block_invoke( uint64_t a1)
{
  return -[__NSCFLocalSessionTask _finishAllow](*(_BYTE **)(a1 + 32));
}

void __84____NSCFLocalSessionTask__private_onqueue_didReceiveResponseDisposition_completion___block_invoke_2( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(dispatch_object_s **)(v2 + 792);
  if (v3)
  {
    *(void *)(v2 + 792) = 0LL;
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __84____NSCFLocalSessionTask__private_onqueue_didReceiveResponseDisposition_completion___block_invoke_3;
    v5[3] = &unk_189C1A270;
    uint64_t v4 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    v5[5] = v4;
    objc_msgSend(v4, "_task_onqueue_didReceiveDispatchData:completionHandler:", v3, v5);
    dispatch_release(v3);
  }

  else
  {
    -[__NSCFLocalSessionTask _finishBecomeDownload:](v2, *(void **)(a1 + 40));
  }
}

uint64_t __84____NSCFLocalSessionTask__private_onqueue_didReceiveResponseDisposition_completion___block_invoke_3( uint64_t a1)
{
  return -[__NSCFLocalSessionTask _finishBecomeDownload:](*(void *)(a1 + 32), *(void **)(a1 + 40));
}

void __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
}

void __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke_2( uint64_t a1,  uint64_t a2)
{
}

void __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke_3( uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(dispatch_object_s **)(v3 + 792);
    if (v4)
    {
      *(void *)(v3 + 792) = 0LL;
      v5[0] = MEMORY[0x1895F87A8];
      v5[1] = 3221225472LL;
      v5[2] = __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke_4;
      v5[3] = &unk_189C15848;
      v5[4] = *(void *)(a1 + 32);
      __int128 v6 = *(_OWORD *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 56);
      objc_msgSend((id)v6, "_task_onqueue_didReceiveDispatchData:completionHandler:", v4, v5);
      dispatch_release(v4);
    }

    else
    {
      -[__NSCFLocalSessionTask _finishBecomeStream:forConnection:completionHandler:]( v3,  *(void **)(a1 + 40),  *(void **)(a1 + 48),  *(void *)(a1 + 56));
    }
  }
}

uint64_t __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke_4( uint64_t a1)
{
  return -[__NSCFLocalSessionTask _finishBecomeStream:forConnection:completionHandler:]( *(void *)(a1 + 32),  *(void **)(a1 + 40),  *(void **)(a1 + 48),  *(void *)(a1 + 56));
}

@end