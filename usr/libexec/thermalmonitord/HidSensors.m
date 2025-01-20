@interface HidSensors
+ (id)sharedInstance;
- (BOOL)isBatterySensor:(__CFString *)a3;
- (BOOL)isPowerSensor:(__CFString *)a3;
- (BOOL)isSending2DTempGridToDisplayDriverEnabled;
- (BOOL)isSensorDataValid;
- (BOOL)isTempSensorDataValid:(__CFString *)a3 value:(int)a4;
- (BOOL)isVirtualTempDispatchEnabled;
- (BOOL)readFailuresExpected:(__CFString *)a3;
- (BOOL)shouldRetrieveSensor:(__CFString *)a3;
- (BOOL)staleValueExpected:(__CFString *)a3;
- (HidSensors)init;
- (__CFArray)copySensorArray;
- (__CFArray)hidSensorKeys;
- (__CFArray)sensorFourCharCode;
- (__CFArray)synthSensorKeys;
- (__CFDictionary)getHIDSensorDict;
- (__CFString)getSensor4CCFromIndex:(int64_t)a3;
- (char)readHIDDebugDictionaryAndReturnErrorCode;
- (iir_filter_t)getFilterTable;
- (int)callbackSensorInterval:(__CFString *)a3;
- (int)getFilterTimeConstantForSensor:(int64_t)a3;
- (int)getPowerSensorIndex:(__CFString *)a3;
- (int)indexForTempSensorKey:(__CFString *)a3;
- (int)sendToService:(__CFString *)a3 value:(void *)a4;
- (int)temperatureForKey:(__CFString *)a3;
- (unint64_t)getWatchDogMask;
- (unsigned)getSensorIndexFrom4CC:(__CFString *)a3;
- (void)createHIDEventSystemObject;
- (void)dealloc;
- (void)enableDispatchVirtualTemp;
- (void)enableSending2DTempGridToDisplayDriver;
- (void)handleTemperatureEvent:(int)a3 service:(__IOHIDServiceClient *)a4;
- (void)initLocationStrings;
- (void)loadProductPowerParameters:(__CFArray *)a3;
- (void)loadProductTemperatureParameters:(__CFArray *)a3;
- (void)resetHIDSensorDictionary;
- (void)sendVirtualTemp:(int)a3 temperature:(int)a4;
- (void)setInfoOnlySensorsActive:(BOOL)a3;
@end

@implementation HidSensors

+ (id)sharedInstance
{
  if (qword_100074A98 != -1) {
    dispatch_once(&qword_100074A98, &stru_100060C10);
  }
  return (id)qword_100074AA0;
}

- (HidSensors)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___HidSensors;
  v2 = -[HidSensors init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_infoOnlySensorsActive = 0;
    v2->sensorWatchdogMask = 0LL;
    v2->hidSensorKeys = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    v3->sensorFourCharCode = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    v3->synthSensorKeys = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    v3->_tempOffsetDict = 0LL;
    v3->_dispatchVirtualTemp = 0;
    v3->_shadowSensorCount = 0;
    v3->_infoOnlyHIDSensors = 0LL;
    v3->_callbackSensorIntervals = 0LL;
    v3->_potentiallyStaleSensorDefaults = 0LL;
    v3->_callbackTemperaturesQueue = 0LL;
    v3->_potentiallyStaleSensorTimestamps = Mutable;
  }

  return v3;
}

- (void)dealloc
{
  potentiallyStaleSensorDefaults = self->_potentiallyStaleSensorDefaults;
  if (potentiallyStaleSensorDefaults) {
    CFRelease(potentiallyStaleSensorDefaults);
  }
  potentiallyStaleSensorTimestamps = self->_potentiallyStaleSensorTimestamps;
  if (potentiallyStaleSensorTimestamps) {
    CFRelease(potentiallyStaleSensorTimestamps);
  }
  infoOnlyHIDSensors = self->_infoOnlyHIDSensors;
  if (infoOnlyHIDSensors) {
    CFRelease(infoOnlyHIDSensors);
  }
  tempOffsetDict = self->_tempOffsetDict;
  if (tempOffsetDict) {
    CFRelease(tempOffsetDict);
  }
  synthSensorKeys = self->synthSensorKeys;
  if (synthSensorKeys) {
    CFRelease(synthSensorKeys);
  }
  sensorFourCharCode = self->sensorFourCharCode;
  if (sensorFourCharCode) {
    CFRelease(sensorFourCharCode);
  }
  hidSensorKeys = self->hidSensorKeys;
  if (hidSensorKeys) {
    CFRelease(hidSensorKeys);
  }
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___HidSensors;
  -[HidSensors dealloc](&v10, "dealloc");
}

- (iir_filter_t)getFilterTable
{
  return self->filterParams;
}

- (unsigned)getSensorIndexFrom4CC:(__CFString *)a3
{
  sensorFourCharCode = self->sensorFourCharCode;
  if (sensorFourCharCode)
  {
    CFIndex Count = CFArrayGetCount(sensorFourCharCode);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      for (CFIndex i = 0LL; i != v7; ++i)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(self->sensorFourCharCode, i);
        if (ValueAtIndex && (objc_super v10 = ValueAtIndex, v11 = CFGetTypeID(ValueAtIndex), v11 == CFStringGetTypeID()))
        {
          if (CFStringCompare(a3, v10, 0LL) == kCFCompareEqualTo) {
            return i;
          }
        }

        else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
        {
          sub_100038304(&v13, v14);
        }
      }
    }
  }

  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_1000382D4();
  }
  LODWORD(i) = -1;
  return i;
}

- (__CFString)getSensor4CCFromIndex:(int64_t)a3
{
  if (a3 < 0) {
    return 0LL;
  }
  sensorFourCharCode = self->sensorFourCharCode;
  if (!sensorFourCharCode) {
    return 0LL;
  }
  else {
    return (__CFString *)CFArrayGetValueAtIndex(sensorFourCharCode, a3);
  }
}

- (unint64_t)getWatchDogMask
{
  return self->sensorWatchdogMask;
}

- (void)loadProductTemperatureParameters:(__CFArray *)a3
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  objc_super v6 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFIndex v7 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v8 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v9 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (Mutable) {
    BOOL v10 = v6 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v7 == 0LL)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100038330();
    }
  }

  else
  {
    theDict = v8;
    v25 = v9;
    if (CFArrayGetCount(a3) >= 1)
    {
      CFIndex v12 = 0LL;
      p_last = &self->filterParams[0].last;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v12);
        if (ValueAtIndex && (v15 = ValueAtIndex, CFTypeID v16 = CFGetTypeID(ValueAtIndex), v16 == CFDictionaryGetTypeID()))
        {
          v39 = 0LL;
          if (sub_1000210AC(v15, @"4CharCode", &v39))
          {
            CFArrayAppendValue(self->sensorFourCharCode, v39);
          }

          else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
          {
            sub_100038414(&v37, v38);
          }

          if ((sub_1000210AC(v15, @"matchName", &v39) & 1) == 0
            && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
          {
            sub_1000383E8(&v35, v36);
          }

          int v34 = 0;
          if ((sub_100020FE0(v15, @"filterParams", kCFNumberSInt32Type, &v34) & 1) == 0
            && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
          {
            sub_1000383BC(&v32, v33);
          }

          int v17 = sub_100020F54(v15, @"filterParams_INTMIN");
          *(p_last - 1) = v34;
          int *p_last = v17 << 31;
          if (sub_100020F6C(v15, @"requiresWatchDog", 1LL)) {
            self->sensorWatchdogMask |= 1LL << v12;
          }
          BOOL v18 = sub_100020F54(v15, @"synthSensor");
          uint64_t v19 = 9LL;
          if (!v18) {
            uint64_t v19 = 7LL;
          }
          CFArrayAppendValue((CFMutableArrayRef)(&self->super.isa)[v19], v39);
          if (sub_100020F54(v15, @"shadowSensor")) {
            ++self->_shadowSensorCount;
          }
          if (sub_100020F6C(v15, @"infoOnly", 0LL)) {
            CFDictionarySetValue(Mutable, v39, kCFBooleanTrue);
          }
          if (sub_100020F6C(v15, @"readFailuresExpected", 0LL)) {
            CFDictionarySetValue(theDict, v39, kCFBooleanTrue);
          }
          int valuePtr = 0;
          sub_100020FE0(v15, @"callbackInterval", kCFNumberSInt32Type, &valuePtr);
          if (valuePtr >= 1) {
            sub_1000211FC(v6, v39, kCFNumberSInt32Type, &valuePtr);
          }
          int v30 = 0;
          if (sub_100020FE0(v15, @"staleDefault", kCFNumberSInt32Type, &v30))
          {
            sub_1000211FC(v7, v39, kCFNumberSInt32Type, &v30);
            *(void *)buf = 0LL;
            sub_1000211FC(self->_potentiallyStaleSensorTimestamps, v39, kCFNumberLongType, buf);
          }

          int v29 = 0;
          if (byte_10007D470 && sub_1000210AC(v15, @"smcExchangeGroupKey", &v39))
          {
            if (byte_10007CB30)
            {
              v20 = (os_log_s *)qword_10007CF50;
              if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v12;
                __int16 v41 = 2112;
                v42 = v39;
                _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "<Notice> Sensor # %d is specified for SMC sensor group %@",  buf,  0x12u);
              }
            }

            unsigned int v28 = -1;
            if (sub_100020FE0(v15, @"smcExchangeIndex", kCFNumberSInt32Type, &v28))
            {
              if ((v28 & 0x80000000) == 0)
              {
                v21 = +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance");
                -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( v21,  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  v12,  v39,  v28);
              }
            }

            else
            {
              v22 = (os_log_s *)qword_10007CF50;
              if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&buf[4] = v12;
                _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "<Error> Couldn't find expected smcExchangeIndex value for sensor %d",  buf,  8u);
              }
            }
          }
        }

        else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
        {
          sub_100038390(&v26, v27);
        }

        ++v12;
        p_last += 2;
      }

      while (CFArrayGetCount(a3) > v12);
    }

    if (CFDictionaryGetCount(Mutable) >= 1)
    {
      self->_infoOnlyHIDSensors = CFDictionaryCreateCopy(kCFAllocatorDefault, Mutable);
      CFDictionaryRemoveAllValues(Mutable);
    }

    CFRelease(Mutable);
    if (theDict)
    {
      if (CFDictionaryGetCount(theDict) >= 1)
      {
        self->_readFailuresExpected = CFDictionaryCreateCopy(kCFAllocatorDefault, theDict);
        CFDictionaryRemoveAllValues(theDict);
      }

      CFRelease(theDict);
    }

    if (CFDictionaryGetCount(v6) >= 1)
    {
      self->_callbackSensorIntervals = CFDictionaryCreateCopy(kCFAllocatorDefault, v6);
      CFDictionaryRemoveAllValues(v6);
      v23 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.hidsensors", 0LL);
      self->_callbackTemperaturesQueue = v23;
      if (!v23 && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_100038360();
      }
    }

    CFRelease(v6);
    if (CFDictionaryGetCount(v7) >= 1)
    {
      self->_potentiallyStaleSensorDefaults = CFDictionaryCreateCopy(kCFAllocatorDefault, v7);
      CFDictionaryRemoveAllValues(v7);
    }

    CFRelease(v7);
    if (v25)
    {
      if (CFDictionaryGetCount(v25) >= 1)
      {
        self->_tempOffsetDict = CFDictionaryCreateCopy(kCFAllocatorDefault, v25);
        CFDictionaryRemoveAllValues(v25);
      }

      CFRelease(v25);
    }
  }

- (void)loadProductPowerParameters:(__CFArray *)a3
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    objc_super v6 = Mutable;
    LODWORD(idx) = 0;
    if (CFArrayGetCount(a3) >= 1)
    {
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, (int)idx);
        if (ValueAtIndex)
        {
          CFMutableDictionaryRef v8 = ValueAtIndex;
          CFTypeID v9 = CFGetTypeID(ValueAtIndex);
          if (v9 == CFDictionaryGetTypeID())
          {
            value = 0LL;
            if (sub_1000210AC(v8, @"4CharCode", &value))
            {
              CFArrayAppendValue(self->sensorFourCharCode, value);
            }

            else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
            {
              sub_100038414(&v15, v16);
            }

            if ((sub_1000210AC(v8, @"matchName", &value) & 1) == 0
              && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
            {
              sub_1000383E8(&v13, v14);
            }

            CFArrayAppendValue(self->hidSensorKeys, value);
            CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &idx);
            if (v10)
            {
              CFNumberRef v11 = v10;
              CFDictionarySetValue(v6, value, v10);
              CFRelease(v11);
            }
          }
        }

        CFIndex v12 = (int)idx + 1LL;
        LODWORD(idx) = idx + 1;
      }

      while (CFArrayGetCount(a3) > v12);
    }

    if (CFDictionaryGetCount(v6) > 0)
    {
      self->_powerSensors = CFDictionaryCreateCopy(kCFAllocatorDefault, v6);
      CFDictionaryRemoveAllValues(v6);
    }

    CFRelease(v6);
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_100038440();
  }

- (void)enableDispatchVirtualTemp
{
  self->_dispatchVirtualTemp = 1;
}

- (BOOL)isVirtualTempDispatchEnabled
{
  return self->_dispatchVirtualTemp;
}

- (void)enableSending2DTempGridToDisplayDriver
{
  self->_send2DTempGrid = 1;
}

- (BOOL)isSending2DTempGridToDisplayDriverEnabled
{
  return self->_send2DTempGrid;
}

- (void)resetHIDSensorDictionary
{
  v3 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFMutableDictionaryRef v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "<Notice> resetting HID sensor dictionary",  v8,  2u);
  }

  tempSensors = self->_tempSensors;
  if (tempSensors) {
    CFRelease(tempSensors);
  }
  sensorDict = self->_sensorDict;
  if (sensorDict) {
    CFRelease(sensorDict);
  }
  serviceToName = self->_serviceToName;
  if (serviceToName) {
    CFRelease(serviceToName);
  }
  callbackTemperatures = self->_callbackTemperatures;
  if (callbackTemperatures) {
    CFRelease(callbackTemperatures);
  }
  self->_tempSensors = 0LL;
  self->_callbackTemperatures = 0LL;
  self->_sensorDict = 0LL;
  self->_serviceToName = 0LL;
}

- (int)sendToService:(__CFString *)a3 value:(void *)a4
{
  if (qword_100074AA8 == -1)
  {
    if (!a3) {
      return 5;
    }
  }

  else
  {
    dispatch_once(&qword_100074AA8, &stru_100060C30);
    if (!a3) {
      return 5;
    }
  }

  if (dword_100074AB0) {
    return IORegistryEntrySetCFProperty(dword_100074AB0, a3, a4);
  }
  return 5;
}

- (void)sendVirtualTemp:(int)a3 temperature:(int)a4
{
  if (-[HidSensors isVirtualTempDispatchEnabled]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "isVirtualTempDispatchEnabled"))
  {
    CFIndex v7 = -[HidSensors getSensor4CCFromIndex:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "getSensor4CCFromIndex:",  a3);
    double v8 = (float)a4 / 100.0;
    if (v8 >= 0.0) {
      double v9 = v8 * 65536.0 + 0.5;
    }
    else {
      double v9 = v8 * 65536.0 + -0.5;
    }
    int valuePtr = (int)v9;
    CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v10)
    {
      CFNumberRef v11 = v10;
      mach_error_t v12 = -[HidSensors sendToService:value:](self, "sendToService:value:", v7, v10);
      CFRelease(v11);
      if (!v12) {
        return;
      }
    }

    else
    {
      mach_error_t v12 = 5;
    }

    char v13 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_1000384E4(v12, v13);
    }
  }

- (void)initLocationStrings
{
  if (-[HidSensors isVirtualTempDispatchEnabled]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "isVirtualTempDispatchEnabled"))
  {
    CFIndex Count = CFArrayGetCount( -[HidSensors hidSensorKeys]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "hidSensorKeys"));
    CFIndex v4 = CFArrayGetCount( -[HidSensors synthSensorKeys]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "synthSensorKeys"));
    if (v4 >= 1)
    {
      CFIndex v5 = 0LL;
      CFIndex v6 = v4 + Count;
      do
      {
        -[HidSensors sendToService:value:]( self,  "sendToService:value:",  -[HidSensors getSensor4CCFromIndex:]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "getSensor4CCFromIndex:",  Count + v5),  CFArrayGetValueAtIndex(self->synthSensorKeys, v5));
        ++v5;
      }

      while (Count + v5 < v6);
    }
  }

- (BOOL)shouldRetrieveSensor:(__CFString *)a3
{
  infoOnlyHIDSensors = self->_infoOnlyHIDSensors;
  return !infoOnlyHIDSensors || !CFDictionaryContainsKey(infoOnlyHIDSensors, a3) || self->_infoOnlySensorsActive;
}

- (BOOL)readFailuresExpected:(__CFString *)a3
{
  readFailuresExpected = self->_readFailuresExpected;
  if (readFailuresExpected)
  {
    LODWORD(readFailuresExpected) = CFDictionaryContainsKey(readFailuresExpected, a3);
    if ((_DWORD)readFailuresExpected) {
      LOBYTE(readFailuresExpected) = CFDictionaryGetValue(self->_readFailuresExpected, a3) != 0LL;
    }
  }

  return (char)readFailuresExpected;
}

- (BOOL)staleValueExpected:(__CFString *)a3
{
  potentiallyStaleSensorDefaults = self->_potentiallyStaleSensorDefaults;
  if (potentiallyStaleSensorDefaults)
  {
    LODWORD(potentiallyStaleSensorDefaults) = CFDictionaryContainsKey(potentiallyStaleSensorDefaults, a3);
    if ((_DWORD)potentiallyStaleSensorDefaults) {
      LOBYTE(potentiallyStaleSensorDefaults) = CFDictionaryGetValue(self->_potentiallyStaleSensorDefaults, a3) != 0LL;
    }
  }

  return (char)potentiallyStaleSensorDefaults;
}

- (BOOL)isPowerSensor:(__CFString *)a3
{
  powerSensors = self->_powerSensors;
  return powerSensors && CFDictionaryContainsKey(powerSensors, a3);
}

- (BOOL)isBatterySensor:(__CFString *)a3
{
  return CFStringCompare(a3, @"gas gauge battery", 0LL) == kCFCompareEqualTo
      || CFStringCompare(a3, @"TG0B", 0LL) == kCFCompareEqualTo
      || CFStringCompare(a3, @"TG0V", 0LL) == kCFCompareEqualTo;
}

- (int)getPowerSensorIndex:(__CFString *)a3
{
  int v9 = 0;
  powerSensors = self->_powerSensors;
  if (!powerSensors || !CFDictionaryContainsKey(powerSensors, a3)) {
    return 0;
  }
  sub_100020FE0(self->_powerSensors, a3, kCFNumberIntType, &v9);
  int v6 = v9;
  if (v9 >= 11)
  {
    CFIndex v7 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFNumberRef v11 = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "<Error> Could not get the index for power sensor %@",  buf,  0xCu);
      return v9;
    }
  }

  return v6;
}

- (void)setInfoOnlySensorsActive:(BOOL)a3
{
  self->_infoOnlySensorsActive = a3;
}

- (int)callbackSensorInterval:(__CFString *)a3
{
  callbackSensorIntervals = self->_callbackSensorIntervals;
  if (callbackSensorIntervals)
  {
    int v5 = 0;
    sub_100020FE0(callbackSensorIntervals, a3, kCFNumberIntType, &v5);
    LODWORD(callbackSensorIntervals) = 1000000 * v5;
  }

  return (int)callbackSensorIntervals;
}

- (int)indexForTempSensorKey:(__CFString *)a3
{
  tempSensors = self->_tempSensors;
  if (tempSensors)
  {
    int Count = CFArrayGetCount(tempSensors);
    if (Count >= 1)
    {
      CFIndex v7 = 0LL;
      uint64_t v8 = Count;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(self->_tempSensors, v7);
        if (ValueAtIndex)
        {
          Value = (const __CFString *)CFDictionaryGetValue(self->_serviceToName, ValueAtIndex);
          if (Value)
          {
            if (CFStringCompare(Value, a3, 0LL) == kCFCompareEqualTo) {
              return v7;
            }
          }

          else
          {
            mach_error_t v12 = (os_log_s *)qword_10007CF50;
            if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
              sub_1000385A8(v16, &v17, v12);
            }
          }
        }

        else
        {
          CFNumberRef v11 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
            sub_100038564(v14, &v15, v11);
          }
        }

        ++v7;
      }

      while (v8 != v7);
    }
  }

  LODWORD(v7) = -1;
  return v7;
}

- (int)temperatureForKey:(__CFString *)a3
{
  if (!self->_tempSensors) {
    return -32768;
  }
  unsigned int v4 = -[HidSensors indexForTempSensorKey:](self, "indexForTempSensorKey:", a3);
  if ((v4 & 0x80000000) != 0)
  {
    int v9 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_1000386D4(v9, v10, v11);
    }
    return -32768;
  }

  ValueAtIndex = CFArrayGetValueAtIndex(self->_tempSensors, v4);
  if (!ValueAtIndex)
  {
    mach_error_t v12 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_1000385EC(v12, v13, v14);
    }
    return -32768;
  }

  uint64_t v6 = IOHIDServiceClientCopyEvent(ValueAtIndex, 15LL, 0LL, 0LL);
  if (!v6)
  {
    uint64_t v15 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100038660(v15, v16, v17);
    }
    return -32768;
  }

  CFIndex v7 = (const void *)v6;
  int v8 = (int)(IOHIDEventGetFloatValue(v6, 983040LL) * 100.0);
  CFRelease(v7);
  return v8;
}

- (int)getFilterTimeConstantForSensor:(int64_t)a3
{
  if (a3 <= 63) {
    return self->filterParams[a3].time_constant;
  }
  int v5 = (os_log_s *)qword_10007CF50;
  int result = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100038748(a3, v5, v6);
    return 0;
  }

  return result;
}

- (BOOL)isTempSensorDataValid:(__CFString *)a3 value:(int)a4
{
  unsigned int v4 = a4 + 3999;
  if ((a4 + 3999) >= 0x4A37)
  {
    CFIndex v7 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_1000387B0((uint64_t)a3, a4, v7);
    }
  }

  return v4 < 0x4A37;
}

- (__CFDictionary)getHIDSensorDict
{
  self->_isSensorDataValid = 1;
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (!self->_tempSensors)
  {
    if (self->_hidEventSystem
      || (-[HidSensors createHIDEventSystemObject](self, "createHIDEventSystemObject"), self->_hidEventSystem))
    {
      v33 = -[HidSensors copySensorArray](self, "copySensorArray");
      self->_tempSensors = v33;
      if (v33)
      {
LABEL_75:
        CFIndex Count = CFArrayGetCount(v33);
        self->_count = Count;
        if (Count <= 0)
        {
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
            sub_100038830();
          }
          CFRelease(self->_tempSensors);
          int result = 0LL;
          self->_tempSensors = 0LL;
          return result;
        }

        if (self->_callbackTemperaturesQueue)
        {
          self->_callbackTemperatures = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  0LL,  &kCFTypeDictionaryValueCallBacks);
          IOHIDEventSystemClientRegisterEventCallback(self->_hidEventSystem, sub_100005864, self, 0LL);
        }

        self->_sensorDict = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        self->_serviceToName = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  0LL,  &kCFTypeDictionaryValueCallBacks);
        char v35 = -[HidSensors hidSensorKeys]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "hidSensorKeys");
        tempSensors = self->_tempSensors;
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472LL;
        v50[2] = sub_100007800;
        v50[3] = &unk_100060C80;
        v50[4] = v3;
        v50[5] = v35;
        v50[6] = self;
        char v37 = (__CFArray *)-[__CFArray filteredArrayUsingPredicate:]( tempSensors,  "filteredArrayUsingPredicate:",  +[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v50));
        CFRelease(self->_tempSensors);
        self->_tempSensors = v37;
        if (v37)
        {
          CFRetain(v37);
          CFIndex v38 = CFArrayGetCount(self->_tempSensors);
          self->_count = v38;
          if (v38 != CFArrayGetCount(self->hidSensorKeys) - self->_shadowSensorCount
            && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
          {
            sub_100038890();
          }

          goto LABEL_2;
        }

        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_100038860();
        }
        return 0LL;
      }
    }

    else
    {
      v33 = self->_tempSensors;
      if (v33) {
        goto LABEL_75;
      }
    }

    v39 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "<Notice> Could not create HIDArray (will retry)",  buf,  2u);
    }

    return 0LL;
  }

- (void)createHIDEventSystemObject
{
  if (!self->_hidEventSystem)
  {
    v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(kCFAllocatorDefault, a2);
    self->_hidEventSystem = v3;
    if (v3)
    {
      CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
      CFDictionaryRef v5 = sub_1000230AC(65280, 5);
      if (v5)
      {
        CFDictionaryRef v6 = v5;
        CFArrayAppendValue(Mutable, v5);
        CFRelease(v6);
      }

      CFDictionaryRef v7 = sub_1000230AC(65288, 1);
      if (v7)
      {
        CFDictionaryRef v8 = v7;
        CFArrayAppendValue(Mutable, v7);
        CFRelease(v8);
      }

      CFDictionaryRef v9 = sub_1000230AC(32, 49);
      if (v9)
      {
        CFDictionaryRef v10 = v9;
        CFArrayAppendValue(Mutable, v9);
        CFRelease(v10);
      }

      if (Mutable)
      {
        IOHIDEventSystemClientSetMatchingMultiple(self->_hidEventSystem, Mutable);
        CFRelease(Mutable);
        IOHIDEventSystemClientScheduleWithRunLoop(self->_hidEventSystem, qword_10007CB20, kCFRunLoopDefaultMode);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_1000388F0();
        }
        CFRelease(self->_hidEventSystem);
        self->_hidEventSystem = 0LL;
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_1000388C0();
    }
  }

- (__CFArray)copySensorArray
{
  CFArrayRef v3 = IOHIDEventSystemClientCopyServices(self->_hidEventSystem);
  unsigned int v4 = v3;
  if (!v3 || (CFTypeID v5 = CFGetTypeID(v3), v5 != CFArrayGetTypeID()) || CFArrayGetCount(v4) <= 0)
  {
    hidEventSystem = self->_hidEventSystem;
    if (hidEventSystem)
    {
      IOHIDEventSystemClientUnscheduleWithRunLoop(hidEventSystem, qword_10007CB20, kCFRunLoopDefaultMode);
      CFRelease(self->_hidEventSystem);
      self->_hidEventSystem = 0LL;
    }

    unsigned int v15 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_100038920(v15);
      if (!v4) {
        return 0LL;
      }
    }

    else if (!v4)
    {
      return 0LL;
    }

    CFNumberRef v13 = v4;
LABEL_25:
    CFRelease(v13);
    return 0LL;
  }

  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (CFArrayGetCount(v4) >= 1)
  {
    CFIndex v7 = 0LL;
    do
    {
      ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v4, v7);
      unsigned int v9 = sub_10002317C(ValueAtIndex, @"PrimaryUsage");
      int v10 = sub_10002317C(ValueAtIndex, @"PrimaryUsagePage");
      BOOL v12 = v10 == 32 || v10 == 65288 || v10 == 65280;
      if (v12 && v9 <= 0x31 && ((1LL << v9) & 0x2000000000022LL) != 0) {
        CFArrayAppendValue(Mutable, ValueAtIndex);
      }
      ++v7;
    }

    while (CFArrayGetCount(v4) > v7);
  }

  CFRelease(v4);
  if (!CFArrayGetCount(Mutable))
  {
    CFNumberRef v13 = Mutable;
    goto LABEL_25;
  }

  return Mutable;
}

- (void)handleTemperatureEvent:(int)a3 service:(__IOHIDServiceClient *)a4
{
  callbackTemperaturesQueue = (dispatch_queue_s *)self->_callbackTemperaturesQueue;
  if (callbackTemperaturesQueue)
  {
    if (self->_serviceToName)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100007F54;
      block[3] = &unk_100060CD0;
      block[4] = self;
      block[5] = a4;
      int v7 = a3;
      dispatch_async(callbackTemperaturesQueue, block);
    }
  }

- (char)readHIDDebugDictionaryAndReturnErrorCode
{
  v2 = (char *)malloc(0x32uLL);
  char *v2 = 0;
  uint64_t valuePtr = 0LL;
  CFStringRef theString1 = 0LL;
  unsigned int v4 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(kCFAllocatorDefault, v3);
  IOHIDEventSystemClientSetMatching(v4, &off_100067D98);
  CFTypeID v5 = IOHIDEventSystemClientCopyServices(v4);
  if (v5)
  {
    CFDictionaryRef v6 = v5;
    if (CFArrayGetCount(v5))
    {
      ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v6, 0LL);
      CFDictionaryRef v8 = (const __CFDictionary *)IOHIDServiceClientCopyProperty(ValueAtIndex, @"ServicePluginDebug");
      if (v8)
      {
        unsigned int v9 = v8;
        CFTypeID v10 = CFGetTypeID(v8);
        if (v10 == CFDictionaryGetTypeID()
          && sub_1000210AC(v9, @"PluginName", &theString1)
          && CFStringCompare(theString1, @"AppleHDQGasGaugeHID", 0LL) == kCFCompareEqualTo)
        {
          if (clock_gettime(_CLOCK_UPTIME_RAW_APPROX, &__tp)) {
            uint64_t v12 = 0LL;
          }
          else {
            uint64_t v12 = __tp.tv_nsec / 1000 + 1000000 * __tp.tv_sec;
          }
          CFNumberRef v13 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            int v29 = v9;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "<Notice> %@HID Debug Dict", buf, 0xCu);
          }

          Value = CFDictionaryGetValue(v9, @"ErrorHistory");
          if (sub_100020FE0(v9, @"LastCalledTs", kCFNumberCFIndexType, &v24)
            && sub_100020FE0(v9, @"LastSuccessTs", kCFNumberCFIndexType, &v23)
            && ((BOOL v15 = (unint64_t)(v12 - v23) > 0x98967FF, (unint64_t)(v12 - v24) <= 0x98967FF)
              ? (int v16 = (unint64_t)(v12 - v23) > 0x98967FF)
              : (int v16 = v15 | 2),
                v16))
          {
            __sprintf_chk(v26, 0, 2uLL, "%d", v16);
            sub_100022E88(v2, "EC: ", 0x32uLL);
            sub_100022E88(v2, v26, 0x32uLL);
          }

          else
          {
            BOOL v15 = 0;
          }

          if (Value)
          {
            CFTypeID v17 = CFGetTypeID(Value);
            CFTypeID TypeID = CFArrayGetTypeID();
            if (v15 && v17 == TypeID)
            {
              sub_100022E88(v2, " EH: ", 0x32uLL);
              CFIndex Count = CFArrayGetCount((CFArrayRef)Value);
              v20 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)Value, Count - 1);
              CFNumberGetValue(v20, kCFNumberIntType, &valuePtr);
              __sprintf_chk((char *)buf, 0, 0x32uLL, "%u", valuePtr);
              sub_100022E88(v2, (const char *)buf, 0x32uLL);
              if (Count >= 2)
              {
                v21 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)Value, Count - 2);
                CFNumberGetValue(v21, kCFNumberIntType, (char *)&valuePtr + 4);
                __sprintf_chk((char *)buf, 0, 0x32uLL, "%u", HIDWORD(valuePtr));
                sub_100022E88(v2, " ", 0x32uLL);
                sub_100022E88(v2, (const char *)buf, 0x32uLL);
              }
            }
          }
        }

        CFRelease(v9);
      }
    }

    CFRelease(v6);
  }

  if (v4) {
    CFRelease(v4);
  }
  return v2;
}

- (BOOL)isSensorDataValid
{
  return self->_isSensorDataValid;
}

- (__CFArray)hidSensorKeys
{
  return self->hidSensorKeys;
}

- (__CFArray)sensorFourCharCode
{
  return self->sensorFourCharCode;
}

- (__CFArray)synthSensorKeys
{
  return self->synthSensorKeys;
}

@end