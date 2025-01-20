@interface NSCFLocalUploadTask
@end

@implementation NSCFLocalUploadTask

uint64_t __53____NSCFLocalUploadTask_cancelByProducingResumeData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_cancelByProducingResumeData:", *(void *)(a1 + 40));
}

uint64_t __62____NSCFLocalUploadTask__onqueue_cancelByProducingResumeData___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __62____NSCFLocalUploadTask__onqueue_cancelByProducingResumeData___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __62____NSCFLocalUploadTask__onqueue_cancelByProducingResumeData___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __48____NSCFLocalUploadTask__task_onqueue_didFinish__block_invoke(uint64_t a1)
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
  v5[2] = __48____NSCFLocalUploadTask__task_onqueue_didFinish__block_invoke_2;
  v5[3] = &unk_189C1A548;
  v5[4] = v2;
  -[__NSCFURLSessionDelegateWrapper task:didFinishCollectingMetrics:completionHandler:](v3, v2, v4, v5);
}

void __56____NSCFLocalUploadTask__private_completionAfterMetrics__block_invoke(uint64_t a1)
{
}

void __48____NSCFLocalUploadTask__private_issueDidFinish__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_object_s **)(v2 + 776);
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

void __48____NSCFLocalUploadTask__task_onqueue_didFinish__block_invoke_2(uint64_t a1)
{
}

@end