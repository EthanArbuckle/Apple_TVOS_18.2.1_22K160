@interface PFUserXPCInsertRuleResponseHandler
@end

@implementation PFUserXPCInsertRuleResponseHandler

void ____PFUserXPCInsertRuleResponseHandler_block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v3) {
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, (const char *)pfXPCKeyInsertID);
  }
  else {
    uint64_t uint64 = 0LL;
  }
  (*(void (**)(uint64_t, BOOL, uint64_t))(v4 + 16))(v4, v2 != 0, uint64);
  v6 = *(void **)(a1 + 40);
  if (v6) {
    xpc_release(v6);
  }
}

@end