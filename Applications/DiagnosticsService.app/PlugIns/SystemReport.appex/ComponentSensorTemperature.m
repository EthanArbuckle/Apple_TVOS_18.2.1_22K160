@interface ComponentSensorTemperature
- (BOOL)isPresent;
- (BOOL)systemClientSetup;
- (__IOHIDEventSystemClient)HIDEventSystem;
- (id)celsiusTemperatureFromService:(__IOHIDServiceClient *)a3;
- (id)parseHIDLocationID:(int)a3;
- (id)temperatureData;
- (void)populateAttributes:(id)a3;
- (void)setHIDEventSystem:(__IOHIDEventSystemClient *)a3;
- (void)systemClientRelease;
@end

@implementation ComponentSensorTemperature

- (BOOL)isPresent
{
  if (!-[ComponentSensorTemperature systemClientSetup](self, "systemClientSetup")) {
    return 0;
  }
  CFArrayRef v3 = IOHIDEventSystemClientCopyServices(-[ComponentSensorTemperature HIDEventSystem](self, "HIDEventSystem"));
  BOOL v4 = v3 != 0LL;
  if (v3) {
    CFRelease(v3);
  }
  -[ComponentSensorTemperature systemClientRelease](self, "systemClientRelease");
  return v4;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ComponentSensorTemperature temperatureData](self, "temperatureData"));
  [v4 addEntriesFromDictionary:v5];
}

- (__IOHIDEventSystemClient)HIDEventSystem
{
  result = self->_HIDEventSystem;
  if (!result)
  {
    result = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(kCFAllocatorDefault, a2);
    self->_HIDEventSystem = result;
    if (!result)
    {
      uint64_t v4 = DiagnosticLogHandleForCategory(6LL);
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "[ERROR] - Could not create HID event system.",  v6,  2u);
      }

      return self->_HIDEventSystem;
    }
  }

  return result;
}

- (BOOL)systemClientSetup
{
  CFArrayRef v3 = -[ComponentSensorTemperature HIDEventSystem](self, "HIDEventSystem");
  if (v3)
  {
    v6[0] = @"PrimaryUsagePage";
    v6[1] = @"PrimaryUsage";
    v7[0] = &off_10008E848;
    v7[1] = &off_10008E860;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));
    IOHIDEventSystemClientSetMatching(-[ComponentSensorTemperature HIDEventSystem](self, "HIDEventSystem"), v4);
  }

  return v3 != 0LL;
}

- (void)systemClientRelease
{
  if (-[ComponentSensorTemperature HIDEventSystem](self, "HIDEventSystem"))
  {
    CFRelease(-[ComponentSensorTemperature HIDEventSystem](self, "HIDEventSystem"));
    -[ComponentSensorTemperature setHIDEventSystem:](self, "setHIDEventSystem:", 0LL);
  }

- (id)parseHIDLocationID:(int)a3
{
  if (a3 < 0 || (_DefaultRuneLocale.__runetype[HIBYTE(a3)] & 0x200) != 0) {
    CFArrayRef v3 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%3ld ", a3, v5, v6, v7);
  }
  else {
    CFArrayRef v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%c%c%c%c",  HIBYTE(a3),  BYTE2(a3),  BYTE1(a3),  a3);
  }
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)celsiusTemperatureFromService:(__IOHIDServiceClient *)a3
{
  CFArrayRef v3 = (void *)IOHIDServiceClientCopyEvent(a3, 15LL, 0LL, 0LL);
  if (v3)
  {
    uint64_t v4 = v3;
    double FloatValue = IOHIDEventGetFloatValue(v3, 983040LL);
    CFRelease(v4);
    CFArrayRef v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", FloatValue));
  }

  return v3;
}

- (id)temperatureData
{
  CFArrayRef v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (-[ComponentSensorTemperature systemClientSetup](self, "systemClientSetup"))
  {
    uint64_t v4 = IOHIDEventSystemClientCopyServices(-[ComponentSensorTemperature HIDEventSystem](self, "HIDEventSystem"));
    if (v4)
    {
      uint64_t v5 = v4;
      if (CFArrayGetCount(v4) >= 1)
      {
        CFIndex v6 = 0LL;
        do
        {
          ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v5, v6);
          v8 = (const __CFNumber *)IOHIDServiceClientCopyProperty(ValueAtIndex, @"LocationID");
          if (v8)
          {
            v9 = v8;
            int Value = CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
            CFRelease(v9);
            if (Value)
            {
              if (valuePtr != -1)
              {
                v11 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSensorTemperature parseHIDLocationID:](self, "parseHIDLocationID:"));
                v12 = (void *)objc_claimAutoreleasedReturnValue( -[ComponentSensorTemperature celsiusTemperatureFromService:]( self,  "celsiusTemperatureFromService:",  ValueAtIndex));
                if (v12) {
                  [v3 setObject:v12 forKeyedSubscript:v11];
                }
              }
            }
          }

          ++v6;
        }

        while (CFArrayGetCount(v5) > v6);
      }

      CFRelease(v5);
    }

    -[ComponentSensorTemperature systemClientRelease](self, "systemClientRelease");
  }

  return v3;
}

- (void)setHIDEventSystem:(__IOHIDEventSystemClient *)a3
{
  self->_HIDEventSystem = a3;
}

@end