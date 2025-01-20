@interface OSACrackShotReport
+ (id)getDisplayState;
+ (id)getThermalPressureLevel;
+ (void)getDisplayState;
+ (void)getThermalPressureLevel;
- (BOOL)isSnapshotDisabled;
- (BOOL)saveWithOptions:(id)a3;
- (NSDictionary)spindump;
- (OSACrackShotReport)initWithPid:(int)a3 procName:(id)a4 bundleID:(id)a5 exitSnapshot:(exit_reason_snapshot *)a6 reason:(id)a7;
- (id)additionalIPSMetadata;
- (id)decode_cpuType;
- (id)decode_reason:(exit_reason_snapshot *)a3 reason:(id)a4;
- (id)initForPid:(int)a3 exitSnapshot:(exit_reason_snapshot *)a4 reason:(id)a5;
- (id)problemType;
- (id)reportNamePrefix;
- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4;
- (void)setSpindump:(id)a3;
@end

@implementation OSACrackShotReport

- (OSACrackShotReport)initWithPid:(int)a3 procName:(id)a4 bundleID:(id)a5 exitSnapshot:(exit_reason_snapshot *)a6 reason:(id)a7
{
  uint64_t v11 = *(void *)&a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___OSACrackShotReport;
  v16 = -[OSAStackShotReport initForPid:process:withReason:exceptionCode:exceptionCodeCount:stackshotFlags:]( &v26,  sel_initForPid_process_withReason_exceptionCode_exceptionCodeCount_stackshotFlags_,  v11,  v13,  0LL,  0LL,  0LL,  0LL);
  v17 = (OSACrackShotReport *)v16;
  if (v16)
  {
    objc_storeStrong(v16 + 10, a4);
    objc_storeStrong((id *)&v17->_bundleID, a5);
    uint64_t v18 = -[OSACrackShotReport decode_reason:reason:](v17, "decode_reason:reason:", a6, v15);
    termination_mach_timebase_info info = v17->_termination_info;
    v17->_termination_mach_timebase_info info = (NSDictionary *)v18;

    -[OSAStackShotReport setReason:](v17, "setReason:", v15);
    v20 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
    [v20 getTaskingKey:@"disableWatchdogStackshot"];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_isSnapshotDisabled = [v21 BOOLValue];

    v17->_isSystemWatchdog = 1;
    if (!mach_timebase_info(&info))
    {
      if (info.denom)
      {
        LODWORD(v22) = info.numer;
        double v23 = (double)v22 * 0.000000001 / (double)info.denom;
        v17->_awakeSystemUptime = (unint64_t)(v23 * (double)mach_absolute_time());
      }
    }
  }

  return v17;
}

- (id)initForPid:(int)a3 exitSnapshot:(exit_reason_snapshot *)a4 reason:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  mach_port_name_t name = 0;
  v8 = (ipc_space_t *)MEMORY[0x1895FBBE0];
  id v9 = a5;
  if (task_read_for_pid())
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v22 = 0;
      _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "failed task_read_for_pid", v22, 2u);
    }

    v10 = 0LL;
    uint64_t v11 = 0LL;
  }

  else
  {
    v12 = (void *)[objc_alloc(MEMORY[0x189612A40]) initWithTask:name];
    v10 = v12;
    if (v12)
    {
      [v12 name];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = (void *)[v13 copy];
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "failed to create VMUProcInfo",  buf,  2u);
      }

      uint64_t v11 = 0LL;
    }

    mach_port_deallocate(*v8, name);
  }

  id v14 = -[OSACrackShotReport initWithPid:procName:bundleID:exitSnapshot:reason:]( self,  "initWithPid:procName:bundleID:exitSnapshot:reason:",  v6,  v11,  0LL,  a4,  v9);

  if (v14)
  {
    v14->_isSystemWatchdog = 0;
    if (v10)
    {
      *(&v14->_cpuType + 1) = [v10 cpuType];
      [v10 userAppName];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v15 copy];
      procPath = v14->_procPath;
      v14->_procPath = (NSString *)v16;

      if (-[NSString length](v14->_procPath, "length"))
      {
        +[OSAReport findBundleAtPath:withKeys:bundleURL:]( &OBJC_CLASS___OSAReport,  "findBundleAtPath:withKeys:bundleURL:",  v14->_procPath,  &unk_189E31D78,  0LL);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = [v18 objectForKeyedSubscript:@"CFBundleIdentifier"];
        bundleID = v14->_bundleID;
        v14->_bundleID = (NSString *)v19;
      }
    }
  }

  return v14;
}

- (id)problemType
{
  if (self->_isSystemWatchdog) {
    return @"409";
  }
  else {
    return @"509";
  }
}

- (id)reportNamePrefix
{
  appName = self->super._appName;
  if (appName)
  {
    [NSString stringWithFormat:@"%@", appName];
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v3 = @"unknown";
  }

  return v3;
}

- (id)additionalIPSMetadata
{
  v15[4] = *MEMORY[0x1895F89C0];
  appName = (const __CFString *)self->super._appName;
  if (!appName) {
    appName = @"Unknown";
  }
  v14[0] = @"name";
  v14[1] = @"app_name";
  v15[0] = appName;
  v15[1] = appName;
  v14[2] = @"share_with_app_devs";
  v4 = (void *)MEMORY[0x189607968];
  v5 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "optIn3rdParty"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v6;
  v14[3] = @"incident_id";
  v7 = -[OSAReport incidentID](self, "incidentID");
  v15[3] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = (void *)[v8 mutableCopy];
  v10 = -[OSAReport etlKey](self, "etlKey");
  if (v10)
  {
    -[OSAReport etlKey](self, "etlKey");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v11 forKeyedSubscript:@"etl_key"];
  }

  bundleID = self->_bundleID;
  if (bundleID) {
    [v9 setObject:bundleID forKeyedSubscript:@"bundleID"];
  }
  return v9;
}

- (id)decode_reason:(exit_reason_snapshot *)a3 reason:(id)a4
{
  v19[1] = *MEMORY[0x1895F89C0];
  id v5 = a4;
  uint64_t v6 = (void *)objc_opt_new();
  if (a3)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->ers_code];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v7 forKeyedSubscript:@"code"];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->ers_flags];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v8 forKeyedSubscript:@"flags"];

    if (a3->ers_namespace == 20)
    {
      uint64_t v18 = &unk_189E30890;
      v19[0] = @"monitoring timed out for service";
      [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->ers_code];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 objectForKeyedSubscript:v10];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v11 forKeyedSubscript:@"indicator"];

      v12 = @"WATCHDOG";
    }

    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"<0x%X>", a3->ers_namespace);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    v12 = @"<NO_NS>";
  }

  [v6 setObject:v12 forKeyedSubscript:@"namespace"];
  if (v5)
  {
    [v5 componentsSeparatedByString:@"\n"];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 valueForKey:@"stringByTrimming"];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896079C8] predicateWithFormat:@"SELF != ''"];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 filteredArrayUsingPredicate:v15];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v16 count]) {
      [v6 setObject:v16 forKeyedSubscript:@"details"];
    }
  }

  return v6;
}

- (id)decode_cpuType
{
  return OSACPUTypeToString(*((unsigned int *)&self->_cpuType + 1));
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  v97[10] = *MEMORY[0x1895F89C0];
  id v5 = (void (**)(id, void *))a4;
  v96[0] = @"incident";
  v61 = -[OSAReport incidentID](self, "incidentID");
  v97[0] = v61;
  v96[1] = @"crashReporterKey";
  v60 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  [v60 crashReporterKey];
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v97[1] = v59;
  v96[2] = @"modelCode";
  v58 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  [v58 modelCode];
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v97[2] = v57;
  v96[3] = @"pid";
  [MEMORY[0x189607968] numberWithInt:self->super._pid];
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v97[3] = v56;
  v96[4] = @"cpuType";
  v55 = -[OSACrackShotReport decode_cpuType](self, "decode_cpuType");
  v97[4] = v55;
  v96[5] = @"osVersion";
  v94[0] = @"train";
  v54 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  [v54 osTrain];
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v53;
  v94[1] = @"build";
  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 buildVersion];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v95[1] = v7;
  v94[2] = @"releaseType";
  v8 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  [v8 releaseType];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v95[2] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v95 forKeys:v94 count:3];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v97[5] = v10;
  v96[6] = @"captureTime";
  OSADateFormat(2u, self->super.super._capture_time);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v97[6] = v11;
  v97[7] = &unk_189E308A8;
  v96[7] = @"deployVersion";
  v96[8] = @"variant";
  v96[9] = @"variantVersion";
  v97[8] = @"stackshot";
  v97[9] = &unk_189E308C0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v97 forKeys:v96 count:10];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v12);

  -[OSACrackShotReport problemType](self, "problemType");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSALog commonFieldsForBody:](&OBJC_CLASS___OSALog, "commonFieldsForBody:", v13);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v14);

  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = [v15 appleInternal];

  if ((_DWORD)v13)
  {
    uint64_t v16 = (void *)MGCopyAnswer();
    v92 = @"codeName";
    v93 = v16;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v17);
  }

  if (-[NSString length](self->super._appName, "length"))
  {
    appName = self->super._appName;
    v90 = @"procName";
    v91 = appName;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v19);
  }

  if (-[NSString length](self->_procPath, "length"))
  {
    procPath = self->_procPath;
    v88 = @"procPath";
    v89 = procPath;
    v21 = (void *)MEMORY[0x189603F68];
    unint64_t v22 = procPath;
    [v21 dictionaryWithObjects:&v89 forKeys:&v88 count:1];
    double v23 = (void *)objc_claimAutoreleasedReturnValue();

    v5[2](v5, v23);
  }

  if (self->_bundleID)
  {
    bundleID = self->_bundleID;
    v86 = @"bundleInfo";
    v84 = @"CFBundleIdentifier";
    [MEMORY[0x189603F68] dictionaryWithObjects:&bundleID forKeys:&v84 count:1];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v24;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v25);
  }

  if (-[NSDictionary count](self->_termination_info, "count"))
  {
    termination_mach_timebase_info info = self->_termination_info;
    v82 = @"termination";
    v83 = termination_info;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v27);
  }

  uint64_t v28 = [(id)objc_opt_class() bootSessionUUID];
  v29 = (void *)v28;
  if (v28)
  {
    v80 = @"bootSessionUUID";
    uint64_t v81 = v28;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v30);
  }

  v78 = @"uptime";
  [(id)objc_opt_class() reduceToTwoSigFigures:self->_awakeSystemUptime];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v31;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v32);

  uint64_t v33 = +[OSACrackShotReport getThermalPressureLevel](&OBJC_CLASS___OSACrackShotReport, "getThermalPressureLevel");
  v34 = (void *)v33;
  if (v33)
  {
    v76 = @"thermalPressureLevel";
    uint64_t v77 = v33;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v35);
  }

  [MEMORY[0x1896079D8] processInfo];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  int v37 = [v36 isLowPowerModeEnabled];

  if (v37) {
    v5[2](v5, &unk_189E31980);
  }
  uint64_t v38 = +[OSACrackShotReport getDisplayState](&OBJC_CLASS___OSACrackShotReport, "getDisplayState");
  v39 = (void *)v38;
  if (v38)
  {
    v74 = @"displayState";
    uint64_t v75 = v38;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v40);
  }

  if (!-[OSACrackShotReport isSnapshotDisabled](self, "isSnapshotDisabled"))
  {
    if (self->super._ss_trace_buffer)
    {
      v72 = &unk_189E308D8;
      v73 = @"stackshot";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v41);

      v42 = objc_alloc_init(&OBJC_CLASS___OSABinaryImageCatalog);
      -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]( self,  "decodeKCDataWithBlock:withTuning:usingCatalog:",  v5,  &unk_189E319A8,  v42);
      v70 = @"binaryImages";
      v43 = -[OSABinaryImageCatalog reportUsedImages](v42, "reportUsedImages");
      v71 = v43;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v44);

      -[OSABinaryImageCatalog appendNotesTo:](v42, "appendNotesTo:", self->super.super._notes);
      v68 = &unk_189E308F0;
      v69 = &stru_189E21910;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v45);
    }
    v46 = -[OSACrackShotReport spindump](self, "spindump");
    if (v46)
    {
      v66 = @"spindump";
      v47 = -[OSACrackShotReport spindump](self, "spindump");
      v67 = v47;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v48);
    }
  }

  additionalPayload = self->super._additionalPayload;
  if (additionalPayload)
  {
    v64 = @"additionalPayload";
    v65 = additionalPayload;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v50);
  }

  -[NSMutableArray addObject:]( self->super.super._notes,  "addObject:",  @"This is a watchdog-triggered termination event, and not expected to be well-represented in the legacy crash format");
  if (self->_isSnapshotDisabled) {
    -[NSMutableArray addObject:](self->super.super._notes, "addObject:", @"stackshot inclusion disabled");
  }
  if (-[NSMutableArray count](self->super.super._notes, "count"))
  {
    notes = self->super.super._notes;
    v62[0] = @"reportNotes";
    v62[1] = &unk_189E30908;
    v63[0] = notes;
    v63[1] = &unk_189E30890;
    [MEMORY[0x189603F68] dictionaryWithObjects:v63 forKeys:v62 count:2];
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v52);
  }
}

- (BOOL)saveWithOptions:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OSACrackShotReport;
  return -[OSAReport saveWithOptions:](&v4, sel_saveWithOptions_, a3);
}

+ (id)getThermalPressureLevel
{
  int out_token = 0;
  if (!notify_register_check((const char *)*MEMORY[0x1895FB8A0], &out_token))
  {
    uint64_t state64 = 0LL;
    if (notify_get_state(out_token, &state64))
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        +[OSACrackShotReport getThermalPressureLevel].cold.1();
      }
      v3 = 0LL;
      goto LABEL_24;
    }

    objc_super v4 = (void *)NSString;
    if ((int)state64 > 29)
    {
      switch((_DWORD)state64)
      {
        case 0x1E:
          id v5 = @"ThermalPressureLevelHeavy";
          goto LABEL_23;
        case 0x28:
          id v5 = @"ThermalPressureLevelTrapping";
          goto LABEL_23;
        case 0x32:
          id v5 = @"ThermalPressureLevelSleeping";
          goto LABEL_23;
      }
    }

    else
    {
      switch((_DWORD)state64)
      {
        case 0:
          id v5 = @"ThermalPressureLevelNominal";
          goto LABEL_23;
        case 0xA:
          id v5 = @"ThermalPressureLevelLight";
          goto LABEL_23;
        case 0x14:
          id v5 = @"ThermalPressureLevelModerate";
LABEL_23:
          [MEMORY[0x189607968] numberWithUnsignedLongLong:state64];
          uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 stringValue];
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 stringWithFormat:@"%@ (%@)", v5, v7];
          v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
          notify_cancel(out_token);
          return v3;
      }
    }

    id v5 = @"unknown";
    goto LABEL_23;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    +[OSACrackShotReport getThermalPressureLevel].cold.2();
  }
  return 0LL;
}

+ (id)getDisplayState
{
  int out_token = 0;
  if (notify_register_check("com.apple.iokit.hid.displayStatus", &out_token))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      +[OSACrackShotReport getDisplayState].cold.2();
    }
    return 0LL;
  }

  uint64_t v3 = 0LL;
  if (notify_get_state(out_token, &v3))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      +[OSACrackShotReport getDisplayState].cold.1();
    }
    return 0LL;
  }

  if (v3) {
    return @"ON";
  }
  else {
    return @"OFF";
  }
}

- (NSDictionary)spindump
{
  return self->_spindump;
}

- (void)setSpindump:(id)a3
{
}

- (BOOL)isSnapshotDisabled
{
  return self->_isSnapshotDisabled;
}

- (void).cxx_destruct
{
}

+ (void)getThermalPressureLevel
{
}

+ (void)getDisplayState
{
}

@end