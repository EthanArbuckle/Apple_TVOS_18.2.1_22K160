@interface PBSessionRequester
+ (BOOL)usesEncodedMessages;
- (BOOL)ignoresResponse;
- (BOOL)isPaused;
- (BOOL)readResponsePreamble:(id)a3;
- (BOOL)shouldHandleCookies;
- (NSArray)clientCertificates;
- (NSArray)requests;
- (NSDictionary)httpRequestHeaders;
- (NSDictionary)httpResponseHeaders;
- (NSString)apsRelayTopic;
- (NSString)logRequestToFile;
- (NSString)logResponseToFile;
- (NSURL)URL;
- (NSURLSession)session;
- (NSURLSessionTask)currentTask;
- (PBSessionRequester)initWithURL:(id)a3 delegate:(id)a4 queue:(id)a5;
- (PBSessionRequesterDelegate)delegate;
- (double)timeoutSeconds;
- (id)_cancelNoNotify;
- (id)decodeResponseData:(id)a3;
- (id)internalRequests;
- (id)newMutableURLRequestWithURL:(id)a3;
- (id)newSessionTaskOnSession:(id)a3 withURLRequest:(id)a4;
- (id)newSessionWithDelegate:(id)a3 delegateQueue:(id)a4;
- (id)newSessionWithDelegate:(id)a3 delegateQueue:(id)a4 connectionProperties:(id)a5;
- (id)requestPreamble;
- (id)responseForInternalRequest:(id)a3;
- (id)responseForRequest:(id)a3;
- (id)tryReadResponseData:(id)a3 forRequest:(id)a4 forResponseClass:(Class)a5;
- (uint64_t)_cleanup;
- (uint64_t)_newSessionWithDelegate:(void *)a3 delegateQueue:(void *)a4 connectionProperties:;
- (uint64_t)_tryParseData;
- (unint64_t)downloadPayloadSize;
- (unint64_t)nwActivityDomain;
- (unint64_t)nwActivityLabel;
- (unint64_t)requestResponseTime;
- (unint64_t)uploadPayloadSize;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_failWithError:(uint64_t)a1;
- (void)_failWithErrorDomain:(uint64_t)a3 errorCode:(void *)a4 userInfo:;
- (void)_serializePayload:(uint64_t)a1;
- (void)_start;
- (void)addInternalRequest:(id)a3;
- (void)addRequest:(id)a3;
- (void)cancel;
- (void)cancelWithErrorCode:(int64_t)a3;
- (void)cancelWithErrorCode:(void *)a3 description:;
- (void)clearRequests;
- (void)dealloc;
- (void)encodeRequestData:(id)a3 startRequestCallback:(id)a4;
- (void)pause;
- (void)resume;
- (void)setApsRelayTopic:(id)a3;
- (void)setClientCertificates:(id)a3;
- (void)setCurrentTask:(id)a3;
- (void)setHttpRequestHeader:(id)a3 forKey:(id)a4;
- (void)setHttpRequestHeaders:(id)a3;
- (void)setHttpResponseHeaders:(id)a3;
- (void)setIgnoresResponse:(BOOL)a3;
- (void)setLogRequestToFile:(id)a3;
- (void)setLogResponseToFile:(id)a3;
- (void)setNeedsCancel;
- (void)setNwActivityDomain:(unint64_t)a3;
- (void)setNwActivityLabel:(unint64_t)a3;
- (void)setSession:(id)a3;
- (void)setShouldHandleCookies:(BOOL)a3;
- (void)setTimeoutSeconds:(double)a3;
- (void)setURL:(id)a3;
- (void)startWithConnectionProperties:(id)a3;
- (void)writeRequest:(id)a3 into:(id)a4;
@end

@implementation PBSessionRequester

- (PBSessionRequester)initWithURL:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PBSessionRequester;
  v12 = -[PBSessionRequester init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_URL, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v13->_delegateQueue, a5);
    id v14 = objc_loadWeakRetained((id *)&v13->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      __int16 v15 = 32;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)&v13->_flags = *(_WORD *)&v13->_flags & 0xFFDF | v15;
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      __int16 v16 = 64;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)&v13->_flags = *(_WORD *)&v13->_flags & 0xFFBF | v16;
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      __int16 v17 = 128;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)&v13->_flags = *(_WORD *)&v13->_flags & 0xFF7F | v17;
    char v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0) {
      __int16 v19 = 256;
    }
    else {
      __int16 v19 = 0;
    }
    *(_WORD *)&v13->_flags = *(_WORD *)&v13->_flags & 0xFEFF | v19;

    v13->_timeoutSeconds = -1.0;
    v20 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x189607988]);
    sessionDelegateQ = v13->_sessionDelegateQ;
    v13->_sessionDelegateQ = v20;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v13->_sessionDelegateQ, "setMaxConcurrentOperationCount:", 1LL);
  }

  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBSessionRequester;
  -[PBSessionRequester dealloc](&v3, sel_dealloc);
}

- (BOOL)ignoresResponse
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)setIgnoresResponse:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (void)setNeedsCancel
{
  if (self) {
    *(_WORD *)&self->_flags |= 4u;
  }
}

- (NSArray)requests
{
  return (NSArray *)self->_requests;
}

- (void)clearRequests
{
}

- (void)addRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    requests = self->_requests;
    id v8 = v4;
    if (!requests)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
      v7 = self->_requests;
      self->_requests = v6;

      requests = self->_requests;
    }

    -[NSMutableArray addObject:](requests, "addObject:", v8);
    id v4 = v8;
  }
}

- (id)responseForRequest:(id)a3
{
  id v4 = a3;
  if (!-[NSMutableArray count](self->_requests, "count")
    || (unint64_t v5 = -[NSMutableArray indexOfObject:](self->_requests, "indexOfObject:", v4), v5 == 0x7FFFFFFFFFFFFFFFLL)
    || (unint64_t v6 = v5, v5 >= -[NSMutableArray count](self->_responses, "count")))
  {
    v7 = 0LL;
  }

  else
  {
    v7 = -[NSMutableArray objectAtIndex:](self->_responses, "objectAtIndex:", v6);
  }

  return v7;
}

- (id)internalRequests
{
  return self->_internalRequests;
}

- (void)addInternalRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    internalRequests = self->_internalRequests;
    id v8 = v4;
    if (!internalRequests)
    {
      unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
      v7 = self->_internalRequests;
      self->_internalRequests = v6;

      internalRequests = self->_internalRequests;
    }

    -[NSMutableArray addObject:](internalRequests, "addObject:", v8);
    id v4 = v8;
  }
}

- (id)responseForInternalRequest:(id)a3
{
  id v4 = a3;
  if (!-[NSMutableArray count](self->_internalRequests, "count")
    || (unint64_t v5 = -[NSMutableArray indexOfObject:](self->_internalRequests, "indexOfObject:", v4), v5 == 0x7FFFFFFFFFFFFFFFLL)
    || (unint64_t v6 = v5, v5 >= -[NSMutableArray count](self->_internalResponses, "count")))
  {
    v7 = 0LL;
  }

  else
  {
    v7 = -[NSMutableArray objectAtIndex:](self->_internalResponses, "objectAtIndex:", v6);
  }

  return v7;
}

- (NSDictionary)httpRequestHeaders
{
  return (NSDictionary *)self->_httpRequestHeaders;
}

- (void)setHttpRequestHeaders:(id)a3
{
  if (self->_httpRequestHeaders != a3)
  {
    id v4 = (NSMutableDictionary *)[a3 mutableCopy];
    httpRequestHeaders = self->_httpRequestHeaders;
    self->_httpRequestHeaders = v4;
  }

- (void)setHttpRequestHeader:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10 && v6)
  {
    httpRequestHeaders = self->_httpRequestHeaders;
    if (!httpRequestHeaders)
    {
      id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      id v9 = self->_httpRequestHeaders;
      self->_httpRequestHeaders = v8;

      httpRequestHeaders = self->_httpRequestHeaders;
    }

    -[NSMutableDictionary setObject:forKey:](httpRequestHeaders, "setObject:forKey:", v10, v6);
  }
}

- (id)requestPreamble
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __37__PBSessionRequester_requestPreamble__block_invoke;
  block[3] = &unk_189D32498;
  block[4] = self;
  if (requestPreamble__once == -1)
  {
    if (self) {
      goto LABEL_3;
    }
LABEL_12:
    id v9 = 0LL;
    goto LABEL_9;
  }

  dispatch_once(&requestPreamble__once, block);
  if (!self) {
    goto LABEL_12;
  }
LABEL_3:
  [MEMORY[0x189603F90] preferredLanguages];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 count]
    && ([v3 objectAtIndex:0], (id v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = v4;
    [MEMORY[0x189603F90] currentLocale];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKey:*MEMORY[0x189603A98]];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v7 length])
    {
      [NSString stringWithFormat:@"%@_%@", v5, v7];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v8 = v5;
    }
  }

  else
  {
    [MEMORY[0x189603F90] currentLocale];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 localeIdentifier];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = 0LL;
  }

  id v9 = v8;
LABEL_9:
  id v10 = objc_alloc_init(&OBJC_CLASS___PBDataWriter);
  -[PBDataWriter writeBigEndianFixed16:](v10, "writeBigEndianFixed16:", 1LL);
  -[PBDataWriter writeBigEndianShortThenString:](v10, "writeBigEndianShortThenString:", v9);
  -[PBDataWriter writeBigEndianShortThenString:](v10, "writeBigEndianShortThenString:", requestPreamble_applicationID);
  -[PBDataWriter writeBigEndianShortThenString:](v10, "writeBigEndianShortThenString:", requestPreamble_osVersion);
  -[PBDataWriter immutableData](v10, "immutableData");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)writeRequest:(id)a3 into:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend(v5, "writeBigEndianFixed32:", objc_msgSend(v6, "requestTypeCode"));
  id v8 = objc_alloc_init(&OBJC_CLASS___PBDataWriter);
  [v6 writeTo:v8];
  v7 = -[PBDataWriter immutableData](v8, "immutableData");
  [v5 writeProtoBuffer:v7];
}

- (void)cancel
{
  objc_super v3 = (NSOperationQueue *)objc_claimAutoreleasedReturnValue();
  sessionDelegateQ = self->_sessionDelegateQ;

  if (v3 == sessionDelegateQ)
  {
    -[PBSessionRequester _cancelNoNotify]((id *)&self->super.isa);
    if (!self->_didNotifyRequestCompleted)
    {
      self->_didNotifyRequestCompleted = 1;
      if ((*(_WORD *)&self->_flags & 0x80) != 0)
      {
        v9[0] = MEMORY[0x1895F87A8];
        v9[1] = 3221225472LL;
        v9[2] = __28__PBSessionRequester_cancel__block_invoke_2;
        v9[3] = &unk_189D32498;
        v9[4] = self;
        -[NSOperationQueue addOperationWithBlock:](self->_delegateQueue, "addOperationWithBlock:", v9);
      }

      -[NSURLSessionTask _nw_activity](self->_currentTask, "_nw_activity");
      id v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v8 = 0;
          _os_log_impl( &dword_183BC1000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "pbSessionRequester, activity, cancelled",  v8,  2u);
        }
        v7 = -[NSURLSessionTask _nw_activity](self->_currentTask, "_nw_activity");
        nw_activity_complete_with_reason();
      }
    }
  }

  else
  {
    id v5 = self->_sessionDelegateQ;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __28__PBSessionRequester_cancel__block_invoke;
    v10[3] = &unk_189D32498;
    v10[4] = self;
    -[NSOperationQueue addOperationWithBlock:](v5, "addOperationWithBlock:", v10);
  }

- (void)pause
{
  if ((*(_WORD *)&self->_flags & 0x206) == 2)
  {
    uint64_t v3 = -[NSMutableArray count](self->_responses, "count");
    if (v3 == -[NSMutableArray count](self->_requests, "count"))
    {
      *(_WORD *)&self->_flags |= 0x200u;
      -[NSURLSessionTask cancel](self->_currentTask, "cancel");
      currentTask = self->_currentTask;
      self->_currentTask = 0LL;

      -[NSURLSession invalidateAndCancel](self->_session, "invalidateAndCancel");
      session = self->_session;
      self->_session = 0LL;

      -[NSMutableArray removeAllObjects](self->_internalResponses, "removeAllObjects");
      data = self->_data;
      self->_data = 0LL;

      dataReader = self->_dataReader;
      self->_dataReader = 0LL;

      -[PBSessionRequester setHttpResponseHeaders:](self, "setHttpResponseHeaders:", 0LL);
      *(_WORD *)&self->_flags &= ~8u;
    }
  }

- (BOOL)isPaused
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (void)resume
{
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xF9FF | 0x400;
    -[PBSessionRequester start](self, "start");
    *(_WORD *)&self->_flags &= ~0x400u;
  }

- (void)cancelWithErrorCode:(int64_t)a3
{
}

- (BOOL)readResponsePreamble:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 readBigEndianFixed16];
  char v6 = [v4 hasError];

  if ((v6 & 1) == 0)
  {
    if (v5 == 1) {
      return 1;
    }
    objc_msgSend( NSString,  "stringWithFormat:",  @"Incorrect protocol version: %i (expected %i).",  v5,  1);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBSessionRequester cancelWithErrorCode:description:]((uint64_t)self, 6001LL, v8);
  }

  return 0;
}

- (id)tryReadResponseData:(id)a3 forRequest:(id)a4 forResponseClass:(Class)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 readBigEndianFixed32];
  if ([v7 hasError]) {
    goto LABEL_5;
  }
  if ((_DWORD)v9 != [v8 requestTypeCode])
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"Incorrect requestTypeCode: %i (expected %i).",  v9,  objc_msgSend(v8, "requestTypeCode"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBSessionRequester cancelWithErrorCode:description:]((uint64_t)self, 6001LL, v11);

LABEL_5:
    id v10 = 0LL;
    goto LABEL_6;
  }

  [v7 readProtoBuffer];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v10;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v23 = a5;
  id v10 = a6;
  id v11 = (void (**)(void, void))v10;
  if (*(_OWORD *)&self->_session == __PAIR128__((unint64_t)a4, (unint64_t)a3))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11[2](v11, 0LL);
      -[PBSessionRequester _failWithErrorDomain:errorCode:userInfo:]( (uint64_t)self,  (void *)*MEMORY[0x189607740],  -1011LL,  0LL);
      -[PBSessionRequester _cancelNoNotify]((id *)&self->super.isa);
      *(_WORD *)&self->_flags &= 0xFFF9u;
      goto LABEL_4;
    }

    [v23 allHeaderFields];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBSessionRequester setHttpResponseHeaders:](self, "setHttpResponseHeaders:", v13);

    int64_t v14 = [v23 statusCode];
    int64_t v15 = v14;
    if ((unint64_t)(v14 - 400) <= 0xFFFFFFFFFFFFFED3LL)
    {
      v11[2](v11, 0LL);
      __int16 v16 = (FILE *)*MEMORY[0x1895F89D0];
      [v23 URL];
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
      id v18 = [v17 absoluteString];
      fprintf( v16,  "%s:%d server (%s) returned error: %zd\n",  "/Library/Caches/com.apple.xbs/Sources/ProtocolBuffer/Runtime/PBSessionRequester.m",  795,  (const char *)[v18 UTF8String],  objc_msgSend(v23, "statusCode"));

      id v19 = objc_alloc(MEMORY[0x189603F68]);
      [MEMORY[0x189607968] numberWithInteger:v15];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v19, "initWithObjectsAndKeys:", v20, @"PBHTTPStatusCode", 0);

      -[PBSessionRequester _failWithErrorDomain:errorCode:userInfo:]( (uint64_t)self,  (void *)*MEMORY[0x189607740],  -1011LL,  v21);
      -[PBSessionRequester _cancelNoNotify]((id *)&self->super.isa);
      *(_WORD *)&self->_flags &= 0xFFF9u;

      goto LABEL_4;
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
      self->_responseStatusCode = v14;
      *(_WORD *)&self->___int16 flags = flags | 8;
    }

    v12 = (void (*)(void))v11[2];
  }

  else
  {
    v12 = (void (*)(void))*((void *)v10 + 2);
  }

  v12();
LABEL_4:
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v19 = (NSURLSession *)a3;
  id v8 = (NSURLSessionTask *)a4;
  id v9 = a5;
  if (self && (*(_WORD *)&self->_flags & 4) != 0)
  {
    -[PBSessionRequester cancel](self, "cancel");
  }

  else if (self->_session == v19 && self->_currentTask == v8 && (*(_WORD *)&self->_flags & 1) == 0)
  {
    id v10 = (void *)MEMORY[0x186E22E88]();
    int v11 = [(id)objc_opt_class() usesEncodedMessages];
    data = self->_data;
    if (v11)
    {
      if (data)
      {
        -[NSMutableData appendData:](data, "appendData:", v9);
      }

      else
      {
        v13 = (NSMutableData *)[v9 mutableCopy];
        int64_t v14 = self->_data;
        self->_data = v13;
      }
    }

    else
    {
      if (data)
      {
        -[NSMutableData appendData:](data, "appendData:", v9);
        -[PBDataReader updateData:](self->_dataReader, "updateData:", self->_data);
      }

      else
      {
        int64_t v15 = (NSMutableData *)[v9 mutableCopy];
        __int16 v16 = self->_data;
        self->_data = v15;

        __int16 v17 = -[PBDataReader initWithData:](objc_alloc(&OBJC_CLASS___PBDataReader), "initWithData:", self->_data);
        dataReader = self->_dataReader;
        self->_dataReader = v17;
      }

      if ((*(_WORD *)&self->_flags & 0x10) == 0)
      {
        -[PBDataReader seekToOffset:](self->_dataReader, "seekToOffset:", self->_lastGoodDataOffset);
        if (-[PBSessionRequester readResponsePreamble:](self, "readResponsePreamble:", self->_dataReader))
        {
          if (!-[PBDataReader hasError](self->_dataReader, "hasError"))
          {
            self->_lastGoodDataOffset = -[PBDataReader offset](self->_dataReader, "offset");
            *(_WORD *)&self->_flags |= 0x10u;
          }
        }
      }

      if ((*(_WORD *)&self->_flags & 0x10) != 0)
      {
      }
    }

    objc_autoreleasePoolPop(v10);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = (NSURLSession *)a3;
  id v9 = (NSURLSessionTask *)a4;
  id v10 = a5;
  int v11 = v10;
  if (self && (*(_WORD *)&self->_flags & 4) != 0)
  {
    -[PBSessionRequester cancel](self, "cancel");
  }

  else if (self->_session == v8 && self->_currentTask == v9 && (*(_WORD *)&self->_flags & 1) == 0)
  {
    if (v10)
    {
      -[PBSessionRequester _failWithError:]((uint64_t)self, v10);
LABEL_28:
      -[PBSessionRequester _cleanup]((uint64_t)self);
      goto LABEL_9;
    }

    self->_downloadPayloadSize = -[NSMutableData length](self->_data, "length");
    self->_timeResponseReceived = mach_absolute_time();
    if ([(id)objc_opt_class() usesEncodedMessages])
    {
      v12 = (void *)MEMORY[0x186E22E88]();
      v13 = -[PBSessionRequester decodeResponseData:](self, "decodeResponseData:", self->_data);
      if (v13)
      {
        -[PBSessionRequester logResponseToFile](self, "logResponseToFile");
        int64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[PBSessionRequester logResponseToFile](self, "logResponseToFile");
          int64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 writeToFile:v15 atomically:0];
        }

        __int16 v16 = -[PBDataReader initWithData:](objc_alloc(&OBJC_CLASS___PBDataReader), "initWithData:", v13);
        dataReader = self->_dataReader;
        self->_dataReader = v16;

        if (!-[PBSessionRequester readResponsePreamble:](self, "readResponsePreamble:", self->_dataReader)) {
          goto LABEL_19;
        }
        if (-[PBDataReader hasError](self->_dataReader, "hasError")) {
          goto LABEL_19;
        }
        *(_WORD *)&self->_flags |= 0x10u;
        self->_lastGoodDataOffset = -[PBDataReader offset](self->_dataReader, "offset");
        if (!self->_didNotifyRequestCompleted)
        {
LABEL_19:

          objc_autoreleasePoolPop(v12);
LABEL_22:
          if ((*(_WORD *)&self->_flags & 0x10) != 0
            && (uint64_t v21 = -[NSMutableArray count](self->_responses, "count"),
                v21 == -[NSMutableArray count](self->_requests, "count")))
          {
            v22 = -[PBSessionRequester logResponseToFile](self, "logResponseToFile");
            if (v22)
            {
              uint64_t v23 = -[NSMutableArray count](self->_responses, "count");
              responses = self->_responses;
              if (v23 == 1)
              {
                v25 = -[NSMutableArray objectAtIndex:](responses, "objectAtIndex:", 0LL);
                v26 = -[PBSessionRequester logResponseToFile](self, "logResponseToFile");
                [v26 stringByAppendingString:@".txt"];
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                [v25 formattedText];
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                [v28 writeToFile:v27 atomically:0 encoding:4 error:0];
              }

              else if (-[NSMutableArray count](responses, "count"))
              {
                unint64_t v29 = 0LL;
                do
                {
                  v30 = -[NSMutableArray objectAtIndex:](self->_responses, "objectAtIndex:", v29);
                  v31 = -[PBSessionRequester logResponseToFile](self, "logResponseToFile");
                  objc_msgSend(v31, "stringByAppendingFormat:", @".part_%d.txt", v29);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();

                  [v30 formattedText];
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  [v33 writeToFile:v32 atomically:0 encoding:4 error:0];

                  ++v29;
                }

                while (v29 < -[NSMutableArray count](self->_responses, "count"));
              }
            }

            -[PBDataReader data](self->_dataReader, "data");

            if (!self->_didNotifyRequestCompleted)
            {
              self->_didNotifyRequestCompleted = 1;
              if ((*(_WORD *)&self->_flags & 0x40) != 0)
              {
                v37[0] = MEMORY[0x1895F87A8];
                v37[1] = 3221225472LL;
                v37[2] = __59__PBSessionRequester_URLSession_task_didCompleteWithError___block_invoke;
                v37[3] = &unk_189D32498;
                v37[4] = self;
                -[NSOperationQueue addOperationWithBlock:](self->_delegateQueue, "addOperationWithBlock:", v37);
              }
              v34 = -[NSURLSessionTask _nw_activity](self->_currentTask, "_nw_activity");
              if (v34)
              {
                if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( &dword_183BC1000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "pbSessionRequester, activity, success",  buf,  2u);
                }
                v35 = -[NSURLSessionTask _nw_activity](self->_currentTask, "_nw_activity");
                nw_activity_complete_with_reason();
              }
            }
          }

          else
          {
            -[PBSessionRequester _failWithErrorDomain:errorCode:userInfo:]( (uint64_t)self,  @"PBRequesterErrorDomain",  6001LL,  0LL);
          }

          goto LABEL_28;
        }
      }

      else
      {
        -[PBSessionRequester cancelWithErrorCode:description:]((uint64_t)self, 6003LL, @"Decryption failed.");
      }

      -[PBSessionRequester _cleanup]((uint64_t)self);

      objc_autoreleasePoolPop(v12);
      goto LABEL_9;
    }

    -[PBSessionRequester logResponseToFile](self, "logResponseToFile");
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      data = self->_data;
      v20 = -[PBSessionRequester logResponseToFile](self, "logResponseToFile");
      -[NSMutableData writeToFile:atomically:](data, "writeToFile:atomically:", v20, 0LL);
    }

    goto LABEL_22;
  }

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void))a6;
  if (self && (*(_WORD *)&self->_flags & 4) != 0)
  {
    -[PBSessionRequester cancel](self, "cancel");
    v13[2](v13, 0LL);
  }

  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v14 = v12;
  id v27 = v14;
  -[PBSessionRequester delegate](self, "delegate");
  int64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  char v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[PBSessionRequester delegate](self, "delegate");
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __97__PBSessionRequester_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke;
    v18[3] = &unk_189D32560;
    v18[4] = self;
    v20 = v13;
    id v19 = v14;
    uint64_t v21 = &v22;
    [v17 requesterWillSendRequestForEstablishedConnection:self callback:v18];
  }

  else
  {
    v13[2](v13, v23[5]);
  }

  _Block_object_dispose(&v22, 8);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v14 = (void (**)(id, void, void *))a5;
  id v7 = (void *)*MEMORY[0x189607728];
  [a4 protectionSpace];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 authenticationMethod];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v9)
  {
    NSUInteger v10 = -[NSArray count](self->_clientCertificates, "count");

    if (v10)
    {
      -[NSArray objectAtIndexedSubscript:](self->_clientCertificates, "objectAtIndexedSubscript:", 0LL);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSArray subarrayWithRange:]( self->_clientCertificates,  "subarrayWithRange:",  1LL,  -[NSArray count](self->_clientCertificates, "count") - 1);
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607A60] credentialWithIdentity:v11 certificates:v12 persistence:1];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, 0LL, v13);

      goto LABEL_6;
    }
  }

  else
  {
  }

  v14[2](v14, 1LL, 0LL);
LABEL_6:
}

- (unint64_t)requestResponseTime
{
  if (requestResponseTime_onceToken != -1) {
    dispatch_once(&requestResponseTime_onceToken, &__block_literal_global_436);
  }
  return (self->_timeResponseReceived - self->_timeRequestSent)
       * requestResponseTime_sTimebaseInfo
       / (1000000
        * (unint64_t)*(unsigned int *)algn_18C662E34);
}

- (void)encodeRequestData:(id)a3 startRequestCallback:(id)a4
{
}

- (id)decodeResponseData:(id)a3
{
  return a3;
}

- (id)newMutableURLRequestWithURL:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newSessionWithDelegate:(id)a3 delegateQueue:(id)a4
{
  return (id)-[PBSessionRequester _newSessionWithDelegate:delegateQueue:connectionProperties:]( (uint64_t)self,  a3,  a4,  0LL);
}

- (id)newSessionWithDelegate:(id)a3 delegateQueue:(id)a4 connectionProperties:(id)a5
{
  return (id)-[PBSessionRequester _newSessionWithDelegate:delegateQueue:connectionProperties:]( (uint64_t)self,  a3,  a4,  a5);
}

- (id)newSessionTaskOnSession:(id)a3 withURLRequest:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)startWithConnectionProperties:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (PBSessionRequesterDelegate)delegate
{
  return (PBSessionRequesterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSURLSessionTask)currentTask
{
  return self->_currentTask;
}

- (void)setCurrentTask:(id)a3
{
}

- (NSDictionary)httpResponseHeaders
{
  return self->_httpResponseHeaders;
}

- (void)setHttpResponseHeaders:(id)a3
{
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (NSString)logRequestToFile
{
  return self->_logRequestToFile;
}

- (void)setLogRequestToFile:(id)a3
{
}

- (NSString)logResponseToFile
{
  return self->_logResponseToFile;
}

- (void)setLogResponseToFile:(id)a3
{
}

- (unint64_t)uploadPayloadSize
{
  return self->_uploadPayloadSize;
}

- (unint64_t)downloadPayloadSize
{
  return self->_downloadPayloadSize;
}

- (NSArray)clientCertificates
{
  return self->_clientCertificates;
}

- (void)setClientCertificates:(id)a3
{
}

- (BOOL)shouldHandleCookies
{
  return self->_shouldHandleCookies;
}

- (void)setShouldHandleCookies:(BOOL)a3
{
  self->_shouldHandleCookies = a3;
}

- (NSString)apsRelayTopic
{
  return self->_apsRelayTopic;
}

- (void)setApsRelayTopic:(id)a3
{
}

- (unint64_t)nwActivityDomain
{
  return self->_nwActivityDomain;
}

- (void)setNwActivityDomain:(unint64_t)a3
{
  self->_nwActivityDomain = a3;
}

- (unint64_t)nwActivityLabel
{
  return self->_nwActivityLabel;
}

- (void)setNwActivityLabel:(unint64_t)a3
{
  self->_nwActivityLabel = a3;
}

- (void).cxx_destruct
{
}

- (void)_start
{
  if (a1)
  {
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __28__PBSessionRequester__start__block_invoke;
    v3[3] = &unk_189D324C0;
    v3[4] = a1;
    v2 = (void *)MEMORY[0x186E22FD8](v3);
    -[PBSessionRequester _serializePayload:](a1, v2);
  }

void __28__PBSessionRequester__start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(unsigned __int8 **)(a1 + 32);
  if (a3)
  {
    -[PBSessionRequester _failWithError:](*(void *)(a1 + 32), a3);
    return;
  }

  id v5 = a2;
  if (v3)
  {
    char v6 = (void *)*((void *)v3 + 5);
    if (v6)
    {
      [v6 cancel];
      id v7 = (void *)*((void *)v3 + 5);
      *((void *)v3 + 5) = 0LL;
    }

    id v8 = (void *)*((void *)v3 + 4);
    if (v8)
    {
      [v8 invalidateAndCancel];
      id v9 = (void *)*((void *)v3 + 4);
      *((void *)v3 + 4) = 0LL;
    }

    NSUInteger v10 = (void *)*((void *)v3 + 7);
    if (v10)
    {
      *((void *)v3 + 7) = 0LL;
    }

    id v11 = (void *)*((void *)v3 + 16);
    if (v11 && (*((_WORD *)v3 + 124) & 0x400) == 0)
    {
      *((void *)v3 + 16) = 0LL;
    }

    id v12 = (void *)*((void *)v3 + 18);
    if (v12)
    {
      *((void *)v3 + 18) = 0LL;
    }

    v13 = (void *)*((void *)v3 + 8);
    if (v13)
    {
      *((void *)v3 + 8) = 0LL;
    }

    *((void *)v3 + 9) = 0LL;
    *((void *)v3 + 10) = 0LL;
    *((_WORD *)v3 + 124) &= ~0x10u;
    id v14 = (void *)MEMORY[0x186E22E88]();
    *((void *)v3 + 10) = [v5 length];
    *((_WORD *)v3 + 124) |= 2u;
    *((void *)v3 + 12) = mach_absolute_time();
    if (*((void *)v3 + 1))
    {
      v42 = v14;
      id v43 = v5;
      int64_t v15 = (void *)objc_msgSend(v3, "newMutableURLRequestWithURL:");
      if ([*((id *)v3 + 25) count]) {
        [v15 setCachePolicy:1];
      }
      double v16 = *((double *)v3 + 21);
      if (v16 == -1.0) {
        double v16 = 60.0;
      }
      [v15 setTimeoutInterval:v16];
      [v15 setHTTPMethod:@"POST"];
      [v15 setHTTPShouldHandleCookies:v3[216]];
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      [v3 httpRequestHeaders];
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 allKeys];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v45;
        do
        {
          for (uint64_t i = 0LL; i != v20; ++i)
          {
            if (*(void *)v45 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v44 + 1) + 8 * i);
            [v3 httpRequestHeaders];
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
            [v24 objectForKeyedSubscript:v23];
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            [v15 setValue:v25 forHTTPHeaderField:v23];
          }

          uint64_t v20 = [v18 countByEnumeratingWithState:&v44 objects:v52 count:16];
        }

        while (v20);
      }

      id v5 = v43;
      [v15 setHTTPBody:v43];
      uint64_t v26 = [v3 newSessionWithDelegate:v3 delegateQueue:*((void *)v3 + 6) connectionProperties:*((void *)v3 + 26)];
      id v27 = (void *)*((void *)v3 + 4);
      *((void *)v3 + 4) = v26;

      uint64_t v28 = [v3 newSessionTaskOnSession:*((void *)v3 + 4) withURLRequest:v15];
      unint64_t v29 = (void *)*((void *)v3 + 5);
      *((void *)v3 + 5) = v28;

      if (*((void *)v3 + 28)) {
        objc_msgSend(*((id *)v3 + 5), "set_APSRelayTopic:");
      }
      if (!*((void *)v3 + 29) || !*((void *)v3 + 30))
      {
        objc_msgSend(*((id *)v3 + 5), "set_nw_activity:", 0);
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_183BC1000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "pbSessionRequester, activity, nil",  buf,  2u);
        }

        goto LABEL_44;
      }

      v30 = (void *)nw_activity_create();
      v31 = (void *)*((void *)v3 + 5);
      if (v30)
      {
        objc_msgSend(v31, "set_nw_activity:", v30);
        nw_activity_activate();
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
        {
          uint64_t v32 = *((void *)v3 + 29);
          uint64_t v33 = *((void *)v3 + 30);
          *(_DWORD *)buf = 67109376;
          int v49 = v32;
          __int16 v50 = 1024;
          int v51 = v33;
          v34 = (os_log_s *)MEMORY[0x1895F8DA0];
          v35 = "pbSessionRequester, activity, activate, %d, %d";
          os_log_type_t v36 = OS_LOG_TYPE_INFO;
LABEL_42:
          _os_log_impl(&dword_183BC1000, v34, v36, v35, buf, 0xEu);
        }
      }

      else
      {
        objc_msgSend(v31, "set_nw_activity:", 0);
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v38 = *((void *)v3 + 29);
          uint64_t v39 = *((void *)v3 + 30);
          *(_DWORD *)buf = 67109376;
          int v49 = v38;
          __int16 v50 = 1024;
          int v51 = v39;
          v34 = (os_log_s *)MEMORY[0x1895F8DA0];
          v35 = "pbSessionRequester, activity, createnil, %d, %d";
          os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_42;
        }
      }

LABEL_44:
      [*((id *)v3 + 5) resume];

      objc_autoreleasePoolPop(v42);
      uint64_t v3 = 0LL;
      char v37 = 1;
      goto LABEL_45;
    }

    [MEMORY[0x189607870] errorWithDomain:@"PBRequesterErrorDomain" code:6004 userInfo:0];
    uint64_t v3 = (unsigned __int8 *)(id)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v14);
  }

  char v37 = 0;
LABEL_45:

  v40 = v3;
  v41 = v40;
  if ((v37 & 1) == 0)
  {
    if (v40) {
      -[PBSessionRequester _failWithError:](*(void *)(a1 + 32), v40);
    }
  }
}

- (void)_serializePayload:(uint64_t)a1
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  uint64_t v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___PBDataWriter);
    [(id)a1 requestPreamble];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5) {
      -[PBDataWriter writeData:](v4, "writeData:", v5);
    }
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id v6 = *(id *)(a1 + 136);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v42;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v42 != v9) {
            objc_enumerationMutation(v6);
          }
          [(id)a1 writeRequest:*(void *)(*((void *)&v41 + 1) + 8 * v10++) into:v4];
        }

        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }

      while (v8);
    }

    id v11 = *(id *)(a1 + 120);
    if ((*(_WORD *)(a1 + 248) & 0x400) != 0)
    {
      uint64_t v12 = [*(id *)(a1 + 128) count];
      uint64_t v13 = objc_msgSend(v11, "subarrayWithRange:", v12, objc_msgSend(*(id *)(a1 + 120), "count") - v12);

      id v11 = (id)v13;
    }

    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        uint64_t v18 = 0LL;
        do
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v14);
          }
          [(id)a1 writeRequest:*(void *)(*((void *)&v37 + 1) + 8 * v18++) into:v4];
        }

        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }

      while (v16);
    }

    [(id)a1 logRequestToFile];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[PBDataWriter immutableData](v4, "immutableData");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [(id)a1 logRequestToFile];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 writeToFile:v21 atomically:0];

      uint64_t v22 = [*(id *)(a1 + 120) count];
      uint64_t v23 = *(void **)(a1 + 120);
      if (v22 == 1)
      {
        [v23 objectAtIndex:0];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        [(id)a1 logRequestToFile];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v25 stringByAppendingString:@".txt"];
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

        id v27 = (void *)NSString;
        [(id)a1 URL];
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 formattedText];
        unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 stringWithFormat:@"URL: %@\n\n%@", v28, v29, (void)v37];
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        [v30 writeToFile:v26 atomically:0 encoding:4 error:0];
      }

      else if ([v23 count])
      {
        unint64_t v31 = 0LL;
        do
        {
          [*(id *)(a1 + 120) objectAtIndex:v31];
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
          [(id)a1 logRequestToFile];
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringByAppendingFormat:", @".part_%d.txt", v31);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          [v32 formattedText];
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          [v35 writeToFile:v34 atomically:0 encoding:4 error:0];

          ++v31;
        }

        while (v31 < [*(id *)(a1 + 120) count]);
      }
    }

    -[PBDataWriter immutableData](v4, "immutableData");

    if ([(id)objc_opt_class() usesEncodedMessages])
    {
      -[PBDataWriter immutableData](v4, "immutableData");
      os_log_type_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      [(id)a1 encodeRequestData:v36 startRequestCallback:v3];
    }

    else
    {
      -[PBDataWriter immutableData](v4, "immutableData");
      os_log_type_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      v3[2](v3, v36, 0LL);
    }
  }
}

- (void)_failWithError:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (a1 && !*(_BYTE *)(a1 + 192))
  {
    *(_BYTE *)(a1 + 192) = 1;
    id v5 = v3;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v5 code];
      [(id)a1 currentTask];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 description];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349314;
      uint64_t v18 = v6;
      __int16 v19 = 2114;
      uint64_t v20 = v8;
      _os_log_impl( &dword_183BC1000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "pbSessionRequester, didFailWithError, %{public}ld, %{public}@",  buf,  0x16u);
    }

    if ((*(_WORD *)(a1 + 248) & 0x100) != 0)
    {
      uint64_t v11 = MEMORY[0x1895F87A8];
      uint64_t v12 = 3221225472LL;
      uint64_t v13 = __37__PBSessionRequester__failWithError___block_invoke;
      id v14 = &unk_189D324E8;
      uint64_t v15 = a1;
      id v16 = v5;
      [*(id *)(a1 + 24) addOperationWithBlock:&v11];
    }

    objc_msgSend(*(id *)(a1 + 40), "_nw_activity", v11, v12, v13, v14, v15);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_183BC1000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "pbSessionRequester, activity, failure",  buf,  2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "_nw_activity");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      nw_activity_complete_with_reason();
    }
  }
}

void __37__PBSessionRequester__failWithError___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 requester:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (uint64_t)_newSessionWithDelegate:(void *)a3 delegateQueue:(void *)a4 connectionProperties:
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v6 = (void *)MEMORY[0x189607AA8];
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  [v6 ephemeralSessionConfiguration];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    [v7 objectForKeyedSubscript:*MEMORY[0x189602148]];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v22 = v8;
      id v12 = v11;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v24;
        uint64_t v16 = *MEMORY[0x189602140];
        do
        {
          for (uint64_t i = 0LL; i != v14; ++i)
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if ([v18 isEqualToString:v16])
            {
              [v12 objectForKeyedSubscript:v18];
              __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "set_sourceApplicationAuditTokenData:", v19);
            }
          }

          uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }

        while (v14);
      }

      id v8 = v22;
    }
  }

  uint64_t v20 = [MEMORY[0x189607AA0] sessionWithConfiguration:v10 delegate:v9 delegateQueue:v8];

  return v20;
}

uint64_t __41__PBSessionRequester_requestResponseTime__block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&requestResponseTime_sTimebaseInfo);
}

void __97__PBSessionRequester_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __97__PBSessionRequester_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_2;
  v6[3] = &unk_189D32560;
  v6[4] = v2;
  id v8 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v9 = v5;
  [v3 addOperationWithBlock:v6];
}

void __97__PBSessionRequester_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_2( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 40) || (*(_WORD *)(v2 + 248) & 4) != 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __97__PBSessionRequester_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_3;
    v6[3] = &unk_189D32538;
    v6[4] = v2;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 56);
    id v7 = v3;
    uint64_t v8 = v4;
    uint64_t v5 = (void *)MEMORY[0x186E22FD8](v6);
    -[PBSessionRequester _serializePayload:](*(void *)(a1 + 32), v5);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

void __97__PBSessionRequester_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v8 = a2;
  if (a3)
  {
    -[PBSessionRequester _failWithError:](*(void *)(a1 + 32), a3);
  }

  else
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 40) mutableCopy];
    [v5 setHTTPBody:v8];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (uint64_t)_cleanup
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void **)(result + 40);
    *(void *)(result + 40) = 0LL;

    [*(id *)(v1 + 32) invalidateAndCancel];
    id v3 = *(void **)(v1 + 32);
    *(void *)(v1 + 32) = 0LL;

    uint64_t v4 = *(void **)(v1 + 56);
    *(void *)(v1 + 56) = 0LL;

    uint64_t v5 = *(void **)(v1 + 64);
    *(void *)(v1 + 64) = 0LL;

    result = [(id)v1 setHttpResponseHeaders:0];
    *(_WORD *)(v1 + 248) &= 0xF9F1u;
  }

  return result;
}

- (void)cancelWithErrorCode:(void *)a3 description:
{
  id v5 = a3;
  if (a1)
  {
    id v7 = v5;
    if ([v5 length])
    {
      [MEMORY[0x189603F68] dictionaryWithObject:v7 forKey:*MEMORY[0x189604F38]];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    -[PBSessionRequester _failWithErrorDomain:errorCode:userInfo:](a1, @"PBRequesterErrorDomain", a2, v6);
    -[PBSessionRequester _cancelNoNotify]((id *)a1);
    *(_WORD *)(a1 + 248) &= 0xFFF9u;

    id v5 = v7;
  }
}

- (uint64_t)_tryParseData
{
  if (!a1) {
    return 0LL;
  }
  if (!*(void *)(a1 + 64)) {
    return 0LL;
  }
  unint64_t v2 = [*(id *)(a1 + 144) count];
  unint64_t v3 = [*(id *)(a1 + 136) count];
  uint64_t v4 = [*(id *)(a1 + 120) count];
  if (v4 == [*(id *)(a1 + 128) count]) {
    return 0LL;
  }
  [*(id *)(a1 + 64) seekToOffset:*(void *)(a1 + 72)];
  uint64_t v6 = 128LL;
  if (v2 >= v3)
  {
    uint64_t v7 = 120LL;
  }

  else
  {
    uint64_t v6 = 144LL;
    uint64_t v7 = 136LL;
  }

  objc_msgSend(*(id *)(a1 + v7), "objectAtIndex:", objc_msgSend(*(id *)(a1 + v6), "count"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (objc_class *)[v8 responseClass];
  if ((-[objc_class isSubclassOfClass:](v9, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    uint64_t v10 = (void *)MEMORY[0x189603F70];
    [NSString stringWithFormat:@"Request (%@) provided an invalid response class (needs to be a subclass of PBCodable): %@", v8, objc_msgSend(v8, "responseClass")];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 exceptionWithName:@"InvalidResponseClass" reason:v11 userInfo:0];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 raise];
  }

  [(id)a1 tryReadResponseData:*(void *)(a1 + 64) forRequest:v8 forResponseClass:v9];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && ([*(id *)(a1 + 64) hasError] & 1) == 0)
  {
    id v14 = objc_alloc_init(v9);
    uint64_t v15 = -[PBDataReader initWithData:](objc_alloc(&OBJC_CLASS___PBDataReader), "initWithData:", v13);
    uint64_t v5 = [v14 readFrom:v15];
    if ((_DWORD)v5)
    {
      if (v2 >= v3)
      {
        __int16 v19 = *(void **)(a1 + 128);
        if (!v19)
        {
          uint64_t v20 = objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  objc_msgSend(*(id *)(a1 + 120), "count"));
          uint64_t v21 = *(void **)(a1 + 128);
          *(void *)(a1 + 128) = v20;

          __int16 v19 = *(void **)(a1 + 128);
        }

        [v19 addObject:v14];
        *(void *)(a1 + 72) = [*(id *)(a1 + 64) offset];
        if ((*(_WORD *)(a1 + 248) & 0x20) != 0)
        {
          v23[0] = MEMORY[0x1895F87A8];
          v23[1] = 3221225472LL;
          v23[2] = __35__PBSessionRequester__tryParseData__block_invoke;
          v23[3] = &unk_189D32510;
          v23[4] = a1;
          id v24 = v14;
          id v25 = v8;
          [*(id *)(a1 + 24) addOperationWithBlock:v23];
        }
      }

      else
      {
        uint64_t v16 = *(void **)(a1 + 144);
        if (!v16)
        {
          uint64_t v17 = objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  objc_msgSend(*(id *)(a1 + 136), "count"));
          uint64_t v18 = *(void **)(a1 + 144);
          *(void *)(a1 + 144) = v17;

          uint64_t v16 = *(void **)(a1 + 144);
        }

        [v16 addObject:v14];
        *(void *)(a1 + 72) = [*(id *)(a1 + 64) offset];
        [(id)a1 handleResponse:v14 forInternalRequest:v8];
      }
    }
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (void)_failWithErrorDomain:(uint64_t)a3 errorCode:(void *)a4 userInfo:
{
  if (a1)
  {
    uint64_t v7 = (objc_class *)MEMORY[0x189607870];
    id v8 = a4;
    id v9 = a2;
    id v10 = (id)[[v7 alloc] initWithDomain:v9 code:a3 userInfo:v8];

    -[PBSessionRequester _failWithError:](a1, v10);
  }

void __59__PBSessionRequester_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 requesterDidFinish:*(void *)(a1 + 32)];
}

void __35__PBSessionRequester__tryParseData__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 requester:*(void *)(a1 + 32) didReceiveResponse:*(void *)(a1 + 40) forRequest:*(void *)(a1 + 48)];
}

- (id)_cancelNoNotify
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    [result[5] cancel];
    -[PBSessionRequester _cleanup](v1);
    if ([*(id *)(v1 + 128) count]) {
      [*(id *)(v1 + 128) removeAllObjects];
    }
    result = *(id **)(v1 + 144);
    if (result) {
      return (id *)[result removeAllObjects];
    }
  }

  return result;
}

uint64_t __28__PBSessionRequester_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void __28__PBSessionRequester_cancel__block_invoke_2(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 requesterDidCancel:*(void *)(a1 + 32)];
}

void __37__PBSessionRequester_requestPreamble__block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    [MEMORY[0x1896077F8] mainBundle];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [v2 bundleIdentifier];
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  uint64_t v4 = (void *)requestPreamble_applicationID;
  requestPreamble_applicationID = v3;

  if (*(void *)(a1 + 32))
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
    [v5 objectForKey:@"ProductVersion"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKey:@"ProductBuildVersion"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [NSString stringWithFormat:@"%@.%@", v6, v7];
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  id v9 = (void *)requestPreamble_osVersion;
  requestPreamble_osVersion = v8;
}

+ (BOOL)usesEncodedMessages
{
  return 0;
}

@end