@interface AAS3DownloadRequest
- (AAAsyncByteStream_impl)stream;
- (AAS3DownloadRequest)initWithSession:(id)a3 size:(unint64_t)a4 atOffset:(int64_t)a5 destinationBuffer:(char *)a6 destinationStream:(AAAsyncByteStream_impl *)a7 completionSemaphore:(id)a8;
- (AAS3DownloadSession)downloadSession;
- (NSMutableURLRequest)urlRequest;
- (OS_dispatch_semaphore)sem;
- (char)buf;
- (float)pauseInterval;
- (int)createAndResumeTask;
- (int)status;
- (int64_t)offset;
- (unint64_t)nbyte;
- (unsigned)remainingAttempts;
- (void)setBuf:(char *)a3;
- (void)setDownloadSession:(id)a3;
- (void)setNbyte:(unint64_t)a3;
- (void)setOffset:(int64_t)a3;
- (void)setPauseInterval:(float)a3;
- (void)setRemainingAttempts:(unsigned int)a3;
- (void)setSem:(id)a3;
- (void)setStatus:(int)a3;
- (void)setStream:(AAAsyncByteStream_impl *)a3;
- (void)setUrlRequest:(id)a3;
@end

@implementation AAS3DownloadRequest

- (AAS3DownloadRequest)initWithSession:(id)a3 size:(unint64_t)a4 atOffset:(int64_t)a5 destinationBuffer:(char *)a6 destinationStream:(AAAsyncByteStream_impl *)a7 completionSemaphore:(id)a8
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a8;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___AAS3DownloadRequest;
  v16 = -[AAS3DownloadRequest init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_downloadSession, v14);
    id v18 = objc_alloc(MEMORY[0x189601EB0]);
    id v19 = (id)[v14 url];
    uint64_t v20 = [v18 initWithURL:v19];
    urlRequest = v17->_urlRequest;
    v17->_urlRequest = (NSMutableURLRequest *)v20;

    v17->_nbyte = a4;
    v17->_offset = a5;
    v17->_buf = a6;
    v17->_stream = a7;
    objc_storeWeak((id *)&v17->_sem, v15);
    v17->_remainingAttempts = [v14 maxAttempts];
    [v14 pauseInterval];
    v17->_pauseInterval = v22;
    v17->_status = 0;
    snprintf(__str, 0xC8uLL, "bytes=%llu-%llu", a5, a4 + a5 - 1);
    v23 = v17->_urlRequest;
    id v24 = (id)[NSString stringWithUTF8String:__str];
    -[NSMutableURLRequest addValue:forHTTPHeaderField:](v23, "addValue:forHTTPHeaderField:", v24, @"Range");

    v25 = v17;
  }

  return v17;
}

- (int)createAndResumeTask
{
  if (-[AAS3DownloadRequest remainingAttempts](self, "remainingAttempts"))
  {
    -[AAS3DownloadRequest setRemainingAttempts:]( self,  "setRemainingAttempts:",  -[AAS3DownloadRequest remainingAttempts](self, "remainingAttempts") - 1);
    objc_initWeak(&location, self);
    v5 = -[AAS3DownloadRequest downloadSession](self, "downloadSession");
    v6 = -[AAS3DownloadSession urlSession](v5, "urlSession");
    v7 = -[AAS3DownloadRequest urlRequest](self, "urlRequest");
    uint64_t v13 = MEMORY[0x1895F87A8];
    uint64_t v14 = 3254779904LL;
    id v15 = __42__AAS3DownloadRequest_createAndResumeTask__block_invoke;
    v16 = &__block_descriptor_40_e8_32w_e46_v32__0__NSData_8__NSURLResponse_16__NSError_24l;
    objc_copyWeak(&v17, &location);
    v8 =  -[NSURLSession dataTaskWithRequest:completionHandler:]( v6,  "dataTaskWithRequest:completionHandler:",  v7,  &v13);

    if (v8)
    {
      -[NSURLSessionDataTask resume](v8, "resume", v13, v14, v15, v16);
      int v11 = 0;
    }

    else
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m",  (uint64_t)"-[AAS3DownloadRequest createAndResumeTask]",  164,  121,  0,  "dataTaskWithRequest",  v9,  v10,  v13);
      int v11 = -1;
    }

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  else
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m",  (uint64_t)"-[AAS3DownloadRequest createAndResumeTask]",  150,  121,  0,  "no more attempts allowed",  v3,  v4,  v13);
    return -1;
  }

  return v11;
}

void __42__AAS3DownloadRequest_createAndResumeTask__block_invoke(uint64_t a1, void *a2, void *a3, id a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  +[AAS3DownloadSession completeRequest:data:response:error:]( &OBJC_CLASS___AAS3DownloadSession,  "completeRequest:data:response:error:",  WeakRetained,  v9,  v8,  v7);
}

- (AAS3DownloadSession)downloadSession
{
  return (AAS3DownloadSession *)objc_loadWeakRetained((id *)&self->_downloadSession);
}

- (void)setDownloadSession:(id)a3
{
}

- (NSMutableURLRequest)urlRequest
{
  return (NSMutableURLRequest *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setUrlRequest:(id)a3
{
}

- (unint64_t)nbyte
{
  return self->_nbyte;
}

- (void)setNbyte:(unint64_t)a3
{
  self->_nbyte = a3;
}

- (int64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(int64_t)a3
{
  self->_offset = a3;
}

- (char)buf
{
  return self->_buf;
}

- (void)setBuf:(char *)a3
{
  self->_buf = a3;
}

- (AAAsyncByteStream_impl)stream
{
  return self->_stream;
}

- (void)setStream:(AAAsyncByteStream_impl *)a3
{
  self->_stream = a3;
}

- (OS_dispatch_semaphore)sem
{
  return (OS_dispatch_semaphore *)objc_loadWeakRetained((id *)&self->_sem);
}

- (void)setSem:(id)a3
{
}

- (unsigned)remainingAttempts
{
  return self->_remainingAttempts;
}

- (void)setRemainingAttempts:(unsigned int)a3
{
  self->_remainingAttempts = a3;
}

- (float)pauseInterval
{
  return self->_pauseInterval;
}

- (void)setPauseInterval:(float)a3
{
  self->_pauseInterval = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
}

@end