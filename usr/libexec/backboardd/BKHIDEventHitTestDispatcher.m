@interface BKHIDEventHitTestDispatcher
- (void)sendEvent:(__IOHIDEvent *)a3 toClientTaskPort:(unsigned int)a4;
@end

@implementation BKHIDEventHitTestDispatcher

- (void)sendEvent:(__IOHIDEvent *)a3 toClientTaskPort:(unsigned int)a4
{
  if (a4 - 1 > 0xFFFFFFFD)
  {
    uint64_t v5 = BKLogMousePointer(self, a2, a3);
    v6 = os_log_s;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = a4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "can't dispatch pointer event to invalid client port 0x%X",  (uint8_t *)v7,  8u);
    }
  }

  else
  {
    BKSendHIDEventToClientWithTaskPort(a3, a4);
  }

@end