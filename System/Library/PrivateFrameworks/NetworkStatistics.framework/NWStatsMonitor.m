@interface NWStatsMonitor
- (BOOL)currentForegroundStateForProcessWithPid:(int)a3;
- (BOOL)debugMode;
- (NWStatsMonitor)initWithQueue:(id)a3;
- (id)allIdentifiersForUUID:(id)a3 EUUID:(id)a4 pid:(int)a5 epid:(int)a6 procname:(char *)a7;
- (id)bestIdentifierForUUID:(id)a3 EUUID:(id)a4 pid:(int)a5 epid:(int)a6 procname:(char *)a7 derivation:(int *)a8;
- (id)extensionNameForUUID:(id)a3;
- (id)identifierForUUID:(id)a3 derivation:(int *)a4;
- (id)processNameForUUID:(id)a3;
- (id)processNameForUUIDString:(id)a3;
- (id)stateDictionary;
- (void)configure:(id)a3;
- (void)noteFailedLookupFor:(id)a3 processName:(char *)a4 pid:(int)a5;
@end

@implementation NWStatsMonitor

- (BOOL)currentForegroundStateForProcessWithPid:(int)a3
{
  appStateHandler = self->_appStateHandler;
  if (appStateHandler) {
    LOBYTE(appStateHandler) = -[NWAppStateHandler currentForegroundStateForProcessWithPid:]( appStateHandler,  "currentForegroundStateForProcessWithPid:",  *(void *)&a3);
  }
  return (char)appStateHandler;
}

- (id)processNameForUUID:(id)a3
{
  return 0LL;
}

- (id)processNameForUUIDString:(id)a3
{
  return 0LL;
}

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  id v6 = a3;
  if (!self->_useStaticMapping
    || (-[NWStatsEntityMapperStaticAssignment identifierForUUID:derivation:]( self->_staticAssignmentUUIDMapper,  "identifierForUUID:derivation:",  v6,  a4),  (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
  {
    if (!self->_useLaunchServices
      || (-[NWStatsEntityMapperDynamicLaunchServices identifierForUUID:derivation:]( self->_dynamicLaunchServicesUUIDMapper,  "identifierForUUID:derivation:",  v6,  a4),  (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
    {
      if (!self->_useNEHelper
        || (-[NWStatsEntityMapperNEHelper identifierForUUID:derivation:]( self->_neHelperUUIDMapper,  "identifierForUUID:derivation:",  v6,  a4),  (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
      {
        if (!self->_useCoalitionIDs
          || (-[NWStatsEntityMapperCoalitionWatcher identifierForUUID:derivation:]( self->_coalitionUUIDMapper,  "identifierForUUID:derivation:",  v6,  a4),  (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
        {
          if (self->_useProcessNames)
          {
            v7 = -[NWStatsEntityMapperProcessWatcher identifierForUUID:derivation:]( self->_processWatcherUUIDMapper,  "identifierForUUID:derivation:",  v6,  a4);
          }

          else
          {
            v7 = 0LL;
          }
        }
      }
    }
  }

  return v7;
}

- (void)noteFailedLookupFor:(id)a3 processName:(char *)a4 pid:(int)a5
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  if (v8)
  {
    if (a4)
    {
      uint64_t v9 = [NSString stringWithUTF8String:a4];
    }

    else
    {
      if (a5) {
        pid_to_process_name(a5);
      }
      else {
      uint64_t v9 = -[NWStatsEntityMapperProcessWatcher identifierForUUID:derivation:]( self->_processWatcherUUIDMapper,  "identifierForUUID:derivation:",  v8,  0LL);
      }
    }

    v10 = (void *)v9;
    if (!v9
      || (-[NSSet member:](self->_knownDaemonSet, "member:", v9),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          !v11))
    {
      v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_reportedLookupFailures, "objectForKeyedSubscript:", v8);
      if (v12)
      {
        v13 = v12;
        [v12 timeIntervalSinceNow];
        if (v14 >= -900.0)
        {
LABEL_17:

          goto LABEL_18;
        }
      }

      [MEMORY[0x189603F50] date];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_reportedLookupFailures,  "setObject:forKeyedSubscript:",  v15,  v8);
      v16 = -[NWStatsEntityMapperCoalitionWatcher identifierForUUID:derivation:]( self->_coalitionUUIDMapper,  "identifierForUUID:derivation:",  v8,  0LL);
      v17 = -[NWStatsEntityMapperNEHelper identifierForUUID:derivation:]( self->_neHelperUUIDMapper,  "identifierForUUID:derivation:",  v8,  0LL);
      NStatGetLog();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138544130;
        id v20 = v8;
        __int16 v21 = 2114;
        v22 = v10;
        __int16 v23 = 2114;
        v24 = v16;
        __int16 v25 = 2114;
        v26 = v17;
        _os_log_impl( &dword_187FF5000,  v18,  OS_LOG_TYPE_DEFAULT,  "Can't lookup UUID %{public}@ for procname %{public}@, coalition %{public}@ nehelper %{public}@",  (uint8_t *)&v19,  0x2Au);
      }

      v13 = 0LL;
      goto LABEL_17;
    }
  }

  else
  {
    v10 = 0LL;
  }

- (id)allIdentifiersForUUID:(id)a3 EUUID:(id)a4 pid:(int)a5 epid:(int)a6 procname:(char *)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  v39[10] = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  uint64_t v33 = -[NWStatsEntityMapperDynamicLaunchServices identifierForUUID:derivation:]( self->_dynamicLaunchServicesUUIDMapper,  "identifierForUUID:derivation:",  v12,  0LL);
  -[NWStatsEntityMapperCoalitionWatcher identifierForUUID:derivation:]( self->_coalitionUUIDMapper,  "identifierForUUID:derivation:",  v12,  0LL);
  double v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[NWStatsEntityMapperProcessWatcher identifierForUUID:derivation:]( self->_processWatcherUUIDMapper,  "identifierForUUID:derivation:",  v12,  0LL);
  v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = -[NWStatsEntityMapperNEHelper identifierForUUID:derivation:]( self->_neHelperUUIDMapper,  "identifierForUUID:derivation:",  v12,  0LL);
  uint64_t v31 = -[NWStatsEntityMapperStaticAssignment identifierForUUID:derivation:]( self->_staticAssignmentUUIDMapper,  "identifierForUUID:derivation:",  v12,  0LL);
  if (v15)
  {
    if (v14) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }

  uint64_t v16 = [NSString stringWithUTF8String:a7];
  if (v16) {
    v15 = (const __CFString *)v16;
  }
  else {
    v15 = @"malformed-proc-name";
  }
  -[NWStatsEntityMapperProcessWatcher noteUUID:forProcessName:]( self->_processWatcherUUIDMapper,  "noteUUID:forProcessName:",  v12,  v15);
  if (!v14)
  {
LABEL_8:
    if (-[NWStatsEntityMapperCoalitionWatcher noteUUID:forPid:]( self->_coalitionUUIDMapper,  "noteUUID:forPid:",  v12,  v9))
    {
      -[NWStatsEntityMapperCoalitionWatcher identifierForUUID:derivation:]( self->_coalitionUUIDMapper,  "identifierForUUID:derivation:",  v12,  0LL);
      double v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      double v14 = 0LL;
    }
  }

- (id)extensionNameForUUID:(id)a3
{
  if (self->_useLaunchServices)
  {
    v3 = -[NWStatsEntityMapperDynamicLaunchServices extensionNameForUUID:]( self->_dynamicLaunchServicesUUIDMapper,  "extensionNameForUUID:",  a3);
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

- (id)bestIdentifierForUUID:(id)a3 EUUID:(id)a4 pid:(int)a5 epid:(int)a6 procname:(char *)a7 derivation:(int *)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = a4;
  uint64_t v30 = 0LL;
  -[NWStatsMonitor identifierForUUID:derivation:](self, "identifierForUUID:derivation:", v14, (char *)&v30 + 4);
  uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v16) {
    goto LABEL_16;
  }
  if (self->_useCoalitionIDs)
  {
    if (-[NWStatsEntityMapperCoalitionWatcher noteUUID:forPid:]( self->_coalitionUUIDMapper,  "noteUUID:forPid:",  v14,  v11))
    {
      -[NWStatsEntityMapperCoalitionWatcher identifierForUUID:derivation:]( self->_coalitionUUIDMapper,  "identifierForUUID:derivation:",  v14,  (char *)&v30 + 4);
      uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v16) {
        goto LABEL_16;
      }
    }
  }

  -[NWStatsMonitor noteFailedLookupFor:processName:pid:](self, "noteFailedLookupFor:processName:pid:", v14, a7, v11);
  if (self->_useProcessNames)
  {
    uint64_t v16 = 0LL;
    if (!a7) {
      goto LABEL_15;
    }
  }

  else
  {
    -[NWStatsEntityMapperProcessWatcher identifierForUUID:derivation:]( self->_processWatcherUUIDMapper,  "identifierForUUID:derivation:",  v14,  (char *)&v30 + 4);
    uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!a7) {
      goto LABEL_15;
    }
  }

  if (!v16)
  {
    [NSString stringWithUTF8String:a7];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17 && [v17 length])
    {
      -[NWStatsEntityMapperProcessWatcher noteUUID:forProcessName:]( self->_processWatcherUUIDMapper,  "noteUUID:forProcessName:",  v14,  v18);
      -[NWStatsEntityMapperProcessWatcher identifierForUUID:derivation:]( self->_processWatcherUUIDMapper,  "identifierForUUID:derivation:",  v14,  (char *)&v30 + 4);
      uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v16 = 0LL;
    }
  }

- (void)configure:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingUseNEHelper"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5) {
    self->_useNEHelper = 1;
  }
  [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingUseNEHelperForSet"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingUseNEHelperForSet"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingUseNEHelperForSet"];
      uint64_t v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
      useNEHelperSet = self->_useNEHelperSet;
      self->_useNEHelperSet = v9;
    }

    else
    {
      NStatGetLog();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_187FF5000,  v11,  OS_LOG_TYPE_ERROR,  "Configuration Parameters for UseNEHelperForSet not a set",  buf,  2u);
      }
    }
  }

  [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingUseProcessPrefixForSet"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingUseProcessPrefixForSet"];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();

    if ((v14 & 1) != 0)
    {
      [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingUseProcessPrefixForSet"];
      id v15 = (NSSet *)objc_claimAutoreleasedReturnValue();
      appendProcNameSet = (os_log_s *)self->_appendProcNameSet;
      self->_appendProcNameSet = v15;
    }

    else
    {
      NStatGetLog();
      appendProcNameSet = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(appendProcNameSet, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v40 = 0;
        _os_log_impl( &dword_187FF5000,  appendProcNameSet,  OS_LOG_TYPE_ERROR,  "Configuration Parameters for UseProcessPrefixForSet not a set",  v40,  2u);
      }
    }
  }

  [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingUseCoalitions"];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingUseCoalitions"];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    char v19 = [v18 BOOLValue];
    self->_useCoalitionIDs = v19;
    self->_useProcessNames = v19 ^ 1;
  }

  [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingCheckStaticAssignments"];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingCheckStaticAssignments"];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    self->_useStaticMapping = [v21 BOOLValue];
  }

  [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingAvoidCoalitions"];
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingAvoidCoalitions"];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    char v24 = [v23 BOOLValue];
    self->_useCoalitionIDs = v24 ^ 1;
    self->_useProcessNames = v24;
  }

  [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingAvoidLaunchServices"];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingAvoidLaunchServices"];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    self->_useLaunchServices = [v26 BOOLValue] ^ 1;
  }

  [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingDebugMode"];
  NSUInteger v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingDebugMode"];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    self->_debugMode = [v28 BOOLValue];
  }

  [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingCanonicalizeProcessNames"];
  int v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingCanonicalizeProcessNames"];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatsEntityMapperProcessWatcher setCanonicalizedNames:]( self->_processWatcherUUIDMapper,  "setCanonicalizedNames:",  [v30 BOOLValue]);
  }

  [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingAppStateMonitoring"];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsParameterMappingAppStateMonitoring"];
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v32 BOOLValue])
    {
      if (!self->_appEventListener)
      {
        uint64_t v33 = -[NWStatsAppEventListener initWithQueue:]( objc_alloc(&OBJC_CLASS___NWStatsAppEventListener),  "initWithQueue:",  self->_queue);
        appEventListener = self->_appEventListener;
        self->_appEventListener = v33;
      }

      if (self->_appStateHandler) {
        goto LABEL_37;
      }
      v35 = objc_alloc_init(&OBJC_CLASS___NWAppStateHandler);
      appStateHandler = self->_appStateHandler;
      self->_appStateHandler = v35;

      v37 = self->_appStateHandler;
      if (!v37) {
        goto LABEL_37;
      }
      v38 = self->_appEventListener;
      if (!v38) {
        goto LABEL_37;
      }
    }

    else
    {
      v39 = self->_appStateHandler;
      self->_appStateHandler = 0LL;

      v38 = self->_appEventListener;
      v37 = 0LL;
    }

    -[NWStatsAppEventListener setAppStateDelegate:](v38, "setAppStateDelegate:", v37);
LABEL_37:
  }
}

- (id)stateDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[NWStatsEntityMapperDynamicLaunchServices stateDictionary](self->_dynamicLaunchServicesUUIDMapper, "stateDictionary");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    [v3 setObject:v4 forKeyedSubscript:@"DynLSMapper"];
  }

  else
  {
    [MEMORY[0x189603F68] dictionary];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v5 forKeyedSubscript:@"DynLSMapper"];
  }

  -[NWStatsEntityMapperProcessWatcher stateDictionary](self->_processWatcherUUIDMapper, "stateDictionary");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    [v3 setObject:v6 forKeyedSubscript:@"ProcMapper"];
  }

  else
  {
    [MEMORY[0x189603F68] dictionary];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v7 forKeyedSubscript:@"ProcMapper"];
  }

  return v3;
}

- (NWStatsMonitor)initWithQueue:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___NWStatsMonitor;
  id v6 = -[NWStatsMonitor init](&v28, sel_init);
  if (!v6) {
    goto LABEL_7;
  }
  v7 = objc_alloc_init(&OBJC_CLASS___NWStatsEntityMapperStaticAssignment);
  staticAssignmentUUIDMapper = v6->_staticAssignmentUUIDMapper;
  v6->_staticAssignmentUUIDMapper = v7;

  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NWStatsEntityMapperNEHelper);
  neHelperUUIDMapper = v6->_neHelperUUIDMapper;
  v6->_neHelperUUIDMapper = v9;

  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NWStatsEntityMapperDynamicLaunchServices);
  dynamicLaunchServicesUUIDMapper = v6->_dynamicLaunchServicesUUIDMapper;
  v6->_dynamicLaunchServicesUUIDMapper = v11;

  id v13 = objc_alloc_init(&OBJC_CLASS___NWStatsEntityMapperProcessWatcher);
  processWatcherUUIDMapper = v6->_processWatcherUUIDMapper;
  v6->_processWatcherUUIDMapper = v13;

  if (v6->_staticAssignmentUUIDMapper
    && v6->_neHelperUUIDMapper
    && v6->_dynamicLaunchServicesUUIDMapper
    && v6->_processWatcherUUIDMapper)
  {
    *(_WORD *)&v6->_useCoalitionIDs = 256;
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v15 = [objc_alloc(MEMORY[0x189604010]) initWithArray:&unk_18A1C6190];
    knownDaemonSet = v6->_knownDaemonSet;
    v6->_knownDaemonSet = (NSSet *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    reportedLookupFailures = v6->_reportedLookupFailures;
    v6->_reportedLookupFailures = v17;

    char v19 = objc_alloc_init(&OBJC_CLASS___NWStatsEntityMapperCoalitionWatcher);
    coalitionUUIDMapper = v6->_coalitionUUIDMapper;
    v6->_coalitionUUIDMapper = v19;

    v6->_useStaticMapping = 1;
    *(_WORD *)&v6->_useNEHelper = 256;
    uint64_t v21 = objc_msgSend(MEMORY[0x189604010], "setWithObjects:", @"nsurlsessiond", 0);
    useNEHelperSet = v6->_useNEHelperSet;
    v6->_useNEHelperSet = (NSSet *)v21;

    appendProcNameSet = v6->_appendProcNameSet;
    v6->_appendProcNameSet = 0LL;

    v6->_debugMode = 0;
LABEL_7:
    char v24 = v6;
    goto LABEL_11;
  }

  NStatGetLog();
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_187FF5000, v25, OS_LOG_TYPE_ERROR, "Cannot initialize all UUID mappers", buf, 2u);
  }

  char v24 = 0LL;
LABEL_11:

  return v24;
}

- (BOOL)debugMode
{
  return self->_debugMode;
}

- (void).cxx_destruct
{
}

@end