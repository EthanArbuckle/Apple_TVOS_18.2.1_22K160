@interface __NSCFBackgroundUploadTask
- (BOOL)isKindOfClass:(Class)a3;
- (void)_onqueue_didFinishWithError:(id)a3;
- (void)cancelByProducingResumeData:(id)a3;
- (void)dealloc;
@end

@implementation __NSCFBackgroundUploadTask

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundUploadTask;
  -[__NSCFBackgroundDataTask dealloc](&v3, sel_dealloc);
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundUploadTask;
  if (-[__NSCFBackgroundDataTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
  }
}

- (void)cancelByProducingResumeData:(id)a3
{
  objc_super v5 = -[NSURLSessionTask workQueue](self, "workQueue");
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __58____NSCFBackgroundUploadTask_cancelByProducingResumeData___block_invoke;
  v6[3] = &unk_189C1A2E8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)v5, v6);
}

- (void)_onqueue_didFinishWithError:(id)a3
{
  id v3 = a3;
  objc_super v5 = (void *)[a3 userInfo];
  v6 = (void *)[v5 objectForKeyedSubscript:@"NSURLSessionUploadTaskResumeData"];
  if (v6)
  {
    v7 = +[__NSCFResumableUploadState rusWithResumeData:]((uint64_t)&OBJC_CLASS_____NSCFResumableUploadState, v6);
    if (v7)
    {
      -[NSURLSessionTask setResumableUploadState:](self, "setResumableUploadState:", v7);
      if (self) {
        id Property = objc_getProperty(self, v8, 848LL, 1);
      }
      else {
        id Property = 0LL;
      }
      -[__NSCFResumableUploadState setUploadFile:]( -[NSURLSessionTask resumableUploadState](self, "resumableUploadState"),  "setUploadFile:",  Property);
      id v10 = (id)[v5 mutableCopy];
      objc_msgSend( v10,  "setObject:forKeyedSubscript:",  -[__NSCFResumableUploadState createResumeData:]( -[NSURLSessionTask resumableUploadState](self, "resumableUploadState"),  0),  @"NSURLSessionUploadTaskResumeData");
      id v3 = (id)objc_msgSend( MEMORY[0x189607A70],  "errorWithDomain:code:userInfo:",  objc_msgSend(v3, "domain"),  objc_msgSend(v3, "code"),  v10);
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundUploadTask;
  -[__NSCFBackgroundDataTask _onqueue_didFinishWithError:](&v11, sel__onqueue_didFinishWithError_, v3);
}

@end