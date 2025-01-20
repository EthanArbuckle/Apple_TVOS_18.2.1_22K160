@interface MRDHIDEventManager
- (void)_dispatchKeypressEventWithUsagePage:(unsigned int)a3 usage:(unsigned int)a4;
- (void)dispatchHIDEvent:(__IOHIDEvent *)a3;
- (void)dispatchHomeButton;
- (void)dispatchKeypressEvent:(unint64_t)a3;
- (void)dispatchUnicodeEventWithText:(id)a3;
@end

@implementation MRDHIDEventManager

- (void)dispatchHIDEvent:(__IOHIDEvent *)a3
{
}

- (void)dispatchHomeButton
{
}

- (void)dispatchKeypressEvent:(unint64_t)a3
{
  if (a3 - 1 <= 2) {
    -[MRDHIDEventManager _dispatchKeypressEventWithUsagePage:usage:]( self,  "_dispatchKeypressEventWithUsagePage:usage:",  7LL,  dword_10034B6E0[a3 - 1]);
  }
}

- (void)dispatchUnicodeEventWithText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:4]);

  id v8 = v6;
  UnicodeEvent = (const void *)IOHIDEventCreateUnicodeEvent( kCFAllocatorDefault,  v5,  [v8 bytes],  objc_msgSend(v8, "length"),  0,  0);
  -[MRDHIDEventManager dispatchHIDEvent:](self, "dispatchHIDEvent:", UnicodeEvent);
  CFRelease(UnicodeEvent);
}

- (void)_dispatchKeypressEventWithUsagePage:(unsigned int)a3 usage:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = mach_absolute_time();
  KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent(kCFAllocatorDefault, v7, v5, v4, 1LL, 0LL);
  -[MRDHIDEventManager dispatchHIDEvent:](self, "dispatchHIDEvent:", KeyboardEvent);
  CFRelease(KeyboardEvent);
  uint64_t v9 = mach_absolute_time();
  v10 = (const void *)IOHIDEventCreateKeyboardEvent(kCFAllocatorDefault, v9, v5, v4, 0LL, 0LL);
  -[MRDHIDEventManager dispatchHIDEvent:](self, "dispatchHIDEvent:", v10);
  CFRelease(v10);
}

@end