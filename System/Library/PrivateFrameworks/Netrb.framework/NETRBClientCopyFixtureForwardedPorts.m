@interface NETRBClientCopyFixtureForwardedPorts
@end

@implementation NETRBClientCopyFixtureForwardedPorts

void ___NETRBClientCopyFixtureForwardedPorts_block_invoke(uint64_t a1)
{
  if (__NETRBClientValidateClient(*(_BYTE **)(a1 + 64))
    || (xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL)) == 0LL)
  {
    NETRBErrorLog();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

  else
  {
    v3 = v2;
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3EDuLL);
    xpc_dictionary_set_string(v3, netrbXPCClientID, (const char *)(*(void *)(a1 + 64) + 32LL));
    NETRBInfoLog();
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 0x40000000LL;
    v5[2] = ___NETRBClientCopyFixtureForwardedPorts_block_invoke_2;
    v5[3] = &unk_18A132C20;
    __int128 v4 = *(_OWORD *)(a1 + 56);
    __int128 v6 = *(_OWORD *)(a1 + 40);
    __int128 v7 = v4;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(0LL, v3, (uint64_t)v5);
    xpc_release(v3);
  }

uint64_t ___NETRBClientCopyFixtureForwardedPorts_block_invoke_2(void *a1, void *a2)
{
  uint64_t result = NETRBInfoLog();
  if (a2)
  {
    uint64_t result = xpc_dictionary_get_uint64(a2, netrbXPCResponse);
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(a1[4] + 8LL) + 24LL) == 2001LL)
    {
      *(_WORD *)(*(void *)(a1[5] + 8LL) + 24LL) = xpc_dictionary_get_uint64(a2, netrbXPCForwardedLowPort);
      uint64_t result = xpc_dictionary_get_uint64(a2, netrbXPCForwardedHighPort);
      *(_WORD *)(*(void *)(a1[6] + 8LL) + 24LL) = result;
    }
  }

  return result;
}

@end