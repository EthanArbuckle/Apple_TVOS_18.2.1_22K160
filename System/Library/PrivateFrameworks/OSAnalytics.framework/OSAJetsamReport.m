@interface OSAJetsamReport
+ (int)instrumentEventsWithAudioAssertionState:(id)a3 visibliltyEndowmentState:(id)a4;
+ (int64_t)_daysSince1970;
+ (jetsam_snapshot)fetchSnapshotWithFlags:(unsigned int)a3 error:(id *)a4;
- (BOOL)alreadyDumpedSuspendedJetsamLogToday;
- (BOOL)isActionable;
- (BOOL)saveWithOptions:(id)a3;
- (OSAJetsamReport)initWithIncidentID:(id)a3 visibilityEndowmentState:(id)a4 audioAssertionState:(id)a5;
- (id)additionalIPSMetadata;
- (id)appleCareDetails;
- (id)problemType;
- (id)reportNamePrefix;
- (unint64_t)getEventPriority:(id)a3 terminationReason:(unint64_t)a4 priority:(int64_t)a5;
- (void)_setDumpedSuspendedJetsamLog;
- (void)acquireJetsamData;
- (void)acquireJetsamDataWithFlags:(unsigned int)a3;
- (void)dealloc;
- (void)fetchWiredMemoryInfo;
- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4;
- (void)instrumentEvents:(BOOL)a3;
- (void)updateLogLimitFor:(unint64_t)a3;
@end

@implementation OSAJetsamReport

- (OSAJetsamReport)initWithIncidentID:(id)a3 visibilityEndowmentState:(id)a4 audioAssertionState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___OSAJetsamReport;
  v12 = -[OSAReport init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    if (v9) {
      objc_storeStrong((id *)&v12->super._incidentID, a3);
    }
    if (v10) {
      v14 = (NSSet *)v10;
    }
    else {
      v14 = (NSSet *)objc_alloc_init(MEMORY[0x189604010]);
    }
    visibilityEndowmentState = v13->_visibilityEndowmentState;
    v13->_visibilityEndowmentState = v14;

    if (v11) {
      v16 = (NSSet *)v11;
    }
    else {
      v16 = (NSSet *)objc_alloc_init(MEMORY[0x189604010]);
    }
    audioAssertionState = v13->_audioAssertionState;
    v13->_audioAssertionState = v16;

    largestActiveApp = v13->_largestActiveApp;
    v13->_largestActiveApp = (NSString *)&stru_189E21910;

    uint64_t v19 = objc_opt_new();
    killedActiveApps = v13->_killedActiveApps;
    v13->_killedActiveApps = (NSMutableArray *)v19;
  }

  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OSAJetsamReport;
  -[OSAJetsamReport dealloc](&v3, sel_dealloc);
}

- (id)problemType
{
  return @"298";
}

- (id)appleCareDetails
{
  v7[3] = *MEMORY[0x1895F89C0];
  if (!-[NSMutableArray count](self->_killedActiveApps, "count")) {
    return 0LL;
  }
  -[NSMutableArray componentsJoinedByString:]( self->_killedActiveApps,  "componentsJoinedByString:",  @";",
    self->_largestActiveApp);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_wiredBytes];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  [MEMORY[0x189603F18] arrayWithObjects:v7 count:3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)reportNamePrefix
{
  return @"JetsamEvent";
}

- (id)additionalIPSMetadata
{
  v8[1] = *MEMORY[0x1895F89C0];
  v7 = @"incident_id";
  -[OSAReport incidentID](self, "incidentID");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)[v4 mutableCopy];

  if (self->_aleFlag) {
    [v5 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"ale_flag"];
  }
  return v5;
}

- (BOOL)saveWithOptions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___OSAJetsamReport;
  BOOL v4 = -[OSAReport saveWithOptions:](&v6, sel_saveWithOptions_, a3);
  -[OSAJetsamReport instrumentEvents:](self, "instrumentEvents:", v4);
  return v4;
}

+ (jetsam_snapshot)fetchSnapshotWithFlags:(unsigned int)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v5 = memorystatus_control();
  if ((v5 & 0x80000000) != 0)
  {
    v8 = (void *)NSString;
    id v9 = __error();
    objc_msgSend( v8,  "stringWithFormat:",  @"memorystatus_control(MEMORYSTATUS_CMD_GET_JETSAM_SNAPSHOT) failed: %s",  strerror(*v9),  v20);
    goto LABEL_13;
  }

  uint64_t v6 = v5;
  if (!(_DWORD)v5)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"kernel returned (0) from memorystatus_control(MEMORYSTATUS_CMD_GET_JETSAM_SNAPSHOT) -- no jetsam data available",  v19,  v20);
    goto LABEL_13;
  }

  uint64_t v7 = v5;
  if (v5 >= 0xC9 && __ROR8__(0xAF8AF8AF8AF8AF8BLL * (v5 - 200LL), 3) >= 0xEA0EA0EA0EA0EBuLL)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"memorystatus_control gave snapshot size (%lu) not multiple of jetsam entry type (%lu)",  v5 - 200,  280);
LABEL_13:
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }

  id v10 = (jetsam_snapshot *)malloc(v5);
  if (v10)
  {
    uint64_t v11 = memorystatus_control();
    if ((_DWORD)v11 != (_DWORD)v6)
    {
      uint64_t v16 = v11;
      v17 = (void *)NSString;
      v18 = __error();
      objc_msgSend( v17,  "stringWithFormat:",  @"memorystatus_control returned unexpected value - %d: %s",  v16,  strerror(*v18));
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      free(v10);
LABEL_14:
      id v10 = 0LL;
      if (!v14) {
        goto LABEL_19;
      }
      goto LABEL_15;
    }

    unint64_t v12 = ((unint64_t)v6 - 200) / 0x118;
    unint64_t var4 = v10->var4;
    if (v12 >= var4)
    {
      id v14 = 0LL;
      goto LABEL_19;
    }

    objc_msgSend( NSString,  "stringWithFormat:",  @"Got fewer jetsam entries from the kernel; received %zu, expected %zu",
      (v7 - 200) / 0x118uLL,
      var4);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v10->unint64_t var4 = v12;
    if (!v14) {
      goto LABEL_19;
    }
  }

  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unable to allocate %d bytes for jetsam snapshot", v6);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14) {
      goto LABEL_19;
    }
  }

- (unint64_t)getEventPriority:(id)a3 terminationReason:(unint64_t)a4 priority:(int64_t)a5
{
  if ([&unk_189E31D30 containsObject:a3])
  {
    self->_aleFlag = 1;
    return 3LL;
  }

  else if (a4 <= 9 && ((1LL << a4) & 0x284) != 0)
  {
    return 0LL;
  }

  else if (a5 <= 89)
  {
    return 1LL;
  }

  else
  {
    return 2LL;
  }

- (void)updateLogLimitFor:(unint64_t)a3
{
  char v5 = 0;
  uint64_t v6 = &unk_189E307B8;
  uint64_t v7 = @"298_LOW_PRIORITY";
  switch(a3)
  {
    case 0uLL:
      goto LABEL_5;
    case 1uLL:
      uint64_t v6 = &unk_189E307D0;
      goto LABEL_6;
    case 2uLL:
      char v5 = 0;
      uint64_t v6 = &unk_189E307D0;
      uint64_t v7 = @"298_HIGH_PRIORITY";
      goto LABEL_5;
    case 3uLL:
      uint64_t v6 = 0LL;
      char v5 = 1;
      uint64_t v7 = @"298_ALE";
LABEL_5:
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._logWritingOptions,  "setObject:forKeyedSubscript:",  v7,  @"LogType");
      if ((v5 & 1) == 0) {
LABEL_6:
      }
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._logWritingOptions,  "setObject:forKeyedSubscript:",  v6,  @"set-log-limit");
      break;
    default:
      return;
  }

+ (int)instrumentEventsWithAudioAssertionState:(id)a3 visibliltyEndowmentState:(id)a4
{
  return 0;
}

- (void)instrumentEvents:(BOOL)a3
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  snapshot = self->_snapshot;
  if (snapshot)
  {
    if (snapshot->var4)
    {
      BOOL v4 = self;
      uint64_t v5 = 0LL;
      unint64_t v6 = 0LL;
      uint64_t v7 = &unk_189E307E8;
      if (a3) {
        uint64_t v7 = &unk_189E307B8;
      }
      v37 = v7;
      do
      {
        v8 = (char *)snapshot + v5 * 280;
        if (snapshot->var5[v5].var8)
        {
          id v9 = (unsigned int *)(v8 + 200);
          uint64_t v10 = processName();
          uint64_t v11 = killDescription(*((void *)v8 + 35));
          unint64_t v12 = 0LL;
          unint64_t v47 = v6;
          if (!mach_timebase_info(&info) && info.denom) {
            unint64_t v12 = (unint64_t)((double)((snapshot->var5[v5].var23 - snapshot->var5[v5].var22)
          }
                                            * info.numer
                                            / info.denom
                                            / 0xF4240)
                                   / 1000.0);
          audioAssertionState = v4->_audioAssertionState;
          objc_msgSend(MEMORY[0x189607968], "numberWithInt:", *v9, v37);
          id v14 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v15 = -[NSSet containsObject:](audioAssertionState, "containsObject:", v14);

          visibilityEndowmentState = v4->_visibilityEndowmentState;
          [MEMORY[0x189607968] numberWithInt:*v9];
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = -[NSSet containsObject:](visibilityEndowmentState, "containsObject:", v17);

          uint64_t v19 = (char *)snapshot + v5 * 280;
          uuid_unparse_lower(snapshot->var5[v5].var6, out);
          v51[0] = @"name";
          v51[1] = @"reason";
          v52[0] = v10;
          v52[1] = v11;
          v51[2] = @"priority";
          [MEMORY[0x189607968] numberWithInt:snapshot->var5[v5].var2];
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v52[2] = v46;
          v51[3] = @"uptime";
          [MEMORY[0x189607968] numberWithUnsignedLongLong:v12];
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v52[3] = v45;
          v51[4] = @"audio";
          [MEMORY[0x189607968] numberWithBool:v15];
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v52[4] = v44;
          v51[5] = @"visible";
          [MEMORY[0x189607968] numberWithBool:v18];
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v52[5] = v43;
          v51[6] = @"uuid";
          [NSString stringWithUTF8String:out];
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v52[6] = v42;
          v51[7] = @"max_pages";
          [MEMORY[0x189607968] numberWithUnsignedLongLong:snapshot->var5[v5].var10];
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v52[7] = v41;
          v51[8] = @"suspended";
          [MEMORY[0x189607968] numberWithBool:snapshot->var5[v5].var3 & 1];
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v52[8] = v40;
          v51[9] = @"frozen";
          [MEMORY[0x189607968] numberWithBool:(snapshot->var5[v5].var3 >> 1) & 1];
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v52[9] = v39;
          v51[10] = @"thawed";
          [MEMORY[0x189607968] numberWithBool:(snapshot->var5[v5].var3 >> 2) & 1];
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          v52[10] = v20;
          v51[11] = @"tracked";
          [MEMORY[0x189607968] numberWithBool:(snapshot->var5[v5].var3 >> 3) & 1];
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v52[11] = v21;
          v51[12] = @"can_idle_exit";
          [MEMORY[0x189607968] numberWithBool:(snapshot->var5[v5].var3 >> 4) & 1];
          id v22 = (void *)objc_claimAutoreleasedReturnValue();
          v52[12] = v22;
          v51[13] = @"dirty";
          [MEMORY[0x189607968] numberWithBool:(*((_DWORD *)v19 + 61) >> 5) & 1];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          v52[13] = v23;
          v51[14] = @"assertion";
          [MEMORY[0x189607968] numberWithBool:(*((_DWORD *)v19 + 61) >> 6) & 1];
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v51[15] = @"logwritten";
          v52[14] = v24;
          v52[15] = v37;
          [MEMORY[0x189603F68] dictionaryWithObjects:v52 forKeys:v51 count:16];
          v25 = (__CFString *)v11;
          v26 = (__CFString *)v10;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          AnalyticsSendEvent();

          v28 = v26;
          v29 = v25;

          if (OSARTCIsProcessOfInterest(v28))
          {
            v49[0] = @"crk";
            v30 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
            [v30 crashReporterKey];
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v50[0] = v31;
            v49[1] = @"dirty";
            uint64_t v32 = [MEMORY[0x189607968] numberWithBool:(*((_DWORD *)v19 + 61) >> 5) & 1];
            v33 = (void *)v32;
            if (v28) {
              v34 = v28;
            }
            else {
              v34 = @"<unknown>";
            }
            v50[1] = v32;
            v50[2] = v34;
            v49[2] = @"name";
            v49[3] = @"reason";
            if (v29) {
              v35 = v29;
            }
            else {
              v35 = @"<unknown>";
            }
            v50[3] = v35;
            [MEMORY[0x189603F68] dictionaryWithObjects:v50 forKeys:v49 count:4];
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            rtcsc_send(2004LL, 2004LL, v36);
          }

          BOOL v4 = self;
          snapshot = self->_snapshot;
          unint64_t v6 = v47;
        }

        ++v6;
        ++v5;
      }

      while (snapshot->var4 > v6);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    -[OSAJetsamReport instrumentEvents:].cold.1();
  }

- (void)fetchWiredMemoryInfo
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  [a1 unsignedIntValue];
  OUTLINED_FUNCTION_0_2();
  int v7 = a2;
  __int16 v8 = v5;
  int v9 = a3;
  _os_log_error_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "memorystatus_control for command %d returned unexpected valud of %d which does not match buffer size of %d",  v6,  0x14u);
  OUTLINED_FUNCTION_2();
}

- (void)acquireJetsamDataWithFlags:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v39 = *MEMORY[0x1895F89C0];
  self->super._capture_time = CFAbsoluteTimeGetCurrent();
  id v32 = 0LL;
  __int16 v5 = +[OSAJetsamReport fetchSnapshotWithFlags:error:]( &OBJC_CLASS___OSAJetsamReport,  "fetchSnapshotWithFlags:error:",  v3,  &v32);
  id v6 = v32;
  self->_snapshot = v5;
  if (v6) {
    -[NSMutableArray addObject:](self->super._notes, "addObject:", v6);
  }
  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 appleInternal])
  {
    -[OSAJetsamReport problemType](self, "problemType");
    __int16 v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = [v8 isEqualToString:@"298"];

    if (v9) {
      -[OSAJetsamReport fetchWiredMemoryInfo](self, "fetchWiredMemoryInfo");
    }
  }

  else
  {
  }

  snapshot = self->_snapshot;
  if (snapshot)
  {
    id v30 = v6;
    self->_wiredBytes = *MEMORY[0x1895FD590] * snapshot->var3.var5;
    self->_isSuspendedOnlyJetsam = 1;
    if (snapshot->var4)
    {
      unint64_t v11 = 0LL;
      unint64_t v12 = 0LL;
      v13 = 0LL;
      unint64_t v31 = 0LL;
      uint64_t v14 = 288LL;
      do
      {
        uint64_t v15 = (char *)snapshot + v14;
        uint64_t v16 = *(void *)((char *)snapshot + v14 - 8);
        BOOL v17 = v16 == 2 || v16 == 7;
        if (v17
          || (v16 ? (BOOL v24 = (*((_DWORD *)v15 - 11) & 1) == 0) : (BOOL v24 = 0),
              v24
           && ((*((_DWORD *)v15 - 11) & 0x30) == 0x10
             ? (BOOL v25 = (*(void *)((char *)snapshot + v14 - 16) & 0x12B1FLL) == 0)
             : (BOOL v25 = 0),
               !v25)))
        {
          self->_isSuspendedOnlyJetsam = 0;
        }

        if ((*((_BYTE *)snapshot + v14 - 44) & 1) == 0
          && (!v13 || *(unint64_t *)((char *)&snapshot->var0 + v14) > *((void *)v13 + 11)))
        {
          v13 = v15 - 88;
        }

        if (v16)
        {
          uint64_t v18 = v13;
          ++self->_killed_or_suspended_count;
          processName();
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((*((_BYTE *)snapshot + v14 - 44) & 1) == 0) {
            -[NSMutableArray addObject:](self->_killedActiveApps, "addObject:", v19);
          }
          unint64_t v20 = -[OSAJetsamReport getEventPriority:terminationReason:priority:]( self,  "getEventPriority:terminationReason:priority:",  v19,  *((void *)v15 - 1),  *(int *)((char *)snapshot + v14 - 48));
          unint64_t v21 = v31;
          if (v31 <= v20) {
            unint64_t v21 = v20;
          }
          unint64_t v31 = v21;
          killDescription(*((void *)v15 - 1));
          id v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            int v23 = *((_DWORD *)v15 - 22);
            *(_DWORD *)buf = 138543874;
            v34 = v19;
            __int16 v35 = 1024;
            int v36 = v23;
            __int16 v37 = 2114;
            v38 = v22;
            _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Process %{public}@ [%d] killed by jetsam reason %{public}@",  buf,  0x1Cu);
          }

          snapshot = self->_snapshot;
          v13 = v18;
        }

        ++v11;
        v14 += 280LL;
      }

      while (snapshot->var4 > v11);
    }

    else
    {
      unint64_t v31 = 0LL;
      v13 = 0LL;
      unint64_t v12 = 0LL;
    }
    v26 = -[OSAJetsamReport problemType](self, "problemType");
    char v27 = [v26 isEqualToString:@"298"];

    if ((v27 & 1) != 0) {
      -[OSAJetsamReport updateLogLimitFor:](self, "updateLogLimitFor:", v31);
    }
    if (v12)
    {
      processName();
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v28 = @"none";
    }

    id v6 = v30;
    objc_storeStrong((id *)&self->_largestProcess, v28);
    if (v12) {

    }
    if (v13)
    {
      processName();
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v29 = @"none";
    }

    objc_storeStrong((id *)&self->_largestActiveApp, v29);
    if (v13) {
  }
    }
}

- (void)acquireJetsamData
{
}

- (BOOL)alreadyDumpedSuspendedJetsamLogToday
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKey:@"lastSuspendedLogDumpedDaySince1970"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    uint64_t v4 = [v3 integerValue];
    BOOL v5 = v4 == +[OSAJetsamReport _daysSince1970](&OBJC_CLASS___OSAJetsamReport, "_daysSince1970");
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_setDumpedSuspendedJetsamLog
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v2,  "setInteger:forKey:",  +[OSAJetsamReport _daysSince1970](OSAJetsamReport, "_daysSince1970"),  @"lastSuspendedLogDumpedDaySince1970");
}

- (BOOL)isActionable
{
  if (self->_snapshot)
  {
    if (self->_killed_or_suspended_count)
    {
      if (!self->_isSuspendedOnlyJetsam
        || -[OSAReport isAppleTV](self, "isAppleTV")
        || !-[OSAJetsamReport alreadyDumpedSuspendedJetsamLogToday](self, "alreadyDumpedSuspendedJetsamLogToday"))
      {
        return 1;
      }

      notes = self->super._notes;
      uint64_t v4 = (void *)NSString;
      BOOL v5 = @"suspended-only jetsam log already dumped today";
    }

    else
    {
      notes = self->super._notes;
      uint64_t v4 = (void *)NSString;
      BOOL v5 = @"No processes were jettisoned (either killed or suspended)";
    }

    [v4 stringWithFormat:v5];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](notes, "addObject:", v7);
  }

  return 0;
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  v146[7] = *MEMORY[0x1895F89C0];
  BOOL v5 = (void (**)(id, void *))a4;
  v145[0] = @"incident";
  v119 = -[OSAReport incidentID](self, "incidentID");
  v146[0] = v119;
  v145[1] = @"crashReporterKey";
  v116 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  [v116 crashReporterKey];
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v146[1] = v113;
  v145[2] = @"product";
  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 modelCode];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  v146[2] = v7;
  v145[3] = @"build";
  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 productNameVersionBuildString];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  v146[3] = v9;
  v145[4] = @"kernel";
  [(id)objc_opt_class() kernelVersionDescription];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v146[4] = v10;
  v145[5] = @"date";
  OSADateFormat(1u, self->super._capture_time);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v146[5] = v11;
  v145[6] = @"codeSigningMonitor";
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", objc_msgSend((id)objc_opt_class(), "codeSigningMonitor"));
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v146[6] = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:v146 forKeys:v145 count:7];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v13);

  -[OSAJetsamReport problemType](self, "problemType");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSALog commonFieldsForBody:](&OBJC_CLASS___OSALog, "commonFieldsForBody:", v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v15);

  if (-[NSString length](self->_event_reason, "length") | self->_event_code)
  {
    event_reason = (const __CFString *)self->_event_reason;
    if (!event_reason) {
      event_reason = &stru_189E21910;
    }
    v144[0] = event_reason;
    v143[0] = @"eventReason";
    v143[1] = @"eventCode";
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
    v143[2] = &unk_189E30848;
    v144[1] = v17;
    v144[2] = &unk_189E307B8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v144 forKeys:v143 count:3];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v18);
  }

  if (self->_snapshot)
  {
    mach_timebase_info(&info);
    v99 = v5;
    if (info.denom) {
      unint64_t v19 = ((self->_snapshot->var1 - self->_snapshot->var0) * info.numer / info.denom + 500000) / 0xF4240;
    }
    else {
      unint64_t v19 = 0xFFFFFFFFLL;
    }
    v141[0] = @"timeDelta";
    [MEMORY[0x189607968] numberWithInt:v19];
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v142[0] = v120;
    v141[1] = @"memoryStatus";
    v139[0] = @"memoryPages";
    v137[0] = @"free";
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_snapshot->var3.var0];
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v138[0] = v117;
    v137[1] = @"active";
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_snapshot->var3.var1];
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v138[1] = v114;
    v137[2] = @"inactive";
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_snapshot->var3.var2];
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v138[2] = v111;
    v137[3] = @"purgeable";
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_snapshot->var3.var4];
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v138[3] = v109;
    v137[4] = @"wired";
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_snapshot->var3.var5];
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v138[4] = v107;
    v137[5] = @"speculative";
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_snapshot->var3.var6];
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v138[5] = v105;
    v137[6] = @"throttled";
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_snapshot->var3.var3];
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v138[6] = v102;
    v137[7] = @"fileBacked";
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_snapshot->var3.var7];
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v138[7] = v100;
    v137[8] = @"anonymous";
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_snapshot->var3.var8];
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v138[8] = v98;
    [MEMORY[0x189603F68] dictionaryWithObjects:v138 forKeys:v137 count:9];
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v140[0] = v97;
    v139[1] = @"compressions";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_snapshot->var3.var10];
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v140[1] = v96;
    v139[2] = @"decompressions";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_snapshot->var3.var11];
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v140[2] = v95;
    v139[3] = @"compressorSize";
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_snapshot->var3.var9];
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v140[3] = v20;
    v139[4] = @"uncompressed";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_snapshot->var3.var12];
    unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    v140[4] = v21;
    v139[5] = @"zoneMapSize";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_snapshot->var3.var13];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    v140[5] = v22;
    v139[6] = @"zoneMapCap";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_snapshot->var3.var14];
    int v23 = (void *)objc_claimAutoreleasedReturnValue();
    v140[6] = v23;
    v139[7] = @"largestZone";
    [NSString stringWithUTF8String:self->_snapshot->var3.var16];
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
    v140[7] = v24;
    v139[8] = @"largestZoneSize";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_snapshot->var3.var15];
    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue();
    v140[8] = v25;
    v139[9] = @"pageSize";
    [MEMORY[0x189607968] numberWithUnsignedLong:*MEMORY[0x1895FD568]];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v140[9] = v26;
    [MEMORY[0x189603F68] dictionaryWithObjects:v140 forKeys:v139 count:10];
    char v27 = (void *)objc_claimAutoreleasedReturnValue();
    v142[1] = v27;
    v141[2] = @"genCounter";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_snapshot->var2];
    v104 = self;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    largestProcess = v104->_largestProcess;
    v142[2] = v28;
    v142[3] = largestProcess;
    v141[3] = @"largestProcess";
    v141[4] = &unk_189E30848;
    v142[4] = &unk_189E307B8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v142 forKeys:v141 count:5];
    id v30 = (void *)objc_claimAutoreleasedReturnValue();
    v99[2](v99, v30);

    self = v104;
    [MEMORY[0x189603FA8] array];
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
    unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    int v101 = [v31 appleInternal];

    snapshot = v104->_snapshot;
    if (snapshot->var4)
    {
      uint64_t v33 = 0LL;
      uint64_t v34 = 472LL;
      do
      {
        uint64_t v121 = v33;
        __int16 v35 = (char *)snapshot + v34;
        uuid_unparse_lower((const unsigned __int8 *)snapshot + v34 - 216, out);
        [MEMORY[0x189603FA8] array];
        int v36 = (void *)objc_claimAutoreleasedReturnValue();
        __int16 v37 = v36;
        if ((*((_BYTE *)snapshot + v34 - 228) & 1) != 0) {
          [v36 addObject:@"suspended"];
        }
        uint64_t v38 = *((void *)v35 - 25);
        if ((v38 & 1) != 0)
        {
          [v37 addObject:@"audio"];
          uint64_t v38 = *((void *)v35 - 25);
          if ((v38 & 4) == 0)
          {
LABEL_15:
            if ((v38 & 2) != 0) {
              goto LABEL_65;
            }
            goto LABEL_16;
          }
        }

        else if ((v38 & 4) == 0)
        {
          goto LABEL_15;
        }

        [v37 addObject:@"accessory"];
        uint64_t v38 = *((void *)v35 - 25);
        if ((v38 & 2) != 0)
        {
LABEL_65:
          [v37 addObject:@"location"];
          if ((*((void *)v35 - 25) & 0x10) == 0) {
            goto LABEL_18;
          }
LABEL_17:
          [v37 addObject:@"bluetooth"];
          goto LABEL_18;
        }

+ (int64_t)_daysSince1970
{
  int64_t result = time(0LL);
  if (result >= 0) {
    return result / 0x15180uLL;
  }
  return result;
}

- (void).cxx_destruct
{
}

  ;
}

- (void)instrumentEvents:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Not sending Core Analytics events because snapshot is missing.",  v0,  2u);
}

@end