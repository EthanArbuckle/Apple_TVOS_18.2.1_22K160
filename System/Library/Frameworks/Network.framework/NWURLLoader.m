@interface NWURLLoader
- (BOOL)allowsWrite;
- (BOOL)requestComplete;
- (NSString)multipartMixedReplaceBoundary;
- (OS_nw_connection)underlyingConnection;
- (OS_nw_http_fields)trailerFields;
- (OS_sec_trust)peerTrust;
- (id)initWithRequest:(void *)a3 configuration:(void *)a4 queue:(void *)a5 client:(void *)a6 protocolClass:;
- (id)takeCachedResponse;
- (void)URLProtocol:(id)a3 cachedResponseIsValid:(id)a4;
- (void)URLProtocol:(id)a3 didFailWithError:(id)a4;
- (void)URLProtocol:(id)a3 didLoadData:(id)a4;
- (void)URLProtocol:(id)a3 didReceiveAuthenticationChallenge:(id)a4;
- (void)URLProtocol:(id)a3 didReceiveResponse:(id)a4 cacheStoragePolicy:(unint64_t)a5;
- (void)URLProtocol:(id)a3 wasRedirectedToRequest:(id)a4 redirectResponse:(id)a5;
- (void)URLProtocolDidFinishLoading:(id)a3;
- (void)afterCacheLookup:(uint64_t)a1;
- (void)fulfillData:(int)a3 complete:;
- (void)fulfillError:(uint64_t)a1;
- (void)fulfillResponse:(void *)a1;
- (void)notifyRequestCompletion:(id)a3;
- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5;
- (void)readResponse:(id)a3;
- (void)start:(id)a3;
- (void)stop;
- (void)updateClient:(id)a3;
- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation NWURLLoader

- (void)start:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NWURLSessionReadRequest);
  if (self)
  {
    readRequest = self->_readRequest;
    self->_readRequest = v5;

    v7 = self->_configuration;
    v8 = v7;
    if (v7)
    {
      -[NSURLSessionConfiguration URLCache](v7->_configuration, "URLCache");
      v7 = (NWURLSessionTaskConfiguration *)objc_claimAutoreleasedReturnValue();
    }

    cache = self->_cache;
    self->_cache = (NSURLCache *)v7;

    client = self->_client;
  }

  else
  {

    client = 0LL;
  }

  v11 = client;
  v12 = -[NWURLLoaderClient loaderDataTask](v11, "loaderDataTask");
  if (self && self->_cache && v12)
  {
    v13 = self->_client;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __21__NWURLLoader_start___block_invoke;
    v14[3] = &unk_189BC9238;
    v14[4] = self;
    id v15 = v12;
    -[NWURLLoaderClient loaderRunDelegateBlock:](v13, "loaderRunDelegateBlock:", v14);
  }

  else
  {
    -[NWURLLoader afterCacheLookup:]((uint64_t)self, 0LL);
  }

  v4[2](v4);
}

- (void)stop
{
  if (self)
  {
    v3 = objc_alloc(&OBJC_CLASS___NWURLError);
    v4 = -[NWURLLoaderClient loaderTask](self->_client, "loaderTask");
    v5 = self;
    id v6 = v4;
    if (v3)
    {
      uint64_t v7 = *MEMORY[0x189607740];
      v12.receiver = v3;
      v12.super_class = (Class)&OBJC_CLASS___NWURLError;
      v8 = -[NWURLLoader initWithDomain:code:userInfo:](&v12, sel_initWithDomain_code_userInfo_, v7, -999LL, 0LL);
      v3 = (NWURLError *)v8;
      if (v8) {
        -[NWURLLoader fillErrorForLoader:andTask:](v8, "fillErrorForLoader:andTask:", v5, v6);
      }
    }

    -[NWURLLoader fulfillError:]((uint64_t)v5, v3);
    client = self->_client;
  }

  else
  {
    client = 0LL;
  }

  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __19__NWURLLoader_stop__block_invoke;
  v11[3] = &unk_189BC93A0;
  v11[4] = self;
  -[NWURLLoaderClient loaderRunDelegateBlock:](client, "loaderRunDelegateBlock:", v11);
  if (self)
  {
    v10 = self->_client;
    self->_client = 0LL;
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
  id v4 = a3;
  id v5 = v4;
  if (self)
  {
    id v7 = v4;
    if (self->_error)
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    }

    else
    {
      response = self->_response;
      if (response) {
        (*((void (**)(id, NSURLResponse *, void))v4 + 2))(v4, response, 0LL);
      }
      else {
        objc_setProperty_nonatomic_copy(self, 0LL, v4, 104LL);
      }
    }

    id v5 = v7;
  }
}

- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  if (self)
  {
    readRequest = self->_readRequest;
    if (readRequest)
    {
      readRequest->_minimumLength = a3;
      readRequest->_maximumLength = a4;
      objc_setProperty_nonatomic_copy(readRequest, a2, a5, 32LL);
      -[NWURLSessionReadRequest tryFulfillRequest]((uint64_t)readRequest);
    }
  }

- (NSString)multipartMixedReplaceBoundary
{
  return 0LL;
}

- (OS_sec_trust)peerTrust
{
  return 0LL;
}

- (BOOL)requestComplete
{
  return 1;
}

- (void)notifyRequestCompletion:(id)a3
{
}

- (id)takeCachedResponse
{
  if (self)
  {
    v3 = self->_cachedResponseInternal;
    cachedResponseInternal = self->_cachedResponseInternal;
    self->_cachedResponseInternal = 0LL;
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

- (OS_nw_http_fields)trailerFields
{
  return 0LL;
}

- (BOOL)allowsWrite
{
  return 0;
}

- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  _os_crash();
  __break(1u);
}

- (OS_nw_connection)underlyingConnection
{
  result = (OS_nw_connection *)_os_crash();
  __break(1u);
  return result;
}

- (void)URLProtocol:(id)a3 wasRedirectedToRequest:(id)a4 redirectResponse:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = v8;
  if (self) {
    queue = (dispatch_queue_s *)self->_queue;
  }
  else {
    queue = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __67__NWURLLoader_URLProtocol_wasRedirectedToRequest_redirectResponse___block_invoke;
  block[3] = &unk_189BC6E60;
  block[4] = self;
  id v14 = v8;
  id v15 = v7;
  id v11 = v7;
  id v12 = v9;
  dispatch_async(queue, block);
}

- (void)URLProtocol:(id)a3 cachedResponseIsValid:(id)a4
{
  id v5 = a4;
  if (self) {
    queue = (dispatch_queue_s *)self->_queue;
  }
  else {
    queue = 0LL;
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __49__NWURLLoader_URLProtocol_cachedResponseIsValid___block_invoke;
  v8[3] = &unk_189BC9238;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)URLProtocol:(id)a3 didReceiveResponse:(id)a4 cacheStoragePolicy:(unint64_t)a5
{
  id v7 = a4;
  if (self) {
    client = self->_client;
  }
  else {
    client = 0LL;
  }
  -[NWURLLoaderClient loaderDataTask](client, "loaderDataTask");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    unint64_t v10 = a5;
    if (!a5) {
      goto LABEL_11;
    }
    if (a5 == 1)
    {
      if (self) {
        cache = self->_cache;
      }
      else {
        cache = 0LL;
      }
      id v12 = cache;
      double v13 = (double)-[NSURLCache memoryCapacity](v12, "memoryCapacity");
      if (self) {
        id v14 = self->_cache;
      }
      else {
        id v14 = 0LL;
      }
      -[NSURLCache _maxCacheableEntrySizeRatio](v14, "_maxCacheableEntrySizeRatio");
      unint64_t v10 = (unint64_t)(v15 * v13);

LABEL_11:
      if (self) {
        v16 = self->_cache;
      }
      else {
        v16 = 0LL;
      }
      v17 = v16;
      double v18 = (double)-[NSURLCache diskCapacity](v17, "diskCapacity");
      if (self) {
        v19 = self->_cache;
      }
      else {
        v19 = 0LL;
      }
      -[NSURLCache _maxCacheableEntrySizeRatio](v19, "_maxCacheableEntrySizeRatio");
      unint64_t v21 = (unint64_t)(v20 * v18);

      if (v10 <= v21) {
        unint64_t v22 = v21;
      }
      else {
        unint64_t v22 = v10;
      }
      if (self) {
        goto LABEL_19;
      }
LABEL_22:
      queue = 0LL;
      goto LABEL_20;
    }
  }

  unint64_t v22 = 0LL;
  if (!self) {
    goto LABEL_22;
  }
LABEL_19:
  queue = (dispatch_queue_s *)self->_queue;
LABEL_20:
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __65__NWURLLoader_URLProtocol_didReceiveResponse_cacheStoragePolicy___block_invoke;
  v25[3] = &unk_189BC0C00;
  id v26 = v7;
  v27 = self;
  unint64_t v28 = v22;
  unint64_t v29 = a5;
  id v24 = v7;
  dispatch_async(queue, v25);
}

- (void)URLProtocol:(id)a3 didLoadData:(id)a4
{
  id v5 = a4;
  if (self) {
    queue = (dispatch_queue_s *)self->_queue;
  }
  else {
    queue = 0LL;
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __39__NWURLLoader_URLProtocol_didLoadData___block_invoke;
  v8[3] = &unk_189BC9238;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)URLProtocolDidFinishLoading:(id)a3
{
  if (self) {
    queue = (dispatch_queue_s *)self->_queue;
  }
  else {
    queue = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__NWURLLoader_URLProtocolDidFinishLoading___block_invoke;
  block[3] = &unk_189BC93A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)URLProtocol:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  if (self) {
    queue = (dispatch_queue_s *)self->_queue;
  }
  else {
    queue = 0LL;
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __44__NWURLLoader_URLProtocol_didFailWithError___block_invoke;
  v8[3] = &unk_189BC9238;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)URLProtocol:(id)a3 didReceiveAuthenticationChallenge:(id)a4
{
  id v5 = a4;
  if (self) {
    queue = (dispatch_queue_s *)self->_queue;
  }
  else {
    queue = 0LL;
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __61__NWURLLoader_URLProtocol_didReceiveAuthenticationChallenge___block_invoke;
  v8[3] = &unk_189BC9238;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void).cxx_destruct
{
}

void __61__NWURLLoader_URLProtocol_didReceiveAuthenticationChallenge___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    v2 = *(void **)(v1 + 32);
  }
  else {
    v2 = 0LL;
  }
  v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __61__NWURLLoader_URLProtocol_didReceiveAuthenticationChallenge___block_invoke_2;
  v4[3] = &unk_189BC0C28;
  v4[4] = v1;
  id v5 = v3;
  [v2 loaderDidReceiveChallenge:v5 completionHandler:v4];
}

void __61__NWURLLoader_URLProtocol_didReceiveAuthenticationChallenge___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    id v8 = *(void **)(v7 + 32);
  }
  else {
    id v8 = 0LL;
  }
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __61__NWURLLoader_URLProtocol_didReceiveAuthenticationChallenge___block_invoke_3;
  v10[3] = &unk_189BC75E8;
  uint64_t v13 = a2;
  id v11 = v5;
  id v12 = *(id *)(a1 + 40);
  id v9 = v6;
  [v8 loaderRunDelegateBlock:v10];
}

void __61__NWURLLoader_URLProtocol_didReceiveAuthenticationChallenge___block_invoke_3(uint64_t a1)
{
  switch(*(void *)(a1 + 48))
  {
    case 0LL:
      uint64_t v2 = *(void *)(a1 + 32);
      [*(id *)(a1 + 40) sender];
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      id v4 = v3;
      if (v2) {
        [v3 useCredential:*(void *)(a1 + 32) forAuthenticationChallenge:*(void *)(a1 + 40)];
      }
      else {
        [v3 continueWithoutCredentialForAuthenticationChallenge:*(void *)(a1 + 40)];
      }
      goto LABEL_7;
    case 1LL:
      [*(id *)(a1 + 40) sender];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      [v4 performDefaultHandlingForAuthenticationChallenge:*(void *)(a1 + 40)];
      goto LABEL_7;
    case 2LL:
      [*(id *)(a1 + 40) sender];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      [v4 cancelAuthenticationChallenge:*(void *)(a1 + 40)];
      goto LABEL_7;
    case 3LL:
      [*(id *)(a1 + 40) sender];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      [v4 rejectProtectionSpaceAndContinueWithChallenge:*(void *)(a1 + 40)];
LABEL_7:

      break;
    default:
      return;
  }

void __44__NWURLLoader_URLProtocol_didFailWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) code];
  if (v2)
  {
    uint64_t v4 = v3;
    id v5 = objc_alloc(&OBJC_CLASS___NWURLError);
    [v2[4] loaderTask];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = v2;
    id v8 = v6;
    if (v5
      && (uint64_t v9 = *MEMORY[0x189607740],
          v12.receiver = v5,
          v12.super_class = (Class)&OBJC_CLASS___NWURLError,
          (id v10 = objc_msgSendSuper2(&v12, sel_initWithDomain_code_userInfo_, v9, v4, 0)) != 0))
    {
      id v11 = v10;
      [v10 fillErrorForLoader:v7 andTask:v8];
    }

    else
    {
      id v11 = 0LL;
    }

    [v11 setUnderlyingError:*(void *)(a1 + 40)];
  }

  else
  {
    id v11 = 0LL;
    [0 setUnderlyingError:*(void *)(a1 + 40)];
  }

  -[NWURLLoader fulfillError:](*(void *)(a1 + 32), v11);
}

- (void)fulfillError:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v8 = v4;
    if (!*(_BYTE *)(a1 + 8) && !*(void *)(a1 + 128)) {
      objc_storeStrong((id *)(a1 + 128), a2);
    }
    id v5 = *(void **)(a1 + 104);
    if (v5)
    {
      id v6 = v5;
      objc_setProperty_nonatomic_copy((id)a1, v7, 0LL, 104LL);
      v6[2](v6, 0LL, v8);
    }

    -[NWURLSessionReadRequest putError:](*(void *)(a1 + 120), v8);
    id v4 = v8;
  }
}

void __43__NWURLLoader_URLProtocolDidFinishLoading___block_invoke(uint64_t a1)
{
}

- (void)fulfillData:(int)a3 complete:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = *(dispatch_data_s **)(a1 + 80);
    data2 = v5;
    if (v5)
    {
      if (v6)
      {
        SEL v7 = v6;
        dispatch_data_t concat = dispatch_data_create_concat(v7, data2);
        uint64_t v9 = *(void **)(a1 + 80);
        *(void *)(a1 + 80) = concat;

        id v6 = *(dispatch_data_s **)(a1 + 80);
        if (dispatch_data_get_size(v6) > *(void *)(a1 + 96))
        {
          *(void *)(a1 + 80) = 0LL;

          id v6 = *(dispatch_data_s **)(a1 + 80);
        }
      }
    }

    if (v6 && a3)
    {
      id v10 = objc_alloc(MEMORY[0x189601E88]);
      id v11 = *(void **)(a1 + 112);
      uint64_t v12 = *(void *)(a1 + 72);
      id v13 = *(id *)(a1 + 80);
      id v14 = v11;
      uint64_t v15 = [v10 initWithResponse:v14 data:v13 userInfo:0 storagePolicy:v12];
      v16 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v15;

      v17 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = 0LL;
    }

    *(_BYTE *)(a1 + 8) = a3;
    -[NWURLSessionReadRequest putData:complete:](*(void *)(a1 + 120), data2, a3);
    id v5 = data2;
  }
}

void __39__NWURLLoader_URLProtocol_didLoadData___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) _createDispatchData];
  -[NWURLLoader fulfillData:complete:](v1, v2, 0);
}

void __65__NWURLLoader_URLProtocol_didReceiveResponse_cacheStoragePolicy___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    if ([*(id *)(a1 + 32) expectedContentLength] <= *(void *)(a1 + 48))
    {
      uint64_t v2 = *(void *)(a1 + 40);
      if (v2)
      {
        *(void *)(v2 + 72) = *(void *)(a1 + 56);
        uint64_t v3 = *(void *)(a1 + 40);
        if (v3)
        {
          objc_storeStrong((id *)(v3 + 80), MEMORY[0x1895F8AA8]);
          uint64_t v4 = *(void *)(a1 + 40);
          if (v4) {
            *(void *)(v4 + 96) = *(void *)(a1 + 48);
          }
        }
      }
    }
  }

  -[NWURLLoader fulfillResponse:](*(void **)(a1 + 40), *(void **)(a1 + 32));
}

- (void)fulfillResponse:(void *)a1
{
  id v7 = a2;
  if (a1)
  {
    uint64_t v3 = (void *)a1[13];
    if (v3)
    {
      uint64_t v4 = v3;
      objc_setProperty_nonatomic_copy(a1, v5, 0LL, 104LL);
      v4[2](v4, v7, 0LL);
    }

    else
    {
      id v6 = v7;
      uint64_t v4 = (void (**)(id, id, void))a1[14];
      a1[14] = v6;
    }
  }
}

void __49__NWURLLoader_URLProtocol_cachedResponseIsValid___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) response];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLLoader fulfillResponse:](v2, v3);

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    SEL v5 = *(void **)(v4 + 32);
  }
  else {
    SEL v5 = 0LL;
  }
  uint64_t v6 = [v5 loaderDataTask];
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = (id)v6;
  if (v6 && v7)
  {
    objc_storeStrong((id *)(v7 + 88), *(id *)(a1 + 40));
    uint64_t v7 = *(void *)(a1 + 32);
  }

  [*(id *)(a1 + 40) data];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)[v8 _createDispatchData];
  -[NWURLLoader fulfillData:complete:](v7, v9, 1);
}

uint64_t __67__NWURLLoader_URLProtocol_wasRedirectedToRequest_redirectResponse___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  if (v1) {
    uint64_t v1 = (void *)v1[4];
  }
  return [v1 loaderWillPerformHTTPRedirection:a1[5] newRequest:a1[6]];
}

void __19__NWURLLoader_stop__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 64);
  }
  else {
    uint64_t v3 = 0LL;
  }
  [v3 stopLoading];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    SEL v5 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = 0LL;
  }

uint64_t __21__NWURLLoader_start___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 56);
  }
  else {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __21__NWURLLoader_start___block_invoke_2;
  v6[3] = &unk_189BC5B48;
  v6[4] = v2;
  return [v3 getCachedResponseForDataTask:v4 completionHandler:v6];
}

- (void)afterCacheLookup:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 && !*(void *)(a1 + 128))
  {
    SEL v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __32__NWURLLoader_afterCacheLookup___block_invoke;
    v6[3] = &unk_189BC9238;
    v6[4] = a1;
    id v7 = v3;
    [v5 loaderRunDelegateBlock:v6];
  }
}

void __32__NWURLLoader_afterCacheLookup___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(objc_class **)(v2 + 48);
  }
  else {
    id v3 = 0LL;
  }
  id v4 = objc_alloc(v3);
  SEL v5 = *(void **)(a1 + 32);
  if (v5) {
    SEL v5 = (void *)v5[4];
  }
  uint64_t v6 = v5;
  [v6 loaderTask];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = (void *)[v4 initWithTask:v7 cachedResponse:*(void *)(a1 + 40) client:*(void *)(a1 + 32)];
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    objc_storeStrong((id *)(v9 + 64), v8);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    id v11 = *(void **)(v10 + 64);
  }
  else {
    id v11 = 0LL;
  }
  [v11 startLoading];
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    if (*(void *)(v12 + 64)) {
      return;
    }
    id v13 = *(dispatch_queue_s **)(v12 + 40);
  }

  else
  {
    id v13 = 0LL;
  }

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __32__NWURLLoader_afterCacheLookup___block_invoke_2;
  block[3] = &unk_189BC93A0;
  block[4] = v12;
  dispatch_async(v13, block);
}

void __32__NWURLLoader_afterCacheLookup___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(id **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = objc_alloc(&OBJC_CLASS___NWURLError);
    [v1[4] loaderTask];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = v1;
    id v5 = v3;
    if (v2
      && (uint64_t v6 = *MEMORY[0x189607740],
          v8.receiver = v2,
          v8.super_class = (Class)&OBJC_CLASS___NWURLError,
          (id v7 = objc_msgSendSuper2(&v8, sel_initWithDomain_code_userInfo_, v6, -999, 0)) != 0))
    {
      [v7 fillErrorForLoader:v4 andTask:v5];
    }

    else
    {
      id v7 = 0LL;
    }

    -[NWURLLoader fulfillError:]((uint64_t)v4, v7);
  }

  else
  {
  }

void __21__NWURLLoader_start___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(dispatch_queue_s **)(v4 + 40);
  }
  else {
    id v5 = 0LL;
  }
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __21__NWURLLoader_start___block_invoke_3;
  v7[3] = &unk_189BC9238;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __21__NWURLLoader_start___block_invoke_3(uint64_t a1)
{
}

- (id)initWithRequest:(void *)a3 configuration:(void *)a4 queue:(void *)a5 client:(void *)a6 protocolClass:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)&OBJC_CLASS___NWURLLoader;
    a1 = (id *)objc_msgSendSuper2(&v18, sel_init);
    if (a1)
    {
      uint64_t v15 = [a6 canonicalRequestForRequest:v11];
      id v16 = a1[2];
      a1[2] = (id)v15;

      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a5);
      objc_storeStrong(a1 + 5, a4);
      objc_storeStrong(a1 + 6, a6);
    }
  }

  return a1;
}

void __111__NWURLLoader_makeLoaderForRequest_bodyKnownSize_configuration_queue_client_protocolClasses_completionHandler___block_invoke( id *a1)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (id *)a1[4];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v3 = a1[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [a1[6] loaderTask];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        int v10 = [v8 canInitWithTask:v9];

        if (v10)
        {
          id v11 = -[NWURLLoader initWithRequest:configuration:queue:client:protocolClass:]( (id *)objc_alloc(&OBJC_CLASS___NWURLLoader),  a1[7],  a1[8],  a1[9],  a1[6],  v8);

          uint64_t v2 = v11;
          goto LABEL_11;
        }
      }

      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

uint64_t __111__NWURLLoader_makeLoaderForRequest_bodyKnownSize_configuration_queue_client_protocolClasses_completionHandler___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

@end