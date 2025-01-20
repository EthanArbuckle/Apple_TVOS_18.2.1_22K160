@interface NSCFBackgroundUploadTask
@end

@implementation NSCFBackgroundUploadTask

void __58____NSCFBackgroundUploadTask_cancelByProducingResumeData___block_invoke(uint64_t a1)
{
  v1 = *(_BYTE **)(a1 + 32);
  if (v1)
  {
    v2 = *(_BYTE **)(a1 + 40);
    if ([*(id *)(a1 + 32) state] > 2 || v1[772])
    {
      uint64_t v3 = [v1 session];
      uint64_t v6 = MEMORY[0x1895F87A8];
      uint64_t v7 = 3221225472LL;
      v8 = __67____NSCFBackgroundUploadTask__onqueue_cancelByProducingResumeData___block_invoke_3;
      v9 = &unk_189C1A298;
      v10 = v2;
      -[NSURLSession runDelegateBlock:](v3, &v6);
    }

    else
    {
      v1[772] = 1;
      [v1 setState:2];
      v4 = (void *)-[__NSURLBackgroundSession ensureRemoteSession]([v1 session]);
      uint64_t v5 = [v1 taskIdentifier];
      uint64_t v6 = MEMORY[0x1895F87A8];
      uint64_t v7 = 3221225472LL;
      v8 = __67____NSCFBackgroundUploadTask__onqueue_cancelByProducingResumeData___block_invoke;
      v9 = &unk_189C0B670;
      v10 = v1;
      v11 = v2;
      [v4 cancelTaskWithIdentifier:v5 byProducingResumeData:&v6];
    }
  }

void __67____NSCFBackgroundUploadTask__onqueue_cancelByProducingResumeData___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v3 = +[__NSCFResumableUploadState rusWithResumeData:]((uint64_t)&OBJC_CLASS_____NSCFResumableUploadState, a2);
  if (v3)
  {
    [*(id *)(a1 + 32) setResumableUploadState:v3];
    uint64_t v5 = *(void **)(a1 + 32);
    if (v5)
    {
      id Property = objc_getProperty(v5, v4, 848LL, 1);
      uint64_t v5 = *(void **)(a1 + 32);
    }

    else
    {
      id Property = 0LL;
    }

    objc_msgSend((id)objc_msgSend(v5, "resumableUploadState"), "setUploadFile:", Property);
  }

  uint64_t v11 = 0LL;
  id v7 = -[__NSCFResumableUploadState createResumeData:]( (void *)[*(id *)(a1 + 32) resumableUploadState],  &v11);
  if (v11) {
    objc_msgSend(*(id *)(a1 + 32), "setError:");
  }
  uint64_t v8 = [*(id *)(a1 + 32) session];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __67____NSCFBackgroundUploadTask__onqueue_cancelByProducingResumeData___block_invoke_2;
  v10[3] = &unk_189C1A2E8;
  uint64_t v9 = *(void *)(a1 + 40);
  v10[4] = v7;
  v10[5] = v9;
  -[NSURLSession runDelegateBlock:](v8, v10);
}

uint64_t __67____NSCFBackgroundUploadTask__onqueue_cancelByProducingResumeData___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __67____NSCFBackgroundUploadTask__onqueue_cancelByProducingResumeData___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

@end