@interface SiriTimeoutInitiatedTelemetry
+ (id)sharedObj;
- (BOOL)fetchActivities:(id)a3 withCompletionQueue:(id)a4;
- (BOOL)handleTelemetry:(id)a3 withCompletionQueue:(id)a4;
- (SiriTimeoutInitiatedTelemetry)init;
- (id)_dictOfEventSummaryAfterLinkTestResultDate:(id)a3;
- (id)_dictOfEventSummaryBeforeDate:(id)a3;
- (id)_dictOfFaultsAfterLinkTest;
- (id)_dictOfFaultsAfterRecovery;
- (id)_dictOfLinkTestResults;
- (id)_dictOfLinkTestResultsAtDate:(id)a3;
- (id)_dictOfRecoveryHandlingAtDate:(id)a3 orDateForPeriodic:(id)a4;
- (void)_addLinkTestReasonAndResult:(id)a3 result:(id)a4 atDate:(id)a5;
- (void)_cancelTelemetryTimer;
- (void)_maintainHistory;
- (void)_notifyBrokenLinkRecovery:(id)a3 wasIgnored:(int64_t)a4 atDate:(id)a5;
- (void)_notifyFaultEventDetectedWithReason:(unint64_t)a3 atDate:(id)a4;
- (void)_notifyFaultReason:(unint64_t)a3 wasIgnored:(int64_t)a4 atDate:(id)a5;
- (void)_sendTelemetry;
- (void)_startTelemetryTimer;
- (void)_startTimerToBuildAndSendTelemetry;
- (void)addLinkTestReasonAndResult:(id)a3 result:(id)a4;
- (void)getLazyNSNumberPreference:(id)a3 exists:(id)a4;
- (void)incrementValueForKey:(id)a3 inMutableDict:(id)a4;
- (void)notifyBrokenLinkRecovery:(id)a3 wasIgnored:(int64_t)a4;
- (void)notifyFaultEventDetectedWithReason:(unint64_t)a3;
- (void)notifyFaultReason:(unint64_t)a3 wasIgnored:(int64_t)a4;
@end

@implementation SiriTimeoutInitiatedTelemetry

+ (id)sharedObj
{
  if (sharedObj_siriTimeoutTelTok != -1) {
    dispatch_once(&sharedObj_siriTimeoutTelTok, &__block_literal_global_43);
  }
  return (id)sharedObj_siriTimeoutTel;
}

void __42__SiriTimeoutInitiatedTelemetry_sharedObj__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___SiriTimeoutInitiatedTelemetry);
  v1 = (void *)sharedObj_siriTimeoutTel;
  sharedObj_siriTimeoutTel = (uint64_t)v0;
}

- (SiriTimeoutInitiatedTelemetry)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SiriTimeoutInitiatedTelemetry;
  v2 = -[SiriTimeoutInitiatedTelemetry init](&v16, sel_init);
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:50];
    v4 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_DEFAULT, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();

    dispatch_queue_t v7 = dispatch_queue_create("siritimeout.activity.telemetry", v6);
    v8 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v7;

    dispatch_group_t v9 = dispatch_group_create();
    v10 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v9;

    id v11 = objc_alloc_init(MEMORY[0x189607848]);
    v12 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v11;

    [*((id *)v2 + 3) setDateFormat:@"YYYY-MM-dd HH:mm:ss.SSS"];
    *(_OWORD *)(v2 + 120) = xmmword_187F835C0;
    if (MGGetBoolAnswer())
    {
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __37__SiriTimeoutInitiatedTelemetry_init__block_invoke;
      v14[3] = &unk_18A16C818;
      v15 = v2;
      [v15 getLazyNSNumberPreference:@"event_history_age" exists:v14];
    }
  }

  return (SiriTimeoutInitiatedTelemetry *)v2;
}

void __37__SiriTimeoutInitiatedTelemetry_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(double *)(*(void *)(a1 + 32) + 120LL);
  id v5 = v3;
  if (v4 != (double)[v3 unsignedIntValue])
  {
    NSLog( @"%s: OVERRIDING kSiriTimeoutStudyPreferenceEventHistoryAge _secondsOfEventHistoryToMaintain from %f to %u",  "-[SiriTimeoutInitiatedTelemetry init]_block_invoke",  *(void *)(*(void *)(a1 + 32) + 120),  [v5 unsignedIntValue]);
    *(double *)(*(void *)(a1 + 32) + 120) = (double)[v5 unsignedIntValue];
  }
}

- (void)notifyFaultEventDetectedWithReason:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  objc_initWeak(&location, self);
  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x3032000000LL;
  v11[3] = __Block_byref_object_copy_;
  v11[4] = __Block_byref_object_dispose_;
  [MEMORY[0x189603F50] date];
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  WiFiUsageFaultReasonStringMap(a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog( @"%s: Recording WiFiUsageFaultReason %@",  "-[SiriTimeoutInitiatedTelemetry notifyFaultEventDetectedWithReason:]",  v5);

  SiriFaultReportHandle();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    WiFiUsageFaultReasonStringMap(a3);
    dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_signpost_emit_with_name_impl( &dword_187EBF000,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "SiriTimeoutInitiatedTelemetry notifyFaultEventDetectedWithReason",  "reason:%@",  buf,  0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __68__SiriTimeoutInitiatedTelemetry_notifyFaultEventDetectedWithReason___block_invoke;
  block[3] = &unk_18A16C840;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  block[4] = v11;
  dispatch_async(queue, block);
  objc_destroyWeak(v10);
  _Block_object_dispose(v11, 8);

  objc_destroyWeak(&location);
}

void __68__SiriTimeoutInitiatedTelemetry_notifyFaultEventDetectedWithReason___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _notifyFaultEventDetectedWithReason:*(void *)(a1 + 48) atDate:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  SiriFaultReportHandle();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    WiFiUsageFaultReasonStringMap(*(void *)(a1 + 48));
    double v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v5 = 138412290;
    v6 = v4;
    _os_signpost_emit_with_name_impl( &dword_187EBF000,  v3,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "SiriTimeoutInitiatedTelemetry notifyFaultEventDetectedWithReason",  "reason:%@",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)notifyFaultReason:(unint64_t)a3 wasIgnored:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  objc_initWeak(&location, self);
  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x3032000000LL;
  v14[3] = __Block_byref_object_copy_;
  void v14[4] = __Block_byref_object_dispose_;
  [MEMORY[0x189603F50] date];
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  WiFiUsageFaultReasonStringMap(a3);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    WiFiFaultHandlingLimitsStringMap(a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s: Recording WiFiUsageFaultReason %@, %@",  "-[SiriTimeoutInitiatedTelemetry notifyFaultReason:wasIgnored:]",  v7,  v8);
  }

  else
  {
    NSLog( @"%s: Recording WiFiUsageFaultReason %@",  "-[SiriTimeoutInitiatedTelemetry notifyFaultReason:wasIgnored:]",  v7);
  }

  SiriFaultReportHandle();
  dispatch_group_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    WiFiUsageFaultReasonStringMap(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v10;
    _os_signpost_emit_with_name_impl( &dword_187EBF000,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "SiriTimeoutInitiatedTelemetry notifyFaultReason",  "reason:%@",  buf,  0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __62__SiriTimeoutInitiatedTelemetry_notifyFaultReason_wasIgnored___block_invoke;
  block[3] = &unk_18A16C868;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  v13[2] = (id)a4;
  block[4] = v14;
  dispatch_async(queue, block);
  objc_destroyWeak(v13);
  _Block_object_dispose(v14, 8);

  objc_destroyWeak(&location);
}

void __62__SiriTimeoutInitiatedTelemetry_notifyFaultReason_wasIgnored___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _notifyFaultReason:*(void *)(a1 + 48) wasIgnored:*(void *)(a1 + 56) atDate:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  SiriFaultReportHandle();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    WiFiUsageFaultReasonStringMap(*(void *)(a1 + 48));
    double v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v5 = 138412290;
    v6 = v4;
    _os_signpost_emit_with_name_impl( &dword_187EBF000,  v3,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "SiriTimeoutInitiatedTelemetry notifyFaultReason",  "reason:%@",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)notifyBrokenLinkRecovery:(id)a3 wasIgnored:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  objc_initWeak(&location, self);
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x3032000000LL;
  v15[3] = __Block_byref_object_copy_;
  v15[4] = __Block_byref_object_dispose_;
  [MEMORY[0x189603F50] date];
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    WiFiFaultHandlingLimitsStringMap(a4);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s: Recording LinkRecovery %@, %@",  "-[SiriTimeoutInitiatedTelemetry notifyBrokenLinkRecovery:wasIgnored:]",  v6,  v7);
  }

  else
  {
    NSLog( @"%s: Recording LinkRecovery %@",  "-[SiriTimeoutInitiatedTelemetry notifyBrokenLinkRecovery:wasIgnored:]",  v6);
  }

  SiriFaultReportHandle();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2048;
    int64_t v21 = a4;
    _os_signpost_emit_with_name_impl( &dword_187EBF000,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "SiriTimeoutInitiatedTelemetry notifyBrokenLinkRecovery",  "reason:%@ ignored:%ld",  buf,  0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __69__SiriTimeoutInitiatedTelemetry_notifyBrokenLinkRecovery_wasIgnored___block_invoke;
  block[3] = &unk_18A16C890;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a4;
  id v12 = v6;
  v13 = v15;
  id v10 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v14);
  _Block_object_dispose(v15, 8);

  objc_destroyWeak(&location);
}

void __69__SiriTimeoutInitiatedTelemetry_notifyBrokenLinkRecovery_wasIgnored___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _notifyBrokenLinkRecovery:*(void *)(a1 + 32) wasIgnored:*(void *)(a1 + 56) atDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  SiriFaultReportHandle();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 56);
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_signpost_emit_with_name_impl( &dword_187EBF000,  v3,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "SiriTimeoutInitiatedTelemetry notifyBrokenLinkRecovery",  "reason:%@ ignored:%ld",  (uint8_t *)&v6,  0x16u);
  }
}

- (void)addLinkTestReasonAndResult:(id)a3 result:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x3032000000LL;
  v17[3] = __Block_byref_object_copy_;
  v17[4] = __Block_byref_object_dispose_;
  [MEMORY[0x189603F50] date];
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  NSLog( @"%s: Recording LinkTestReasonAndResult %@ - %@",  "-[SiriTimeoutInitiatedTelemetry addLinkTestReasonAndResult:result:]",  v6,  v7);
  SiriFaultReportHandle();
  __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_signpost_emit_with_name_impl( &dword_187EBF000,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "SiriTimeoutInitiatedTelemetry addLinkTestReasonAndResult",  "reason:%@",  buf,  0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __67__SiriTimeoutInitiatedTelemetry_addLinkTestReasonAndResult_result___block_invoke;
  block[3] = &unk_18A16C8B8;
  objc_copyWeak(&v16, &location);
  id v13 = v6;
  id v14 = v7;
  id v15 = v17;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(&v16);
  _Block_object_dispose(v17, 8);

  objc_destroyWeak(&location);
}

void __67__SiriTimeoutInitiatedTelemetry_addLinkTestReasonAndResult_result___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _addLinkTestReasonAndResult:*(void *)(a1 + 32) result:*(void *)(a1 + 40) atDate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  SiriFaultReportHandle();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_signpost_emit_with_name_impl( &dword_187EBF000,  v3,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "SiriTimeoutInitiatedTelemetry addLinkTestReasonAndResult",  "reason:%@",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)_notifyFaultEventDetectedWithReason:(unint64_t)a3 atDate:(id)a4
{
  id v9 = a4;
  uint64_t v7 = -[SiriTimeoutActivity initWithType:atDate:]( objc_alloc(&OBJC_CLASS___SiriTimeoutActivity),  "initWithType:atDate:",  1LL,  v9);
  -[SiriTimeoutActivity setFaultReason:](v7, "setFaultReason:", a3);
  -[NSMutableArray addObject:](self->_activities, "addObject:", v7);
  switch(a3)
  {
    case 0x19uLL:
      NSLog( @"%s: kWiFiUsageFaultReasonSiriTimedOut detected, starting Telemetry Timer",  "-[SiriTimeoutInitiatedTelemetry _notifyFaultEventDetectedWithReason:atDate:]");
      p_dateMostRecentSiriTimeout = &self->_dateMostRecentSiriTimeout;
      goto LABEL_9;
    case 0x1AuLL:
      NSLog( @"%s: kWiFiUsageFaultReasonApsdTimedOut detected starting Telemetry Timer",  "-[SiriTimeoutInitiatedTelemetry _notifyFaultEventDetectedWithReason:atDate:]");
      p_dateMostRecentSiriTimeout = &self->_dateMostRecentApsdTimeout;
      goto LABEL_9;
    case 0x1BuLL:
      break;
    case 0x1CuLL:
      NSLog( @"%s: kWiFiUsageFaultReasonLinkTestSiriTCPCheckFailed detected starting Telemetry Timer",  "-[SiriTimeoutInitiatedTelemetry _notifyFaultEventDetectedWithReason:atDate:]");
      goto LABEL_8;
    case 0x1DuLL:
      NSLog( @"%s: kWiFiUsageFaultReasonLinkTestSiriTLSCheckFailed detected starting Telemetry Timer",  "-[SiriTimeoutInitiatedTelemetry _notifyFaultEventDetectedWithReason:atDate:]");
LABEL_8:
      p_dateMostRecentSiriTimeout = &self->_dateMostRecentWFMeasureDetectedSiriFailure;
LABEL_9:
      objc_storeStrong((id *)p_dateMostRecentSiriTimeout, a4);
      -[SiriTimeoutInitiatedTelemetry _startTelemetryTimer](self, "_startTelemetryTimer");
      break;
    default:
      if (a3 == 7)
      {
        NSLog( @"%s: kWiFiUsageFaultReasonWatchdogReset detected noting date",  "-[SiriTimeoutInitiatedTelemetry _notifyFaultEventDetectedWithReason:atDate:]");
        objc_storeStrong((id *)&self->_dateMostRecentFaultReasonWatchdogReset, a4);
      }

      break;
  }

  -[SiriTimeoutInitiatedTelemetry _maintainHistory](self, "_maintainHistory");
}

- (void)_notifyFaultReason:(unint64_t)a3 wasIgnored:(int64_t)a4 atDate:(id)a5
{
  id v8 = a5;
  id v9 = -[SiriTimeoutActivity initWithType:atDate:]( objc_alloc(&OBJC_CLASS___SiriTimeoutActivity),  "initWithType:atDate:",  2LL,  v8);

  -[SiriTimeoutActivity setFaultReason:](v9, "setFaultReason:", a3);
  -[SiriTimeoutActivity setFaultHandlingLimited:](v9, "setFaultHandlingLimited:", a4);
  -[NSMutableArray addObject:](self->_activities, "addObject:", v9);
  -[SiriTimeoutInitiatedTelemetry _maintainHistory](self, "_maintainHistory");
}

- (void)_notifyBrokenLinkRecovery:(id)a3 wasIgnored:(int64_t)a4 atDate:(id)a5
{
  id v12 = a5;
  id v9 = a3;
  id v10 = objc_alloc(&OBJC_CLASS___SiriTimeoutActivity);
  if (a4)
  {
    id v11 = -[SiriTimeoutActivity initWithType:atDate:](v10, "initWithType:atDate:", 4LL, v12);
    -[SiriTimeoutActivity setFaultHandlingLimited:](v11, "setFaultHandlingLimited:", a4);
  }

  else
  {
    id v11 = -[SiriTimeoutActivity initWithType:atDate:](v10, "initWithType:atDate:", 3LL, v12);
    objc_storeStrong((id *)&self->_dateMostRecentRecovery, a5);
  }

  -[SiriTimeoutActivity setBrokenLinkReason:](v11, "setBrokenLinkReason:", v9);

  -[NSMutableArray addObject:](self->_activities, "addObject:", v11);
  -[SiriTimeoutInitiatedTelemetry _maintainHistory](self, "_maintainHistory");
}

- (void)_addLinkTestReasonAndResult:(id)a3 result:(id)a4 atDate:(id)a5
{
  id v14 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = -[SiriTimeoutActivity initWithType:atDate:]( objc_alloc(&OBJC_CLASS___SiriTimeoutActivity),  "initWithType:atDate:",  5LL,  v8);

  -[SiriTimeoutActivity setLinkTestReason:](v10, "setLinkTestReason:", v9);
  -[SiriTimeoutActivity setLnkTestResult:](v10, "setLnkTestResult:", v14);
  -[NSMutableArray addObject:](self->_activities, "addObject:", v10);
  int v11 = [v9 isEqualToString:@"periodicTestHourly"];

  if (v11)
  {
    uint64_t v12 = [v14 valueForKey:@"FinalResults_SiriTLS"];
    uint64_t v13 = [v14 valueForKey:@"FinalResults_SiriTCP"];
    if (([(id)v12 isEqualToString:kWFMeasureStatusBroken] & 1) != 0
      || [(id)v13 isEqualToString:kWFMeasureStatusBroken])
    {
      NSLog( @"%s: kWFMeasureReasonPeriodicTestHourly with siri failure detected, starting Telemetry Timer",  "-[SiriTimeoutInitiatedTelemetry _addLinkTestReasonAndResult:result:atDate:]");
      -[SiriTimeoutInitiatedTelemetry _startTelemetryTimer](self, "_startTelemetryTimer");
    }

    else if (v12 | v13)
    {
      NSLog( @"%s: kWFMeasureReasonPeriodicTestHourly with Successful Siri, not starting study",  "-[SiriTimeoutInitiatedTelemetry _addLinkTestReasonAndResult:result:atDate:]");
    }
  }

  -[SiriTimeoutInitiatedTelemetry _maintainHistory](self, "_maintainHistory");
}

- (void)_maintainHistory
{
  int v3 = MGGetBoolAnswer();
  uint64_t v4 = MEMORY[0x1895F87A8];
  if (v3)
  {
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __49__SiriTimeoutInitiatedTelemetry__maintainHistory__block_invoke;
    v17[3] = &unk_18A16C818;
    v17[4] = self;
    -[SiriTimeoutInitiatedTelemetry getLazyNSNumberPreference:exists:]( self,  "getLazyNSNumberPreference:exists:",  @"event_history_age",  v17);
  }

  [MEMORY[0x189603F50] now];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 dateByAddingTimeInterval:-self->_secondsOfEventHistoryToMaintain];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(@"%s: deleteOlderThanDate %@", "-[SiriTimeoutInitiatedTelemetry _maintainHistory]", v7);

  id v8 = (void *)MEMORY[0x1896079C8];
  uint64_t v12 = v4;
  uint64_t v13 = 3221225472LL;
  id v14 = __49__SiriTimeoutInitiatedTelemetry__maintainHistory__block_invoke_2;
  id v15 = &unk_18A16C8E0;
  id v16 = v6;
  id v9 = v6;
  [v8 predicateWithBlock:&v12];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = -[NSMutableArray count](self->_activities, "count");
  NSLog( @"%s: Initial length of _activities %lu",  "-[SiriTimeoutInitiatedTelemetry _maintainHistory]",  v11,  v12,  v13,  v14,  v15);
  -[NSMutableArray filterUsingPredicate:](self->_activities, "filterUsingPredicate:", v10);
  NSLog( @"%s: Remaining length of _activities %lu",  "-[SiriTimeoutInitiatedTelemetry _maintainHistory]",  -[NSMutableArray count](self->_activities, "count"));
}

void __49__SiriTimeoutInitiatedTelemetry__maintainHistory__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(double *)(*(void *)(a1 + 32) + 120LL);
  id v5 = v3;
  if (v4 != (double)[v3 unsignedIntValue])
  {
    NSLog( @"%s: OVERRIDING kSiriTimeoutStudyPreferenceEventHistoryAge _secondsOfEventHistoryToMaintain from %f to %u",  "-[SiriTimeoutInitiatedTelemetry _maintainHistory]_block_invoke",  *(void *)(*(void *)(a1 + 32) + 120),  [v5 unsignedIntValue]);
    *(double *)(*(void *)(a1 + 32) + 120) = (double)[v5 unsignedIntValue];
  }
}

BOOL __49__SiriTimeoutInitiatedTelemetry__maintainHistory__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = [v3 compare:*(void *)(a1 + 32)] == 1;

  return v4;
}

- (void)_startTimerToBuildAndSendTelemetry
{
  int v3 = MGGetBoolAnswer();
  uint64_t v4 = MEMORY[0x1895F87A8];
  if (v3)
  {
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __67__SiriTimeoutInitiatedTelemetry__startTimerToBuildAndSendTelemetry__block_invoke;
    v18[3] = &unk_18A16C818;
    v18[4] = self;
    -[SiriTimeoutInitiatedTelemetry getLazyNSNumberPreference:exists:]( self,  "getLazyNSNumberPreference:exists:",  @"event_monitoring_post_interval",  v18);
  }

  id v5 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)self->_queue);
  uint64_t secondsToWaitToSendTelemetryAfterTimeout = (uint64_t)self->_secondsToWaitToSendTelemetryAfterTimeout;
  [MEMORY[0x189603F50] now];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 dateByAddingTimeInterval:(double)secondsToWaitToSendTelemetryAfterTimeout];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog( @"%s: Telemtry Timer will fire at: %@",  "-[SiriTimeoutInitiatedTelemetry _startTimerToBuildAndSendTelemetry]",  v9);

  dispatch_time_t v10 = dispatch_time(0LL, 1000000000 * secondsToWaitToSendTelemetryAfterTimeout);
  dispatch_source_set_timer(v5, v10, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  handler[0] = v4;
  handler[1] = 3221225472LL;
  handler[2] = __67__SiriTimeoutInitiatedTelemetry__startTimerToBuildAndSendTelemetry__block_invoke_2;
  handler[3] = &unk_18A16C908;
  uint64_t v17 = secondsToWaitToSendTelemetryAfterTimeout;
  uint64_t v11 = v5;
  id v15 = v11;
  id v16 = self;
  dispatch_source_set_event_handler(v11, handler);
  dispatch_resume(v11);
  buildTelemetryTimer = self->_buildTelemetryTimer;
  self->_buildTelemetryTimer = (OS_dispatch_source *)v11;
  uint64_t v13 = v11;
}

void __67__SiriTimeoutInitiatedTelemetry__startTimerToBuildAndSendTelemetry__block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  double v4 = *(double *)(*(void *)(a1 + 32) + 128LL);
  id v5 = v3;
  if (v4 != (double)[v3 unsignedIntValue])
  {
    NSLog( @"%s: OVERRIDING kSiriTimeoutStudyPreferenceEventMonitoringPostInterval _secondsToWaitToSendTelemetryAfterTimeout from %f to %u",  "-[SiriTimeoutInitiatedTelemetry _startTimerToBuildAndSendTelemetry]_block_invoke",  *(void *)(*(void *)(a1 + 32) + 128),  [v5 unsignedIntValue]);
    *(double *)(*(void *)(a1 + 32) + 128) = (double)[v5 unsignedIntValue];
  }
}

void __67__SiriTimeoutInitiatedTelemetry__startTimerToBuildAndSendTelemetry__block_invoke_2(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3 == (void *)v2[2])
  {
    v2[2] = 0LL;

    v2 = *(void **)(a1 + 40);
  }

  [v2 _sendTelemetry];
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 48LL), *(id *)(*(void *)(a1 + 40) + 40LL));
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 64LL), *(id *)(*(void *)(a1 + 40) + 56LL));
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 80LL), *(id *)(*(void *)(a1 + 40) + 56LL));
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 112LL), *(id *)(*(void *)(a1 + 40) + 104LL));
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 96LL), *(id *)(*(void *)(a1 + 40) + 88LL));
}

- (void)_startTelemetryTimer
{
  if (self->_buildTelemetryTimer) {
    NSLog( @"%s: Telemetry Timer already running, ignoring request",  a2,  "-[SiriTimeoutInitiatedTelemetry _startTelemetryTimer]");
  }
  else {
    -[SiriTimeoutInitiatedTelemetry _startTimerToBuildAndSendTelemetry](self, "_startTimerToBuildAndSendTelemetry");
  }
}

- (void)_cancelTelemetryTimer
{
  buildTelemetryTimer = self->_buildTelemetryTimer;
  if (buildTelemetryTimer)
  {
    dispatch_source_cancel((dispatch_source_t)buildTelemetryTimer);
    double v4 = self->_buildTelemetryTimer;
    self->_buildTelemetryTimer = 0LL;
  }

- (void)_sendTelemetry
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "Did not find Telemetry Triggering Event for Siri linkTest",  v0,  2u);
}

BOOL __47__SiriTimeoutInitiatedTelemetry__sendTelemetry__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 getDate];
  double v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 getType] == 1) {
    BOOL v5 = [v3 getFaultReason] == 25 || objc_msgSend(v3, "getFaultReason") == 26;
  }
  else {
    BOOL v5 = 0;
  }
  if ([v3 getType] == 3)
  {
    [v3 getBrokenLinkReason];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v6 isEqualToString:@"LinkTestFailure_SiriTLS"])
    {
      int v7 = 1;
    }

    else
    {
      [v3 getBrokenLinkReason];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      int v7 = [v8 isEqualToString:@"LinkTestFailure_SiriTCP"];
    }
  }

  else
  {
    int v7 = 0;
  }

  BOOL v9 = (v5 | v7) == 1
    && [v4 compare:*(void *)(a1 + 32)] == 1
    && [v4 compare:*(void *)(a1 + 40)] == -1;

  return v9;
}

uint64_t __47__SiriTimeoutInitiatedTelemetry__sendTelemetry__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 getDate];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 getDate];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

BOOL __47__SiriTimeoutInitiatedTelemetry__sendTelemetry__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 getLnkTestResult];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 valueForKey:@"FinalResults_SiriTLS"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v3 getLnkTestResult];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 valueForKey:@"FinalResults_SiriTCP"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v3 getLinkTestReason];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = [v9 isEqualToString:@"periodicTestHourly"]
     && [v3 getType] == 5
     && (([v6 isEqualToString:kWFMeasureStatusBroken] & 1) != 0
      || [v8 isEqualToString:kWFMeasureStatusBroken])
     && [v4 compare:*(void *)(a1 + 32)] == 1
     && [v4 compare:*(void *)(a1 + 40)] == -1;

  return v10;
}

BOOL __47__SiriTimeoutInitiatedTelemetry__sendTelemetry__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = ([v3 getFaultReason] == 28 || objc_msgSend(v3, "getFaultReason") == 29)
    && [v3 getType] == 1
    && [v4 compare:*(void *)(a1 + 32)] == 1
    && [v4 compare:*(void *)(a1 + 40)] == -1;

  return v5;
}

BOOL __47__SiriTimeoutInitiatedTelemetry__sendTelemetry__block_invoke_123(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 getType];

  BOOL v6 = v5 == 5
    && [v4 compare:*(void *)(a1 + 32)] == 1
    && [v4 compare:*(void *)(a1 + 40)] == -1;

  return v6;
}

BOOL __47__SiriTimeoutInitiatedTelemetry__sendTelemetry__block_invoke_2_126(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 getType];

  BOOL v6 = v5 == 5
    && [v4 compare:*(void *)(a1 + 32)] == 1
    && [v4 compare:*(void *)(a1 + 40)] == -1;

  return v6;
}

uint64_t __47__SiriTimeoutInitiatedTelemetry__sendTelemetry__block_invoke_3_127( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 getDate];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 getDate];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __47__SiriTimeoutInitiatedTelemetry__sendTelemetry__block_invoke_4_133(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = [v4 compare:*(void *)(a1 + 32)] == 1
    || [v4 compare:*(void *)(a1 + 32)] == 0;
  BOOL v6 = [v4 compare:*(void *)(a1 + 40)] == -1
    || [v4 compare:*(void *)(a1 + 40)] == 0;
  if ([v3 getType] == 3) {
    uint64_t v7 = v5 & v6;
  }
  else {
    uint64_t v7 = 0LL;
  }

  return v7;
}

uint64_t __47__SiriTimeoutInitiatedTelemetry__sendTelemetry__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = [v4 compare:*(void *)(a1 + 32)] == 1
    || [v4 compare:*(void *)(a1 + 32)] == 0;
  BOOL v6 = [v4 compare:*(void *)(a1 + 40)] == -1
    || [v4 compare:*(void *)(a1 + 40)] == 0;
  if ([v3 getType] == 3) {
    uint64_t v7 = v5 & v6;
  }
  else {
    uint64_t v7 = 0LL;
  }

  return v7;
}

uint64_t __47__SiriTimeoutInitiatedTelemetry__sendTelemetry__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 getDate];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 getDate];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

BOOL __47__SiriTimeoutInitiatedTelemetry__sendTelemetry__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 getType];

  if (v5 == 4
    && ([v4 compare:*(void *)(a1 + 32)] == 1 || !objc_msgSend(v4, "compare:", *(void *)(a1 + 32))))
  {
    BOOL v6 = [v4 compare:*(void *)(a1 + 40)] == -1
      || [v4 compare:*(void *)(a1 + 40)] == 0;
  }

  else
  {
    BOOL v6 = 0LL;
  }

  return v6;
}

BOOL __47__SiriTimeoutInitiatedTelemetry__sendTelemetry__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 getType];

  if (v5 == 4
    && ([v4 compare:*(void *)(a1 + 32)] == 1 || !objc_msgSend(v4, "compare:", *(void *)(a1 + 32))))
  {
    BOOL v6 = [v4 compare:*(void *)(a1 + 40)] == -1
      || [v4 compare:*(void *)(a1 + 40)] == 0;
  }

  else
  {
    BOOL v6 = 0LL;
  }

  return v6;
}

uint64_t __47__SiriTimeoutInitiatedTelemetry__sendTelemetry__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 getDate];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 getDate];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

id __47__SiriTimeoutInitiatedTelemetry__sendTelemetry__block_invoke_160(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_dictOfEventSummaryAfterLinkTestResultDate:(id)a3
{
  uint64_t v76 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  BOOL v6 = (void *)MEMORY[0x1896079C8];
  v73[0] = MEMORY[0x1895F87A8];
  v73[1] = 3221225472LL;
  v73[2] = __76__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryAfterLinkTestResultDate___block_invoke;
  v73[3] = &unk_18A16C8E0;
  id v59 = v4;
  id v74 = v59;
  [v6 predicateWithBlock:v73];
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filteredArrayUsingPredicate:](self->_activities, "filteredArrayUsingPredicate:");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (!v7 || ![v7 count]) {
    NSLog( @"%s: No Following Faults Found",  "-[SiriTimeoutInitiatedTelemetry _dictOfEventSummaryAfterLinkTestResultDate:]");
  }
  [v8 sortedArrayUsingComparator:&__block_literal_global_166];
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  [v57 firstObject];
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v70;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v70 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = [*(id *)(*((void *)&v69 + 1) + 8 * i) getFaultReason];
        id v15 = (void *)NSString;
        WiFiUsageFaultReasonStringMap(v14);
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 stringWithFormat:@"AfterFault_Fault_%@", v16];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[SiriTimeoutInitiatedTelemetry incrementValueForKey:inMutableDict:]( self,  "incrementValueForKey:inMutableDict:",  v17,  v5);
      }

      uint64_t v11 = [v9 countByEnumeratingWithState:&v69 objects:v75 count:16];
    }

    while (v11);
  }

  [v56 getDate];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    id v19 = (void *)MEMORY[0x189607968];
    [v56 getDate];
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 timeIntervalSinceDate:v59];
    [v19 numberWithInt:(int)v21];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v22 forKeyedSubscript:@"AfterFault_Fault_postInterval"];
  }

  v23 = (void *)MEMORY[0x1896079C8];
  v67[0] = MEMORY[0x1895F87A8];
  v67[1] = 3221225472LL;
  v67[2] = __76__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryAfterLinkTestResultDate___block_invoke_3;
  v67[3] = &unk_18A16C8E0;
  id v24 = v59;
  id v68 = v24;
  [v23 predicateWithBlock:v67];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[NSMutableArray filteredArrayUsingPredicate:](self->_activities, "filteredArrayUsingPredicate:", v25);
  v27 = v26;
  if (!v26 || ![v26 count]) {
    NSLog( @"%s: No AfterFault linktests Found",  "-[SiriTimeoutInitiatedTelemetry _dictOfEventSummaryAfterLinkTestResultDate:]");
  }
  [v27 firstObject];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 getLnkTestResult];
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v30 = MEMORY[0x1895F87A8];
  v64[0] = MEMORY[0x1895F87A8];
  v64[1] = 3221225472LL;
  v64[2] = __76__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryAfterLinkTestResultDate___block_invoke_4;
  v64[3] = &unk_18A16CA40;
  id v31 = v5;
  id v65 = v31;
  id v66 = v29;
  id v32 = v29;
  [v32 enumerateKeysAndObjectsUsingBlock:v64];

  v33 = (void *)MEMORY[0x1896079C8];
  v62[0] = v30;
  v62[1] = 3221225472LL;
  v62[2] = __76__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryAfterLinkTestResultDate___block_invoke_5;
  v62[3] = &unk_18A16C8E0;
  id v34 = v24;
  id v63 = v34;
  [v33 predicateWithBlock:v62];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[NSMutableArray filteredArrayUsingPredicate:](self->_activities, "filteredArrayUsingPredicate:", v35);
  [v36 sortedArrayUsingComparator:&__block_literal_global_177];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v37 firstObject];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v38 getDate];
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    v40 = (void *)MEMORY[0x189607968];
    [v38 getDate];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    [v41 timeIntervalSinceDate:v34];
    [v40 numberWithInt:(int)v42];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 setObject:v43 forKeyedSubscript:@"AfterFault_nextST_postInterval"];
  }

  v44 = (void *)MEMORY[0x1896079C8];
  v60[0] = MEMORY[0x1895F87A8];
  v60[1] = 3221225472LL;
  v60[2] = __76__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryAfterLinkTestResultDate___block_invoke_7;
  v60[3] = &unk_18A16C8E0;
  id v45 = v34;
  id v61 = v45;
  [v44 predicateWithBlock:v60];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[NSMutableArray filteredArrayUsingPredicate:](self->_activities, "filteredArrayUsingPredicate:", v46);
  [v47 sortedArrayUsingComparator:&__block_literal_global_180];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  [v48 firstObject];
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  [v49 getDate];
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    v51 = (void *)MEMORY[0x189607968];
    [v49 getDate];
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    [v52 timeIntervalSinceDate:v45];
    [v51 numberWithInt:(int)v53];
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 setObject:v54 forKeyedSubscript:@"AfterFault_nextApsd_postInterval"];
  }

  return v31;
}

BOOL __76__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryAfterLinkTestResultDate___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 getType];

  BOOL v6 = v5 == 1 && [*(id *)(a1 + 32) compare:v4] == -1;
  return v6;
}

uint64_t __76__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryAfterLinkTestResultDate___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 getDate];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 getDate];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

BOOL __76__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryAfterLinkTestResultDate___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 getType];

  BOOL v6 = v5 == 5 && [*(id *)(a1 + 32) compare:v4] == 0;
  return v6;
}

void __76__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryAfterLinkTestResultDate___block_invoke_4( uint64_t a1,  void *a2)
{
  id v3 = (void *)NSString;
  id v4 = a2;
  [v3 stringWithFormat:@"AfterFault_LinkTestResults_%@", v4];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

BOOL __76__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryAfterLinkTestResultDate___block_invoke_5( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = [v3 getType] == 1
    && [v3 getFaultReason] == 25
    && [*(id *)(a1 + 32) compare:v4] == -1;

  return v5;
}

uint64_t __76__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryAfterLinkTestResultDate___block_invoke_6( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 getDate];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 getDate];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

BOOL __76__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryAfterLinkTestResultDate___block_invoke_7( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = [v3 getType] == 1
    && [v3 getFaultReason] == 26
    && [*(id *)(a1 + 32) compare:v4] == -1;

  return v5;
}

uint64_t __76__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryAfterLinkTestResultDate___block_invoke_8( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 getDate];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 getDate];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_dictOfLinkTestResultsAtDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v6 = (void *)MEMORY[0x1896079C8];
  uint64_t v7 = MEMORY[0x1895F87A8];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __62__SiriTimeoutInitiatedTelemetry__dictOfLinkTestResultsAtDate___block_invoke;
  v20[3] = &unk_18A16C8E0;
  id v8 = v4;
  id v21 = v8;
  [v6 predicateWithBlock:v20];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filteredArrayUsingPredicate:](self->_activities, "filteredArrayUsingPredicate:", v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = v10;
  if (!v10 || ![v10 count]) {
    NSLog(@"%s: No LinkTest Found", "-[SiriTimeoutInitiatedTelemetry _dictOfLinkTestResultsAtDate:]");
  }
  [v11 firstObject];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 getLnkTestResult];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v7;
  v17[1] = 3221225472LL;
  v17[2] = __62__SiriTimeoutInitiatedTelemetry__dictOfLinkTestResultsAtDate___block_invoke_2;
  v17[3] = &unk_18A16CA40;
  id v14 = v5;
  id v18 = v14;
  id v19 = v13;
  id v15 = v13;
  [v15 enumerateKeysAndObjectsUsingBlock:v17];

  return v14;
}

BOOL __62__SiriTimeoutInitiatedTelemetry__dictOfLinkTestResultsAtDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 getType];

  BOOL v6 = v5 == 5 && [*(id *)(a1 + 32) compare:v4] == 0;
  return v6;
}

void __62__SiriTimeoutInitiatedTelemetry__dictOfLinkTestResultsAtDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)NSString;
  id v4 = a2;
  [v3 stringWithFormat:@"LinkTestResults_%@", v4];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (id)_dictOfRecoveryHandlingAtDate:(id)a3 orDateForPeriodic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v9 = (void *)MEMORY[0x1896079C8];
  uint64_t v10 = MEMORY[0x1895F87A8];
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __81__SiriTimeoutInitiatedTelemetry__dictOfRecoveryHandlingAtDate_orDateForPeriodic___block_invoke;
  v27[3] = &unk_18A16C8E0;
  id v11 = v6;
  id v28 = v11;
  [v9 predicateWithBlock:v27];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filteredArrayUsingPredicate:](self->_activities, "filteredArrayUsingPredicate:", v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = v13;
  if (v13 && [v13 count]) {
    goto LABEL_13;
  }
  NSLog( @"%s: No Recovery Found, check other date",  "-[SiriTimeoutInitiatedTelemetry _dictOfRecoveryHandlingAtDate:orDateForPeriodic:]");
  id v15 = (void *)MEMORY[0x1896079C8];
  v25[0] = v10;
  v25[1] = 3221225472LL;
  v25[2] = __81__SiriTimeoutInitiatedTelemetry__dictOfRecoveryHandlingAtDate_orDateForPeriodic___block_invoke_2;
  v25[3] = &unk_18A16C8E0;
  id v26 = v7;
  [v15 predicateWithBlock:v25];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = -[NSMutableArray filteredArrayUsingPredicate:](self->_activities, "filteredArrayUsingPredicate:", v16);

  id v14 = (void *)v17;
  if (v17)
  {
LABEL_13:
    if ([v14 count])
    {
      [v14 firstObject];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 getBrokenLinkReason];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();

      [v14 firstObject];
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
      WiFiFaultHandlingLimitsStringMap([v20 getFaultHandlingLimited]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19) {
        [v8 setObject:v19 forKeyedSubscript:@"RecoveryHandling_reason"];
      }
      [v14 firstObject];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [v22 getFaultHandlingLimited];

      if (v23) {
        [v8 setObject:v21 forKeyedSubscript:@"RecoveryHandling_wasLimited"];
      }
    }
  }

  return v8;
}

BOOL __81__SiriTimeoutInitiatedTelemetry__dictOfRecoveryHandlingAtDate_orDateForPeriodic___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = ([v3 getType] == 3 || objc_msgSend(v3, "getType") == 4)
    && [*(id *)(a1 + 32) compare:v4] == 0;

  return v5;
}

BOOL __81__SiriTimeoutInitiatedTelemetry__dictOfRecoveryHandlingAtDate_orDateForPeriodic___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = ([v3 getType] == 3 || objc_msgSend(v3, "getType") == 4)
    && [*(id *)(a1 + 32) compare:v4] == 0;

  return v5;
}

- (id)_dictOfEventSummaryBeforeDate:(id)a3
{
  uint64_t v160 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (self->_dateMostRecentSiriTimeoutBeforeAggregation)
  {
    id v6 = (void *)MEMORY[0x189607968];
    objc_msgSend(v4, "timeIntervalSinceDate:");
    [v6 numberWithInt:(int)v7];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v8 forKeyedSubscript:@"BeforeFault_PreviousST_age"];
  }

  if (self->_dateMostRecentApsdTimeoutBeforeAggregation)
  {
    id v9 = (void *)MEMORY[0x189607968];
    objc_msgSend(v4, "timeIntervalSinceDate:");
    [v9 numberWithInt:(int)v10];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v11 forKeyedSubscript:@"BeforeFault_PreviousApsd_age"];
  }

  if (self->_dateMostRecentWFMeasureDetectedSiriFailureBeforeAggregation)
  {
    uint64_t v12 = (void *)MEMORY[0x189607968];
    objc_msgSend(v4, "timeIntervalSinceDate:");
    [v12 numberWithInt:(int)v13];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v14 forKeyedSubscript:@"BeforeFault_PreviousWFMeasureSiriFail_age"];
  }

  if (self->_dateMostRecentRecoveryBeforeAggregation)
  {
    id v15 = (void *)MEMORY[0x189607968];
    objc_msgSend(v4, "timeIntervalSinceDate:");
    [v15 numberWithInt:(int)v16];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v17 forKeyedSubscript:@"BeforeFault_PreviousRecovery_age"];
  }

  if (self->_dateMostRecentFaultReasonWatchdogResetBeforeAggregation)
  {
    id v18 = (void *)MEMORY[0x189607968];
    objc_msgSend(v4, "timeIntervalSinceDate:");
    [v18 numberWithInt:(int)v19];
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v20 forKeyedSubscript:@"BeforeFault_PreviousChipWatchdog_age"];
LABEL_13:

    goto LABEL_14;
  }

  [MEMORY[0x1896079D8] processInfo];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v22 = [v21 processIdentifier];

  if (v22 <= 0x95)
  {
    uint64_t v23 = (void *)MEMORY[0x189607968];
    [MEMORY[0x1896079D8] processInfo];
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 systemUptime];
    [v23 numberWithInt:(int)v24];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v25 forKeyedSubscript:@"BeforeFault_ChipUptime_age"];

    goto LABEL_13;
  }

BOOL __63__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryBeforeDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 getType];

  BOOL v6 = v5 == 1 && [*(id *)(a1 + 32) compare:v4] == 1;
  return v6;
}

uint64_t __63__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryBeforeDate___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 getDate];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 getDate];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

BOOL __63__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryBeforeDate___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 getType];

  BOOL v6 = v5 == 5 && [*(id *)(a1 + 32) compare:v4] == 1;
  return v6;
}

uint64_t __63__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryBeforeDate___block_invoke_4( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 getDate];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 getDate];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __63__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryBeforeDate___block_invoke_5( uint64_t a1,  void *a2)
{
  id v3 = (void *)NSString;
  id v4 = a2;
  [v3 stringWithFormat:@"BeforeFault_LinkTestResults_%@", v4];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

BOOL __63__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryBeforeDate___block_invoke_6( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 getType];

  BOOL v6 = v5 == 2 && [*(id *)(a1 + 32) compare:v4] == 1;
  return v6;
}

uint64_t __63__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryBeforeDate___block_invoke_7( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 getDate];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 getDate];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

BOOL __63__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryBeforeDate___block_invoke_8( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 getType];

  BOOL v6 = v5 == 3 && [*(id *)(a1 + 32) compare:v4] == 1;
  return v6;
}

uint64_t __63__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryBeforeDate___block_invoke_9( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 getDate];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 getDate];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

BOOL __63__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryBeforeDate___block_invoke_10( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [v3 getDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 getType];

  BOOL v6 = v5 == 4 && [*(id *)(a1 + 32) compare:v4] == 1;
  return v6;
}

uint64_t __63__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryBeforeDate___block_invoke_11( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 getDate];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 getDate];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_dictOfFaultsAfterLinkTest
{
  return objc_alloc_init(MEMORY[0x189603FC8]);
}

- (id)_dictOfFaultsAfterRecovery
{
  return objc_alloc_init(MEMORY[0x189603FC8]);
}

- (id)_dictOfLinkTestResults
{
  return objc_alloc_init(MEMORY[0x189603FC8]);
}

- (void)incrementValueForKey:(id)a3 inMutableDict:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  BOOL v6 = v5;
  if (v5)
  {
    if (v11)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:");
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        id v8 = (void *)MEMORY[0x189607968];
        [v6 objectForKeyedSubscript:v11];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "numberWithUnsignedLong:", objc_msgSend(v9, "unsignedIntegerValue") + 1);
        double v10 = (void *)objc_claimAutoreleasedReturnValue();

        [v6 removeObjectForKey:v11];
        [v6 setObject:v10 forKey:v11];
      }

      else
      {
        [v6 setObject:&unk_18A1B35D0 forKey:v11];
      }
    }

    else
    {
      NSLog(@"Attempting to adjust nil key in dictionary");
    }
  }

  else
  {
    NSLog(@"Attempting to adjust nil dictionary with key %@", v11);
  }
}

- (void)getLazyNSNumberPreference:(id)a3 exists:(id)a4
{
  id v9 = a3;
  id v5 = (void (**)(id, void *))a4;
  [MEMORY[0x189604038] standardUserDefaults];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 persistentDomainForName:@"com.apple.wifipolicy.siristudy"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 objectForKey:v9];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    NSLog( @"%s: Found preference value in domain: %@ key: %@",  "-[SiriTimeoutInitiatedTelemetry getLazyNSNumberPreference:exists:]",  @"com.apple.wifipolicy.siristudy",  v9);
    v5[2](v5, v8);
  }
}

- (BOOL)fetchActivities:(id)a3 withCompletionQueue:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (dispatch_queue_s *)a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __69__SiriTimeoutInitiatedTelemetry_fetchActivities_withCompletionQueue___block_invoke;
  block[3] = &unk_18A16CB48;
  objc_copyWeak(&v12, &location);
  id v11 = v6;
  id v8 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return 1;
}

void __69__SiriTimeoutInitiatedTelemetry_fetchActivities_withCompletionQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _maintainHistory];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)[WeakRetained[4] copy];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

- (BOOL)handleTelemetry:(id)a3 withCompletionQueue:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (dispatch_queue_s *)a4;
  objc_initWeak(&location, self);
  self->_requestingTelemetryCopyout = 1;
  dispatch_group_enter((dispatch_group_t)self->_telemetryCopyoutGroup);
  telemetryCopyoutGroup = self->_telemetryCopyoutGroup;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __69__SiriTimeoutInitiatedTelemetry_handleTelemetry_withCompletionQueue___block_invoke;
  block[3] = &unk_18A16CB48;
  objc_copyWeak(&v13, &location);
  id v12 = v6;
  id v9 = v6;
  dispatch_group_notify((dispatch_group_t)telemetryCopyoutGroup, v7, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return 1;
}

void __69__SiriTimeoutInitiatedTelemetry_handleTelemetry_withCompletionQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  NSLog( @"%s: Calling handler with _telemtryCopyout",  "-[SiriTimeoutInitiatedTelemetry handleTelemetry:withCompletionQueue:]_block_invoke");
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)[WeakRetained[18] copy];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  NSLog( @"%s: Freeing _telemtryCopyout",  "-[SiriTimeoutInitiatedTelemetry handleTelemetry:withCompletionQueue:]_block_invoke");
  id v4 = WeakRetained[18];
  WeakRetained[18] = 0LL;
}

- (void).cxx_destruct
{
}

@end