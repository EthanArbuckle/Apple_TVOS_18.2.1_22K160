@interface OSAStateMonitor
+ (BOOL)processCALogEvent:(id)a3 eventPayload:(id)a4 into:(id *)a5;
+ (id)CALogStateToString:(int64_t)a3;
+ (id)dateForEvent:(id)a3;
+ (id)evaluateCALogStates:(id)a3;
+ (id)keyForEvent:(id)a3;
+ (void)checkAndReportCALogStates;
+ (void)checkCALogWrittenStatus;
+ (void)checkSubmissionStatus;
+ (void)evaluateState;
+ (void)postFailureWithReason:(id)a3;
+ (void)recordEvent:(id)a3;
+ (void)recordEvent:(id)a3 with:(id)a4;
@end

@implementation OSAStateMonitor

+ (void)evaluateState
{
  if (evaluateState_token != -1) {
    dispatch_once(&evaluateState_token, &__block_literal_global_5);
  }
  v2 = (os_log_s *)OSAStateMonitorLogDomain;
  if (os_log_type_enabled((os_log_t)OSAStateMonitorLogDomain, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1861AC000, v2, OS_LOG_TYPE_DEFAULT, "Running the state monitor.", v3, 2u);
  }

  +[OSAStateMonitor checkCALogWrittenStatus](&OBJC_CLASS___OSAStateMonitor, "checkCALogWrittenStatus");
  +[OSAStateMonitor checkSubmissionStatus](&OBJC_CLASS___OSAStateMonitor, "checkSubmissionStatus");
  +[OSAStateMonitor checkAndReportCALogStates](&OBJC_CLASS___OSAStateMonitor, "checkAndReportCALogStates");
}

void __32__OSAStateMonitor_evaluateState__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.osanalytics.monitors", "state-monitor");
  v1 = (void *)OSAStateMonitorLogDomain;
  OSAStateMonitorLogDomain = (uint64_t)v0;
}

+ (void)recordEvent:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToString:@"log-submission"] & 1) != 0
    || [v5 isEqualToString:@"ca-log-written"])
  {
    [MEMORY[0x189603F50] now];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[OSAStateMonitor keyForEvent:](&OBJC_CLASS___OSAStateMonitor, "keyForEvent:", v5);
    +[OSADefaults setObject:forKey:](&OBJC_CLASS___OSADefaults, "setObject:forKey:", v3, v4);
  }

  else
  {
    +[OSAStateMonitor recordEvent:with:](&OBJC_CLASS___OSAStateMonitor, "recordEvent:with:", v5, 0LL);
  }
}

+ (void)recordEvent:(id)a3 with:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v14 = @"eventName";
  id v15 = v5;
  v6 = (void *)MEMORY[0x189603F68];
  id v7 = a4;
  [v6 dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[v8 mutableCopy];

  [v9 addEntriesFromDictionary:v7];
  v10 = (void *)NSString;
  [MEMORY[0x189603F50] date];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 timeIntervalSince1970];
  objc_msgSend(v10, "stringWithFormat:", @"state-monitor.ca.event.%f", v12, v14, v15, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    +[OSAStateMonitor recordEvent:with:].cold.1();
  }
  +[OSADefaults setObject:forKey:](&OBJC_CLASS___OSADefaults, "setObject:forKey:", v9, v13);
}

+ (void)checkCALogWrittenStatus
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 timeIntervalSinceNow];
  double v4 = v3;

  if (v4 < -90000.0) {
    +[OSAStateMonitor postFailureWithReason:]( &OBJC_CLASS___OSAStateMonitor,  "postFailureWithReason:",  @"Missing CA log after rollover");
  }
}

+ (void)checkSubmissionStatus
{
  if (!OSAIsRSDDisplay())
  {
    v2 = +[OSAStateMonitor dateForEvent:](&OBJC_CLASS___OSAStateMonitor, "dateForEvent:", @"log-submission");
    [v2 timeIntervalSinceNow];
    double v4 = v3;

    if (v4 < -129600.0) {
      +[OSAStateMonitor postFailureWithReason:]( &OBJC_CLASS___OSAStateMonitor,  "postFailureWithReason:",  @"Log submission is overdue");
    }
  }

+ (void)postFailureWithReason:(id)a3
{
  v13[2] = *MEMORY[0x1895F89C0];
  id v3 = a3;
  double v4 = (os_log_s *)OSAStateMonitorLogDomain;
  if (os_log_type_enabled((os_log_t)OSAStateMonitorLogDomain, OS_LOG_TYPE_ERROR)) {
    +[OSAStateMonitor postFailureWithReason:].cold.1((uint64_t)v3, v4);
  }
  uint64_t v10 = MEMORY[0x1895F87A8];
  v11 = v3;
  id v5 = (__CFString *)v3;
  AnalyticsSendEventLazy();
  v12[0] = @"crk";
  v6 = +[OSASystemConfiguration sharedInstance]( &OBJC_CLASS___OSASystemConfiguration,  "sharedInstance",  v10,  3221225472LL,  __41__OSAStateMonitor_postFailureWithReason___block_invoke,  &unk_189E20F48);
  [v6 crashReporterKey];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = @"reason";
  v13[0] = v7;
  v8 = @"<unknown>";
  if (v5) {
    v8 = v5;
  }
  v13[1] = v8;
  [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  rtcsc_send(2006LL, 2006LL, v9);
}

id __41__OSAStateMonitor_postFailureWithReason___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1895F89C0];
  v1 = @"<unknown>";
  if (*(void *)(a1 + 32)) {
    v1 = *(const __CFString **)(a1 + 32);
  }
  id v3 = @"reason";
  v4[0] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)checkAndReportCALogStates
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1861AC000, a2, OS_LOG_TYPE_DEBUG, "Will discard keys: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

+ (id)keyForEvent:(id)a3
{
  return (id)[NSString stringWithFormat:@"state-monitor.%@", a3];
}

+ (BOOL)processCALogEvent:(id)a3 eventPayload:(id)a4 into:(id *)a5
{
  uint64_t v101 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (os_log_type_enabled((os_log_t)OSAStateMonitorLogDomain, OS_LOG_TYPE_DEBUG)) {
    +[OSAStateMonitor processCALogEvent:eventPayload:into:].cold.1();
  }
  [MEMORY[0x189603F50] now];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 timeIntervalSinceDate:v7];
  double v11 = v10;

  if (v11 >= 300.0)
  {
    [v8 objectForKeyedSubscript:@"eventName"];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*a5) {
      *a5 = (id)objc_opt_new();
    }
    if ([v12 isEqualToString:@"ca-2hr-heartbeat"])
    {
      [v8 objectForKeyedSubscript:@"startTimestamp"];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [*a5 objectForKeyedSubscript:v13];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        id v15 = (void *)[MEMORY[0x189604A60] mutableCopy];
        [*a5 setObject:v15 forKeyedSubscript:v13];

        [*a5 objectForKeyedSubscript:v13];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

      [v14 objectForKeyedSubscript:@"twoHrHeartbeat"];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 unsignedIntValue];

      [MEMORY[0x189607968] numberWithUnsignedInteger:v17 + 1];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 setObject:v18 forKeyedSubscript:@"twoHrHeartbeat"];

      v19 = &unk_189E30A28;
LABEL_16:
      [v14 setObject:v19 forKeyedSubscript:@"lastSuccessfulLogState"];
      [*a5 setObject:v14 forKeyedSubscript:v13];
LABEL_17:

      goto LABEL_18;
    }

    if ([v12 isEqualToString:@"ca-log-written-new"])
    {
      [v8 objectForKeyedSubscript:@"startTimestamp"];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [*a5 objectForKeyedSubscript:v13];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        v21 = (void *)[MEMORY[0x189604A60] mutableCopy];
        [*a5 setObject:v21 forKeyedSubscript:v13];

        [*a5 objectForKeyedSubscript:v13];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

      [v8 objectForKeyedSubscript:@"totalHeartbeats"];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 setObject:v22 forKeyedSubscript:@"totalHeartbeats"];

      [v8 objectForKeyedSubscript:@"endTimestamp"];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 setObject:v23 forKeyedSubscript:@"endTimestamp"];

      [v8 objectForKeyedSubscript:@"logPath"];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 setObject:v24 forKeyedSubscript:@"logPath"];

      v19 = &unk_189E30A40;
      goto LABEL_16;
    }

    v69 = v8;
    if ([v12 isEqualToString:@"submission-started"])
    {
      __int128 v92 = 0u;
      __int128 v93 = 0u;
      __int128 v90 = 0u;
      __int128 v91 = 0u;
      [*a5 allKeys];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = [v13 countByEnumeratingWithState:&v90 objects:v100 count:16];
      if (!v26) {
        goto LABEL_18;
      }
      uint64_t v27 = v26;
      v66 = v12;
      uint64_t v28 = *(void *)v91;
      do
      {
        for (uint64_t i = 0LL; i != v27; ++i)
        {
          if (*(void *)v91 != v28) {
            objc_enumerationMutation(v13);
          }
          [*a5 objectForKeyedSubscript:*(void *)(*((void *)&v90 + 1) + 8 * i)];
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          [v30 setObject:v7 forKeyedSubscript:@"lastSubmissionStartTimestamp"];
          [v30 setObject:&unk_189E30A58 forKeyedSubscript:@"lastSuccessfulLogState"];
        }

        uint64_t v27 = [v13 countByEnumeratingWithState:&v90 objects:v100 count:16];
      }

      while (v27);
      goto LABEL_29;
    }

    if ([v12 isEqualToString:@"submission-found-logs"])
    {
      [v8 objectForKeyedSubscript:@"foundLogs"];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v86 = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      __int128 v89 = 0u;
      [*a5 allKeys];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = [v14 countByEnumeratingWithState:&v86 objects:v99 count:16];
      if (!v31) {
        goto LABEL_17;
      }
      uint64_t v32 = v31;
      id v64 = v7;
      v67 = v12;
      uint64_t v33 = *(void *)v87;
      do
      {
        for (uint64_t j = 0LL; j != v32; ++j)
        {
          if (*(void *)v87 != v33) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*a5, "objectForKeyedSubscript:", *(void *)(*((void *)&v86 + 1) + 8 * j), v64);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          [v35 objectForKeyedSubscript:@"logPath"];
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
        }

        uint64_t v32 = [v14 countByEnumeratingWithState:&v86 objects:v99 count:16];
      }

      while (v32);
    }

    else if ([v12 isEqualToString:@"submission-logs-added-to-archive"])
    {
      [v8 objectForKeyedSubscript:@"foundLogs"];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      __int128 v85 = 0u;
      [*a5 allKeys];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v37 = [v14 countByEnumeratingWithState:&v82 objects:v98 count:16];
      if (!v37) {
        goto LABEL_17;
      }
      uint64_t v38 = v37;
      id v64 = v7;
      v67 = v12;
      uint64_t v39 = *(void *)v83;
      do
      {
        for (uint64_t k = 0LL; k != v38; ++k)
        {
          if (*(void *)v83 != v39) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*a5, "objectForKeyedSubscript:", *(void *)(*((void *)&v82 + 1) + 8 * k), v64);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          [v41 objectForKeyedSubscript:@"logPath"];
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
        }

        uint64_t v38 = [v14 countByEnumeratingWithState:&v82 objects:v98 count:16];
      }

      while (v38);
    }

    else
    {
      if (![v12 isEqualToString:@"submission-http-post-started"])
      {
        if ([v12 isEqualToString:@"ca-log-retired"])
        {
          __int128 v76 = 0u;
          __int128 v77 = 0u;
          __int128 v74 = 0u;
          __int128 v75 = 0u;
          [*a5 allKeys];
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v49 = [v13 countByEnumeratingWithState:&v74 objects:v96 count:16];
          if (!v49) {
            goto LABEL_18;
          }
          uint64_t v50 = v49;
          id v65 = v7;
          v66 = v12;
          uint64_t v68 = *(void *)v75;
          do
          {
            for (uint64_t m = 0LL; m != v50; ++m)
            {
              if (*(void *)v75 != v68) {
                objc_enumerationMutation(v13);
              }
              objc_msgSend(*a5, "objectForKeyedSubscript:", *(void *)(*((void *)&v74 + 1) + 8 * m), v65);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              [v52 objectForKeyedSubscript:@"logPath"];
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 objectForKeyedSubscript:@"logPath"];
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              int v55 = [v53 isEqualToString:v54];

              if (v55)
              {
                [v52 setObject:&unk_189E30AB8 forKeyedSubscript:@"lastSuccessfulLogState"];
                [v69 objectForKeyedSubscript:@"retiredReason"];
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                [v52 setObject:v56 forKeyedSubscript:@"retiredReason"];
              }

              id v8 = v69;
            }

            uint64_t v50 = [v13 countByEnumeratingWithState:&v74 objects:v96 count:16];
          }

          while (v50);
          id v7 = v65;
          goto LABEL_30;
        }

        __int128 v72 = 0u;
        __int128 v73 = 0u;
        __int128 v70 = 0u;
        __int128 v71 = 0u;
        [*a5 allKeys];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v57 = [v13 countByEnumeratingWithState:&v70 objects:v95 count:16];
        if (!v57)
        {
LABEL_18:

LABEL_19:
          goto LABEL_20;
        }

        uint64_t v58 = v57;
        v66 = v12;
        uint64_t v59 = *(void *)v71;
        do
        {
          for (uint64_t n = 0LL; n != v58; ++n)
          {
            if (*(void *)v71 != v59) {
              objc_enumerationMutation(v13);
            }
            [*a5 objectForKeyedSubscript:*(void *)(*((void *)&v70 + 1) + 8 * n)];
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            [v61 setObject:v12 forKeyedSubscript:@"lastSubmissionError"];
            [v69 objectForKeyedSubscript:@"errorDesc"];
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            if (v62)
            {
              [v69 objectForKeyedSubscript:@"errorDesc"];
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              [v61 setObject:v63 forKeyedSubscript:@"errorDesc"];
            }
          }

          uint64_t v58 = [v13 countByEnumeratingWithState:&v70 objects:v95 count:16];
        }

        while (v58);
LABEL_29:
        id v8 = v69;
LABEL_30:
        uint64_t v12 = v66;
        goto LABEL_18;
      }

      [v8 objectForKeyedSubscript:@"foundLogs"];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      __int128 v81 = 0u;
      [*a5 allKeys];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v43 = [v14 countByEnumeratingWithState:&v78 objects:v97 count:16];
      if (!v43) {
        goto LABEL_17;
      }
      uint64_t v44 = v43;
      id v64 = v7;
      v67 = v12;
      uint64_t v45 = *(void *)v79;
      do
      {
        for (iuint64_t i = 0LL; ii != v44; ++ii)
        {
          if (*(void *)v79 != v45) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*a5, "objectForKeyedSubscript:", *(void *)(*((void *)&v78 + 1) + 8 * ii), v64);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          [v47 objectForKeyedSubscript:@"logPath"];
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
        }

        uint64_t v44 = [v14 countByEnumeratingWithState:&v78 objects:v97 count:16];
      }

      while (v44);
    }

    id v7 = v64;
    uint64_t v12 = v67;
    id v8 = v69;
    goto LABEL_17;
  }

  v20 = (os_log_s *)OSAStateMonitorLogDomain;
  if (os_log_type_enabled((os_log_t)OSAStateMonitorLogDomain, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_1861AC000,  v20,  OS_LOG_TYPE_DEFAULT,  "Event within submission window. Ignoring, will pick up next run.",  buf,  2u);
  }

+ (id)evaluateCALogStates:(id)a3
{
  uint64_t v86 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v69 = (id)[MEMORY[0x189604A58] mutableCopy];
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v71 = v3;
  [v3 allKeys];
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v72 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
  if (v72)
  {
    uint64_t v70 = *(void *)v78;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v78 != v70) {
          objc_enumerationMutation(obj);
        }
        uint64_t v73 = v4;
        uint64_t v5 = *(void *)(*((void *)&v77 + 1) + 8 * v4);
        [v71 objectForKeyedSubscript:v5];
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 objectForKeyedSubscript:@"totalHeartbeats"];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        int v8 = [v7 unsignedIntValue];
        [v6 objectForKeyedSubscript:@"twoHrHeartbeat"];
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        int v10 = [v9 unsignedIntValue];

        uint64_t v74 = v5;
        if (v8 != v10)
        {
          double v11 = (os_log_s *)OSAStateMonitorLogDomain;
          if (os_log_type_enabled((os_log_t)OSAStateMonitorLogDomain, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_1861AC000,  v11,  OS_LOG_TYPE_DEFAULT,  "Identified heartbeat mismatch. Reporting to RTC now.",  buf,  2u);
          }

          [v6 objectForKeyedSubscript:@"endTimestamp"];
          uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v83[0] = @"crk";
          v13 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
          [v13 crashReporterKey];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v84[0] = v14;
          v84[1] = v5;
          v83[1] = @"CA_startTimestamp";
          v83[2] = @"CA_endTimestamp";
          id v15 = &stru_189E21910;
          if (v12) {
            id v15 = v12;
          }
          v84[2] = v15;
          v83[3] = @"expectedCAHeartbeats";
          uint64_t v16 = [v6 objectForKeyedSubscript:@"twoHrHeartbeat"];
          uint64_t v17 = (void *)v16;
          if (v16) {
            v18 = (void *)v16;
          }
          else {
            v18 = &unk_189E30AD0;
          }
          v84[3] = v18;
          v83[4] = @"actualCAHeartbeats";
          uint64_t v19 = [v6 objectForKeyedSubscript:@"totalHeartbeats"];
          v20 = (void *)v19;
          if (v19) {
            v21 = (void *)v19;
          }
          else {
            v21 = &unk_189E30AD0;
          }
          v84[4] = v21;
          [MEMORY[0x189603F68] dictionaryWithObjects:v84 forKeys:v83 count:5];
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          rtcsc_send(2008LL, 2008LL, v22);
        }

        v23 = (void *)MEMORY[0x189603F18];
        [v6 objectForKeyedSubscript:@"lastSubmissionError"];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 objectForKeyedSubscript:@"errorDesc"];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "arrayWithObjects:", v24, v25, 0);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 componentsJoinedByString:@":"];
        uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

        [v6 objectForKeyedSubscript:@"endTimestamp"];
        __int128 v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
        [v6 objectForKeyedSubscript:@"lastSuccessfulLogState"];
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v25) = [v28 isEqualToNumber:&unk_189E30A58];

        if ((_DWORD)v25)
        {
          [v6 objectForKeyedSubscript:@"logPath"];
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x1896078A8] defaultManager];
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          char v31 = [v30 fileExistsAtPath:v29];

          uint64_t v32 = @"ErrorFileNotFound";
          if ((v31 & 1) != 0
            || (objc_msgSend(MEMORY[0x1896078A8], "defaultManager", @"ErrorFileNotFound"),
                uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(),
                int v34 = [v33 isReadableFileAtPath:v29],
                v33,
                uint64_t v32 = @"ErrorFileNotReadable",
                v34))
          {
            objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", v32, v27, 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v36 = [v35 componentsJoinedByString:@":"];

            uint64_t v27 = (__CFString *)v36;
          }
        }

        [v6 objectForKeyedSubscript:@"lastSuccessfulLogState"];
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
        int v38 = [v37 isEqualToNumber:&unk_189E30A70];

        if (v38)
        {
          [v6 objectForKeyedSubscript:@"logPath"];
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x1896078A8] defaultManager];
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          char v41 = [v40 fileExistsAtPath:v39];

          v42 = @"ErrorFileNotFound";
          if ((v41 & 1) != 0
            || ([MEMORY[0x1896078A8] defaultManager],
                uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(),
                int v44 = [v43 isReadableFileAtPath:v39],
                v43,
                v42 = @"ErrorFileNotReadable",
                v44))
          {

            uint64_t v27 = (__CFString *)v42;
          }
        }

        [v6 objectForKeyedSubscript:@"lastSuccessfulLogState"];
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
        int v46 = [v45 isEqualToNumber:&unk_189E30AB8];

        if (v46)
        {
          [v6 objectForKeyedSubscript:@"retiredReason"];
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          char v48 = [v47 isEqualToString:@"submitted"];

          if ((v48 & 1) == 0)
          {
            uint64_t v49 = [v6 objectForKeyedSubscript:@"retiredReason"];

            uint64_t v27 = (__CFString *)v49;
          }
        }

        v81[0] = @"crk";
        +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
        [v50 crashReporterKey];
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v82[0] = v51;
        v82[1] = v5;
        v81[1] = @"CA_startTimestamp";
        v81[2] = @"CA_endTimestamp";
        if (v75) {
          v52 = v75;
        }
        else {
          v52 = &stru_189E21910;
        }
        v82[2] = v52;
        v81[3] = @"submissionStartTimestamp";
        uint64_t v53 = [v6 objectForKeyedSubscript:@"lastSubmissionStartTimestamp"];
        v54 = (void *)v53;
        int v55 = @"<unknown>";
        if (v53) {
          int v55 = (const __CFString *)v53;
        }
        v82[3] = v55;
        v81[4] = @"lastSuccessfulState";
        [v6 objectForKeyedSubscript:@"lastSuccessfulLogState"];
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v57 = +[OSAStateMonitor CALogStateToString:]( OSAStateMonitor,  "CALogStateToString:",  (int)[v56 intValue]);
        uint64_t v58 = (void *)v57;
        v81[5] = @"errorMessage";
        if (v27) {
          uint64_t v59 = v27;
        }
        else {
          uint64_t v59 = &stru_189E21910;
        }
        v82[4] = v57;
        v82[5] = v59;
        [MEMORY[0x189603F68] dictionaryWithObjects:v82 forKeys:v81 count:6];
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        rtcsc_send(2007LL, 2007LL, v60);
        v61 = (void *)objc_opt_new();
        [v61 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        [v61 dateFromString:v74];
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v62
          || (([MEMORY[0x189603F50] now],
               v63 = (void *)objc_claimAutoreleasedReturnValue(),
               [v63 timeIntervalSinceDate:v62],
               double v65 = v64,
               v63,
               v65 > 259200.0)
            ? (int v66 = 1)
            : (int v66 = v46),
              v66 == 1))
        {
          [v69 addObject:v74];
        }

        uint64_t v4 = v73 + 1;
      }

      while (v72 != v73 + 1);
      uint64_t v72 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
    }

    while (v72);
  }

  return v69;
}

+ (id)CALogStateToString:(int64_t)a3
{
  else {
    return off_189E20F68[a3 - 2];
  }
}

+ (id)dateForEvent:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  +[OSAStateMonitor keyForEvent:](&OBJC_CLASS___OSAStateMonitor, "keyForEvent:", v3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSADefaults objectForKey:](&OBJC_CLASS___OSADefaults, "objectForKey:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v3;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Initializing event date for %{public}@",  (uint8_t *)&v8,  0xCu);
    }

    [MEMORY[0x189603F50] now];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[OSAStateMonitor keyForEvent:](&OBJC_CLASS___OSAStateMonitor, "keyForEvent:", v3);
    +[OSADefaults setObject:forKey:](&OBJC_CLASS___OSADefaults, "setObject:forKey:", v5, v6);
  }

  return v5;
}

  ;
}

+ (void)recordEvent:with:.cold.1()
{
}

+ (void)postFailureWithReason:(uint64_t)a1 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_1861AC000,  a2,  OS_LOG_TYPE_ERROR,  "State monitor observed a failure: %{public}@",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_1();
}

+ (void)processCALogEvent:eventPayload:into:.cold.1()
{
}

@end