@interface NSCFURLProtocolClient
@end

@implementation NSCFURLProtocolClient

uint64_t __76____NSCFURLProtocolClient_NS_URLProtocol_didReceiveAuthenticationChallenge___block_invoke( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(v1 + 8);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(*(void *)result + 104LL))(result, *(void *)(v1 + 32));
  }
  return result;
}

CFRunLoopRef __59____NSCFURLProtocolClient_NS_withCustomProtocolScheduling___block_invoke_2( uint64_t a1,  __CFRunLoop *a2)
{
  CFRunLoopRef result = CFRunLoopGetCurrent();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result == a2;
  return result;
}

void __59____NSCFURLProtocolClient_NS_withCustomProtocolScheduling___block_invoke_3(uint64_t a1)
{
}

uint64_t __59____NSCFURLProtocolClient_NS_withCustomProtocolScheduling___block_invoke()
{
  uint64_t result = _copyPrivateProtocolSchedulingSet();
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:]::sProtocolScheduling = result;
  return result;
}

uint64_t __59____NSCFURLProtocolClient_NS_URLProtocol_didFailWithError___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(*(void *)result + 96LL))(result, *(void *)(a1 + 40));
  }
  return result;
}

uint64_t __58____NSCFURLProtocolClient_NS_URLProtocolDidFinishLoading___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 8);
  if (v3)
  {
    (*(void (**)(uint64_t))(*(void *)v3 + 88LL))(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  uint64_t result = *(void *)(v2 + 16);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 64LL))(result);
  }
  return result;
}

void __54____NSCFURLProtocolClient_NS_URLProtocol_didLoadData___block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 8LL);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(*(void *)v2 + 72LL))(v2, a1[5], a1[6]);
  }
  uint64_t v3 = (const void *)a1[5];
  if (v3) {
    CFRelease(v3);
  }
}

uint64_t __80____NSCFURLProtocolClient_NS_URLProtocol_didReceiveResponse_cacheStoragePolicy___block_invoke( uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 8LL))
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 48);
    *(_DWORD *)([*(id *)(result + 40) _inner] + 72) = v2;
    return (*(uint64_t (**)(void, void))(**(void **)(*(void *)(v1 + 32) + 8LL) + 64LL))( *(void *)(*(void *)(v1 + 32) + 8LL),  *(void *)(v1 + 40));
  }

  return result;
}

uint64_t __64____NSCFURLProtocolClient_NS_URLProtocol_cachedResponseIsValid___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8LL);
  if (v1) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v1 + 48))( v1,  [*(id *)(result + 40) _CFCachedURLResponse]);
  }
  return result;
}

uint64_t __82____NSCFURLProtocolClient_NS_URLProtocol_wasRedirectedToRequest_redirectResponse___block_invoke( void *a1)
{
  uint64_t result = *(void *)(a1[4] + 8LL);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(*(void *)result + 40LL))(result, a1[5], a1[6]);
  }
  return result;
}

void __38____NSCFURLProtocolClient_NS_teardown__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  if (v3)
  {
    CFRelease((CFTypeRef)(v3 - 16));
    *(void *)(*(void *)(a1 + 32) + 16LL) = 0LL;
    uint64_t v2 = *(void **)(a1 + 32);
  }

  uint64_t v4 = v2[1];
  if (v4)
  {
    (*(void (**)(uint64_t))(*(void *)v4 + 24LL))(v4);
    *(void *)(*(void *)(a1 + 32) + 8LL) = 0LL;
    uint64_t v2 = *(void **)(a1 + 32);
  }

  objc_sync_enter(v2);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = 0LL;
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(const void **)(v7 + 32);
  *(void *)(v7 + 32) = 0LL;
  objc_sync_exit(v2);

  if (v8) {
    CFRelease(v8);
  }
}

@end