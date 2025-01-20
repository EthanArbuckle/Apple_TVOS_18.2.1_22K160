@interface CFPrefsBooleanEntitlementValueForMessage
@end

@implementation CFPrefsBooleanEntitlementValueForMessage

void *___CFPrefsBooleanEntitlementValueForMessage_block_invoke(uint64_t a1, uint64_t a2)
{
  result = _CFPrefsGetEntitlementForMessageWithLockedContext(*(void **)(a1 + 32), *(char **)(a1 + 48), a2);
  if (result)
  {
    v4 = result;
    result = object_getClass(result);
    if (result == (void *)MEMORY[0x1895F9228])
    {
      result = (void *)xpc_BOOL_get_value(v4);
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
    }
  }

  return result;
}

@end