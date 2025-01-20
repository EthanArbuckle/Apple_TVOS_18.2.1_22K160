@interface AXTVBluetoothRecognizer
- (AXTVBluetoothDevice)matchingPhysicalDevice;
- (AXTVBluetoothRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (BOOL)_matchesDeviceOfEvent:(id)a3;
- (BOOL)isContinuous;
- (void)_continuousEvent;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setContinuous:(BOOL)a3;
- (void)setMatchingPhysicalDevice:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation AXTVBluetoothRecognizer

- (AXTVBluetoothRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AXTVBluetoothRecognizer;
  v4 = -[AXTVBluetoothRecognizer initWithTarget:action:](&v7, "initWithTarget:action:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_matchingSenderID = 0LL;
    -[AXTVBluetoothRecognizer setAllowedPressTypes:](v4, "setAllowedPressTypes:", &off_6FFB8);
    -[AXTVBluetoothRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", &off_6FFD0);
  }

  return v5;
}

- (BOOL)_matchesDeviceOfEvent:(id)a3
{
  if ([a3 _hidEvent])
  {
    uint64_t SenderID = IOHIDEventGetSenderID();
    unint64_t v5 = SenderID;
    p_matchinguint64_t SenderID = &self->_matchingSenderID;
    if (self->_matchingSenderID) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = SenderID == 0;
    }
    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothRecognizer matchingPhysicalDevice](self, "matchingPhysicalDevice"));
      if (v8)
      {
        v9 = (__IOHIDServiceClient *)IOHIDEventSystemClientCopyServiceForRegistryID(self->_hidSystemClient, v5);
        if (v9)
        {
          v10 = v9;
          v11 = (const __CFString *)IOHIDServiceClientCopyProperty(v9, @"PhysicalDeviceUniqueID");
          if (v11)
          {
            v12 = v11;
            if (CFStringGetLength(v11) >= 1)
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue([v8 physicalDeviceUniqueID]);
              if ([v13 length] && CFEqual(v12, v13))
              {
                *p_matchinguint64_t SenderID = v5;
              }

              else
              {
                v14 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
                if ([v14 length] && CFEqual(v12, v14))
                {
                  *p_matchinguint64_t SenderID = v5;
                }

                else
                {
                  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 serialNumber]);
                  if ([v15 length] && CFEqual(v12, v15)) {
                    *p_matchinguint64_t SenderID = v5;
                  }
                }
              }
            }

            CFRelease(v12);
          }

          if (!*p_matchingSenderID)
          {
            v16 = (const __CFString *)IOHIDServiceClientCopyProperty(v10, @"SerialNumber");
            if (v16)
            {
              v17 = v16;
              if (CFStringGetLength(v16) >= 1)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue([v8 serialNumber]);
                if ([v18 length] && CFEqual(v17, v18)) {
                  *p_matchinguint64_t SenderID = v5;
                }
              }

              CFRelease(v17);
            }

            if (!*p_matchingSenderID)
            {
              v19 = (const __CFNumber *)IOHIDServiceClientCopyProperty(v10, @"LocationID");
              if (v19)
              {
                v20 = v19;
                CFTypeID TypeID = CFNumberGetTypeID();
                if (TypeID == CFGetTypeID(v20))
                {
                  int valuePtr = 0;
                  CFNumberGetValue(v20, kCFNumberSInt32Type, &valuePtr);
                  if (valuePtr)
                  {
                    if ((objc_opt_respondsToSelector(v8, "macAddress") & 1) != 0) {
                      uint64_t v22 = objc_claimAutoreleasedReturnValue([v8 macAddress]);
                    }
                    else {
                      uint64_t v22 = objc_claimAutoreleasedReturnValue([v8 identifier]);
                    }
                    v23 = (void *)v22;
                    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v22));
                    unsigned int v30 = 0;
                    uint64_t v29 = 0LL;
                    unsigned int v28 = 0;
                    if ([v24 scanHexInt:0])
                    {
                      if ([v24 scanString:@":" intoString:0])
                      {
                        if ([v24 scanHexInt:0])
                        {
                          if ([v24 scanString:@":" intoString:0])
                          {
                            if ([v24 scanHexInt:&v30])
                            {
                              if (v30 <= 0xFF)
                              {
                                if ([v24 scanString:@":" intoString:0])
                                {
                                  if ([v24 scanHexInt:(char *)&v29 + 4])
                                  {
                                    if (HIDWORD(v29) <= 0xFF)
                                    {
                                      if ([v24 scanString:@":" intoString:0])
                                      {
                                        if ([v24 scanHexInt:&v29])
                                        {
                                          if (v29 <= 0xFF)
                                          {
                                            if ([v24 scanString:@":" intoString:0])
                                            {
                                              if ([v24 scanHexInt:&v28])
                                              {
                                                if (v28 <= 0xFF)
                                                {
                                                  CFNumberGetValue(v20, kCFNumberSInt32Type, v27);
                                                  if (v30 == v27[0]
                                                    && v29 == __PAIR64__(v27[1], v27[2])
                                                    && v28 == v27[3])
                                                  {
                                                    *p_matchinguint64_t SenderID = v5;
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }

                CFRelease(v20);
              }
            }
          }

          CFRelease(v10);
        }
      }
    }
  }

  else
  {
    unint64_t v5 = 0LL;
    p_matchinguint64_t SenderID = &self->_matchingSenderID;
  }

  return *p_matchingSenderID && v5 == *p_matchingSenderID;
}

- (void)setMatchingPhysicalDevice:(id)a3
{
  unint64_t v5 = (AXTVBluetoothDevice *)a3;
  if (self->_matchingPhysicalDevice != v5)
  {
    BOOL v7 = v5;
    hidSystemClient = self->_hidSystemClient;
    if (hidSystemClient) {
      CFRelease(hidSystemClient);
    }
    objc_storeStrong((id *)&self->_matchingPhysicalDevice, a3);
    self->_matchinguint64_t SenderID = 0LL;
    self->_hidSystemClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(kCFAllocatorSystemDefault);
    unint64_t v5 = v7;
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (!-[AXTVBluetoothRecognizer state](self, "state"))
  {
    if (-[AXTVBluetoothRecognizer _matchesDeviceOfEvent:](self, "_matchesDeviceOfEvent:", v6))
    {
      -[AXTVBluetoothRecognizer setState:](self, "setState:", 1LL);
      self->_touchCount = [v9 count];
      if (-[AXTVBluetoothRecognizer isContinuous](self, "isContinuous"))
      {
        BOOL v7 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_continuousEvent",  0LL,  1LL,  0.0333333333));
        continousTimer = self->_continousTimer;
        self->_continousTimer = v7;
      }
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if ((uint64_t)-[AXTVBluetoothRecognizer state](self, "state") >= 1)
  {
    if (!-[AXTVBluetoothRecognizer _matchesDeviceOfEvent:](self, "_matchesDeviceOfEvent:", v6))
    {
      -[NSTimer invalidate](self->_continousTimer, "invalidate");
      continousTimer = self->_continousTimer;
      self->_continousTimer = 0LL;

      id v9 = self;
      uint64_t v10 = 5LL;
      goto LABEL_6;
    }

    unsigned int v7 = self->_touchCount - [v12 count];
    self->_touchCount = v7;
    if (!v7)
    {
      -[NSTimer invalidate](self->_continousTimer, "invalidate");
      v8 = self->_continousTimer;
      self->_continousTimer = 0LL;

      id v9 = self;
      uint64_t v10 = 3LL;
LABEL_6:
      -[AXTVBluetoothRecognizer setState:](v9, "setState:", v10);
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if ((uint64_t)-[AXTVBluetoothRecognizer state](self, "state") >= 1)
  {
    if (!-[AXTVBluetoothRecognizer _matchesDeviceOfEvent:](self, "_matchesDeviceOfEvent:", v6))
    {
      -[NSTimer invalidate](self->_continousTimer, "invalidate");
      continousTimer = self->_continousTimer;
      self->_continousTimer = 0LL;

      id v9 = self;
      uint64_t v10 = 5LL;
      goto LABEL_6;
    }

    unsigned int v7 = self->_touchCount - [v12 count];
    self->_touchCount = v7;
    if (!v7)
    {
      -[NSTimer invalidate](self->_continousTimer, "invalidate");
      v8 = self->_continousTimer;
      self->_continousTimer = 0LL;

      id v9 = self;
      uint64_t v10 = 4LL;
LABEL_6:
      -[AXTVBluetoothRecognizer setState:](v9, "setState:", v10);
    }
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v7 = a4;
  if (!-[AXTVBluetoothRecognizer state](self, "state"))
  {
    if (-[AXTVBluetoothRecognizer _matchesDeviceOfEvent:](self, "_matchesDeviceOfEvent:", v7))
    {
      -[AXTVBluetoothRecognizer setState:](self, "setState:", 1LL);
      if (-[AXTVBluetoothRecognizer isContinuous](self, "isContinuous"))
      {
        unint64_t v5 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_continuousEvent",  0LL,  1LL,  0.0333333333));
        continousTimer = self->_continousTimer;
        self->_continousTimer = v5;
      }
    }
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v8 = a4;
  if ((uint64_t)-[AXTVBluetoothRecognizer state](self, "state") >= 1)
  {
    unsigned int v5 = -[AXTVBluetoothRecognizer _matchesDeviceOfEvent:](self, "_matchesDeviceOfEvent:", v8);
    -[NSTimer invalidate](self->_continousTimer, "invalidate");
    continousTimer = self->_continousTimer;
    self->_continousTimer = 0LL;

    if (v5) {
      uint64_t v7 = 3LL;
    }
    else {
      uint64_t v7 = 5LL;
    }
    -[AXTVBluetoothRecognizer setState:](self, "setState:", v7);
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v8 = a4;
  if ((uint64_t)-[AXTVBluetoothRecognizer state](self, "state") >= 1)
  {
    unsigned int v5 = -[AXTVBluetoothRecognizer _matchesDeviceOfEvent:](self, "_matchesDeviceOfEvent:", v8);
    -[NSTimer invalidate](self->_continousTimer, "invalidate");
    continousTimer = self->_continousTimer;
    self->_continousTimer = 0LL;

    if (v5) {
      uint64_t v7 = 3LL;
    }
    else {
      uint64_t v7 = 5LL;
    }
    -[AXTVBluetoothRecognizer setState:](self, "setState:", v7);
  }
}

- (void)_continuousEvent
{
}

- (BOOL)isContinuous
{
  return self->_continuous;
}

- (void)setContinuous:(BOOL)a3
{
  self->_continuous = a3;
}

- (AXTVBluetoothDevice)matchingPhysicalDevice
{
  return self->_matchingPhysicalDevice;
}

- (void).cxx_destruct
{
}

@end