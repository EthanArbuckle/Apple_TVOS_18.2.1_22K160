@interface PFUserNATLook
@end

@implementation PFUserNATLook

void __PFUserNATLook_S_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    PFManagerInfoLog();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = PFManagerSendMessage( *(void **)(a1 + 56),  *(const char **)(*(void *)(a1 + 48) + 24LL),  *(const char **)(*(void *)(a1 + 48) + 32LL),  0x3EEu,  0xFFFFFFFFuLL,  0LL);
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
    {
      v2 = (void *)PFXPCGetResponse();
      xpc_object_t value = xpc_dictionary_get_value(v2, (const char *)pfXPCKeyRule);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_copy(value);
      v4 = (void *)PFXPCGetResponse();
      xpc_release(v4);
    }
  }

  else
  {
    PFManagerErrorLog();
  }

@end