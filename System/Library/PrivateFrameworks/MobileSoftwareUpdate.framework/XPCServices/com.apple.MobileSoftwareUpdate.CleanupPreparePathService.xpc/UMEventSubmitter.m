@interface UMEventSubmitter
- (UMEventSubmitter)init;
- (id)_defaultSession;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)dealloc;
- (void)submitEventData:(id)a3 toURL:(id)a4 completionHandler:(id)a5;
- (void)submitEventData:(id)a3 toURL:(id)a4 withOptions:(id)a5 completionHandler:(id)a6;
@end

@implementation UMEventSubmitter

- (UMEventSubmitter)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UMEventSubmitter;
  v2 = -[UMEventSubmitter init](&v4, "init");
  if (v2)
  {
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.UpdateMetrics.UMEventSubmitter", 0LL);
    v2->_completionHandlers = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UMEventSubmitter;
  -[UMEventSubmitter dealloc](&v3, "dealloc");
}

- (id)_defaultSession
{
  id v3 = -[NSDictionary objectForKey:](self->_options, "objectForKey:", @"ProxySettings");
  id v4 = -[NSDictionary objectForKey:](self->_options, "objectForKey:", @"IsBackgroundSubmission");
  v10 = +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration");
  if (v3)
  {
    logfunction( ",  1,  @"UMEventSubmitter: %s: Using proxySettings for NSURLSessionConfiguration..\n\n",  v5,  v6,  v7,  v8,  v9,  (char)"-[UMEventSubmitter _defaultSession]"");
    -[NSURLSessionConfiguration setConnectionProxyDictionary:](v10, "setConnectionProxyDictionary:", v3);
  }

  else if (v4 && [v4 BOOLValue])
  {
    logfunction( ",  1,  @"UMEventSubmitter: %s: Setting waitsForConnectivity to true for splunk eventSubmission..\n\n",  v12,  v13,  v14,  v15,  v16,  (char)"-[UMEventSubmitter _defaultSession]"");
    -[NSURLSessionConfiguration setWaitsForConnectivity:](v10, "setWaitsForConnectivity:", 1LL);
  }

  return +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v10,  self,  0LL);
}

- (void)submitEventData:(id)a3 toURL:(id)a4 completionHandler:(id)a5
{
}

- (void)submitEventData:(id)a3 toURL:(id)a4 withOptions:(id)a5 completionHandler:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904LL;
  block[2] = __72__UMEventSubmitter_submitEventData_toURL_withOptions_completionHandler___block_invoke;
  block[3] = &__block_descriptor_72_e8_32o40o48o56o64b_e5_v8__0l;
  block[4] = self;
  block[5] = a5;
  block[6] = a4;
  block[7] = a3;
  block[8] = a6;
  dispatch_sync((dispatch_queue_t)queue, block);
}

id __72__UMEventSubmitter_submitEventData_toURL_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24LL) = *(id *)(a1 + 40);
  v2 = +[NSMutableURLRequest requestWithURL:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:",  *(void *)(a1 + 48));
  -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v2,  "setValue:forHTTPHeaderField:",  @"application/json",  @"Content-Type");
  -[NSMutableURLRequest setHTTPMethod:](v2, "setHTTPMethod:", @"POST");
  -[NSMutableURLRequest setHTTPBody:](v2, "setHTTPBody:", *(void *)(a1 + 56));
  uint64_t v3 = *(void *)(a1 + 48);
  [*(id *)(a1 + 56) length];
  logfunction(", 1, @"posting to %@ length = %lu\n"", v4, v5, v6, v7, v8, v3);
  LOBYTE(v3) = [*(id *)(a1 + 56) length];
  [*(id *)(a1 + 56) bytes];
  logfunction(", 1, @"data = %.*s\n"", v9, v10, v11, v12, v13, v3);
  id v14 = [*(id *)(a1 + 32) _defaultSession];
  if (v14)
  {
    v20 = v14;
    id v21 = [v14 dataTaskWithRequest:v2];
    if (v21)
    {
      v27 = v21;
      objc_msgSend( *(id *)(*(void *)(a1 + 32) + 16),  "setObject:forKey:",  objc_msgSend(*(id *)(a1 + 64), "copy"),  v21);
      [v27 resume];
    }

    else
    {
      logfunction(", 1, @"unable to create upload task for %@\n"", v22, v23, v24, v25, v26, *(void *)(a1 + 48));
      uint64_t v31 = *(void *)(a1 + 64);
      uint64_t v32 = *(void *)(a1 + 48);
      v34 = NSURLErrorFailingURLErrorKey;
      uint64_t v35 = v32;
      (*(void (**)(uint64_t, void, NSError *))(v31 + 16))( v31,  0LL,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSURLErrorDomain,  -1LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL)));
    }

    return [v20 finishTasksAndInvalidate];
  }

  else
  {
    logfunction(", 1, @"unable to create upload session\n"", v15, v16, v17, v18, v19, v33);
    uint64_t v28 = *(void *)(a1 + 64);
    uint64_t v29 = *(void *)(a1 + 48);
    v36 = NSURLErrorFailingURLErrorKey;
    uint64_t v37 = v29;
    return (id)(*(uint64_t (**)(uint64_t, void, NSError *))(v28 + 16))( v28,  0LL,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSURLErrorDomain,  -1LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL)));
  }

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  char v4 = objc_msgSend(objc_msgSend(a3, "configuration"), "identifier");
  logfunction(", 1, @"session %@ became invalid: %@\n"", v5, v6, v7, v8, v9, v4);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  char v9 = objc_msgSend(objc_msgSend(a3, "configuration"), "identifier");
  logfunction(", 1, @"session %@ didReceiveChallenge\n"", v10, v11, v12, v13, v14, v9);
  id v15 = -[NSDictionary objectForKey:](self->_options, "objectForKey:", @"URLSessionDelegate");
  if (v15) {
    [v15 URLSession:a3 didReceiveChallenge:a4 completionHandler:a5];
  }
  else {
    (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 1LL, 0LL);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904LL;
  block[2] = __57__UMEventSubmitter_URLSession_task_didCompleteWithError___block_invoke;
  block[3] = &__block_descriptor_56_e8_32o40o48o_e5_v8__0l;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_sync((dispatch_queue_t)queue, block);
}

int *__57__UMEventSubmitter_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  v2 = (void (**)(id, id, void))[*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  if (!v2) {
    return logfunction(", 1, @"task %@ completed with no handler\n"", v3, v4, v5, v6, v7, *(void *)(a1 + 40));
  }
  v2[2](v2, [*(id *)(a1 + 40) response], *(void *)(a1 + 48));
  return (int *)[*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
}

@end