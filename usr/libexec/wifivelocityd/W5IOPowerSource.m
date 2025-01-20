@interface W5IOPowerSource
- (W5IOPowerSource)init;
- (double)estimatedTimeRemaining;
- (double)internalBatteryLevel;
- (id)lowBatteryCallback;
- (id)updatedPowerSourceCallback;
- (int)batteryWarningLevel;
- (int64_t)powerSourceType;
- (void)dealloc;
- (void)setLowBatteryCallback:(id)a3;
- (void)setUpdatedPowerSourceCallback:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation W5IOPowerSource

- (W5IOPowerSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___W5IOPowerSource;
  v2 = -[W5IOPowerSource init](&v5, "init");
  if (v2
    && (v3 = dispatch_queue_create("com.apple.wifivelocityd.iops", 0LL), (v2->_queue = (OS_dispatch_queue *)v3) != 0LL))
  {
    dispatch_queue_set_specific(v3, &v2->_queue, (void *)1, 0LL);
  }

  else
  {

    return 0LL;
  }

  return v2;
}

- (void)setUpdatedPowerSourceCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedPowerSourceCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000333C0;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)setLowBatteryCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_lowBatteryCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10003348C;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)dealloc
{
  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___W5IOPowerSource;
  -[W5IOPowerSource dealloc](&v4, "dealloc");
}

- (void)startEventMonitoring
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033584;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopEventMonitoring
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033AA0;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (double)internalBatteryLevel
{
  CFTypeRef v2 = IOPSCopyPowerSourcesInfo();
  if (!v2) {
    return 0.0;
  }
  v3 = v2;
  objc_super v4 = IOPSCopyPowerSourcesList(v2);
  double v5 = 0.0;
  if (v4)
  {
    v6 = v4;
    if (CFArrayGetCount(v4) && CFArrayGetCount(v6) >= 1)
    {
      CFIndex v7 = 0LL;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v6, v7);
        v9 = IOPSGetPowerSourceDescription(v3, ValueAtIndex);
        if (v9)
        {
          v10 = v9;
          Value = CFDictionaryGetValue(v9, @"Transport Type");
          if (Value)
          {
            if (CFEqual(Value, @"Internal")) {
              break;
            }
          }
        }

        if (CFArrayGetCount(v6) <= ++v7) {
          goto LABEL_12;
        }
      }

      int valuePtr = 0;
      v12 = (const __CFNumber *)CFDictionaryGetValue(v10, @"Current Capacity");
      CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
      int v15 = 0;
      v13 = (const __CFNumber *)CFDictionaryGetValue(v10, @"Max Capacity");
      CFNumberGetValue(v13, kCFNumberSInt32Type, &v15);
      double v5 = (double)valuePtr / (double)v15 * 100.0;
    }

- (double)estimatedTimeRemaining
{
  uint64_t v6 = 0LL;
  CFIndex v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033CD8;
  block[3] = &unk_1000D12E0;
  block[4] = &v6;
  dispatch_sync(queue, block);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)powerSourceType
{
  uint64_t v6 = 0LL;
  CFIndex v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033DA0;
  block[3] = &unk_1000D12E0;
  block[4] = &v6;
  dispatch_sync(queue, block);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)batteryWarningLevel
{
  uint64_t v6 = 0LL;
  CFIndex v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  int v9 = 1;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033EC4;
  block[3] = &unk_1000D12E0;
  block[4] = &v6;
  dispatch_sync(queue, block);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)updatedPowerSourceCallback
{
  return self->_updatedPowerSourceCallback;
}

- (id)lowBatteryCallback
{
  return self->_lowBatteryCallback;
}

@end