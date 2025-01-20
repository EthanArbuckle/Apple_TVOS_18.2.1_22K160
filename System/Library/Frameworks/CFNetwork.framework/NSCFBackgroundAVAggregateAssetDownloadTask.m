@interface NSCFBackgroundAVAggregateAssetDownloadTask
@end

@implementation NSCFBackgroundAVAggregateAssetDownloadTask

__n128 __140____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_assetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad___block_invoke( uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id Property = *(id *)(a1 + 40);
  __int128 v13 = *(_OWORD *)(a1 + 56);
  __int128 v15 = *(_OWORD *)(a1 + 72);
  __int128 v17 = *(_OWORD *)(a1 + 88);
  uint64_t v3 = *(void *)(a1 + 48);
  __int128 v7 = *(_OWORD *)(a1 + 104);
  __int128 v9 = *(_OWORD *)(a1 + 120);
  __n128 result = *(__n128 *)(a1 + 136);
  __n128 v11 = result;
  if (v1 && [v1 state] <= 1 && objc_msgSend(v1, "session") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (Property) {
      id Property = objc_getProperty(Property, v5, 880LL, 1);
    }
    uint64_t v6 = objc_msgSend(v1, "session", v7, v9, *(_OWORD *)&v11, v13, v15, v17);
    v20[0] = v14;
    v20[1] = v16;
    v20[2] = v18;
    v19[0] = v8;
    v19[1] = v10;
    v19[2] = v12;
    -[NSURLSession delegate_AVAggregateAssetDownloadTask:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelection:]( v6,  (uint64_t)v1,  v20,  v3,  v19,  (uint64_t)Property);
  }

  return result;
}

void __95____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_assetDownloadTask_willDownloadToURL___block_invoke( uint64_t a1)
{
  v1 = *(_BYTE **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if ([*(id *)(a1 + 32) state] <= 1 && !v1[790])
    {
      v1[790] = 1;
      if ([v1 session])
      {
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          -[NSURLSession delegate_AVAggregateAssetDownloadTask:willDownloadToURL:]( [v1 session],  (uint64_t)v1,  v2);
        }
      }
    }
  }

void __106____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_task_willBeginDelayedRequest_completionHandler___block_invoke( void *a1,  const char *a2)
{
  uint64_t v2 = a1[4];
  if (v2)
  {
    uint64_t v3 = (void *)a1[6];
    uint64_t v4 = a1[7];
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __109____NSCFBackgroundAVAggregateAssetDownloadTask__onqueue_childTask_willBeginDelayedRequest_completionHandler___block_invoke;
    v7[3] = &unk_189C0B708;
    v7[4] = v2;
    v7[5] = v4;
    if (*(_BYTE *)(v2 + 791)) {
      goto LABEL_10;
    }
    *(_BYTE *)(v2 + 791) = 1;
    uint64_t v5 = *(void *)(v2 + 704);
    if (!v5) {
      uint64_t v5 = *(void *)(v2 + 696);
    }
    if (!-[__NSCFURLSessionDelegateWrapper willBeginDelayedRequest](v5, a2))
    {
LABEL_10:
      (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0LL, 0LL);
    }

    else
    {
      uint64_t v6 = *(void *)(v2 + 704);
      if (!v6) {
        uint64_t v6 = *(void *)(v2 + 696);
      }
      -[__NSCFURLSessionDelegateWrapper task:willBeginDelayedRequest:completionHandler:](v6, (void *)v2, v3, v7);
    }
  }

uint64_t __109____NSCFBackgroundAVAggregateAssetDownloadTask__onqueue_childTask_willBeginDelayedRequest_completionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL);
  if (!a2) {
    return v3();
  }
  v3();
  return [*(id *)(a1 + 32) cancel];
}

uint64_t __85____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_task_didCompleteWithError___block_invoke( uint64_t result)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    id Property = *(id *)(result + 40);
    uint64_t v2 = *(void *)(result + 48);
    __n128 result = [*(id *)(result + 32) state];
    if (result <= 1)
    {
      if ([(id)v1 session] && (objc_opt_respondsToSelector() & 1) != 0)
      {
        if (Property) {
          id Property = objc_getProperty(Property, v4, 880LL, 1);
        }
        -[NSURLSession delegate_AVAggregateAssetDownloadTask:didCompleteForMediaSelection:]( [(id)v1 session],  v1,  (uint64_t)Property);
      }

      if (v2)
      {
        [*(id *)(v1 + 848) invalidateAndCancel];
LABEL_10:
        [*(id *)(v1 + 848) finishTasksAndInvalidate];
        v10.receiver = (id)v1;
        v10.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundAVAggregateAssetDownloadTask;
        objc_msgSendSuper2(&v10, sel__onqueue_didFinishWithError_, v2);
        return objc_msgSend( (id)-[__NSURLBackgroundSession ensureRemoteSession](objc_msgSend((id)v1, "session")),  "cancelTaskWithIdentifier:",  objc_msgSend((id)v1, "taskIdentifier"));
      }

      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      uint64_t v5 = *(void **)(v1 + 856);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (!v6) {
        goto LABEL_10;
      }
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
LABEL_14:
      uint64_t v9 = 0LL;
      while (1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        __n128 result = [*(id *)(*((void *)&v11 + 1) + 8 * v9) state];
        if (result < 3) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v7) {
            goto LABEL_14;
          }
          goto LABEL_10;
        }
      }
    }
  }

  return result;
}

void __81____NSCFBackgroundAVAggregateAssetDownloadTask_initWithTaskInfo_taskGroup_ident___block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 840);
  }
  else {
    uint64_t v3 = 0LL;
  }
  *(void *)(*(void *)(a1 + 32) + 848LL) =  +[AVAssetDownloadURLSession sessionWithConfiguration:assetDownloadDelegate:delegateQueue:]( &OBJC_CLASS___AVAssetDownloadURLSession,  "sessionWithConfiguration:assetDownloadDelegate:delegateQueue:",  +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:]( &OBJC_CLASS___NSURLSessionConfiguration,  "backgroundSessionConfigurationWithIdentifier:",  v3),  *(void *)(a1 + 32),  0LL);
  uint64_t v4 = dispatch_semaphore_create(0LL);
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  objc_super v10 = __Block_byref_object_copy__6603;
  __int128 v11 = __Block_byref_object_dispose__6604;
  uint64_t v12 = 0LL;
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 848LL);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __81____NSCFBackgroundAVAggregateAssetDownloadTask_initWithTaskInfo_taskGroup_ident___block_invoke_2;
  v6[3] = &unk_189C11358;
  v6[4] = v4;
  v6[5] = &v7;
  [v5 getAllTasksWithCompletionHandler:v6];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v4);
  *(void *)(*(void *)(a1 + 32) + 856LL) = v8[5];
  _Block_object_dispose(&v7, 8);
}

uint64_t __81____NSCFBackgroundAVAggregateAssetDownloadTask_initWithTaskInfo_taskGroup_ident___block_invoke_2( uint64_t a1,  void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end