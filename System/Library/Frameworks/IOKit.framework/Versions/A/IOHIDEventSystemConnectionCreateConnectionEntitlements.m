@interface IOHIDEventSystemConnectionCreateConnectionEntitlements
@end

@implementation IOHIDEventSystemConnectionCreateConnectionEntitlements

uint64_t ____IOHIDEventSystemConnectionCreateConnectionEntitlements_block_invoke( uint64_t a1,  char *__big,  void *a3)
{
  if (strstr(__big, ".hid") || strstr(__big, ".iohid")) {
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), __big, a3);
  }
  return 1LL;
}

@end