@interface BKHIDKeyboardSignpostEventProcessor
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
@end

@implementation BKHIDKeyboardSignpostEventProcessor

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = *a3;
  if (v9)
  {
    uint64_t TimeStamp = IOHIDEventGetTimeStamp(v9);
    uint64_t IntegerValue = IOHIDEventGetIntegerValue(v9, 196608LL);
    uint64_t v12 = IOHIDEventGetIntegerValue(v9, 196609LL);
    uint64_t v13 = IOHIDEventGetIntegerValue(v9, 196610LL);
  }

  else
  {
    uint64_t v12 = 0LL;
    uint64_t TimeStamp = 0LL;
    uint64_t IntegerValue = 0LL;
    uint64_t v13 = 0LL;
  }

  kdebug_trace(730465057LL, TimeStamp, IntegerValue, v12, v13);
  int v14 = (unsigned __int16)IOHIDEventGetIntegerValue(v9, 196608LL);
  if (v14 != 7 && v14 != 65289)
  {
    id v16 = sub_10003F124();
    os_log_s *v17 = [v16 autorelease];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t ConciseDescriptionKeyboard = _BKSHIDEventGetConciseDescriptionKeyboard(v9, [v7 eventSource]);
      v19 = [ConciseDescriptionKeyboard autorelease];
      int v22 = 138543362;
      v23 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v22, 0xCu);
    }
  }

  v20 = [v7 displayUUID];
  _BKHIDNoteUserEventOccurredOnDisplay(v20);

  return 0LL;
}

@end