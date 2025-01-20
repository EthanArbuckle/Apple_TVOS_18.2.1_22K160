@interface ATSGraphicsCapture
- (ATSGraphicsCapture)initWithLogger:(id)a3 config:(ktrace_config *)a4;
- (unint64_t)deviceKind;
- (void)addExtendedGPUInformationToFile:(ktrace_file *)a3;
- (void)disableGFXTracingIfNeeded;
- (void)enableGFXTracingIfNeeded;
@end

@implementation ATSGraphicsCapture

- (ATSGraphicsCapture)initWithLogger:(id)a3 config:(ktrace_config *)a4
{
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ATSGraphicsCapture;
  v8 = -[ATSGraphicsCapture init](&v18, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_logger, a3);
    id v10 = v7;
    io_registry_entry_t RootEntry = IORegistryGetRootEntry(kIOMainPortDefault);
    if (RootEntry)
    {
      io_object_t v12 = RootEntry;
      BOOL v13 = sub_499C(RootEntry, 0, v10);

      if (v13)
      {
        IOObjectRelease(v12);
        uint64_t v14 = 2LL;
LABEL_9:
        v9->_deviceKind = v14;
        v9->_isGraphicsCaptured = ktrace_config_kdebug_get_debugid_enabled(a4, 2231369728LL);
        goto LABEL_10;
      }

      v15 = IOServiceMatching("AGXAccelerator");
      io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v15);
      if (MatchingService)
      {
        IOObjectRelease(MatchingService);
        uint64_t v14 = 1LL;
        goto LABEL_9;
      }
    }

    else
    {
      [v10 failWithReason:@"Could not get root service to query for graphics"];
    }

    uint64_t v14 = 0LL;
    goto LABEL_9;
  }

- (void)addExtendedGPUInformationToFile:(ktrace_file *)a3
{
  if (self->_deviceKind != 1) {
    return;
  }
  v5 = IOServiceMatching("AGXAccelerator");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  if (!MatchingService) {
    return;
  }
  io_object_t v7 = MatchingService;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"CoreConfig", kCFAllocatorDefault, 0);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(CFProperty, v9) & 1) == 0)
  {

    goto LABEL_14;
  }

  if (!CFProperty)
  {
LABEL_14:
    -[KTProviderLogger warnWithMessage:]( self->_logger,  "warnWithMessage:",  @"Failed to retrieve AGX Core Config property from the AGXAccelerator service");
    return;
  }

  id v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v11 = [CFProperty copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v11, @"AGXDriverInfo");

  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  if (!ktrace_file_earliest_timestamp(a3, &v28))
  {
    io_object_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v28));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v12,  @"MachAbsoluteTime");

    if (!ktrace_file_earliest_continuous_time(a3, &v27))
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v27 - v28));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v13,  @"ContinuousTimeOffset");
    }
  }

  if (!ktrace_file_earliest_walltime(a3, &v25))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)v26 / 1000000.0 + (double)v25));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v14,  @"SecondsSinceEpoch");

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v15 secondsFromGMT]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v16,  @"SecondsFromGMT");
  }

  IOObjectRelease(v7);
  uint64_t appended = ktrace_file_append_start(a3, 20482LL, 1LL, 1LL);
  if (appended)
  {
    uint64_t v18 = appended;
    id v19 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v10, 200LL, 0LL, 0LL));
    if (ktrace_file_append_data(a3, v18, [v19 bytes], objc_msgSend(v19, "length")))
    {
      v20 = __error();
      v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to add data to extended GPU Information chunk with error: %s",  strerror(*v20));
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      -[KTProviderLogger warnWithMessage:](self->_logger, "warnWithMessage:", v22);
      ktrace_file_append_finish(a3, v18);
    }

    else
    {
      ktrace_file_append_finish(a3, v18);
    }
  }

  else
  {
    v23 = __error();
    v24 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to create chunk for the extended GPU Information chunk with error: %s",  strerror(*v23));
    id v19 = (id)objc_claimAutoreleasedReturnValue(v24);
    -[KTProviderLogger warnWithMessage:](self->_logger, "warnWithMessage:", v19);
  }
}

- (void)enableGFXTracingIfNeeded
{
  if (self->_deviceKind == 2 && self->_isGraphicsCaptured) {
    sub_47C0(1, self->_logger);
  }
}

- (void)disableGFXTracingIfNeeded
{
  if (self->_deviceKind == 2 && self->_isGraphicsCaptured) {
    sub_47C0(0, self->_logger);
  }
}

- (unint64_t)deviceKind
{
  return self->_deviceKind;
}

- (void).cxx_destruct
{
}

@end