@interface NETRBClientAddIPPortForwardingRule
@end

@implementation NETRBClientAddIPPortForwardingRule

void ___NETRBClientAddIPPortForwardingRule_block_invoke(uint64_t a1)
{
  if (__NETRBClientValidateClient(*(_BYTE **)(a1 + 48)))
  {
    NETRBErrorLog();
  }

  else
  {
    xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v2, netrbXPCClientID, (const char *)(*(void *)(a1 + 48) + 32LL));
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3F7uLL);
    PortForwardingRuleDict = netrbMakePortForwardingRuleDict( *(unsigned __int8 *)(a1 + 76),  *(unsigned __int16 *)(a1 + 72),  *(unsigned __int8 *)(a1 + 77),  *(void **)(a1 + 56),  *(unsigned __int16 *)(a1 + 74));
    xpc_dictionary_set_value(v2, netrbXPCPortForwardingRule, PortForwardingRuleDict);
    xpc_release(PortForwardingRuleDict);
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 0x40000000LL;
    v5[2] = ___NETRBClientAddIPPortForwardingRule_block_invoke_2;
    v5[3] = &unk_18A132EC0;
    uint64_t v4 = *(void *)(a1 + 48);
    v5[4] = *(void *)(a1 + 32);
    v5[5] = v4;
    NETRBInfoLog();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = NETRBXPCSetupAndSend( *(dispatch_queue_s **)(a1 + 64),  v2,  (uint64_t)v5);
    xpc_release(v2);
  }

void ___NETRBClientAddIPPortForwardingRule_block_invoke_2(uint64_t a1, void *a2)
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
    v6[2] = ___NETRBClientAddIPPortForwardingRule_block_invoke_3;
    v6[3] = &unk_18A132E98;
    v6[4] = v4;
    char v7 = (char)a2;
    dispatch_async(global_queue, v6);
  }

uint64_t ___NETRBClientAddIPPortForwardingRule_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40));
}

@end