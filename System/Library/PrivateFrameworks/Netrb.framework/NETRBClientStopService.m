@interface NETRBClientStopService
@end

@implementation NETRBClientStopService

void ___NETRBClientStopService_block_invoke(uint64_t a1)
{
  if (!__NETRBClientValidateClient(*(_BYTE **)(a1 + 40))
    && *(_BYTE *)(*(void *)(a1 + 40) + 289LL)
    && (xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL)) != 0LL)
  {
    v3 = v2;
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3EAuLL);
    xpc_dictionary_set_string(v3, netrbXPCClientID, (const char *)(*(void *)(a1 + 40) + 32LL));
    NETRBInfoLog();
    v4 = (_OWORD *)(*(void *)(a1 + 40) + 289LL);
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
    _OWORD *v4 = 0u;
    v4[1] = 0u;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 0x40000000LL;
    v6[2] = ___NETRBClientStopService_block_invoke_2;
    v6[3] = &__block_descriptor_tmp_83_0;
    v5 = *(dispatch_queue_s **)(a1 + 48);
    v6[4] = *(void *)(a1 + 40);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(v5, v3, (uint64_t)v6);
    xpc_release(v3);
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      CFRetain(*(CFTypeRef *)(a1 + 40));
    }
  }

  else
  {
    NETRBErrorLog();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

void ___NETRBClientStopService_block_invoke_2(uint64_t a1, void *a2)
{
}

@end