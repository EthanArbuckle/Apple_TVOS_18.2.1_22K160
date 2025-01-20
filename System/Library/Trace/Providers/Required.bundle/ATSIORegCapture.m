@interface ATSIORegCapture
- (ATSIORegCapture)initWithLogger:(id)a3;
- (__CFArray)_copyPropertiesOfIOService:(const char *)a3;
- (__CFData)_serializeIOMFBAGXServices;
- (id)_fullySerializeService:(unsigned int)a3 planeName:(const char *)a4;
- (id)_removeSetsFromArray:(id)a3;
- (id)_removeSetsFromDict:(id)a3;
- (id)_serializeFullIOKitPlane:(const char *)a3;
- (id)_serializeServicePlaneRecursively:(unsigned int)a3 planeName:(const char *)a4;
- (id)describeChunkWithTag:(unsigned int)a3;
- (void)_mergeIOServicePropertiesIntoDictionary:(__CFDictionary *)a3 name:(const char *)a4;
- (void)addChunksToFile:(ktrace_file *)a3;
@end

@implementation ATSIORegCapture

- (ATSIORegCapture)initWithLogger:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ATSIORegCapture;
  v6 = -[ATSIORegCapture init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_logger, a3);
  }

  return v7;
}

- (void)addChunksToFile:(ktrace_file *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ATSIORegCapture _serializeFullIOKitPlane:](self, "_serializeFullIOKitPlane:", "IODeviceTree"));
  id v16 = v5;
  if (v5)
  {
    id v6 = v5;
    if (!ktrace_file_append_chunk(a3, 20991, 0, 0, [v6 bytes], objc_msgSend(v6, "length")))
    {
      v7 = __error();
      v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to append device plane chunk. Error: %s",  strerror(*v7),  v16);
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      -[KTProviderLogger failWithReason:](self->_logger, "failWithReason:", v9);
    }
  }

  else
  {
    -[KTProviderLogger failWithReason:]( self->_logger,  "failWithReason:",  @"Failed to serialize device plane data");
  }

  v10 = -[ATSIORegCapture _serializeIOMFBAGXServices](self, "_serializeIOMFBAGXServices");
  v11 = v10;
  if (v10)
  {
    v12 = v10;
    if (!ktrace_file_append_chunk( a3,  32776LL,  0LL,  0LL,  -[__CFData bytes](v12, "bytes"),  -[__CFData length](v12, "length")))
    {
      v13 = __error();
      v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to append IO Reg chunk. Error: %s",  strerror(*v13));
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      -[KTProviderLogger failWithReason:](self->_logger, "failWithReason:", v15);
    }
  }

  else
  {
    -[KTProviderLogger failWithReason:]( self->_logger,  "failWithReason:",  @"Failed to serialize IOMFB and AGX metadata");
  }
}

- (id)describeChunkWithTag:(unsigned int)a3
{
  v3 = @"device tree plane";
  if (a3 != 20991) {
    v3 = 0LL;
  }
  if (a3 == 32776) {
    return @"libktrace ioreg";
  }
  else {
    return (id)v3;
  }
}

- (id)_removeSetsFromDict:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    id v19 = 0LL;
    goto LABEL_19;
  }

  id v5 = [v3 mutableCopy];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  v21 = v4;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v7) {
    goto LABEL_17;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v24;
  do
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v24 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v11, v21));
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSSet);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue([v12 allObjects]);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[ATSIORegCapture _removeSetsFromArray:](self, "_removeSetsFromArray:", v14));
        [v5 setObject:v15 forKeyedSubscript:v11];
      }

      else
      {
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v12, v16) & 1) != 0)
        {
          uint64_t v17 = objc_claimAutoreleasedReturnValue(-[ATSIORegCapture _removeSetsFromArray:](self, "_removeSetsFromArray:", v12));
        }

        else
        {
          uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v12, v18) & 1) == 0) {
            goto LABEL_15;
          }
          uint64_t v17 = objc_claimAutoreleasedReturnValue(-[ATSIORegCapture _removeSetsFromDict:](self, "_removeSetsFromDict:", v12));
        }

        v14 = (void *)v17;
        [v5 setObject:v17 forKeyedSubscript:v11];
      }

LABEL_15:
    }

    id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }

  while (v8);
LABEL_17:

  id v19 = [v5 copy];
  v4 = v21;
LABEL_19:

  return v19;
}

- (id)_removeSetsFromArray:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 mutableCopy];
    if ([v5 count])
    {
      uint64_t v7 = 0LL;
      while (1)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v7]);
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSSet);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
          break;
        }
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v8, v12) & 1) != 0)
        {
          uint64_t v13 = objc_claimAutoreleasedReturnValue(-[ATSIORegCapture _removeSetsFromArray:](self, "_removeSetsFromArray:", v8));
          goto LABEL_10;
        }

        uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v8, v14) & 1) != 0)
        {
          uint64_t v13 = objc_claimAutoreleasedReturnValue(-[ATSIORegCapture _removeSetsFromDict:](self, "_removeSetsFromDict:", v8));
LABEL_10:
          v10 = (void *)v13;
          [v6 setObject:v13 atIndexedSubscript:v7];
LABEL_11:
        }
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ATSIORegCapture _removeSetsFromArray:](self, "_removeSetsFromArray:", v10));
      [v6 setObject:v11 atIndexedSubscript:v7];

      goto LABEL_11;
    }
  }

  else
  {
    id v6 = 0LL;
  }

- (id)_fullySerializeService:(unsigned int)a3 planeName:(const char *)a4
{
  uint64_t entryID = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (!IORegistryEntryGetNameInPlane(a3, a4, (char *)v16))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v16));
    [v6 setObject:v7 forKeyedSubscript:@"IORegistryEntryName"];
  }

  if (!IORegistryEntryGetLocationInPlane(a3, a4, (char *)v15))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
    [v6 setObject:v8 forKeyedSubscript:@"IORegistryEntryLocation"];
  }

  if (!IORegistryEntryGetRegistryEntryID(a3, &entryID))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  entryID));
    [v6 setObject:v9 forKeyedSubscript:@"IORegistryEntryID"];
  }

  if (!_IOObjectGetClass(a3, (char *)&dword_0 + 1))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v14));
    [v6 setObject:v10 forKeyedSubscript:@"IOObjectClass"];
  }

  CFTypeRef cf = 0LL;
  IORegistryEntryCreateCFProperties(a3, (CFMutableDictionaryRef *)&cf, kCFAllocatorDefault, 0);
  if (cf)
  {
    [v6 setObject:cf forKeyedSubscript:@"IORegistryEntryProperties"];
    CFRelease(cf);
  }

  return v6;
}

- (id)_serializeServicePlaneRecursively:(unsigned int)a3 planeName:(const char *)a4
{
  uint64_t v5 = *(void *)&a3;
  io_iterator_t iterator = 0;
  if (IORegistryEntryGetChildIterator(a3, a4, &iterator)) {
    return 0LL;
  }
  uint64_t v8 = IOIteratorNext(iterator);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ATSIORegCapture _fullySerializeService:planeName:](self, "_fullySerializeService:planeName:", v5, a4));
  if ((_DWORD)v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    do
    {
      uint64_t v11 = objc_autoreleasePoolPush();
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[ATSIORegCapture _serializeServicePlaneRecursively:planeName:]( self,  "_serializeServicePlaneRecursively:planeName:",  v8,  a4));
      [v10 addObject:v12];

      uint64_t v13 = IOIteratorNext(iterator);
      IOObjectRelease(v8);
      objc_autoreleasePoolPop(v11);
      uint64_t v8 = v13;
    }

    while ((_DWORD)v13);
    [v9 setObject:v10 forKeyedSubscript:@"IORegistryEntryChildren"];
  }

  IOObjectRelease(iterator);
  return v9;
}

- (id)_serializeFullIOKitPlane:(const char *)a3
{
  uint64_t RootEntry = IORegistryGetRootEntry(kIOMainPortDefault);
  id v6 = objc_autoreleasePoolPush();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[ATSIORegCapture _serializeServicePlaneRecursively:planeName:]( self,  "_serializeServicePlaneRecursively:planeName:",  RootEntry,  a3));
  if (v7)
  {
    IOObjectRelease(RootEntry);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v7,  200LL,  0LL,  0LL));
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  objc_autoreleasePoolPop(v6);
  return v8;
}

- (__CFArray)_copyPropertiesOfIOService:(const char *)a3
{
  io_iterator_t existing = 0;
  uint64_t v5 = IOServiceMatching(a3);
  mach_error_t MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v5, &existing);
  if (MatchingServices)
  {
    uint64_t v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to get service matching %s: %s",  a3,  mach_error_string(MatchingServices));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[KTProviderLogger failWithReason:](self->_logger, "failWithReason:", v8);

    uint64_t v9 = 0LL;
  }

  else
  {
    Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    while (1)
    {
      io_registry_entry_t v11 = IOIteratorNext(existing);
      if (!v11)
      {
        uint64_t v9 = 0LL;
        goto LABEL_9;
      }

      CFMutableDictionaryRef properties = 0LL;
      mach_error_t v12 = IORegistryEntryCreateCFProperties(v11, &properties, 0LL, 0);
      if (v12) {
        break;
      }
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ATSIORegCapture _removeSetsFromDict:](self, "_removeSetsFromDict:", properties));
      CFArrayAppendValue(Mutable, v13);
      CFRelease(properties);
    }

    v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to create properties for service %s: %s",  a3,  mach_error_string(v12));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[KTProviderLogger failWithReason:](self->_logger, "failWithReason:", v16);

    uint64_t v9 = Mutable;
  }

  Mutable = 0LL;
LABEL_9:
  if (existing) {
    IOObjectRelease(existing);
  }
  if (v9) {
    CFRelease(v9);
  }
  return Mutable;
}

- (void)_mergeIOServicePropertiesIntoDictionary:(__CFDictionary *)a3 name:(const char *)a4
{
  id v6 = -[ATSIORegCapture _copyPropertiesOfIOService:](self, "_copyPropertiesOfIOService:", a4);
  if (v6)
  {
    uint64_t v7 = v6;
    CFStringRef v8 = CFStringCreateWithCString(0LL, a4, 0x8000100u);
    CFAutorelease(v8);
    CFDictionarySetValue(a3, v8, v7);
    CFRelease(v7);
  }

- (__CFData)_serializeIOMFBAGXServices
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  -[ATSIORegCapture _mergeIOServicePropertiesIntoDictionary:name:]( self,  "_mergeIOServicePropertiesIntoDictionary:name:",  Mutable,  "IOMobileFramebuffer");
  -[ATSIORegCapture _mergeIOServicePropertiesIntoDictionary:name:]( self,  "_mergeIOServicePropertiesIntoDictionary:name:",  Mutable,  "AGXAccelerator");
  if (!Mutable) {
    return 0LL;
  }
  CFErrorRef error = 0LL;
  id v4 = CFPropertyListCreateData(0LL, Mutable, kCFPropertyListBinaryFormat_v1_0, 0LL, &error);
  if (error)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to serialize AGX and IOMFB metadata dictionary: %@",  error));
    -[KTProviderLogger failWithReason:](self->_logger, "failWithReason:", v5);
  }

  CFRelease(Mutable);
  return v4;
}

- (void).cxx_destruct
{
}

@end