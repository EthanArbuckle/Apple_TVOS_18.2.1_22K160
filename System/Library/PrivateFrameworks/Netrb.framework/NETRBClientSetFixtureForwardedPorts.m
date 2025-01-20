@interface NETRBClientSetFixtureForwardedPorts
@end

@implementation NETRBClientSetFixtureForwardedPorts

void ___NETRBClientSetFixtureForwardedPorts_block_invoke(uint64_t a1)
{
  if (__NETRBClientValidateClient(*(_BYTE **)(a1 + 48))
    || (xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL)) == 0LL)
  {
    NETRBErrorLog();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

  else
  {
    v3 = v2;
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3EEuLL);
    xpc_dictionary_set_string(v3, netrbXPCClientID, (const char *)(*(void *)(a1 + 48) + 32LL));
    v4 = netrbXPCForwardedLowPort;
    uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), (const char *)netrbClientForwardedLowPort);
    xpc_dictionary_set_uint64(v3, v4, uint64);
    v6 = netrbXPCForwardedHighPort;
    uint64_t v7 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), (const char *)netrbClientForwardedHighPort);
    xpc_dictionary_set_uint64(v3, v6, v7);
    NETRBInfoLog();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 0x40000000LL;
    v8[2] = ___NETRBClientSetFixtureForwardedPorts_block_invoke_2;
    v8[3] = &unk_18A132C70;
    __int128 v9 = *(_OWORD *)(a1 + 40);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(0LL, v3, (uint64_t)v8);
    xpc_release(v3);
  }

uint64_t ___NETRBClientSetFixtureForwardedPorts_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = NETRBInfoLog();
  if (a2)
  {
    uint64_t result = xpc_dictionary_get_uint64(a2, netrbXPCResponse);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  }

  return result;
}

@end