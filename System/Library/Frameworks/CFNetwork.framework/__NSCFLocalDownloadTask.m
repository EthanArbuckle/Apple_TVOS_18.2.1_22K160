@interface __NSCFLocalDownloadTask
+ (NSMutableURLRequest)_requestFromResumeDataDictionary:(uint64_t)a1;
+ (id)_expandResumeData:(id)a3;
+ (id)_requestFromResumeDataDictionary:(uint64_t)a3 key:;
- (BOOL)_keepDownloadTaskFile;
- (BOOL)isKindOfClass:(Class)a3;
- (_BYTE)initWithTaskGroup:(uint64_t)a3 request:(uint64_t)a4 filePath:(uint64_t)a5 ident:;
- (__CFDictionary)_copySocketStreamProperties;
- (__NSCFLocalDownloadFile)downloadFile;
- (id)createResumeInformation:(id)a3;
- (id)explicitDownloadDirectory;
- (int)openItemForPath:(id)a3 mode:(int)a4;
- (uint64_t)setupForNewDownload:(_BYTE *)a1;
- (void)_onqueue_cancelByProducingResumeData:(id)a3;
- (void)_onqueue_completeInitialization;
- (void)_onqueue_didReceiveResponse:(id)a3 completion:(id)a4;
- (void)_onqueue_willCacheResponse:(id)a3 withCompletion:(id)a4;
- (void)_private_completionAfterMetrics;
- (void)_private_fileCompletion;
- (void)_supplyExtractorWithData:(uint64_t)a3 completion:;
- (void)_task_onqueue_didFinish;
- (void)_task_onqueue_didReceiveDispatchData:(id)a3 completionHandler:(id)a4;
- (void)cancelByProducingResumeData:(id)a3;
- (void)checkWrite;
- (void)dealloc;
- (void)reportProgress:(void *)self;
- (void)setDownloadFile:(id)a3;
- (void)set_keepDownloadTaskFile:(BOOL)a3;
- (void)terminateExtractorWithError:(id)a3 completion:(id)a4;
@end

@implementation __NSCFLocalDownloadTask

- (BOOL)_keepDownloadTaskFile
{
  v2 = -[__NSCFLocalDownloadTask downloadFile](self, "downloadFile");
  if (v2) {
    LOBYTE(v2) = v2->_skipUnlink;
  }
  return (char)v2;
}

- (void)set_keepDownloadTaskFile:(BOOL)a3
{
  v4 = -[__NSCFLocalDownloadTask downloadFile](self, "downloadFile");
  if (v4) {
    v4->_skipUnlink = a3;
  }
}

- (__CFDictionary)_copySocketStreamProperties
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS_____NSCFLocalDownloadTask;
  v3 = -[NSURLSessionTask _copySocketStreamProperties](&v8, sel__copySocketStreamProperties);
  if (CFDictionaryContainsKey(v3, &unk_18C5AC598)) {
    return v3;
  }
  v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFIndex Count = CFDictionaryGetCount(v3);
  MutableCopy = CFDictionaryCreateMutableCopy(v5, Count + 1, v3);
  if (v3) {
    CFRelease(v3);
  }
  CFDictionarySetValue(MutableCopy, &unk_18C5AC598, (const void *)*MEMORY[0x189604DE8]);
  -[NSURLSessionTask set_cachedSocketStreamProperties:](self, "set_cachedSocketStreamProperties:", MutableCopy);
  return MutableCopy;
}

- (void)dealloc
{
  if (self) {
    objc_setProperty_atomic_copy(self, a2, 0LL, 936LL);
  }
  -[__NSCFLocalDownloadTask setDownloadFile:](self, "setDownloadFile:", 0LL);
  writeBuffer = (dispatch_object_s *)self->_writeBuffer;
  if (writeBuffer) {
    dispatch_release(writeBuffer);
  }

  objc_setProperty_atomic_copy(self, v4, 0LL, 976LL);
  objc_setProperty_atomic_copy(self, v5, 0LL, 1016LL);
  objc_setProperty_atomic_copy(self, v6, 0LL, 1008LL);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS_____NSCFLocalDownloadTask;
  -[__NSCFLocalSessionTask dealloc](&v7, sel_dealloc);
}

- (int)openItemForPath:(id)a3 mode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  int v15 = -1;
  objc_super v7 = dispatch_semaphore_create(0LL);
  if (self)
  {
    internalDelegateWrapper = self->super.super._internalDelegateWrapper;
  }

  else
  {
    internalDelegateWrapper = 0LL;
  }

  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __48____NSCFLocalDownloadTask_openItemForPath_mode___block_invoke;
  v11[3] = &unk_189C115A0;
  v11[4] = v7;
  v11[5] = &v12;
  -[__NSCFURLSessionDelegateWrapper _openFileAtPath:mode:completionHandler:]( (uint64_t)internalDelegateWrapper,  a3,  v4,  v11);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v7);
  int v9 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (void)_onqueue_completeInitialization
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v3 = (void *)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration]( -[NSURLSessionTask _taskGroup](self, "_taskGroup"),  "_groupConfiguration");
  if (-[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile")
    && !-[NSString isEqualToString:]( -[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile"),  "isEqualToString:",  -[__NSCFLocalDownloadFile path](-[__NSCFLocalDownloadTask downloadFile](self, "downloadFile"), "path")))
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v4 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      buf.st_dev = 138543874;
      *(void *)&buf.st_mode = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
      WORD2(buf.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)-[NSURLSessionTask _pathToDownloadTaskFile]( self,  "_pathToDownloadTaskFile");
      HIWORD(buf.st_gid) = 2112;
      *(void *)&buf.st_rdev = -[__NSCFLocalDownloadFile path]( -[__NSCFLocalDownloadTask downloadFile](self, "downloadFile"),  "path");
      _os_log_impl( &dword_18298D000,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ _pathToDownloadTaskFile set to %@ and current path was %@- reconstructing downloadfile object",  (uint8_t *)&buf,  0x20u);
    }

    SEL v5 = objc_alloc(&OBJC_CLASS_____NSCFLocalDownloadFile);
    -[__NSCFLocalDownloadTask setDownloadFile:]( self,  "setDownloadFile:",   -[__NSCFLocalDownloadFile initWithFullPath:protectionType:]( v5,  (void *)objc_msgSend( MEMORY[0x189604030],  "fileURLWithPath:isDirectory:",  -[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile"),  0),  (void *)objc_msgSend(v3, "_downloadFileProtectionType")));
    SEL v6 = -[__NSCFLocalDownloadTask downloadFile](self, "downloadFile");
    if (v6 && v6->_error == 17 && -[NSURLSessionTask _extractor](self, "_extractor")) {
      -[__NSCFLocalDownloadFile setPath:]( -[__NSCFLocalDownloadTask downloadFile](self, "downloadFile"),  "setPath:",  -[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile"));
    }
    objc_super v7 = -[__NSCFLocalDownloadTask downloadFile](self, "downloadFile");
    if (v7) {
      v7->_skipUnlink = 1;
    }
  }

  if ([v3 _requiresClientToOpenFiles]
    && self->_originalResumeInfo
    && !-[NSURLSessionTask _extractor](self, "_extractor"))
  {
    id v8 = (id)-[NSURLRequest mutableCopy]( -[NSURLSessionTask currentRequest](self, "currentRequest"),  "mutableCopy");
    int v9 = -[__NSCFLocalDownloadTask openItemForPath:mode:]( self,  "openItemForPath:mode:",  -[__NSCFLocalDownloadFile path](-[__NSCFLocalDownloadTask downloadFile](self, "downloadFile"), "path"),  0LL);
    if (v9 >= 1)
    {
      int v10 = v9;
      memset(&buf, 0, sizeof(buf));
      if (fstat(v9, &buf))
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        v11 = (os_log_s *)CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          int v14 = *__error();
          *(_DWORD *)v16 = 67109120;
          int v17 = v14;
          _os_log_error_impl( &dword_18298D000,  v11,  OS_LOG_TYPE_ERROR,  "Download task fstat resulted in error %d",  v16,  8u);
        }

        close(v10);
      }

      else
      {
        off_t st_size = buf.st_size;
        close(v10);
        if (st_size >= 1)
        {
          self->_initialResumeSize = st_size;
          self->_totalWrote = st_size;
          uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"bytes=%lld-", st_size);
          goto LABEL_24;
        }
      }
    }

    uint64_t v12 = 0LL;
    self->_initialResumeSize = 0LL;
    self->_totalWrote = 0LL;
LABEL_24:
    [v8 setValue:v12 forHTTPHeaderField:0x18C5AF4D8];
    -[NSURLSessionTask updateCurrentRequest:](self, "updateCurrentRequest:", v8);
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS_____NSCFLocalDownloadTask;
  -[__NSCFLocalSessionTask _onqueue_completeInitialization](&v15, sel__onqueue_completeInitialization);
}

- (void)_onqueue_cancelByProducingResumeData:(id)a3
{
  if (-[NSURLSessionTask state](self, "state") > NSURLSessionTaskStateCanceling)
  {
    v11 = -[NSURLSessionTask session](self, "session");
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __64____NSCFLocalDownloadTask__onqueue_cancelByProducingResumeData___block_invoke_3;
    v14[3] = &unk_189C1A298;
    v14[4] = a3;
    -[NSURLSession runDelegateBlock:]((uint64_t)v11, v14);
  }

  else if (self->_needFinish)
  {
    if (objc_getProperty(self, v5, 976LL, 1))
    {
      id Property = objc_getProperty(self, v6, 976LL, 1);
      id v8 = _Block_copy(Property);
      objc_setProperty_atomic_copy(self, v9, 0LL, 976LL);
      newValue[0] = MEMORY[0x1895F87A8];
      newValue[1] = 3221225472LL;
      newValue[2] = __64____NSCFLocalDownloadTask__onqueue_cancelByProducingResumeData___block_invoke_2;
      newValue[3] = &unk_189C02598;
      newValue[4] = v8;
      newValue[5] = a3;
      objc_setProperty_atomic_copy(self, v10, newValue, 976LL);
    }

    else
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __64____NSCFLocalDownloadTask__onqueue_cancelByProducingResumeData___block_invoke;
      block[3] = &unk_189C1A298;
      block[4] = a3;
      dispatch_async(global_queue, block);
    }
  }

  else
  {
    objc_setProperty_atomic_copy(self, v5, a3, 976LL);
    self->_needFinish = 1;
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS_____NSCFLocalDownloadTask;
    -[__NSCFLocalSessionTask _onqueue_cancel](&v17, sel__onqueue_cancel);
    -[__NSCFLocalDownloadTask checkWrite](self, v12);
  }

- (void)cancelByProducingResumeData:(id)a3
{
  SEL v5 = -[NSURLSessionTask workQueue](self, "workQueue");
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __55____NSCFLocalDownloadTask_cancelByProducingResumeData___block_invoke;
  v6[3] = &unk_189C1A2E8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)v5, v6);
}

- (void)_onqueue_willCacheResponse:(id)a3 withCompletion:(id)a4
{
}

- (void)terminateExtractorWithError:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (-[NSURLSessionTask _extractor](self, "_extractor")
    && !-[NSURLSessionTask _extractorFinishedDecoding](self, "_extractorFinishedDecoding"))
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    objc_super v7 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 138412802;
      v11 = self;
      __int16 v12 = 2112;
      id v13 = a3;
      __int16 v14 = 2048;
      uint64_t v15 = [a3 code];
      _os_log_error_impl( &dword_18298D000,  v7,  OS_LOG_TYPE_ERROR,  "StreamingZip Error: attempting to terminate extractor for task: %@ because of error: %@ [%ld]",  buf,  0x20u);
    }

    id v8 = -[NSURLSessionTask _extractor](self, "_extractor");
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __66____NSCFLocalDownloadTask_terminateExtractorWithError_completion___block_invoke;
    v9[3] = &unk_189C0BC50;
    v9[4] = self;
    -[STExtractor terminateStreamWithError:completionBlock:](v8, "terminateStreamWithError:completionBlock:", a3, v9);
    -[NSURLSessionTask set_extractorFinishedDecoding:](self, "set_extractorFinishedDecoding:", 1LL);
    (*((void (**)(id))a4 + 2))(a4);
  }

  else
  {
    (*((void (**)(id))a4 + 2))(a4);
  }

- (id)createResumeInformation:(id)a3
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  SEL v5 = -[NSURLSessionTask currentRequest](self, "currentRequest");
  SEL v6 = -[NSURL scheme](-[NSURLRequest URL](v5, "URL"), "scheme");
  if (-[NSString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", @"http")
    && -[NSString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", @"https")
    || -[NSString caseInsensitiveCompare:]( -[NSURLRequest HTTPMethod](v5, "HTTPMethod"),  "caseInsensitiveCompare:",  @"GET"))
  {
    return 0LL;
  }

  -[NSURLSessionTask response](self, "response");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    SEL v9 = -[NSURLSessionTask response](self, "response");
    SEL v10 = -[NSURLResponse allHeaderFields](v9, "allHeaderFields");
    uint64_t v11 = -[NSDictionary objectForKey:](v10, "objectForKey:", 0x18C5AF040LL);
    uint64_t v12 = -[NSDictionary objectForKey:](v10, "objectForKey:", 0x18C5AF200LL);
    if (!(v12 | v11)) {
      return 0LL;
    }
    uint64_t v13 = v12;
    uint64_t v32 = 0LL;
    if (a3)
    {
      __int16 v14 = (NSString *)[a3 copy];
      uint64_t v15 = -[NSURLSessionTask _extractor](self, "_extractor");
      BOOL v16 = v15 == 0LL;
      if (v14)
      {
        if (!v15)
        {
          v31 = 0LL;
          objc_super v17 = (void *)[MEMORY[0x189604030] fileURLWithPath:v14];
          if (([v17 getResourceValue:&v32 forKey:*MEMORY[0x189603C20] error:&v31] & 1) == 0)
          {
            if (CFNLog::onceToken != -1) {
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
            }
            v18 = (os_log_s *)CFNLog::logger;
            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)stat buf = 138412290;
              v34 = v31;
              _os_log_error_impl(&dword_18298D000, v18, OS_LOG_TYPE_ERROR, "Failed to size file %@", buf, 0xCu);
            }
          }
        }

        goto LABEL_27;
      }
    }

    else
    {
      BOOL v16 = -[NSURLSessionTask _extractor](self, "_extractor") == 0;
    }

    v21 = -[__NSCFLocalDownloadTask downloadFile](self, "downloadFile");
    if (v21)
    {
      v22 = v21;
      if (!v21->_finished) {
        __assert_rtn("-[__NSCFLocalDownloadFile captureFile:outStat:]", "LocalDownloadFile.mm", 315, "_finished");
      }
      v21->_skipUnlink = 1;
      __int16 v14 = -[__NSCFLocalDownloadFile path](v21, "path");
      off_t st_size = v22->_stat.st_size;
    }

    else
    {
      __int16 v14 = 0LL;
      off_t st_size = 0LL;
    }

    uint64_t v32 = [MEMORY[0x189607968] numberWithLongLong:st_size];
    if (!v14) {
      return 0LL;
    }
LABEL_27:
    objc_super v7 = (void *)[MEMORY[0x189603FC8] dictionaryWithCapacity:0];
    [v7 setObject:&unk_189C46B18 forKey:@"NSURLSessionResumeInfoVersion"];
    objc_msgSend( v7,  "setObject:forKey:",  -[NSString lastPathComponent](v14, "lastPathComponent"),  @"NSURLSessionResumeInfoTempFileName");
    if (v16 && v32) {
      [v7 setObject:v32 forKey:@"NSURLSessionResumeBytesReceived"];
    }
    if (-[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile")) {
      objc_msgSend( v7,  "setObject:forKey:",  -[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile"),  @"NSURLSessionResumeInfoLocalPath");
    }

    objc_msgSend( v7,  "setObject:forKey:",  CFURLGetString((CFURLRef)-[NSURLRequest URL](v5, "URL")),  @"NSURLSessionDownloadURL");
    id v24 = (id)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
    id v25 = (id)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
    objc_msgSend( v24,  "encodeObject:forKey:",  -[NSURLSessionTask currentRequest](self, "currentRequest"),  @"NSKeyedArchiveRootObjectKey");
    uint64_t v26 = [v24 encodedData];
    objc_msgSend( v25,  "encodeObject:forKey:",  -[NSURLSessionTask originalRequest](self, "originalRequest"),  @"NSKeyedArchiveRootObjectKey");
    uint64_t v27 = [v25 encodedData];
    [v7 setObject:v26 forKey:@"NSURLSessionResumeCurrentRequest"];
    [v7 setObject:v27 forKey:@"NSURLSessionResumeOriginalRequest"];
    v31 = 0LL;
    uint64_t v28 = [MEMORY[0x1896078F8] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v31];
    if (v28)
    {
      [v7 setObject:v28 forKey:@"NSURLSessionResumeResponse"];
      if (!v13) {
        goto LABEL_40;
      }
    }

    else
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      v29 = (os_log_s *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
      {
        v30 = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
        *(_DWORD *)stat buf = 138543618;
        v34 = v30;
        __int16 v35 = 2112;
        v36 = v31;
        _os_log_error_impl( &dword_18298D000,  v29,  OS_LOG_TYPE_ERROR,  "%{public}@ failed to archive response: %@",  buf,  0x16u);
        if (!v13) {
          goto LABEL_40;
        }
      }

      else if (!v13)
      {
LABEL_40:
        if (v11) {
          [v7 setObject:v11 forKey:@"NSURLSessionResumeEntityTag"];
        }
        if (-[NSURLSessionTask _extractor](self, "_extractor")) {
          objc_msgSend( v7,  "setObject:forKey:",  -[NSURLSessionTask _extractor](self, "_extractor"),  @"NSURLSessionResumeExtractor");
        }
        if (-[NSURLSessionTask _backgroundPublishingURL](self, "_backgroundPublishingURL")) {
          objc_msgSend( v7,  "setObject:forKey:",  -[NSURLSessionTask _backgroundPublishingURL](self, "_backgroundPublishingURL"),  @"PublishingURL");
        }
        return v7;
      }
    }

    [v7 setObject:v13 forKey:@"NSURLSessionResumeServerDownloadDate"];
    goto LABEL_40;
  }

  if (self->_originalResumeInfo)
  {
    uint64_t v19 = -[__NSCFLocalDownloadTask downloadFile](self, "downloadFile");
    if (v19) {
      v19->_skipUnlink = 1;
    }
    originalResumeInfo = self->_originalResumeInfo;
  }

  else
  {
    originalResumeInfo = 0LL;
  }

  return (id)-[NSDictionary copy](originalResumeInfo, "copy");
}

- (void)_onqueue_didReceiveResponse:(id)a3 completion:(id)a4
{
  SEL v6 = self;
  *(void *)&v27[5] = *MEMORY[0x1895F89C0];
  if (self)
  {
    -[NSURLSessionTask setResponse:](self, "setResponse:", a3);
    -[NSURLSessionTask setCountOfBytesExpectedToReceive:]( v6,  "setCountOfBytesExpectedToReceive:",  [a3 expectedContentLength]);
    self = (__NSCFLocalDownloadTask *)v6->super.super._internalDelegateWrapper;
    if (!self) {
      self = (__NSCFLocalDownloadTask *)v6->super.super._publicDelegateWrapper;
    }
  }

  -[__NSCFURLSessionDelegateWrapper downloadTask:_didReceiveResponse:]((uint64_t)self, v6, a3);
  objc_super v7 = -[__NSCFLocalDownloadTask downloadFile](v6, "downloadFile");
  if (v7)
  {
    id v8 = v7;
    if (v7->_createdPlaceholder
      && (objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "fileExistsAtPath:",  -[__NSCFLocalDownloadFile path](v7, "path")) & 1) == 0)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      SEL v9 = (os_log_s *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 138412290;
        *(void *)uint64_t v27 = -[__NSCFLocalDownloadFile path](v8, "path");
        _os_log_impl( &dword_18298D000,  v9,  OS_LOG_TYPE_DEFAULT,  "LocalDownloadFile placeholder %@ does not exist, recreating.",  buf,  0xCu);
      }

      int v10 = open(-[NSString UTF8String](-[__NSCFLocalDownloadFile path](v8, "path"), "UTF8String"), 2561, 438LL);
      if (v10 < 0)
      {
        v8->_int error = *__error();
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        uint64_t v13 = (os_log_s *)CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          int error = v8->_error;
          uint64_t v23 = -[__NSCFLocalDownloadFile path](v8, "path");
          *(_DWORD *)stat buf = 67109378;
          v27[0] = error;
          LOWORD(v27[1]) = 2112;
          *(void *)((char *)&v27[1] + 2) = v23;
          _os_log_error_impl( &dword_18298D000,  v13,  OS_LOG_TYPE_ERROR,  "LocalDownloadFile: error %d recreating placeholder %@",  buf,  0x12u);
        }
      }

      else
      {
        int v12 = v10;
        -[__NSCFLocalDownloadFile setFileDataProtection](v8, v11);
        close(v12);
      }
    }
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v14 = [a3 statusCode];
    if ((unint64_t)(v14 - 400) <= 0xFFFFFFFFFFFFFED3LL && (dyld_program_sdk_at_least() & 1) == 0)
    {
      else {
        uint64_t v15 = qword_182BD7A78[v14 - 401];
      }
      if (v6) {
        uint64_t v21 = -[__NSCFLocalSessionTask error:code:](v6, "error:code:", *MEMORY[0x189607740], v15);
      }
      else {
        uint64_t v21 = 0LL;
      }
      -[__NSCFLocalSessionTask _onqueue_cancel_with_error:](v6, "_onqueue_cancel_with_error:", v21);
      goto LABEL_32;
    }
  }

  else
  {
    uint64_t v14 = 200LL;
  }

  int64_t initialResumeSize = v6->_initialResumeSize;
  if (v14 != 206 && initialResumeSize != -1)
  {
    v6->_int64_t initialResumeSize = 0LL;
    v6->_totalWrote = 0LL;
    -[__NSCFLocalDownloadFile truncate]((uint64_t)-[__NSCFLocalDownloadTask downloadFile](v6, "downloadFile"));
    int64_t initialResumeSize = v6->_initialResumeSize;
  }

  if ((initialResumeSize & 0x8000000000000000LL) == 0)
  {
    -[NSURLSessionTask setCountOfBytesReceived:]( v6,  "setCountOfBytesReceived:",  v6->_initialResumeSize + -[NSURLSessionTask countOfBytesReceived](v6, "countOfBytesReceived"));
    if ((-[NSURLSessionTask countOfBytesExpectedToReceive](v6, "countOfBytesExpectedToReceive") & 0x8000000000000000LL) == 0) {
      -[NSURLSessionTask setCountOfBytesExpectedToReceive:]( v6,  "setCountOfBytesExpectedToReceive:",  v6->_initialResumeSize + -[NSURLSessionTask countOfBytesExpectedToReceive](v6, "countOfBytesExpectedToReceive"));
    }
    uint64_t internalDelegateWrapper = (uint64_t)v6->super.super._internalDelegateWrapper;
    -[__NSCFURLSessionDelegateWrapper downloadTask:didResumeAtOffset:expectedTotalBytes:]( internalDelegateWrapper,  v6,  -[NSURLSessionTask countOfBytesReceived](v6, "countOfBytesReceived"),  -[NSURLSessionTask countOfBytesExpectedToReceive](v6, "countOfBytesExpectedToReceive"));
  }

- (void)_task_onqueue_didReceiveDispatchData:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (-[NSURLSessionTask _extractor](self, "_extractor")
    && !-[NSURLSessionTask _extractorFinishedDecoding](self, "_extractorFinishedDecoding"))
  {
    int v10 = -[NSURLSessionTask session](self, "session");
    if (v10
      && CFEqual( -[NSURLSessionConfiguration disposition](v10->_local_immutable_configuration_ivar, "disposition"),  &unk_18C5B2680)
      || -[NSURLSessionTask _extractorPreparedForExtraction](self, "_extractorPreparedForExtraction"))
    {
      -[__NSCFLocalDownloadTask _supplyExtractorWithData:completion:](self, (dispatch_data_s *)a3, (uint64_t)a4);
    }

    else
    {
      *(void *)stat buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3052000000LL;
      uint64_t v21 = __Block_byref_object_copy__575;
      v22 = __Block_byref_object_dispose__576;
      uint64_t v23 = -[__NSCFLocalDownloadFile path](-[__NSCFLocalDownloadTask downloadFile](self, "downloadFile"), "path");
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v13 = (os_log_s *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = *(void *)(*(void *)&buf[8] + 40LL);
        *(_DWORD *)char v24 = 138412546;
        *(void *)&v24[4] = v18;
        *(_WORD *)&v24[12] = 2112;
        *(void *)&v24[14] = self;
        _os_log_debug_impl( &dword_18298D000,  v13,  OS_LOG_TYPE_DEBUG,  "StreamingZip - preparing for extraction to %@ for task %@",  v24,  0x16u);
      }

      uint64_t v14 = -[NSURLSessionTask _extractor](self, "_extractor");
      uint64_t v15 = *(void *)(*(void *)&buf[8] + 40LL);
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __82____NSCFLocalDownloadTask__task_onqueue_didReceiveDispatchData_completionHandler___block_invoke;
      v19[3] = &unk_189C02630;
      v19[6] = a4;
      v19[7] = buf;
      v19[4] = self;
      v19[5] = a3;
      -[STExtractor prepareForExtractionToPath:completionBlock:]( v14,  "prepareForExtractionToPath:completionBlock:",  v15,  v19);
      _Block_object_dispose(buf, 8);
    }
  }

  else
  {
    if (-[NSURLSessionTask _extractor](self, "_extractor")
      && -[NSURLSessionTask _extractorFinishedDecoding](self, "_extractorFinishedDecoding"))
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      objc_super v7 = (os_log_s *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)stat buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = dispatch_data_get_size((dispatch_data_t)a3);
        _os_log_impl( &dword_18298D000,  v7,  OS_LOG_TYPE_INFO,  "StreamingZip Info - using SZExtractor which finished decoding for task %@, but we received more bytes.  Dropping %lu bytes.",  buf,  0x16u);
      }

      goto LABEL_9;
    }

    writeBuffer = (dispatch_object_s *)self->_writeBuffer;
    if (writeBuffer)
    {
      self->_writeBuffer = (OS_dispatch_data *)dispatch_data_create_concat( (dispatch_data_t)self->_writeBuffer,  (dispatch_data_t)a3);
      dispatch_release(writeBuffer);
    }

    else
    {
      dispatch_retain((dispatch_object_t)a3);
      self->_writeBuffer = (OS_dispatch_data *)a3;
    }

    if (self->_canWrite)
    {
      -[__NSCFLocalDownloadTask checkWrite](self, v9);
LABEL_9:
      (*((void (**)(id))a4 + 2))(a4);
      return;
    }

    if (self->_ioSuspend) {
      goto LABEL_9;
    }
    uint64_t v11 = (dispatch_data_s *)self->_writeBuffer;
    if (dispatch_data_get_size(v11) <= 0x80000)
    {
      *(void *)char v24 = 0LL;
      *(void *)&v24[8] = v24;
      *(void *)&v24[16] = 0x2020000000LL;
      uint64_t v25 = 0LL;
      *(void *)stat buf = MEMORY[0x1895F87A8];
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = ___ZL13countSegmentsPU27objcproto16OS_dispatch_data8NSObject_block_invoke;
      uint64_t v21 = (void (*)(uint64_t, uint64_t))&unk_189C16CD0;
      v22 = (void (*)(uint64_t))v24;
      dispatch_data_apply(v11, buf);
      unint64_t v16 = *(void *)(*(void *)&v24[8] + 24LL);
      _Block_object_dispose(v24, 8);
      if (v16 < 0x1F) {
        goto LABEL_9;
      }
      unint64_t ioSuspend = self->_ioSuspend;
      self->_unint64_t ioSuspend = ioSuspend + 1;
      if (ioSuspend) {
        goto LABEL_9;
      }
    }

    else
    {
      self->_unint64_t ioSuspend = 1LL;
    }

    objc_setProperty_atomic_copy(self, v12, a4, 1016LL);
    -[__NSCFLocalSessionTask _onqueue_suspend](self, "_onqueue_suspend");
  }

- (void)_task_onqueue_didFinish
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (self->_extractorFinishedSuccessfully && -[NSURLSessionTask error](self, "error"))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      int v3 = 138543618;
      uint64_t v4 = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
      __int16 v5 = 2048;
      NSInteger v6 = -[NSError code](-[NSURLSessionTask error](self, "error"), "code");
      _os_log_impl( &dword_18298D000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%{public}@ extractor finished successfully, discarding previous error [%ld]",  (uint8_t *)&v3,  0x16u);
    }

    -[NSURLSessionTask setError:](self, "setError:", 0LL);
  }

  if (!self->_needFinish)
  {
    self->_needFinish = 1;
    -[__NSCFLocalDownloadTask checkWrite](self, a2);
  }

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS_____NSCFLocalDownloadTask;
  if (-[__NSCFLocalDownloadTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
  }
}

- (__NSCFLocalDownloadFile)downloadFile
{
  return (__NSCFLocalDownloadFile *)objc_getProperty(self, a2, 944LL, 1);
}

- (void)setDownloadFile:(id)a3
{
}

- (void)checkWrite
{
  if (self && self[1028])
  {
    int v3 = (dispatch_data_s *)*((void *)self + 119);
    if (!v3) {
      goto LABEL_34;
    }
    self[1028] = 0;
    size_t size = dispatch_data_get_size(v3);
    int v5 = *((_DWORD *)self + 256);
    *((_DWORD *)self + 256) = v5 + 1;
    uint64_t v6 = [self downloadFile];
    uint64_t v7 = [self session];
    if (v7) {
      id v8 = *(dispatch_queue_s **)(v7 + 120);
    }
    else {
      id v8 = 0LL;
    }
    uint64_t v9 = MEMORY[0x1895F87A8];
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __41____NSCFLocalDownloadTask_writeAndResume__block_invoke;
    v23[3] = &unk_189C025C0;
    int v24 = v5;
    int v25 = 0;
    v23[4] = self;
    v23[5] = size;
    if (v6)
    {
      if (-[__NSCFLocalDownloadFile ioChannel](v6))
      {
        int v10 = *(dispatch_io_s **)(v6 + 152);
        uint64_t v11 = *(dispatch_queue_s **)(v6 + 160);
        uint64_t io_handler = v9;
        uint64_t v27 = 3221225472LL;
        uint64_t v28 = __65____NSCFLocalDownloadFile_writeBytes_completionQueue_completion___block_invoke_2;
        v29 = &unk_189C0E2E8;
        uint64_t v30 = v6;
        v31 = v8;
        uint64_t v32 = v23;
        dispatch_io_write(v10, 0LL, v3, v11, &io_handler);
      }

      else
      {
        uint64_t io_handler = v9;
        uint64_t v27 = 3221225472LL;
        uint64_t v28 = __65____NSCFLocalDownloadFile_writeBytes_completionQueue_completion___block_invoke;
        v29 = &unk_189C1A2E8;
        uint64_t v30 = v6;
        v31 = (dispatch_queue_s *)v23;
        dispatch_async(v8, &io_handler);
      }
    }

    dispatch_release(*((dispatch_object_t *)self + 119));
    *((void *)self + 119) = 0LL;
    if (self[1028])
    {
LABEL_34:
      if (!*((void *)self + 120)) {
        goto LABEL_35;
      }
      *((void *)self + 120) = 0LL;
      if (objc_getProperty(self, a2, 1016LL, 1))
      {
        id Property = objc_getProperty(self, v12, 1016LL, 1);
        uint64_t v14 = (void (**)(void))_Block_copy(Property);
        objc_setProperty_atomic_copy(self, v15, 0LL, 1016LL);
        v14[2](v14);
        _Block_release(v14);
      }

      objc_msgSend(self, "_onqueue_resume");
      if (self[1028])
      {
LABEL_35:
        if (self[1030])
        {
          if (!self[1031])
          {
            [self _finishProgressReporting];
            self[1031] = 1;
            if ([self session])
            {
              uint64_t v16 = [self session];
              if (v16)
              {
                if (*(void *)(v16 + 120))
                {
                  if ([self _extractor])
                  {
                    uint64_t v17 = [self downloadFile];
                    if (v17) {
                      *(_BYTE *)(v17 + 168) = 1;
                    }
                    uint64_t v18 = (void *)MEMORY[0x186E1578C]();
                    -[__NSCFLocalDownloadTask _private_fileCompletion](self);
                    objc_autoreleasePoolPop(v18);
                  }

                  else
                  {
                    if ([self error]) {
                      -[__NSCFLocalDownloadFile markPurgeable]([self downloadFile]);
                    }
                    char v19 = (_BYTE *)[self downloadFile];
                    uint64_t v20 = [self session];
                    if (v20) {
                      uint64_t v21 = *(dispatch_queue_s **)(v20 + 120);
                    }
                    else {
                      uint64_t v21 = 0LL;
                    }
                    v22[0] = MEMORY[0x1895F87A8];
                    v22[1] = 3221225472LL;
                    v22[2] = __37____NSCFLocalDownloadTask_checkWrite__block_invoke;
                    v22[3] = &unk_189C1A548;
                    v22[4] = self;
                    -[__NSCFLocalDownloadFile finishOnQueue:completion:](v19, v21, v22);
                  }
                }
              }
            }
          }
        }
      }
    }
  }

- (void)_private_fileCompletion
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if ([a1 _extractor]
      && [a1 _extractorPreparedForExtraction]
      && ([a1 _extractorFinishedDecoding] & 1) == 0)
    {
      if ([a1 error])
      {
        if ([a1 _extractor])
        {
          v2 = dispatch_semaphore_create(0LL);
          int v3 = (void *)[a1 _extractor];
          *(void *)stat buf = MEMORY[0x1895F87A8];
          *(void *)&buf[8] = 3221225472LL;
          *(void *)&buf[16] = __43____NSCFLocalDownloadTask_suspendExtractor__block_invoke;
          uint64_t v9 = &unk_189C025E8;
          int v10 = a1;
          uint64_t v11 = v2;
          [v3 suspendStreamWithCompletionBlock:buf];
          dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
          dispatch_release(v2);
        }
      }

      else
      {
        objc_msgSend(a1, "setError:", objc_msgSend(a1, "error:code:", *MEMORY[0x189607740], -3007));
        objc_msgSend( a1,  "terminateExtractorWithError:completion:",  objc_msgSend(a1, "error"),  &__block_literal_global_563);
      }
    }

    if (a1[1032] && [a1 error])
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = [a1 _loggableDescription];
        uint64_t v5 = objc_msgSend((id)objc_msgSend(a1, "error"), "code");
        *(_DWORD *)stat buf = 138543618;
        *(void *)&uint8_t buf[4] = v4;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v5;
        _os_log_impl( &dword_18298D000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%{public}@ extractor finished successfully, discarding previous error [%ld]",  buf,  0x16u);
      }

      [a1 setError:0];
    }

    -[__CFN_TaskMetrics completeWithError:]([a1 _metrics], (void *)objc_msgSend(a1, "error"));
    if ([a1 _needSendingMetrics])
    {
      [a1 _didSendMetrics];
      uint64_t v6 =  -[NSURLSessionTaskMetrics initWithMetrics:]( (id *)[NSURLSessionTaskMetrics alloc],  (void *)[a1 _metrics]);
      -[NSURLSessionTaskMetrics collectWithCompletionHandler:queue:]( (uint64_t)v6,  &v7,  (void *)objc_msgSend( a1,  "workQueue",  MEMORY[0x1895F87A8],  3221225472,  __50____NSCFLocalDownloadTask__private_fileCompletion__block_invoke_48,  &unk_189C1A270,  a1,  v6));
    }

    else
    {
      -[__NSCFLocalDownloadTask _private_completionAfterMetrics](a1);
    }
  }

- (void)_private_completionAfterMetrics
{
  v69[9] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  if (![a1 error] || objc_getProperty(a1, v2, 976, 1))
  {
    if (objc_getProperty(a1, v2, 976LL, 1))
    {
      uint64_t v3 = [a1 createResumeInformation:0];
      if (v3)
      {
        uint64_t v5 = v3;
        uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
        [v6 encodeObject:v5 forKey:@"NSKeyedArchiveRootObjectKey"];
        uint64_t v7 = [v6 encodedData];
      }

      else
      {
        uint64_t v7 = 0LL;
      }

      id Property = objc_getProperty(a1, v4, 976LL, 1);
      uint64_t v28 = _Block_copy(Property);
      objc_setProperty_atomic_copy(a1, v29, 0LL, 976LL);
      uint64_t v30 = (void *)[a1 error:*MEMORY[0x189607740] code:-999];
      v31 = (void *)[MEMORY[0x189603FC8] dictionaryWithCapacity:0];
      objc_msgSend(v31, "addEntriesFromDictionary:", objc_msgSend(v30, "userInfo"));
      if (v7) {
        [v31 setObject:v7 forKey:@"NSURLSessionDownloadTaskResumeData"];
      }
      uint64_t v32 = objc_msgSend( MEMORY[0x189607A70],  "errorWithDomain:code:userInfo:",  objc_msgSend(v30, "domain"),  objc_msgSend(v30, "code"),  v31);
      uint64_t v33 = [a1 session];
      uint64_t v34 = MEMORY[0x1895F87A8];
      v68[0] = MEMORY[0x1895F87A8];
      v68[1] = 3221225472LL;
      v68[2] = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke;
      v68[3] = &unk_189C1A2E8;
      v68[4] = v7;
      v68[5] = v28;
      -[NSURLSession runDelegateBlock:](v33, v68);
      [a1 setError:v32];
      if (objc_getProperty(a1, v35, 936LL, 1))
      {
        id v37 = objc_getProperty(a1, v36, 936LL, 1);
        v38 = _Block_copy(v37);
        objc_setProperty_atomic_copy(a1, v39, 0LL, 936LL);
        if ([a1 _callCompletionHandlerInline])
        {
          (*((void (**)(void *, void *, void, uint64_t, uint64_t))v38 + 2))( v38,  a1,  0,  [a1 response],  objc_msgSend(a1, "error"));
          _Block_release(v38);
          [a1 setState:3];
          -[NSURLSessionTask _resetTaskDelegate]((uint64_t)a1, v40);
        }

        else
        {
          v67[0] = v34;
          v67[1] = 3221225472LL;
          v67[2] = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_2;
          v67[3] = &unk_189C1A2E8;
          v67[4] = a1;
          v67[5] = v38;
          -[NSURLSession runDelegateBlock:]([a1 session], v67);
        }
      }

      else
      {
        -[NSURLSession _onqueue_didCompleteTask:withError:]( [a1 session],  a1,  (void *)objc_msgSend(a1, "error"));
      }

      goto LABEL_53;
    }

    if (a1[119]) {
      __assert_rtn( "-[__NSCFLocalDownloadTask _private_completionAfterMetrics]",  "LocalDownloadTask.mm",  940,  "_writeBuffer == NULL");
    }
    id v8 = (void *)[a1 downloadFile];
    if (v8) {
      uint64_t v10 = objc_msgSend( MEMORY[0x189604030],  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  objc_msgSend((id)objc_msgSend(v8, "path"), "UTF8String"),  0,  0);
    }
    else {
      uint64_t v10 = 0LL;
    }
    if (objc_getProperty(a1, v9, 936LL, 1))
    {
      id v12 = objc_getProperty(a1, v11, 936LL, 1);
      uint64_t v13 = (void (**)(void *, void *, uint64_t, uint64_t, uint64_t))_Block_copy(v12);
      objc_setProperty_atomic_copy(a1, v14, 0LL, 936LL);
      if ([a1 _callCompletionHandlerInline])
      {
        v13[2](v13, a1, v10, [a1 response], objc_msgSend(a1, "error"));
        _Block_release(v13);
        [a1 setState:3];
        -[NSURLSessionTask _resetTaskDelegate]((uint64_t)a1, v15);
      }

      else
      {
        uint64_t v49 = [a1 session];
        v66[0] = MEMORY[0x1895F87A8];
        v66[1] = 3221225472LL;
        v66[2] = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_3;
        v66[3] = &unk_189C1A480;
        v66[5] = v10;
        v66[6] = v13;
        v66[4] = a1;
        -[NSURLSession runDelegateBlock:](v49, v66);
      }

      goto LABEL_53;
    }

    uint64_t v41 = a1[88];
    if (!v41) {
      uint64_t v41 = a1[87];
    }
    int v42 = -[__NSCFURLSessionDelegateWrapper didFinishDownloadingToURL](v41, v11);
    char v44 = v42;
    if (a1[125])
    {
      uint64_t v45 = a1[88];
      if (!v45) {
        uint64_t v45 = a1[87];
      }
      char v46 = -[__NSCFURLSessionDelegateWrapper didWriteData](v45, v43);
      char v48 = v46;
      if ((v44 & 1) != 0)
      {
        uint64_t newValue = MEMORY[0x1895F87A8];
        uint64_t v60 = 3221225472LL;
        v61 = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_5;
        v62 = &unk_189C1A270;
        v63 = a1;
        uint64_t v64 = v10;
        if ((v46 & 1) != 0)
        {
          objc_setProperty_atomic_copy(a1, v47, &newValue, 1008LL);
          -[__NSCFLocalDownloadTask reportProgress:](a1, 0LL);
          goto LABEL_53;
        }

- (void)reportProgress:(void *)self
{
  if (self)
  {
    self[121] += a2;
    self[125] += a2;
    if (!*((_BYTE *)self + 1029))
    {
      *((_BYTE *)self + 1029) = 1;
      if (!objc_getProperty(self, a2, 936LL, 1))
      {
        uint64_t v4 = self[88];
        if (!v4) {
          uint64_t v4 = self[87];
        }
        if (-[__NSCFURLSessionDelegateWrapper didWriteData](v4, v3))
        {
          uint64_t v5 = self[125];
          self[125] = 0LL;
          if (v5)
          {
            uint64_t v6 = self[88];
            if (!v6) {
              uint64_t v6 = self[87];
            }
            uint64_t v7 = self[121];
            uint64_t v8 = [self countOfBytesExpectedToReceive];
            v9[0] = MEMORY[0x1895F87A8];
            v9[1] = 3221225472LL;
            v9[2] = __42____NSCFLocalDownloadTask_reportProgress___block_invoke;
            v9[3] = &unk_189C1A548;
            v9[4] = self;
            -[__NSCFURLSessionDelegateWrapper downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:completionHandler:]( v6,  self,  v5,  v7,  v8,  v9);
          }

          else
          {
            *((_BYTE *)self + 1029) = 0;
          }
        }
      }
    }
  }

- (void)_supplyExtractorWithData:(uint64_t)a3 completion:
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v5 = result;
    if ([result _extractorPreparedForExtraction])
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v6 = (os_log_s *)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)stat buf = 134218242;
        uint64_t v11 = -[dispatch_data_s length](a2, "length");
        __int16 v12 = 2112;
        uint64_t v13 = v5;
        _os_log_debug_impl( &dword_18298D000,  v6,  OS_LOG_TYPE_DEBUG,  "StreamingZip(LocalDownloadTask) - supplied %lu bytes to extractor for decoding in task %@.",  buf,  0x16u);
      }

      size_t size = dispatch_data_get_size(a2);
      uint64_t v8 = (void *)[v5 _extractor];
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __63____NSCFLocalDownloadTask__supplyExtractorWithData_completion___block_invoke;
      v9[3] = &unk_189C02658;
      v9[4] = v5;
      void v9[5] = a3;
      v9[6] = size;
      return (void *)[v8 supplyBytes:a2 withCompletionBlock:v9];
    }

    else
    {
      return (void *)(*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
    }
  }

  return result;
}

+ (id)_expandResumeData:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x1896079E8] propertyListWithData:a3 options:0 format:0 error:0];
  uint64_t v5 = v4;
  if (v4 && [v4 objectForKey:@"$archiver"])
  {
    id v6 = (id)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:a3 error:0];
    [v6 setDecodingFailurePolicy:0];
    uint64_t v7 = (void *)[v6 decodeObjectOfClasses:resumeDataClasses(void)::resumeDataClasses forKey:@"NSKeyedArchiveRootObjectKey"];
    [v6 finishDecoding];
    if (v7) {
      return v7;
    }
  }

  return v5;
}

- (id)explicitDownloadDirectory
{
  id result = (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a1, "_taskGroup"), "_groupConfiguration"),  "_directoryForDownloadedFiles");
  if (!result)
  {
    if (a1)
    {
      uint64_t v3 = a1[88];
      if (!v3) {
        uint64_t v3 = a1[87];
      }
    }

    else
    {
      uint64_t v3 = 0LL;
    }

    return -[__NSCFURLSessionDelegateWrapper _downloadTaskNeedsDownloadDirectory:](v3, a1);
  }

  return result;
}

- (uint64_t)setupForNewDownload:(_BYTE *)a1
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)objc_msgSend((id)objc_msgSend(a1, "_taskGroup"), "_groupConfiguration");
  int v5 = [v4 _requiresClientToOpenFiles];
  if (a2 && v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS_____NSCFLocalDownloadFile);
    if (v6)
    {
      uint64_t v7 = -[__NSCFLocalDownloadFile initQueues](v6);
      uint64_t v8 = v7;
      if (v7)
      {
        [v7 setPath:a2];
        v8[24] = a1;
      }
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    [a1 setDownloadFile:v8];
    -[__NSCFLocalDownloadFile truncate]([a1 downloadFile]);
  }

  else
  {
    uint64_t v9 = [a1 _pathToDownloadTaskFile];
    uint64_t v10 = objc_alloc(&OBJC_CLASS_____NSCFLocalDownloadFile);
    if (v9)
    {
      p_isa = -[__NSCFLocalDownloadFile initWithFullPath:protectionType:]( v10,  (void *)objc_msgSend( MEMORY[0x189604030],  "fileURLWithPath:isDirectory:",  objc_msgSend(a1, "_pathToDownloadTaskFile"),  0),  (void *)objc_msgSend(v4, "_downloadFileProtectionType"));
    }

    else
    {
      id v12 = -[__NSCFLocalDownloadTask explicitDownloadDirectory](a1);
      uint64_t v13 = [v4 _downloadFileProtectionType];
      if (v10)
      {
        uint64_t v14 = (void *)v13;
        SEL v15 = (__NSCFLocalDownloadFile *)-[__NSCFLocalDownloadFile initQueues](v10);
        uint64_t v10 = v15;
        if (v15)
        {
          objc_setProperty_atomic_copy(v15, v16, v14, 208LL);
          if (v12) {
            uint64_t v17 = (NSString *)[v12 path];
          }
          else {
            uint64_t v17 = NSTemporaryDirectory();
          }
          snprintf( __str,  0x400uLL,  "%s",  -[NSString UTF8String]( -[NSString stringByAppendingPathComponent:]( v17,  "stringByAppendingPathComponent:",  @"CFNetworkDownload_XXXXXX.tmp"),  "UTF8String"));
          int v18 = mkstemps(__str, 4);
          if (v18 < 0)
          {
            v10->_int error = *__error();
            if (CFNLog::onceToken != -1) {
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
            }
            uint64_t v21 = (os_log_s *)CFNLog::logger;
            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
            {
              int error = v10->_error;
              *(_DWORD *)stat buf = 67109378;
              int v28 = error;
              __int16 v29 = 2080;
              uint64_t v30 = __str;
              _os_log_error_impl( &dword_18298D000,  v21,  OS_LOG_TYPE_ERROR,  "__NSCFLocalDownloadFile: error %d creating temp file: %s",  buf,  0x12u);
            }
          }

          else
          {
            int v19 = v18;
            -[__NSCFLocalDownloadFile setPath:]( v10,  "setPath:",  (id)[objc_alloc(NSString) initWithUTF8String:__str]);
            -[__NSCFLocalDownloadFile setFileDataProtection](v10, v20);
            close(v19);
            v10->_createdPlaceholder = 1;
          }
        }
      }

      p_isa = &v10->super.isa;
    }

    [a1 setDownloadFile:p_isa];
  }

  char v22 = objc_msgSend(v4, "skip_download_unlink");
  uint64_t v23 = [a1 downloadFile];
  if (v23) {
    *(_BYTE *)(v23 + 185) = v22;
  }
  if ([a1 _pathToDownloadTaskFile])
  {
    uint64_t v24 = [a1 downloadFile];
    if (v24) {
      *(_BYTE *)(v24 + 185) = 1;
    }
  }

  a1[1028] = [a1 downloadFile] != 0;
  return a1[1028];
}

- (_BYTE)initWithTaskGroup:(uint64_t)a3 request:(uint64_t)a4 filePath:(uint64_t)a5 ident:
{
  if (!a1) {
    return 0LL;
  }
  a1[123] = -1LL;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_CLASS_____NSCFLocalDownloadTask;
  id v6 = objc_msgSendSuper2(&v9, sel_initWithOriginalRequest_ident_taskGroup_, a3, a5, a2);
  uint64_t v7 = v6;
  if (v6)
  {
    if ((-[__NSCFLocalDownloadTask setupForNewDownload:](v6, a4) & 1) != 0)
    {
      objc_msgSend(v7, "set_suspensionThreshhold:", 0x80000);
      v7[69] = 0;
      return v7;
    }

    return 0LL;
  }

  return v7;
}

+ (id)_requestFromResumeDataDictionary:(uint64_t)a3 key:
{
  uint64_t v5 = [a2 objectForKey:a3];
  if (v5)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v5 error:0];
    [v6 setDecodingFailurePolicy:0];
    uint64_t v7 = (void *)objc_msgSend( (id)objc_msgSend( v6,  "decodeObjectOfClasses:forKey:",  resumeDataClasses(void)::resumeDataClasses,  @"NSKeyedArchiveRootObjectKey"),  "mutableCopy");
    [v6 finishDecoding];
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

+ (NSMutableURLRequest)_requestFromResumeDataDictionary:(uint64_t)a1
{
  id result = (NSMutableURLRequest *)+[__NSCFLocalDownloadTask _requestFromResumeDataDictionary:key:]( (uint64_t)&OBJC_CLASS_____NSCFLocalDownloadTask,  a2,  (uint64_t)@"NSURLSessionResumeCurrentRequest");
  if (!result)
  {
    id result = (NSMutableURLRequest *)+[__NSCFLocalDownloadTask _requestFromResumeDataDictionary:key:]( (uint64_t)&OBJC_CLASS_____NSCFLocalDownloadTask,  a2,  (uint64_t)@"NSURLSessionResumeOriginalRequest");
    if (!result) {
      return  -[NSURLRequest initWithURL:cachePolicy:timeoutInterval:]( [NSMutableURLRequest alloc],  "initWithURL:cachePolicy:timeoutInterval:",  objc_msgSend( MEMORY[0x189604030],  "URLWithString:",  objc_msgSend(a2, "objectForKey:", @"NSURLSessionDownloadURL")),  1,  120.0);
    }
  }

  return result;
}

@end