@interface NETRBClientDestroy
@end

@implementation NETRBClientDestroy

void ___NETRBClientDestroy_block_invoke(uint64_t a1)
{
  if (__NETRBClientValidateClient(*(_BYTE **)(a1 + 48)))
  {
    NETRBErrorLog();
LABEL_3:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    return;
  }

  *(_BYTE *)(*(void *)(a1 + 48) + 288LL) = 0;
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v2)
  {
    NETRBErrorLog();
    __NETRBClientRemoveFromList(*(const void **)(a1 + 48));
    CFRelease(*(CFTypeRef *)(a1 + 48));
    goto LABEL_3;
  }

  v3 = v2;
  xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3F4uLL);
  xpc_dictionary_set_string(v3, netrbXPCClientID, (const char *)(*(void *)(a1 + 48) + 32LL));
  NETRBInfoLog();
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 0x40000000LL;
  v4[2] = ___NETRBClientDestroy_block_invoke_2;
  v4[3] = &unk_18A132A28;
  __int128 v5 = *(_OWORD *)(a1 + 40);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(0LL, v3, (uint64_t)v4);
  xpc_release(v3);
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    __NETRBClientRemoveFromList(*(const void **)(a1 + 48));
    CFRelease(*(CFTypeRef *)(a1 + 48));
  }

void ___NETRBClientDestroy_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(a2, netrbXPCResponse);
  }
  __NETRBClientRemoveFromList(*(const void **)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end