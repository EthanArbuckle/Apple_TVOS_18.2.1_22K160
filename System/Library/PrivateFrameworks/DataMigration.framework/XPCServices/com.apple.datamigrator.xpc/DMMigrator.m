@interface DMMigrator
+ (id)_dispositionDictFromContext:(id)a3 buildVersion:(id)a4 lastBuildVersion:(id)a5;
+ (id)_userDataDispositionDictionaryWithBuildVersion:(id)a3 lastBuildVersion:(id)a4;
+ (id)mainQueue;
- (BOOL)_canDisplayStatus_progressLocked;
- (BOOL)_performMigrationWithPreliminaryTasks:(id)a3 pluginsProvider:(id)a4 pluginCategories:(unsigned int)a5 userCategory:(unsigned int)a6 buildVersion:(id)a7 lastBuildVersion:(id)a8;
- (BOOL)isMigrationNeeded:(int)a3;
- (DMMigrator)init;
- (NSArray)preliminaryTasksCacheForUnitTesting;
- (NSDictionary)migrationPluginResults;
- (NSString)migrationPhaseDescription;
- (PUIProgressWindow)progressWindow;
- (__MKBAssertion)_unlockKeyBagUseOfForceIsAuthorized;
- (double)_artificialHangTimeIntervalForPlugin:(id)a3;
- (id)_createProgressWindow;
- (id)_pluginAllowedList;
- (id)_userDataDispositionDictionary;
- (id)orderedPluginIdentifiers;
- (id)previousBuildVersion;
- (unsigned)_pluginCategoriesWithEnvironment:(id)a3 lastBuildVersion:(id)a4;
- (unsigned)_userCategoryWithEnvironment:(id)a3;
- (unsigned)userDataDisposition;
- (void)_logReasonWithContext:(id)a3;
- (void)_migrateWithTestMigrationInfrastructureOnly:(BOOL)a3 buildVersion:(id)a4 lastBuildVersion:(id)a5;
- (void)_waitForExecutePluginsSignal_engineerCurrentlyDebuggingMigrationPlugins;
- (void)currentProgressInfo:(id)a3;
- (void)forceMigrationOnNextRebootWithUserDataDisposition:(unsigned int)a3;
- (void)migrateCheckingNecessity:(BOOL)a3 lastRelevantPlugin:(id)a4 testMigrationInfrastructureOnly:(BOOL)a5 connection:(id)a6 migrationResultHandler:(id)a7;
- (void)progressHostIsReady;
- (void)reportMigrationFailure;
- (void)setPreliminaryTasksCacheForUnitTesting:(id)a3;
- (void)setProgressWindow:(id)a3;
- (void)testMigrationUIWithProgress:(BOOL)a3 forceInvert:(BOOL)a4 completion:(id)a5;
@end

@implementation DMMigrator

- (DMMigrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DMMigrator;
  v2 = -[DMMigrator init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSLock);
    progressLock = v2->_progressLock;
    v2->_progressLock = v3;

    v2->_lastStatusButtonPressTime = 0LL;
  }

  return v2;
}

- (NSString)migrationPhaseDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 migrationPhaseDescription]);

  return (NSString *)v3;
}

- (NSDictionary)migrationPluginResults
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pluginResults]);

  return (NSDictionary *)v3;
}

- (unsigned)_userCategoryWithEnvironment:(id)a3
{
  else {
    return 1;
  }
}

- (unsigned)_pluginCategoriesWithEnvironment:(id)a3 lastBuildVersion:(id)a4
{
  id v5 = a3;
  else {
    int v7 = 2;
  }
  unsigned int v8 = v7 | v6;

  return v8;
}

- (id)_pluginAllowedList
{
  return objc_alloc_init(&OBJC_CLASS___DMPluginAllowedList);
}

- (void)currentProgressInfo:(id)a3
{
  v4 = (void (**)(id, void *, float))a3;
  -[NSLock lock](self->_progressLock, "lock");
  if (!self->_firstWorkItemStartTimestamp) {
    goto LABEL_23;
  }
  +[DMTimeManager intervalSinceTimestamp:](&OBJC_CLASS___DMTimeManager, "intervalSinceTimestamp:");
  double v6 = v5;
  float estimatedTotalDuration = self->_estimatedTotalDuration;
  if (v5 <= estimatedTotalDuration)
  {
    double v10 = 0.04 / estimatedTotalDuration + self->_progressFraction;
  }

  else
  {
    double v8 = (float)(estimatedTotalDuration * 3.0);
    if (v6 <= v8)
    {
      double v10 = 0.04 / (float)(estimatedTotalDuration + estimatedTotalDuration) + self->_progressFraction;
    }

    else
    {
      float progressFractionPriorToAsymptoticDecay = self->_progressFractionPriorToAsymptoticDecay;
      if (progressFractionPriorToAsymptoticDecay == 0.0)
      {
        float progressFractionPriorToAsymptoticDecay = self->_progressFraction;
        self->_float progressFractionPriorToAsymptoticDecay = progressFractionPriorToAsymptoticDecay;
      }

      double v10 = progressFractionPriorToAsymptoticDecay
          + (1.0 - progressFractionPriorToAsymptoticDecay) * tanh((v6 - v8) / 3600.0 * 2.5);
    }
  }

  float v11 = v10;
  self->_float progressFraction = v11;
  if (-[DMMigrator _canDisplayStatus_progressLocked](self, "_canDisplayStatus_progressLocked"))
  {
    if (!self->_statusTimeFormatter)
    {
      v12 = objc_alloc_init(&OBJC_CLASS___NSDateComponentsFormatter);
      statusTimeFormatter = self->_statusTimeFormatter;
      self->_statusTimeFormatter = v12;

      -[NSDateComponentsFormatter setUnitsStyle:](self->_statusTimeFormatter, "setUnitsStyle:", 1LL);
      -[NSDateComponentsFormatter setAllowedUnits:](self->_statusTimeFormatter, "setAllowedUnits:", 224LL);
    }

    v30 = v4;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 buildVersion]);
    v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSDateComponentsFormatter stringFromTimeInterval:]( self->_statusTimeFormatter,  "stringFromTimeInterval:",  v6));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Internal Only %@\nTotal Migration Time: %@",  v15,  v16));

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    v31 = self;
    v18 = self->_currentProgressWorkItems;
    id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v32,  v36,  16LL);
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 name]);
          v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n%@",  v17,  v24));

          +[DMTimeManager intervalSinceTimestamp:]( DMTimeManager,  "intervalSinceTimestamp:",  [v23 startTimestamp]);
          if (v26 <= 1.0)
          {
            v17 = v25;
          }

          else
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue( -[NSDateComponentsFormatter stringFromTimeInterval:]( v31->_statusTimeFormatter,  "stringFromTimeInterval:"));
            v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@",  v25,  v27));
          }
        }

        id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v32,  v36,  16LL);
      }

      while (v20);
    }

    v4 = v30;
    self = v31;
  }

  else
  {
LABEL_23:
    v17 = 0LL;
  }

  float progressFraction = self->_progressFraction;
  double v29 = progressFraction;
  if (progressFraction > 0.99)
  {
    self->_float progressFraction = 0.99;
    float progressFraction = 0.99;
  }

  -[NSLock unlock](self->_progressLock, "unlock", v29);
  v4[2](v4, v17, progressFraction);
}

- (BOOL)_canDisplayStatus_progressLocked
{
  int has_internal_content = os_variant_has_internal_content("com.apple.migration", a2);
  if (has_internal_content)
  {
    if (self->_lastStatusButtonPressTime)
    {
      +[DMTimeManager intervalSinceTimestamp:](&OBJC_CLASS___DMTimeManager, "intervalSinceTimestamp:");
      LOBYTE(has_internal_content) = v4 <= 30.0;
    }

    else
    {
      LOBYTE(has_internal_content) = 0;
    }
  }

  return has_internal_content;
}

- (void)_logReasonWithContext:(id)a3
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue([a3 objectForKey:@"Reason"]);
  if (!v4)
  {
    double v5 = (void *)_CFCopySystemVersionDictionary();
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:_kCFSystemVersionBuildVersionKey]);
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Migrating for unknown reason with %@",  v6));

    uint64_t v4 = (uint64_t)v7;
  }

  id v8 = (id)v4;
  _DMLogFunc(v3, 6LL);
}

- (void)_waitForExecutePluginsSignal_engineerCurrentlyDebuggingMigrationPlugins
{
  if (qword_10002CC48 != -1) {
    dispatch_once(&qword_10002CC48, &stru_100020B20);
  }
  _DMLogFunc(v2, 6LL);
  id v3 = _executePluginsSemaphore();
  uint64_t v4 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

- (BOOL)_performMigrationWithPreliminaryTasks:(id)a3 pluginsProvider:(id)a4 pluginCategories:(unsigned int)a5 userCategory:(unsigned int)a6 buildVersion:(id)a7 lastBuildVersion:(id)a8
{
  id v11 = a3;
  id v101 = a4;
  id v99 = a7;
  id v100 = a8;
  uint64_t v152 = 0LL;
  v153 = &v152;
  uint64_t v154 = 0x2020000000LL;
  char v155 = 1;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v101 allPlugins]);
  [v12 willRunPlugins:v13];

  v111 = (void *)objc_claimAutoreleasedReturnValue( +[DMMigrator _userDataDispositionDictionaryWithBuildVersion:lastBuildVersion:]( &OBJC_CLASS___DMMigrator,  "_userDataDispositionDictionaryWithBuildVersion:lastBuildVersion:",  v99,  v100));
  -[DMMigrator _logReasonWithContext:](self, "_logReasonWithContext:");
  v98 = (void *)objc_claimAutoreleasedReturnValue( +[DMPluginParameters backupDeviceUUIDFromDispositionSupersetOfContext:]( &OBJC_CLASS___DMPluginParameters,  "backupDeviceUUIDFromDispositionSupersetOfContext:",  v111));
  id v106 = [[DMPluginParameters alloc] initWithDispositionSupersetOfContext:v111 backupDeviceUUID:v98];
  _DMLogFunc(v114, 6LL);
  __int128 v150 = 0u;
  __int128 v151 = 0u;
  __int128 v148 = 0u;
  __int128 v149 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v101 allPluginsInRunOrder]);
  id v15 = [v14 countByEnumeratingWithState:&v148 objects:v161 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v149;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v149 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(void **)(*((void *)&v148 + 1) + 8LL * (void)i);
        if (objc_msgSend(v18, "existsAndShouldRun", v88))
        {
          v88 = v18;
          _DMLogFunc(v114, 6LL);
        }
      }

      id v15 = [v14 countByEnumeratingWithState:&v148 objects:v161 count:16];
    }

    while (v15);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  unsigned int v20 = [v19 waitForExecutePluginsSignalMarkerPref];

  if (v20) {
    -[DMMigrator _waitForExecutePluginsSignal_engineerCurrentlyDebuggingMigrationPlugins]( self,  "_waitForExecutePluginsSignal_engineerCurrentlyDebuggingMigrationPlugins");
  }
  __int128 v146 = 0u;
  __int128 v147 = 0u;
  __int128 v144 = 0u;
  __int128 v145 = 0u;
  id v21 = v11;
  id v22 = [v21 countByEnumeratingWithState:&v144 objects:v160 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v145;
    do
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v145 != v23) {
          objc_enumerationMutation(v21);
        }
        v25 = *(void **)(*((void *)&v144 + 1) + 8LL * (void)j);
        double v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "name", v88));
        [v25 estimatedDurationTimeInterval];
        v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        _DMLogFunc(v114, 6LL);

        objc_msgSend(v25, "estimatedDurationTimeInterval", v26, v90);
        *(float *)&double v27 = v27 + *(float *)&dword_10002CC50;
        dword_10002CC50 = LODWORD(v27);
      }

      id v22 = [v21 countByEnumeratingWithState:&v144 objects:v160 count:16];
    }

    while (v22);
  }

  __int128 v142 = 0u;
  __int128 v143 = 0u;
  __int128 v140 = 0u;
  __int128 v141 = 0u;
  v28 = (void *)objc_claimAutoreleasedReturnValue([v101 allPluginsInRunOrder]);
  id v29 = [v28 countByEnumeratingWithState:&v140 objects:v159 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v141;
    do
    {
      for (k = 0LL; k != v29; k = (char *)k + 1)
      {
        if (*(void *)v141 != v30) {
          objc_enumerationMutation(v28);
        }
        __int128 v32 = *(void **)(*((void *)&v140 + 1) + 8LL * (void)k);
        if (objc_msgSend(v32, "existsAndShouldRun", v88))
        {
          [v32 timeEstimate];
          double v91 = v33;
          _DMLogFunc(v114, 6LL);
          objc_msgSend(v32, "timeEstimate", v32, *(void *)&v91);
          *(float *)&dword_10002CC50 = v34 + *(float *)&dword_10002CC50;
        }
      }

      id v29 = [v28 countByEnumeratingWithState:&v140 objects:v159 count:16];
    }

    while (v29);
  }

  uint64_t v35 = getpid();
  proc_set_cpumon_params(v35, 100LL, (int)(*(float *)&dword_10002CC50 * 1.5));
  double v89 = *(float *)&dword_10002CC50;
  _DMLogFunc(v114, 6LL);
  -[NSLock lock](self->_progressLock, "lock", *(void *)&v89);
  float v36 = *(float *)&dword_10002CC50;
  LODWORD(self->_estimatedTotalRemainingDuration) = dword_10002CC50;
  self->_float estimatedTotalDuration = v36;
  self->_firstWorkItemStartTimestamp = 0LL;
  v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  currentProgressWorkItems = self->_currentProgressWorkItems;
  self->_currentProgressWorkItems = v37;

  *(void *)&self->_float progressFraction = 0LL;
  -[NSLock unlock](self->_progressLock, "unlock");
  v39 = objc_alloc_init(&OBJC_CLASS___DMWrapperProcessWatchdogCoordinator);
  v40 = (void *)objc_claimAutoreleasedReturnValue([v101 concurrentPlugins]);
  id v113 = [v40 mutableCopy];

  dispatch_queue_attr_t v41 = dispatch_queue_attr_make_with_qos_class(&_dispatch_queue_attr_concurrent, QOS_CLASS_USER_INITIATED, 0);
  v42 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v41);
  queue = dispatch_queue_create("com.apple.datamigrator.concurrentPluginQueue", v42);

  uint64_t v136 = 0LL;
  v137 = &v136;
  uint64_t v138 = 0x2020000000LL;
  char v139 = 0;
  __int128 v132 = 0u;
  __int128 v133 = 0u;
  __int128 v134 = 0u;
  __int128 v135 = 0u;
  id obj = v21;
  id v43 = [obj countByEnumeratingWithState:&v132 objects:v158 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v133;
    do
    {
      for (m = 0LL; m != v43; m = (char *)m + 1)
      {
        if (*(void *)v133 != v44) {
          objc_enumerationMutation(obj);
        }
        v46 = *(void **)(*((void *)&v132 + 1) + 8LL * (void)m);
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
        v48 = (void *)objc_claimAutoreleasedReturnValue([v46 name]);
        [v47 setMigrationPhaseDescription:v48];

        -[NSLock lock](self->_progressLock, "lock");
        v49 = objc_alloc(&OBJC_CLASS___DMProgressWorkItem);
        v50 = (void *)objc_claimAutoreleasedReturnValue([v46 name]);
        v51 = -[DMProgressWorkItem initWithName:startTimestamp:]( v49,  "initWithName:startTimestamp:",  v50,  +[DMTimeManager currentTimestamp](&OBJC_CLASS___DMTimeManager, "currentTimestamp"));

        -[NSMutableArray addObject:](self->_currentProgressWorkItems, "addObject:", v51);
        if (!*((_BYTE *)v137 + 24)) {
          self->_firstWorkItemStartTimestamp = -[DMProgressWorkItem startTimestamp](v51, "startTimestamp");
        }
        -[NSLock unlock](self->_progressLock, "unlock");
        unint64_t v52 = +[DMTimeManager currentTimestamp](&OBJC_CLASS___DMTimeManager, "currentTimestamp");
        v53 = (void *)objc_claimAutoreleasedReturnValue([v46 name]);
        [v46 estimatedDurationTimeInterval];
        v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        _DMLogFunc(v114, 5LL);

        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "workBlock", v53, v92));
        if (v54)
        {
          v55 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v46 workBlock]);
          ((void (**)(void, void *))v55)[2](v55, v111);
        }

        +[DMTimeManager intervalSinceTimestamp:](&OBJC_CLASS___DMTimeManager, "intervalSinceTimestamp:", v52);
        double v57 = v56;
        v58 = (void *)objc_claimAutoreleasedReturnValue([v46 name]);
        v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v57));
        _DMLogFunc(v114, 5LL);

        -[NSLock lock](self->_progressLock, "lock", v58, v93);
        [v46 estimatedDurationTimeInterval];
        *(float *)&double v59 = self->_estimatedTotalRemainingDuration - v59;
        self->_estimatedTotalRemainingDuration = *(float *)&v59;
        -[NSMutableArray removeObject:](self->_currentProgressWorkItems, "removeObject:", v51);
        *((_BYTE *)v137 + 24) = 1;
        -[NSLock unlock](self->_progressLock, "unlock");
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
        v61 = (void *)objc_claimAutoreleasedReturnValue([v46 telemetryIdentifier]);
        [v60 reportTelemetryForPluginIdentifier:v61 duration:0 incident:1 countOfAttempts:v111 userDataDisposition:a6 userCategory:v57];
      }

      id v43 = [obj countByEnumeratingWithState:&v132 objects:v158 count:16];
    }

    while (v43);
  }

  v125[0] = _NSConcreteStackBlock;
  v125[1] = 3221225472LL;
  v125[2] = sub_10000E7BC;
  v125[3] = &unk_100020B48;
  v125[4] = self;
  v129 = &v136;
  id v97 = v111;
  id v126 = v97;
  id v94 = v106;
  id v127 = v94;
  v95 = v39;
  v128 = v95;
  v130 = &v152;
  unsigned int v131 = a6;
  v112 = objc_retainBlock(v125);
  __int128 v123 = 0u;
  __int128 v124 = 0u;
  __int128 v121 = 0u;
  __int128 v122 = 0u;
  id v102 = (id)objc_claimAutoreleasedReturnValue([v101 serialPluginsInRunOrder]);
  id v104 = [v102 countByEnumeratingWithState:&v121 objects:v157 count:16];
  if (v104)
  {
    uint64_t v103 = *(void *)v122;
    do
    {
      for (n = 0LL; n != v104; n = (char *)n + 1)
      {
        if (*(void *)v122 != v103) {
          objc_enumerationMutation(v102);
        }
        v62 = *(void **)(*((void *)&v121 + 1) + 8LL * (void)n);
        ((void (*)(void *, void *))v112[2])(v112, v62);
        __int128 v119 = 0u;
        __int128 v120 = 0u;
        __int128 v117 = 0u;
        __int128 v118 = 0u;
        id v63 = [v113 copy];
        id v64 = [v63 countByEnumeratingWithState:&v117 objects:v156 count:16];
        if (v64)
        {
          uint64_t v65 = *(void *)v118;
          do
          {
            for (ii = 0LL; ii != v64; ii = (char *)ii + 1)
            {
              if (*(void *)v118 != v65) {
                objc_enumerationMutation(v63);
              }
              v67 = *(void **)(*((void *)&v117 + 1) + 8LL * (void)ii);
              v68 = (void *)objc_claimAutoreleasedReturnValue([v67 identifierOfDependency]);
              v69 = (void *)objc_claimAutoreleasedReturnValue([v62 identifier]);
              unsigned int v70 = [v68 isEqualToString:v69];

              if (v70)
              {
                _DMLogFunc(v114, 5LL);
                objc_msgSend(v113, "removeObject:", v67, v67);
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472LL;
                block[2] = sub_10000ECD8;
                block[3] = &unk_100020818;
                v71 = v112;
                block[4] = v67;
                id v116 = v71;
                dispatch_async(queue, block);
              }
            }

            id v64 = [v63 countByEnumeratingWithState:&v117 objects:v156 count:16];
          }

          while (v64);
        }
      }

      id v104 = [v102 countByEnumeratingWithState:&v121 objects:v157 count:16];
    }

    while (v104);
  }

  _DMLogFunc(v114, 5LL);
  dispatch_barrier_sync(queue, &stru_100020B68);
  uint64_t v72 = getpid();
  proc_set_cpumon_defaults(v72);
  unint64_t v73 = +[DMTimeManager currentTimestamp](&OBJC_CLASS___DMTimeManager, "currentTimestamp");
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
  +[DMTimeManager intervalSinceTimestamp:]( &OBJC_CLASS___DMTimeManager,  "intervalSinceTimestamp:",  self->_firstWorkItemStartTimestamp);
  double v76 = v75;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  id v78 = [v77 inAppleStore];
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  id v80 = [v79 isFromFactory];
  +[DMTimeManager intervalFromStart:toEnd:]( &OBJC_CLASS___DMTimeManager,  "intervalFromStart:toEnd:",  0LL,  self->_migrationStartTimestamp);
  double v82 = v81;
  +[DMTimeManager intervalFromStart:toEnd:]( &OBJC_CLASS___DMTimeManager,  "intervalFromStart:toEnd:",  0LL,  self->_firstWorkItemStartTimestamp);
  double v84 = v83;
  +[DMTimeManager intervalFromStart:toEnd:](&OBJC_CLASS___DMTimeManager, "intervalFromStart:toEnd:", 0LL, v73);
  [v74 reportTelemetryWithMigrationDuration:v97 userDataDisposition:a5 pluginCategories:a6 userCategory:v78 inAppleStore:v80 isFromFactory:v76 st artInterval:v82 firstPluginStartInterval:v84 endInterval:v85];

  v86 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
  [v86 persistIfNecessary];

  LOBYTE(v74) = *((_BYTE *)v153 + 24) != 0;
  _Block_object_dispose(&v136, 8);

  _Block_object_dispose(&v152, 8);
  return (char)v74;
}

- (double)_artificialHangTimeIntervalForPlugin:(id)a3
{
  id v3 = a3;
  double v5 = 0.0;
  if (os_variant_has_internal_content("com.apple.migration", v4))
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
    if ([v6 shouldImposePluginArtificialHang])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
      unsigned int v8 = [v7 isEqualToString:@"com.apple.MobileInstallation.SystemAppMigrator"];

      if (v8)
      {
        [v3 setTimeIntervalBeforeWatchdog:0.0];
        [v3 setTimeIntervalBeforeReboot:60.0];
        [v3 timeIntervalBeforeReboot];
        double v5 = v9 + 60.0;
      }
    }

    else
    {
    }
  }

  return v5;
}

- (__MKBAssertion)_unlockKeyBagUseOfForceIsAuthorized
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
  unsigned int v4 = [v3 needsPreBoard];

  if (v4)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
    [v5 setMigrationPhaseDescription:@"Waiting for user unlock"];

    _DMLogFunc(v2, 7LL);
    id v6 = [[BKSAlternateSystemApp alloc] initWithBundleId:@"com.apple.PreBoard"];
    id v7 = objc_alloc_init(&OBJC_CLASS___MigratorAlternateAppDelegate);
    [v6 setDelegate:v7];
    [v6 activate];
    -[MigratorAlternateAppDelegate waitUntilPreboardDidFinishUnlock](v7, "waitUntilPreboardDidFinishUnlock");
    uint64_t v8 = _DMLogFunc(v2, 6LL);
    double v10 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", MKBKeyBagKeyStashLoad(v8, v9));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v10);
    _DMLogFunc(v2, 6LL);

    objc_msgSend(v6, "terminate", v12);
    [v6 setDelegate:0];
    _DMLogFunc(v2, 7LL);
  }

  return 0LL;
}

- (BOOL)isMigrationNeeded:(int)a3
{
  uint64_t v4 = *(void *)&a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  unsigned int v6 = [v5 isDeviceUsingEphemeralStorage];

  if (v6)
  {
    _DMLogFunc(v3, 6LL);
    return 0;
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 buildVersion]);

    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lastBuildVersionPref]);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
    unsigned __int8 v13 = [v12 isMigrationNeededWithBuildVersion:v9 lastBuildVersion:v11 clientPID:v4];

    return v13;
  }

+ (id)_dispositionDictFromContext:(id)a3 buildVersion:(id)a4 lastBuildVersion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = v9;
  uint64_t v11 = 0LL;
  if (v8 && v9) {
    uint64_t v11 = +[DMEnvironment isBuildVersion:equalToBuildVersion:]( &OBJC_CLASS___DMEnvironment,  "isBuildVersion:equalToBuildVersion:",  v8,  v9) ^ 1;
  }
  if (!v7 || (_DWORD)v11) {
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  else {
    v12 = (NSMutableDictionary *)[v7 mutableCopy];
  }
  unsigned __int8 v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
  -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v14, @"SyntheticDidUpgrade");

  -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v8, @"buildVersion");
  if (v10) {
    -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v10, @"previousBuildVersion");
  }
  id v15 = -[NSMutableDictionary copy](v13, "copy");

  return v15;
}

+ (id)_userDataDispositionDictionaryWithBuildVersion:(id)a3 lastBuildVersion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_10002CC60 != -1) {
    dispatch_once(&qword_10002CC60, &stru_100020B88);
  }
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_10000F28C;
  id v19 = sub_10000F29C;
  id v20 = 0LL;
  if (v5)
  {
    id v7 = (dispatch_queue_s *)qword_10002CC58;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000F2A4;
    block[3] = &unk_100020BB0;
    v14 = &v15;
    id v12 = v5;
    id v13 = v6;
    dispatch_sync(v7, block);

    id v8 = (void *)v16[5];
  }

  else
  {
    id v8 = 0LL;
  }

  id v9 = v8;
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)_userDataDispositionDictionary
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 buildVersion]);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastBuildVersionPref]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[DMMigrator _userDataDispositionDictionaryWithBuildVersion:lastBuildVersion:]( &OBJC_CLASS___DMMigrator,  "_userDataDispositionDictionaryWithBuildVersion:lastBuildVersion:",  v3,  v5));
  return v6;
}

- (unsigned)userDataDisposition
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrator _userDataDispositionDictionary](self, "_userDataDispositionDictionary"));
  unsigned int v3 = +[DMUserDataDispositionManager dispositionFlagsFromDispositionDict:]( &OBJC_CLASS___DMUserDataDispositionManager,  "dispositionFlagsFromDispositionDict:",  v2);

  return v3;
}

- (id)previousBuildVersion
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrator _userDataDispositionDictionary](self, "_userDataDispositionDictionary"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"previousBuildVersion"]);

  return v3;
}

- (void)reportMigrationFailure
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 continuousIntegrationMarkerPref]);

  if (v5)
  {
    _DMLogFunc(v2, 6LL);
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
    [v4 setNeedsMigrationFailureReport];
  }
}

+ (id)mainQueue
{
  uint64_t v2 = &_dispatch_main_q;
  return &_dispatch_main_q;
}

- (void)migrateCheckingNecessity:(BOOL)a3 lastRelevantPlugin:(id)a4 testMigrationInfrastructureOnly:(BOOL)a5 connection:(id)a6 migrationResultHandler:(id)a7
{
  BOOL v11 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = (void (**)(id, uint64_t))a7;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  unsigned int v17 = [v16 isDeviceUsingEphemeralStorage];

  if (v17)
  {
    _DMLogFunc(v7, 6LL);
    v15[2](v15, 2LL);
  }

  else
  {
    v18 = objc_alloc_init(&OBJC_CLASS___DMClientInvocation);
    -[DMClientInvocation setConnection:](v18, "setConnection:", v14);
    -[DMClientInvocation setCheckNecessity:](v18, "setCheckNecessity:", v11);
    -[DMClientInvocation setEarlyResultsPluginIdentifier:](v18, "setEarlyResultsPluginIdentifier:", v13);
    -[DMClientInvocation setResultsHandler:](v18, "setResultsHandler:", v15);

    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 buildVersion]);

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10000F7AC;
    v23[3] = &unk_100020BD8;
    BOOL v25 = a5;
    v23[4] = self;
    id v24 = v20;
    id v22 = v20;
    [v21 startMigrationAndOrBlockIfNecessaryWithClientInvocation:v18 buildVersion:v22 migrationStarterBlock:v23];

    uint64_t v15 = (void (**)(id, uint64_t))v18;
  }
}

- (void)_migrateWithTestMigrationInfrastructureOnly:(BOOL)a3 buildVersion:(id)a4 lastBuildVersion:(id)a5
{
  BOOL v54 = a3;
  id v57 = a4;
  id v59 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  unsigned int v51 = -[DMMigrator _userCategoryWithEnvironment:](self, "_userCategoryWithEnvironment:", v8);

  self->_migrationStartTimestamp = +[DMTimeManager currentTimestamp](&OBJC_CLASS___DMTimeManager, "currentTimestamp");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
  [v9 willStartMigration];

  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
  [v10 setMigrationPhaseDescription:@"Preparing to migrate"];

  _DMLogFunc(v5, 6LL);
  cf = -[DMMigrator _unlockKeyBagUseOfForceIsAuthorized](self, "_unlockKeyBagUseOfForceIsAuthorized");
  id v11 = objc_alloc_init(&OBJC_CLASS___DMMigrationDeferredExitManager);
  [v11 migrationDidStart];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[DMRebootAnalyticsUploader createRebootAnalyticsUploaderIfAppropriateWithEnvironment:]( &OBJC_CLASS___DMRebootAnalyticsUploader,  "createRebootAnalyticsUploaderIfAppropriateWithEnvironment:",  v12));

  [v58 start];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
  [v13 setMigrationPhaseDescription:@"Gathering plugins"];

  v53 = (void *)objc_claimAutoreleasedReturnValue(+[DMPluginFileSystemRep allReps](&OBJC_CLASS___DMPluginFileSystemRep, "allReps"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  uint64_t v15 = -[DMMigrator _pluginCategoriesWithEnvironment:lastBuildVersion:]( self,  "_pluginCategoriesWithEnvironment:lastBuildVersion:",  v14,  v59);

  uint64_t v16 = objc_alloc(&OBJC_CLASS___DMPluginsProvider);
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrator _pluginAllowedList](self, "_pluginAllowedList"));
  unint64_t v52 = -[DMPluginsProvider initWithReps:categories:pluginAllowedList:]( v16,  "initWithReps:categories:pluginAllowedList:",  v53,  v15,  v17);

  id v18 = [v53 count];
  if (v18)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
    [v19 blockUntilProgressHostIsReadyWithTimeoutTimeInterval:60.0];

    uint64_t v63 = 0LL;
    id v64 = &v63;
    uint64_t v65 = 0x3032000000LL;
    v66 = sub_10000F28C;
    v67 = sub_10000F29C;
    id v68 = 0LL;
    _DMLogFunc(v5, 6LL);
    id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[DMMigrator mainQueue](&OBJC_CLASS___DMMigrator, "mainQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100010028;
    block[3] = &unk_100020C00;
    void block[4] = self;
    void block[5] = &v63;
    dispatch_sync(v20, block);

    if (v64[5])
    {
      double v56 = (void *)objc_claimAutoreleasedReturnValue( +[DMIncident incidentWithKind:responsiblePluginRep:userDataDisposition:details:]( &OBJC_CLASS___DMIncident,  "incidentWithKind:responsiblePluginRep:userDataDisposition:details:",  5LL,  0LL,  0LL));
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[DMDiagnostics sharedInstance](&OBJC_CLASS___DMDiagnostics, "sharedInstance"));
      [v21 captureDiagnosticsForIncident:v56 async:1];

      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
      [v22 progressWindowHadIncident:v56];
    }

    else
    {
      double v56 = 0LL;
    }

    _Block_object_dispose(&v63, 8);
  }

  else
  {
    _DMLogFunc(v5, 6LL);
    double v56 = 0LL;
  }

  uint64_t v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[DMMigrator mainQueue](&OBJC_CLASS___DMMigrator, "mainQueue"));
  id v24 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v23);

  dispatch_source_set_timer(v24, 0LL, 0x5F5E100uLL, 0x5F5E100uLL);
  uint64_t v63 = 0LL;
  id v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  LODWORD(v66) = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100010114;
  handler[3] = &unk_100020C00;
  handler[4] = self;
  handler[5] = &v63;
  dispatch_source_set_event_handler(v24, handler);
  -[NSLock lock](self->_progressLock, "lock");
  self->_firstWorkItemStartTimestamp = 0LL;
  -[NSLock unlock](self->_progressLock, "unlock");
  dispatch_resume(v24);
  if (v54)
  {
    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
    [v25 setTestMigrationInfrastructureOnly:1];
  }

  double v26 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  double v27 = (void *)objc_claimAutoreleasedReturnValue( +[DMUserVolumeMigrationTask createTaskIfAppropriateWithEnvironment:]( &OBJC_CLASS___DMUserVolumeMigrationTask,  "createTaskIfAppropriateWithEnvironment:",  v26));

  if (v27) {
    v28 = (void *)objc_claimAutoreleasedReturnValue([&__NSArray0__struct arrayByAddingObject:v27]);
  }
  else {
    v28 = &__NSArray0__struct;
  }
  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[DMLoggingTask createTaskIfAppropriateWithEnvironment:lastBuildVersion:]( &OBJC_CLASS___DMLoggingTask,  "createTaskIfAppropriateWithEnvironment:lastBuildVersion:",  v29,  v59));

  if (v30)
  {
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v28 arrayByAddingObject:v30]);

    v28 = (void *)v31;
  }

  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  float v33 = (void *)objc_claimAutoreleasedReturnValue( +[DMLockdownModeTask createTaskIfAppropriateWithEnvironment:]( &OBJC_CLASS___DMLockdownModeTask,  "createTaskIfAppropriateWithEnvironment:",  v32));

  if (v33)
  {
    uint64_t v34 = objc_claimAutoreleasedReturnValue([v28 arrayByAddingObject:v33]);

    v28 = (void *)v34;
  }

  -[DMMigrator setPreliminaryTasksCacheForUnitTesting:](self, "setPreliminaryTasksCacheForUnitTesting:", v28);
  BOOL v35 = -[DMMigrator _performMigrationWithPreliminaryTasks:pluginsProvider:pluginCategories:userCategory:buildVersion:lastBuildVersion:]( self,  "_performMigrationWithPreliminaryTasks:pluginsProvider:pluginCategories:userCategory:buildVersion:lastBuildVersion:",  v28,  v52,  v15,  v51,  v57,  v59);
  if (v56)
  {
    _DMLogFunc(v5, 3LL);
    BOOL v36 = 0LL;
  }

  else
  {
    BOOL v36 = v35;
  }

  if (v54)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
    [v37 setTestMigrationInfrastructureOnly:0];
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  [v38 clearContext];

  [v58 waitForCompletionWithTimeoutTimeInterval:60.0];
  dispatch_source_cancel(v24);
  if (v18)
  {
    v39 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[DMMigrator mainQueue](&OBJC_CLASS___DMMigrator, "mainQueue"));
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_100010200;
    v60[3] = &unk_100020720;
    v60[4] = self;
    dispatch_sync(v39, v60);
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
  [v40 setMigrationPhaseDescription:@"Notifying clients of completion"];

  dispatch_queue_attr_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
  [v41 sendMigrationResultsToClientInvocationsWithSuccess:v36 buildVersion:v57];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"com.apple.datamigrator.migrationDidFinish",  0LL,  0LL,  0);
  id v43 = objc_alloc_init(&OBJC_CLASS___DMMigrationDeferredExitManager);
  [v43 migrationDidEnd];

  _DMLogFunc(v5, 6LL);
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrator progressWindow](self, "progressWindow"));
  [v44 setVisible:0];

  -[DMMigrator setProgressWindow:](self, "setProgressWindow:", 0LL);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
  [v45 setMigrationPhaseDescription:0];

  if (cf)
  {
    v49 = cf;
    _DMLogFunc(v5, 7LL);
    CFRelease(cf);
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance", v49));
  unsigned __int8 v47 = [v46 deviceModeIsSharediPad];

  if ((v47 & 1) == 0)
  {
    v69 = @"LockDeviceNow";
    CFBooleanRef v70 = kCFBooleanTrue;
    v48 = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  MKBLockDevice( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL)));
    v50 = (void *)objc_claimAutoreleasedReturnValue(v48);
    _DMLogFunc(v5, 6LL);
  }

  _Block_object_dispose(&v63, 8);
}

- (id)_createProgressWindow
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___PUIProgressWindow);
  LODWORD(v3) = kPUIDefaultContextLevel;
  return  -[PUIProgressWindow initWithOptions:contextLevel:appearance:]( v2,  "initWithOptions:contextLevel:appearance:",  5LL,  0LL,  v3);
}

- (void)progressHostIsReady
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
  [v2 progressHostIsReady];
}

- (id)orderedPluginIdentifiers
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMPluginFileSystemRep allReps](&OBJC_CLASS___DMPluginFileSystemRep, "allReps"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastBuildVersionPref]);
  uint64_t v7 = -[DMMigrator _pluginCategoriesWithEnvironment:lastBuildVersion:]( self,  "_pluginCategoriesWithEnvironment:lastBuildVersion:",  v4,  v6);

  id v8 = objc_alloc(&OBJC_CLASS___DMPluginsProvider);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrator _pluginAllowedList](self, "_pluginAllowedList"));
  double v10 = -[DMPluginsProvider initWithReps:categories:pluginAllowedList:]( v8,  "initWithReps:categories:pluginAllowedList:",  v3,  v7,  v9);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMPluginsProvider allPluginsInRunOrder](v10, "allPluginsInRunOrder"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 indexesOfObjectsPassingTest:&stru_100020C68]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectsAtIndexes:v12]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 valueForKey:@"description"]);
  return v14;
}

- (void)testMigrationUIWithProgress:(BOOL)a3 forceInvert:(BOOL)a4 completion:(id)a5
{
  id v8 = (void (**)(void))a5;
  _DMLogFunc(v5, 6LL);
  uint64_t v25 = 0LL;
  double v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_10000F28C;
  id v29 = sub_10000F29C;
  id v30 = 0LL;
  if (objc_opt_class(&OBJC_CLASS___PUIProgressWindow, v9))
  {
    double v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[DMMigrator mainQueue](&OBJC_CLASS___DMMigrator, "mainQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100010654;
    block[3] = &unk_100020C90;
    void block[4] = &v25;
    BOOL v23 = a3;
    BOOL v24 = a4;
    dispatch_sync(v10, block);
  }

  unint64_t v11 = +[DMTimeManager currentTimestamp](&OBJC_CLASS___DMTimeManager, "currentTimestamp");
  float v12 = 0.0;
  do
  {
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[DMMigrator mainQueue](&OBJC_CLASS___DMMigrator, "mainQueue"));
    dispatch_sync(v13, &stru_100020CB0);

    +[DMTimeManager intervalSinceTimestamp:](&OBJC_CLASS___DMTimeManager, "intervalSinceTimestamp:", v11);
    double v15 = v14;
    float v16 = v14 / 15.0;
    if (v12 != v16)
    {
      unsigned int v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[DMMigrator mainQueue](&OBJC_CLASS___DMMigrator, "mainQueue"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100010700;
      v20[3] = &unk_100020CD8;
      v20[4] = &v25;
      float v21 = v16;
      dispatch_sync(v17, v20);

      float v12 = v16;
    }
  }

  while (v15 < 15.0);
  id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[DMMigrator mainQueue](&OBJC_CLASS___DMMigrator, "mainQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100010718;
  v19[3] = &unk_100020748;
  v19[4] = &v25;
  dispatch_sync(v18, v19);

  [(id)v26[5] setVisible:0];
  v8[2](v8);
  _Block_object_dispose(&v25, 8);
}

- (void)forceMigrationOnNextRebootWithUserDataDisposition:(unsigned int)a3
{
  if ((a3 & 2) != 0)
  {
    _DMLogFunc(v3, 6LL);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
    [v5 setLastBuildVersionPref:@"1A999"];

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
    [v4 setUserDataDispositionPref:0];
  }

  else
  {
    _DMLogFunc(v3, 6LL);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
    [v4 setLastBuildVersionPref:0];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  [v6 setLastMigrationResultsPref:0];

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  [v7 blockUntilPreferencesFlush];
}

- (PUIProgressWindow)progressWindow
{
  return self->_progressWindow;
}

- (void)setProgressWindow:(id)a3
{
}

- (NSArray)preliminaryTasksCacheForUnitTesting
{
  return (NSArray *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setPreliminaryTasksCacheForUnitTesting:(id)a3
{
}

- (void).cxx_destruct
{
}

@end