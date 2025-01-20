@interface KeyboardHelper
- (BOOL)isKeyboardConnected;
- (BOOL)isR18xKeyboardAttached;
- (KeyboardHelper)init;
- (void)dealloc;
- (void)getInitialFolioState;
- (void)registerForFolioEvents;
- (void)registerForKeyboardEvents;
- (void)updateFolioState:(BOOL)a3;
- (void)updateKeyboardState;
- (void)updateSensorExchangeKey;
@end

@implementation KeyboardHelper

- (KeyboardHelper)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___KeyboardHelper;
  v2 = -[KeyboardHelper init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    v2->_cachedIsKeyboardAttached = 0;
    v2->_cachedIsFolioAttached = 0;
    v2->_keyboardPortConnect = 0LL;
    v2->_keyboardPortDisconnect = 0LL;
    if (byte_10007D470)
    {
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  28LL,  @"zETM",  28LL);
      dword_10007D1E0 = 0;
    }
  }

  return v3;
}

- (void)dealloc
{
  RunLoopSource = IONotificationPortGetRunLoopSource(self->_keyboardPortConnect);
  v4 = IONotificationPortGetRunLoopSource(self->_keyboardPortDisconnect);
  CFRunLoopRemoveSource((CFRunLoopRef)qword_10007CB20, RunLoopSource, kCFRunLoopDefaultMode);
  CFRunLoopRemoveSource((CFRunLoopRef)qword_10007CB20, v4, kCFRunLoopDefaultMode);
  IONotificationPortDestroy(self->_keyboardPortConnect);
  IONotificationPortDestroy(self->_keyboardPortDisconnect);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___KeyboardHelper;
  -[KeyboardHelper dealloc](&v5, "dealloc");
}

- (void)registerForKeyboardEvents
{
  kern_return_t v12;
  IONotificationPort *v13;
  CFDictionaryRef v14;
  self->_keyboardPortConnect = IONotificationPortCreate(kIOMainPortDefault);
  v3 = IONotificationPortCreate(kIOMainPortDefault);
  self->_keyboardPortDisconnect = v3;
  keyboardPortConnect = self->_keyboardPortConnect;
  if (keyboardPortConnect) {
    BOOL v5 = v3 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003F3F0();
    }
  }

  else
  {
    RunLoopSource = IONotificationPortGetRunLoopSource(keyboardPortConnect);
    CFRunLoopSourceRef v7 = IONotificationPortGetRunLoopSource(self->_keyboardPortDisconnect);
    if (RunLoopSource) {
      BOOL v8 = v7 == 0LL;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003F420();
      }
    }

    else
    {
      v9 = v7;
      CFRunLoopAddSource((CFRunLoopRef)qword_10007CB20, RunLoopSource, kCFRunLoopDefaultMode);
      CFRunLoopAddSource((CFRunLoopRef)qword_10007CB20, v9, kCFRunLoopDefaultMode);
      v10 = self->_keyboardPortConnect;
      v11 = IOServiceMatching("AppleHIDKeyboardEventDriverV2");
      v12 = IOServiceAddMatchingNotification( v10,  "IOServiceFirstMatch",  v11,  (IOServiceMatchingCallback)sub_100035C58,  self,  &self->_keyboardIteratorConnect);
      v13 = self->_keyboardPortConnect;
      v14 = IOServiceMatching("AppleHIDKeyboardEventDriverV2");
      if (!(v12 | IOServiceAddMatchingNotification( v13,  "IOServiceTerminate",  v14,  (IOServiceMatchingCallback)sub_100035C58,  self,  &self->_keyboardIteratorDisconnect)))
      {
        sub_100035C58(self, self->_keyboardIteratorConnect);
        sub_100035C58(self, self->_keyboardIteratorDisconnect);
      }
    }
  }

- (void)registerForFolioEvents
{
  self->_hidClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(kCFAllocatorDefault, a2);
  v20[0] = @"PrimaryUsagePage";
  v20[1] = @"PrimaryUsage";
  v21[0] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 11LL);
  v21[1] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL);
  IOHIDEventSystemClientSetMatching( self->_hidClient,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
  IOHIDEventSystemClientRegisterEventCallback(self->_hidClient, sub_100036248, self, 0LL);
  IOHIDEventSystemClientScheduleWithRunLoop(self->_hidClient, qword_10007CB20, kCFRunLoopDefaultMode);
  hidClient = self->_hidClient;
  if (hidClient)
  {
    v4 = IOHIDEventSystemClientCopyServices(hidClient);
    if (v4)
    {
      BOOL v5 = v4;
      if (CFArrayGetCount(v4) >= 1)
      {
        int Count = CFArrayGetCount(v5);
        if (Count >= 1)
        {
          CFIndex v7 = 0LL;
          uint64_t v8 = Count;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v5, v7);
            if (ValueAtIndex)
            {
              v10 = ValueAtIndex;
              KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent( kCFAllocatorDefault,  0LL,  65289LL,  17LL,  0LL,  0LL);
              if (!KeyboardEvent)
              {
                v12 = (os_log_s *)qword_10007CF50;
                if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
                  sub_10003F4B4(&v18, v19, v12);
                }
              }

              uint64_t v13 = IOHIDServiceClientCopyEvent(v10, 3LL, KeyboardEvent, 0LL);
              if (v13)
              {
                v14 = (const void *)v13;
                -[KeyboardHelper updateFolioState:]( self,  "updateFolioState:",  IOHIDEventGetIntegerValue(v13, 196610LL) != 0);
                CFRelease(v14);
              }

              else
              {
                v15 = (os_log_s *)qword_10007CF50;
                if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
                  sub_10003F480(&v16, v17, v15);
                }
              }

              CFRelease(KeyboardEvent);
            }

            ++v7;
          }

          while (v8 != v7);
        }
      }

      CFRelease(v5);
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003F450();
    }
  }

- (void)updateKeyboardState
{
  BOOL v3 = -[KeyboardHelper isKeyboardConnected](self, "isKeyboardConnected");
  if (self->_cachedIsKeyboardAttached != v3)
  {
    self->_cachedIsKeyboardAttached = v3;
    if (v3) {
      -[KeyboardHelper isR18xKeyboardAttached](self, "isR18xKeyboardAttached");
    }
    -[KeyboardHelper updateSensorExchangeKey](self, "updateSensorExchangeKey");
  }

- (BOOL)isR18xKeyboardAttached
{
  if (!self->_cachedIsKeyboardAttached) {
    goto LABEL_6;
  }
  unsigned int v2 = sub_100020E9C("AppleOrionManager", 0LL, 0LL);
  if (v2)
  {
    io_object_t v3 = v2;
    if (!sub_10002175C(v2, @"IOAccessoryDigitalID", v5, (id)6) || (v5[4] & 1) == 0)
    {
      IOObjectRelease(v3);
LABEL_6:
      LOBYTE(v2) = 0;
      return v2;
    }

    LOBYTE(v2) = 1;
  }

  return v2;
}

- (BOOL)isKeyboardConnected
{
  io_registry_entry_t v2 = sub_100020E9C("AppleHIDKeyboardEventDriverV2", 0LL, 0LL);
  io_registry_entry_t v3 = sub_100020E9C("IOAccessoryIDBusHIDDevice", 0LL, 0LL);
  if (v2)
  {
    BOOL v4 = sub_100021808(v2, @"RequiresCompassResetOnConnect");
    if (v3) {
      return v4 | sub_100021808(v3, @"RequiresCompassResetOnConnect");
    }
  }

  else
  {
    BOOL v5 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003F558(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    BOOL v4 = 0;
    if (v3) {
      return v4 | sub_100021808(v3, @"RequiresCompassResetOnConnect");
    }
  }

  uint64_t v13 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003F4E8(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  return v4;
}

- (void)updateFolioState:(BOOL)a3
{
  if (self->_cachedIsFolioAttached != a3)
  {
    self->_cachedIsFolioAttached = a3;
    -[KeyboardHelper updateSensorExchangeKey](self, "updateSensorExchangeKey");
  }

- (void)updateSensorExchangeKey
{
  unsigned int v2 = self->_cachedIsKeyboardAttached | (2 * self->_cachedIsFolioAttached);
  if (byte_10007CB30)
  {
    io_registry_entry_t v3 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109376;
      v4[1] = v2;
      __int16 v5 = 1024;
      int v6 = dword_10007CB10;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "<Notice> KeyboardHelper updating SDTK - NewValue: %u PreviousValue: %u",  (uint8_t *)v4,  0xEu);
    }
  }

  if (dword_10007CB10 != v2)
  {
    dword_10007CB10 = v2;
    *(float *)&dword_10007D1E0 = (float)v2;
  }

- (void)getInitialFolioState
{
  qword_10007D4F0 = IOHIDEventSystemCreate(kCFAllocatorDefault, a2);
  if (!qword_10007D4F0 && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003F5C8();
  }
  KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent(0LL, 0LL, 65289LL, 17LL, 0LL, 0LL);
  uint64_t v4 = IOHIDEventSystemCopyEvent(qword_10007D4F0, 3LL, KeyboardEvent, 0LL);
  if (v4)
  {
    __int16 v5 = (const void *)v4;
    -[KeyboardHelper updateFolioState:](self, "updateFolioState:", IOHIDEventGetIntegerValue(v4, 196610LL) != 0);
    CFRelease(v5);
  }

  CFRelease(KeyboardEvent);
}

@end