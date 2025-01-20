@interface NETRBClientResponseHandler
@end

@implementation NETRBClientResponseHandler

void ____NETRBClientResponseHandler_block_invoke(uint64_t a1)
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = ____NETRBClientResponseHandler_block_invoke_2;
  block[3] = &unk_18A133168;
  block[4] = &v7;
  int v6 = *(_DWORD *)(a1 + 56);
  __int128 v4 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
  if (!*((_DWORD *)v8 + 6)) {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 24LL) + 16LL))();
  }
  v2 = *(void **)(a1 + 48);
  if (v2) {
    xpc_release(v2);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
  _Block_object_dispose(&v7, 8);
}

double ____NETRBClientResponseHandler_block_invoke_2(uint64_t a1)
{
  int v2 = __NETRBClientValidateClient(*(_BYTE **)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v2;
  if (!v2 && *(_DWORD *)(a1 + 64) == 1001)
  {
    if (!strncmp(*(const char **)(a1 + 48), (const char *)(*(void *)(a1 + 40) + 289LL), 0x100uLL)
      || (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1, *(_DWORD *)(a1 + 64) == 1001))
    {
      if (xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), (const char *)netrbClientNotificationKey) == 5003)
      {
        __int128 v4 = (_OWORD *)(*(void *)(a1 + 40) + 289LL);
        double result = 0.0;
        v4[14] = 0u;
        v4[15] = 0u;
        v4[12] = 0u;
        v4[13] = 0u;
        v4[10] = 0u;
        v4[11] = 0u;
        v4[8] = 0u;
        v4[9] = 0u;
        v4[6] = 0u;
        v4[7] = 0u;
        v4[4] = 0u;
        v4[5] = 0u;
        v4[2] = 0u;
        v4[3] = 0u;
        *__int128 v4 = 0u;
        v4[1] = 0u;
      }
    }
  }

  return result;
}

@end