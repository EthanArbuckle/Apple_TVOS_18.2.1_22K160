@interface AmbientLightSensorComponent
- (AmbientLightSensorComponent)init;
- (BOOL)isContextTriggered;
- (BOOL)synchContext;
- (__CFArray)copySensorArray;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)ALS_FS;
- (int)ALS_IR;
- (int)IR_PRED;
- (int)getContextState;
- (int)numberOfFields;
- (int)temperature;
- (void)initHIDServices;
@end

@implementation AmbientLightSensorComponent

- (AmbientLightSensorComponent)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AmbientLightSensorComponent;
  v2 = -[AmbientLightSensorComponent init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    v2->ALS_FS = 0;
    v2->ALS_IR = 0;
    v2->IR_PRED = 0;
    v2->super.ctxType = 0;
    v2->previousSunlightLoadingIndexValue = 0;
    v2->sunlightLoadingIndexValue = 0;
    v2->temperature = 0;
    v2->thermalSunlightStateToken = -1;
    if (notify_register_check("com.apple.system.thermalsunlightstate", &v2->thermalSunlightStateToken)
      && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_100038C2C();
    }

    -[AmbientLightSensorComponent initHIDServices](v3, "initHIDServices");
    -[TGraphSampler addtGraphDataSource:]( +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance"),  "addtGraphDataSource:",  v3);
  }

  return v3;
}

- (int)getContextState
{
  return self->sunlightLoadingIndexValue;
}

- (BOOL)isContextTriggered
{
  return self->sunlightLoadingIndexValue == 100;
}

- (void)initHIDServices
{
  if (!self->_hidEventSystem)
  {
    v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(kCFAllocatorDefault, a2);
    self->_hidEventSystem = v3;
    if (v3)
    {
      CFDictionaryRef v4 = sub_1000230AC(65280, 4);
      if (v4)
      {
        CFDictionaryRef v5 = v4;
        IOHIDEventSystemClientSetMatching(self->_hidEventSystem, v4);
        IOHIDEventSystemClientScheduleWithRunLoop(self->_hidEventSystem, qword_10007CB20, kCFRunLoopDefaultMode);
        CFRelease(v5);
        v6 = -[AmbientLightSensorComponent copySensorArray](self, "copySensorArray");
        if (v6)
        {
          v7 = v6;
          if (CFArrayGetCount(v6) >= 1)
          {
            ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v7, 0LL);
            self->_service = ValueAtIndex;
            if (ValueAtIndex)
            {
              IOHIDServiceClientRegisterRemovalCallback(ValueAtIndex, sub_100021A40, 0LL, 0LL);
            }

            else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
            {
              sub_100038C84();
            }
          }

          CFRelease(v7);
        }
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_100038C58();
    }
  }

- (BOOL)synchContext
{
  service = self->_service;
  if (!service)
  {
    -[AmbientLightSensorComponent initHIDServices](self, "initHIDServices");
LABEL_11:
    LOBYTE(v10) = 0;
    return v10;
  }

  uint64_t v4 = IOHIDServiceClientCopyEvent(service, 12LL, 0LL, 0LL);
  if (!v4)
  {
    BOOL v10 = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
    if (!v10) {
      return v10;
    }
    sub_100038CB0();
    goto LABEL_11;
  }

  CFDictionaryRef v5 = (const void *)v4;
  self->ALS_FS = IOHIDEventGetIntegerValue(v4, 786433LL);
  int IntegerValue = IOHIDEventGetIntegerValue(v5, 786434LL);
  self->ALS_IR = IntegerValue;
  int v7 = (int)((double)self->ALS_FS * -0.234 + 500.0 + (double)IntegerValue * 0.234);
  self->IR_PRED = v7;
  int v8 = (int)((double)self->ALS_IR * 0.5 + 50.0 + (double)v7 * -0.5);
  if (v8 <= -350) {
    int v8 = -350;
  }
  if (v8 >= 450) {
    int v8 = 450;
  }
  self->unsigned int temperature = v8;
  CFRelease(v5);
  self->previousSunlightLoadingIndexValue = self->sunlightLoadingIndexValue;
  if (dword_10007CB4C < 0) {
    goto LABEL_17;
  }
  if (dword_10007CB4C) {
    goto LABEL_9;
  }
  unsigned int temperature = self->temperature;
  if ((temperature & 0x80000000) != 0)
  {
LABEL_17:
    int sunlightLoadingIndexValue = 0;
    self->int sunlightLoadingIndexValue = 0;
    goto LABEL_18;
  }

  if (temperature <= 0x64)
  {
    int sunlightLoadingIndexValue = self->sunlightLoadingIndexValue;
    goto LABEL_18;
  }

- (__CFArray)copySensorArray
{
  CFArrayRef v3 = IOHIDEventSystemClientCopyServices(self->_hidEventSystem);
  uint64_t v4 = v3;
  if (!v3 || (CFTypeID v5 = CFGetTypeID(v3), v5 != CFArrayGetTypeID()) || CFArrayGetCount(v4) <= 0)
  {
    hidEventSystem = self->_hidEventSystem;
    if (hidEventSystem)
    {
      IOHIDEventSystemClientUnscheduleWithRunLoop(hidEventSystem, qword_10007CB20, kCFRunLoopDefaultMode);
      CFRelease(self->_hidEventSystem);
      self->_hidEventSystem = 0LL;
    }

    v14 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_100038D08(v14);
      if (!v4) {
        return 0LL;
      }
    }

    else if (!v4)
    {
      return 0LL;
    }

    v15 = v4;
LABEL_21:
    CFRelease(v15);
    return 0LL;
  }

  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (CFArrayGetCount(v4) >= 1)
  {
    CFIndex v7 = 0LL;
    do
    {
      ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v4, v7);
      int v9 = sub_10002317C(ValueAtIndex, @"PrimaryUsage");
      ++v7;
    }

    while (CFArrayGetCount(v4) > v7);
  }

  CFRelease(v4);
  if (!CFArrayGetCount(Mutable))
  {
    v15 = Mutable;
    goto LABEL_21;
  }

  if (Mutable)
  {
    Copy = CFArrayCreateCopy(kCFAllocatorDefault, Mutable);
    CFRelease(Mutable);
    return Copy;
  }

  return 0LL;
}

- (int)numberOfFields
{
  return 3;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  else {
    return off_100060D40[a3];
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  else {
    return (__CFString *)CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%d",  *(unsigned int *)((char *)&self->super.super.isa + *off_100060D58[a3]));
  }
}

- (int)temperature
{
  return self->temperature;
}

- (int)ALS_FS
{
  return self->ALS_FS;
}

- (int)ALS_IR
{
  return self->ALS_IR;
}

- (int)IR_PRED
{
  return self->IR_PRED;
}

@end