id PLLogDiscretionaryEnergyMonitor()
{
  if (PLLogDiscretionaryEnergyMonitor_onceToken != -1) {
    dispatch_once(&PLLogDiscretionaryEnergyMonitor_onceToken, &__block_literal_global);
  }
  return (id)PLLogDiscretionaryEnergyMonitor___logObj;
}

void __PLLogDiscretionaryEnergyMonitor_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.powerlog.energybudgeting", "discretionaryenergymonitor");
  v1 = (void *)PLLogDiscretionaryEnergyMonitor___logObj;
  PLLogDiscretionaryEnergyMonitor___logObj = (uint64_t)v0;
}

id discretionaryEnergyMonitorQueue()
{
  if (discretionaryEnergyMonitorQueue_queueCreationGuard != -1) {
    dispatch_once(&discretionaryEnergyMonitorQueue_queueCreationGuard, &__block_literal_global_3);
  }
  return (id)discretionaryEnergyMonitorQueue_queue;
}

void __discretionaryEnergyMonitorQueue_block_invoke()
{
  v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  os_log_t v0 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create("PLFrameworkEnergyBudgetingWorkQueue", v0);
  v2 = (void *)discretionaryEnergyMonitorQueue_queue;
  discretionaryEnergyMonitorQueue_queue = (uint64_t)v1;
}

LABEL_29:
      v4 += 2;
      if (!--v7) {
        goto LABEL_32;
      }
    }
  }

  if (v4) {
LABEL_32:
  }
    free(v31);
  PLLogDiscretionaryEnergyMonitor();
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    -[PLCPUEnergySnapshot refreshCoalitionIDMapping].cold.1(v27);
  }
}

void sub_1866571CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}
}

LABEL_16:
}

void PLBatteryLifeMonitorLogCoreDuetEventsAggregate(void *a1)
{
  v5[1] = *MEMORY[0x1895F89C0];
  v4 = @"events";
  v5[0] = a1;
  dispatch_queue_t v1 = (void *)MEMORY[0x189603F68];
  id v2 = a1;
  [v1 dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent(24LL, @"BLMNotifyDuetEvent", v3);
}

void sub_18665B688( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_18665C2B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void didReceiveNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __didReceiveNotification_block_invoke;
  v6[3] = &__block_descriptor_48_e5_v8__0l;
  v6[4] = a2;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

LABEL_10:
}

void PLBatteryLifeMonitorLogDuetEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v18[6] = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603F50] date];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 timeIntervalSince1970];
  double v10 = v9;

  v17[0] = @"time";
  [MEMORY[0x189607968] numberWithDouble:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v17[1] = @"bundleID";
  [NSString stringWithUTF8String:a1];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  v17[2] = @"updateType";
  [MEMORY[0x189607968] numberWithShort:a2];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  v17[3] = @"sequenceNumber";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  v17[4] = @"eventType";
  [MEMORY[0x189607968] numberWithShort:a4];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = @"BLMLogType";
  v18[4] = v15;
  v18[5] = &unk_189EA4430;
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:6];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent(24LL, @"BLMNotifyDuetEvent", v16);
}

void PLBatteryLifeMonitorStopAllDuetEvents()
{
  v6[3] = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603F50] date];
  os_log_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 timeIntervalSince1970];
  double v2 = v1;

  v5[0] = @"time";
  [MEMORY[0x189607968] numberWithDouble:v2];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = MEMORY[0x189604A88];
  v5[1] = @"BLMStopAllDuetEvents";
  void v5[2] = @"BLMLogType";
  v6[2] = &unk_189EA4430;
  [MEMORY[0x189603F68] dictionaryWithObjects:v6 forKeys:v5 count:3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent(24LL, @"BLMNotifyDuetEvent", v4);
}

void PLBatteryLifeMonitorLogCoreDuetAdmissionEvent( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  v34[11] = *MEMORY[0x1895F89C0];
  if (+[PLModelingUtilities internalBuild](&OBJC_CLASS___PLModelingUtilities, "internalBuild"))
  {
    [MEMORY[0x189603F50] date];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 timeIntervalSince1970];
    double v21 = v20;

    v33[0] = @"time";
    [MEMORY[0x189607968] numberWithDouble:v21];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v32;
    v33[1] = @"clientID";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a1];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v31;
    v33[2] = @"attributeID";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a2];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v22;
    v33[3] = @"attributeName";
    [NSString stringWithUTF8String:a10];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v23;
    v33[4] = @"value";
    [NSString stringWithUTF8String:a3];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34[4] = v24;
    v33[5] = @"Probability";
    [MEMORY[0x189607968] numberWithDouble:a6];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34[5] = v25;
    v33[6] = @"PT";
    [MEMORY[0x189607968] numberWithDouble:a7];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34[6] = v26;
    v33[7] = @"BON";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a4];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34[7] = v27;
    v33[8] = @"reason";
    [NSString stringWithUTF8String:a5];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34[8] = v28;
    v33[9] = @"ableID";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a9];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33[10] = @"BLMLogType";
    v34[9] = v29;
    v34[10] = &unk_189EA4448;
    [MEMORY[0x189603F68] dictionaryWithObjects:v34 forKeys:v33 count:11];
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogRegisteredEvent(24LL, @"BLMNotifyDuetEvent", v30);
  }

void PLBatteryLifeMonitorLogCoreDuetEvent( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  v36[13] = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603F50] date];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 timeIntervalSince1970];
  double v20 = v19;

  v35[0] = @"time";
  [MEMORY[0x189607968] numberWithDouble:v20];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v34;
  v35[1] = @"clientID";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a1];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v33;
  v35[2] = @"attributeID";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a2];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v32;
  v35[3] = @"attributeName";
  [NSString stringWithUTF8String:a11];
  double v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v21;
  v35[4] = @"updateType";
  [MEMORY[0x189607968] numberWithShort:a3];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v22;
  v35[5] = @"sequenceNumber";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a4];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v23;
  v35[6] = @"eventType";
  [MEMORY[0x189607968] numberWithShort:a5];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v24;
  v35[7] = @"value";
  [NSString stringWithUTF8String:a6];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v25;
  v35[8] = @"cellin";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a7];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[8] = v26;
  v35[9] = @"cellout";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a8];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v36[9] = v27;
  v35[10] = @"wifiin";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a9];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[10] = v28;
  v35[11] = @"wifiout";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a10];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[12] = @"BLMLogType";
  v36[11] = v29;
  v36[12] = &unk_189EA4460;
  [MEMORY[0x189603F68] dictionaryWithObjects:v36 forKeys:v35 count:13];
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent(24LL, @"BLMNotifyDuetEvent", v30);
}

void PLBatteryLifeMonitorLogCoreDuetPredictionEvents( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, float a8)
{
  v31[10] = *MEMORY[0x1895F89C0];
  if (+[PLModelingUtilities internalBuild](&OBJC_CLASS___PLModelingUtilities, "internalBuild"))
  {
    [MEMORY[0x189603F50] date];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 timeIntervalSince1970];
    double v18 = v17;

    objc_msgSend(MEMORY[0x189607968], "numberWithDouble:", v18, @"time");
    double v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v19;
    v30[1] = @"prediction_c_a";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a1];
    double v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v20;
    v30[2] = @"prediction_c_b";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a2];
    double v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v21;
    v30[3] = @"prediction_c_c";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v22;
    v30[4] = @"prediction_b1";
    [MEMORY[0x189607968] numberWithBool:a4];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[4] = v23;
    v30[5] = @"prediction_b2";
    [MEMORY[0x189607968] numberWithBool:a5];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31[5] = v24;
    v30[6] = @"prediction_r2";
    *(float *)&double v25 = a8;
    [MEMORY[0x189607968] numberWithFloat:v25];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[6] = v26;
    v30[7] = @"ableID";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a6];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[7] = v27;
    v30[8] = @"selectedModel";
    [NSString stringWithUTF8String:a7];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30[9] = @"BLMLogType";
    v31[8] = v28;
    v31[9] = &unk_189EA4478;
    [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:v30 count:10];
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogRegisteredEvent(24LL, @"BLMNotifyDuetEvent", v29);
  }

id PLBatteryLifeMonitorGenericDuetQuery()
{
  v4[3] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x189604A58];
  v3[0] = @"BLMEnergyForDuet";
  v3[1] = @"BLMEnergyReferenceDate";
  [MEMORY[0x189603F50] date];
  os_log_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2] = @"BLMBatteryCapacity";
  v4[1] = v0;
  v4[2] = &unk_189EA4490;
  [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:v3 count:3];
  double v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id PLBatteryLifeMonitorReportEnergyDuet(void *a1)
{
  v13[3] = *MEMORY[0x1895F89C0];
  id v1 = a1;
  PLFDefaultsValueForKey();
  double v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    NSLog(@"Duet to powerlog call is disabled, returning 0");
    v13[0] = MEMORY[0x189604A58];
    v12[0] = @"BLMEnergyForDuet";
    v12[1] = @"BLMEnergyReferenceDate";
    [MEMORY[0x189603F50] date];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v4;
    v12[2] = @"BLMBatteryCapacity";
    v5 = (void *)MEMORY[0x189607968];
    +[PLModelingUtilities defaultBatteryEnergyCapacity]( &OBJC_CLASS___PLModelingUtilities,  "defaultBatteryEnergyCapacity");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:3];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v10[0] = @"BLMEnergyForDuet";
    v8 = v1;
    if (!v1)
    {
      [MEMORY[0x189603FE8] null];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v10[1] = @"BLMLogType";
    v11[0] = v8;
    v11[1] = &unk_189EA4430;
    [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:2];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1) {

    }
    PLBatteryLifeMonitorGenericDuetQuery();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t PLBatteryLifeMonitorReportCumulativeTotalDiscretionaryEnergyCoreDuet()
{
  return PLQueryRegistered(24, @"BLMReportEnergyDuet", 0LL);
}

id PLBatteryLifeMonitorReportEnergyCoreDuet(void *a1)
{
  v13[3] = *MEMORY[0x1895F89C0];
  id v1 = a1;
  PLFDefaultsValueForKey();
  double v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    NSLog(@"Duet to powerlog call is disabled, returning 0");
    v13[0] = MEMORY[0x189604A58];
    v12[0] = @"BLMEnergyForDuet";
    v12[1] = @"BLMEnergyReferenceDate";
    [MEMORY[0x189603F50] date];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v4;
    v12[2] = @"BLMBatteryCapacity";
    v5 = (void *)MEMORY[0x189607968];
    +[PLModelingUtilities defaultBatteryEnergyCapacity]( &OBJC_CLASS___PLModelingUtilities,  "defaultBatteryEnergyCapacity");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:3];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v10[0] = @"BLMEnergyForDuet";
    v8 = v1;
    if (!v1)
    {
      [MEMORY[0x189603FE8] null];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v10[1] = @"BLMLogType";
    v11[0] = v8;
    v11[1] = &unk_189EA4460;
    [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:2];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1) {

    }
    PLBatteryLifeMonitorGenericDuetQuery();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

id PLBatteryLifeMonitorReportBatteryCapacityForCoreDuet()
{
  void v11[2] = *MEMORY[0x1895F89C0];
  PLFDefaultsValueForKey();
  os_log_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  int v1 = [v0 BOOLValue];

  if (v1)
  {
    NSLog(@"Duet to powerlog call is disabled, returning 0");
    v10[0] = @"BLMEnergyReferenceDate";
    [MEMORY[0x189603F50] date];
    double v2 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = @"BLMBatteryCapacity";
    v11[0] = v2;
    int v3 = (void *)MEMORY[0x189607968];
    +[PLModelingUtilities defaultBatteryEnergyCapacity]( &OBJC_CLASS___PLModelingUtilities,  "defaultBatteryEnergyCapacity");
    objc_msgSend(v3, "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v4;
    [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:2];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v8 = @"BLMBatteryCapacity";
    v6 = (void *)MEMORY[0x189607968];
    +[PLModelingUtilities defaultBatteryEnergyCapacity]( &OBJC_CLASS___PLModelingUtilities,  "defaultBatteryEnergyCapacity");
    objc_msgSend(v6, "numberWithDouble:");
    double v2 = (void *)objc_claimAutoreleasedReturnValue();
    double v9 = v2;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t PLBatteryLifeMonitorReportDiscretionaryBudgetForDuet()
{
  return +[PLModelingUtilities duetDiscretionaryBudget](&OBJC_CLASS___PLModelingUtilities, "duetDiscretionaryBudget");
}

id PLBuildUsageSnapshot()
{
  return (id)objc_opt_new();
}

id PLBuildEnergyBucket()
{
  os_log_t v0 = (void *)objc_opt_new();
  [v0 setLevel:1];
  return v0;
}

id PLBuildEnergyBucketTillNow()
{
  os_log_t v0 = (void *)objc_opt_new();
  int v1 = (void *)objc_opt_new();
  [v1 setLevel:1];

  return v1;
}

void __didReceiveNotification_block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if ([*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.quickEnergySnapshots"])
  {
    if ([*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.queryPowerlog"])
    {
      if ([*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.generateEnergyReport"])
      {
        if (![*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.discretionaryIntervals"])
        {
          PLLogDiscretionaryEnergyMonitor();
          v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v23 = 0;
            _os_log_impl(&dword_186654000, v7, OS_LOG_TYPE_INFO, "DEBUG OUTPUT: Discretionary Intervals: ", v23, 2u);
          }

          [v2 intervalManager];
          int v3 = (void *)objc_claimAutoreleasedReturnValue();
          [v3 logDiscretionaryIntervals];
          goto LABEL_36;
        }

        if (![*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.lastPowerlogEnergy"])
        {
          [v2 lastPowerlogResponse];
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          [v2 getPowerlogEnergySum:v8];
          double v10 = v9 * 1000.0;

          [MEMORY[0x189607968] numberWithDouble:v10];
          int v3 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = @"com.apple.energybudgetingdebug.lastPowerlogEnergy";
          goto LABEL_35;
        }

        if (![*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.lastPowerlogTimestamp"])
        {
          [v2 powerlogTimestampLast];
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 timeIntervalSince1970];
          double v14 = v13;

          [MEMORY[0x189607968] numberWithDouble:v14];
          int v3 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = @"com.apple.energybudgetingdebug.lastPowerlogTimestamp";
          goto LABEL_35;
        }

        if ([*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.chargingStatus"])
        {
          if ([*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.lastReportedTotalEnergy"])
          {
            if ([*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.lastReportedCPUEnergy"])
            {
              if ([*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.lastReportedNetworkEnergy"])
              {
                if ([*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.accumulatedCPUEnergy"])
                {
                  if ([*(id *)(a1 + 40) caseInsensitiveCompare:@"com.apple.energybudgetingdebug.accumulatedNetworkEnergy"])
                  {
                    PLLogDiscretionaryEnergyMonitor();
                    int v3 = (void *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR)) {
                      __didReceiveNotification_block_invoke_cold_1();
                    }
                    goto LABEL_36;
                  }

                  [v2 accumulatedNetworkEnergy];
                  [MEMORY[0x189607968] numberWithDouble:v22 * 1000.0];
                  int v3 = (void *)objc_claimAutoreleasedReturnValue();
                  v11 = @"com.apple.energybudgetingdebug.accumulatedNetworkEnergy";
                }

                else
                {
                  [v2 accumulatedCPUEnergy];
                  [MEMORY[0x189607968] numberWithDouble:v21 * 1000.0];
                  int v3 = (void *)objc_claimAutoreleasedReturnValue();
                  v11 = @"com.apple.energybudgetingdebug.accumulatedCPUEnergy";
                }
              }

              else
              {
                [v2 lastReportedNetworkEnergy];
                [MEMORY[0x189607968] numberWithDouble:v20 * 1000.0];
                int v3 = (void *)objc_claimAutoreleasedReturnValue();
                v11 = @"com.apple.energybudgetingdebug.lastReportedNetworkEnergy";
              }
            }

            else
            {
              [v2 lastReportedCPUEnergy];
              [MEMORY[0x189607968] numberWithDouble:v19 * 1000.0];
              int v3 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = @"com.apple.energybudgetingdebug.lastReportedCPUEnergy";
            }
          }

          else
          {
            [v2 lastReportedTotalEnergy];
            [MEMORY[0x189607968] numberWithDouble:v18 * 1000.0];
            int v3 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = @"com.apple.energybudgetingdebug.lastReportedTotalEnergy";
          }

LABEL_35:
          [v2 setStateForNotification:v11 withState:v3];
LABEL_36:

          goto LABEL_37;
        }

        v15 = (void *)MEMORY[0x189607968];
        objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v2, "isCharging"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "intValue"));
        double v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v2 setStateForNotification:@"com.apple.energybudgetingdebug.chargingStatus" withState:v17];
      }

      else
      {
        PLLogDiscretionaryEnergyMonitor();
        v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_186654000, v6, OS_LOG_TYPE_INFO, "DEBUG OUTPUT: Generating energyReport ...: ", v24, 2u);
        }

        [v2 generateEnergyReport];
      }
    }

    else
    {
      PLLogDiscretionaryEnergyMonitor();
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v25 = 0;
        _os_log_impl( &dword_186654000,  v5,  OS_LOG_TYPE_INFO,  "DEBUG OUTPUT: Querying powerlog for discretionary energy ...: ",  v25,  2u);
      }

      [v2 queryPowerlogForDiscretionaryEnergy];
    }
  }

  else
  {
    PLLogDiscretionaryEnergyMonitor();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_186654000, v4, OS_LOG_TYPE_INFO, "DEBUG OUTPUT: Quick energy snapshots: ", buf, 2u);
    }

    [v2 logQuickEnergySnapshots];
  }

LABEL_37:
}

void OUTLINED_FUNCTION_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void OUTLINED_FUNCTION_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_6(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_10(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void OUTLINED_FUNCTION_12( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_13(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_14( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_18665F614( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id logHandle()
{
  if (logHandle_onceToken != -1) {
    dispatch_once(&logHandle_onceToken, &__block_literal_global_26);
  }
  return (id)logHandle__logHandle;
}

void __logHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.PerfPowerServices", "ClientRegistration");
  int v1 = (void *)logHandle__logHandle;
  logHandle__logHandle = (uint64_t)v0;
}

PPSTelemetryIdentifier *PerfPowerTelemetryCreateIdentifier(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 UTF8String];
  id v6 = v4;
  uint64_t v7 = [v6 UTF8String];

  return +[PPSClientDonation createIdentifierForSubsystem:category:]( &OBJC_CLASS___PPSClientDonation,  "createIdentifierForSubsystem:category:",  v5,  v7);
}

uint64_t PerfPowerTelemetrySendEvent(uint64_t a1, uint64_t a2)
{
  return +[PPSClientDonation sendEventWithIdentifier:payload:]( &OBJC_CLASS___PPSClientDonation,  "sendEventWithIdentifier:payload:",  a1,  a2);
}

PPSTelemetryIdentifier *perfpowertelemetry_create_identifier(uint64_t a1, uint64_t a2)
{
  return +[PPSClientDonation createIdentifierForSubsystem:category:]( &OBJC_CLASS___PPSClientDonation,  "createIdentifierForSubsystem:category:",  a1,  a2);
}

uint64_t perfpowertelemetry_send_event(uint64_t a1, uint64_t a2)
{
  return +[PPSClientDonation sendEventWithIdentifier:payload:]( &OBJC_CLASS___PPSClientDonation,  "sendEventWithIdentifier:payload:",  a1,  a2);
}

void sub_186662318( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

LABEL_32:
  return v14;
}

LABEL_38:
            goto LABEL_31;
          }

          double v25 = 1;
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              -[PLClientLogAggregator logHandle](v24, "logHandle");
              double v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
                -[PLClientLogAggregator _isEventInputValid:configuration:].cold.3();
              }
              goto LABEL_38;
            }
          }
        }
      }

      v11 = -[os_log_s countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v26,  v36,  16LL);
      if (v11) {
        continue;
      }
      break;
    }

    self = v24;
    if ((v25 & 1) != 0)
    {
      double v17 = 1;
      goto LABEL_32;
    }
  }

  else
  {
  }

  -[PLClientLogAggregator logHandle](self, "logHandle");
  double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PLClientLogAggregator _isEventInputValid:configuration:].cold.1(v9);
  }
LABEL_31:

  double v17 = 0;
LABEL_32:

  return v17;
}

uint64_t PLLogRegisteredAggregateEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend(v8, "aggregateForClientID_async:eventName:eventDictionary:configuration:", a1, a2, a3, a4);

  return v9;
}

id __aggregationBlockForType_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (a2)
  {
    id v6 = (void *)MEMORY[0x189607968];
    [a2 floatValue];
    float v8 = v7;
    [v5 floatValue];
    *(float *)&double v10 = v8 + v9;
    [v6 numberWithFloat:v10];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v11 = v4;
  }

  v12 = v11;

  return v12;
}

id __aggregationBlockForType_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (a2)
  {
    id v6 = (void *)MEMORY[0x189607968];
    [a2 floatValue];
    float v8 = v7;
    [v5 floatValue];
    [v6 numberWithFloat:v9];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v10 = v4;
  }

  id v11 = v10;

  return v11;
}

id __aggregationBlockForType_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (a2)
  {
    id v6 = (void *)MEMORY[0x189607968];
    [a2 floatValue];
    float v8 = v7;
    [v5 floatValue];
    [v6 numberWithFloat:v9];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v10 = v4;
  }

  id v11 = v10;

  return v11;
}

id __aggregationBlockForType_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v4)
  {
    if (v5)
    {
      float v7 = (void *)MEMORY[0x189607968];
      [v4 floatValue];
      float v9 = v8;
      [v6 floatValue];
      [v7 numberWithDouble:(float)(v9 + v10) * 0.5];
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v11 = v4;
    }
  }

  else
  {
    id v11 = v5;
  }

  v12 = v11;

  return v12;
}

id logHandleBatteryUIExternalData()
{
  if (logHandleBatteryUIExternalData_onceToken != -1) {
    dispatch_once(&logHandleBatteryUIExternalData_onceToken, &__block_literal_global_3);
  }
  return (id)logHandleBatteryUIExternalData__logHandle;
}

void __logHandleBatteryUIExternalData_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.batteryui", "externaldata");
  int v1 = (void *)logHandleBatteryUIExternalData__logHandle;
  logHandleBatteryUIExternalData__logHandle = (uint64_t)v0;
}

uint64_t batteryUIHasNoteworthyInformation()
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  PLConfigureBUIQueryNoteworthyInformation();
  os_log_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  PLRunBUIQuery();
  int v1 = (void *)objc_claimAutoreleasedReturnValue();
  logHandleBatteryUIExternalData();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    float v8 = v0;
    __int16 v9 = 2112;
    float v10 = v1;
    _os_log_impl(&dword_186654000, v2, OS_LOG_TYPE_DEFAULT, "config: %@, queryResult: %@", (uint8_t *)&v7, 0x16u);
  }

  logHandleBatteryUIExternalData();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v1)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      float v8 = v1;
      _os_log_impl(&dword_186654000, v4, OS_LOG_TYPE_DEFAULT, "valid queryResult=%@", (uint8_t *)&v7, 0xCu);
    }

    [v1 objectForKeyedSubscript:@"hasNoteworthyInformation"];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = -[os_log_s BOOLValue](v4, "BOOLValue");
  }

  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      batteryUIHasNoteworthyInformation_cold_1(v4);
    }
    uint64_t v5 = 0LL;
  }

  return v5;
}

id PLLogClientLogging()
{
  if (PLLogClientLogging_onceToken != -1) {
    dispatch_once(&PLLogClientLogging_onceToken, &__block_literal_global_4);
  }
  return (id)PLLogClientLogging___logObj;
}

void __PLLogClientLogging_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.powerlog", "ClientLogging");
  int v1 = (void *)PLLogClientLogging___logObj;
  PLLogClientLogging___logObj = (uint64_t)v0;
}

void sub_186664774(_Unwind_Exception *a1)
{
}

void sub_186664A10(_Unwind_Exception *a1)
{
}

void sub_186664BCC(_Unwind_Exception *a1)
{
}

LABEL_19:
  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v49 = -[PLClientLogger permissionCache](self, "permissionCache");
      [v49 objectForKeyedSubscript:v9];
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      [v50 objectForKeyedSubscript:v10];
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      [v51 objectForKeyedSubscript:v8];
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      out_token[0] = 67109890;
      out_token[1] = v6;
      v55 = 2112;
      v56 = v8;
      v57 = 2112;
      v58 = v9;
      v59 = 2112;
      v60 = v52;
      _os_log_debug_impl( &dword_186654000,  v34,  OS_LOG_TYPE_DEBUG,  "cachePermissionForClientID: %d withKey:%@ withType:%@ - Return=%@",  (uint8_t *)out_token,  0x26u);
    }
  }
  v35 = -[PLClientLogger permissionCache](self, "permissionCache");
  [v35 objectForKeyedSubscript:v9];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v36 objectForKeyedSubscript:v10];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v37 objectForKeyedSubscript:v8];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38 == 0LL;

  if (v39)
  {
    v40 = -[PLClientLogger permissionCache](self, "permissionCache");
    [v40 objectForKeyedSubscript:v9];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    [v41 objectForKeyedSubscript:v10];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    [v42 setObject:&unk_189EA4700 forKeyedSubscript:v8];
  }
  v43 = -[PLClientLogger permissionCache](self, "permissionCache");
  [v43 objectForKeyedSubscript:v9];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  [v44 objectForKeyedSubscript:v10];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  [v45 objectForKeyedSubscript:v8];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = [v46 shortValue];

  objc_sync_exit(@"___CacheSync___");
  return v47;
}

void sub_186665110(_Unwind_Exception *a1)
{
}

void sub_186665498(_Unwind_Exception *a1)
{
}

void sub_186665618(_Unwind_Exception *a1)
{
}

LABEL_15:
  if (-[PLClientLogger batchDropMessages](self, "batchDropMessages")
    && [v14 count] >= (unint64_t)v15)
  {
    PLLogClientLogging();
    double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      [v14 lastObject];
      double v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412290;
      v27 = v21;
      _os_log_impl( &dword_186654000,  v20,  OS_LOG_TYPE_INFO,  "Hit the cache limit, dropping last event:  %@",  (uint8_t *)&v26,  0xCu);
    }

    [v14 removeLastObject];
    if ((_DWORD)v9 == 110) {
      double v22 = -[PLClientLogger batchedDropMessageCount](self, "batchedDropMessageCount");
    }
    else {
      double v22 = -[PLClientLogger batchedDropMessageCount](self, "batchedDropMessageCount") + 1;
    }
    -[PLClientLogger setBatchedDropMessageCount:](self, "setBatchedDropMessageCount:", v22);
  }

  return v21;
}

  if (([v11 isEqualToString:@"ThermalMonitor"] & 1) != 0
    || [v11 isEqualToString:@"XPCCacheFlush"])
  {
    double v22 = v19;
    AnalyticsSendEventLazy();
  }
}

LABEL_27:
  v24 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v13 copyItems:1];
  -[PLClientLogger buildMessageForClientID:withKey:withPayload:]( self,  "buildMessageForClientID:withKey:withPayload:",  v9,  v12,  v24);
  double v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"Post"];
  [v14 addObject:v25];

  objc_sync_exit(@"___BatchCacheSync___");
}
    }
  }

  return 0;
}

void sub_1866659D8(_Unwind_Exception *a1)
{
}

void sub_186665B34(_Unwind_Exception *a1)
{
}

LABEL_11:
}

    *(void *)buf = 0LL;
    *(void *)v35 = buf;
    *(void *)&v35[8] = 0x3032000000LL;
    *(void *)&v35[16] = __Block_byref_object_copy__0;
    *(void *)&v35[24] = __Block_byref_object_dispose__0;
    v36 = 0LL;
    -[PLClientLogger getWorkQueueForClientID:](self, "getWorkQueueForClientID:", v6);
    double v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __55__PLClientLogger_queryForClientID_withKey_withPayload___block_invoke;
    block[3] = &unk_189E9EF08;
    block[4] = self;
    v33 = v6;
    v30 = v8;
    v31 = v9;
    v32 = buf;
    dispatch_async_and_wait(v20, block);

    double v21 = *(id *)(*(void *)v35 + 40LL);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    PLLogClientLogging();
    double v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger queryForClientID:withKey:withPayload:].cold.1();
    }

    double v21 = 0LL;
  }

LABEL_48:
        goto LABEL_49;
      }

      if (v21)
      {
        PLLogClientLogging();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEBUG)) {
          -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.3();
        }
        v36 = 0LL;
        goto LABEL_48;
      }

LABEL_42:
      v36 = 0LL;
LABEL_49:

      goto LABEL_50;
    }

    if (v18)
    {
      PLLogClientLogging();
      double v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.2();
      }
      goto LABEL_42;
    }

LABEL_36:
    v36 = 0LL;
LABEL_50:

    goto LABEL_51;
  }

  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.1();
    }
    goto LABEL_36;
  }

  v36 = 0LL;
LABEL_51:

  return v36;
}

LABEL_30:
      goto LABEL_31;
    }

    if ([*(id *)(a1 + 48) isEqualToString:@"Query"]
      && [*(id *)(a1 + 32) clientDebug])
    {
      PLLogClientLogging();
      __int16 v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG)) {
        __68__PLClientLogger_permissionForClientID_withKey_withType_completion___block_invoke_cold_1();
      }
      goto LABEL_30;
    }
  }

LABEL_31:
}

void sub_186666DE4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_17:
}

LABEL_34:
        goto LABEL_35;
      }

      goto LABEL_35;
    }
  }

LABEL_20:
  v30 = -[PLClientLogger eventFilterSaved](self, "eventFilterSaved");
  [v30 objectForKeyedSubscript:v12];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v31 setObject:v11 forKeyedSubscript:@"lastEventDate"];
  v32 = -[PLClientLogger eventFilterSaved](self, "eventFilterSaved");
  [v32 objectForKeyedSubscript:v12];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v33 removeObjectForKey:@"bufferedEventDictionary"];
  v34 = -[PLClientLogger eventFilterSaved](self, "eventFilterSaved");
  [v34 objectForKeyedSubscript:v12];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v35 removeObjectForKey:@"bufferedEventDate"];

  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109890;
      v46 = v43;
      v47 = 2112;
      v48 = v9;
      v49 = 2112;
      v50 = v11;
      v51 = 2112;
      v52 = v10;
      _os_log_debug_impl( &dword_186654000,  v36,  OS_LOG_TYPE_DEBUG,  "(PLLogRegisteredEventFilterByInterval)  Log(%d, %@ at %@) - %@\n",  buf,  0x26u);
    }

    v29 = 0;
    goto LABEL_34;
  }

  v29 = 0;
LABEL_35:

  objc_sync_exit(@"___sFilterByIntervalBufferSync___");
  return v29;
}

void sub_18666775C(_Unwind_Exception *a1)
{
}

void sub_186667C0C(_Unwind_Exception *a1)
{
}

void sub_186667F00(_Unwind_Exception *a1)
{
}

void sub_186668250(_Unwind_Exception *a1)
{
}

void sub_1866682C4(_Unwind_Exception *a1)
{
}

void sub_1866683A0(_Unwind_Exception *a1)
{
}

void sub_1866684FC(_Unwind_Exception *a1)
{
}

void sub_18666862C(_Unwind_Exception *a1)
{
}

void sub_186668968( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t PLShouldLogRegisteredEvent(uint64_t a1, void *a2)
{
  if (+[PLClientLogger isMessageOnDeviceDisabled](&OBJC_CLASS___PLClientLogger, "isMessageOnDeviceDisabled")) {
    return 0LL;
  }
  id v5 = a2;
  +[PLClientLogger sharedInstance](&OBJC_CLASS___PLClientLogger, "sharedInstance");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 blockedPermissionForClientID:a1 withKey:v5 withType:@"Post" withTimeout:0];

  +[PLClientLogger sharedInstance](&OBJC_CLASS___PLClientLogger, "sharedInstance");
  float v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = [v8 clientDebug];

  if (v7)
  {
    if (!v9) {
      return 1LL;
    }
    PLLogClientLogging();
    float v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      PLShouldLogRegisteredEvent_cold_2();
    }
    uint64_t v4 = 1LL;
    goto LABEL_12;
  }

  if (v9)
  {
    PLLogClientLogging();
    float v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      PLShouldLogRegisteredEvent_cold_1();
    }
    uint64_t v4 = 0LL;
LABEL_12:

    return v4;
  }

  return 0LL;
}

uint64_t PLShouldLogEvent(void *a1)
{
  if (+[PLClientLogger isMessageOnDeviceDisabled](&OBJC_CLASS___PLClientLogger, "isMessageOnDeviceDisabled")) {
    return 0LL;
  }
  +[PLClientLogger sharedInstance](&OBJC_CLASS___PLClientLogger, "sharedInstance");
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 blockedPermissionForClientID:0 withKey:a1 withType:@"Post" withTimeout:0];

  +[PLClientLogger sharedInstance](&OBJC_CLASS___PLClientLogger, "sharedInstance");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 clientDebug];

  if (v3 == 1)
  {
    if (!v5) {
      return 1LL;
    }
    PLLogClientLogging();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      PLShouldLogEvent_cold_1();
    }
    uint64_t v7 = 1LL;
    goto LABEL_11;
  }

  if (!v5) {
    return 0LL;
  }
  PLLogClientLogging();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    PLShouldLogEvent_cold_2();
  }
  uint64_t v7 = 0LL;
LABEL_11:

  return v7;
}

void PLLogEvent(void *a1, void *a2)
{
  if (!+[PLClientLogger isMessageOnDeviceDisabled](&OBJC_CLASS___PLClientLogger, "isMessageOnDeviceDisabled")) {
    PLLogRegisteredEvent(0LL, a1, a2);
  }
}

void PLLogRegisteredEvent(uint64_t a1, void *a2, void *a3)
{
  if (!+[PLClientLogger isMessageOnDeviceDisabled](&OBJC_CLASS___PLClientLogger, "isMessageOnDeviceDisabled"))
  {
    id v6 = a3;
    id v7 = a2;
    +[PLClientLogger sharedInstance](&OBJC_CLASS___PLClientLogger, "sharedInstance");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v8 logForClientID:a1 withKey:v7 withPayload:v6];
  }

void PLLogTimeSensitiveRegisteredEvent(uint64_t a1, void *a2, void *a3)
{
  if (!+[PLClientLogger isMessageOnDeviceDisabled](&OBJC_CLASS___PLClientLogger, "isMessageOnDeviceDisabled"))
  {
    id v6 = a2;
    id v9 = (id)[a3 mutableCopy];
    [MEMORY[0x189603F50] date];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v7 forKey:@"__pl_internal_timeSensitiveSystemDate"];

    +[PLClientLogger sharedInstance](&OBJC_CLASS___PLClientLogger, "sharedInstance");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 logForClientID:a1 withKey:v6 withPayload:v9];
  }

void PLLogRegisteredEventFilterByInterval(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  if (!+[PLClientLogger isMessageOnDeviceDisabled](&OBJC_CLASS___PLClientLogger, "isMessageOnDeviceDisabled")
    && a2
    && a3)
  {
    id v12 = a2;
    id v8 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:a3 copyItems:1];
    +[PLClientLogger sharedInstance](&OBJC_CLASS___PLClientLogger, "sharedInstance");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = [v9 shouldLogNowForClientID:a1 withKey:v12 withPayload:v8 withFilterInterval:a4];

    if (v10 == 1)
    {
      +[PLClientLogger sharedInstance](&OBJC_CLASS___PLClientLogger, "sharedInstance");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 logLaterForClientID:a1 withKey:v12 withFilterInterval:a4];
    }

    else
    {
      if (v10)
      {
LABEL_10:

        return;
      }

      +[PLClientLogger sharedInstance](&OBJC_CLASS___PLClientLogger, "sharedInstance");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 logWithCurrentDateForClientID:a1 withKey:v12 withPayload:v8];
    }

    goto LABEL_10;
  }

uint64_t PLQueryRegistered(int a1, __CFString *a2, void *a3)
{
  if (!+[PLClientLogger isMessageOnDeviceDisabled](&OBJC_CLASS___PLClientLogger, "isMessageOnDeviceDisabled"))
  {
    id v7 = @"unknownQuery;";
    if (a2) {
      id v7 = a2;
    }
    id v8 = (void *)NSString;
    id v9 = v7;
    id v10 = a3;
    uint64_t v11 = a2;
    [v8 stringWithFormat:@"com.apple.PLQueryRegistered.%d.%@.start", a1, v9];
    objc_claimAutoreleasedReturnValue();
    PLADClientAddValueForScalarKey();
    [NSString stringWithFormat:@"com.apple.PLQueryRegistered.%d.%@.queryTime", a1, v9];
    objc_claimAutoreleasedReturnValue();
    PLADMonotonicTimeGetCurrent();
  }

  return 0LL;
}

void PLTalkToPowerlogHelper(int a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setTalkToPowerlogHelper:a1 != 0];
}

void PLForceBatching(int a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setForceBatching:a1 != 0];
}

void PLBatchDropMessages(int a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setBatchDropMessages:a1 != 0];
}

void PLMovePowerlogsToCR()
{
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v0 = 0;
    _os_log_impl( &dword_186654000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Starting powerlog copy to Crash Reporter",  v0,  2u);
  }

  PLCrashMoverCopyPowerlog();
}

void OUTLINED_FUNCTION_1_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void OUTLINED_FUNCTION_8_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void OUTLINED_FUNCTION_10_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_12_0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

id logHandle_0()
{
  if (logHandle_onceToken_0 != -1) {
    dispatch_once(&logHandle_onceToken_0, &__block_literal_global_5);
  }
  return (id)logHandle__logHandle_0;
}

void __logHandle_block_invoke_0()
{
  os_log_t v0 = os_log_create("com.apple.PerfPowerServices", "ClientDonation");
  int v1 = (void *)logHandle__logHandle_0;
  logHandle__logHandle_0 = (uint64_t)v0;
}

  ;
}

void OUTLINED_FUNCTION_1_1(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

double PLBatteryGaugeVersion()
{
  return 1.0;
}

id queryPowerlog(void *a1)
{
  id v1 = a1;
  PLTalkToPowerlogHelper(1);
  id v2 = (void *)PLQueryRegistered(48, @"PLBatteryGaugeQuery", v1);

  return v2;
}

uint64_t PLBatteryGaugeStartTracing(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 timeIntervalSince1970];
  double v8 = v7;

  [MEMORY[0x189603FC8] dictionary];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithDouble:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setObject:v10 forKey:@"time"];

  [v9 setObject:&unk_189EA4718 forKey:@"battery_gauge_event"];
  if ((_DWORD)a1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v11 forKey:@"pid"];
  }

  if (a2)
  {
    [NSString stringWithUTF8String:a2];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v12 forKey:@"bundle_id"];
  }

  if (a3)
  {
    [NSString stringWithUTF8String:a3];
    double v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v13 forKey:@"process_name"];
  }

  queryPowerlog(v9);
  double v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 objectForKeyedSubscript:&unk_189EA4730];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 objectForKeyedSubscript:@"return_value"];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 intValue];

  return v17;
}

uint64_t PLBatteryGaugeStopTracing(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 timeIntervalSince1970];
  double v8 = v7;

  [MEMORY[0x189603FC8] dictionary];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithDouble:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setObject:v10 forKey:@"time"];

  [v9 setObject:&unk_189EA4748 forKey:@"battery_gauge_event"];
  if ((_DWORD)a1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v11 forKey:@"pid"];
  }

  if (a2)
  {
    [NSString stringWithUTF8String:a2];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v12 forKey:@"bundle_id"];
  }

  if (a3)
  {
    [NSString stringWithUTF8String:a3];
    double v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v13 forKey:@"process_name"];
  }

  queryPowerlog(v9);
  double v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 objectForKeyedSubscript:&unk_189EA4730];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 objectForKeyedSubscript:@"return_value"];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 intValue];

  return v17;
}

uint64_t PLBatteryGaugePauseTracing(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 timeIntervalSince1970];
  double v8 = v7;

  [MEMORY[0x189603FC8] dictionary];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithDouble:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setObject:v10 forKey:@"time"];

  [v9 setObject:&unk_189EA4760 forKey:@"battery_gauge_event"];
  if ((_DWORD)a1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v11 forKey:@"pid"];
  }

  if (a2)
  {
    [NSString stringWithUTF8String:a2];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v12 forKey:@"bundle_id"];
  }

  if (a3)
  {
    [NSString stringWithUTF8String:a3];
    double v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v13 forKey:@"process_name"];
  }

  queryPowerlog(v9);
  double v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 objectForKeyedSubscript:&unk_189EA4730];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 objectForKeyedSubscript:@"return_value"];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 intValue];

  return v17;
}

uint64_t PLBatteryGaugeResumeTracing(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 timeIntervalSince1970];
  double v8 = v7;

  [MEMORY[0x189603FC8] dictionary];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithDouble:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setObject:v10 forKey:@"time"];

  [v9 setObject:&unk_189EA4778 forKey:@"battery_gauge_event"];
  if ((_DWORD)a1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", a1);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v11 forKey:@"pid"];
  }

  if (a2)
  {
    [NSString stringWithUTF8String:a2];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v12 forKey:@"bundle_id"];
  }

  if (a3)
  {
    [NSString stringWithUTF8String:a3];
    double v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v13 forKey:@"process_name"];
  }

  queryPowerlog(v9);
  double v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 objectForKeyedSubscript:&unk_189EA4730];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 objectForKeyedSubscript:@"return_value"];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 intValue];

  return v17;
}

uint64_t PLBatteryGaugeStartTracingForPid(uint64_t a1)
{
  return PLBatteryGaugeStartTracing(a1, 0LL, 0LL);
}

uint64_t PLBatteryGaugeStartTracingForBundleId(uint64_t a1)
{
  return PLBatteryGaugeStartTracing(0LL, a1, 0LL);
}

uint64_t PLBatteryGaugeStartTracingForProcessName(uint64_t a1)
{
  return PLBatteryGaugeStartTracing(0LL, 0LL, a1);
}

uint64_t PLBatteryGaugeStopTracingForPid(uint64_t a1)
{
  return PLBatteryGaugeStopTracing(a1, 0LL, 0LL);
}

uint64_t PLBatteryGaugeStopTracingForBundleId(uint64_t a1)
{
  return PLBatteryGaugeStopTracing(0LL, a1, 0LL);
}

uint64_t PLBatteryGaugeStopTracingForProcessName(uint64_t a1)
{
  return PLBatteryGaugeStopTracing(0LL, 0LL, a1);
}

uint64_t PLBatteryGaugePauseTracingForPid(uint64_t a1)
{
  return PLBatteryGaugePauseTracing(a1, 0LL, 0LL);
}

uint64_t PLBatteryGaugePauseTracingForBundleId(uint64_t a1)
{
  return PLBatteryGaugePauseTracing(0LL, a1, 0LL);
}

uint64_t PLBatteryGaugePauseTracingForProcessName(uint64_t a1)
{
  return PLBatteryGaugePauseTracing(0LL, 0LL, a1);
}

uint64_t PLBatteryGaugeResumeTracingForPid(uint64_t a1)
{
  return PLBatteryGaugeResumeTracing(a1, 0LL, 0LL);
}

uint64_t PLBatteryGaugeResumeTracingForBundleId(uint64_t a1)
{
  return PLBatteryGaugeResumeTracing(0LL, a1, 0LL);
}

uint64_t PLBatteryGaugeResumeTracingForProcessName(uint64_t a1)
{
  return PLBatteryGaugeResumeTracing(0LL, 0LL, a1);
}

id PLBatteryGaugeGetSnapshot()
{
  return queryPowerlog(&unk_189EA4AD8);
}

id getContainerPath()
{
  if (getContainerPath_onceToken != -1) {
    dispatch_once(&getContainerPath_onceToken, &__block_literal_global_6);
  }
  return (id)getContainerPath_containerPath;
}

void __getContainerPath_block_invoke()
{
  os_log_t v0 = (void *)container_create_or_lookup_system_group_paths();
  if (v0)
  {
    id v1 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v2 = [v1 objectForKeyedSubscript:@"systemgroup.com.apple.powerlog"];
    int v3 = (void *)getContainerPath_containerPath;
    getContainerPath_containerPath = v2;
  }
}

id shortUUIDString()
{
  os_log_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 UUIDString];
  id v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)[v1 length] >= 8)
  {
    objc_msgSend(v1, "substringFromIndex:", objc_msgSend(v1, "length") - 8);
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  return v2;
}

id dateFormatter()
{
  id v0 = objc_alloc_init(MEMORY[0x189607848]);
  id v1 = (void *)[objc_alloc(MEMORY[0x189603F90]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v0 setDateFormat:@"yyyy-MM-dd_HH-mm"];
  [MEMORY[0x189604020] systemTimeZone];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 setTimeZone:v2];

  [v1 objectForKey:*MEMORY[0x189603A78]];
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 setCalendar:v3];

  [v0 setLocale:v1];
  return v0;
}

uint64_t PLMarkFileAsPurgeable(void *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v9 = a2 | 0x10005;
  id v3 = a1;
  int v4 = open((const char *)[v3 UTF8String], 0);
  if (v4 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      PLMarkFileAsPurgeable_cold_1();
    }
    goto LABEL_7;
  }

  int v5 = v4;
  int v6 = ffsctl(v4, 0xC0084A44uLL, &v9, 0);
  close(v5);
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      PLMarkFileAsPurgeable_cold_2((uint64_t)v3, &v9, v6);
    }
LABEL_7:
    uint64_t v7 = 0LL;
    goto LABEL_11;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = v3;
    __int16 v12 = 2048;
    uint64_t v13 = a2;
    _os_log_impl( &dword_186654000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Client Framework -- Marked %@ purgeable with urgency: %llu",  buf,  0x16u);
  }

  uint64_t v7 = 1LL;
LABEL_11:

  return v7;
}

id PLCopyDB(void *a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v44 = v3;
    __int16 v45 = 2112;
    id v46 = v4;
    _os_log_impl( &dword_186654000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Starting copy of dB: %@ to dst: %@\n",  buf,  0x16u);
  }

  int v5 = (void *)objc_opt_new();
  id v6 = v4;
  int v7 = sqlite3_open((const char *)[v6 UTF8String], &ppDb);
  if (v7)
  {
    PLADClientAddValueForScalarKey(@"com.apple.rawPowerlogRetrieval.failOpenDst", 1LL);
    BOOL v8 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v8) {
      PLCopyDB_cold_3(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    uint64_t v16 = 2LL;
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  id v17 = v3;
  if (sqlite3_open_v2((const char *)[v17 UTF8String], &v41, 1, 0))
  {
    uint64_t v16 = 1LL;
    PLADClientAddValueForScalarKey(@"com.apple.rawPowerlogRetrieval.failOpenSrc", 1LL);
    BOOL v18 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v18)
    {
      PLCopyDB_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
      uint64_t v16 = 1LL;
    }
  }

  else if (!v7)
  {
    if (sqlite3_file_control(ppDb, 0LL, 102, v41))
    {
      PLADClientAddValueForScalarKey(@"com.apple.rawPowerlogRetrieval.failCopy", 1LL);
      BOOL v26 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v26) {
        PLCopyDB_cold_1(v26, v27, v28, v29, v30, v31, v32, v33);
      }
      uint64_t v16 = 3LL;
    }

    else
    {
      uint64_t v16 = 0LL;
    }
  }

  sqlite3_exec(ppDb, "pragma journal_mode=delete", 0LL, 0LL, 0LL);
  if (v41) {
    sqlite3_close(v41);
  }
  if (ppDb) {
    sqlite3_close(ppDb);
  }
  [MEMORY[0x1896078A8] defaultManager];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithFormat:@"%@-shm", v6];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v34 removeItemAtPath:v35 error:0];

  if (!(_DWORD)v16)
  {
    [v5 setObject:v6 forKey:@"path"];
    v36 = getpwnam("mobile");
    id v37 = v6;
    int v38 = chown((const char *)[v37 fileSystemRepresentation], v36->pw_uid, v36->pw_gid);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = v38;
      _os_log_impl( &dword_186654000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "PLCopyPowerlog file chown success = %d",  buf,  8u);
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_186654000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "PLCopyPowerlog file copy status success",  buf,  2u);
    }
  }

  [MEMORY[0x189607968] numberWithUnsignedInt:v16];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v39 forKey:@"status"];

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v5;
    _os_log_impl(&dword_186654000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "PLCopyPowerlog output: %@", buf, 0xCu);
  }

  return v5;
}

double PLGetPowerlogDuration(void *a1)
{
  uint64_t v6 = 0LL;
  int v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  id v1 = a1;
  if (!sqlite3_open((const char *)[v1 UTF8String], &ppDb))
  {
    id v2 = [NSString stringWithFormat:@"SELECT MAX(timestamp) - MIN(timestamp) from PLBatteryAgent_EventBackward_Battery"];;
    [v2 UTF8String];
    sqlite3_exec_b();
  }

  if (ppDb) {
    sqlite3_close(ppDb);
  }
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_18666A894( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __PLGetPowerlogDuration_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = sqlite3_column_double(a2, 0);
  return 0LL;
}

id PLCopyQuarantineDB(void *a1)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  getContainerPath();
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringByAppendingString:@"/Library/BatteryLife/CurrentPowerlog.PLSQL"];
  double v3 = (void *)objc_claimAutoreleasedReturnValue();

  double v4 = PLGetPowerlogDuration(v3);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v49 = v4;
    _os_log_impl( &dword_186654000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "PLCopyPowerlog: main log duration = %f",  buf,  0xCu);
  }

  if (v4 < 21600.0)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_186654000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "PLCopyPowerlog: Powerlog is short! Looking in quarantine...",  buf,  2u);
    }

    getContainerPath();
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 stringByAppendingString:@"/Library/BatteryLife/Quarantine/"];

    [MEMORY[0x189603F50] distantPast];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    [MEMORY[0x1896078A8] defaultManager];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)v6;
    [v8 contentsOfDirectoryAtPath:v6 error:0];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    id obj = v9;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      v36 = v3;
      id v37 = v1;
      int v38 = 0LL;
      v39 = 0LL;
      uint64_t v12 = *(void *)v44;
      uint64_t v13 = @"PLSQL";
      do
      {
        uint64_t v14 = 0LL;
        uint64_t v41 = v11;
        do
        {
          if (*(void *)v44 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v43 + 1) + 8 * v14);
          [v15 pathExtension];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          int v17 = [v16 isEqualToString:v13];

          if (v17)
          {
            BOOL v18 = v13;
            [v40 stringByAppendingString:v15];
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
            [MEMORY[0x1896078A8] defaultManager];
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
            [v20 attributesOfItemAtPath:v19 error:0];
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

            [v21 fileModificationDate];
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 laterDate:v7];
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v24 = v7;
            int v25 = [v23 isEqualToDate:v22];

            if (v25)
            {
              id v26 = v19;

              id v27 = v15;
              id v7 = v22;

              int v38 = v26;
              v39 = v27;
            }

            else
            {
              id v7 = v24;
            }

            uint64_t v13 = v18;
            uint64_t v11 = v41;
          }

          ++v14;
        }

        while (v11 != v14);
        uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      }

      while (v11);
      uint64_t v28 = v7;

      uint64_t v29 = v38;
      if (!v38)
      {
        v34 = 0LL;
        double v3 = v36;
        id v1 = v37;
        uint64_t v30 = v39;
LABEL_30:

        goto LABEL_31;
      }

      double v3 = v36;
      id v1 = v37;
      uint64_t v30 = v39;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v49 = *(double *)&v38;
        _os_log_impl( &dword_186654000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "PLCopyPowerlog: quarantineSrcPath = %@",  buf,  0xCu);
      }

      [v37 stringByAppendingPathComponent:v39];
      id obj = (id)objc_claimAutoreleasedReturnValue();
      PLCopyDB(v38, obj);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = (void *)[v31 mutableCopy];

      [v32 objectForKeyedSubscript:@"status"];
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {

        v34 = 0LL;
      }

      else
      {
        [v32 objectForKeyedSubscript:@"path"];
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          [v32 objectForKeyedSubscript:@"path"];
          v34 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }

    else
    {
      uint64_t v28 = v7;
      uint64_t v29 = 0LL;
      uint64_t v30 = 0LL;
      v34 = 0LL;
    }

    goto LABEL_30;
  }

  v34 = 0LL;
LABEL_31:

  return v34;
}

void *PLCopyPowerlog(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1 || -[__CFString isEqualToString:](v1, "isEqualToString:", &stru_189E9F260))
  {

    id v2 = @"/var/mobile/Library/Logs/CrashReporter/";
  }

  dateFormatter();
  double v3 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] date];
  double v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringFromDate:v4];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = (void *)NSString;
  shortUUIDString();
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringWithFormat:@"powerlog_%@_%@.PLSQL", v5, v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  getContainerPath();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 stringByAppendingString:@"/Library/BatteryLife/CurrentPowerlog.PLSQL"];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString hasSuffix:](v2, "hasSuffix:", @".PLSQL"))
  {
    uint64_t v11 = v2;
  }

  else
  {
    -[__CFString stringByAppendingPathComponent:](v2, "stringByAppendingPathComponent:", v8);
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v12 = v11;
  PLCopyDB(v10, v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = (void *)[v13 mutableCopy];

  -[__CFString stringByDeletingLastPathComponent](v12, "stringByDeletingLastPathComponent");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  PLCopyQuarantineDB(v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16) {
    [v14 setObject:v16 forKeyedSubscript:@"quarantine_path"];
  }

  return v14;
}

uint64_t PLResetPowerlog()
{
  id v0 = (void *)MEMORY[0x189604030];
  getContainerPath();
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 fileURLWithPath:v1];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    [MEMORY[0x1896078A8] defaultManager];
    double v3 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = 0LL;
    unsigned int v4 = [v3 removeItemAtURL:v2 error:&v17];
    id v5 = v17;

    if (v5) {
      uint64_t v6 = 0LL;
    }
    else {
      uint64_t v6 = v4;
    }
    if ((v6 & 1) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl( &dword_186654000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Performed powerlog reset as requested",  v16,  2u);
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      PLResetPowerlog_cold_2();
    }
  }

  else
  {
    BOOL v7 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v7) {
      PLResetPowerlog_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    uint64_t v6 = 0LL;
  }

  return v6;
}

uint64_t PLCopyExtendedPersistenceLog(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1 || -[__CFString isEqualToString:](v1, "isEqualToString:", &stru_189E9F260))
  {

    id v2 = @"/var/mobile/Library/Logs/CrashReporter/";
  }

  dateFormatter();
  double v3 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] date];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringFromDate:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = (void *)NSString;
  shortUUIDString();
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringWithFormat:@"log_%@_%@.EPSQL", v5, v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  getContainerPath();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 stringByAppendingString:@"/Library/PerfPowerTelemetry/ExtendedPersistence/CurrentLog.EPSQL"];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString hasSuffix:](v2, "hasSuffix:", @".EPSQL"))
  {
    uint64_t v11 = v2;
  }

  else
  {
    -[__CFString stringByAppendingPathComponent:](v2, "stringByAppendingPathComponent:", v8);
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v12 = v11;
  uint64_t v13 = PLCopyDB(v10, v11);

  return v13;
}

uint64_t PLCopyCleanEnergyLog(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1 || -[__CFString isEqualToString:](v1, "isEqualToString:", &stru_189E9F260))
  {

    id v2 = @"/var/mobile/Library/Logs/CrashReporter/";
  }

  dateFormatter();
  double v3 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] date];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringFromDate:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = (void *)NSString;
  shortUUIDString();
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringWithFormat:@"log_%@_%@.CESQL", v5, v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  getContainerPath();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 stringByAppendingString:@"/Library/PerfPowerTelemetry/CleanEnergy/CurrentCleanEnergyDB.CESQL"];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString hasSuffix:](v2, "hasSuffix:", @".CESQL"))
  {
    uint64_t v11 = v2;
  }

  else
  {
    -[__CFString stringByAppendingPathComponent:](v2, "stringByAppendingPathComponent:", v8);
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v12 = v11;
  uint64_t v13 = PLCopyDB(v10, v11);

  return v13;
}

uint64_t PLCopyXcodeOrganizerLog(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1 || -[__CFString isEqualToString:](v1, "isEqualToString:", &stru_189E9F260))
  {

    id v2 = @"/var/mobile/Library/Logs/CrashReporter/";
  }

  dateFormatter();
  double v3 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] date];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringFromDate:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = (void *)NSString;
  shortUUIDString();
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringWithFormat:@"log_%@_%@.XCSQL", v5, v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  getContainerPath();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 stringByAppendingString:@"/Library/PerfPowerTelemetry/XcodeOrganizer/CurrentXcodeOrganizerDB.XCSQL"];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString hasSuffix:](v2, "hasSuffix:", @".XCSQL"))
  {
    uint64_t v11 = v2;
  }

  else
  {
    -[__CFString stringByAppendingPathComponent:](v2, "stringByAppendingPathComponent:", v8);
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v12 = v11;
  uint64_t v13 = PLCopyDB(v10, v11);

  return v13;
}

uint64_t dropTable(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  errmsg = 0LL;
  id v5 = v3;
  if (sqlite3_open_v2((const char *)[v5 UTF8String], &ppDb, 2, 0))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      dropTable_cold_5();
    }
    goto LABEL_15;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_186654000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Configure the page cache", buf, 2u);
  }

  if (!sqlite3_exec(ppDb, "PRAGMA cache_size = 50;", 0LL, 0LL, &errmsg))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_186654000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Configure the cache_spill", buf, 2u);
    }

    if (sqlite3_exec(ppDb, "PRAGMA cache_spill = 256;", 0LL, 0LL, &errmsg))
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        dropTable_cold_3((uint64_t *)&errmsg, v8, v9);
      }
      goto LABEL_14;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl(&dword_186654000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Drop %@", buf, 0xCu);
    }

    [NSString stringWithFormat:@"DROP TABLE '%@';", v4];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = ppDb;
    id v14 = v12;
    if (sqlite3_exec(v13, (const char *)[v14 UTF8String], 0, 0, &errmsg))
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        dropTable_cold_2();
      }
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_186654000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Vacuum", buf, 2u);
      }

      if (!sqlite3_exec( ppDb,  (const char *)[@"PRAGMA incremental_vacuum;" UTF8String],
              0LL,
              0LL,
              &errmsg))
      {
        uint64_t v10 = 1LL;
        goto LABEL_28;
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        dropTable_cold_1((uint64_t *)&errmsg, v15, v16);
      }
    }

    sqlite3_free(errmsg);
    uint64_t v10 = 0LL;
LABEL_28:
    sqlite3_close(ppDb);

    goto LABEL_16;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    dropTable_cold_4((uint64_t *)&errmsg, v6, v7);
  }
LABEL_14:
  sqlite3_free(errmsg);
  sqlite3_close(ppDb);
LABEL_15:
  uint64_t v10 = 0LL;
LABEL_16:

  return v10;
}

uint64_t PLCopyBackgroundProcessingLog(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1 || -[__CFString isEqualToString:](v1, "isEqualToString:", &stru_189E9F260))
  {

    id v2 = @"/var/mobile/Library/Logs/CrashReporter/";
  }

  dateFormatter();
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] date];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringFromDate:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = (void *)NSString;
  shortUUIDString();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringWithFormat:@"log_%@_%@.BGSQL", v5, v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  getContainerPath();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 stringByAppendingString:@"/Library/PerfPowerTelemetry/BackgroundProcessing/CurrentBackgroundProcessingDB.BGSQL"];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString hasSuffix:](v2, "hasSuffix:", @".BGSQL"))
  {
    uint64_t v11 = v2;
  }

  else
  {
    -[__CFString stringByAppendingPathComponent:](v2, "stringByAppendingPathComponent:", v8);
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v12 = v11;
  uint64_t v13 = PLCopyDB(v10, v11);

  return v13;
}

void handleXPCEvent(void *a1, uint64_t a2, char a3)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  if (([v5 isEqualToString:@"ThermalMonitor"] & 1) != 0
    || (double Current = 0.0, [v5 isEqualToString:@"XPCCacheFlush"]))
  {
    double Current = CFAbsoluteTimeGetCurrent();
  }

  id v7 = v5;
  uint64_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], 0);
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  dispatch_time_t v10 = dispatch_time(0LL, 0LL);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __handleXPCEvent_block_invoke;
  block[3] = &unk_189E9EF98;
  id v11 = v7;
  id v24 = v11;
  char v26 = a3;
  uint64_t v12 = v9;
  int v25 = v12;
  dispatch_after(v10, v8, block);
  dispatch_time_t v13 = dispatch_time(0LL, 1000000000 * a2);
  uint64_t v14 = dispatch_semaphore_wait(v12, v13);
  if (v14)
  {
    uint64_t v15 = v14;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v11;
      __int16 v29 = 2048;
      uint64_t v30 = v15;
      _os_log_impl(&dword_186654000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%@ semaphore timeout %lu", buf, 0x16u);
    }
  }

  if (([v11 isEqualToString:@"ThermalMonitor"] & 1) != 0
    || (v16 = [v11 isEqualToString:@"XPCCacheFlush"], double v17 = 0.0, v16))
  {
    double v17 = CFAbsoluteTimeGetCurrent();
  }

  float v18 = v17 - Current;
  LODWORD(v9) = vcvtps_s32_f32(v18 * 1000.0);
  [MEMORY[0x189603FC8] dictionary];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v11 isEqualToString:@"ThermalMonitor"])
  {
    [MEMORY[0x189607968] numberWithInt:v9];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = @"collectLogsTime";
LABEL_14:
    [v19 setObject:v20 forKeyedSubscript:v21];

    goto LABEL_15;
  }

  if ([v11 isEqualToString:@"XPCCacheFlush"])
  {
    [MEMORY[0x189607968] numberWithInt:v9];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = @"flushCacheTime";
    goto LABEL_14;
  }

void __handleXPCEvent_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  PLQueryRegistered(1, *(__CFString **)(a1 + 32), MEMORY[0x189604A60]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412546;
    uint64_t v5 = v3;
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_186654000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%@ result: %@", (uint8_t *)&v4, 0x16u);
  }

  if (*(_BYTE *)(a1 + 48)) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

id __handleXPCEvent_block_invoke_95(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void *PLSysdiagnoseCopyPowerlog(void *a1, unint64_t a2)
{
  uint64_t v3 = a2 >> 2;
  handleXPCEvent(@"ThermalMonitor", a2 >> 2, 0);
  handleXPCEvent(@"XPCCacheFlush", v3, 1);
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v5 = PLCopyPowerlog(a1);
  float v6 = CFAbsoluteTimeGetCurrent() - Current;
  LODWORD(v3) = vcvtps_s32_f32(v6 * 1000.0);
  [MEMORY[0x189603FC8] dictionary];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:v3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v8 forKeyedSubscript:@"copyPowerlogTime"];

  id v9 = v7;
  AnalyticsSendEventLazy();

  return v5;
}

id __PLSysdiagnoseCopyPowerlog_block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t PLSysdiagnoseCopyLogs(void *a1, unint64_t a2, const __CFArray *a3)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a2 >> 2;
  handleXPCEvent(@"ThermalMonitor", a2 >> 2, 0);
  handleXPCEvent(@"XPCCacheFlush", v5, 1);
  if (a3 && CFArrayGetCount(a3) && CFArrayGetCount(a3))
  {
    CFIndex v7 = 0LL;
    unsigned __int8 v38 = 0;
    uint64_t v37 = *MEMORY[0x189607548];
    uint64_t v8 = (os_log_s *)MEMORY[0x1895F8DA0];
    *(void *)&__int128 v6 = 138412546LL;
    __int128 v36 = v6;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a3, v7);
      CFTypeID v10 = CFGetTypeID(ValueAtIndex);
      if (v10 != CFNumberGetTypeID())
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          PLSysdiagnoseCopyLogs_cold_1(&v43, v7, &v44);
        }
        goto LABEL_27;
      }

      CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberIntType, &valuePtr);
      uint64_t v11 = valuePtr;
      if (valuePtr < 5)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        switch((_DWORD)v11)
        {
          case 2:
            dispatch_time_t v13 = (const __CFDictionary *)PLCopyCleanEnergyLog(a1);
            uint64_t v14 = @"CESQL";
LABEL_17:
            float v15 = CFAbsoluteTimeGetCurrent() - Current;
            LODWORD(v3) = vcvtps_s32_f32(v15 * 1000.0);
            Value = (const __CFNumber *)CFDictionaryGetValue(v13, @"status");
            if (Value
              && (double v17 = Value, v18 = CFGetTypeID(Value), v18 == CFNumberGetTypeID())
              && CFNumberGetValue(v17, kCFNumberIntType, buf)
              && !*(_DWORD *)buf)
            {
              id v28 = (void *)CFDictionaryGetValue(v13, @"path");
              __int16 v29 = (void *)MEMORY[0x1896078A8];
              id v30 = v28;
              [v29 defaultManager];
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
              [v31 attributesOfItemAtPath:v30 error:0];
              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

              float v19 = -1.0;
              if (v32)
              {
                [v32 objectForKeyedSubscript:v37];
                uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

                if (v33)
                {
                  [v32 objectForKeyedSubscript:v37];
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  float v19 = (float)[v34 longLongValue] * 0.00000095367;
                }
              }

              unsigned __int8 v38 = 1;
              uint64_t v20 = 1LL;
            }

            else
            {
              float v19 = 0.0;
              if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v36;
                *(void *)&uint8_t buf[4] = v14;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v3;
                _os_log_error_impl( &dword_186654000,  v8,  OS_LOG_TYPE_ERROR,  "Copying %@ data failed, time taken = %d",  buf,  0x12u);
              }

              uint64_t v20 = 0LL;
            }

            objc_msgSend(MEMORY[0x189603FC8], "dictionary", v36);
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 setObject:v14 forKeyedSubscript:@"name"];
            [MEMORY[0x189607968] numberWithUnsignedChar:v20];
            id v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 setObject:v22 forKeyedSubscript:@"status"];

            *(float *)&double v23 = v19;
            [MEMORY[0x189607968] numberWithFloat:v23];
            id v24 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 setObject:v24 forKeyedSubscript:@"size"];

            [MEMORY[0x189607968] numberWithInt:v3];
            int v25 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 setObject:v25 forKeyedSubscript:@"copyingTime"];

            if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v21;
              _os_log_impl(&dword_186654000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
            }

            [MEMORY[0x189607968] numberWithUnsignedInt:v11];
            char v26 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 setObject:v26 forKeyedSubscript:@"name"];

            *(void *)buf = MEMORY[0x1895F87A8];
            *(void *)&buf[8] = 3221225472LL;
            *(void *)&uint8_t buf[16] = __copyLogAndUpdateSuccess_block_invoke;
            __int128 v46 = &unk_189E9EFC0;
            id v47 = v21;
            id v27 = v21;
            AnalyticsSendEventLazy();
            CFRelease(v13);

            break;
          case 1:
            dispatch_time_t v13 = (const __CFDictionary *)PLSysdiagnoseCopyExtendedPersistenceLog(a1);
            uint64_t v14 = @"EPSQL";
            goto LABEL_17;
          case 0:
            dispatch_time_t v13 = (const __CFDictionary *)PLCopyPowerlog(a1);
            uint64_t v14 = @"PLSQL";
            goto LABEL_17;
        }
      }

      else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        PLSysdiagnoseCopyLogs_cold_1(&v41, v7, &v42);
      }

void PLSysdiagnoseTimeSensitivePhase()
{
  if (PLSysdiagnoseTimeSensitivePhase_onceToken != -1) {
    dispatch_once(&PLSysdiagnoseTimeSensitivePhase_onceToken, &__block_literal_global_99);
  }
  if (PLSysdiagnoseTimeSensitivePhase_hasBaseband)
  {
    handleXPCEvent(@"BBLogsForSysdiagnose", 1LL, 0);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v0 = 0;
      _os_log_impl( &dword_186654000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "PLSysdiagnoseTimeSensitivePhase returned",  v0,  2u);
    }
  }

void __PLSysdiagnoseTimeSensitivePhase_block_invoke()
{
  id v0 = (const __CFBoolean *)MGCopyAnswer();
  PLSysdiagnoseTimeSensitivePhase_hasBaseband = CFBooleanGetValue(v0) != 0;
  CFRelease(v0);
}

uint64_t copyFiles(void *a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  [MEMORY[0x1896078A8] defaultManager];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v30 = 0LL;
  id v24 = v3;
  [v5 contentsOfDirectoryAtPath:v3 error:&v30];
  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v30;
  double v23 = v4;
  int v8 = [v4 hasPrefix:@"/var/mobile/Library/Logs/CrashReporter/"];
  if (v6)
  {
    int v9 = v8;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id obj = v6;
    uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v21 = v6;
      uint64_t v12 = *(void *)v27;
      while (2)
      {
        uint64_t v13 = 0LL;
        uint64_t v14 = v7;
        do
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * v13);
          [v24 stringByAppendingPathComponent:v15];
          int v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v23 stringByAppendingPathComponent:v15];
          double v17 = (void *)objc_claimAutoreleasedReturnValue();
          id v25 = v14;
          char v18 = [v5 copyItemAtPath:v16 toPath:v17 error:&v25];
          id v7 = v25;

          if ((v18 & 1) == 0)
          {
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v32 = v24;
              __int16 v33 = 2112;
              id v34 = v7;
              _os_log_impl( &dword_186654000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Error copying for srcDir %@ : %@",  buf,  0x16u);
            }

            uint64_t v19 = 0LL;
            goto LABEL_16;
          }

          if (v9) {
            PLMarkFileAsPurgeable(v17, 512LL);
          }

          ++v13;
          uint64_t v14 = v7;
        }

        while (v11 != v13);
        uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v11) {
          continue;
        }
        break;
      }

      uint64_t v19 = 1LL;
LABEL_16:
      __int128 v6 = v21;
    }

    else
    {
      uint64_t v19 = 1LL;
    }
  }

  else
  {
    uint64_t v19 = 1LL;
  }

  return v19;
}

void copyArchivesToCrashMover()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 stringByAppendingString:@"/Library/BatteryLife/Archives/"];
  id v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((copyFiles(v1, @"/var/mobile/Library/Logs/CrashReporter/") & 1) == 0
    && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_186654000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Archive copying failed", v2, 2u);
  }
}

void copyQuarantinesToCrashMover()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 stringByAppendingString:@"/Library/BatteryLife/Quarantine/"];
  id v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((copyFiles(v1, @"/var/mobile/Library/Logs/CrashReporter/") & 1) == 0
    && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_186654000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Quarantine copying failed", v2, 2u);
  }
}

void copyUpgradeLogsToCrashMover()
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  getContainerPath();
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs/MajorVersion"];
  id v1 = (void *)objc_claimAutoreleasedReturnValue();

  getContainerPath();
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs/MinorVersion"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  [MEMORY[0x1896078A8] defaultManager];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v27 = 0LL;
  [v4 contentsOfDirectoryAtPath:v1 error:&v27];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v21 = v27;

  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    int v9 = (os_log_s *)MEMORY[0x1895F8DA0];
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [v1 stringByAppendingPathComponent:*(void *)(*((void *)&v28 + 1) + 8 * v10)];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (copyFiles(v11, @"/var/mobile/Library/Logs/CrashReporter/"))
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
            copyUpgradeLogsToCrashMover_cold_5(&v39, (uint64_t)v11, &v40);
          }
        }

        else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          copyUpgradeLogsToCrashMover_cold_6(&v37, (uint64_t)v11, &v38);
        }

        ++v10;
      }

      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v41 count:16];
    }

    while (v7);
  }

  if (v21 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    copyUpgradeLogsToCrashMover_cold_4();
  }
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  [MEMORY[0x1896078A8] defaultManager];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = v21;
  [v12 contentsOfDirectoryAtPath:v3 error:&v22];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v20 = v22;

  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    double v17 = (os_log_s *)MEMORY[0x1895F8DA0];
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(v3, "stringByAppendingPathComponent:", *(void *)(*((void *)&v23 + 1) + 8 * v18), v20);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (copyFiles(v19, @"/var/mobile/Library/Logs/CrashReporter/"))
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            copyUpgradeLogsToCrashMover_cold_2(&v34, (uint64_t)v19, &v35);
          }
        }

        else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          copyUpgradeLogsToCrashMover_cold_3(&v32, (uint64_t)v19, &v33);
        }

        ++v18;
      }

      while (v15 != v18);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v36 count:16];
    }

    while (v15);
  }

  if (v20 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    copyUpgradeLogsToCrashMover_cold_1();
  }
}

void PLCrashMoverCopyPowerlog()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  getContainerPath();
  id v0 = (void *)_CFPreferencesCopyValueWithContainer();
  if ([v0 intValue] == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v2) = 0;
      _os_log_impl( &dword_186654000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "PLCrashMoverCopyPowerlog starts cache flush",  (uint8_t *)&v2,  2u);
    }

    handleXPCEvent(@"XPCCacheFlush", 1000000000LL, 1);
    id v1 = PLCopyPowerlog(@"/var/mobile/Library/Logs/CrashReporter/");
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v2 = 138412290;
      id v3 = v1;
      _os_log_impl( &dword_186654000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "PLCrashMoverCopyPowerlog done copying powerlog : %@",  (uint8_t *)&v2,  0xCu);
    }

    CFRelease(v1);
    copyArchivesToCrashMover();
    copyQuarantinesToCrashMover();
  }
}

uint64_t PLSysdiagnoseCopyBatteryUILogs(void *a1, CFErrorRef *a2)
{
  v9[1] = *MEMORY[0x1895F89C0];
  id v3 = a1;
  uint64_t v4 = PLCopyBatteryUIPlists((uint64_t)@"Sysdiagnose", v3);
  if ((v4 & 1) == 0)
  {
    uint64_t v5 = (void *)[objc_alloc(NSString) initWithFormat:@"Failed to copy files to %@", v3];
    uint64_t v8 = *MEMORY[0x1896075E0];
    v9[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (a2) {
      *a2 = CFErrorCreate(0LL, @"com.apple.powerlog", 1LL, v6);
    }
  }

  return v4;
}

void *PLSysdiagnoseCopyExtendedPersistenceLog(void *a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  PLCopyExtendedPersistenceLog(a1);
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  int v2 = (void *)[v1 mutableCopy];
  [v2 objectForKeyedSubscript:@"status"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 intValue];

  if (!v4)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [v2 objectForKeyedSubscript:@"path"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = dropTable(v6, @"BatteryDataCollection_BDC_AMA_30_1");
    double v8 = CFAbsoluteTimeGetCurrent();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109376;
      v10[1] = v7;
      __int16 v11 = 2048;
      double v12 = v8 - Current;
      _os_log_impl( &dword_186654000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "EPSQL DROP Success: %d Execution Time: %f",  (uint8_t *)v10,  0x12u);
    }

    if ((v7 & 1) == 0) {
      [v2 setObject:&unk_189EA47A8 forKeyedSubscript:@"status"];
    }
  }

  return v2;
}

id __copyLogAndUpdateSuccess_block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

float *OUTLINED_FUNCTION_3_0(float *result, uint64_t a2, void *a3, float a4)
{
  *result = a4;
  *a3 = a2;
  return result;
}

void OUTLINED_FUNCTION_6_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id logHandle_1()
{
  if (logHandle_onceToken_1 != -1) {
    dispatch_once(&logHandle_onceToken_1, &__block_literal_global_7);
  }
  return (id)logHandle__logHandle_1;
}

void __logHandle_block_invoke_1()
{
  os_log_t v0 = os_log_create("com.apple.batteryui", "");
  id v1 = (void *)logHandle__logHandle_1;
  logHandle__logHandle_1 = (uint64_t)v0;
}

uint64_t PLBatteryUsageUIQuery(__CFString *a1, void *a2)
{
  return PLQueryRegistered(50, a1, a2);
}

id PLBatteryUsageUIKeyForRequest(void *a1)
{
  id v1 = a1;
  [v1 objectForKeyedSubscript:@"enum"];
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLBatteryUsageUIStringForResponseType((int)[v2 intValue]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  PLBatteryUsageUIKeyFromConfiguration(v1);
  int v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    [NSString stringWithFormat:@"%@_%@", v3, v4];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

id PLCalculateEndOfHour()
{
  os_log_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  PLCalculateEndOfHourWithDate(v0);
  id v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id PLCalculateEndOfDay()
{
  os_log_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  PLCalculateEndOfDayWithDate(v0);
  id v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id PLBatteryUsageUIConfiguration(uint64_t a1, void *a2, double a3, double a4)
{
  v20[4] = *MEMORY[0x1895F89C0];
  double v6 = -a3;
  id v7 = a2;
  [v7 dateByAddingTimeInterval:v6];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = @"start";
  int v9 = (void *)MEMORY[0x189607968];
  [v8 timeIntervalSince1970];
  objc_msgSend(v9, "numberWithDouble:");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  v19[1] = @"end";
  __int16 v11 = (void *)MEMORY[0x189607968];
  [v7 timeIntervalSince1970];
  double v13 = v12;

  [v11 numberWithDouble:v13];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  v19[2] = @"bucket";
  [MEMORY[0x189607968] numberWithDouble:a4];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v15;
  v19[3] = @"enum";
  [MEMORY[0x189607968] numberWithInteger:a1];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v16;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:4];
  double v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id PLConfigureBUIQueryNoteworthyInformation()
{
  os_log_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __PLConfigureBUIQueryNoteworthyInformation_block_invoke;
  v14[3] = &unk_189E9F030;
  id v1 = v0;
  id v15 = v1;
  int v2 = (void (**)(void, void))MEMORY[0x186E3D51C](v14);
  PLCalculateEndOfHour();
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLCalculateEndOfDay();
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLBatteryUsageUIConfiguration(6LL, v4, 864000.0, 86400.0);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *))v2)[2](v2, v5);

  PLBatteryUsageUIConfiguration(1LL, v3, 86400.0, 86400.0);
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *))v2)[2](v2, v6);

  PLBatteryUsageUIConfiguration(13LL, v3, 86400.0, 86400.0);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *))v2)[2](v2, v7);

  PLBatteryUsageUIConfiguration(14LL, v3, 86400.0, 86400.0);
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *))v2)[2](v2, v8);

  PLBatteryUsageUIConfiguration(15LL, v3, 86400.0, 86400.0);
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *))v2)[2](v2, v9);

  PLBatteryUsageUIConfiguration(17LL, v3, 86400.0, 86400.0);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *))v2)[2](v2, v10);

  PLBatteryUsageUIConfiguration(18LL, v3, 86400.0, 86400.0);
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *))v2)[2](v2, v11);

  id v12 = v1;
  return v12;
}

void __PLConfigureBUIQueryNoteworthyInformation_block_invoke(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = a2;
  PLBatteryUsageUIKeyForRequest(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v3 forKeyedSubscript:v4];
}

uint64_t PLRunBUIQueryWithRangeType()
{
  return 0LL;
}

uint64_t PLRunBUIQuery()
{
  return 0LL;
}

uint64_t PLGenerateBatteryUIPlist(uint64_t a1)
{
  id v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    PLGenerateBatteryUIPlist_cold_1(v1);
  }

  return 0LL;
}

uint64_t PLCopyBatteryUIPlists(uint64_t a1, void *a2)
{
  id v3 = a2;
  [0 setObject:a1 forKeyedSubscript:@"requestingService"];
  [0 setObject:v3 forKeyedSubscript:@"plistCopyDestination"];
  logHandle_1();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    PLCopyBatteryUIPlists_cold_1();
  }

  return 0LL;
}

__CFString *PLBatteryUsageUIStringForResponseType(unint64_t a1)
{
  if (a1 < 0x16 && ((0x27FFFFu >> a1) & 1) != 0)
  {
    id v1 = off_189E9F050[a1];
  }

  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown_%lu", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

CFStringRef PLBatteryUsageUIStringForQueryRange(double a1)
{
  if (a1 == 864000.0) {
    return @"10d";
  }
  if (a1 == 604800.0) {
    return @"7d";
  }
  if (a1 == 86400.0) {
    return @"24hr";
  }
  if (a1 == 3600.0) {
    return @"1hr";
  }
  return @"UnknownRange";
}

id PLCalculateEndOfHourWithDate(void *a1)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  logHandle_1();
  int v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    PLCalculateEndOfHourWithDate_cold_4();
  }

  [MEMORY[0x189603F38] currentCalendar];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 components:60 fromDate:v1];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = [v4 valueForComponent:32];
  logHandle_1();
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    [v3 dateFromComponents:v4];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = 138412802;
    id v16 = v1;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    __int16 v19 = 2048;
    unint64_t v20 = v5;
    _os_log_debug_impl(&dword_186654000, v6, OS_LOG_TYPE_DEBUG, "Date: %@ -> %@ -> %ld", (uint8_t *)&v15, 0x20u);
  }

  logHandle_1();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    PLCalculateEndOfHourWithDate_cold_2();
  }

  unint64_t v8 = ((v5 % 3) ^ 3) + v5;
  logHandle_1();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    PLCalculateEndOfHourWithDate_cold_2();
  }

  [v4 setValue:v8 forComponent:32];
  [v3 dateFromComponents:v4];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  logHandle_1();
  __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    PLCalculateEndOfHourWithDate_cold_1();
  }

  logHandle_1();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v10;
    _os_log_impl(&dword_186654000, v12, OS_LOG_TYPE_DEFAULT, "end of hour: %@", (uint8_t *)&v15, 0xCu);
  }

  return v10;
}

id PLCalculateEndOfDayWithDate(void *a1)
{
  id v1 = (void *)MEMORY[0x189603F38];
  id v2 = a1;
  [v1 currentCalendar];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = (void *)objc_opt_new();
  [v4 setHour:0];
  [v4 setMinute:0];
  [v4 setSecond:0];
  [v3 nextDateAfterDate:v2 matchingComponents:v4 options:2];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

__CFString *PLBatteryUsageUIKeyFromConfiguration(void *a1)
{
  id v1 = a1;
  [v1 objectForKeyedSubscript:@"end"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 doubleValue];
  double v4 = v3;
  [v1 objectForKeyedSubscript:@"start"];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 doubleValue];
  double v7 = v4 - v6;

  [v1 objectForKeyedSubscript:@"bucket"];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 doubleValue];
  double v10 = v9;

  if (v7 / v10 == 1.0)
  {
    if (v7 == 864000.0)
    {
      id v12 = @"10d";
    }

    else if (v7 == 604800.0)
    {
      id v12 = @"7d";
    }

    else if (v7 == 86400.0)
    {
      id v12 = @"24hr";
    }

    else
    {
      id v12 = @"UnknownRange";
      if (v7 == 3600.0) {
        id v12 = @"1hr";
      }
    }

    double v13 = v12;
  }

  else
  {
    if (v7 == 864000.0)
    {
      __int16 v11 = @"10d";
    }

    else if (v7 == 604800.0)
    {
      __int16 v11 = @"7d";
    }

    else if (v7 == 86400.0)
    {
      __int16 v11 = @"24hr";
    }

    else
    {
      __int16 v11 = @"UnknownRange";
      if (v7 == 3600.0) {
        __int16 v11 = @"1hr";
      }
    }

    [NSString stringWithFormat:@"%@_%zu", v11, (unint64_t)v10];
    double v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

PPSTelemetryIdentifier *PPSCreateTelemetryIdentifier(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 UTF8String];
  id v6 = v4;
  uint64_t v7 = [v6 UTF8String];

  return +[PPSClientDonation createIdentifierForSubsystem:category:]( &OBJC_CLASS___PPSClientDonation,  "createIdentifierForSubsystem:category:",  v5,  v7);
}

uint64_t PPSSendTelemetry(uint64_t a1, uint64_t a2)
{
  return +[PPSClientDonation sendEventWithIdentifier:payload:]( &OBJC_CLASS___PPSClientDonation,  "sendEventWithIdentifier:payload:",  a1,  a2);
}

PPSTelemetryIdentifier *pps_create_telemetry_identifier(uint64_t a1, uint64_t a2)
{
  return +[PPSClientDonation createIdentifierForSubsystem:category:]( &OBJC_CLASS___PPSClientDonation,  "createIdentifierForSubsystem:category:",  a1,  a2);
}

uint64_t pps_send_telemetry(uint64_t a1, uint64_t a2)
{
  return +[PPSClientDonation sendEventWithIdentifier:payload:]( &OBJC_CLASS___PPSClientDonation,  "sendEventWithIdentifier:payload:",  a1,  a2);
}

id containerPath()
{
  if (containerPath_onceToken != -1) {
    dispatch_once(&containerPath_onceToken, &__block_literal_global_8);
  }
  return (id)containerPath_containerPath;
}

void __containerPath_block_invoke()
{
  os_log_t v0 = (void *)container_create_or_lookup_system_group_paths();
  if (v0)
  {
    id v1 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v2 = [v1 objectForKeyedSubscript:@"systemgroup.com.apple.powerlog"];
    id v3 = (void *)containerPath_containerPath;
    containerPath_containerPath = v2;
  }

  else
  {
    NSLog(@"Error fetching group containers for %@ : %llu", @"com.apple.systemcontainer", 1LL);
  }
}

id PLFDefaultsValueForKey()
{
  return (id)_CFPreferencesCopyValueWithContainer();
}

void __didReceiveNotification_block_invoke_cold_1()
{
}

void batteryUIHasNoteworthyInformation_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_186654000, log, OS_LOG_TYPE_ERROR, "invalid queryResult", v1, 2u);
}

void PLShouldLogRegisteredEvent_cold_1()
{
}

void PLShouldLogRegisteredEvent_cold_2()
{
}

void PLShouldLogEvent_cold_1()
{
}

void PLShouldLogEvent_cold_2()
{
}

void PLMarkFileAsPurgeable_cold_1()
{
  os_log_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_6_0( &dword_186654000,  MEMORY[0x1895F8DA0],  v1,  "Client Framework --  Failed to mark %@ purgeable - can't open error: %s",  v2,  v3,  v4,  v5,  2u);
}

void PLMarkFileAsPurgeable_cold_2(uint64_t a1, uint64_t *a2, int a3)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v5 = *a2;
  uint8_t v6 = __error();
  uint64_t v7 = strerror(*v6);
  int v8 = 138413058;
  uint64_t v9 = a1;
  __int16 v10 = 2048;
  uint64_t v11 = v5;
  __int16 v12 = 1024;
  int v13 = a3;
  __int16 v14 = 2080;
  int v15 = v7;
  _os_log_error_impl( &dword_186654000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Client Framework -- Failed to mark %@ purgeable - flags 0x%llx returned %d (%s)",  (uint8_t *)&v8,  0x26u);
}

void PLCopyDB_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void PLCopyDB_cold_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void PLCopyDB_cold_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void PLResetPowerlog_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void PLResetPowerlog_cold_2()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10( &dword_186654000,  MEMORY[0x1895F8DA0],  v0,  "Unable to remove directory during powerlog reset, err: %@",  v1);
  OUTLINED_FUNCTION_1();
}

void dropTable_cold_1(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  int v4 = 136315138;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_10(&dword_186654000, MEMORY[0x1895F8DA0], a3, "Failed to vacuum db with error %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void dropTable_cold_2()
{
}

void dropTable_cold_3(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  int v4 = 136315138;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_10(&dword_186654000, MEMORY[0x1895F8DA0], a3, "Failed to set cache_spill %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void dropTable_cold_4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  int v4 = 136315138;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_10(&dword_186654000, MEMORY[0x1895F8DA0], a3, "Failed to set cache_size %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void dropTable_cold_5()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_186654000, MEMORY[0x1895F8DA0], v0, "Failed to open database connection at path: %@", v1);
  OUTLINED_FUNCTION_1();
}

void PLSysdiagnoseCopyLogs_cold_1(float *a1, uint64_t a2, void *a3)
{
}

void copyUpgradeLogsToCrashMover_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10( &dword_186654000,  MEMORY[0x1895F8DA0],  v0,  "PowerlogFileUtilities: failed to copy minor upgrade logs with error %@",  v1);
  OUTLINED_FUNCTION_1();
}

void copyUpgradeLogsToCrashMover_cold_2(float *a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_0( &dword_186654000,  MEMORY[0x1895F8DA0],  v3,  "PowerlogFileUtilities: successfully copied minor upgrade logs, srcPath = %@",  v4);
}

void copyUpgradeLogsToCrashMover_cold_3(float *a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_10( &dword_186654000,  MEMORY[0x1895F8DA0],  v3,  "PowerlogFileUtilities: failed to copy minor upgrade logs, srcPath = %@",  v4);
}

void copyUpgradeLogsToCrashMover_cold_4()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10( &dword_186654000,  MEMORY[0x1895F8DA0],  v0,  "PowerlogFileUtilities: failed to copy major upgrade logs with error %@",  v1);
  OUTLINED_FUNCTION_1();
}

void copyUpgradeLogsToCrashMover_cold_5(float *a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_0( &dword_186654000,  MEMORY[0x1895F8DA0],  v3,  "PowerlogFileUtilities: successfully copied major upgrade logs, srcPath = %@",  v4);
}

void copyUpgradeLogsToCrashMover_cold_6(float *a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_10( &dword_186654000,  MEMORY[0x1895F8DA0],  v3,  "PowerlogFileUtilities: failed to copy major upgrade logs, srcPath = %@",  v4);
}

void PLGenerateBatteryUIPlist_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_186654000, log, OS_LOG_TYPE_ERROR, "Failed to generate a new BatteryUI plist", v1, 2u);
}

void PLCopyBatteryUIPlists_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_186654000, v0, OS_LOG_TYPE_ERROR, "Failed to copy files to %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void PLCalculateEndOfHourWithDate_cold_1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_186654000, v1, OS_LOG_TYPE_DEBUG, "System hour bucket: %@ -> %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void PLCalculateEndOfHourWithDate_cold_2()
{
}

void PLCalculateEndOfHourWithDate_cold_4()
{
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x18960CE20]();
}

uint64_t ADMonotonicTimeGetCurrent()
{
  return MEMORY[0x18960CE70]();
}

uint64_t ADPushTimeIntervalForDistributionKeySinceStartTime()
{
  return MEMORY[0x18960CE78]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x18960DAA0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

CFErrorRef CFErrorCreate( CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x189602C60](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

void CFNotificationCenterAddObserver( CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x189602E50]();
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue( CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x189602F88](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F0]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x189613700]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x189613710]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x189613740]();
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x189604440]();
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x189604820]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x189604830]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FA540](a1, *(void *)&a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

uint64_t coalition_info_resource_usage()
{
  return MEMORY[0x1895FA5B8]();
}

uint64_t container_create_or_lookup_system_group_paths()
{
  return MEMORY[0x1895FA748]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1895FAEF0](when, delta);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1895FB270](*(void *)&a1, a2, a3, *(void *)&a4);
}

void free(void *a1)
{
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1895FB660](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1895FC1B8](name, out_token);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C0](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1895FC1E8](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1895FC6C8]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1895FC6D8]();
}

uint64_t proc_listcoalitions()
{
  return MEMORY[0x1895FC8B8]();
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x189617120](a1);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return result;
}

int sqlite3_exec( sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1896171D8](a1, sql, callback, a4, errmsg);
}

uint64_t sqlite3_exec_b()
{
  return MEMORY[0x1896171E0]();
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1896171F8](a1, zDbName, *(void *)&op, a4);
}

void sqlite3_free(void *a1)
{
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x189617258](filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x189617260](filename, ppDb, *(void *)&flags, zVfs);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

uint64_t xpc_coalition_copy_info()
{
  return MEMORY[0x1895FD900]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1895FD9A8](connection);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

uint64_t xpc_connection_send_notification()
{
  return MEMORY[0x1895FD9F8]();
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}