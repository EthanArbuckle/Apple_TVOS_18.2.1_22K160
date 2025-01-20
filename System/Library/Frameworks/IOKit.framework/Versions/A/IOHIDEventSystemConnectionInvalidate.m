@interface IOHIDEventSystemConnectionInvalidate
@end

@implementation IOHIDEventSystemConnectionInvalidate

void ___IOHIDEventSystemConnectionInvalidate_block_invoke(uint64_t a1)
{
}

void ___IOHIDEventSystemConnectionInvalidate_block_invoke_2(uint64_t a1)
{
  CFSetRef v2 = _IOHIDEventSystemConnectionCopyServices(*(CFSetRef **)(a1 + 32));
  CFSetRemoveAllValues(*(CFMutableSetRef *)(*(void *)(a1 + 32) + 80LL));
  os_unfair_recursive_lock_unlock();
  CFRelease(v2);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end