@interface HNDDeviceDetector
- (BOOL)detectDevices;
- (HNDDeviceDetector)init;
- (HNDDeviceDetectorDelegate)delegate;
- (id)_matchingDictionaries;
- (void)setDelegate:(id)a3;
- (void)setDetectDevices:(BOOL)a3;
@end

@implementation HNDDeviceDetector

- (HNDDeviceDetector)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HNDDeviceDetector;
  return -[HNDDeviceDetector init](&v3, "init");
}

- (id)_matchingDictionaries
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  [v3 setObject:v4 forKey:@"PrimaryUsagePage"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
  [v3 setObject:v5 forKey:@"PrimaryUsage"];

  [v2 addObject:v3];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  [v6 setObject:v7 forKey:@"PrimaryUsagePage"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 4LL));
  [v6 setObject:v8 forKey:@"PrimaryUsage"];

  [v2 addObject:v6];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  [v9 setObject:v10 forKey:@"PrimaryUsagePage"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 6LL));
  [v9 setObject:v11 forKey:@"PrimaryUsage"];

  [v2 addObject:v9];
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  [v12 setObject:v13 forKey:@"PrimaryUsagePage"];

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 7LL));
  [v12 setObject:v14 forKey:@"PrimaryUsage"];

  [v2 addObject:v12];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  [v15 setObject:v16 forKey:@"PrimaryUsagePage"];

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 5LL));
  [v15 setObject:v17 forKey:@"PrimaryUsage"];

  [v2 addObject:v15];
  return v2;
}

- (void)setDetectDevices:(BOOL)a3
{
  self->_detectDevices = a3;
  hidManager = self->_hidManager;
  if (a3)
  {
    if (!hidManager)
    {
      v5 = IOHIDManagerCreate(kCFAllocatorDefault, 0);
      self->_hidManager = v5;
      IOHIDManagerRegisterDeviceMatchingCallback(v5, (IOHIDDeviceCallback)sub_10000C7E4, self);
      IOHIDManagerRegisterDeviceRemovalCallback(self->_hidManager, (IOHIDDeviceCallback)sub_10000C8CC, self);
      v6 = self->_hidManager;
      v7 = (const __CFArray *)objc_claimAutoreleasedReturnValue(-[HNDDeviceDetector _matchingDictionaries](self, "_matchingDictionaries"));
      IOHIDManagerSetDeviceMatchingMultiple(v6, v7);

      v8 = self->_hidManager;
      Current = CFRunLoopGetCurrent();
      IOHIDManagerScheduleWithRunLoop(v8, Current, kCFRunLoopDefaultMode);
    }
  }

  else if (hidManager)
  {
    v10 = CFRunLoopGetCurrent();
    IOHIDManagerUnscheduleFromRunLoop(hidManager, v10, kCFRunLoopDefaultMode);
    CFRelease(self->_hidManager);
    self->_hidManager = 0LL;
  }

- (BOOL)detectDevices
{
  return self->_detectDevices;
}

- (HNDDeviceDetectorDelegate)delegate
{
  return (HNDDeviceDetectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end