@interface PFUserInsertRule
@end

@implementation PFUserInsertRule

void __PFUserInsertRule_S_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    PFManagerInfoLog();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = PFManagerSendMessage( *(void **)(a1 + 56),  *(const char **)(*(void *)(a1 + 48) + 24LL),  *(const char **)(*(void *)(a1 + 48) + 32LL),  0x3E9u,  *(unsigned __int16 *)(a1 + 64),  0LL);
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
    {
      v2 = (void *)PFXPCGetResponse();
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_uint64( v2,  (const char *)pfXPCKeyInsertID);
      v3 = (void *)PFXPCGetResponse();
      xpc_release(v3);
    }
  }

  else
  {
    PFManagerErrorLog();
  }

@end