@interface HNDDevice
+ (id)createNewDevice:(__IOHIDDevice *)a3;
- (BOOL)containsHIDDevice:(__IOHIDDevice *)a3;
- (BOOL)isLoaded;
- (BOOL)load;
- (BOOL)secondaryButton;
- (BOOL)tertiaryButton;
- (BOOL)wheel;
- (HNDDeviceDelegate)delegate;
- (id)_initWithHIDDevice:(__IOHIDDevice *)a3;
- (id)actionOverrideForUsagePage:(unsigned int)a3 usage:(unsigned int)a4;
- (id)description;
- (void)dealloc;
- (void)handleUsagePage:(unsigned int)a3 usage:(unsigned int)a4 value:(int64_t)a5;
- (void)handleValueCallback:(__IOHIDValue *)a3;
- (void)setDelegate:(id)a3;
- (void)unload;
@end

@implementation HNDDevice

- (id)_initWithHIDDevice:(__IOHIDDevice *)a3
{
  v4 = -[HNDDevice init](self, "init");
  v5 = v4;
  if (a3 && v4)
  {
    v4->_hidDevice = a3;
    CFRetain(a3);
  }

  return v5;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___HNDDevice;
  id v3 = -[HNDDevice description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@",  v4,  self->_hidDevice));

  return v5;
}

+ (id)createNewDevice:(__IOHIDDevice *)a3
{
  BOOL IsSwitchControlRunning = UIAccessibilityIsSwitchControlRunning();
  BOOL v5 = IsSwitchControlRunning;
  uint64_t v7 = ASTLogMouse(IsSwitchControlRunning, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (!v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v66 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Attempting to create new HNDDevice from %@",  buf,  0xCu);
    }

    CFTypeRef Property = IOHIDDeviceGetProperty(a3, @"DeviceUsagePairs");
    v12 = (__IOHIDDevice *)objc_claimAutoreleasedReturnValue(Property);
    uint64_t v14 = ASTLogMouse(v12, v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v66 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "device usagePairs: %@", buf, 0xCu);
    }

    IOHIDDeviceRef device = a3;

    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    v16 = v12;
    id v17 = -[__IOHIDDevice countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v61,  v75,  16LL);
    obj = v16;
    if (v17)
    {
      id v18 = v17;
      char v60 = 0;
      char v19 = 0;
      char v20 = 0;
      char v21 = 0;
      uint64_t v22 = *(void *)v62;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v62 != v22) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)i);
          v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "DeviceUsage"));
          v26 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v25]);

          v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "DeviceUsagePage"));
          v28 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v27]);

          if ([v28 intValue] == 1)
          {
            BOOL v29 = [v26 intValue] == 2;
            BOOL v30 = [v26 intValue] == 6 || objc_msgSend(v26, "intValue") == 7;
            v21 |= v29;
            v20 |= v30;
            v19 |= [v26 intValue] == 4;
            v60 |= [v26 intValue] == 5;
          }
        }

        v16 = obj;
        id v18 = -[__IOHIDDevice countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v61,  v75,  16LL);
      }

      while (v18);
    }

    else
    {
      char v60 = 0;
      char v19 = 0;
      char v20 = 0;
      char v21 = 0;
    }

    id v31 = objc_msgSend((id)IOHIDDeviceGetProperty(device, @"IAPHIDAccessoryCategory"), "intValue");
    int v32 = (int)v31;
    uint64_t v34 = ASTLogMouse(v31, v33);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      BOOL v36 = v32 == 2;
      uint64_t v37 = NSStringFromBOOL(v21 & 1);
      v38 = (__IOHIDDevice *)objc_claimAutoreleasedReturnValue(v37);
      uint64_t v39 = NSStringFromBOOL(v20 & 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      uint64_t v41 = NSStringFromBOOL(v19 & 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      uint64_t v43 = NSStringFromBOOL(v60 & 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      uint64_t v45 = NSStringFromBOOL(v36);
      v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      *(_DWORD *)buf = 138413314;
      v66 = v38;
      __int16 v67 = 2112;
      v68 = v40;
      __int16 v69 = 2112;
      v70 = v42;
      __int16 v71 = 2112;
      v72 = v44;
      __int16 v73 = 2112;
      v74 = v46;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "\n \t - hasMouseCapabilities: %@\n \t - hasMouseKeysCapabilities: %@\n \t - hasJoystickCapabilities: %@\n \t - hasGamePadCapabilities: %@\n \t - isIAPDevice: %@",  buf,  0x34u);
    }

    if ((v19 & 1) != 0)
    {
      v49 = &off_1001211A0;
    }

    else
    {
      if ((v60 & 1) == 0) {
        goto LABEL_34;
      }
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      unsigned int v51 = [v50 assistiveTouchGameControllerEnabled];

      if (!v51) {
        goto LABEL_34;
      }
      v49 = off_100121198;
    }

    objc_opt_class(*v49, v48);
    if (v47)
    {
      v52 = v47;
      uint64_t v53 = ASTLogMouse(v47, v48);
      v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v66 = (__IOHIDDevice *)v52;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "making device: %@", buf, 0xCu);
      }

      id v10 = [objc_allocWithZone(v52) _initWithHIDDevice:device];
LABEL_37:
      v9 = obj;
      goto LABEL_38;
    }

- (void)dealloc
{
  hidDevice = self->_hidDevice;
  if (hidDevice)
  {
    CFRelease(hidDevice);
    self->_hidDevice = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___HNDDevice;
  -[HNDDevice dealloc](&v4, "dealloc");
}

- (id)actionOverrideForUsagePage:(unsigned int)a3 usage:(unsigned int)a4
{
  return (id)AXAssistiveTouchDefaultIconTypeForMouseButton(a4, a2, *(void *)&a3);
}

- (BOOL)containsHIDDevice:(__IOHIDDevice *)a3
{
  return self->_hidDevice == a3;
}

- (void)handleValueCallback:(__IOHIDValue *)a3
{
  uint64_t v5 = ASTLogMouse(self, a2);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412546;
    v11 = self;
    __int16 v12 = 2112;
    uint64_t v13 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "[device: %@] handleValueCallback: %@",  (uint8_t *)&v10,  0x16u);
  }

  Element = IOHIDValueGetElement(a3);
  uint64_t UsagePage = IOHIDElementGetUsagePage(Element);
  uint64_t Usage = IOHIDElementGetUsage(Element);
  -[HNDDevice handleUsagePage:usage:value:]( self,  "handleUsagePage:usage:value:",  UsagePage,  Usage,  IOHIDValueGetIntegerValue(a3));
}

- (void)handleUsagePage:(unsigned int)a3 usage:(unsigned int)a4 value:(int64_t)a5
{
  int64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  if (a3 == 1)
  {
    double v11 = 0.0;
    switch(a4)
    {
      case '0':
        uint64_t v10 = 3LL;
        break;
      case '8':
        if (!a5) {
          return;
        }
        int64_t v5 = 0LL;
        uint64_t v10 = 4LL;
        break;
      case '1':
        double v11 = (double)a5;
        uint64_t v10 = 3LL;
        uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_7;
      default:
        return;
    }

    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_16;
  }

  if (a3 != 9) {
    return;
  }
  uint64_t v9 = a4;
  if (a5 > 0) {
    uint64_t v10 = 1LL;
  }
  else {
    uint64_t v10 = 2LL;
  }
  double v11 = 0.0;
LABEL_7:
  int64_t v5 = 0LL;
LABEL_16:
  id v14 = [objc_allocWithZone((Class)HNDEvent) init];
  [v14 setType:v10];
  [v14 setDeltaX:(double)v5];
  [v14 setDeltaY:v11];
  [v14 setButtonNumber:v9];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDevice actionOverrideForUsagePage:usage:](self, "actionOverrideForUsagePage:usage:", v7, v6));
  [v14 setActionOverride:v12];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDevice delegate](self, "delegate"));
  [v13 device:self didPostEvent:v14];
}

- (BOOL)load
{
  if (-[HNDDevice isLoaded](self, "isLoaded")) {
    return 1;
  }
  p_hidDevice = &self->_hidDevice;
  hidDevice = self->_hidDevice;
  if (!hidDevice) {
    return 0;
  }
  uint64_t v6 = IOHIDDeviceOpen(hidDevice, 0);
  if ((_DWORD)v6)
  {
    int v8 = v6;
    uint64_t v9 = ASTLogMouse(v6, v7);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1000AEF14((uint64_t *)&self->_hidDevice, v8, v10);
    }
    BOOL v3 = 0;
  }

  else
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[os_log_s setObject:forKey:](v10, "setObject:forKey:", v11, @"UsagePage");

    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 48LL));
    -[os_log_s setObject:forKey:](v10, "setObject:forKey:", v12, @"Usage");

    CFArrayRef v13 = IOHIDDeviceCopyMatchingElements(*p_hidDevice, v10, 0);
    if (!-[__CFArray count](v13, "count")) {
      goto LABEL_43;
    }
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    id v14 = v13;
    id v15 = -[__CFArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v62,  v71,  16LL);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v63;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v63 != v17) {
            objc_enumerationMutation(v14);
          }
          char v19 = *(__IOHIDElement **)(*((void *)&v62 + 1) + 8LL * (void)i);
          if (self->_maxX == 0.0) {
            self->_maxX = (double)IOHIDElementGetLogicalMax(*(IOHIDElementRef *)(*((void *)&v62 + 1) + 8LL * (void)i));
          }
          if (self->_minX == 0.0) {
            self->_minX = (double)IOHIDElementGetLogicalMin(v19);
          }
        }

        id v16 = -[__CFArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v62,  v71,  16LL);
      }

      while (v16);
    }

    char v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[os_log_s setObject:forKey:](v10, "setObject:forKey:", v20, @"UsagePage");

    char v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 49LL));
    -[os_log_s setObject:forKey:](v10, "setObject:forKey:", v21, @"Usage");

    CFArrayRef v13 = IOHIDDeviceCopyMatchingElements(*p_hidDevice, v10, 0);
    if (!-[__CFArray count](v13, "count")) {
      goto LABEL_43;
    }
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    uint64_t v22 = v13;
    id v23 = -[__CFArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v58,  v70,  16LL);
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v59;
      do
      {
        for (j = 0LL; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v59 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(__IOHIDElement **)(*((void *)&v58 + 1) + 8LL * (void)j);
          if (self->_maxY == 0.0) {
            self->_maxY = (double)IOHIDElementGetLogicalMax(*(IOHIDElementRef *)(*((void *)&v58 + 1) + 8LL * (void)j));
          }
          if (self->_minY == 0.0) {
            self->_minY = (double)IOHIDElementGetLogicalMin(v27);
          }
        }

        id v24 = -[__CFArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v58,  v70,  16LL);
      }

      while (v24);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[os_log_s setObject:forKey:](v10, "setObject:forKey:", v28, @"UsagePage");

    BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 56LL));
    -[os_log_s setObject:forKey:](v10, "setObject:forKey:", v29, @"Usage");

    CFArrayRef v30 = IOHIDDeviceCopyMatchingElements(*p_hidDevice, v10, 0);
    id v31 = -[__CFArray count](v30, "count");
    BOOL v32 = v31 != 0LL;
    if (v31)
    {
      uint64_t v33 = (__IOHIDElement *)objc_claimAutoreleasedReturnValue(-[__CFArray objectAtIndex:](v30, "objectAtIndex:", 0LL));
      CFIndex LogicalMin = IOHIDElementGetLogicalMin(v33);

      v35 = (__IOHIDElement *)objc_claimAutoreleasedReturnValue(-[__CFArray objectAtIndex:](v30, "objectAtIndex:", 0LL));
      CFIndex LogicalMax = IOHIDElementGetLogicalMax(v35);

      uint64_t v39 = ASTLogMouse(v37, v38);
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        __int16 v67 = (HNDDevice *)LogicalMin;
        __int16 v68 = 2048;
        CFIndex v69 = LogicalMax;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Min wheel: %ld Max wheel: %ld", buf, 0x16u);
      }
    }

    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 9LL));
    -[os_log_s setObject:forKey:](v10, "setObject:forKey:", v41, @"UsagePage");

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[os_log_s setObject:forKey:](v10, "setObject:forKey:", v42, @"Usage");

    CFArrayRef v13 = IOHIDDeviceCopyMatchingElements(*p_hidDevice, v10, 0);
    if (-[__CFArray count](v13, "count"))
    {
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 9LL));
      -[os_log_s setObject:forKey:](v10, "setObject:forKey:", v43, @"UsagePage");

      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
      -[os_log_s setObject:forKey:](v10, "setObject:forKey:", v44, @"Usage");

      CFArrayRef v45 = IOHIDDeviceCopyMatchingElements(self->_hidDevice, v10, 0);
      BOOL v46 = -[__CFArray count](v45, "count") != 0LL;
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 9LL));
      -[os_log_s setObject:forKey:](v10, "setObject:forKey:", v47, @"UsagePage");

      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 3LL));
      -[os_log_s setObject:forKey:](v10, "setObject:forKey:", v48, @"Usage");

      CFArrayRef v13 = IOHIDDeviceCopyMatchingElements(self->_hidDevice, v10, 0);
      id v49 = -[__CFArray count](v13, "count");
      self->_wheel = v32;
      self->_secondaryButton = v46;
      self->_tertiaryButton = v49 != 0LL;
      AXSetThreadPriority(63LL);
      IOHIDDeviceRegisterRemovalCallback(self->_hidDevice, (IOHIDCallback)j__objc_msgSend_unload, self);
      IOHIDDeviceRegisterInputValueCallback(self->_hidDevice, (IOHIDValueCallback)sub_100024FB8, self);
      CFTypeRef Property = (const __CFNumber *)IOHIDDeviceGetProperty(self->_hidDevice, @"MaxInputReportSize");
      int valuePtr = 0;
      if (Property)
      {
        CFNumberGetValue(Property, kCFNumberIntType, &valuePtr);
        CFIndex v52 = valuePtr;
        uint64_t v53 = (char *)malloc(valuePtr);
        self->_hidReportBuffer = v53;
        IOHIDDeviceRegisterInputReportCallback( self->_hidDevice,  (uint8_t *)v53,  v52,  (IOHIDReportCallback)sub_100024FC0,  self);
      }

      self->_isLoaded = 1;
      uint64_t v54 = ASTLogMouse(Property, v51);
      uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v67 = self;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "loaded: %@", buf, 0xCu);
      }

      BOOL v3 = 1;
    }

    else
    {
LABEL_43:
      BOOL v3 = 0;
    }
  }

  return v3;
}

- (void)unload
{
  uint64_t v3 = ASTLogMouse(self, a2);
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    __int16 v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Unload device: %@", (uint8_t *)&v11, 0xCu);
  }

  if (self->_isLoaded)
  {
    hidDevice = self->_hidDevice;
    Current = CFRunLoopGetCurrent();
    IOHIDDeviceUnscheduleFromRunLoop(hidDevice, Current, kCFRunLoopDefaultMode);
    IOHIDDeviceClose(self->_hidDevice, 0);
    *(_DWORD *)&self->_isLoaded = 0;
    hidReportBuffer = self->_hidReportBuffer;
    if (hidReportBuffer)
    {
      free(hidReportBuffer);
      self->_hidReportBuffer = 0LL;
    }

    int v8 = self;
    id WeakRetained = objc_loadWeakRetained((id *)&v8->_delegate);
    [WeakRetained device:v8 didUnload:1];

    uint64_t v10 = self->_hidDevice;
    if (v10)
    {
      CFRelease(v10);
      self->_hidDevice = 0LL;
    }
  }

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (HNDDeviceDelegate)delegate
{
  return (HNDDeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)secondaryButton
{
  return self->_secondaryButton;
}

- (BOOL)tertiaryButton
{
  return self->_tertiaryButton;
}

- (BOOL)wheel
{
  return self->_wheel;
}

- (void).cxx_destruct
{
}

@end