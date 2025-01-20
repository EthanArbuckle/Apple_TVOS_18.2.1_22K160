@interface ComponentDisplay
- (AVAudioSession)audioSession;
- (BOOL)isPresent;
- (BOOL)zoomed;
- (CADisplay)mainDisplay;
- (ComponentDisplay)init;
- (id)audioOutputFormatPreference;
- (id)getDisplayAttributes;
- (id)height;
- (id)maximumInputNumberOfChannels;
- (id)maximumOutputNumberOfChannels;
- (id)refreshRate;
- (id)scanRate;
- (id)width;
- (void)populateAttributes:(id)a3;
- (void)setAudioSession:(id)a3;
- (void)setMainDisplay:(id)a3;
@end

@implementation ComponentDisplay

- (ComponentDisplay)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ComponentDisplay;
  v2 = -[ComponentDisplay init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    mainDisplay = v2->_mainDisplay;
    v2->_mainDisplay = (CADisplay *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    audioSession = v2->_audioSession;
    v2->_audioSession = (AVAudioSession *)v5;
  }

  return v2;
}

- (BOOL)isPresent
{
  int v15 = 0;
  CFMutableDictionaryRef v2 = IOServiceNameMatching("IODPDevice");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", @"IONameMatch"));
  unsigned __int8 v4 = [v3 isEqualToString:@"IODPDevice"];

  int DevicesWithProp = FindDevicesWithProp("IOService:name", "lcd", (uint64_t)v16, 10, &v15);
  int v6 = v15;
  int v15 = 0;
  else {
    BOOL v7 = v15 == 0;
  }
  char v8 = !v7;
  if (DevicesWithProp) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v6 == 0;
  }
  if (!v9) {
    char v8 = 1;
  }
  char v10 = v8 | v4;
  if (((v8 | v4) & 1) == 0)
  {
    uint64_t v11 = DiagnosticLogHandleForCategory(6LL);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "LCD NOT found.", v14, 2u);
    }
  }

  return v10;
}

- (BOOL)zoomed
{
  CFMutableDictionaryRef v2 = (void *)MGCopyAnswer(@"ILaGO+KV5JAOq7Q5GEwbWQ", 0LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"default"]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"zoomed"]);
  if ([v3 count] == (id)4 && objc_msgSend(v4, "count") == (id)4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]);
    [v5 floatValue];

    int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:1]);
    [v6 floatValue];

    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:2]);
    [v7 floatValue];

    char v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:3]);
    [v8 floatValue];

    v12 = 0LL;
    IOMobileFramebufferGetMainDisplay(&v12);
    BOOL v9 = v12;
    if (v12)
    {
      int v11 = 0;
      IOMobileFramebufferGetCanvasSizes(v12, &v12, &v11);
      CFRelease(v9);
    }
  }

  return 0;
}

- (void)populateAttributes:(id)a3
{
  id v23 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay getDisplayAttributes](self, "getDisplayAttributes"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ProductAttributes"]);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"ProductID"]);
  if (v6)
  {
    [v23 setObject:v6 forKeyedSubscript:@"productID"];
  }

  else
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    [v23 setObject:v7 forKeyedSubscript:@"productID"];
  }

  char v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"ManufacturerID"]);
  if (v8)
  {
    [v23 setObject:v8 forKeyedSubscript:@"manufacturerPNPID"];
  }

  else
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    [v23 setObject:v9 forKeyedSubscript:@"manufacturerPNPID"];
  }

  char v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"ProductName"]);
  if (v10)
  {
    [v23 setObject:v10 forKeyedSubscript:@"product"];
  }

  else
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    [v23 setObject:v11 forKeyedSubscript:@"product"];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"WeekOfManufacture"]);
  if (v12)
  {
    [v23 setObject:v12 forKeyedSubscript:@"weekOfManufacture"];
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    [v23 setObject:v13 forKeyedSubscript:@"weekOfManufacture"];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"YearOfManufacture"]);
  if (v14)
  {
    [v23 setObject:v14 forKeyedSubscript:@"yearOfManufacture"];
  }

  else
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    [v23 setObject:v15 forKeyedSubscript:@"yearOfManufacture"];
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay width](self, "width"));
  [v23 setObject:v16 forKeyedSubscript:@"width"];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay height](self, "height"));
  [v23 setObject:v17 forKeyedSubscript:@"height"];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay refreshRate](self, "refreshRate"));
  [v23 setObject:v18 forKeyedSubscript:@"refreshRate"];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay scanRate](self, "scanRate"));
  [v23 setObject:v19 forKeyedSubscript:@"scanRate"];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay audioOutputFormatPreference](self, "audioOutputFormatPreference"));
  [v23 setObject:v20 forKeyedSubscript:@"audioOutputFormatPreference"];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay maximumInputNumberOfChannels](self, "maximumInputNumberOfChannels"));
  [v23 setObject:v21 forKeyedSubscript:@"maximumInputNumberOfChannels"];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay maximumOutputNumberOfChannels](self, "maximumOutputNumberOfChannels"));
  [v23 setObject:v22 forKeyedSubscript:@"maximumOutputNumberOfChannels"];
}

- (id)width
{
  CFMutableDictionaryRef v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay mainDisplay](self, "mainDisplay"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentMode]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  [v3 width]));
  id v5 = numberOrNull(v4);
  int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)height
{
  CFMutableDictionaryRef v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay mainDisplay](self, "mainDisplay"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentMode]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  [v3 height]));
  id v5 = numberOrNull(v4);
  int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)refreshRate
{
  CFMutableDictionaryRef v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay mainDisplay](self, "mainDisplay"));
  [v2 refreshRate];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  id v4 = numberOrNull(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)scanRate
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay refreshRate](self, "refreshRate"));
  [v3 doubleValue];
  if (v4 <= 0.0)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay refreshRate](self, "refreshRate"));
    [v5 doubleValue];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (int)(1.0 / v6 + 0.5)));
  }

  return v7;
}

- (id)audioOutputFormatPreference
{
  CFMutableDictionaryRef v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  id v3 = [v2 audioOutputFormat];

  if ((unint64_t)v3 >= 4)
  {
    uint64_t v5 = DiagnosticLogHandleForCategory(6LL);
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134217984;
      id v10 = v3;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_FAULT,  "Unknown value for TVPAudioOutputFormat: %ld",  (uint8_t *)&v9,  0xCu);
    }

    double v4 = 0LL;
  }

  else
  {
    double v4 = *(&off_1000606A8 + (void)v3);
  }

  id v7 = stringOrNull(v4);
  return (id)objc_claimAutoreleasedReturnValue(v7);
}

- (id)maximumInputNumberOfChannels
{
  CFMutableDictionaryRef v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay audioSession](self, "audioSession"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v2 maximumInputNumberOfChannels]));
  id v4 = numberOrNull(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)maximumOutputNumberOfChannels
{
  CFMutableDictionaryRef v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay audioSession](self, "audioSession"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v2 maximumOutputNumberOfChannels]));
  id v4 = numberOrNull(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)getDisplayAttributes
{
  CFMutableDictionaryRef v2 = (const __CFDictionary *)__IOAVClassMatching("IOAVVideoInterface", 0LL, 0LL, 0xFFFFFFFFLL);
  if (!v2)
  {
    uint64_t v8 = DiagnosticLogHandleForCategory(6LL);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    __int16 v16 = 0;
    id v10 = "Failed to generate matching dict for IOAVVideoInterface";
    int v11 = (uint8_t *)&v16;
    goto LABEL_11;
  }

  uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (!(_DWORD)MatchingService)
  {
    uint64_t v12 = DiagnosticLogHandleForCategory(6LL);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    __int16 v15 = 0;
    id v10 = "Failed to get IO service for display";
    int v11 = (uint8_t *)&v15;
    goto LABEL_11;
  }

  io_object_t v4 = MatchingService;
  uint64_t v5 = (const void *)IOAVVideoInterfaceCreateWithService(kCFAllocatorDefault, MatchingService);
  IOObjectRelease(v4);
  if (v5)
  {
    double v6 = (void *)IOAVVideoInterfaceCopyDisplayAttributes(v5);
    CFRelease(v5);
    return v6;
  }

  uint64_t v13 = DiagnosticLogHandleForCategory(6LL);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __int16 v14 = 0;
    id v10 = "Failed to create IOAVVideoInterface for display";
    int v11 = (uint8_t *)&v14;
LABEL_11:
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
  }

- (CADisplay)mainDisplay
{
  return self->_mainDisplay;
}

- (void)setMainDisplay:(id)a3
{
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setAudioSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end