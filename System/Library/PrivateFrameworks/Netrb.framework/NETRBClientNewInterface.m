@interface NETRBClientNewInterface
@end

@implementation NETRBClientNewInterface

_BYTE *___NETRBClientNewInterface_block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 88))
  {
    if (!uuid_is_null(*(const unsigned __int8 **)(a1 + 56))) {
      xpc_dictionary_set_uuid( *(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  netrbXPCMACUUID,  *(const unsigned __int8 **)(a1 + 56));
    }
  }

  else
  {
    xpc_dictionary_set_BOOL( *(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  netrbXPCAllocateMACAddress,  0);
  }

  v3 = *(const char **)(a1 + 64);
  if (v3) {
    xpc_dictionary_set_string(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), netrbXPCExtName, v3);
  }
  if (*(_BYTE *)(a1 + 89)) {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), netrbXPCEnableTSO, 1);
  }
  if (*(_BYTE *)(a1 + 90)) {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), netrbXPCEnableMACNAT, 1);
  }
  if (*(_BYTE *)(a1 + 91)) {
    xpc_dictionary_set_BOOL( *(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  netrbXPCEnableIsolation,  1);
  }
  if (*(_BYTE *)(a1 + 92)) {
    xpc_dictionary_set_BOOL( *(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  netrbXPCEnableChecksumOffload,  1);
  }
  uint64_t v4 = *(int *)(a1 + 84);
  if ((_DWORD)v4) {
    xpc_dictionary_set_uint64( *(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  netrbXPCInterfaceMTU,  v4);
  }
  NETRBInfoLog();
  uint64_t v5 = *(void *)(a1 + 48);
  *(_BYTE *)(v5 + 545) = 1;
  v6 = *(dispatch_queue_s **)(a1 + 72);
  v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 0x40000000LL;
  v9[2] = ___NETRBClientNewInterface_block_invoke_2;
  v9[3] = &__block_descriptor_tmp_150;
  v9[4] = v5;
  BOOL v8 = NETRBXPCSetupAndSend(v6, v7, (uint64_t)v9);
  result = *(_BYTE **)(a1 + 48);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v8;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    return CFRetain(result);
  }
  result[545] = 0;
  return result;
}

void ___NETRBClientNewInterface_block_invoke_2(uint64_t a1, void *a2)
{
}

@end