@interface SystemDiagnosticLogAgentiOS
- (BOOL)ASPToolTrace:(id)a3 withTimeout:(double)a4;
- (BOOL)GEAvailabilityTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)_BTPHYTaskWithTimeout:(double)a3;
- (BOOL)_proximityTaskWithTimeout:(double)a3;
- (BOOL)_triggerCoreThreadTopologyGenerationWithTimeout:(double)a3;
- (BOOL)getAccessibilityPreferences:(id)a3 withTimeout:(double)a4;
- (BOOL)getKeyboardPreferences:(id)a3 withTimeout:(double)a4;
- (BOOL)takeStackshotWithFlags:(unsigned int)a3 withTimeout:(double)a4;
- (id)_AWDTaskWithTimeout:(double)a3;
- (void)processMessage:(id)a3 replyWith:(id)a4;
@end

@implementation SystemDiagnosticLogAgentiOS

- (BOOL)_proximityTaskWithTimeout:(double)a3
{
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  v5 = dlopen(0LL, 2);
  if (!v5)
  {
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "couldn't get handle", buf, 2u);
    }

    goto LABEL_16;
  }

  dlerror();
  v6 = dlsym(v5, "PRCollectLogs");
  if (!v6)
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Proximity API not found", buf, 2u);
    }

    dlclose(v5);
LABEL_16:
    BOOL v9 = 0;
    goto LABEL_17;
  }

  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Proximity API found", buf, 2u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100001A74;
  v13[3] = &unk_100060670;
  v13[4] = &v15;
  v13[5] = v6;
  if (!+[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v13,  a3))
  {
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Proxmitiy SPI timed out", buf, 2u);
    }
  }

  dlclose(v5);
  BOOL v9 = *((_BYTE *)v16 + 24) != 0;
LABEL_17:
  _Block_object_dispose(&v15, 8);
  return v9;
}

- (BOOL)_triggerCoreThreadTopologyGenerationWithTimeout:(double)a3
{
  if (objc_opt_class(&OBJC_CLASS___CtrClientSysdiag, a2))
  {
    *(void *)buf = 0LL;
    v12 = buf;
    uint64_t v13 = 0x2020000000LL;
    char v14 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100001C24;
    v10[3] = &unk_100060698;
    v10[4] = self;
    v10[5] = buf;
    if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v10,  a3))
    {
      BOOL v5 = v12[24] != 0;
    }

    else
    {
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CoreThread Topology SPI timed out", v9, 2u);
      }

      BOOL v5 = 0;
    }

    _Block_object_dispose(buf, 8);
  }

  else
  {
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CoreThread Topology SPI not available",  buf,  2u);
    }

    return 0;
  }

  return v5;
}

- (id)_AWDTaskWithTimeout:(double)a3
{
  if (&_AWDServerConsolidateDeviceDiagnostics)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
    *(void *)buf = 0LL;
    v35 = buf;
    uint64_t v36 = 0x3032000000LL;
    v37 = sub_10000210C;
    v38 = sub_10000211C;
    id v39 = 0LL;
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100002124;
    v31[3] = &unk_1000606C0;
    v33 = buf;
    v4 = v7;
    v32 = v4;
    AWDServerConsolidateDeviceDiagnostics(2LL, v10, v31);

    if (a3 == -1.0)
    {
      dispatch_time_t v11 = -1LL;
    }

    else
    {
      if (a3 <= 0.0)
      {
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v30 = 0;
          uint64_t v13 = "Unknown value for timeout specified. Returning";
          goto LABEL_25;
        }

- (BOOL)_BTPHYTaskWithTimeout:(double)a3
{
  if (&_CoreCaptureControlCreate)
  {
    *(void *)buf = 0LL;
    dispatch_time_t v11 = buf;
    uint64_t v12 = 0x2020000000LL;
    char v13 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000022C0;
    v9[3] = &unk_100060698;
    v9[4] = self;
    v9[5] = buf;
    BOOL v5 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v9,  a3);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finished corecapture BTPHY SPI", v8, 2u);
    }

    if (!v11[24]) {
      BOOL v5 = 0;
    }
    _Block_object_dispose(buf, 8);
  }

  else
  {
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle", a3));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CoreCapture SPI not available", buf, 2u);
    }

    return 0;
  }

  return v5;
}

- (BOOL)GEAvailabilityTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000253C;
  v12[3] = &unk_100060710;
  v12[4] = self;
  uint64_t v14 = &v15;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"GEAvailability.log"]);
  id v13 = v7;
  if (+[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v12,  a4)
    && *((_BYTE *)v16 + 24))
  {
    BOOL v8 = 1;
  }

  else
  {
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_time_t v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "GEAvailability task SPI not available, timed out or couldn't create the dest file",  v11,  2u);
    }

    BOOL v8 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (BOOL)takeStackshotWithFlags:(unsigned int)a3 withTimeout:(double)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000028C0;
  v5[3] = &unk_100060738;
  v5[4] = self;
  unsigned int v6 = a3;
  return +[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v5,  a4);
}

- (BOOL)ASPToolTrace:(id)a3 withTimeout:(double)a4
{
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByAppendingPathComponent:@"asptool_trace.log"]);
  LOBYTE(self) = -[SystemDiagnosticLogAgent ASPToolGenericWithTimeout:forFile:andBlock:]( self,  "ASPToolGenericWithTimeout:forFile:andBlock:",  v6,  &stru_100060778,  a4);

  return (char)self;
}

- (BOOL)getKeyboardPreferences:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_10000210C;
  v33 = sub_10000211C;
  id v34 = 0LL;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  __int128 v26 = sub_10000210C;
  __int128 v27 = sub_10000211C;
  id v28 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100002CD4;
  v18[3] = &unk_1000607A0;
  v18[4] = self;
  v19 = &off_100062230;
  uint64_t v21 = &v29;
  id v22 = &v23;
  v20 = &off_100062248;
  unsigned __int8 v7 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v18,  a4);
  if ((v7 & 1) == 0)
  {
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Couldn't retrieve the preferences within the required time",  v17,  2u);
    }
  }

  if ([(id)v30[5] count] || objc_msgSend((id)v24[5], "count"))
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v30[5] description]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.Preferences:\n" stringByAppendingString:v9]);

    dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue([(id)v24[5] description]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([@"GlobalPreferences:\n" stringByAppendingString:v11]);
    id v13 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingString:v12]);
  }

  else
  {
    id v13 = @"Could not retrieve keyboard preferences.";
  }

  unsigned __int8 v14 = sub_100003F0C(v6, (uint64_t)@"Keyboard_Preferences.txt", v13);
  if ((v14 & 1) == 0)
  {
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Couldn't write keyboard preferences.",  v17,  2u);
    }
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v7 & v14;
}

- (BOOL)getAccessibilityPreferences:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  uint64_t v17 = 0LL;
  char v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_10000210C;
  uint64_t v21 = sub_10000211C;
  id v22 = 0LL;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100002F08;
  v14[3] = &unk_1000607C8;
  uint64_t v16 = &v17;
  v14[4] = self;
  uint64_t v15 = &off_100062260;
  unsigned int v7 = +[SystemDiagnosticLogAgent _runBlock:withTimeout:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "_runBlock:withTimeout:",  v14,  a4);
  if ((v7 & 1) == 0)
  {
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Could not retrieve accessibility preferences within the required time",  v13,  2u);
    }
  }

  if ([(id)v18[5] count])
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v18[5] description]);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue([@"com.apple.Accessibility:" stringByAppendingString:v9]);
  }

  else
  {
    v10 = @"Could not retrieve accessibility preferences.";
  }

  unsigned int v11 = v7 & sub_100003F0C(v6, (uint64_t)@"Accessibility_Preferences.txt", v10);

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)processMessage:(id)a3 replyWith:(id)a4
{
  id v6 = a4;
  int v39 = -1;
  uint64_t v37 = 0LL;
  double v38 = 0.0;
  id v36 = 0LL;
  unsigned int v7 = -[SystemDiagnosticLogAgent parseLogAgentRequest:outputPath:timeout:taskType:startTimeClockNS:]( self,  "parseLogAgentRequest:outputPath:timeout:taskType:startTimeClockNS:",  a3,  &v36,  &v38,  &v39,  &v37);
  id v8 = v36;
  BOOL v9 = v8;
  if (v7)
  {
    switch(v39)
    {
      case 1:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgentiOS getAccessibilityPreferences:withTimeout:]( self,  "getAccessibilityPreferences:withTimeout:",  v8,  v38);
        goto LABEL_52;
      case 3:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent ASPToolTaskForDir:withTimeout:]( self,  "ASPToolTaskForDir:withTimeout:",  v8,  v38);
        goto LABEL_52;
      case 4:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent ASPMagazineTaskForDir:withTimeout:]( self,  "ASPMagazineTaskForDir:withTimeout:",  v8,  v38);
        goto LABEL_52;
      case 5:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent ASPToolSnapshotForDir:withTimeout:]( self,  "ASPToolSnapshotForDir:withTimeout:",  v8,  v38);
        goto LABEL_52;
      case 6:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgentiOS ASPToolTrace:withTimeout:](self, "ASPToolTrace:withTimeout:", v8, v38);
        goto LABEL_52;
      case 7:
        unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgentiOS _AWDTaskWithTimeout:](self, "_AWDTaskWithTimeout:", v38));
        goto LABEL_56;
      case 9:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent batteryHealthTaskWithDir:withTimeout:]( self,  "batteryHealthTaskWithDir:withTimeout:",  v8,  v38);
        goto LABEL_52;
      case 11:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgentiOS _BTPHYTaskWithTimeout:](self, "_BTPHYTaskWithTimeout:", v38);
        goto LABEL_52;
      case 12:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent getCloudKitPreferences:withTimeout:]( self,  "getCloudKitPreferences:withTimeout:",  v8,  v38);
        goto LABEL_52;
      case 13:
        double v15 = v38;
        uint64_t v16 = self;
        uint64_t v17 = v9;
        uint64_t v18 = 1LL;
        goto LABEL_21;
      case 14:
        self = (SystemDiagnosticLogAgentiOS *)objc_claimAutoreleasedReturnValue( -[SystemDiagnosticLogAgent coreCaptureConfigTask:]( self,  "coreCaptureConfigTask:",  v38));
        if (!self) {
          goto LABEL_53;
        }
        xpc_dictionary_set_value(v6, "replyDictionary", self);

        id v12 = 0LL;
        id v13 = 0LL;
        goto LABEL_68;
      case 15:
        double v15 = v38;
        uint64_t v16 = self;
        uint64_t v17 = v9;
        uint64_t v18 = 0LL;
LABEL_21:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent coreCaptureTaskWithDir:withTimeout:ofType:]( v16,  "coreCaptureTaskWithDir:withTimeout:ofType:",  v17,  v18,  v15);
        goto LABEL_52;
      case 18:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent DSCSYMTaskForDir:withTimeout:](self, "DSCSYMTaskForDir:withTimeout:", v8, v38);
        goto LABEL_52;
      case 20:
        unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( -[SystemDiagnosticLogAgent excResourcePathsWithTimeout:]( self,  "excResourcePathsWithTimeout:",  v38));
        goto LABEL_56;
      case 21:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent FDRDiagnosticTaskWithDir:withTimeout:]( self,  "FDRDiagnosticTaskWithDir:withTimeout:",  v8,  v38);
        goto LABEL_52;
      case 23:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgentiOS GEAvailabilityTaskWithDir:withTimeout:]( self,  "GEAvailabilityTaskWithDir:withTimeout:",  v8,  v38);
        goto LABEL_52;
      case 26:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgentiOS getKeyboardPreferences:withTimeout:]( self,  "getKeyboardPreferences:withTimeout:",  v8,  v38);
        goto LABEL_52;
      case 27:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent _libNotifyTaskAtLocation:andTimeout:]( self,  "_libNotifyTaskAtLocation:andTimeout:",  v8,  v38);
        goto LABEL_52;
      case 28:
        unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( -[SystemDiagnosticLogAgent _memoryExceptionsTaskWithTimeout:]( self,  "_memoryExceptionsTaskWithTimeout:",  v38));
        goto LABEL_56;
      case 29:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent _memoryExceptionsListLogsTaskWithDir:withTimeout:]( self,  "_memoryExceptionsListLogsTaskWithDir:withTimeout:",  v8,  v38);
        goto LABEL_52;
      case 31:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent osEligibilityDumpToDir:withTimeout:]( self,  "osEligibilityDumpToDir:withTimeout:",  v8,  v38);
        goto LABEL_52;
      case 33:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent _powerTaskForDir:withTimeout:](self, "_powerTaskForDir:withTimeout:", v8, v38);
        goto LABEL_52;
      case 34:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent getPreferences:withTimeout:](self, "getPreferences:withTimeout:", v8, v38);
        goto LABEL_52;
      case 35:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent getPreferencesInternal:withTimeout:]( self,  "getPreferencesInternal:withTimeout:",  v8,  v38);
        goto LABEL_52;
      case 38:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgentiOS _proximityTaskWithTimeout:](self, "_proximityTaskWithTimeout:", v38);
        goto LABEL_52;
      case 39:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent runningBoardTaskWithDir:withTimeout:]( self,  "runningBoardTaskWithDir:withTimeout:",  v8,  v38);
        goto LABEL_52;
      case 40:
        double v19 = v38;
        v20 = self;
        uint64_t v21 = 0LL;
        goto LABEL_38;
      case 41:
        double v19 = v38;
        v20 = self;
        uint64_t v21 = 0x8000LL;
LABEL_38:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgentiOS takeStackshotWithFlags:withTimeout:]( v20,  "takeStackshotWithFlags:withTimeout:",  v21,  v19);
        goto LABEL_52;
      case 46:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent tailspinInfoTaskWithDir:withTimeout:]( self,  "tailspinInfoTaskWithDir:withTimeout:",  v8,  v38);
        goto LABEL_52;
      case 47:
        id v13 = (id)objc_claimAutoreleasedReturnValue( -[SystemDiagnosticLogAgent tailspinKeychordTaskWithDir:withTimeout:]( self,  "tailspinKeychordTaskWithDir:withTimeout:",  v8,  v38));
        LOBYTE(self) = 0;
        goto LABEL_45;
      case 48:
        id v22 = (void *)objc_claimAutoreleasedReturnValue( [v8 stringByAppendingPathComponent:@"sysdiagnose_logarchive_timeout_nosymbols.tailspin"]);

        double v23 = v38;
        v24 = @"logarchive timeout";
        goto LABEL_43;
      case 49:
        id v22 = (void *)objc_claimAutoreleasedReturnValue( [v8 stringByAppendingPathComponent:@"sysdiagnose_outputdir_timeout_nosymbols.tailspin"]);

        double v23 = v38;
        v24 = @"Output Dir timeout";
LABEL_43:
        if (-[SystemDiagnosticLogAgent tailspinSaveSpiWrapperForReason:forPath:collectAriadne:withTimeout:]( self,  "tailspinSaveSpiWrapperForReason:forPath:collectAriadne:withTimeout:",  v24,  v22,  1LL,  v23))
        {
          id v13 = v22;
          LOBYTE(self) = 1;
          BOOL v9 = v13;
LABEL_45:
          if (v13)
          {
            xpc_object_t v25 = xpc_array_create(0LL, 0LL);
            id v12 = v13;
            xpc_array_set_string(v25, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v12 fileSystemRepresentation]);
            id v13 = 0LL;
            goto LABEL_66;
          }

          id v12 = 0LL;
        }

        else
        {
          id v12 = 0LL;
          id v13 = 0LL;
          LOBYTE(self) = 0;
          BOOL v9 = v22;
        }

        break;
      case 50:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent tailspinSaveNoSymbolicateTSTaskWithDir:withTimeout:]( self,  "tailspinSaveNoSymbolicateTSTaskWithDir:withTimeout:",  v8,  v38);
        goto LABEL_52;
      case 51:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent timezoneTaskWithDir:withTimeout:]( self,  "timezoneTaskWithDir:withTimeout:",  v8,  v38);
        goto LABEL_52;
      case 52:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent trialTaskWithDir:withTimeout:](self, "trialTaskWithDir:withTimeout:", v8, v38);
        goto LABEL_52;
      case 53:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgentiOS _triggerCoreThreadTopologyGenerationWithTimeout:]( self,  "_triggerCoreThreadTopologyGenerationWithTimeout:",  v38);
        goto LABEL_52;
      case 54:
        unsigned __int8 v10 = -[SystemDiagnosticLogAgent unifiedAssetTaskWithDir:withTimeout:]( self,  "unifiedAssetTaskWithDir:withTimeout:",  v8,  v38);
LABEL_52:
        LOBYTE(self) = v10;
LABEL_53:
        id v12 = 0LL;
        id v13 = 0LL;
        break;
      case 55:
        unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( -[SystemDiagnosticLogAgent intelligencePlatformTaskWithTimeout:withTimeout:]( self,  "intelligencePlatformTaskWithTimeout:withTimeout:",  v8,  v38));
LABEL_56:
        id v13 = v14;
        if (!v14 || ![v14 count])
        {
          id v12 = 0LL;
          goto LABEL_8;
        }

        xpc_object_t v25 = xpc_array_create(0LL, 0LL);
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        id v13 = v13;
        id v26 = [v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v32;
          do
          {
            for (i = 0LL; i != v27; i = (char *)i + 1)
            {
              if (*(void *)v32 != v28) {
                objc_enumerationMutation(v13);
              }
              id v30 = *(id *)(*((void *)&v31 + 1) + 8LL * (void)i);
              xpc_array_set_string( v25,  0xFFFFFFFFFFFFFFFFLL,  (const char *)objc_msgSend(v30, "fileSystemRepresentation", (void)v31));
            }

            id v27 = [v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
          }

          while (v27);
        }

        LOBYTE(self) = 0;
        id v12 = 0LL;
LABEL_66:
        if (v25)
        {
          xpc_dictionary_set_value(v6, "resultPaths", v25);

LABEL_68:
          LOBYTE(self) = 1;
        }

        break;
      default:
        unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Not a valid request type for sysdiagnose_agent",  buf,  2u);
        }

        goto LABEL_7;
    }
  }

  else
  {
LABEL_7:
    id v12 = 0LL;
    id v13 = 0LL;
LABEL_8:
    LOBYTE(self) = 0;
  }

  xpc_dictionary_set_BOOL(v6, "result", (BOOL)self);
}

@end