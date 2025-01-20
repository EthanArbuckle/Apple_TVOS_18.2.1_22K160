@interface SDSmartCoverMonitor
- (BOOL)isSmartCoverClosed:(__IOHIDEventSystemClient *)a3;
- (BOOL)smartCoverIsClosed;
- (SDSmartCoverMonitor)init;
- (id)description;
- (unsigned)getSmartCoverState:(__CFArray *)a3 usage:(unsigned int)a4;
- (void)dealloc;
- (void)handleButtonEvent:(__IOHIDEvent *)a3;
- (void)handleEvent:(__IOHIDEvent *)a3;
- (void)installSmartCoverMonitor;
- (void)postNotification:(id)a3;
- (void)updateSmartCoverIsClosed:(BOOL)a3;
@end

@implementation SDSmartCoverMonitor

- (void)postNotification:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 postNotificationName:v3 object:0 userInfo:0];
}

- (SDSmartCoverMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SDSmartCoverMonitor;
  v2 = -[SDSmartCoverMonitor init](&v5, "init");
  id v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_smartCoverIsClosed = 0;
    v2->_openStateIsEngaged = 0;
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_mHIDClient = 0LL;
    -[SDSmartCoverMonitor installSmartCoverMonitor](v2, "installSmartCoverMonitor");
  }

  return v3;
}

- (void)dealloc
{
  mHIDClient = self->_mHIDClient;
  if (mHIDClient) {
    CFRelease(mHIDClient);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SDSmartCoverMonitor;
  -[SDSmartCoverMonitor dealloc](&v4, "dealloc");
}

- (void)installSmartCoverMonitor
{
  uint64_t v3 = SFDeviceClassCodeGet(self, a2);
  int v4 = v3;
  uint64_t v5 = daemon_log(v3);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4 == 3)
  {
    if (v7)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting smart cover monitor", v14, 2u);
    }

    os_unfair_lock_lock(&self->_lock);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 65280LL));
    v15[0] = v8;
    v16[0] = @"PrimaryUsagePage";
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 6LL));
    v15[1] = v9;
    v16[1] = @"PrimaryUsage";
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));

    v10 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 1LL, 0LL);
    self->_mHIDClient = v10;
    if (v10)
    {
      IOHIDEventSystemClientSetMatching(v10, v6);
      IOHIDEventSystemClientRegisterEventCallback(self->_mHIDClient, sub_100010438, 0LL, self);
      mHIDClient = self->_mHIDClient;
      CFRunLoopRef Main = CFRunLoopGetMain();
      IOHIDEventSystemClientScheduleWithRunLoop(mHIDClient, Main, kCFRunLoopDefaultMode);
      v13 = self->_mHIDClient;
    }

    else
    {
      v13 = 0LL;
    }

    -[SDSmartCoverMonitor updateSmartCoverIsClosed:]( self,  "updateSmartCoverIsClosed:",  -[SDSmartCoverMonitor isSmartCoverClosed:](self, "isSmartCoverClosed:", v13));
    os_unfair_lock_unlock(&self->_lock);
  }

  else if (v7)
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not starting smart cover monitor", v14, 2u);
  }
}

- (id)description
{
  id v9 = 0LL;
  NSAppendPrintF(&v9, "-- SDSmartCoverMonitor --\n");
  id v3 = v9;
  id v8 = v3;
  unsigned int v4 = -[SDSmartCoverMonitor smartCoverIsClosed](self, "smartCoverIsClosed");
  uint64_t v5 = "no";
  if (v4) {
    uint64_t v5 = "yes";
  }
  NSAppendPrintF(&v8, "Smart Cover Closed:           %@\n", v5);
  id v6 = v8;

  return v6;
}

- (void)updateSmartCoverIsClosed:(BOOL)a3
{
  if (self->_smartCoverIsClosed != a3)
  {
    BOOL v3 = a3;
    uint64_t v5 = daemon_log(self);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = @"NO";
      if (v3) {
        BOOL v7 = @"YES";
      }
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "smartCoverIsClosed changed: closed %@",  (uint8_t *)&v8,  0xCu);
    }

    self->_smartCoverIsClosed = v3;
    -[SDSmartCoverMonitor postNotification:]( self,  "postNotification:",  @"com.apple.sharingd.SmartCoverClosedChanged");
  }

- (void)handleButtonEvent:(__IOHIDEvent *)a3
{
  uint64_t IntegerValue = IOHIDEventGetIntegerValue(a3, 196608LL);
  uint64_t v6 = IOHIDEventGetIntegerValue(a3, 196609LL);
  if (IntegerValue == 65289 && v6 == 2)
  {
    uint64_t v14 = IOHIDEventGetIntegerValue(a3, 196610LL);
    self->_flap1StateIsEngaged = v14 == 1;
    uint64_t v15 = daemon_log(v14);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = "YES";
      if (self->_flap1StateIsEngaged) {
        v17 = "YES";
      }
      else {
        v17 = "NO";
      }
      if (!self->_openStateIsEngaged) {
        v16 = "NO";
      }
      *(_DWORD *)v19 = 136446466;
      *(void *)&v19[4] = v17;
      *(_WORD *)&v19[12] = 2082;
      *(void *)&v19[14] = v16;
      v13 = "flap1IsEngaged (updated) = %{public}s openIsEngaged = %{public}s";
      goto LABEL_21;
    }
  }

  else
  {
    if (IntegerValue != 65289 || v6 != 1) {
      goto LABEL_23;
    }
    uint64_t v8 = IOHIDEventGetIntegerValue(a3, 196610LL);
    self->_openStateIsEngaged = v8 == 1;
    uint64_t v9 = daemon_log(v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = "YES";
      if (self->_flap1StateIsEngaged) {
        v12 = "YES";
      }
      else {
        v12 = "NO";
      }
      if (!self->_openStateIsEngaged) {
        v11 = "NO";
      }
      *(_DWORD *)v19 = 136446466;
      *(void *)&v19[4] = v12;
      *(_WORD *)&v19[12] = 2082;
      *(void *)&v19[14] = v11;
      v13 = "flap1IsEngaged = %{public}s openIsEngaged (updated) = %{public}s";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v13, v19, 0x16u);
    }
  }

LABEL_23:
  BOOL v18 = self->_flap1StateIsEngaged && self->_openStateIsEngaged;
  -[SDSmartCoverMonitor updateSmartCoverIsClosed:]( self,  "updateSmartCoverIsClosed:",  v18,  *(_OWORD *)v19,  *(void *)&v19[16]);
}

- (void)handleEvent:(__IOHIDEvent *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  os_unfair_lock_lock(&self->_lock);
  unsigned int v5 = -[SDSmartCoverMonitor smartCoverIsClosed](self, "smartCoverIsClosed");
  BOOL v6 = -[SDSmartCoverMonitor smartCoverIsClosed](self, "smartCoverIsClosed");
  if (v5 != v6) {
    -[SDSmartCoverMonitor updateSmartCoverIsClosed:](self, "updateSmartCoverIsClosed:", v6);
  }
  if (a3) {
    CFRelease(a3);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isSmartCoverClosed:(__IOHIDEventSystemClient *)a3
{
  if (!a3) {
    return 0;
  }
  CFArrayRef v4 = IOHIDEventSystemClientCopyServices(a3);
  unsigned int v5 = -[SDSmartCoverMonitor getSmartCoverState:usage:](self, "getSmartCoverState:usage:", v4, 1LL);
  uint64_t v6 = -[SDSmartCoverMonitor getSmartCoverState:usage:](self, "getSmartCoverState:usage:", v4, 2LL);
  char v7 = v6 | v5;
  BOOL v8 = (v6 | v5) == 3;
  self->_flap1StateIsEngaged = (v7 & 2) != 0;
  self->_openStateIsEngaged = v7 & 1;
  uint64_t v9 = daemon_log(v6);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "YES";
    if (self->_flap1StateIsEngaged) {
      v12 = "YES";
    }
    else {
      v12 = "NO";
    }
    if (!self->_openStateIsEngaged) {
      v11 = "NO";
    }
    int v14 = 136446466;
    uint64_t v15 = v12;
    __int16 v16 = 2082;
    v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "flap1IsEngaged = %{public}s openIsEngaged = %{public}s",  (uint8_t *)&v14,  0x16u);
  }

  if (v4) {
    CFRelease(v4);
  }
  return v8;
}

- (unsigned)getSmartCoverState:(__CFArray *)a3 usage:(unsigned int)a4
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = *(void *)&a4;
  CFIndex Count = CFArrayGetCount(a3);
  if (Count < 1) {
    return 0;
  }
  CFIndex v7 = Count;
  unsigned int v8 = 0;
  for (CFIndex i = 0LL; i != v7; ++i)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
    KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent(kCFAllocatorDefault, 0LL, 65289LL, v4, 0LL, 0LL);
    uint64_t v12 = IOHIDServiceClientCopyEvent(ValueAtIndex, 3LL, KeyboardEvent, 0LL);
    if (v12)
    {
      v13 = (const void *)v12;
      if (IOHIDEventGetIntegerValue(v12, 196610LL)) {
        int v14 = v4;
      }
      else {
        int v14 = 0;
      }
      v8 |= v14;
      CFRelease(v13);
    }

    if (KeyboardEvent) {
      CFRelease(KeyboardEvent);
    }
  }

  return v8;
}

- (BOOL)smartCoverIsClosed
{
  return self->_smartCoverIsClosed;
}

@end