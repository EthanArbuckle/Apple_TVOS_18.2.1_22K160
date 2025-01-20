@interface SCATHardwareInputSource
- (BOOL)_useOverrideDeviceCount;
- (BOOL)handledEvent:(id)a3;
- (BOOL)isATVRemoteInputSource;
- (BOOL)isAirPodsInputSource;
- (BOOL)isAvailable;
- (BOOL)isGamepadInputSource;
- (BOOL)isKeyboardInputSource;
- (BOOL)isMFIInputSource;
- (BOOL)isMIDIInputSource;
- (NSDictionary)persistentSwitchIdentifiers;
- (NSDictionary)switchDisplayNames;
- (NSString)switchSource;
- (__IOHIDManager)hidManager;
- (id)_matchingCriteria;
- (id)actionForButtonNumber:(int64_t)a3 withType:(id)a4;
- (id)persistentSwitchIdentifierForButtonNumber:(int64_t)a3;
- (id)switchDisplayNameForButtonNumber:(int64_t)a3;
- (int64_t)switchKeyForSwitch:(id)a3;
- (unint64_t)_overrideDeviceCount;
- (unint64_t)availabilityDetail;
- (unint64_t)numberOfDevicesConnected;
- (unint64_t)priority;
- (void)_addFakeKeyboardDevice;
- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5;
- (void)_didUpdateAvailability:(BOOL)a3 withDetail:(unint64_t)a4;
- (void)_removeFakeKeyboardDevice;
- (void)_startDetectingDevices;
- (void)_startHandlingEvents;
- (void)_stopDetectingDevices;
- (void)_stopHandlingEvents;
- (void)dealloc;
- (void)setAvailabilityDetail:(unint64_t)a3;
- (void)setAvailable:(BOOL)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setHidManager:(__IOHIDManager *)a3;
- (void)setPersistentSwitchIdentifiers:(id)a3;
- (void)setSwitchDisplayNames:(id)a3;
- (void)set_overrideDeviceCount:(unint64_t)a3;
- (void)set_useOverrideDeviceCount:(BOOL)a3;
- (void)startRunning;
- (void)stopRunning;
- (void)updateWithSwitches:(id)a3 recipe:(id)a4;
@end

@implementation SCATHardwareInputSource

- (BOOL)isMFIInputSource
{
  return 0;
}

- (BOOL)isMIDIInputSource
{
  return 0;
}

- (BOOL)isKeyboardInputSource
{
  return 0;
}

- (BOOL)isATVRemoteInputSource
{
  return 0;
}

- (BOOL)isGamepadInputSource
{
  return 0;
}

- (BOOL)isAirPodsInputSource
{
  return 0;
}

- (NSString)switchSource
{
  return (NSString *)&stru_100127100;
}

- (int64_t)switchKeyForSwitch:(id)a3
{
  return -1LL;
}

- (id)actionForButtonNumber:(int64_t)a3 withType:(id)a4
{
  return 0LL;
}

- (id)persistentSwitchIdentifierForButtonNumber:(int64_t)a3
{
  return 0LL;
}

- (id)switchDisplayNameForButtonNumber:(int64_t)a3
{
  return 0LL;
}

- (unint64_t)numberOfDevicesConnected
{
  if (-[SCATHardwareInputSource _useOverrideDeviceCount](self, "_useOverrideDeviceCount")) {
    return -[SCATHardwareInputSource _overrideDeviceCount](self, "_overrideDeviceCount");
  }
  v4 = -[SCATHardwareInputSource hidManager](self, "hidManager");
  if (!v4) {
    return 0LL;
  }
  v5 = IOHIDManagerCopyDevices(v4);
  if (!v5) {
    return 0LL;
  }
  v6 = v5;
  CFIndex Count = CFSetGetCount(v5);
  CFRelease(v6);
  return Count;
}

- (BOOL)handledEvent:(id)a3
{
  return 0;
}

- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource delegate](self, "delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource queue](self, "queue"));
  if (v10
    && (objc_opt_respondsToSelector(v9, "hardwareInputSource:didReceiveActionWithIdentifier:start:ignoreInputHold:") & 1) != 0)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100056BAC;
    v11[3] = &unk_100123840;
    id v12 = v9;
    v13 = self;
    id v14 = v8;
    BOOL v15 = a4;
    BOOL v16 = a5;
    [v10 performAsynchronousWritingBlock:v11];
  }
}

- (void)_didUpdateAvailability:(BOOL)a3 withDetail:(unint64_t)a4
{
  BOOL v5 = a3;
  unsigned int v7 = -[SCATHardwareInputSource isAvailable](self, "isAvailable");
  unint64_t v8 = -[SCATHardwareInputSource availabilityDetail](self, "availabilityDetail");
  if (v7 != v5 || v8 != a4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource delegate](self, "delegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource queue](self, "queue"));
    if (v10)
    {
      if ((objc_opt_respondsToSelector(v9, "hardwareInputSource:didUpdateAvailability:withDetail:") & 1) != 0)
      {
        v11 = _NSConcreteStackBlock;
        uint64_t v12 = 3221225472LL;
        v13 = sub_100056CC8;
        id v14 = &unk_100123610;
        id v15 = v9;
        BOOL v16 = self;
        BOOL v18 = v5;
        unint64_t v17 = a4;
        [v10 performAsynchronousWritingBlock:&v11];
      }
    }

    -[SCATHardwareInputSource setAvailable:](self, "setAvailable:", v5, v11, v12, v13, v14);
    -[SCATHardwareInputSource setAvailabilityDetail:](self, "setAvailabilityDetail:", a4);
  }

- (id)_matchingCriteria
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (-[SCATHardwareInputSource isMFIInputSource](self, "isMFIInputSource"))
  {
    [v3 addObject:&off_10012FC20];
    [v3 addObject:&off_10012FC48];
  }

  if (-[SCATHardwareInputSource isKeyboardInputSource](self, "isKeyboardInputSource")) {
    [v3 addObject:&off_10012FC70];
  }
  if (-[SCATHardwareInputSource isATVRemoteInputSource](self, "isATVRemoteInputSource"))
  {
    uint64_t v4 = SCATATVRemoteDeviceMatchingDictionary();
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    [v3 addObject:v5];
  }

  if (-[SCATHardwareInputSource isGamepadInputSource](self, "isGamepadInputSource")) {
    [v3 addObject:&off_10012FC98];
  }
  return v3;
}

- (void)_startDetectingDevices
{
  if (-[SCATHardwareInputSource isMIDIInputSource](self, "isMIDIInputSource")) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATHardwareInputSource.m",  274LL,  "-[SCATHardwareInputSource _startDetectingDevices]",  @"MIDI input sources must not begin detecting devices");
  }
  if (!-[SCATHardwareInputSource isMIDIInputSource](self, "isMIDIInputSource")
    && !-[SCATHardwareInputSource hidManager](self, "hidManager"))
  {
    v3 = IOHIDManagerCreate(kCFAllocatorDefault, 0);
    uint64_t v4 = (const __CFArray *)objc_claimAutoreleasedReturnValue(-[SCATHardwareInputSource _matchingCriteria](self, "_matchingCriteria"));
    IOHIDManagerSetDeviceMatchingMultiple(v3, v4);

    IOHIDManagerRegisterDeviceMatchingCallback(v3, (IOHIDDeviceCallback)sub_100057020, self);
    IOHIDManagerRegisterDeviceRemovalCallback(v3, (IOHIDDeviceCallback)sub_10005702C, self);
    Current = CFRunLoopGetCurrent();
    IOHIDManagerScheduleWithRunLoop(v3, Current, kCFRunLoopDefaultMode);
    if (IOHIDManagerOpen(v3, 0))
    {
      char v14 = 1;
      _AXLogWithFacility(0LL, 0LL, 1LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0.0, v14, @"Could not start detecting devices");
    }

    else
    {
      -[SCATHardwareInputSource setHidManager:](self, "setHidManager:", v3);
      if (v3
        && (v6 = IOHIDManagerCopyDevices(v3)) != 0LL
        && (v7 = v6, CFIndex Count = CFSetGetCount(v6), CFRelease(v7), Count > 0))
      {
        __int128 v15 = 0u;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        v9 = IOHIDManagerCopyDevices(v3);
        id v10 = -[__CFSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v16;
          do
          {
            v13 = 0LL;
            do
            {
              if (*(void *)v16 != v12) {
                objc_enumerationMutation(v9);
              }
              sub_1000570C4(*(__IOHIDDevice **)(*((void *)&v15 + 1) + 8LL * (void)v13), self);
              v13 = (char *)v13 + 1;
            }

            while (v11 != v13);
            id v11 = -[__CFSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
          }

          while (v11);
        }
      }

      else
      {
        -[SCATHardwareInputSource _didUpdateAvailability:withDetail:]( self,  "_didUpdateAvailability:withDetail:",  0LL,  1LL);
      }
    }
  }

- (void)_stopDetectingDevices
{
  if (-[SCATHardwareInputSource isMIDIInputSource](self, "isMIDIInputSource")) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATHardwareInputSource.m",  318LL,  "-[SCATHardwareInputSource _stopDetectingDevices]",  @"MIDI input sources must not stop detecting devices");
  }
  if (!-[SCATHardwareInputSource isMIDIInputSource](self, "isMIDIInputSource"))
  {
    v3 = -[SCATHardwareInputSource hidManager](self, "hidManager");
    if (v3)
    {
      CFRelease(v3);
      -[SCATHardwareInputSource setHidManager:](self, "setHidManager:", 0LL);
    }
  }

- (unint64_t)priority
{
  return 2000LL;
}

- (void)_startHandlingEvents
{
  if (-[SCATHardwareInputSource isMIDIInputSource](self, "isMIDIInputSource")) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATHardwareInputSource.m",  342LL,  "-[SCATHardwareInputSource _startHandlingEvents]",  @"MIDI input sources must not start handling events");
  }
  if (!-[SCATHardwareInputSource isMIDIInputSource](self, "isMIDIInputSource"))
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    [v3 addEventHandler:self];
  }

- (void)_stopHandlingEvents
{
  if (-[SCATHardwareInputSource isMIDIInputSource](self, "isMIDIInputSource")) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATHardwareInputSource.m",  352LL,  "-[SCATHardwareInputSource _stopHandlingEvents]",  @"MIDI input sources must not stop handling events");
  }
  if (!-[SCATHardwareInputSource isMIDIInputSource](self, "isMIDIInputSource"))
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    [v3 removeEventHandler:self];
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATHardwareInputSource;
  -[SCATHardwareInputSource dealloc](&v3, "dealloc");
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SCATHardwareInputSource;
  -[SCATInputSource setDelegate:queue:](&v4, "setDelegate:queue:", a3, a4);
}

- (void)startRunning
{
  if (!-[SCATInputSource isRunning](self, "isRunning"))
  {
    -[SCATHardwareInputSource setAvailable:](self, "setAvailable:", 0LL);
    -[SCATHardwareInputSource setAvailabilityDetail:](self, "setAvailabilityDetail:", 0LL);
    if (!-[SCATHardwareInputSource isMIDIInputSource](self, "isMIDIInputSource"))
    {
      -[SCATHardwareInputSource _startHandlingEvents](self, "_startHandlingEvents");
      -[SCATHardwareInputSource _startDetectingDevices](self, "_startDetectingDevices");
    }

    -[SCATInputSource setRunning:](self, "setRunning:", 1LL);
  }

- (void)stopRunning
{
  if (-[SCATInputSource isRunning](self, "isRunning"))
  {
    if (!-[SCATHardwareInputSource isMIDIInputSource](self, "isMIDIInputSource"))
    {
      -[SCATHardwareInputSource _stopHandlingEvents](self, "_stopHandlingEvents");
      -[SCATHardwareInputSource _stopDetectingDevices](self, "_stopDetectingDevices");
    }

    -[SCATInputSource setRunning:](self, "setRunning:", 0LL);
  }

- (void)updateWithSwitches:(id)a3 recipe:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SCATHardwareInputSource;
  id v7 = a3;
  -[SCATInputSource updateWithSwitches:recipe:](&v17, "updateWithSwitches:recipe:", v7, v6);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100057B4C;
  v12[3] = &unk_100123910;
  v12[4] = self;
  v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v14 = v6;
  id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v8 = v16;
  id v9 = v15;
  id v10 = v6;
  id v11 = v13;
  [v7 enumerateObjectsUsingBlock:v12];

  -[SCATInputSource setActions:](self, "setActions:", v11);
  -[SCATHardwareInputSource setPersistentSwitchIdentifiers:](self, "setPersistentSwitchIdentifiers:", v9);
  -[SCATHardwareInputSource setSwitchDisplayNames:](self, "setSwitchDisplayNames:", v8);
}

- (void)_addFakeKeyboardDevice
{
}

- (void)_removeFakeKeyboardDevice
{
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (BOOL)_useOverrideDeviceCount
{
  return self->__useOverrideDeviceCount;
}

- (void)set_useOverrideDeviceCount:(BOOL)a3
{
  self->__useOverrideDeviceCFIndex Count = a3;
}

- (unint64_t)_overrideDeviceCount
{
  return self->__overrideDeviceCount;
}

- (void)set_overrideDeviceCount:(unint64_t)a3
{
  self->__overrideDeviceCFIndex Count = a3;
}

- (__IOHIDManager)hidManager
{
  return self->_hidManager;
}

- (void)setHidManager:(__IOHIDManager *)a3
{
  self->_hidManager = a3;
}

- (unint64_t)availabilityDetail
{
  return self->_availabilityDetail;
}

- (void)setAvailabilityDetail:(unint64_t)a3
{
  self->_availabilityDetail = a3;
}

- (NSDictionary)persistentSwitchIdentifiers
{
  return self->_persistentSwitchIdentifiers;
}

- (void)setPersistentSwitchIdentifiers:(id)a3
{
}

- (NSDictionary)switchDisplayNames
{
  return self->_switchDisplayNames;
}

- (void)setSwitchDisplayNames:(id)a3
{
}

- (void).cxx_destruct
{
}

@end