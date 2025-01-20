@interface NETRBClientGetExtName
@end

@implementation NETRBClientGetExtName

void ___NETRBClientGetExtName_block_invoke(uint64_t a1)
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
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3F5uLL);
    xpc_dictionary_set_string(v3, netrbXPCClientID, (const char *)(*(void *)(a1 + 48) + 32LL));
    NETRBInfoLog();
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 0x40000000LL;
    v4[2] = ___NETRBClientGetExtName_block_invoke_2;
    v4[3] = &unk_18A132BD0;
    __int128 v5 = *(_OWORD *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 56);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(0LL, v3, (uint64_t)v4);
    xpc_release(v3);
  }

uint64_t ___NETRBClientGetExtName_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = NETRBInfoLog();
  if (a2)
  {
    uint64_t result = xpc_dictionary_get_uint64(a2, netrbXPCResponse);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == 2001LL)
    {
      __int128 v5 = *(char **)(a1 + 48);
      string = xpc_dictionary_get_string(a2, netrbXPCExtName);
      return snprintf(v5, 0x10uLL, "%s", string);
    }
  }

  return result;
}

@end