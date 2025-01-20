@interface CFHTTPAuthenticationAskAccountsForCreds
@end

@implementation CFHTTPAuthenticationAskAccountsForCreds

uint64_t ___CFHTTPAuthenticationAskAccountsForCreds_block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  if (*(_DWORD *)(a2 + 48) != 2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  uint64_t v4 = *(void *)(a1 + 40);
  CFTypeRef v5 = (CFTypeRef)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 16) + 128LL))(a2 + 16);
  CFTypeRef v6 = (CFTypeRef)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 16) + 136LL))(a2 + 16);
  CFTypeRef v7 = (CFTypeRef)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 16) + 144LL))(a2 + 16);
  if (v5) {
    CFTypeRef v5 = CFRetain(v5);
  }
  if (v4) {
    v8 = (void *)(v4 + 16);
  }
  else {
    v8 = 0LL;
  }
  v9 = (const void *)v8[24];
  v8[24] = v5;
  if (v9) {
    CFRelease(v9);
  }
  if (v6) {
    CFTypeRef v6 = CFRetain(v6);
  }
  v10 = (const void *)v8[25];
  v8[25] = v6;
  if (v10) {
    CFRelease(v10);
  }
  if (v7) {
    CFTypeRef v7 = CFRetain(v7);
  }
  v11 = (const void *)v8[26];
  v8[26] = v7;
  if (v11)
  {
    CFRelease(v11);
    uint64_t v12 = *(void *)(a1 + 40);
    v13 = *(const void **)(a1 + 56);
  }

  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    v13 = *(const void **)(a1 + 56);
  }

  uint64_t v14 = v12 ? v12 + 16 : 0LL;
  CFDictionaryGetValue(*(CFDictionaryRef *)(v14 + 152), v13);
  if (!HTTPAuthentication::createNegotiateHeaderForRequest_Mac(v14)) {
    return _CFHTTPAuthenticationAskAccountsForCreds( *(void *)(a1 + 40),  *(void *)(a1 + 64),  *(KerberosAccountBroker **)(a1 + 72),  *(__CFData **)(a1 + 80));
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

@end