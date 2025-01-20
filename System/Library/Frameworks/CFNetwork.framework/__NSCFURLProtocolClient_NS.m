@interface __NSCFURLProtocolClient_NS
- (id)challenge;
- (void)URLProtocol:(id)a3 cachedResponseIsValid:(id)a4;
- (void)URLProtocol:(id)a3 didFailWithError:(id)a4;
- (void)URLProtocol:(id)a3 didLoadData:(id)a4;
- (void)URLProtocol:(id)a3 didReceiveAuthenticationChallenge:(id)a4;
- (void)URLProtocol:(id)a3 didReceiveResponse:(id)a4 cacheStoragePolicy:(unint64_t)a5;
- (void)URLProtocol:(id)a3 wasRedirectedToRequest:(id)a4 redirectResponse:(id)a5;
- (void)URLProtocolDidFinishLoading:(id)a3;
- (void)dealloc;
- (void)withCustomProtocolScheduling:(void *)a1;
@end

@implementation __NSCFURLProtocolClient_NS

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS_____NSCFURLProtocolClient_NS;
  -[__NSCFURLProtocolClient_NS dealloc](&v2, sel_dealloc);
}

- (void)URLProtocol:(id)a3 wasRedirectedToRequest:(id)a4 redirectResponse:(id)a5
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __82____NSCFURLProtocolClient_NS_URLProtocol_wasRedirectedToRequest_redirectResponse___block_invoke;
  v5[3] = &unk_189C1A610;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v5);
}

- (void)URLProtocol:(id)a3 cachedResponseIsValid:(id)a4
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __64____NSCFURLProtocolClient_NS_URLProtocol_cachedResponseIsValid___block_invoke;
  v4[3] = &unk_189C1A270;
  v4[4] = self;
  v4[5] = a4;
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v4);
}

- (void)URLProtocol:(id)a3 didReceiveResponse:(id)a4 cacheStoragePolicy:(unint64_t)a5
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __80____NSCFURLProtocolClient_NS_URLProtocol_didReceiveResponse_cacheStoragePolicy___block_invoke;
  v5[3] = &unk_189C194B0;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v5);
}

- (void)URLProtocol:(id)a3 didLoadData:(id)a4
{
  if (a4)
  {
    uint64_t v6 = objc_msgSend(a4, "length", a3);
    if (v6)
    {
      uint64_t v7 = v6;
      CFDataRef Copy = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], (CFDataRef)a4);
      if (Copy)
      {
        v9[0] = MEMORY[0x1895F87A8];
        v9[1] = 3221225472LL;
        v9[2] = __54____NSCFURLProtocolClient_NS_URLProtocol_didLoadData___block_invoke;
        v9[3] = &unk_189C10E30;
        v9[4] = self;
        v9[5] = Copy;
        v9[6] = v7;
        -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v9);
      }
    }
  }

- (void)URLProtocolDidFinishLoading:(id)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __58____NSCFURLProtocolClient_NS_URLProtocolDidFinishLoading___block_invoke;
  v3[3] = &unk_189C1A548;
  v3[4] = self;
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v3);
}

- (void)URLProtocol:(id)a3 didFailWithError:(id)a4
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __59____NSCFURLProtocolClient_NS_URLProtocol_didFailWithError___block_invoke;
  v4[3] = &unk_189C1A270;
  v4[4] = self;
  v4[5] = a4;
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v4);
}

- (void)URLProtocol:(id)a3 didReceiveAuthenticationChallenge:(id)a4
{
  self->_challenge = (NSURLAuthenticationChallenge *)a4;
  self->_cfChallenge = (_CFURLAuthChallenge *)[a4 _createCFAuthChallenge];
  objc_sync_exit(self);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __76____NSCFURLProtocolClient_NS_URLProtocol_didReceiveAuthenticationChallenge___block_invoke;
  v6[3] = &unk_189C1A548;
  v6[4] = self;
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v6);
}

- (void)withCustomProtocolScheduling:(void *)a1
{
  if (a1)
  {
    if (-[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:]::sOnce != -1) {
      dispatch_once(&-[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:]::sOnce, &__block_literal_global);
    }
    uint64_t v8 = 0LL;
    v9 = &v8;
    uint64_t v10 = 0x2020000000LL;
    char v11 = 0;
    uint64_t v4 = MEMORY[0x1895F87A8];
    v7[0] = (void (*)(void, void, void))MEMORY[0x1895F87A8];
    v7[1] = (void (*)(void, void, void))3221225472LL;
    v7[2] = (void (*)(void, void, void))__59____NSCFURLProtocolClient_NS_withCustomProtocolScheduling___block_invoke_2;
    v7[3] = (void (*)(void, void, void))&unk_189C19378;
    v7[4] = (void (*)(void, void, void))&v8;
    CoreSchedulingSet::applyBlock(-[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:]::sProtocolScheduling, v7);
    if (*((_BYTE *)v9 + 24))
    {
      (*(void (**)(uint64_t))(a2 + 16))(a2);
    }

    else
    {
      id v5 = a1;
      v6[0] = v4;
      v6[1] = 3221225472LL;
      v6[2] = __59____NSCFURLProtocolClient_NS_withCustomProtocolScheduling___block_invoke_3;
      v6[3] = &unk_189C1A2E8;
      v6[4] = a1;
      void v6[5] = a2;
      (*(void (**)(uint64_t, void *))(*(void *)-[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:]::sProtocolScheduling
                                                + 96LL))( -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:]::sProtocolScheduling,  v6);
    }

    _Block_object_dispose(&v8, 8);
  }

- (id)challenge
{
  if (result)
  {
    v1 = result;
    objc_sync_enter(result);
    id v2 = v1[3];
    objc_sync_exit(v1);
    return (id *)v2;
  }

  return result;
}

@end