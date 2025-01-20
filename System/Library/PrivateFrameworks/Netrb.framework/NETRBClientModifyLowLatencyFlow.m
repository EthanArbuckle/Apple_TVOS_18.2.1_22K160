@interface NETRBClientModifyLowLatencyFlow
@end

@implementation NETRBClientModifyLowLatencyFlow

uint64_t ___NETRBClientModifyLowLatencyFlow_block_invoke(uint64_t a1)
{
  if (__NETRBClientValidateClient(*(_BYTE **)(a1 + 40)))
  {
    uint64_t result = NETRBErrorLog();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

  else
  {
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 48), netrbXPCClientID, (const char *)(*(void *)(a1 + 40) + 32LL));
    if (*(_BYTE *)(a1 + 56)) {
      uint64_t v3 = 1019LL;
    }
    else {
      uint64_t v3 = 1018LL;
    }
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 48), netrbXPCKey, v3);
    NETRBInfoLog();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    v4 = *(void **)(a1 + 48);
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 0x40000000LL;
    v5[2] = ___NETRBClientModifyLowLatencyFlow_block_invoke_2;
    v5[3] = &unk_18A1331B0;
    __int128 v6 = *(_OWORD *)(a1 + 32);
    return NETRBXPCSetupAndSend(0LL, v4, (uint64_t)v5);
  }

  return result;
}

uint64_t ___NETRBClientModifyLowLatencyFlow_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2
    && MEMORY[0x1895B5770](a2) == MEMORY[0x1895F9250]
    && (xpc_object_t value = xpc_dictionary_get_value(a2, netrbXPCResponse)) != 0LL
    && (__int128 v6 = value, MEMORY[0x1895B5770]() == MEMORY[0x1895F92F0]))
  {
  }

  else
  {
    NETRBErrorLog();
  }

  return NETRBInfoLog();
}

@end