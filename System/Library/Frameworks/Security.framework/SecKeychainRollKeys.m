@interface SecKeychainRollKeys
@end

@implementation SecKeychainRollKeys

uint64_t ___SecKeychainRollKeys_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  return 1LL;
}

uint64_t ___SecKeychainRollKeys_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
}

@end