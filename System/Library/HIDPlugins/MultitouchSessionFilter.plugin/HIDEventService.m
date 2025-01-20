@interface HIDEventService
- (BOOL)continuousRecordingCaptureHIDEvents;
- (BOOL)enableContinuousRecordingHIDElement:(BOOL)a3;
- (BOOL)supportsContinuousRecording;
- (NSDictionary)defaultProperties;
- (NSDictionary)hidProperties;
- (NSString)continuousRecordingFilenamePrefix;
- (NSString)continuousRecordingSubdirectoryName;
- (NSString)continuousRecordingUniqueID;
- (OS_os_log)logHandle;
- (id)deviceUsagePairs;
- (id)getAncestorHIDDevice;
- (unsigned)continuousRecordingFileSize;
- (unsigned)continuousRecordingTimestampFrequency;
- (unsigned)continuousRecordingTotalBytes;
- (void)enableContinuousRecording:(BOOL)a3;
- (void)enableContinuousRecordingProperty:(BOOL)a3;
@end

@implementation HIDEventService

- (OS_os_log)logHandle
{
  v2 = (void *)logHandle__logHandle;
  if (!logHandle__logHandle)
  {
    os_log_t v3 = os_log_create("com.apple.ContinuousRecording", "SessionFilter");
    v4 = (void *)logHandle__logHandle;
    logHandle__logHandle = (uint64_t)v3;

    v2 = (void *)logHandle__logHandle;
  }

  return (OS_os_log *)v2;
}

- (NSDictionary)defaultProperties
{
  v4 = (void *)IORegistryEntrySearchCFProperty( *(_DWORD *)((char *)self + OBJC_IVAR___HIDEventService__service + 8),  "IOService",  @"DefaultProperties",  kCFAllocatorDefault,  3u);
  if (!v4) {
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[HIDEventService propertyForKey:]( self,  "propertyForKey:",  @"HIDContinuousRecordingDefaultProperties"));
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary, v3);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {

    v4 = 0LL;
  }

  return (NSDictionary *)v4;
}

- (unsigned)continuousRecordingTotalBytes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService defaultProperties](self, "defaultProperties"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"ContinuousRecordingTotalBytes"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    unsigned int v6 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v6 = 104857600;
  }

  return v6;
}

- (unsigned)continuousRecordingFileSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService defaultProperties](self, "defaultProperties"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"ContinuousRecordingFileSizeInBytes"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0
    || ((unsigned int v6 = [v3 unsignedIntValue], v6 >= 0xA00000) ? (v7 = 10485760) : (v7 = v6),
        v7 <= 0x20000 ? (unsigned int v8 = 0x20000) : (unsigned int v8 = v7),
        !v6))
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (unsigned)continuousRecordingTimestampFrequency
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService defaultProperties](self, "defaultProperties"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"ContinuousRecordingTimestampFrequency"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0
    || ((unsigned int v6 = [v3 unsignedIntValue], v6 >= 0xE10) ? (v7 = 3600) : (v7 = v6),
        v7 <= 1 ? (unsigned int v8 = 1) : (unsigned int v8 = v7),
        !v6))
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (BOOL)continuousRecordingCaptureHIDEvents
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService defaultProperties](self, "defaultProperties"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"ContinuousRecordingCaptureHIDEvents"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)supportsContinuousRecording
{
  unsigned int v3 = -[HIDEventService continuousRecordingFileSize](self, "continuousRecordingFileSize");
  if (v3) {
    LOBYTE(v3) = -[HIDEventService continuousRecordingTotalBytes](self, "continuousRecordingTotalBytes") != 0;
  }
  return v3;
}

- (id)deviceUsagePairs
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService propertyForKey:](self, "propertyForKey:", @"DeviceUsagePairs"));
  if (v4
    && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray, v3), (objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    && [v4 count])
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingComparator:&__block_literal_global_1]);
  }

  else
  {
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[HIDEventService logHandle](self, "logHandle"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[HIDEventService(HIDContinuousRecording) deviceUsagePairs].cold.1(v7);
    }

    unsigned __int8 v6 = 0LL;
  }

  return v6;
}

int64_t __59__HIDEventService_HIDContinuousRecording__deviceUsagePairs__block_invoke( id a1,  id a2,  id a3)
{
  id v4 = a3;
  id v5 = a2;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"DeviceUsagePage"]);
  unsigned int v7 = [v6 unsignedIntValue];

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DeviceUsagePage"]);
  unsigned int v9 = [v8 unsignedIntValue];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"DeviceUsage"]);
  unsigned int v11 = [v10 unsignedIntValue];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DeviceUsage"]);
  unsigned int v13 = [v12 unsignedIntValue];

  int64_t v14 = -1LL;
  uint64_t v15 = 1LL;
  if (v11 >= v13) {
    uint64_t v16 = 0LL;
  }
  else {
    uint64_t v16 = -1LL;
  }
  if (v11 <= v13) {
    uint64_t v15 = v16;
  }
  if (v7 >= v9) {
    int64_t v14 = v15;
  }
  if (v7 <= v9) {
    return v14;
  }
  else {
    return 1LL;
  }
}

- (NSString)continuousRecordingFilenamePrefix
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[HIDEventService propertyForKey:](self, "propertyForKey:", @"IOClass"));
  id v4 = (void *)v3;
  if (v3) {
    id v5 = (const __CFString *)v3;
  }
  else {
    id v5 = @"Unknown";
  }
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_0x%llx",  v5,  -[HIDEventService serviceID](self, "serviceID")));

  return (NSString *)v6;
}

- (NSString)continuousRecordingUniqueID
{
  return (NSString *)-[HIDEventService propertyForKey:](self, "propertyForKey:", @"HIDContinuousRecordingID");
}

- (NSDictionary)hidProperties
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService propertyForKey:](self, "propertyForKey:", @"SerialNumber"));
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( NSData,  "dataWithBytes:length:",  [v6 UTF8String],  objc_msgSend(v6, "length")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, &off_150B8);
  }

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService propertyForKey:](self, "propertyForKey:", @"HIDContinuousRecordingID"));
  unsigned int v9 = v8;
  if (v8)
  {
    id v10 = v8;
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( NSData,  "dataWithBytes:length:",  [v10 UTF8String],  objc_msgSend(v10, "length")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, &off_150D0);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService propertyForKey:](self, "propertyForKey:", @"ProductID"));
  unsigned int v13 = v12;
  if (v12)
  {
    unsigned int v57 = [v12 unsignedIntValue];
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v57, 4LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, &off_150E8);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService propertyForKey:](self, "propertyForKey:", @"VendorID"));
  uint64_t v16 = v15;
  if (v15)
  {
    unsigned int v57 = [v15 unsignedIntValue];
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v57, 4LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v17, &off_15100);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService propertyForKey:](self, "propertyForKey:", @"Transport"));
  v19 = v18;
  if (v18)
  {
    v20 = v18;
    id v21 = v18;
    id v22 = [v21 UTF8String];
    v23 = v21;
    v19 = v20;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( NSData,  "dataWithBytes:length:",  v22,  [v23 length]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v24, &off_15118);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService propertyForKey:](self, "propertyForKey:", @"PrimaryUsagePage"));
  v26 = v25;
  if (v25)
  {
    LOWORD(v57) = (unsigned __int16)[v25 unsignedShortValue];
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v57, 2LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v27, &off_15130);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService propertyForKey:](self, "propertyForKey:", @"PrimaryUsage"));
  v29 = v28;
  if (v28)
  {
    LOWORD(v57) = (unsigned __int16)[v28 unsignedShortValue];
    v30 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v57, 2LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v31, &off_15148);

    v29 = v30;
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService deviceUsagePairs](self, "deviceUsagePairs"));
  if (v32)
  {
    v46 = v29;
    v47 = v19;
    v48 = v16;
    v49 = v9;
    v50 = v5;
    v51 = v3;
    v33 = objc_opt_new(&OBJC_CLASS___NSMutableData);
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    v45 = v32;
    id v34 = v32;
    id v35 = [v34 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v54;
      do
      {
        for (i = 0LL; i != v36; i = (char *)i + 1)
        {
          if (*(void *)v54 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", @"DeviceUsagePage", v45));
          uint64_t v41 = objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"DeviceUsage"]);
          v42 = (void *)v41;
          if (v40) {
            BOOL v43 = v41 == 0;
          }
          else {
            BOOL v43 = 1;
          }
          if (!v43)
          {
            LOWORD(v57) = -21846;
            LOWORD(v57) = (unsigned __int16)[v40 unsignedShortValue];
            unsigned __int16 v52 = -21846;
            unsigned __int16 v52 = (unsigned __int16)[v42 unsignedShortValue];
            -[NSMutableData appendBytes:length:](v33, "appendBytes:length:", &v57, 2LL);
            -[NSMutableData appendBytes:length:](v33, "appendBytes:length:", &v52, 2LL);
          }
        }

        id v36 = [v34 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }

      while (v36);
    }

    uint64_t v3 = v51;
    if (-[NSMutableData length](v33, "length")) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v51, "setObject:forKeyedSubscript:", v33, &off_15160);
    }

    unsigned int v9 = v49;
    id v5 = v50;
    uint64_t v16 = v48;
    v19 = v47;
    v32 = v45;
    v29 = v46;
  }

  return (NSDictionary *)v3;
}

- (NSString)continuousRecordingSubdirectoryName
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService propertyForKey:](self, "propertyForKey:", @"HIDContinuousRecordingID"));
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService propertyForKey:](self, "propertyForKey:", @"SerialNumber"));
    unsigned int v7 = v6;
    if (v6)
    {
      id v5 = v6;
    }

    else
    {
      id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[HIDEventService propertyForKey:](self, "propertyForKey:", @"ProductID"));
      unsigned int v9 = (void *)v8;
      BOOL v10 = v8 != 0;
      if (v8) {
        -[NSMutableString appendFormat:](v5, "appendFormat:", @"%sPID_%@", &unk_11B31, v8);
      }
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService propertyForKey:](self, "propertyForKey:", @"VendorID"));

      if (v11)
      {
        if (v9) {
          v12 = "_";
        }
        else {
          v12 = (const char *)&unk_11B31;
        }
        -[NSMutableString appendFormat:](v5, "appendFormat:", @"%sVID_%@", v12, v11);
        BOOL v10 = 1;
      }

      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService propertyForKey:](self, "propertyForKey:", @"Transport"));

      if (v13)
      {
        if (v10) {
          int64_t v14 = "_";
        }
        else {
          int64_t v14 = (const char *)&unk_11B31;
        }
        -[NSMutableString appendFormat:](v5, "appendFormat:", @"%s%@", v14, v13);
        BOOL v10 = 1;
      }

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService propertyForKey:](self, "propertyForKey:", @"PrimaryUsagePage"));

      if (v15)
      {
        if (v10) {
          uint64_t v16 = "_";
        }
        else {
          uint64_t v16 = (const char *)&unk_11B31;
        }
        -[NSMutableString appendFormat:](v5, "appendFormat:", @"%sPrimaryUsagePage_%@", v16, v15);
        BOOL v10 = 1;
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService propertyForKey:](self, "propertyForKey:", @"PrimaryUsage"));

      if (v17)
      {
        if (v10) {
          v18 = "_";
        }
        else {
          v18 = (const char *)&unk_11B31;
        }
        -[NSMutableString appendFormat:](v5, "appendFormat:", @"%sPrimaryUsage_%@", v18, v17);
        BOOL v10 = 1;
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService deviceUsagePairs](self, "deviceUsagePairs"));
      if (v19)
      {
        v33 = v17;
        if (v10) {
          v20 = "_";
        }
        else {
          v20 = (const char *)&unk_11B31;
        }
        -[NSMutableString appendFormat:](v5, "appendFormat:", @"%sDeviceUsagePairs", v20);
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        v32 = v19;
        id v21 = v19;
        id v22 = [v21 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v35;
          do
          {
            for (i = 0LL; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v35 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
              v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"DeviceUsagePage"]);
              uint64_t v28 = objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"DeviceUsage"]);
              v29 = (void *)v28;
              if (v27) {
                BOOL v30 = v28 == 0;
              }
              else {
                BOOL v30 = 1;
              }
              if (!v30) {
                -[NSMutableString appendFormat:](v5, "appendFormat:", @"_%@_%@", v27, v28);
              }
            }

            id v23 = [v21 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }

          while (v23);
        }

        unsigned int v7 = 0LL;
        id v4 = 0LL;
        v19 = v32;
        v17 = v33;
      }
    }
  }

  return (NSString *)v5;
}

- (id)getAncestorHIDDevice
{
  io_registry_entry_t v3 = *(_DWORD *)((char *)self + OBJC_IVAR___HIDEventService__service + 8);
  io_registry_entry_t parent = 0;
  if (IORegistryEntryGetParentEntry(v3, "IOService", &parent))
  {
LABEL_4:
    unsigned int v7 = 0LL;
  }

  else
  {
    while (1)
    {
      id v4 = objc_alloc(&OBJC_CLASS___HIDDevice);
      id v5 = [v4 initWithService:parent];
      if (v5) {
        break;
      }
      io_registry_entry_t v6 = parent;
      io_registry_entry_t parent = 0;
      if (IORegistryEntryGetParentEntry(v6, "IOService", &parent)) {
        goto LABEL_4;
      }
    }

    unsigned int v7 = v5;
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[HIDEventService logHandle](self, "logHandle"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Found ancestor HID device %@", buf, 0xCu);
    }
  }

  return v7;
}

- (void)enableContinuousRecordingProperty:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[HIDEventService setProperty:forKey:](self, "setProperty:forKey:", v4, @"HIDContinuousRecordingEnable");
}

- (BOOL)enableContinuousRecordingHIDElement:(BOOL)a3
{
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[HIDEventService getAncestorHIDDevice](self, "getAncestorHIDDevice"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v35 elementsMatching:&off_151C8]);
  __int128 v36 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
        if ([v11 usagePage] == (char *)&loc_FF0C + 3
          && [v11 usage] == &stru_20
          && [v11 type] == (char *)&stru_B8.reserved2 + 1)
        {
          v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[HIDEventService logHandle](self, "logHandle"));
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v11;
            _os_log_debug_impl(&dword_0, v12, OS_LOG_TYPE_DEBUG, "Found HID element %@", buf, 0xCu);
          }

          buf[0] = 1;
          buf[1] = a3;
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", buf, 2LL));
          [v11 setDataValue:v13];

          -[NSMutableArray addObject:](v36, "addObject:", v11);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }

    while (v8);
  }

  if (-[NSMutableArray count](v36, "count"))
  {
    id v38 = 0LL;
    int64_t v14 = v35;
    unsigned int v15 = [v35 openWithOptions:0 error:&v38];
    id v16 = v38;
    v17 = v16;
    if (!v15 || v16)
    {
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[HIDEventService logHandle](self, "logHandle"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[HIDEventService(HIDContinuousRecording) enableContinuousRecordingHIDElement:].cold.2( (uint64_t)v17,  v27,  v28,  v29,  v30,  v31,  v32,  v33);
      }

      LOBYTE(v18) = 0;
    }

    else
    {
      id v37 = 0LL;
      unsigned int v18 = [v35 commitElements:v36 direction:1 error:&v37];
      id v19 = v37;
      v17 = v19;
      if (!v18 || v19)
      {
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[HIDEventService logHandle](self, "logHandle"));
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[HIDEventService(HIDContinuousRecording) enableContinuousRecordingHIDElement:].cold.1( (uint64_t)v17,  v20,  v21,  v22,  v23,  v24,  v25,  v26);
        }
      }

      [v35 close];
    }
  }

  else
  {
    LOBYTE(v18) = 0;
    int64_t v14 = v35;
  }

  return v18;
}

- (void)enableContinuousRecording:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[HIDEventService enableContinuousRecordingHIDElement:](self, "enableContinuousRecordingHIDElement:")) {
    -[HIDEventService enableContinuousRecordingProperty:](self, "enableContinuousRecordingProperty:", v3);
  }
}

@end