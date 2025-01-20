@interface PerformanceLoggingDiagnosticExtensionExtension
- (BOOL)setEPLKeysForParameters:(id)a3 error:(id *)a4;
- (BOOL)setEPLKeysForParameters:(id)a3 error:(id *)a4 domain:(__CFString *)a5;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)keyWithPrefix:(id)a3;
- (id)linkRMEAndGetEPLProfilePath;
- (id)sysdiagnoseParamsFromDEParams:(id)a3;
- (id)takeSysdiagnose:(id)a3 error:(id *)a4;
- (void)enableReportMemoryException:(BOOL)a3;
@end

@implementation PerformanceLoggingDiagnosticExtensionExtension

- (id)keyWithPrefix:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"HTEPL",  a3));
  }
  else {
    return 0LL;
  }
}

- (id)sysdiagnoseParamsFromDEParams:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"shouldCreateTarBall"]);

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"shouldCreateTarBall"]);
      [v4 setObject:v6 forKeyedSubscript:@"shouldCreateTarBall"];
    }

    else
    {
      [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"shouldCreateTarBall"];
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"forceDiagnostic"]);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"forceDiagnostic"]);
      [v4 setObject:v11 forKeyedSubscript:@"forceDiagnostic"];
    }

    else
    {
      [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"forceDiagnostic"];
    }

    v27[0] = @"HangTracerTailspins";
    v25 = @"maxSizeMB";
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 55LL));
    v26 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    v28[0] = v13;
    v27[1] = @"ForceResetTailspins";
    v23 = @"maxSizeMB";
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 175LL));
    v24 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    v28[1] = v15;
    v27[2] = @"crashes_and_spins/MemoryExceptions";
    v21 = @"maxSizeMB";
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 50LL));
    v22 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    v28[2] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  3LL));
    [v4 setObject:v18 forKeyedSubscript:@"capOverride"];

    id v9 = v4;
  }

  else
  {
    id v7 = shared_pl_log_handle();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DE parameters are nil", v20, 2u);
    }

    id v9 = 0LL;
  }

  return v9;
}

- (id)takeSysdiagnose:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = shared_pl_log_handle();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Attempting to take sysdiagnose", buf, 2u);
  }

  if (v5)
  {
    id v16 = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[Libsysdiagnose sysdiagnoseWithMetadata:withError:]( &OBJC_CLASS___Libsysdiagnose,  "sysdiagnoseWithMetadata:withError:",  v5,  &v16));
    id v9 = v16;
    v10 = v9;
    if (a4) {
      *a4 = v9;
    }
    id v11 = shared_pl_log_handle();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Returned sysdiagnose path: %@", buf, 0xCu);
    }
  }

  else
  {
    id v13 = shared_pl_log_handle();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose parameters dictionary is nil",  buf,  2u);
    }

    if (!a4)
    {
      v8 = 0LL;
      goto LABEL_14;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"sysdiagnose parameters dictionary is nil",  NSLocalizedDescriptionKey));
    v8 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"EPLErrorDomain",  1LL,  v10));
  }

LABEL_14:
  return v8;
}

- (id)linkRMEAndGetEPLProfilePath
{
  if (qword_100015FE8 != -1) {
    dispatch_once(&qword_100015FE8, &stru_100010498);
  }
  if (qword_100015FE0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100015FE0 getEPLProfilePath]);
    id v3 = shared_pl_log_handle();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Successfully resolved EPLProfilePath dynamically",  buf,  2u);
    }
  }

  else
  {
    id v5 = shared_pl_log_handle();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "RMECacheEnumerator symbol cannot be found",  v7,  2u);
    }

    v2 = 0LL;
  }

  return v2;
}

- (void)enableReportMemoryException:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[PerformanceLoggingDiagnosticExtensionExtension linkRMEAndGetEPLProfilePath]( self,  "linkRMEAndGetEPLProfilePath"));
  id v5 = v4;
  if (v4)
  {
    if (v3)
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
      -[NSDateComponents setDay:](v6, "setDay:", 2LL);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingComponents:v6 toDate:v8 options:0]);

      v66[0] = @"FullDiagLimit";
      v66[1] = @"LiteDiagLimit";
      v67[0] = &off_100011A30;
      v67[1] = &off_100011A48;
      v66[2] = @"PerProcessLimit";
      v66[3] = @"ExpirationDate";
      v67[2] = &off_100011A60;
      v67[3] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v67,  v66,  4LL));
      id v59 = 0LL;
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v10,  100LL,  0LL,  &v59));
      id v12 = v59;
      id v13 = v12;
      if (!v11)
      {
        id v39 = shared_pl_log_handle();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v40 = (char *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
          *(_DWORD *)buf = 138412546;
          id v61 = v5;
          __int16 v62 = 2112;
          v63 = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Failed to write ReportMemoryException plist at %@ due to serialization error: %@",  buf,  0x16u);
        }

        goto LABEL_34;
      }

      id v56 = v12;
      id v14 = v5;
      int v15 = open((const char *)[v14 UTF8String], 1538, 420);
      if (v15 == -1)
      {
        id v49 = shared_pl_log_handle();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v61 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Failed to write ReportMemoryException plist at %@: Could not open file descriptor",  buf,  0xCu);
        }

        goto LABEL_33;
      }

      int v16 = v15;
      v55 = v7;
      NSFileAttributeKey v64 = NSFileProtectionKey;
      NSFileProtectionType v65 = NSFileProtectionNone;
      uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v58 = 0LL;
      v54 = (void *)v17;
      LODWORD(v17) = [v18 setAttributes:v17 ofItemAtPath:v14 error:&v58];
      v19 = (os_log_s *)v58;

      if (!(_DWORD)v17)
      {
        id v50 = shared_pl_log_handle();
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v51 = (char *)objc_claimAutoreleasedReturnValue(-[os_log_s localizedDescription](v19, "localizedDescription"));
          *(_DWORD *)buf = 138412546;
          id v61 = v14;
          __int16 v62 = 2112;
          v63 = v51;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Failed to write ReportMemoryException plist at %@ due to attributes error: %@",  buf,  0x16u);
        }

        goto LABEL_32;
      }

      id v20 = v11;
      ssize_t v21 = write(v16, [v20 bytes], (size_t)objc_msgSend(v20, "length"));
      id v22 = shared_pl_log_handle();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      v24 = v23;
      if (v21 == -1)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v52 = __error();
          v53 = strerror(*v52);
          *(_DWORD *)buf = 138412546;
          id v61 = v14;
          __int16 v62 = 2080;
          v63 = v53;
          v25 = "Failed to write ReportMemoryException plist at %@ with error %s";
          v26 = v24;
          os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
          uint32_t v28 = 22;
          goto LABEL_31;
        }
      }

      else if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v61 = v14;
        v25 = "Successfully wrote ReportMemoryException plist at %@";
        v26 = v24;
        os_log_type_t v27 = OS_LOG_TYPE_INFO;
        uint32_t v28 = 12;
LABEL_31:
        _os_log_impl((void *)&_mh_execute_header, v26, v27, v25, buf, v28);
      }

- (BOOL)setEPLKeysForParameters:(id)a3 error:(id *)a4 domain:(__CFString *)a5
{
  id v8 = a3;
  id v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"EnableEnhancedPerformanceLogging"]);
    id v11 = v10;
    if (v10)
    {
      if ([v10 BOOLValue])
      {
        if ((configureTailspinForEPL(1) & 1) != 0)
        {
          persistAndUnredactLogs(1);
          -[PerformanceLoggingDiagnosticExtensionExtension enableReportMemoryException:]( self,  "enableReportMemoryException:",  1LL);
          id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          [v12 timeIntervalSinceReferenceDate];
          +[PLPreferences setDouble:key:domain:]( &OBJC_CLASS___PLPreferences,  "setDouble:key:domain:",  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"EPLTimeoutTimestampSec"),  a5,  v13 + 172800.0);
          +[PLPreferences setBool:key:domain:]( &OBJC_CLASS___PLPreferences,  "setBool:key:domain:",  1LL,  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"EPLEnabled"),  a5);
          +[PLPreferences setBool:key:domain:]( &OBJC_CLASS___PLPreferences,  "setBool:key:domain:",  1LL,  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"HangTracerEnableAppActivationLogging"),  @"com.apple.hangtracer");
          +[PLPreferences setBool:key:domain:]( &OBJC_CLASS___PLPreferences,  "setBool:key:domain:",  1LL,  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"HangTracerEnabled"),  a5);
          +[PLPreferences setBool:key:domain:]( &OBJC_CLASS___PLPreferences,  "setBool:key:domain:",  1LL,  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"HangTracerEnableTailspin"),  a5);
          +[PLPreferences setBool:key:domain:]( &OBJC_CLASS___PLPreferences,  "setBool:key:domain:",  1LL,  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"HangTracerEnableSignpostMonitoring"),  a5);
          +[PLPreferences setBool:key:domain:]( &OBJC_CLASS___PLPreferences,  "setBool:key:domain:",  1LL,  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"HangTracerEnableWorkflowResponsiveness"),  a5);
          +[PLPreferences setBool:key:domain:]( &OBJC_CLASS___PLPreferences,  "setBool:key:domain:",  1LL,  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"HangTracerCollectOSSignpostsDeferred"),  a5);
          +[PLPreferences setBool:key:domain:]( &OBJC_CLASS___PLPreferences,  "setBool:key:domain:",  0LL,  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"HangTracerShouldUploadToDiagPipe"),  a5);
          +[PLPreferences setString:key:domain:]( &OBJC_CLASS___PLPreferences,  "setString:key:domain:",  @"compressed",  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"HangTracerKeepTailspinsWithFormat"),  a5);
          +[PLPreferences setInteger:key:domain:]( &OBJC_CLASS___PLPreferences,  "setInteger:key:domain:",  55LL,  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"HangTracerSavedTailspinsMaxMB"),  a5);

LABEL_11:
          if (a4) {
            *a4 = 0LL;
          }
          BOOL v14 = 1;
          goto LABEL_21;
        }

        if (!a4) {
          goto LABEL_20;
        }
        int v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to apply config object, tailspin enablement state will not change (enabled = %{BOOL}d)",  1LL);
      }

      else
      {
        persistAndUnredactLogs(0);
        +[PLPreferences removeKey:domain:]( &OBJC_CLASS___PLPreferences,  "removeKey:domain:",  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:](self, "keyWithPrefix:", @"EPLEnabled"),  a5);
        +[PLPreferences removeKey:domain:]( &OBJC_CLASS___PLPreferences,  "removeKey:domain:",  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"HangTracerEnableAppActivationLogging"),  @"com.apple.hangtracer");
        +[PLPreferences removeKey:domain:]( &OBJC_CLASS___PLPreferences,  "removeKey:domain:",  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"HangTracerEnabled"),  a5);
        +[PLPreferences removeKey:domain:]( &OBJC_CLASS___PLPreferences,  "removeKey:domain:",  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"HangTracerEnableTailspin"),  a5);
        +[PLPreferences removeKey:domain:]( &OBJC_CLASS___PLPreferences,  "removeKey:domain:",  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"HangTracerEnableSignpostMonitoring"),  a5);
        +[PLPreferences removeKey:domain:]( &OBJC_CLASS___PLPreferences,  "removeKey:domain:",  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"HangTracerEnableWorkflowResponsiveness"),  a5);
        +[PLPreferences removeKey:domain:]( &OBJC_CLASS___PLPreferences,  "removeKey:domain:",  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"HangTracerCollectOSSignpostsDeferred"),  a5);
        +[PLPreferences removeKey:domain:]( &OBJC_CLASS___PLPreferences,  "removeKey:domain:",  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"HangTracerKeepTailspinsWithFormat"),  a5);
        +[PLPreferences removeKey:domain:]( &OBJC_CLASS___PLPreferences,  "removeKey:domain:",  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"HangTracerSavedTailspinsMaxMB"),  a5);
        +[PLPreferences removeKey:domain:]( &OBJC_CLASS___PLPreferences,  "removeKey:domain:",  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"HangTracerShouldUploadToDiagPipe"),  a5);
        +[PLPreferences removeKey:domain:]( &OBJC_CLASS___PLPreferences,  "removeKey:domain:",  -[PerformanceLoggingDiagnosticExtensionExtension keyWithPrefix:]( self,  "keyWithPrefix:",  @"EPLTimeoutTimestampSec"),  a5);
        if ((configureTailspinForEPL(0) & 1) != 0) {
          goto LABEL_11;
        }
        if (!a4) {
          goto LABEL_20;
        }
        int v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to apply config object, tailspin enablement state will not change (enabled = %{BOOL}d)",  0LL);
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v17,  NSLocalizedDescriptionKey));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"EPLErrorDomain",  3LL,  v18));
    }

    else if (a4)
    {
      int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"Enhanced Performance Logging key not found in parameters",  NSLocalizedDescriptionKey));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"EPLErrorDomain",  2LL,  v15));
    }

- (BOOL)setEPLKeysForParameters:(id)a3 error:(id *)a4
{
  return -[PerformanceLoggingDiagnosticExtensionExtension setEPLKeysForParameters:error:domain:]( self,  "setEPLKeysForParameters:error:domain:",  a3,  a4,  @"com.apple.da");
}

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  if (qword_100015FF0 != -1) {
    dispatch_once(&qword_100015FF0, &stru_1000104B8);
  }
  [(id)qword_100015FD0 lock];
  if ((byte_100015FF8 & 1) != 0)
  {
    id v5 = shared_pl_log_handle();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PLDE is already handling a request...ignoring this request",  buf,  2u);
    }

    [(id)qword_100015FD0 unlock];
    id v7 = &__NSArray0__struct;
  }

  else
  {
    byte_100015FF8 = 1;
    [(id)qword_100015FD0 unlock];
    id v27 = 0LL;
    -[PerformanceLoggingDiagnosticExtensionExtension setEPLKeysForParameters:error:]( self,  "setEPLKeysForParameters:error:",  v4,  &v27);
    id v8 = v27;
    id v9 = shared_pl_log_handle();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
        *(_DWORD *)buf = 138412290;
        id v29 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      [(id)qword_100015FD0 lock];
      byte_100015FF8 = 0;
      [(id)qword_100015FD0 unlock];
      id v7 = &__NSArray0__struct;
    }

    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        double v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"EnableEnhancedPerformanceLogging"]);
        *(_DWORD *)buf = 138412290;
        id v29 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Posting notification regarding EPL state change: %@",  buf,  0xCu);
      }

      notify_post(EPL_STATE_CHANGED_NOTIFICATION);
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"EnableEnhancedPerformanceLogging"]);
      if (v14)
      {
        int v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"EnableEnhancedPerformanceLogging"]);
        unsigned __int8 v16 = [v15 BOOLValue];

        if ((v16 & 1) != 0)
        {
          BOOL v14 = 0LL;
        }

        else
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[PerformanceLoggingDiagnosticExtensionExtension sysdiagnoseParamsFromDEParams:]( self,  "sysdiagnoseParamsFromDEParams:",  v4));
          id v26 = 0LL;
          BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( -[PerformanceLoggingDiagnosticExtensionExtension takeSysdiagnose:error:]( self,  "takeSysdiagnose:error:",  v17,  &v26));
          id v18 = v26;
          if (v18)
          {
            id v19 = shared_pl_log_handle();
            id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              ssize_t v21 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedDescription]);
              *(_DWORD *)buf = 138412290;
              id v29 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Failed to take sysdiagnose with error: %@",  buf,  0xCu);
            }
          }

          -[PerformanceLoggingDiagnosticExtensionExtension enableReportMemoryException:]( self,  "enableReportMemoryException:",  0LL);
          cleanupDiagnosticLogsDirectory(@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/HangTracer/");
        }
      }

      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      if (v14)
      {
        id v22 = shared_pl_log_handle();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Constructing DEAttachmentItem for sysdiagnose file",  buf,  2u);
        }

        v24 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v14));
        [v24 setDeleteOnAttach:&__kCFBooleanTrue];
        [v7 addObject:v24];
      }

      [(id)qword_100015FD0 lock];
      byte_100015FF8 = 0;
      [(id)qword_100015FD0 unlock];
    }
  }

  return v7;
}

@end