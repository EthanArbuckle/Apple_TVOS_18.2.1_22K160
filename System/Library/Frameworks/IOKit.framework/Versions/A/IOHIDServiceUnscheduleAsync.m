@interface IOHIDServiceUnscheduleAsync
@end

@implementation IOHIDServiceUnscheduleAsync

void ___IOHIDServiceUnscheduleAsync_block_invoke(uint64_t a1)
{
}

void ___IOHIDServiceUnscheduleAsync_block_invoke_69(uint64_t a1)
{
  v2 = (os_log_s *)_IOHIDLogCategory(6u);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    ___IOHIDServiceUnscheduleAsync_block_invoke_69_cold_1();
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ___IOHIDServiceUnscheduleAsync_block_invoke_71(uint64_t a1)
{
  v2 = (os_log_s *)_IOHIDLogCategory(6u);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    ___IOHIDServiceUnscheduleAsync_block_invoke_71_cold_1();
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ___IOHIDServiceUnscheduleAsync_block_invoke_69_cold_1()
{
}

void ___IOHIDServiceUnscheduleAsync_block_invoke_71_cold_1()
{
}

@end