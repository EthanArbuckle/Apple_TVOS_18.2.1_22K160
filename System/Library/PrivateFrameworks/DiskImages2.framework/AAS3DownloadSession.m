@interface AAS3DownloadSession
+ (void)completeRequest:(id)a3 data:(id)a4 response:(id)a5 error:(id)a6;
- ($F8B208FFD9F8C66D88325740F38F7747)streamBase;
- (AAS3DownloadSession)initWithURL:(id)a3 streamBase:(id *)a4 maxAttempts:(unsigned int)a5 pauseInterval:(float)a6 maxRequestsInFlight:(unsigned int)a7;
- (NSData)cache;
- (NSLock)cacheLock;
- (NSLock)requestsLock;
- (NSMutableSet)requests;
- (NSURL)url;
- (NSURLSession)urlSession;
- (OS_dispatch_semaphore)requestsSem;
- (float)pauseInterval;
- (id)enqueueRequestWithSize:(unint64_t)a3 atOffset:(int64_t)a4 destinationBuffer:(char *)a5 destinationStream:(AAAsyncByteStream_impl *)a6 completionSemaphore:(id)a7;
- (int)addRequest:(id)a3;
- (int)cancelled;
- (int)isCancelled;
- (int)readToAsyncByteStream:(AAAsyncByteStream_impl *)a3 size:(unint64_t)a4 atOffset:(int64_t)a5;
- (int)syncRequests;
- (int64_t)readToBuffer:(void *)a3 size:(unint64_t)a4 atOffset:(int64_t)a5;
- (unint64_t)bytesDownloaded;
- (unsigned)maxAttempts;
- (unsigned)maxRequests;
- (void)addBytesDownloaded:(unint64_t)a3;
- (void)cacheDocument:(id)a3;
- (void)invalidateAndCancel;
- (void)removeRequest:(id)a3;
- (void)setBytesDownloaded:(unint64_t)a3;
- (void)setCache:(id)a3;
- (void)setCancelled:(int)a3;
@end

@implementation AAS3DownloadSession

- (AAS3DownloadSession)initWithURL:(id)a3 streamBase:(id *)a4 maxAttempts:(unsigned int)a5 pauseInterval:(float)a6 maxRequestsInFlight:(unsigned int)a7
{
  id v13 = a3;
  v58.receiver = self;
  v58.super_class = (Class)&OBJC_CLASS___AAS3DownloadSession;
  v14 = -[AAS3DownloadSession init](&v58, sel_init);
  if (v14)
  {
    id obj = a3;
    unsigned int v54 = a5;
    unsigned int v55 = a7;
    id v57 = v13;
    id v56 = (id)[MEMORY[0x189601F00] ephemeralSessionConfiguration];
    id v18 = objc_alloc_init(MEMORY[0x189603FC8]);
    v53 = a4;
    var2 = a4->var2;
    if (*((void *)var2 + 348))
    {
      id v20 = (id)objc_msgSend(NSString, "stringWithUTF8String:");
      [v18 setValue:v20 forKey:@"User-Agent"];
    }

    for (uint64_t i = *((void *)var2 + 349); i; uint64_t i = *(void *)(i + 8))
    {
      v22 = *(const char **)i;
      if (*(void *)i)
      {
        size_t v23 = strlen(*(const char **)i);
        size_t v24 = v23 + 1;
        if (v23 + 1 < 0x2000000001LL)
        {
          v25 = (char *)malloc(v23 + 1);
          if (v25)
          {
            v26 = v25;
            memcpy(v25, v22, v24);
            v27 = strchr(v26, 58);
            if (v27)
            {
              char *v27 = 0;
              id v30 = (id)[NSString stringWithUTF8String:v27 + 1];
              id v31 = (id)[NSString stringWithUTF8String:v26];
              [v18 setValue:v30 forKey:v31];
            }

            else
            {
              pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m",  (uint64_t)"-[AAS3DownloadSession initWithURL:streamBase:maxAttempts:pauseInterval:maxRequestsInFlight:]",  252,  121,  0,  "invalid header: %s",  v28,  v29,  (char)v26);
            }

            free(v26);
            continue;
          }
        }

        else
        {
          *__error() = 12;
        }
      }

      v32 = __error();
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m",  (uint64_t)"-[AAS3DownloadSession initWithURL:streamBase:maxAttempts:pauseInterval:maxRequestsInFlight:]",  250,  121,  *v32,  "malloc",  v33,  v34,  v51);
    }

    if (*((void *)var2 + 350)) {
      pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m",  (uint64_t)"-[AAS3DownloadSession initWithURL:streamBase:maxAttempts:pauseInterval:maxRequestsInFlight:]",  259,  121,  "Non supported options in AAS3DownloadSession (ignored): proxy_headers %s",  v15,  v16,  v17,  *((void *)var2 + 350));
    }
    if (*((void *)var2 + 346)) {
      pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m",  (uint64_t)"-[AAS3DownloadSession initWithURL:streamBase:maxAttempts:pauseInterval:maxRequestsInFlight:]",  260,  121,  "Non supported options in AAS3DownloadSession (ignored): pinned_public_key %s",  v15,  v16,  v17,  *((void *)var2 + 346));
    }
    if (*((void *)var2 + 347)) {
      pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m",  (uint64_t)"-[AAS3DownloadSession initWithURL:streamBase:maxAttempts:pauseInterval:maxRequestsInFlight:]",  261,  121,  "Non supported options in AAS3DownloadSession (ignored): proxy_pinned_public_key %s",  v15,  v16,  v17,  *((void *)var2 + 347));
    }
    [v56 setHTTPAdditionalHeaders:v18];
    [v56 setHTTPMaximumConnectionsPerHost:16];
    [v56 setTimeoutIntervalForRequest:120.0];
    [v56 setTimeoutIntervalForResource:1200.0];
    v35 = (NSURLSession *)(id)[MEMORY[0x189601EF8] sessionWithConfiguration:v56];
    urlSession = v14->_urlSession;
    v14->_urlSession = v35;

    objc_storeStrong((id *)&v14->_url, obj);
    v14->_streamBase = v53;
    v37 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    requests = v14->_requests;
    v14->_requests = v37;

    v39 = (NSLock *)objc_alloc_init(MEMORY[0x189607910]);
    requestsLock = v14->_requestsLock;
    v14->_requestsLock = v39;

    if (v54) {
      int v41 = v54;
    }
    else {
      int v41 = 5;
    }
    float v42 = 250.0;
    if (a6 != 0.0) {
      float v42 = a6;
    }
    v14->_pauseInterval = v42;
    if (v55) {
      uint64_t v43 = v55;
    }
    else {
      uint64_t v43 = 16LL;
    }
    v14->_maxRequests = v43;
    v14->_maxAttempts = v41;
    dispatch_semaphore_t v44 = dispatch_semaphore_create(v43);
    requestsSem = v14->_requestsSem;
    v14->_requestsSem = (OS_dispatch_semaphore *)v44;

    atomic_store(0LL, &v14->_bytesDownloaded);
    v46 = (NSLock *)objc_alloc_init(MEMORY[0x189607910]);
    cacheLock = v14->_cacheLock;
    v14->_cacheLock = v46;

    cache = v14->_cache;
    v14->_cache = 0LL;

    v49 = v14;
    id v13 = v57;
  }

  return v14;
}

- (int)addRequest:(id)a3
{
  id v4 = a3;
  v5 = -[AAS3DownloadSession requestsSem](self, "requestsSem");
  dispatch_time_t v6 = dispatch_time(0LL, 600000000000LL);
  uint64_t v7 = dispatch_semaphore_wait((dispatch_semaphore_t)v5, v6);

  if (v7)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m",  (uint64_t)"-[AAS3DownloadSession addRequest:]",  292,  121,  0,  "euqueueRequest timed out",  v8,  v9,  v15);
    int v10 = -1;
  }

  else
  {
    v11 = -[AAS3DownloadSession requestsLock](self, "requestsLock");
    -[NSLock lock](v11, "lock");

    v12 = -[AAS3DownloadSession requests](self, "requests");
    -[NSMutableSet addObject:](v12, "addObject:", v4);

    id v13 = -[AAS3DownloadSession requestsLock](self, "requestsLock");
    -[NSLock unlock](v13, "unlock");

    int v10 = 0;
  }

  return v10;
}

- (void)removeRequest:(id)a3
{
  id v4 = a3;
  v5 = -[AAS3DownloadSession requestsLock](self, "requestsLock");
  -[NSLock lock](v5, "lock");

  dispatch_time_t v6 = -[AAS3DownloadSession requests](self, "requests");
  -[NSMutableSet removeObject:](v6, "removeObject:", v4);

  uint64_t v7 = -[AAS3DownloadSession requestsLock](self, "requestsLock");
  -[NSLock unlock](v7, "unlock");

  uint64_t v8 = -[AAS3DownloadSession requestsSem](self, "requestsSem");
  dispatch_semaphore_signal((dispatch_semaphore_t)v8);
}

- (id)enqueueRequestWithSize:(unint64_t)a3 atOffset:(int64_t)a4 destinationBuffer:(char *)a5 destinationStream:(AAAsyncByteStream_impl *)a6 completionSemaphore:(id)a7
{
  id v12 = a7;
  id v13 = -[AAS3DownloadRequest initWithSession:size:atOffset:destinationBuffer:destinationStream:completionSemaphore:]( objc_alloc(&OBJC_CLASS___AAS3DownloadRequest),  "initWithSession:size:atOffset:destinationBuffer:destinationStream:completionSemaphore:",  self,  a3,  a4,  a5,  a6,  v12);

  if (!v13)
  {
    uint64_t v17 = "Request creation";
    __int16 v18 = 332;
LABEL_8:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m",  (uint64_t)"-[AAS3DownloadSession enqueueRequestWithSize:atOffset:destinationBuffer:destinationStream:completionSemaphore:]",  v18,  121,  0,  v17,  v14,  v15,  v20);
    uint64_t v16 = 0LL;
    goto LABEL_9;
  }

  if (-[AAS3DownloadSession addRequest:](self, "addRequest:", v13) < 0)
  {
    uint64_t v17 = "addRequest";
    __int16 v18 = 335;
    goto LABEL_8;
  }

  if (-[AAS3DownloadRequest createAndResumeTask](v13, "createAndResumeTask") < 0)
  {
    uint64_t v17 = "createTask";
    __int16 v18 = 338;
    goto LABEL_8;
  }

  uint64_t v16 = v13;
LABEL_9:

  return v16;
}

- (void)addBytesDownloaded:(unint64_t)a3
{
  p_bytesDownloaded = &self->_bytesDownloaded;
  do
    unint64_t v4 = __ldxr(p_bytesDownloaded);
  while (__stxr(v4 + a3, p_bytesDownloaded));
}

- (int64_t)readToBuffer:(void *)a3 size:(unint64_t)a4 atOffset:(int64_t)a5
{
  uint64_t v9 = -[AAS3DownloadSession cacheLock](self, "cacheLock");
  -[NSLock lock](v9, "lock");

  int v10 = -[AAS3DownloadSession cache](self, "cache");
  if (!v10)
  {
    v21 = -[AAS3DownloadSession cacheLock](self, "cacheLock");
    -[NSLock unlock](v21, "unlock");

    char v20 = dispatch_semaphore_create(0LL);
    id v19 =  -[AAS3DownloadSession enqueueRequestWithSize:atOffset:destinationBuffer:destinationStream:completionSemaphore:]( self,  "enqueueRequestWithSize:atOffset:destinationBuffer:destinationStream:completionSemaphore:",  a4,  a5,  a3,  0LL,  v20);
    if (v19)
    {
      dispatch_time_t v24 = dispatch_time(0LL, 600000000000LL);
      if (dispatch_semaphore_wait(v20, v24))
      {
        v25 = "Request timed out";
        __int16 v26 = 384;
      }

      else
      {
        v25 = "Request failed";
        __int16 v26 = 386;
      }
    }

    else
    {
      v25 = "enqueueRequest";
      __int16 v26 = 380;
    }

    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m",  (uint64_t)"-[AAS3DownloadSession readToBuffer:size:atOffset:]",  v26,  121,  0,  v25,  v22,  v23,  v28);
    a4 = -1LL;
    goto LABEL_14;
  }

  v11 = -[AAS3DownloadSession cache](self, "cache");
  int64_t v12 = -[NSData length](v11, "length");

  id v13 = -[AAS3DownloadSession cache](self, "cache");
  uint64_t v14 = -[NSData bytes](v13, "bytes");

  int64_t v15 = a5 & ~(a5 >> 63);
  int64_t v16 = a5 + a4;
  size_t v17 = v16 - v15;
  if (v16 > v15) {
    memcpy(a3, (const void *)(v14 + v15), v17);
  }
  __int16 v18 = -[AAS3DownloadSession cacheLock](self, "cacheLock", v17);
  -[NSLock unlock](v18, "unlock");

  id v19 = 0LL;
  char v20 = 0LL;
LABEL_14:

  return a4;
}

- (int)syncRequests
{
  if (-[AAS3DownloadSession maxRequests](self, "maxRequests"))
  {
    int v3 = 0;
    while (1)
    {
      unint64_t v4 = -[AAS3DownloadSession requestsSem](self, "requestsSem");
      dispatch_time_t v5 = dispatch_time(0LL, 600000000000LL);
      uint64_t v6 = dispatch_semaphore_wait((dispatch_semaphore_t)v4, v5);

      if (v6) {
        break;
      }
      if (++v3 >= -[AAS3DownloadSession maxRequests](self, "maxRequests")) {
        goto LABEL_5;
      }
    }

    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m",  (uint64_t)"-[AAS3DownloadSession syncRequests]",  401,  121,  0,  "Request timed out",  v7,  v8,  v12);
    return -1;
  }

  else
  {
LABEL_5:
    int result = -[AAS3DownloadSession maxRequests](self, "maxRequests");
    if (result)
    {
      unsigned int v10 = 0;
      do
      {
        v11 = -[AAS3DownloadSession requestsSem](self, "requestsSem");
        dispatch_semaphore_signal((dispatch_semaphore_t)v11);

        ++v10;
      }

      while (v10 < -[AAS3DownloadSession maxRequests](self, "maxRequests"));
      return 0;
    }
  }

  return result;
}

- (int)readToAsyncByteStream:(AAAsyncByteStream_impl *)a3 size:(unint64_t)a4 atOffset:(int64_t)a5
{
  if (a4)
  {
    uint64_t v9 = -[AAS3DownloadSession cacheLock](self, "cacheLock");
    -[NSLock lock](v9, "lock");

    unsigned int v10 = -[AAS3DownloadSession cache](self, "cache");
    if (v10)
    {
      v11 = -[AAS3DownloadSession cache](self, "cache");
      -[NSData length](v11, "length");

      char v12 = -[AAS3DownloadSession cache](self, "cache");
      -[NSData bytes](v12, "bytes");

      AAAsyncByteStreamProcess();
      __int16 v18 = -[AAS3DownloadSession cacheLock](self, "cacheLock");
      -[NSLock unlock](v18, "unlock");

      id v19 = 0LL;
LABEL_7:
      int v14 = 0;
      goto LABEL_8;
    }

    int64_t v15 = -[AAS3DownloadSession cacheLock](self, "cacheLock");
    -[NSLock unlock](v15, "unlock");

    id v19 =  -[AAS3DownloadSession enqueueRequestWithSize:atOffset:destinationBuffer:destinationStream:completionSemaphore:]( self,  "enqueueRequestWithSize:atOffset:destinationBuffer:destinationStream:completionSemaphore:",  a4,  a5,  0LL,  a3,  0LL);
    if (v19) {
      goto LABEL_7;
    }
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m",  (uint64_t)"-[AAS3DownloadSession readToAsyncByteStream:size:atOffset:]",  451,  121,  0,  "enqueueRequest",  v16,  v17,  v21);
    id v19 = 0LL;
    int v14 = -1;
  }

  else
  {
    int v13 = -[AAS3DownloadSession syncRequests](self, "syncRequests", a3, 0LL, a5);
    id v19 = 0LL;
    int v14 = v13 >> 31;
  }

+ (void)completeRequest:(id)a3 data:(id)a4 response:(id)a5 error:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (id)[v9 downloadSession];
  uint64_t v14 = [v11 statusCode];
  switch(v14)
  {
    case 416LL:
      [v10 bytes];
      if ([v9 stream])
      {
        [v9 stream];
        [v9 offset];
        AAAsyncByteStreamProcess();
      }

      goto LABEL_2;
    case 206LL:
      uint64_t v21 = [v10 length];
      unint64_t v33 = [v9 nbyte];
      if (v21 >= v33) {
        size_t v34 = v33;
      }
      else {
        size_t v34 = v21;
      }
      v35 = (const void *)[v10 bytes];
      if ([v9 buf]) {
        memcpy((void *)[v9 buf], v35, v34);
      }
      if (![v9 stream]) {
        goto LABEL_33;
      }
LABEL_32:
      [v9 stream];
      [v9 offset];
      AAAsyncByteStreamProcess();
LABEL_33:
      [v13 addBytesDownloaded:v21];
LABEL_2:
      uint64_t v18 = 1LL;
      goto LABEL_3;
    case 200LL:
      uint64_t v21 = [v10 length];
      id v22 = v10;
      uint64_t v23 = [v22 bytes];
      [v13 cacheDocument:v22];
      uint64_t v24 = [v9 offset];
      uint64_t v25 = v24 & ~(v24 >> 63);
      uint64_t v26 = [v9 offset];
      uint64_t v27 = [v9 nbyte] + v26;
      if (v21 < v27) {
        uint64_t v27 = v21;
      }
      BOOL v28 = v27 <= v25;
      size_t v29 = v27 - v25;
      if (v28) {
        uint64_t v30 = 0LL;
      }
      else {
        uint64_t v30 = v25;
      }
      id v31 = (const void *)(v23 + v30);
      if (v28) {
        size_t v32 = 0LL;
      }
      else {
        size_t v32 = v29;
      }
      if ([v9 buf]) {
        memcpy((void *)[v9 buf], v31, v32);
      }
      if (![v9 stream]) {
        goto LABEL_33;
      }
      goto LABEL_32;
  }

  if (v12 && (id v36 = (id)[v12 description]) != 0)
  {
    id v37 = v36;
    [v37 UTF8String];
    pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m",  (uint64_t)"+[AAS3DownloadSession completeRequest:data:response:error:]",  546,  121,  "Request failed: %03ld %s",  v38,  v39,  v40,  v14);
  }

  else
  {
    pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m",  (uint64_t)"+[AAS3DownloadSession completeRequest:data:response:error:]",  547,  121,  "Request failed: %03ld (error not set)",  v15,  v16,  v17,  v14);
  }

  if ([v9 remainingAttempts])
  {
    [v9 pauseInterval];
    double v42 = v41;
    [v9 nbyte];
    [v9 offset];
    pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m",  (uint64_t)"+[AAS3DownloadSession completeRequest:data:response:error:]",  554,  121,  "Retrying request after %.0f seconds %zu bytes at offset %llu",  v43,  v44,  v45,  SLOBYTE(v42));
    v46 = (void *)MEMORY[0x189607A40];
    [v9 pauseInterval];
    [v46 sleepForTimeInterval:v47];
    [v9 pauseInterval];
    *(float *)&double v49 = v48 + v48;
    [v9 setPauseInterval:v49];
    if (([v9 createAndResumeTask] & 0x80000000) == 0) {
      goto LABEL_6;
    }
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m",  (uint64_t)"+[AAS3DownloadSession completeRequest:data:response:error:]",  561,  121,  0,  "createTask",  v50,  v51,  v52);
  }

  uint64_t v18 = 0xFFFFFFFFLL;
LABEL_3:
  [v9 setStatus:v18];
  id v19 = (id)[v9 sem];

  if (v19)
  {
    char v20 = (dispatch_semaphore_s *)(id)[v9 sem];
    dispatch_semaphore_signal(v20);
  }

  [v13 removeRequest:v9];
LABEL_6:
}

- (void)invalidateAndCancel
{
  p_cancelled = &self->_cancelled;
  while (!__ldaxr((unsigned int *)p_cancelled))
  {
  }

  __clrex();
LABEL_6:
  dispatch_time_t v5 = -[AAS3DownloadSession urlSession](self, "urlSession");
  -[NSURLSession invalidateAndCancel](v5, "invalidateAndCancel");

  -[AAS3DownloadSession syncRequests](self, "syncRequests");
}

- (int)isCancelled
{
  return atomic_load((unsigned int *)&self->_cancelled);
}

- (void)cacheDocument:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = -[AAS3DownloadSession cacheLock](self, "cacheLock");
  -[NSLock lock](v5, "lock");

  uint64_t v6 = -[AAS3DownloadSession cache](self, "cache");
  if (!v6) {
    -[AAS3DownloadSession setCache:](self, "setCache:", v4);
  }
  uint64_t v7 = -[AAS3DownloadSession cacheLock](self, "cacheLock");
  -[NSLock unlock](v7, "unlock");
}

- (NSURLSession)urlSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 32LL, 1);
}

- ($F8B208FFD9F8C66D88325740F38F7747)streamBase
{
  return self->_streamBase;
}

- (NSMutableSet)requests
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48LL, 1);
}

- (OS_dispatch_semaphore)requestsSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 56LL, 1);
}

- (unsigned)maxRequests
{
  return self->_maxRequests;
}

- (NSLock)requestsLock
{
  return (NSLock *)objc_getProperty(self, a2, 64LL, 1);
}

- (unsigned)maxAttempts
{
  return self->_maxAttempts;
}

- (float)pauseInterval
{
  return self->_pauseInterval;
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (void)setBytesDownloaded:(unint64_t)a3
{
  self->_bytesDownloaded = a3;
}

- (int)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(int)a3
{
  self->_cancelled = a3;
}

- (NSLock)cacheLock
{
  return (NSLock *)objc_getProperty(self, a2, 80LL, 1);
}

- (NSData)cache
{
  return (NSData *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end