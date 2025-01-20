@interface NETRBClientGetIPPortForwardingRules
@end

@implementation NETRBClientGetIPPortForwardingRules

void ___NETRBClientGetIPPortForwardingRules_block_invoke(uint64_t a1)
{
  if (__NETRBClientValidateClient(*(_BYTE **)(a1 + 48)))
  {
    NETRBErrorLog();
  }

  else
  {
    xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v2, netrbXPCClientID, (const char *)(*(void *)(a1 + 48) + 32LL));
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3F9uLL);
    uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
    if ((_DWORD)v3 == 30 || (_DWORD)v3 == 2)
    {
      xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_uint64(v5, netrbXPCPortForwardingRuleAddressFamily, v3);
    }

    else
    {
      xpc_object_t v5 = 0LL;
    }

    xpc_dictionary_set_value(v2, netrbXPCPortForwardingRule, v5);
    xpc_release(v5);
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    v7[2] = ___NETRBClientGetIPPortForwardingRules_block_invoke_2;
    v7[3] = &unk_18A132FB0;
    uint64_t v6 = *(void *)(a1 + 48);
    v7[4] = *(void *)(a1 + 32);
    v7[5] = v6;
    NETRBInfoLog();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = NETRBXPCSetupAndSend( *(dispatch_queue_s **)(a1 + 56),  v2,  (uint64_t)v7);
    xpc_release(v2);
  }

void ___NETRBClientGetIPPortForwardingRules_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, netrbXPCPortForwardingRules);
    a2 = value;
    if (value) {
      xpc_retain(value);
    }
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 0x40000000LL;
  v6[2] = ___NETRBClientGetIPPortForwardingRules_block_invoke_3;
  v6[3] = &unk_18A132F88;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = a2;
  dispatch_async(global_queue, v6);
}

void ___NETRBClientGetIPPortForwardingRules_block_invoke_3(uint64_t a1)
{
  xpc_object_t v2 = *(void **)(a1 + 40);
  if (v2) {
    xpc_release(v2);
  }
}

@end