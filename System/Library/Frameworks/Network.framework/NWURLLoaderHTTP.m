@interface NWURLLoaderHTTP
- (BOOL)allowsWrite;
- (BOOL)requestComplete;
- (NSString)multipartMixedReplaceBoundary;
- (NWConcrete_nw_connection)underlyingConnection;
- (OS_nw_http_fields)trailerFields;
- (OS_sec_trust)peerTrust;
- (id)errorForErrorCode:(id *)a1;
- (id)errorForNWError:(id *)a1;
- (id)initWithRequest:(unint64_t)a3 bodyKnownSize:(void *)a4 configuration:(void *)a5 queue:(void *)a6 client:;
- (id)responseFromMetadata:(uint64_t)a1;
- (id)takeCachedResponse;
- (uint64_t)pendingErrorIsRetryable;
- (void)addProgressObserverForResponseStallTimer;
- (void)cancelConnection;
- (void)configureAndStartConnection:(uint64_t)a1;
- (void)continueLoading;
- (void)finishRequest:(uint64_t)a1;
- (void)handleAuthenticationChallenge:(void *)a3 url:(uint64_t)a4 cancel:(void *)a5 completionHandler:;
- (void)handleAuthenticationChallengeResponse:(void *)a3 credential:(void *)a4 challenge:(void *)a5 response:(void *)a6 completionHandler:;
- (void)needRequestBody;
- (void)notifyRequestCompletion:(id)a3;
- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5;
- (void)readResponse;
- (void)readResponse:(id)a3;
- (void)restartStallTimer:(id)a3;
- (void)setConnection:(uint64_t)a1;
- (void)setPendingError:(uint64_t)a1;
- (void)setRequestBodyProvider:(uint64_t)a1;
- (void)start:(id)a3;
- (void)startResponseStallTimer;
- (void)stop;
- (void)stopResponseStallTimer;
- (void)updateClient:(id)a3;
- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5;
- (void)writeRequestBody;
@end

@implementation NWURLLoaderHTTP

- (void)start:(id)a3
{
  v4 = (void (**)(void))a3;
  if (bumpProcessFDLimit_onceToken == -1)
  {
    if (self)
    {
LABEL_3:
      client = self->_client;
      goto LABEL_4;
    }
  }

  else
  {
    dispatch_once(&bumpProcessFDLimit_onceToken, &__block_literal_global_196_72089);
    if (self) {
      goto LABEL_3;
    }
  }

  client = 0LL;
LABEL_4:
  v6 = -[NWURLLoaderClient loaderDataTask](client, "loaderDataTask");
  if (v6)
  {
    if (self)
    {
      v7 = self->_cache;
      v8 = self->_request;
      v9 = self->_configuration;
      v10 = v9;
      if (v9) {
        BOOL v11 = -[NWURLSessionTask _preconnect](v9->_task, "_preconnect");
      }
      else {
        BOOL v11 = 0;
      }
      v12 = self->_configuration;
      p_isa = (id *)&v12->super.isa;
      if (v12)
      {
        else {
          uint64_t v14 = [p_isa[2] requestCachePolicy];
        }
        uint64_t v15 = v14;
      }

      else
      {
        uint64_t v15 = 0LL;
      }

      v16 = v8;
      v17 = v16;
      if (v7 && v7->_cache)
      {
        v18 = -[NSURLRequest HTTPMethod](v16, "HTTPMethod");
        uint64_t v19 = [v18 caseInsensitiveCompare:@"GET"];

        BOOL v20 = 0;
        if (!v19)
        {
          uint64_t v21 = v11 ? 1LL : v15;
          if (v21 != 1 && v21 != 4)
          {
            v22 = -[NSURLRequest valueForHTTPHeaderField:](v17, "valueForHTTPHeaderField:", @"Range");
            BOOL v20 = v22 == 0LL;
          }
        }
      }

      else
      {
        BOOL v20 = 0;
      }

      self->_allowCaching = v20;
    }

    else
    {
      p_isa = 0LL;
      v10 = 0LL;
      v7 = 0LL;
      v17 = 0LL;
    }

    uint64_t v23 = MEMORY[0x1895F87A8];
    aBlock[0] = MEMORY[0x1895F87A8];
    aBlock[1] = 3221225472LL;
    aBlock[2] = __25__NWURLLoaderHTTP_start___block_invoke;
    aBlock[3] = &unk_189BC5B48;
    aBlock[4] = self;
    v24 = _Block_copy(aBlock);
    v25 = v24;
    if (self && self->_allowCaching)
    {
      v26 = self->_client;
      v27 = -[NWURLLoaderClient loaderDataTask](v26, "loaderDataTask");
      v28 = self->_client;
      v30[0] = v23;
      v30[1] = 3221225472LL;
      v30[2] = __25__NWURLLoaderHTTP_start___block_invoke_2;
      v30[3] = &unk_189BC5B98;
      v30[4] = self;
      id v31 = v27;
      v32 = v4;
      id v33 = v25;
      id v29 = v27;
      -[NWURLLoaderClient loaderRunDelegateBlock:](v28, "loaderRunDelegateBlock:", v30);
    }

    else
    {
      (*((void (**)(void *, void))v24 + 2))(v24, 0LL);
      v4[2](v4);
    }
  }

  else
  {
    -[NWURLLoaderHTTP continueLoading]((uint64_t)self);
    v4[2](v4);
  }
}

- (void)stop
{
  if (self)
  {
    connection = self->_connection;
    self->_connection = 0LL;

    -[NWURLSessionRequestBodyProvider close](self->_requestBodyProvider, "close");
    requestBodyProvider = self->_requestBodyProvider;
    self->_requestBodyProvider = 0LL;

    client = self->_client;
    self->_client = 0LL;

    configuration = self->_configuration;
    self->_configuration = 0LL;

    pendingError = self->_pendingError;
    self->_pendingError = 0LL;

    v17 = (void (**)(id, void, NWURLError *))self->_responseCompletionHandler;
    objc_setProperty_nonatomic_copy(self, v8, 0LL, 128LL);
    if (v17)
    {
      v9 = objc_alloc(&OBJC_CLASS___NWURLError);
      v10 = -[NWURLLoaderClient loaderTask](self->_client, "loaderTask");
      BOOL v11 = self;
      id v12 = v10;
      if (v9)
      {
        uint64_t v13 = *MEMORY[0x189607740];
        v18.receiver = v9;
        v18.super_class = (Class)&OBJC_CLASS___NWURLError;
        uint64_t v14 = -[NWURLLoaderHTTP initWithDomain:code:userInfo:]( &v18,  sel_initWithDomain_code_userInfo_,  v13,  -999LL,  0LL);
        v9 = (NWURLError *)v14;
        if (v14) {
          -[NWURLLoaderHTTP fillErrorForLoader:andTask:](v14, "fillErrorForLoader:andTask:", v11, v12);
        }
      }

      v17[2](v17, 0LL, v9);
    }

    uint64_t v15 = (void (**)(void))self->_requestCompletionHandler;
    objc_setProperty_nonatomic_copy(self, v16, 0LL, 136LL);
    if (v15)
    {
      v15[2](v15);
    }
  }

  else
  {
    [0 close];
  }

- (void)updateClient:(id)a3
{
  id v5 = a3;
  if (self) {
    objc_storeStrong((id *)&self->_client, a3);
  }
}

- (void)readResponse:(id)a3
{
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, a2, a3, 128LL);
    -[NWURLLoaderHTTP readResponse]((uint64_t)self);
  }

- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  unsigned int v5 = a4;
  unsigned int v6 = a3;
  id v8 = a5;
  v9 = (void (**)(void, void, void, void))v8;
  if (!self)
  {
    connection = 0LL;
    goto LABEL_6;
  }

  if (!self->_pendingCompletion)
  {
    connection = self->_connection;
LABEL_6:
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __85__NWURLLoaderHTTP_readDataOfMinimumIncompleteLength_maximumLength_completionHandler___block_invoke;
    v14[3] = &unk_189BC5F58;
    v14[4] = self;
    id v15 = v8;
    nw_connection_receive_internal(connection, 0LL, v6, v5, v14);

    goto LABEL_8;
  }

  if (self->_loadingFromCache)
  {
    v10 = self->_cachedResponseFound;
    -[NSCachedURLResponse data](v10, "data");
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = (void *)[v11 _createDispatchData];
    ((void (**)(void, void *, uint64_t, void))v9)[2](v9, v12, 1LL, 0LL);
  }

  else
  {
    (*((void (**)(id, void, uint64_t, void))v8 + 2))(v8, 0LL, 1LL, 0LL);
  }

- (NSString)multipartMixedReplaceBoundary
{
  if (self) {
    self = (NWURLLoaderHTTP *)self->_multipartBoundary;
  }
  return (NSString *)self;
}

- (OS_sec_trust)peerTrust
{
  if (self) {
    self = (NWURLLoaderHTTP *)self->_peerTrustInternal;
  }
  return (OS_sec_trust *)self;
}

- (BOOL)requestComplete
{
  if (self) {
    LOBYTE(self) = self->_requestCompleteInternal;
  }
  return (char)self;
}

- (void)notifyRequestCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (self)
  {
    id newValue = v4;
    if (self->_requestCompleteInternal) {
      (*((void (**)(id))v4 + 2))(v4);
    }
    else {
      objc_setProperty_nonatomic_copy(self, (SEL)v4, v4, 136LL);
    }
    unsigned int v5 = newValue;
  }
}

- (id)takeCachedResponse
{
  if (self)
  {
    v3 = self->_cachedResponseToStore;
    cachedResponseToStore = self->_cachedResponseToStore;
    self->_cachedResponseToStore = 0LL;
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

- (OS_nw_http_fields)trailerFields
{
  if (self) {
    self = (NWURLLoaderHTTP *)self->_trailerFieldsInternal;
  }
  return (OS_nw_http_fields *)self;
}

- (BOOL)allowsWrite
{
  return 0;
}

- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5
{
}

- (NWConcrete_nw_connection)underlyingConnection
{
  if (self) {
    self = (NWURLLoaderHTTP *)self->_connection;
  }
  return (NWConcrete_nw_connection *)self;
}

- (void)restartStallTimer:(id)a3
{
  if (self)
  {
    responseStallTimer = (dispatch_source_t *)self->_responseStallTimer;
    if (responseStallTimer)
    {
      dispatch_time_t v4 = dispatch_time(0x8000000000000000LL, 3000000000LL);
      if (*responseStallTimer)
      {
        dispatch_source_set_timer(*responseStallTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      }

      else
      {
        responseStallTimer[4] = (dispatch_source_t)v4;
        responseStallTimer[5] = (dispatch_source_t)-1LL;
        if (*((_BYTE *)responseStallTimer + 48))
        {
          if (*((_BYTE *)responseStallTimer + 49)) {
            nw_queue_source_run_timer((uint64_t)responseStallTimer, v4);
          }
        }
      }
    }
  }

- (void).cxx_destruct
{
}

void __85__NWURLLoaderHTTP_readDataOfMinimumIncompleteLength_maximumLength_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3,  uint64_t a4,  void *a5)
{
  uint64_t v117 = *MEMORY[0x1895F89C0];
  v9 = a2;
  context = a3;
  id v10 = a5;
  if (gLogDatapath)
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
    }
    v40 = (os_log_s *)(id)gurlLogObj;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v41 = *(void *)(a1 + 32);
      if (v41 && (id v42 = *(id *)(v41 + 48)) != 0LL)
      {
        v43 = v42;
        [v42 logDescription];
      }

      else
      {
        v43 = 0LL;
        v108[0] = 0LL;
        v108[1] = 0LL;
        int v109 = 0;
      }

      uint64_t v47 = *(void *)(a1 + 32);
      if (v47 && (id v48 = *(id *)(v47 + 48)) != 0LL)
      {
        v49 = v48;
        [v48 logDescription];
        int v50 = v107;
      }

      else
      {
        int v50 = 0;
        v49 = 0LL;
        uint64_t v105 = 0LL;
        uint64_t v106 = 0LL;
        int v107 = 0;
      }

      if (v9) {
        size_t size = dispatch_data_get_size(v9);
      }
      else {
        size_t size = 0LL;
      }
      *(_DWORD *)buf = 136447746;
      *(void *)&buf[4] = "-[NWURLLoaderHTTP readDataOfMinimumIncompleteLength:maximumLength:completionHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2098;
      *(void *)&buf[20] = v108;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v50;
      *(_WORD *)&buf[34] = 2048;
      *(void *)&buf[36] = size;
      __int16 v111 = 1024;
      int v112 = a4;
      __int16 v113 = 2112;
      id v114 = v10;
      _os_log_impl( &dword_181A5C000,  v40,  OS_LOG_TYPE_DEBUG,  "%{public}s Task <%{public,uuid_t}.16P>.<%u> received body: %zu, complete: %{BOOL}d, error: %@",  buf,  0x3Cu);
    }
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11 && *(void *)(v11 + 144))
  {
    if (HTTPNotificationCenter_onceToken != -1) {
      dispatch_once(&HTTPNotificationCenter_onceToken, &__block_literal_global_197);
    }
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      uint64_t v13 = *(void *)(v12 + 144);
    }
    else {
      uint64_t v13 = 0LL;
    }
    id v14 = (id)HTTPNotificationCenter_center;
    [v14 postNotificationName:@"NWURLLoaderHTTPConnectionProgressNotification" object:v13];
  }

  if (v10)
  {
    -[NWURLLoaderHTTP errorForNWError:](*(id **)(a1 + 32), v10);
    id v101 = (id)objc_claimAutoreleasedReturnValue();
    if (!v101) {
      goto LABEL_13;
    }
    uint64_t v44 = *(void *)(a1 + 32);
    if (v44)
    {
      if (*(void *)(v44 + 88)) {
        goto LABEL_14;
      }
      id v45 = v101;
      v46 = *(void **)(v44 + 88);
      id v101 = v45;
      *(void *)(v44 + 88) = v45;
      goto LABEL_43;
    }

    uint64_t v16 = 0LL;
  }

  else
  {
    if (!(_DWORD)a4)
    {
LABEL_13:
      id v101 = 0LL;
LABEL_14:
      uint64_t v16 = *(void *)(a1 + 32);
      goto LABEL_15;
    }

    uint64_t v15 = *(void *)(a1 + 32);
    if (v15)
    {
      if (!*(_BYTE *)(v15 + 8)) {
        goto LABEL_13;
      }
      id v101 = 0LL;
      v46 = *(void **)(v15 + 88);
      *(void *)(v15 + 88) = 0LL;
LABEL_43:

      goto LABEL_14;
    }

    uint64_t v16 = 0LL;
    id v101 = 0LL;
  }

- (void)setPendingError:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (id)errorForNWError:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    dispatch_time_t v4 = objc_alloc(&OBJC_CLASS___NWURLError);
    [v2[6] loaderTask];
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (id *)-[NWURLError initWithNWError:forLoader:andTask:](v4, v3, v2, v5);
  }

  return v2;
}

- (void)readResponse
{
  if (a1)
  {
    v2 = *(void **)(a1 + 128);
    if (v2)
    {
      if (*(_BYTE *)(a1 + 11))
      {
        id v12 = v2;
        objc_setProperty_nonatomic_copy((id)a1, v3, 0LL, 128LL);
        (*((void (**)(id, void, void))v12 + 2))(v12, 0LL, *(void *)(a1 + 88));
LABEL_5:

        return;
      }

      if (*(_BYTE *)(a1 + 14) && !*(_BYTE *)(a1 + 15))
      {
        id v12 = v2;
        objc_setProperty_nonatomic_copy((id)a1, v7, 0LL, 128LL);
        *(_BYTE *)(a1 + 11) = 1;
        *(_BYTE *)(a1 + 16) = 1;
        id v8 = (void (**)(void))*(id *)(a1 + 136);
        objc_setProperty_nonatomic_copy((id)a1, v9, 0LL, 136LL);
        if (v8) {
          v8[2](v8);
        }

        id v10 = *(id *)(a1 + 104);
        [v10 response];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, void))v12 + 2))(v12, v11, 0LL);

        goto LABEL_5;
      }

      id v4 = *(id *)(a1 + 72);
      unsigned int v5 = *(void **)(a1 + 72);
      v13[0] = MEMORY[0x1895F87A8];
      v13[1] = 3221225472LL;
      v13[2] = __31__NWURLLoaderHTTP_readResponse__block_invoke;
      v13[3] = &unk_189BC5F30;
      id v14 = v4;
      uint64_t v15 = a1;
      id v6 = v4;
      nw_connection_receive_internal(v5, 0LL, 0, 0, v13);
    }
  }

void __31__NWURLLoaderHTTP_readResponse__block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  uint64_t v147 = *MEMORY[0x1895F89C0];
  id v125 = a2;
  SEL v9 = a3;
  id v10 = a5;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  if (!v11)
  {
    if (v12) {
      goto LABEL_72;
    }
    goto LABEL_164;
  }

  if (v12 == *(void *)(v11 + 72))
  {
    uint64_t v13 = *(void **)(v11 + 128);
    if (v13)
    {
      id newValue = v13;
      uint64_t v15 = *(void **)(a1 + 40);
      if (v15)
      {
        objc_setProperty_nonatomic_copy(v15, v14, 0LL, 128LL);
        uint64_t v16 = *(void *)(a1 + 40);
        if (v16)
        {
          *(_BYTE *)(v16 + 10) = 1;
          uint64_t v15 = *(void **)(a1 + 40);
        }

        else
        {
          uint64_t v15 = 0LL;
        }
      }

      -[NWURLLoaderHTTP stopResponseStallTimer]((uint64_t)v15, (uint64_t)v14);
      uint64_t v17 = *(void *)(a1 + 40);
      if (v17 && *(void *)(v17 + 144))
      {
        if (HTTPNotificationCenter_onceToken != -1) {
          dispatch_once(&HTTPNotificationCenter_onceToken, &__block_literal_global_197);
        }
        uint64_t v18 = *(void *)(a1 + 40);
        if (v18) {
          uint64_t v19 = *(void *)(v18 + 144);
        }
        else {
          uint64_t v19 = 0LL;
        }
        id v20 = (id)HTTPNotificationCenter_center;
        [v20 postNotificationName:@"NWURLLoaderHTTPConnectionProgressNotification" object:v19];
      }

      v126 = v10;
      if (!v10 && a4 && (uint64_t v21 = *(void *)(a1 + 40)) != 0 && *(_BYTE *)(v21 + 8))
      {
        objc_storeStrong((id *)(v21 + 88), 0LL);
        id v10 = 0LL;
        if (v9)
        {
LABEL_19:
          if (nw_protocol_copy_http_definition_onceToken != -1) {
            dispatch_once(&nw_protocol_copy_http_definition_onceToken, &__block_literal_global_11_72879);
          }
          v22 = (nw_protocol_definition *)(id)nw_protocol_copy_http_definition_http_definition;
          nw_protocol_metadata_t v23 = nw_content_context_copy_protocol_metadata(v9, v22);

          nw_protocol_metadata_t v124 = v23;
          v24 = -[NWURLLoaderHTTP responseFromMetadata:](*(void *)(a1 + 40), v23);
          if (gLogDatapath)
          {
            if (__nwlog_url_log::onceToken != -1) {
              dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
            }
            v81 = (os_log_s *)(id)gurlLogObj;
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v82 = *(void *)(a1 + 40);
              if (v82 && (id v83 = *(id *)(v82 + 48)) != 0LL)
              {
                id v84 = v83;
                [v83 logDescription];
              }

              else
              {
                id v84 = 0LL;
                v133[0] = 0LL;
                v133[1] = 0LL;
                int v134 = 0;
              }

              uint64_t v105 = *(void *)(a1 + 40);
              if (v105 && (id v106 = *(id *)(v105 + 48)) != 0LL)
              {
                int v107 = v106;
                [v106 logDescription];
                int v108 = v132;
              }

              else
              {
                int v108 = 0;
                int v107 = 0LL;
                uint64_t v130 = 0LL;
                uint64_t v131 = 0LL;
                int v132 = 0;
              }

              *(_DWORD *)v135 = 136447746;
              *(void *)&v135[4] = "-[NWURLLoaderHTTP readResponse]_block_invoke";
              *(_WORD *)&v135[12] = 1042;
              *(_DWORD *)&v135[14] = 16;
              *(_WORD *)&v135[18] = 2098;
              *(void *)&v135[20] = v133;
              *(_WORD *)&v135[28] = 1024;
              *(_DWORD *)&v135[30] = v108;
              *(_WORD *)&v135[34] = 2112;
              *(void *)&v135[36] = v24;
              __int16 v136 = 1024;
              int v137 = a4;
              __int16 v138 = 2112;
              v139 = v126;
              _os_log_impl( &dword_181A5C000,  v81,  OS_LOG_TYPE_DEBUG,  "%{public}s Task <%{public,uuid_t}.16P>.<%u> received response: %@, complete: %{BOOL}d, error: %@",  v135,  0x3Cu);
            }
          }

          if ((unint64_t)([v24 statusCode] - 100) <= 0x63
            && [v24 statusCode] != 101)
          {
            uint64_t v38 = *(void *)(a1 + 40);
            if (v38) {
              id v39 = *(void **)(v38 + 48);
            }
            else {
              id v39 = 0LL;
            }
            [v39 loaderDidReceiveInformationalResponse:v24];
            uint64_t v41 = *(void **)(a1 + 40);
            if (v41)
            {
              objc_setProperty_nonatomic_copy(v41, v40, newValue, 128LL);
              uint64_t v41 = *(void **)(a1 + 40);
            }

            -[NWURLLoaderHTTP readResponse](v41);
            goto LABEL_70;
          }

          uint64_t v25 = *(void *)(a1 + 40);
          if (v25) {
            v26 = *(void **)(v25 + 48);
          }
          else {
            v26 = 0LL;
          }
          [v26 clientMetadata];
          v27 = (nw_protocol_metadata *)(id)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v27)
          {
            uint64_t v29 = nw_protocol_metadata_copy_definition(v27);
            if (nw_protocol_copy_http_client_definition_onceToken != -1) {
              dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_52);
            }
            BOOL is_equal = nw_protocol_definition_is_equal( v29,  (nw_protocol_definition_t)nw_protocol_copy_http_client_definition_definition);

            if (is_equal)
            {
              *(void *)buf = 0LL;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x2020000000LL;
              uint64_t v146 = 0LL;
              *(void *)v135 = MEMORY[0x1895F87A8];
              *(void *)&v135[8] = 3221225472LL;
              *(void *)&v135[16] = __nw_http_client_metadata_get_sniffed_media_type_block_invoke;
              *(void *)&v135[24] = &unk_189BC60A8;
              *(void *)&v135[32] = buf;
              uint64_t v31 = v28[4];
              if (v31)
              {
                __nw_http_client_metadata_get_sniffed_media_type_block_invoke((uint64_t)v135, v31);
                uint64_t v32 = *(void *)(*(void *)&buf[8] + 24LL);
              }

              else
              {
                uint64_t v32 = 0LL;
              }

              _Block_object_dispose(buf, 8);

              if (!v32)
              {
LABEL_36:
                if (v126)
                {
                  uint64_t v89 = -[NWURLLoaderHTTP errorForNWError:](*(id **)(a1 + 40), v126);
                }

                else
                {
                  if (v24)
                  {
                    BOOL v33 = 0LL;
                    goto LABEL_39;
                  }

                  uint64_t v89 = -[NWURLLoaderHTTP errorForErrorCode:](*(id **)(a1 + 40), -1005LL);
                }

                BOOL v33 = (void *)v89;
                if (v89)
                {
                  uint64_t v92 = *(void *)(a1 + 40);
                  if (v92)
                  {
                    uint64_t v94 = *(void *)(v92 + 88);
                    v93 = (id *)(v92 + 88);
                    if (!v94) {
                      objc_storeStrong(v93, v33);
                    }
                  }
                }

- (void)stopResponseStallTimer
{
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 152);
    if (v3)
    {
      nw_queue_cancel_source(v3, a2);
      *(void *)(a1 + 152) = 0LL;
      if (*(void *)(a1 + 144))
      {
        if (HTTPNotificationCenter_onceToken != -1) {
          dispatch_once(&HTTPNotificationCenter_onceToken, &__block_literal_global_197);
        }
        uint64_t v4 = *(void *)(a1 + 144);
        id v5 = (id)HTTPNotificationCenter_center;
        [v5 removeObserver:a1 name:@"NWURLLoaderHTTPConnectionProgressNotification" object:v4];
      }
    }
  }

- (id)errorForErrorCode:(id *)a1
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = objc_alloc(&OBJC_CLASS___NWURLError);
  [a1[6] loaderTask];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = a1;
  id v7 = v5;
  if (v4)
  {
    uint64_t v8 = *MEMORY[0x189607740];
    v12.receiver = v4;
    v12.super_class = (Class)&OBJC_CLASS___NWURLError;
    id v9 = objc_msgSendSuper2(&v12, sel_initWithDomain_code_userInfo_, v8, a2, 0);
    id v10 = v9;
    if (v9) {
      [v9 fillErrorForLoader:v6 andTask:v7];
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (id)responseFromMetadata:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  BOOL v5 = 0LL;
  if (a1 && v3)
  {
    id v6 = nw_http_metadata_copy_response(v3);
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
      objc_opt_self();
      BOOL v34 = v8;
      if ((nw_http_response_get_status_code(v8) - 200) > 0x63)
      {
        v26 = 0LL;
      }

      else
      {
        uint64_t v36 = 0LL;
        id v37 = &v36;
        uint64_t v38 = 0x3032000000LL;
        id v39 = __Block_byref_object_copy__72075;
        v40 = __Block_byref_object_dispose__72076;
        id v41 = 0LL;
        v35[0] = MEMORY[0x1895F87A8];
        v35[1] = 3221225472LL;
        v35[2] = __61__NWURLLoaderHTTP_multipartMixedReplaceBoundaryFromResponse___block_invoke;
        v35[3] = &unk_189BC6448;
        v35[4] = &v36;
        nw_http_fields_access_value_by_name(v8, (unint64_t)"Content-Type", v35);
        id v9 = (void *)v37[5];
        if (v9)
        {
          [v9 componentsSeparatedByString:@";"];
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 objectAtIndexedSubscript:0];
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x189607810] whitespaceCharacterSet];
          objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 stringByTrimmingCharactersInSet:v12];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          int v14 = [v13 isEqualToString:@"multipart/x-mixed-replace"];
          BOOL v33 = v11;

          if (v14)
          {
            for (unint64_t i = 1; i < [v10 count]; ++i)
            {
              [v10 objectAtIndexedSubscript:i];
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v17 = [v16 rangeOfString:@"="];
              if (v17 != 0x7FFFFFFFFFFFFFFFLL)
              {
                [v16 substringToIndex:v17];
                uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
                [MEMORY[0x189607810] whitespaceCharacterSet];
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
                [v18 stringByTrimmingCharactersInSet:v19];
                id v20 = (void *)objc_claimAutoreleasedReturnValue();

                [v16 substringFromIndex:v17 + 1];
                uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
                [MEMORY[0x189607810] whitespaceCharacterSet];
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                [v21 stringByTrimmingCharactersInSet:v22];
                nw_protocol_metadata_t v23 = (void *)objc_claimAutoreleasedReturnValue();

                if ([v20 isEqualToString:@"boundary"])
                {
                  [MEMORY[0x189607810] whitespaceCharacterSet];
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  [v23 stringByTrimmingCharactersInSet:v24];
                  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = (void *)[v25 mutableCopy];

                  if ((unint64_t)[v26 length] >= 2
                    && [v26 hasPrefix:@"\""]
                    && [v26 hasSuffix:@"\""])
                  {
                    objc_msgSend(v26, "deleteCharactersInRange:", 0, 1);
                    objc_msgSend(v26, "deleteCharactersInRange:", objc_msgSend(v26, "length") - 1, 1);
                  }

                  goto LABEL_21;
                }
              }
            }
          }

          v26 = 0LL;
LABEL_21:
        }

        else
        {
          v26 = 0LL;
        }

        _Block_object_dispose(&v36, 8);
      }

      v27 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = v26;

      int version = nw_http_metadata_get_version(v4);
      id v29 = *(id *)(a1 + 24);
      BOOL v5 = nw_http_response_copy_url_response(v34, 0LL, v29, **((void ***)&unk_189BC9788 + version));

      [*(id *)(a1 + 48) clientMetadata];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      id v31 = nw_http_client_metadata_copy_current_transaction_metadata(v30);

      nw_http_transaction_metadata_set_converted_url_response(v31, v5);
    }

    else
    {
      BOOL v5 = 0LL;
    }
  }

  return (id)v5;
}

void __61__NWURLLoaderHTTP_multipartMixedReplaceBoundaryFromResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [NSString stringWithUTF8String:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
    BOOL v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }

- (void)cancelConnection
{
  if (a1 && !*(_BYTE *)(a1 + 12))
  {
    v2 = *(void **)(a1 + 72);
    if (v2)
    {
      *(_BYTE *)(a1 + 12) = 1;
      id v3 = *(id *)(a1 + 40);
      id v4 = v2;
      -[NWURLSessionTaskConfiguration activity]((uint64_t)v3);
      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
      nw_connection_end_activity(v4, v5);

      nw_connection_cancel(*(nw_connection_t *)(a1 + 72));
    }
  }

- (void)continueLoading
{
  uint64_t v435 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  id v4 = *(id *)(a1 + 24);
  [v4 URL];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = fixInvalidHTTPURL(v5);

  BOOL v7 = nw_endpoint_create_with_cfurl((const __CFURL *)v6);
  if (v7 && (id v8 = (id)v7, v9 = [v8 hostname], v8, v9))
  {
    uint64_t v10 = MEMORY[0x1895F87A8];
    v423[0] = MEMORY[0x1895F87A8];
    uint64_t v2 = 3221225472LL;
    v423[1] = 3221225472LL;
    v423[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke;
    v423[3] = &unk_189BC5C38;
    nw_endpoint_t endpoint = (nw_endpoint_t)v8;
    nw_endpoint_t v424 = endpoint;
    uint64_t v425 = a1;
    v422[0] = v10;
    v422[1] = 3221225472LL;
    v422[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_6;
    v422[3] = &unk_189BC5C80;
    v422[4] = a1;
    v421[0] = v10;
    v421[1] = 3221225472LL;
    v421[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_7;
    v421[3] = &unk_189BC5C80;
    v421[4] = a1;
    nw_parameters_t parameters = nw_parameters_create_secure_http_messaging( v423,  &__block_literal_global_91,  &__block_literal_global_72097,  v422,  v421);
    stack = nw_parameters_copy_default_protocol_stack(parameters);
    v1 = &qword_18C593000;
    if (nw_protocol_copy_http_alt_svc_definition_onceToken == -1) {
      goto LABEL_5;
    }
  }

  else
  {
    _os_crash();
    __break(1u);
  }

  dispatch_once(&nw_protocol_copy_http_alt_svc_definition_onceToken, &__block_literal_global_14_72923);
LABEL_5:
  options = nw_protocol_create_options((void *)nw_protocol_copy_http_alt_svc_definition_http_alt_svc_definition);
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12)
  {
    uint64_t v13 = *(void *)(v12 + 24);
    if (v13)
    {
      id v14 = *(id *)(v13 + 400);
      uint64_t v15 = v14;
      if (v14)
      {
        uint64_t v16 = (void *)*((void *)v14 + 9);
        if (!v16)
        {
          [*((id *)v14 + 12) _alternativeServicesStorage];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = v17;
          if (v17)
          {
            uint64_t v19 = v17;
            id v20 = objc_alloc_init(&OBJC_CLASS___NWConcrete_nw_http_alt_svc_storage);
            storage = v20->storage;
            v20->storage = v19;

            v22 = (void *)v15[9];
            v15[9] = v20;
          }

          uint64_t v16 = (void *)v15[9];
        }

        id v23 = v16;
      }

      else
      {
        id v23 = 0LL;
      }
    }

    else
    {
      uint64_t v15 = 0LL;
      id v23 = 0LL;
    }
  }

  else
  {
    id v23 = 0LL;
  }

  nw_http_alt_svc_options_set_alt_svc_storage(options, v23);

  uint64_t v24 = *(void *)(a1 + 40);
  if (v24) {
    char v25 = [*(id *)(v24 + 32) assumesHTTP3Capable];
  }
  else {
    char v25 = 0;
  }
  v26 = options;
  protocol = (nw_protocol_options *)v26;
  if (!v26)
  {
    __nwlog_obj();
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
    LODWORD(v389) = 12;
    v388 = buf;
    uint64_t v130 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v427 = OS_LOG_TYPE_ERROR;
    char v426 = 0;
    if (v427 == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      uint64_t v131 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v132 = v427;
      if (os_log_type_enabled(v131, v427))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
        _os_log_impl(&dword_181A5C000, v131, v132, "%{public}s called with null options", buf, 0xCu);
      }

      goto LABEL_305;
    }

    if (!v426)
    {
      __nwlog_obj();
      uint64_t v131 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v200 = v427;
      if (os_log_type_enabled(v131, v427))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
        _os_log_impl( &dword_181A5C000,  v131,  v200,  "%{public}s called with null options, backtrace limit exceeded",  buf,  0xCu);
      }

      goto LABEL_305;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    uint64_t v131 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v136 = v427;
    BOOL v137 = os_log_type_enabled(v131, v427);
    if (!backtrace_string)
    {
      if (v137)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
        _os_log_impl(&dword_181A5C000, v131, v136, "%{public}s called with null options, no backtrace", buf, 0xCu);
      }

      goto LABEL_305;
    }

    if (v137)
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = backtrace_string;
      _os_log_impl( &dword_181A5C000,  v131,  v136,  "%{public}s called with null options, dumping backtrace:%{public}s",  buf,  0x16u);
    }

    goto LABEL_157;
  }

  v27 = v26;
  id v28 = v27[1];

  if (v1[147] != -1) {
    dispatch_once(&nw_protocol_copy_http_alt_svc_definition_onceToken, &__block_literal_global_14_72923);
  }
  BOOL is_equal_unsafe = nw_protocol_definition_is_equal_unsafe( (uint64_t)v28,  nw_protocol_copy_http_alt_svc_definition_http_alt_svc_definition);

  if (!is_equal_unsafe)
  {
    __nwlog_obj();
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
    LODWORD(v389) = 12;
    v388 = buf;
    uint64_t v130 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v427 = OS_LOG_TYPE_ERROR;
    char v426 = 0;
    if (v427 == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      uint64_t v131 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v134 = v427;
      if (os_log_type_enabled(v131, v427))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
        _os_log_impl(&dword_181A5C000, v131, v134, "%{public}s protocol options are not http_alt_svc", buf, 0xCu);
      }

void __25__NWURLLoaderHTTP_start___block_invoke(uint64_t a1, void *a2)
{
  id v54 = a2;
  if (!v54) {
    goto LABEL_16;
  }
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    BOOL v5 = (void *)v4[12];
    uint64_t v6 = (void *)v4[3];
    id v4 = (void *)v4[5];
  }

  else
  {
    uint64_t v6 = 0LL;
    BOOL v5 = 0LL;
  }

  BOOL v7 = v4;
  id v8 = v6;
  id v9 = v5;
  if (v7)
  {
    else {
      uint64_t v10 = [v7[2] requestCachePolicy];
    }
    uint64_t v11 = v10;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  id v12 = v54;
  id v13 = v8;
  if (!v9) {
    goto LABEL_15;
  }
  if ([v12 storagePolicy] == 2) {
    goto LABEL_15;
  }
  [v12 response];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14) {
    goto LABEL_15;
  }
  [v13 HTTPBody];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {

LABEL_15:
    goto LABEL_16;
  }

  [v13 HTTPBodyStream];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16) {
    goto LABEL_15;
  }
  [v12 response];
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [v20 valueForHTTPHeaderField:@"Vary"];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    [v20 valueForHTTPHeaderField:@"Vary"];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (([v22 isEqualToString:@"*"] & 1) == 0)
    {
      [v12 _wrappedRequest];
      id v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        id v52 = (void *)_CFURLRequestCopyProtocolPropertyForKey();
        if (v52)
        {
          uint64_t v24 = -[NWURLLoaderCache copyVaryStateFromRequest:varyValueToCopy:](v13, v22);
          if (v24)
          {
            BOOL v49 = v24;
            int v50 = [v52 isEqualToDictionary:v24];

            if (!v50) {
              goto LABEL_47;
            }
            goto LABEL_30;
          }
        }
      }
    }

    goto LABEL_47;
  }

void __25__NWURLLoaderHTTP_start___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 96);
  }
  else {
    uint64_t v3 = 0LL;
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  id v9 = __25__NWURLLoaderHTTP_start___block_invoke_3;
  uint64_t v10 = &unk_189BC5B70;
  uint64_t v11 = v2;
  id v4 = *(void **)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v5 = v4;
  uint64_t v6 = v8;
  if (v3)
  {
    BOOL v7 = *(void **)(v3 + 8);
    if (v7) {
      [v7 getCachedResponseForDataTask:v5 completionHandler:v6];
    }
    else {
      v9((uint64_t)v6, 0LL);
    }
  }
}

void __25__NWURLLoaderHTTP_start___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(dispatch_queue_s **)(v4 + 56);
  }
  else {
    id v5 = 0LL;
  }
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __25__NWURLLoaderHTTP_start___block_invoke_4;
  v7[3] = &unk_189BC5B98;
  v7[4] = v4;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __25__NWURLLoaderHTTP_start___block_invoke_4(void *a1)
{
  uint64_t v2 = a1[4];
  if (!v2 || !*(_BYTE *)(v2 + 12)) {
    (*(void (**)(void))(a1[7] + 16LL))();
  }
  return (*(uint64_t (**)(void))(a1[6] + 16LL))();
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  hostname = nw_endpoint_get_hostname(*(nw_endpoint_t *)(a1 + 32));
  sec_protocol_options_set_tls_server_name(v3, hostname);
  uint64_t v5 = MEMORY[0x1895F87A8];
  uint64_t verify_block = MEMORY[0x1895F87A8];
  uint64_t v20 = 3221225472LL;
  uint64_t v21 = __34__NWURLLoaderHTTP_continueLoading__block_invoke_2;
  v22 = &unk_189BC5BC0;
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v23 = v6;
  if (v6) {
    BOOL v7 = *(dispatch_queue_s **)(v6 + 56);
  }
  else {
    BOOL v7 = 0LL;
  }
  sec_protocol_options_set_verify_block(v3, &verify_block, v7);
  uint64_t v14 = v5;
  uint64_t v15 = 3221225472LL;
  uint64_t v16 = __34__NWURLLoaderHTTP_continueLoading__block_invoke_3;
  uint64_t v17 = &unk_189BC5C10;
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v18 = v8;
  if (v8) {
    id v9 = *(dispatch_queue_s **)(v8 + 56);
  }
  else {
    id v9 = 0LL;
  }
  sec_protocol_options_set_challenge_block(v3, &v14, v9);
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    uint64_t v11 = *(void *)(v10 + 40);
  }
  else {
    uint64_t v11 = 0LL;
  }
  -[NWURLSessionTaskConfiguration configureSecProtocolOptions:](v11, v3);
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    id v13 = *(void **)(v12 + 48);
  }
  else {
    id v13 = 0LL;
  }
  objc_msgSend(v13, "joiningContext", v14, v15, v16, v17, v18, verify_block, v20, v21, v22, v23);
  sec_protocol_options_set_nw_protocol_joining_context();
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_6(uint64_t a1, void *a2)
{
  options = a2;
  nw_tcp_options_set_no_delay(options, 1);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *(void *)(v3 + 40);
    if (v4)
    {
    }
  }
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_7(uint64_t a1, void *a2)
{
  id v24 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 48);
  }
  else {
    uint64_t v4 = 0LL;
  }
  [v4 clientMetadata];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  nw_http_messaging_options_set_client_metadata(v24, v5);

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6 && (uint64_t v7 = *(void *)(v6 + 40)) != 0)
  {
    [*(id *)(v7 + 16) _connectionCachePurgeTimeout];
    uint64_t v9 = v8 - 1;
  }

  else
  {
    uint64_t v9 = 0xFFFFFFFFLL;
  }

  nw_http1_set_idle_timeout(v24, v9);
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10 && (uint64_t v11 = *(void *)(v10 + 40)) != 0)
  {
    [*(id *)(v11 + 16) _longLivedConnectionCachePurgeTimeout];
    uint64_t v13 = 2 * v12;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  nw_http2_set_idle_timeout(v24, v13);
  nw_http3_set_idle_timeout(v24, v13);
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14 && (uint64_t v15 = *(void *)(v14 + 40)) != 0) {
    uint64_t v16 = [*(id *)(v15 + 16) HTTPMaximumConnectionsPerHost];
  }
  else {
    uint64_t v16 = 0LL;
  }
  nw_http1_set_connection_pool_width(v24, v16);
  uint64_t v17 = *(void *)(a1 + 32);
  if (!v17) {
    goto LABEL_33;
  }
  if (!*(_BYTE *)(v17 + 17))
  {
    uint64_t v18 = *(void *)(v17 + 40);
    if (v18)
    {
      id v19 = *(id *)(v18 + 24);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        unint64_t v21 = 1LL;
        goto LABEL_17;
      }

      unint64_t v22 = [*(id *)(v18 + 32) _allowedProtocolTypes];
      if (!v22) {
        goto LABEL_27;
      }
      unint64_t v21 = (v22 >> 4) & 4 | (v22 >> 3) & 2 | v22 & 1;
      if ((v22 & 1) != 0)
      {
        if (((v22 >> 3) & 2) != 0) {
          goto LABEL_22;
        }
        goto LABEL_17;
      }

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    uint64_t v6 = *(void **)(v5 + 48);
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = a4;
  [v6 loaderWillPerformHSTSUpgrade:a3];
  (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_10( uint64_t a1,  void *a2,  void *a3,  void *a4,  void *a5)
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v13 = a5;
  uint64_t v14 = *(void *)(a1 + 32);
  if (!v14) {
    goto LABEL_5;
  }
  if (!*(_BYTE *)(v14 + 12))
  {
    -[NWURLLoaderHTTP stopResponseStallTimer](v14, v12);
    uint64_t v14 = *(void *)(a1 + 32);
LABEL_5:
    -[NWURLLoaderHTTP responseFromMetadata:](v14, v9);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = (void *)nw_endpoint_copy_cfurl(v10);
    uint64_t v17 = *(void *)(a1 + 32);
    if (v17) {
      uint64_t v18 = *(void **)(v17 + 24);
    }
    else {
      uint64_t v18 = 0LL;
    }
    id v19 = (void *)[v18 mutableCopy];
    [v19 setURL:v16];
    if (v16)
    {
      [v16 scheme];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v21 = [v20 length] - 2;
      if (v21 >= 4)
      {
      }

      else
      {
        uint64_t v22 = [v20 caseInsensitiveCompare:off_189BB7FE8[v21]];

        if (!v22)
        {
          uint64_t v43 = v15;
          id v44 = v10;
          id v45 = v9;
          id v23 = nw_http_metadata_copy_request(v11);
          v54[0] = MEMORY[0x1895F87A8];
          v54[1] = 3221225472LL;
          v54[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_11;
          v54[3] = &unk_189BC5CF8;
          BOOL v42 = v19;
          id v24 = v19;
          id v55 = v24;
          nw_http_request_access_method(v23, v54);
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          [v24 _allHTTPHeaderFieldsAsArrays];
          int v25 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v26 = [v25 countByEnumeratingWithState:&v50 objects:v56 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v51;
            do
            {
              uint64_t v29 = 0LL;
              do
              {
                if (*(void *)v51 != v28) {
                  objc_enumerationMutation(v25);
                }
                [v24 setValue:0 forHTTPHeaderField:*(void *)(*((void *)&v50 + 1) + 8 * v29++)];
              }

              while (v27 != v29);
              uint64_t v27 = [v25 countByEnumeratingWithState:&v50 objects:v56 count:16];
            }

            while (v27);
          }

          BOOL v30 = nw_http_request_copy_url_request(v23, (void *)*MEMORY[0x1896020E0], v16);
          [(id)v30 _allHTTPHeaderFieldsAsArrays];
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
          v48[0] = MEMORY[0x1895F87A8];
          v48[1] = 3221225472LL;
          v48[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_12;
          v48[3] = &unk_189BC5D20;
          id v32 = v24;
          id v49 = v32;
          [v31 enumerateKeysAndObjectsUsingBlock:v48];

          if (v32)
          {
            [v32 HTTPMethod];
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v34 = [v33 caseInsensitiveCompare:@"GET"];

            if (!v34
              || ([v32 HTTPMethod],
                  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(),
                  uint64_t v39 = [v38 caseInsensitiveCompare:@"HEAD"],
                  v38,
                  !v39))
            {
              [v32 setHTTPBody:0];
              [v32 setHTTPBodyStream:0];
            }
          }

          id v10 = v44;
          id v9 = v45;
          id v19 = v42;
          uint64_t v15 = v43;
          goto LABEL_21;
        }
      }
    }

    if ([v16 isFileURL])
    {
      uint64_t v40 = *(void *)(a1 + 32);
      if (!v40 || !*(void *)(v40 + 88))
      {
        -[NWURLLoaderHTTP errorForErrorCode:]((id *)v40, -1102LL);
        id v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NWURLLoaderHTTP setPendingError:](*(void *)(a1 + 32), v41);
      }

      (*((void (**)(id, void, void, void))v13 + 2))(v13, 0LL, 0LL, 0LL);
      goto LABEL_24;
    }

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  uint64_t v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (!v7)
  {
LABEL_4:
    id v8 = (id)v7;
    id v9 = *(void **)(a1 + 32);
    if (v9) {
      id v9 = (void *)v9[9];
    }
    id v10 = v9;
    id v11 = nw_connection_create_with_connection(v10, v5);
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      objc_storeStrong((id *)(v12 + 72), v11);
    }

    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
    }
    id v13 = (id)gurlLogObj;
    if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
LABEL_20:

      uint64_t v25 = *(void *)(a1 + 32);
      if (v25 && *(void *)(v25 + 72))
      {
        -[NWURLLoaderHTTP stopResponseStallTimer](v25, v24);
        uint64_t v26 = *(void *)(a1 + 32);
        if (v26) {
          uint64_t v27 = *(void **)(v26 + 64);
        }
        else {
          uint64_t v27 = 0LL;
        }
        objc_msgSend(v27, "close", v39, v40, v41, v42, v43, v44);
        uint64_t v28 = *(void *)(a1 + 32);
        if (v28)
        {
          uint64_t v29 = *(void **)(v28 + 64);
          *(void *)(v28 + 64) = 0LL;
        }

        nw_content_context_t v30 = nw_content_context_create("http resend context");
        uint64_t v31 = *(void *)(a1 + 32);
        if (v31) {
          objc_storeStrong((id *)(v31 + 80), v30);
        }

        uint64_t v32 = *(void *)(a1 + 32);
        if (v32) {
          uint64_t v33 = *(void *)(v32 + 80);
        }
        else {
          uint64_t v33 = 0LL;
        }
        v6[2](v6, v33);
        uint64_t v34 = *(void *)(a1 + 32);
        if (v34) {
          uint64_t v35 = *(void **)(v34 + 72);
        }
        else {
          uint64_t v35 = 0LL;
        }
        -[NWURLLoaderHTTP configureAndStartConnection:](v34, v35);
        -[NWURLLoaderHTTP needRequestBody](*(void *)(a1 + 32));
        -[NWURLLoaderHTTP readResponse](*(void *)(a1 + 32));
        uint64_t v36 = *(void **)(a1 + 32);
        if (!v36) {
          goto LABEL_34;
        }
      }

      else
      {
        -[NWURLLoaderHTTP setConnection:](v25, v8);
        uint64_t v36 = *(void **)(a1 + 32);
        if (!v36) {
          goto LABEL_34;
        }
      }

      uint64_t v36 = (void *)v36[5];
LABEL_34:
      id v37 = v36;
      -[NWURLSessionTaskConfiguration activity]((uint64_t)v37);
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      nw_connection_end_activity(v8, v38);

      nw_connection_cancel((nw_connection_t)v8);
      goto LABEL_35;
    }

    uint64_t v14 = *(void *)(a1 + 32);
    if (v14 && (id v15 = *(id *)(v14 + 48)) != 0LL)
    {
      uint64_t v16 = v15;
      [v15 logDescription];
      uint64_t v17 = *(void *)(a1 + 32);
      if (!v17) {
        goto LABEL_36;
      }
    }

    else
    {
      uint64_t v16 = 0LL;
      uint64_t v42 = 0LL;
      uint64_t v43 = 0LL;
      LODWORD(v44) = 0;
      uint64_t v17 = *(void *)(a1 + 32);
      if (!v17) {
        goto LABEL_36;
      }
    }

    id v18 = *(id *)(v17 + 48);
    if (v18)
    {
      id v19 = v18;
      [v18 logDescription];
      int v20 = v41;
      uint64_t v21 = *(void *)(a1 + 32);
      if (!v21)
      {
LABEL_37:
        uint64_t v22 = 0LL;
        goto LABEL_19;
      }

uint64_t __34__NWURLLoaderHTTP_continueLoading__block_invoke_36(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    if (*(_BYTE *)(v4 + 12)) {
      return 0LL;
    }
    uint64_t v4 = *(void *)(v4 + 72);
  }

  id v7 = (id)v4;
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    id v9 = *(void **)(v8 + 72);
    *(void *)(v8 + 72) = 0LL;

    uint64_t v10 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  -[NWURLLoaderHTTP stopResponseStallTimer](v10, v6);
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    uint64_t v12 = *(void **)(v11 + 64);
  }
  else {
    uint64_t v12 = 0LL;
  }
  [v12 close];
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13
    && (uint64_t v14 = *(void **)(v13 + 64), *(void *)(v13 + 64) = 0LL, v14, (v15 = *(void *)(a1 + 32)) != 0))
  {
    *(_BYTE *)(v15 + 17) = 1;
    uint64_t v16 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  -[NWURLLoaderHTTP continueLoading](v16);
  -[NWURLLoaderHTTP readResponse](*(void *)(a1 + 32));
  uint64_t v17 = *(void **)(a1 + 32);
  if (v17) {
    uint64_t v17 = (void *)v17[5];
  }
  id v18 = v17;
  -[NWURLSessionTaskConfiguration activity]((uint64_t)v18);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  nw_connection_end_activity(v7, v19);

  nw_connection_cancel((nw_connection_t)v7);
  return 1LL;
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_2_38(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v37 = a3;
  uint64_t v6 = (__CFHTTPMessage *)nw_authentication_challenge_copy_http_message(v5);
  if (!v6) {
    goto LABEL_26;
  }
  id v7 = v6;
  uint64_t v8 = (void *)nw_authentication_challenge_copy_protection_space(v5);
  id v9 = nw_authentication_protection_space_copy_endpoint(v8);
  uint64_t v10 = (void *)nw_endpoint_copy_cfurl(v9);
  if (v10) {
    _CFHTTPMessageSetResponseProxyURL();
  }
  uint64_t v11 = CFHTTPAuthenticationCreateFromResponse((CFAllocatorRef)*MEMORY[0x189604DB0], v7);
  if (!v11)
  {
    BOOL v25 = 0;
    goto LABEL_24;
  }

  uint64_t v12 = v11;
  BOOL v13 = nw_http_authentication_parse_schemes(v11, v9, 1, 1, 0);
  uint64_t v14 = (void *)v13;
  if (v13 && *(void *)(v13 + 24) != *(void *)(v13 + 16))
  {
    nw_authentication_challenge_set_protection_space_array(v5, (void *)v13);
    int type = nw_authentication_challenge_get_type(v5);
    if (type == 4) {
      goto LABEL_22;
    }
    int v16 = type;
    uint64_t v17 = *(void *)(a1 + 32);
    if (v17) {
      uint64_t v18 = *(void *)(v17 + 40);
    }
    else {
      uint64_t v18 = 0LL;
    }
    -[NWURLSessionTaskConfiguration URLCredentialStorage](v18);
    id v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      uint64_t v20 = *(void *)(a1 + 32);
      if (v20) {
        uint64_t v21 = *(void *)(v20 + 40);
      }
      else {
        uint64_t v21 = 0LL;
      }
      -[NWURLSessionTaskConfiguration URLCredentialStorage](v21);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v36 = a1;
      id v23 = nw_authentication_credential_storage_copy_default_credential(v22, v5);

      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v35 = v24[3];

        if (v35) {
          nw_authentication_challenge_set_proposed_credential(v5, v24);
        }
      }

      a1 = v36;
    }

    if (v16 != 5) {
LABEL_22:
    }
      BOOL v25 = 0;
    else {
      BOOL v25 = _CFHTTPAuthenticationIsSecondNTLMTransaction() != 0;
    }

    CFRelease(v12);
LABEL_24:
    CFRelease(v7);

    if (v25)
    {
LABEL_25:
      (*((void (**)(id, void, void))v37 + 2))(v37, 0LL, 0LL);
      goto LABEL_35;
    }

- (void)configureAndStartConnection:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = MEMORY[0x1895F87A8];
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __47__NWURLLoaderHTTP_configureAndStartConnection___block_invoke;
    handler[3] = &unk_189BC9490;
    id v6 = v3;
    id v17 = v6;
    uint64_t v18 = a1;
    nw_connection_set_state_changed_handler((nw_connection_t)v6, handler);
    v13[0] = v5;
    v13[1] = 3221225472LL;
    v13[2] = __47__NWURLLoaderHTTP_configureAndStartConnection___block_invoke_44;
    v13[3] = &unk_189BC5E10;
    id v7 = v6;
    id v14 = v7;
    uint64_t v15 = a1;
    nw_connection_set_better_path_available_handler((nw_connection_t)v7, v13);
    v10[0] = v5;
    v10[1] = 3221225472LL;
    v10[2] = __47__NWURLLoaderHTTP_configureAndStartConnection___block_invoke_46;
    v10[3] = &unk_189BC5E10;
    id v8 = v7;
    id v11 = v8;
    uint64_t v12 = a1;
    nw_connection_set_viability_changed_handler((nw_connection_t)v8, v10);
    *(_BYTE *)(a1 + 9) = 0;
    id v9 = *(void **)(a1 + 144);
    *(void *)(a1 + 144) = 0LL;

    nw_connection_set_queue((nw_connection_t)v8, *(dispatch_queue_t *)(a1 + 56));
    -[NWURLSessionTaskConfiguration configureConnection:](*(void *)(a1 + 40), v8);
    nw_connection_start((nw_connection_t)v8);
  }
}

void __47__NWURLLoaderHTTP_configureAndStartConnection___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v177 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    uint64_t v7 = *(void *)(v7 + 72);
  }
  if (*(void *)(a1 + 32) != v7) {
    goto LABEL_107;
  }
  if (gLogDatapath)
  {
    id v96 = v5;
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
    }
    os_log_type_t v97 = (os_log_s *)(id)gurlLogObj;
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v98 = *(void *)(a1 + 40);
      if (v98 && (id v99 = *(id *)(v98 + 48)) != 0LL)
      {
        os_log_type_t v100 = v99;
        [v99 logDescription];
      }

      else
      {
        os_log_type_t v100 = 0LL;
        v174[0] = 0LL;
        v174[1] = 0LL;
        int v175 = 0;
      }

      uint64_t v101 = *(void *)(a1 + 40);
      if (v101 && (id v102 = *(id *)(v101 + 48)) != 0LL)
      {
        os_log_type_t v103 = v102;
        [v102 logDescription];
        int v104 = v173;
      }

      else
      {
        int v104 = 0;
        os_log_type_t v103 = 0LL;
        uint64_t v171 = 0LL;
        uint64_t v172 = 0LL;
        int v173 = 0;
      }

      if (a2 > 5) {
        uint64_t v105 = "unknown";
      }
      else {
        uint64_t v105 = off_189BB9C00[a2];
      }
      *(_DWORD *)buf = 136447490;
      *(void *)&uint8_t buf[4] = "-[NWURLLoaderHTTP configureAndStartConnection:]_block_invoke";
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2098;
      *(void *)&buf[20] = v174;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v104;
      *(_WORD *)&buf[34] = 2080;
      *(void *)&buf[36] = v105;
      *(_WORD *)&_BYTE buf[44] = 2112;
      *(void *)&buf[46] = v96;
      _os_log_impl( &dword_181A5C000,  v97,  OS_LOG_TYPE_DEBUG,  "%{public}s Task <%{public,uuid_t}.16P>.<%u> connection state: %s, error: %@",  buf,  0x36u);
    }

    id v6 = v96;
  }

  switch(a2)
  {
    case 1u:
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = v6;
      if (v8) {
        uint64_t v10 = *(void **)(v8 + 48);
      }
      else {
        uint64_t v10 = 0LL;
      }
      [v10 loaderWaitingForConnectivity];
      goto LABEL_89;
    case 2u:
      uint64_t v73 = *(void *)(a1 + 40);
      id v9 = v6;
      if (v73) {
        uint64_t v74 = *(void **)(v73 + 48);
      }
      else {
        uint64_t v74 = 0LL;
      }
      [v74 loaderPreparingConnection];
LABEL_89:
      id v6 = v9;
      goto LABEL_107;
    case 3u:
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11) {
        *(_BYTE *)(v11 + 9) = 1;
      }
      uint64_t v12 = *(nw_connection **)(a1 + 32);
      v160 = v6;
      if (nw_protocol_copy_http_connection_definition_onceToken != -1) {
        dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_62);
      }
      BOOL v13 = (nw_protocol_definition *)(id)nw_protocol_copy_http_connection_definition_definition;
      nw_protocol_metadata_t obj = nw_connection_copy_protocol_metadata(v12, v13);

      if (!obj) {
        goto LABEL_53;
      }
      uint64_t v14 = *(void *)(a1 + 40);
      if (v14)
      {
        objc_storeStrong((id *)(v14 + 144), obj);
        uint64_t v15 = *(void *)(a1 + 40);
      }

      else
      {
        uint64_t v15 = 0LL;
      }

      -[NWURLLoaderHTTP addProgressObserverForResponseStallTimer](v15);
      id establishment_report = nw_http_connection_metadata_get_establishment_report(obj);
      BOOL v17 = establishment_report == 0LL;

      if (!v17) {
        goto LABEL_53;
      }
      id v18 = nw_connection_copy_establishment_report_on_queue(*(void **)(a1 + 32));
      id v19 = obj;
      id v20 = v18;
      uint64_t v21 = v19;
      id v22 = v21[1];

      if (nw_protocol_copy_http_connection_definition_onceToken != -1) {
        dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_62);
      }
      BOOL is_equal_unsafe = nw_protocol_definition_is_equal_unsafe( (uint64_t)v22,  nw_protocol_copy_http_connection_definition_definition);

      if (is_equal_unsafe)
      {
        *(void *)buf = MEMORY[0x1895F87A8];
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&buf[16] = __nw_http_connection_metadata_set_establishment_report_block_invoke;
        *(void *)&_BYTE buf[24] = &unk_189BC6260;
        id v24 = v20;
        *(void *)&buf[32] = v24;
        if (v21[4])
        {
          (*(void (**)(_BYTE *))&buf[16])(buf);
          id v24 = *(id *)&buf[32];
        }

        goto LABEL_23;
      }

      __nwlog_obj();
      Class v106 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_establishment_report";
      LODWORD(v159) = 12;
      v158 = buf;
      int v107 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      os_log_type_t v163 = OS_LOG_TYPE_DEFAULT;
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        id v108 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v109 = type[0];
        if (os_log_type_enabled(v108, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_establishment_report";
          _os_log_impl(&dword_181A5C000, v108, v109, "%{public}s metadata must be http_connection", buf, 0xCu);
        }

void __47__NWURLLoaderHTTP_configureAndStartConnection___block_invoke_44(uint64_t a1, int a2)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    uint64_t v4 = *(void *)(v4 + 72);
  }
  if (*(void *)(a1 + 32) == v4)
  {
    if (!gLogDatapath)
    {
      if (!a2) {
        return;
      }
      goto LABEL_6;
    }

    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
    }
    uint64_t v7 = (os_log_s *)(id)gurlLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      if (v8 && (id v9 = *(id *)(v8 + 48)) != 0LL)
      {
        uint64_t v10 = v9;
        [v9 logDescription];
      }

      else
      {
        uint64_t v10 = 0LL;
        uint64_t v18 = 0LL;
        uint64_t v19 = 0LL;
        LODWORD(v20) = 0;
      }

      uint64_t v11 = *(void *)(a1 + 40);
      if (v11 && (id v12 = *(id *)(v11 + 48)) != 0LL)
      {
        BOOL v13 = v12;
        [v12 logDescription];
        int v14 = v17;
      }

      else
      {
        int v14 = 0;
        uint64_t v15 = 0LL;
        uint64_t v16 = 0LL;
        LODWORD(v17) = 0;
      }

      *(_DWORD *)buf = 136447234;
      id v22 = "-[NWURLLoaderHTTP configureAndStartConnection:]_block_invoke";
      __int16 v23 = 1042;
      int v24 = 16;
      __int16 v25 = 2098;
      uint64_t v26 = &v18;
      __int16 v27 = 1024;
      int v28 = v14;
      __int16 v29 = 1024;
      int v30 = a2;
      _os_log_impl( &dword_181A5C000,  v7,  OS_LOG_TYPE_DEBUG,  "%{public}s Task <%{public,uuid_t}.16P>.<%u> connection better path: %{BOOL}d",  buf,  0x28u);
    }

    if (a2)
    {
LABEL_6:
      uint64_t v5 = *(void *)(a1 + 40);
      if (v5) {
        id v6 = *(void **)(v5 + 48);
      }
      else {
        id v6 = 0LL;
      }
      objc_msgSend(v6, "loaderBetterPathAvailable", v15, v16, v17, v18, v19, v20);
    }
  }

void __47__NWURLLoaderHTTP_configureAndStartConnection___block_invoke_46(uint64_t a1, int a2)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    uint64_t v4 = *(void *)(v4 + 72);
  }
  if (*(void *)(a1 + 32) == v4)
  {
    if (!gLogDatapath)
    {
      if ((a2 & 1) != 0) {
        return;
      }
LABEL_6:
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
      }
      id v5 = (id)gurlLogObj;
      if (!os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
      {
LABEL_18:

        uint64_t v13 = *(void *)(a1 + 40);
        if (v13)
        {
          if (*(void *)(v13 + 88))
          {
LABEL_26:
            -[NWURLLoaderHTTP cancelConnection](v13);
            return;
          }

          int v14 = objc_alloc(&OBJC_CLASS___NWURLError);
          [*(id *)(v13 + 48) loaderTask];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          id v16 = (id)v13;
          id v17 = v15;
          if (v14)
          {
            uint64_t v18 = *MEMORY[0x189607740];
            *(void *)buf = v14;
            *(void *)&buf[8] = &OBJC_CLASS___NWURLError;
            uint64_t v19 = (NWURLError *)objc_msgSendSuper2( (objc_super *)buf,  sel_initWithDomain_code_userInfo_,  v18,  -1005,  0);
            int v14 = v19;
            if (v19) {
              -[NWURLError fillErrorForLoader:andTask:](v19, "fillErrorForLoader:andTask:", v16, v17);
            }
          }

          uint64_t v20 = *(void *)(a1 + 40);
          if (v20) {
            objc_storeStrong((id *)(v20 + 88), v14);
          }
        }

        else
        {
          int v14 = 0LL;
        }

        uint64_t v13 = *(void *)(a1 + 40);
        goto LABEL_26;
      }

      uint64_t v6 = *(void *)(a1 + 40);
      if (v6 && (id v7 = *(id *)(v6 + 48)) != 0LL)
      {
        uint64_t v8 = v7;
        [v7 logDescription];
        uint64_t v9 = *(void *)(a1 + 40);
        if (!v9) {
          goto LABEL_16;
        }
      }

      else
      {
        uint64_t v8 = 0LL;
        v30[0] = 0LL;
        v30[1] = 0LL;
        int v31 = 0;
        uint64_t v9 = *(void *)(a1 + 40);
        if (!v9) {
          goto LABEL_16;
        }
      }

      id v10 = *(id *)(v9 + 48);
      if (v10)
      {
        uint64_t v11 = v10;
        [v10 logDescription];
        int v12 = v29;

LABEL_17:
        *(_DWORD *)buf = 68289282;
        *(_DWORD *)&uint8_t buf[4] = 16;
        *(_WORD *)&buf[8] = 2098;
        *(void *)&buf[10] = v30;
        __int16 v38 = 1024;
        LODWORD(v39) = v12;
        _os_log_impl( &dword_181A5C000,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "Task <%{public,uuid_t}.16P>.<%u> connection not viable",  buf,  0x18u);

        goto LABEL_18;
      }

- (void)addProgressObserverForResponseStallTimer
{
  if (a1 && *(void *)(a1 + 152) && *(void *)(a1 + 144))
  {
    if (HTTPNotificationCenter_onceToken != -1) {
      dispatch_once(&HTTPNotificationCenter_onceToken, &__block_literal_global_197);
    }
    uint64_t v2 = *(void *)(a1 + 144);
    id v3 = (id)HTTPNotificationCenter_center;
    [v3 addObserver:a1 selector:sel_restartStallTimer_ name:@"NWURLLoaderHTTPConnectionProgressNotification" object:v2];
  }

- (void)startResponseStallTimer
{
  if (!*(_BYTE *)(a1 + 10))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2)
    {
      if ([*(id *)(v2 + 16) _reportsDataStalls])
      {
        id v3 = *(id *)(a1 + 48);
        [v3 networkContext];
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
        v8[0] = MEMORY[0x1895F87A8];
        v8[1] = 3221225472LL;
        void v8[2] = __42__NWURLLoaderHTTP_startResponseStallTimer__block_invoke;
        v8[3] = &unk_189BC93A0;
        v8[4] = a1;
        *(void *)(a1 + 152) = nw_queue_context_create_source(v4, 2, 3, 0, v8, 0LL);

        uint64_t v5 = *(void *)(a1 + 152);
        dispatch_time_t v6 = dispatch_time(0x8000000000000000LL, 3000000000LL);
        nw_queue_set_timer_values(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        nw_queue_activate_source(*(void *)(a1 + 152), v7);
        -[NWURLLoaderHTTP addProgressObserverForResponseStallTimer](a1);
      }
    }
  }

- (uint64_t)pendingErrorIsRetryable
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = *(id *)(a1 + 88);
    if (v2)
    {
      id v3 = *(id *)(v1 + 88);
      if ([v3 code] == -1005)
      {
        uint64_t v1 = 1LL;
      }

      else
      {
        id v4 = *(id *)(v1 + 88);
        uint64_t v1 = [v4 code] == -1017 || objc_msgSend(*(id *)(v1 + 88), "code") == -1200;
      }
    }

    else
    {
      uint64_t v1 = 1LL;
    }
  }

  return v1;
}

- (void)setConnection:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (void)setRequestBodyProvider:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), 0LL);
  }
}

- (void)needRequestBody
{
  if (a1)
  {
    if (*(void *)(a1 + 32))
    {
      id v2 = *(void **)(a1 + 48);
      v6[0] = MEMORY[0x1895F87A8];
      v6[1] = 3221225472LL;
      v6[2] = __34__NWURLLoaderHTTP_needRequestBody__block_invoke;
      v6[3] = &unk_189BC5E90;
      v6[4] = a1;
      [v2 loaderNeedsBodyProviderFromOffset:0 completionHandler:v6];
    }

    else
    {
      *(_BYTE *)(a1 + 16) = 1;
      id v5 = *(id *)(a1 + 136);
      objc_setProperty_nonatomic_copy((id)a1, v3, 0LL, 136LL);
      id v4 = v5;
      if (v5)
      {
        (*((void (**)(id))v5 + 2))(v5);
        id v4 = v5;
      }

      if (*(_BYTE *)(a1 + 9))
      {
        -[NWURLLoaderHTTP startResponseStallTimer](a1);
        id v4 = v5;
      }
    }
  }

void __34__NWURLLoaderHTTP_needRequestBody__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  if (v4)
  {
    if (v5)
    {
      *(_BYTE *)(v5 + 16) = 0;
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6)
      {
        objc_storeStrong((id *)(v6 + 64), a2);
        uint64_t v5 = *(void *)(a1 + 32);
      }

      else
      {
        uint64_t v5 = 0LL;
      }
    }

    -[NWURLLoaderHTTP writeRequestBody](v5);
  }

  else
  {
    if (!v5 || !*(void *)(v5 + 88))
    {
      -[NWURLLoaderHTTP errorForErrorCode:]((id *)v5, -1021LL);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLLoaderHTTP setPendingError:](*(void *)(a1 + 32), v7);

      uint64_t v5 = *(void *)(a1 + 32);
    }

    -[NWURLLoaderHTTP cancelConnection](v5);
  }
}

- (void)writeRequestBody
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 64);
    SEL v3 = *(void **)(a1 + 64);
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __35__NWURLLoaderHTTP_writeRequestBody__block_invoke;
    v5[3] = &unk_189BC5F08;
    id v6 = v2;
    uint64_t v7 = a1;
    id v4 = v2;
    [v3 readMinimumIncompleteLength:1 maximumLength:0x20000 completionHandler:v5];
  }

void __35__NWURLLoaderHTTP_writeRequestBody__block_invoke(uint64_t a1, void *a2, BOOL a3, void *a4)
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  uint64_t v7 = a2;
  id v8 = a4;
  uint64_t v9 = v8;
  uint64_t v11 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    if (v11 != v10[8]) {
      goto LABEL_10;
    }
  }

  else if (v11)
  {
    goto LABEL_10;
  }

  if (gLogDatapath)
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
    }
    uint64_t v19 = (os_log_s *)(id)gurlLogObj;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      if (v20 && (id v21 = *(id *)(v20 + 48)) != 0LL)
      {
        uint64_t v22 = v21;
        [v21 logDescription];
      }

      else
      {
        uint64_t v22 = 0LL;
        v39[0] = 0LL;
        v39[1] = 0LL;
        int v40 = 0;
      }

      uint64_t v23 = *(void *)(a1 + 40);
      if (v23 && (id v24 = *(id *)(v23 + 48)) != 0LL)
      {
        uint64_t v25 = v24;
        [v24 logDescription];
        int v26 = v38;
      }

      else
      {
        int v26 = 0;
        uint64_t v25 = 0LL;
        uint64_t v36 = 0LL;
        uint64_t v37 = 0LL;
        int v38 = 0;
      }

      if (v7) {
        size_t size = dispatch_data_get_size(v7);
      }
      else {
        size_t size = 0LL;
      }
      *(_DWORD *)buf = 136447746;
      __int16 v42 = "-[NWURLLoaderHTTP writeRequestBody]_block_invoke";
      __int16 v43 = 1042;
      int v44 = 16;
      __int16 v45 = 2098;
      int v46 = v39;
      __int16 v47 = 1024;
      int v48 = v26;
      __int16 v49 = 2048;
      size_t v50 = size;
      __int16 v51 = 1024;
      BOOL v52 = a3;
      __int16 v53 = 2112;
      id v54 = v9;
      _os_log_impl( &dword_181A5C000,  v19,  OS_LOG_TYPE_DEBUG,  "%{public}s Task <%{public,uuid_t}.16P>.<%u> sending body: %zu, complete: %{BOOL}d, error: %@",  buf,  0x3Cu);
    }

    id v10 = *(void **)(a1 + 40);
    if (!v9) {
      goto LABEL_5;
    }
  }

  else if (!v8)
  {
LABEL_5:
    if (v10) {
      id v10 = (void *)v10[9];
    }
    int v12 = v10;
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)(a1 + 40);
    if (v14)
    {
      id v16 = *(void **)(v14 + 72);
      uint64_t v15 = *(nw_content_context **)(v14 + 80);
    }

    else
    {
      id v16 = 0LL;
      uint64_t v15 = 0LL;
    }

    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v31[2] = __35__NWURLLoaderHTTP_writeRequestBody__block_invoke_54;
    v31[3] = &unk_189BC5EE0;
    id v32 = v12;
    uint64_t v33 = v14;
    BOOL v35 = a3;
    int v34 = v7;
    id v17 = v13;
    uint64_t v18 = v16;
    nw_connection_send(v18, v34, v15, a3, v31);

    goto LABEL_10;
  }

  if (v10) {
    id v10 = (void *)v10[3];
  }
  int v28 = v10;
  [v28 URL];
  int v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setFailingURL:v29];

  uint64_t v30 = *(void *)(a1 + 40);
  if (!v30 || !*(void *)(v30 + 88))
  {
    -[NWURLLoaderHTTP setPendingError:](v30, v9);
    uint64_t v30 = *(void *)(a1 + 40);
  }

  -[NWURLLoaderHTTP cancelConnection](v30);
  -[NWURLLoaderHTTP finishRequest:](*(void *)(a1 + 40));
LABEL_10:
}

- (void)finishRequest:(uint64_t)a1
{
  if (a1)
  {
    *(_BYTE *)(a1 + 16) = 1;
    id v4 = *(id *)(a1 + 136);
    objc_setProperty_nonatomic_copy((id)a1, v2, 0LL, 136LL);
    SEL v3 = v4;
    if (v4)
    {
      (*((void (**)(id))v4 + 2))(v4);
      SEL v3 = v4;
    }
  }

void __35__NWURLLoaderHTTP_writeRequestBody__block_invoke_54(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v5 != *(void *)(v6 + 72)) {
      goto LABEL_21;
    }
  }

  else if (v5)
  {
    goto LABEL_21;
  }

  if (!v3)
  {
    if (*(_BYTE *)(a1 + 56) && v6)
    {
      *(_BYTE *)(v6 + 16) = 1;
      uint64_t v7 = (void (**)(void))*(id *)(v6 + 136);
      objc_setProperty_nonatomic_copy((id)v6, v8, 0LL, 136LL);
      if (v7) {
        v7[2](v7);
      }
      if (*(_BYTE *)(v6 + 9)) {
        -[NWURLLoaderHTTP startResponseStallTimer](v6);
      }
    }

    uint64_t v9 = *(dispatch_data_s **)(a1 + 48);
    if (v9)
    {
      size_t size = dispatch_data_get_size(v9);
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11)
      {
LABEL_13:
        int v12 = *(void **)(v11 + 64);
LABEL_14:
        uint64_t v13 = [v12 countOfBytesSent];
        uint64_t v14 = *(void *)(a1 + 40);
        if (v14)
        {
          uint64_t v15 = *(void **)(v14 + 48);
          char v16 = *(_BYTE *)(a1 + 56);
          if (v16) {
            uint64_t v17 = v13;
          }
          else {
            uint64_t v17 = *(void *)(v14 + 32);
          }
        }

        else
        {
          uint64_t v15 = 0LL;
          char v16 = *(_BYTE *)(a1 + 56);
          if (v16) {
            uint64_t v17 = v13;
          }
          else {
            uint64_t v17 = 0LL;
          }
        }

        v19[0] = MEMORY[0x1895F87A8];
        v19[1] = 3221225472LL;
        v19[2] = __35__NWURLLoaderHTTP_writeRequestBody__block_invoke_2;
        v19[3] = &unk_189BC5EB8;
        char v20 = v16;
        v19[4] = v14;
        [v15 loaderDidSendBodyData:size totalBytesSent:v13 totalBytesExpectedToSend:v17 completionHandler:v19];
        goto LABEL_21;
      }
    }

    else
    {
      size_t size = 0LL;
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11) {
        goto LABEL_13;
      }
    }

    int v12 = 0LL;
    goto LABEL_14;
  }

  if (!v6 || !*(void *)(v6 + 88))
  {
    -[NWURLLoaderHTTP errorForNWError:](*(id **)(a1 + 40), v3);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWURLLoaderHTTP setPendingError:](*(void *)(a1 + 40), v18);

    uint64_t v6 = *(void *)(a1 + 40);
  }

  -[NWURLLoaderHTTP cancelConnection](v6);
  -[NWURLLoaderHTTP finishRequest:](*(void *)(a1 + 40));
LABEL_21:
}

uint64_t __35__NWURLLoaderHTTP_writeRequestBody__block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(result + 40)) {
    return -[NWURLLoaderHTTP writeRequestBody](*(void *)(result + 32));
  }
  return result;
}

void __42__NWURLLoaderHTTP_startResponseStallTimer__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = *(void **)(v3 + 72);
    if (v4)
    {
      id v5 = v4;
      xpc_object_t v6 = xpc_uint64_create(3uLL);
      nw_connection_add_client_event_internal(v5, 2, v6, 0LL);

      uint64_t v3 = *(void *)(a1 + 32);
    }
  }

  -[NWURLLoaderHTTP stopResponseStallTimer](v3, a2);
}

uint64_t __35__NWURLLoaderHTTP_reportConnected___block_invoke(uint64_t a1, uint64_t a2)
{
  SEL v2 = *(void **)(a1 + 32);
  [NSString stringWithUTF8String:a2];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];

  return 1LL;
}

void __32__NWURLLoaderHTTP_writeRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  if (v3)
  {
    if (!v4 || !*(void *)(v4 + 88))
    {
      -[NWURLLoaderHTTP errorForNWError:]((id *)v4, v3);
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLLoaderHTTP setPendingError:](*(void *)(a1 + 32), v5);

      uint64_t v4 = *(void *)(a1 + 32);
    }

    -[NWURLLoaderHTTP cancelConnection](v4);
  }

  else
  {
    -[NWURLLoaderHTTP needRequestBody](v4);
  }
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_39(uint64_t a1, void *a2, char a3)
{
  id v12 = a2;
  if (v12
    || (a3 & 1) != 0
    || (uint64_t v5 = *(void *)(a1 + 32)) == 0
    || (uint64_t v6 = *(void *)(v5 + 40)) == 0
    || ![*(id *)(v6 + 16) _requiresSecureHTTPSProxyConnection])
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    goto LABEL_11;
  }

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  if (!v7)
  {
    id v10 = 0LL;
    goto LABEL_13;
  }

  uint64_t v9 = (id *)*(id *)(v7 + 40);
  id v10 = v9;
  if (!v9)
  {
LABEL_13:
    uint64_t v11 = 0LL;
    goto LABEL_9;
  }

  uint64_t v11 = [v9[2] _preventsSystemHTTPProxyAuthentication];
LABEL_9:
  (*(void (**)(uint64_t, void, uint64_t))(v8 + 16))(v8, 0LL, v11);

LABEL_11:
}

- (void)handleAuthenticationChallenge:(void *)a3 url:(uint64_t)a4 cancel:(void *)a5 completionHandler:
{
  id v9 = a2;
  id v10 = a3;
  id v12 = a5;
  if (a1)
  {
    -[NWURLLoaderHTTP stopResponseStallTimer](a1, v11);
    ns_protection_space = (void *)nw_authentication_challenge_get_ns_protection_space(v9);
    if (ns_protection_space)
    {
      CFTypeRef v14 = nw_authentication_challenge_copy_http_message(v9);
      if (v14)
      {
        uint64_t v15 = v14;
        id proposed_credential = nw_authentication_challenge_get_proposed_credential(v9);
        uint64_t v17 = proposed_credential;
        if (proposed_credential) {
          ns = (void *)nw_authentication_credential_create_ns(proposed_credential);
        }
        else {
          ns = 0LL;
        }
        uint64_t v19 = (void *)CFURLResponseCreateWithHTTPResponse();
        char v20 = (void *)[objc_alloc(MEMORY[0x189601EB8]) initWithProtectionSpace:ns_protection_space proposedCredential:ns previousFailureCount:nw_authentication_challenge_get_attempt_count(v9) failureResponse:v19 error:0 sender:0];
        CFRelease(v15);
        id v21 = *(void **)(a1 + 48);
        v25[0] = MEMORY[0x1895F87A8];
        v25[1] = 3221225472LL;
        v25[2] = __78__NWURLLoaderHTTP_handleAuthenticationChallenge_url_cancel_completionHandler___block_invoke;
        v25[3] = &unk_189BC5F80;
        v25[4] = a1;
        id v26 = v9;
        id v27 = v19;
        id v28 = v12;
        id v22 = v19;
        [v21 loaderDidReceiveChallenge:v20 completionHandler:v25];

        goto LABEL_8;
      }

      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
      }
      id v23 = (id)gurlLogObj;
      if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

        (*((void (**)(id, void, uint64_t))v12 + 2))(v12, 0LL, a4);
LABEL_8:

        goto LABEL_9;
      }

      *(_WORD *)buf = 0;
      id v24 = "HTTP message is NULL";
    }

    else
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
      }
      id v23 = (id)gurlLogObj;
      if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      *(_WORD *)buf = 0;
      id v24 = "Protection space is NULL";
    }

    _os_log_impl(&dword_181A5C000, (os_log_t)v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_19;
  }

void __78__NWURLLoaderHTTP_handleAuthenticationChallenge_url_cancel_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
}

- (void)handleAuthenticationChallengeResponse:(void *)a3 credential:(void *)a4 challenge:(void *)a5 response:(void *)a6 completionHandler:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (void (**)(void, void, void))v14;
  if (a1)
  {
    switch(a2)
    {
      case 0LL:
        if (!v11) {
          goto LABEL_13;
        }
        id proposed_credential = -[NWConcrete_nw_authentication_credential initWithType:]( objc_alloc(&OBJC_CLASS___NWConcrete_nw_authentication_credential),  1);
        nw_authentication_credential_apply_ns(proposed_credential, v11);
        goto LABEL_6;
      case 1LL:
        id proposed_credential = nw_authentication_challenge_get_proposed_credential(v12);
LABEL_6:
        ((void (**)(void, void *, void))v15)[2](v15, proposed_credential, 0LL);
        goto LABEL_7;
      case 2LL:
        (*((void (**)(id, void, uint64_t))v14 + 2))(v14, 0LL, 1LL);
        break;
      case 3LL:
        if (nw_authentication_challenge_try_next_protection_space(v12))
        {
          id proposed_credential = (void *)nw_authentication_challenge_get_ns_protection_space(v12);
          if (proposed_credential)
          {
            id v17 = nw_authentication_challenge_get_proposed_credential(v12);
            uint64_t v18 = v17;
            if (v17) {
              ns = (void *)nw_authentication_credential_create_ns(v17);
            }
            else {
              ns = 0LL;
            }
            char v20 = (void *)[objc_alloc(MEMORY[0x189601EB8]) initWithProtectionSpace:proposed_credential proposedCredential:ns previousFailureCount:nw_authentication_challenge_get_attempt_count(v12) failureResponse:v13 error:0 sender:0];
            id v21 = *(void **)(a1 + 48);
            v22[0] = MEMORY[0x1895F87A8];
            v22[1] = 3221225472LL;
            v22[2] = __105__NWURLLoaderHTTP_handleAuthenticationChallengeResponse_credential_challenge_response_completionHandler___block_invoke;
            v22[3] = &unk_189BC5F80;
            v22[4] = a1;
            id v23 = v12;
            id v24 = v13;
            uint64_t v25 = v15;
            [v21 loaderDidReceiveChallenge:v20 completionHandler:v22];
          }

          else
          {
            v15[2](v15, 0LL, 0LL);
LABEL_7:
          }
        }

        else
        {
LABEL_13:
          v15[2](v15, 0LL, 0LL);
        }

        break;
      default:
        break;
    }
  }
}

uint64_t __105__NWURLLoaderHTTP_handleAuthenticationChallengeResponse_credential_challenge_response_completionHandler___block_invoke( void *a1,  uint64_t a2,  uint64_t a3)
{
  return -[NWURLLoaderHTTP handleAuthenticationChallengeResponse:credential:challenge:response:completionHandler:]( a1[4],  a2,  a3,  a1[5],  a1[6],  a1[7]);
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_11(uint64_t a1, uint64_t a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setHTTPMethod:v3];
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(a1 + 32) addValue:*(void *)(*((void *)&v11 + 1) + 8 * v10++) forHTTPHeaderField:v5];
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_13(uint64_t a1, void *a2)
{
  id v12 = a2;
  if (v12 && ([v12 URL], uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      objc_storeStrong((id *)(v5 + 24), a2);
    }
    [v12 URL];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    fixed = fixInvalidHTTPURL(v6);
    BOOL v8 = nw_endpoint_create_with_cfurl(fixed);

    uint64_t v9 = (void *)_nw_http_request_create_from_url_request(v12);
    metadata_for_request = nw_http_create_metadata_for_request(v9);
    if (nw_http_request_has_method(v9, (uint64_t)"GET"))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      if (v11) {
        *(void *)(v11 + 32) = 0LL;
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  nw_quic_connection_set_idle_timeout(v2, 0);
  nw_quic_connection_set_keepalive_count(v2, 5);
}

uint64_t __34__NWURLLoaderHTTP_continueLoading__block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 48);
  }
  else {
    uint64_t v5 = 0LL;
  }
  return [v5 loaderDidReceiveServerTrustChallenge:a3 secProtocolMetadata:a2 completionHandler:a4];
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x189603FA8];
  id v6 = a3;
  uint64_t v7 = a2;
  id v8 = objc_alloc_init(v5);
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_4;
  handler[3] = &unk_189BC5BE8;
  id v9 = v8;
  id v14 = v9;
  sec_protocol_metadata_access_distinguished_names(v7, handler);

  uint64_t v10 = *(void **)(a1 + 32);
  if (v10) {
    uint64_t v10 = (void *)v10[6];
  }
  uint64_t v11 = v10;
  id v12 = (void *)[v9 copy];
  [v11 loaderDidReceiveClientCertificateChallenge:v12 completionHandler:v6];
}

uint64_t __34__NWURLLoaderHTTP_continueLoading__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)initWithRequest:(unint64_t)a3 bodyKnownSize:(void *)a4 configuration:(void *)a5 queue:(void *)a6 client:
{
  id v12 = a2;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    v28.receiver = a1;
    v28.super_class = (Class)&OBJC_CLASS___NWURLLoaderHTTP;
    uint64_t v16 = (id *)objc_msgSendSuper2(&v28, sel_init);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 3, a2);
      if ((a3 & 0x8000000000000000LL) != 0)
      {
        [v12 valueForHTTPHeaderField:@"Content-Length"];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v18 = v17;
        if (!v17 || [v17 longLongValue] < 0) {
          uint64_t v19 = -1LL;
        }
        else {
          uint64_t v19 = [v18 longLongValue];
        }
        a1[4] = (id)v19;
      }

      else
      {
        a1[4] = (id)a3;
      }

      objc_storeStrong(a1 + 5, a4);
      objc_storeStrong(a1 + 6, a6);
      objc_storeStrong(a1 + 7, a5);
      char v20 = (id *)a1[5];
      if (v20)
      {
        [v20[2] URLCache];
        id v21 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v21 = 0LL;
      }

      id v22 = objc_alloc(&OBJC_CLASS___NWURLLoaderCache);
      id v23 = v21;
      if (v22)
      {
        v29.receiver = v22;
        v29.super_class = (Class)&OBJC_CLASS___NWURLLoaderCache;
        id v24 = (NWURLLoaderCache *)objc_msgSendSuper2(&v29, sel_init);
        id v22 = v24;
        if (v24)
        {
          objc_storeStrong((id *)&v24->_cache, v21);
          dataToCache = v22->_dataToCache;
          v22->_cacheStoragePolicy = 0LL;
          v22->_dataToCache = 0LL;
        }
      }

      id v26 = a1[12];
      a1[12] = v22;
    }
  }

  return a1;
}

@end