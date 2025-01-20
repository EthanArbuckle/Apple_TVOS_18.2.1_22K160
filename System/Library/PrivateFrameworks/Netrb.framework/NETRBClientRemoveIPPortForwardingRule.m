@interface NETRBClientRemoveIPPortForwardingRule
@end

@implementation NETRBClientRemoveIPPortForwardingRule

void ___NETRBClientRemoveIPPortForwardingRule_block_invoke(uint64_t a1)
{
  if (__NETRBClientValidateClient(*(_BYTE **)(a1 + 48)))
  {
    NETRBErrorLog();
  }

  else
  {
    xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v2, netrbXPCClientID, (const char *)(*(void *)(a1 + 48) + 32LL));
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3F8uLL);
    uint64_t v3 = *(unsigned __int8 *)(a1 + 67);
    if ((_DWORD)v3 == 30 || (_DWORD)v3 == 2)
    {
      uint64_t v5 = *(unsigned __int8 *)(a1 + 66);
      uint64_t v6 = *(unsigned __int16 *)(a1 + 64);
      xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
      v8 = v7;
      if ((_DWORD)v5) {
        xpc_dictionary_set_uint64(v7, netrbXPCPortForwardingRuleProtocol, v5);
      }
      if ((_DWORD)v6) {
        xpc_dictionary_set_uint64(v8, netrbXPCPortForwardingRuleExternalPort, v6);
      }
      xpc_dictionary_set_uint64(v8, netrbXPCPortForwardingRuleAddressFamily, v3);
    }

    else
    {
      v8 = 0LL;
    }

    xpc_dictionary_set_value(v2, netrbXPCPortForwardingRule, v8);
    xpc_release(v8);
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    v10[2] = ___NETRBClientRemoveIPPortForwardingRule_block_invoke_2;
    v10[3] = &unk_18A132F38;
    uint64_t v9 = *(void *)(a1 + 48);
    v10[4] = *(void *)(a1 + 32);
    v10[5] = v9;
    NETRBInfoLog();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = NETRBXPCSetupAndSend( *(dispatch_queue_s **)(a1 + 56),  v2,  (uint64_t)v10);
    xpc_release(v2);
  }

void ___NETRBClientRemoveIPPortForwardingRule_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    if (a2)
    {
      LOBYTE(a2) = xpc_dictionary_get_uint64(a2, netrbXPCResponse) == 2001;
      uint64_t v4 = *(void *)(a1 + 32);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 0x40000000LL;
    v6[2] = ___NETRBClientRemoveIPPortForwardingRule_block_invoke_3;
    v6[3] = &unk_18A132F10;
    v6[4] = v4;
    char v7 = (char)a2;
    dispatch_async(global_queue, v6);
  }

uint64_t ___NETRBClientRemoveIPPortForwardingRule_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40));
}

@end