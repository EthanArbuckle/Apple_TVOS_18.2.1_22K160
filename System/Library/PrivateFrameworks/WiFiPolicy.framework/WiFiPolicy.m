LABEL_15:
      v15 = [v5 nextObject];

      v8 = (void *)v15;
      if (!v15)
      {

        break;
      }
    }
  }
}
  }

  else
  {
LABEL_17:
    v8 = 0LL;
  }

  return v8;
}
  }

  else
  {
LABEL_17:
    v8 = 0LL;
  }

  return v8;
}

  [MEMORY[0x189607968] numberWithUnsignedLong:a3];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:v17];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendFormat:@"%@&", v18];

  if ((a3 & 0x20) == 0)
  {
LABEL_7:
    if ((a3 & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_17:
    [MEMORY[0x189607968] numberWithUnsignedLong:a3];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v21];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 appendFormat:@"%@&", v22];

    if ((a3 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  }

  else
  {
LABEL_17:
    v8 = 0LL;
  }

  return v8;
}
  }

  else
  {
LABEL_17:
    v8 = 0LL;
  }

  return v8;
}

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = v3->_triggerCriteriaFilterList;
  v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v90,  v100,  16LL);
  v22 = 0LL;
  if (v71)
  {
    v23 = (NSString *)v7;
    v70 = *(void *)v91;
    if (v7) {
      v24 = v78 == 0LL;
    }
    else {
      v24 = 1;
    }
    v25 = !v24;
    v81 = v25;
    while (1)
    {
      for (j = 0LL; j != v71; ++j)
      {
        if (*(void *)v91 != v70) {
          objc_enumerationMutation(obj);
        }
        v27 = *(void **)(*((void *)&v90 + 1) + 8 * j);
        if (v81
          && [v78 count]
          && ([v27 filterSamplesPredicate],
              v28 = (void *)objc_claimAutoreleasedReturnValue(),
              v28,
              v28))
        {
          [v27 filterSamplesPredicate];
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          [v78 filteredArrayUsingPredicate:v29];
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30 && [v30 count])
          {
            v72 = j;
            v88 = 0u;
            v89 = 0u;
            v86 = 0u;
            v87 = 0u;
            v75 = v27;
            [v27 features];
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = [v31 countByEnumeratingWithState:&v86 objects:v99 count:16];
            if (v32)
            {
              v33 = v32;
              v34 = *(void *)v87;
              do
              {
                for (k = 0LL; k != v33; ++k)
                {
                  if (*(void *)v87 != v34) {
                    objc_enumerationMutation(v31);
                  }
                  v36 = *(void **)(*((void *)&v86 + 1) + 8 * k);
                  [v36 median];
                  v37 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v37)
                  {
                    [v36 fieldName];
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v39 = +[WiFiUsageLQMRollingWindow medianIntegerValueForField:ScaledByDuration:OnSamples:]( WiFiUsageLQMRollingWindow,  "medianIntegerValueForField:ScaledByDuration:OnSamples:",  v38,  [v36 isPerSecond],  v30);
                    [v36 setMedian:v39];
                  }
                }

                v33 = [v31 countByEnumeratingWithState:&v86 objects:v99 count:16];
              }

              while (v33);
            }

            v23 = (NSString *)v80;
            j = v72;
            v27 = v75;
          }
        }

        else
        {
          v30 = 0LL;
        }

        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        [v27 criterias];
        v79 = (id)objc_claimAutoreleasedReturnValue();
        v40 = [v79 countByEnumeratingWithState:&v82 objects:v98 count:16];
        if (!v40)
        {
          v43 = 0LL;
          goto LABEL_87;
        }

        v41 = v40;
        v76 = v27;
        v73 = j;
        v42 = *(void *)v83;
        v43 = v22;
        while (2)
        {
          for (m = 0LL; m != v41; ++m)
          {
            v45 = v43;
            if (*(void *)v83 != v42) {
              objc_enumerationMutation(v79);
            }
            v43 = *(id *)(*((void *)&v82 + 1) + 8 * m);

            if (!v81)
            {
LABEL_54:
              v46 = 0LL;
              v47 = 0LL;
              goto LABEL_62;
            }

            v46 = 0LL;
            v47 = 0LL;
            if ([v78 count] && v30)
            {
              if (![v30 count]) {
                goto LABEL_54;
              }
              v48 = [v43 type];
              if (v48)
              {
                if (v48 == 1)
                {
                  v49 = [v76 features];
                  goto LABEL_56;
                }

                v50 = 0LL;
              }

              else
              {
                v49 = -[NSMutableArray lastObject](v74->_samples, "lastObject");
LABEL_56:
                v50 = (void *)v49;
              }

              [v43 requiredFieldsValid];
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = [v51 evaluateWithObject:v50];

              if ((_DWORD)v47)
              {
                [v43 predicate];
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = [v52 evaluateWithObject:v50];
              }

              else
              {
                v46 = 0LL;
              }

              [v30 lastObject];
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              [v53 timestamp];
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              [v43 setCurrentSample:v54];

              v8 = v77;
              v23 = (NSString *)v80;
            }

id SiriFaultReportHandle()
{
  if (SiriFaultReportHandle_onceTokenworkreport != -1) {
    dispatch_once(&SiriFaultReportHandle_onceTokenworkreport, &__block_literal_global);
  }
  return (id)SiriFaultReportHandle_faultTelemetryHandle;
}

void __SiriFaultReportHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WiFiPolicy", "telemetry");
  v1 = (void *)SiriFaultReportHandle_faultTelemetryHandle;
  SiriFaultReportHandle_faultTelemetryHandle = (uint64_t)v0;
}

id LinkEventSourceStringMap(uint64_t a1)
{
  if (LinkEventSourceStringMap_onceToken != -1) {
    dispatch_once(&LinkEventSourceStringMap_onceToken, &__block_literal_global_26);
  }
  v2 = (void *)gLinkEventSourceStringMap;
  [MEMORY[0x189607968] numberWithLong:a1];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKey:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __LinkEventSourceStringMap_block_invoke()
{
  v3[5] = *MEMORY[0x1895F89C0];
  v2[0] = &unk_18A1B3558;
  v2[1] = &unk_18A1B3570;
  v3[0] = @"TypeInvalid";
  v3[1] = @"RawIncommingFaultEvent";
  v2[2] = &unk_18A1B3588;
  v2[3] = &unk_18A1B35A0;
  v3[2] = @"IncommingFaultEventDropped";
  v3[3] = @"HandleFaultPerformRecovery";
  v2[4] = &unk_18A1B35B8;
  v3[4] = @"LinkTestResults";
  uint64_t v0 = [MEMORY[0x189603F68] dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)gLinkEventSourceStringMap;
  gLinkEventSourceStringMap = v0;
}

void sub_187EC2A24( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
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

void sub_187EC2D78( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
}

void sub_187EC3098(_Unwind_Exception *a1)
{
}

void sub_187EC339C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
}
}

LABEL_14:
  v26 = (void *)MEMORY[0x1896079C8];
  v154[0] = MEMORY[0x1895F87A8];
  v154[1] = 3221225472LL;
  v154[2] = __63__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryBeforeDate___block_invoke;
  v154[3] = &unk_18A16C8E0;
  v122 = v4;
  v155 = v122;
  [v26 predicateWithBlock:v154];
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[NSMutableArray filteredArrayUsingPredicate:](self->_activities, "filteredArrayUsingPredicate:");
  v28 = v27;
  if (!v27 || ![v27 count]) {
    NSLog( @"%s: No previous Faults found when searching history",  "-[SiriTimeoutInitiatedTelemetry _dictOfEventSummaryBeforeDate:]");
  }
  [v28 sortedArrayUsingComparator:&__block_literal_global_208];
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  [v114 lastObject];
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = 0u;
  v151 = 0u;
  v152 = 0u;
  v153 = 0u;
  v29 = v28;
  v30 = [v29 countByEnumeratingWithState:&v150 objects:v159 count:16];
  if (v30)
  {
    v31 = v30;
    v32 = *(void *)v151;
    do
    {
      for (i = 0LL; i != v31; ++i)
      {
        if (*(void *)v151 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = [*(id *)(*((void *)&v150 + 1) + 8 * i) getFaultReason];
        v35 = (void *)NSString;
        WiFiUsageFaultReasonStringMap(v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v35 stringWithFormat:@"BeforeFault_Fault_%@", v36];
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        -[SiriTimeoutInitiatedTelemetry incrementValueForKey:inMutableDict:]( self,  "incrementValueForKey:inMutableDict:",  v37,  v5);
      }

      v31 = [v29 countByEnumeratingWithState:&v150 objects:v159 count:16];
    }

    while (v31);
  }

  [v110 getDate];
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v39 = (void *)MEMORY[0x189607968];
    [v110 getDate];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    [v122 timeIntervalSinceDate:v40];
    [v39 numberWithInt:(int)v41];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v42 forKeyedSubscript:@"BeforeFault_Fault_age"];
  }

  v43 = (void *)MEMORY[0x1896079C8];
  v44 = MEMORY[0x1895F87A8];
  v148[0] = MEMORY[0x1895F87A8];
  v148[1] = 3221225472LL;
  v148[2] = __63__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryBeforeDate___block_invoke_3;
  v148[3] = &unk_18A16C8E0;
  v45 = v122;
  v149 = v45;
  [v43 predicateWithBlock:v148];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[NSMutableArray filteredArrayUsingPredicate:](self->_activities, "filteredArrayUsingPredicate:", v46);
  [v47 sortedArrayUsingComparator:&__block_literal_global_213];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  [v48 lastObject];
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  [v49 getLnkTestResult];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v145[0] = v44;
  v145[1] = 3221225472LL;
  v145[2] = __63__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryBeforeDate___block_invoke_5;
  v145[3] = &unk_18A16CA40;
  v51 = v5;
  v146 = v51;
  v52 = v50;
  v147 = v52;
  [v52 enumerateKeysAndObjectsUsingBlock:v145];
  [v49 getDate];
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    v54 = (void *)MEMORY[0x189607968];
    [v49 getDate];
    v123 = v48;
    v55 = v47;
    v56 = v46;
    v57 = v45;
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    [v57 timeIntervalSinceDate:v58];
    [v54 numberWithInt:(int)v59];
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    [v51 setObject:v60 forKeyedSubscript:@"BeforeFault_LinkTestResults_age"];

    v45 = v57;
    v46 = v56;
    v47 = v55;
    v48 = v123;
  }

  v61 = (void *)MEMORY[0x1896079C8];
  v143[0] = MEMORY[0x1895F87A8];
  v143[1] = 3221225472LL;
  v143[2] = __63__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryBeforeDate___block_invoke_6;
  v143[3] = &unk_18A16C8E0;
  v124 = v45;
  v144 = v124;
  [v61 predicateWithBlock:v143];
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = -[NSMutableArray filteredArrayUsingPredicate:](self->_activities, "filteredArrayUsingPredicate:");
  [v62 sortedArrayUsingComparator:&__block_literal_global_218];
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  [v115 lastObject];
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  v63 = v62;
  v64 = [v63 countByEnumeratingWithState:&v139 objects:v158 count:16];
  if (v64)
  {
    v65 = v64;
    v66 = *(void *)v140;
    do
    {
      for (j = 0LL; j != v65; ++j)
      {
        if (*(void *)v140 != v66) {
          objc_enumerationMutation(v63);
        }
        v68 = [*(id *)(*((void *)&v139 + 1) + 8 * j) getFaultReason];
        v69 = (void *)NSString;
        WiFiUsageFaultReasonStringMap(v68);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        [v69 stringWithFormat:@"BeforeFault_FaultIgnored_%@", v70];
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        -[SiriTimeoutInitiatedTelemetry incrementValueForKey:inMutableDict:]( self,  "incrementValueForKey:inMutableDict:",  v71,  v51);
      }

      v65 = [v63 countByEnumeratingWithState:&v139 objects:v158 count:16];
    }

    while (v65);
  }

  [v111 getDate];
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    v73 = (void *)MEMORY[0x189607968];
    [v111 getDate];
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    [v124 timeIntervalSinceDate:v74];
    [v73 numberWithInt:(int)v75];
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    [v51 setObject:v76 forKeyedSubscript:@"BeforeFault_FaultIgnored_age"];
  }

  v77 = (void *)MEMORY[0x1896079C8];
  v137[0] = MEMORY[0x1895F87A8];
  v137[1] = 3221225472LL;
  v137[2] = __63__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryBeforeDate___block_invoke_8;
  v137[3] = &unk_18A16C8E0;
  v125 = v124;
  v138 = v125;
  [v77 predicateWithBlock:v137];
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = -[NSMutableArray filteredArrayUsingPredicate:](self->_activities, "filteredArrayUsingPredicate:");
  [v78 sortedArrayUsingComparator:&__block_literal_global_223];
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  [v116 lastObject];
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v79 = v78;
  v80 = [v79 countByEnumeratingWithState:&v133 objects:v157 count:16];
  if (v80)
  {
    v81 = v80;
    v82 = *(void *)v134;
    do
    {
      for (k = 0LL; k != v81; ++k)
      {
        if (*(void *)v134 != v82) {
          objc_enumerationMutation(v79);
        }
        [*(id *)(*((void *)&v133 + 1) + 8 * k) getBrokenLinkReason];
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        [NSString stringWithFormat:@"BeforeFault_Recovery_%@", v84];
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        -[SiriTimeoutInitiatedTelemetry incrementValueForKey:inMutableDict:]( self,  "incrementValueForKey:inMutableDict:",  v85,  v51);
      }

      v81 = [v79 countByEnumeratingWithState:&v133 objects:v157 count:16];
    }

    while (v81);
  }

  [v112 getDate];
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v86)
  {
    v87 = (void *)MEMORY[0x189607968];
    [v112 getDate];
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    [v125 timeIntervalSinceDate:v88];
    [v87 numberWithInt:(int)v89];
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    [v51 setObject:v90 forKeyedSubscript:@"BeforeFault_Recovery_age"];

    [v112 getBrokenLinkReason];
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    [v51 setObject:v91 forKeyedSubscript:@"BeforeFault_Recovery_reason"];

    if ([v112 getFaultHandlingLimited])
    {
      WiFiFaultHandlingLimitsStringMap([v112 getFaultHandlingLimited]);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      [v51 setObject:v92 forKeyedSubscript:@"BeforeFault_Recovery_wasLimited"];
    }
  }

  v93 = (void *)MEMORY[0x1896079C8];
  v131[0] = MEMORY[0x1895F87A8];
  v131[1] = 3221225472LL;
  v131[2] = __63__SiriTimeoutInitiatedTelemetry__dictOfEventSummaryBeforeDate___block_invoke_10;
  v131[3] = &unk_18A16C8E0;
  v126 = v125;
  v132 = v126;
  [v93 predicateWithBlock:v131];
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = -[NSMutableArray filteredArrayUsingPredicate:](self->_activities, "filteredArrayUsingPredicate:");
  [v94 sortedArrayUsingComparator:&__block_literal_global_232];
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  [v117 lastObject];
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v95 = v94;
  v96 = [v95 countByEnumeratingWithState:&v127 objects:v156 count:16];
  if (v96)
  {
    v97 = v96;
    v98 = *(void *)v128;
    do
    {
      for (m = 0LL; m != v97; ++m)
      {
        if (*(void *)v128 != v98) {
          objc_enumerationMutation(v95);
        }
        [*(id *)(*((void *)&v127 + 1) + 8 * m) getBrokenLinkReason];
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        [NSString stringWithFormat:@"BeforeFault_RecoveryIgnored_%@", v100];
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        -[SiriTimeoutInitiatedTelemetry incrementValueForKey:inMutableDict:]( self,  "incrementValueForKey:inMutableDict:",  v101,  v51);
      }

      v97 = [v95 countByEnumeratingWithState:&v127 objects:v156 count:16];
    }

    while (v97);
  }

  [v113 getDate];
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  if (v102)
  {
    v103 = (void *)MEMORY[0x189607968];
    [v113 getDate];
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    [v126 timeIntervalSinceDate:v104];
    [v103 numberWithInt:(int)v105];
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    [v51 setObject:v106 forKeyedSubscript:@"BeforeFault_RecoveryIgnored_age"];

    [v113 getBrokenLinkReason];
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    [v51 setObject:v107 forKeyedSubscript:@"BeforeFault_RecoveryIgnored_reason"];

    if ([v113 getFaultHandlingLimited])
    {
      WiFiFaultHandlingLimitsStringMap([v113 getFaultHandlingLimited]);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      [v51 setObject:v108 forKeyedSubscript:@"BeforeFault_RecoveryIgnored_wasLimited"];
    }
  }

  return v51;
}

  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysisLinkDown;
  v24 = -[WiFiUsageLQMWindowAnalysis windowBeforeTrigger](&v37, sel_windowBeforeTrigger);
  [v24 samples];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 lastObject];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"driverRoamRecommended",  v26);
  [v4 setObject:v27 forKeyedSubscript:@"roamingRecommended"];
  v28 = +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"driverTDrecommended",  v26);
  [v4 setObject:v28 forKeyedSubscript:@"tdRecommended"];
  v29 = +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"chanQualScore",  v26);
  [v4 setObject:v29 forKeyedSubscript:@"last_chanQualScore_before"];
  v30 = +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"txLatencyScore",  v26);
  [v4 setObject:v30 forKeyedSubscript:@"last_txLatencyScore_before"];
  v31 = +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"rxLatencyScore",  v26);
  [v4 setObject:v31 forKeyedSubscript:@"last_rxLatencyScore_before"];
  v32 = +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"txLossScore",  v26);
  [v4 setObject:v32 forKeyedSubscript:@"last_txLossScore_before"];
  v33 = +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"rxLossScore",  v26);
  [v4 setObject:v33 forKeyedSubscript:@"last_rxLossScore_before"];
  v34 = +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"txLatencyP95",  v26);
  v35 = +[WiFiUsageLQMSample binLabelfromFieldName:value:]( WiFiUsageLQMUserSample,  "binLabelfromFieldName:value:",  @"txLatencyP95",  [v34 integerValue]);
  [v4 setObject:v35 forKeyedSubscript:@"last_txLatencyP95_before"];

  return v4;
}

  [MEMORY[0x189607968] numberWithUnsignedLong:a3];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:v15];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendFormat:@"%@&", v16];

  if ((a3 & 0x10) == 0)
  {
LABEL_6:
    if ((a3 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }

  v15 = (void *)[v3 copy];

  return v15;
}

          ++v19;
        }

        while (v16 != v19);
        v35 = [v14 countByEnumeratingWithState:&v44 objects:v48 count:16];
        v16 = v35;
        if (!v35)
        {
          v11 = v40;
          uint64_t v10 = v41;
          goto LABEL_25;
        }
      }
    }

    objc_msgSend( NSString,  "stringWithFormat:",  @"%s  results alloc failed",  "-[WFBlacklistEngine retrieveReasonsForNetworkInBlacklistedState:state:timestamps:reasonData:]");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
  }

  else
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s  Not in blacklisted state",  "-[WFBlacklistEngine retrieveReasonsForNetworkInBlacklistedState:state:timestamps:reasonData:]");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
  }

  v37 = (void *)NSString;
  v14 = v14;
  v38 = objc_msgSend(v37, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v14, "UTF8String"));
  *(_DWORD *)buf = 136446210;
  v50 = [v38 UTF8String];
  _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

LABEL_32:
  v13 = 0LL;
LABEL_25:

LABEL_27:
  return v13;
}

LABEL_19:
      objc_msgSend(v9, "stringByAppendingFormat:", v13, v18);
      uint64_t v10 = LABEL_20:;
LABEL_21:

      v9 = (void *)v10;
LABEL_22:

      return v9;
    case 5LL:
      [v7 stringByAppendingFormat:@" Link Test due to %@", self->_linkTestReason];
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!self->_linkTestResult) {
        goto LABEL_22;
      }
      [v9 stringByAppendingFormat:@" with results %@", self->_linkTestResult];
      goto LABEL_20;
    default:
      -[SiriTimeoutActivity description].cold.1();
  }

    goto LABEL_20;
  }

  NSLog(@"%s: skipping directed scan", "-[WiFiSettlementObserver _handleScanResults:error:userInfo:]");
LABEL_20:
}
}

void sub_187EC8F2C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
}

void sub_187EC92F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
}

void __WiFiManagerLocationManagerVisitCallback(void *a1, uint64_t a2)
{
  if (a1) {
    [a1 _handleLocationManagerVisitCallbackWithVisit:a2];
  }
  else {
    NSLog(@"%s: callbackContext is null", "__WiFiManagerLocationManagerVisitCallback");
  }
}

float TBCentroidDegreesToRadians(float a1)
{
  return a1 * 0.0174532925;
}

float TBCentroidRadiansToDegrees(float a1)
{
  return a1 * 57.2957795;
}

LABEL_18:
  [*(id *)(a1 + 40) setTestTimeZoneCC:0];
LABEL_19:
  v57 = v13;
  v58 = v12;
  if (v14)
  {
    v39 = objc_alloc(NSString);
    [v14 uppercaseString];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)[v39 initWithString:v40];
    [*(id *)(a1 + 40) setTestUserDefaults:v41];
  }

  else
  {
    [*(id *)(a1 + 40) setTestUserDefaults:0];
  }

  v42 = v11;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    v43 = v14;
    v44 = v5;
    v45 = [*(id *)(a1 + 40) localeCheckSuspended];
    v46 = [*(id *)(a1 + 40) testMcc];
    [*(id *)(a1 + 40) testHost11d];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) testPeer];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) testUserDefaults];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) localeTimeout];
    *(_DWORD *)buf = 136318466;
    v61 = "-[WiFiLocaleManager setLocaleTestParams:]_block_invoke";
    v62 = 1024;
    v63 = v45;
    v64 = 1024;
    v65 = v44;
    v14 = v43;
    v66 = 1024;
    *(_DWORD *)v67 = v46;
    *(_WORD *)&v67[4] = 1024;
    *(_DWORD *)&v67[6] = v7;
    *(_WORD *)v68 = 2112;
    *(void *)&v68[2] = v47;
    *(_WORD *)v69 = 2112;
    *(void *)&v69[2] = v42;
    *(_WORD *)v70 = 2112;
    *(void *)&v70[2] = v48;
    v71 = 2112;
    v72 = v58;
    v73 = 2112;
    v74 = v49;
    v75 = 2112;
    v76 = v43;
    v77 = 2048;
    v78 = v50;
    v79 = 2048;
    v80 = v10;
    v81 = 1024;
    v82 = v59;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: setting test params: localeCheckSuspended %d (requested %d), MCC %d (requested %d), host11d %@ (requested %@), peer %@ (requested %@), userDefaults %@ (requested %@), timeout %.2f seconds (requested %.2f seconds), forceCheck %d",  buf,  0x7Au);
  }

  [*(id *)(a1 + 40) retryTimer];
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    [*(id *)(a1 + 40) retryTimer];
    v52 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v52, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }

  [*(id *)(a1 + 40) localeTimer];
  v53 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) localeTimeout];
  v55 = dispatch_time(0LL, (uint64_t)(v54 * 1000000000.0));
  [*(id *)(a1 + 40) localeTimeout];
  dispatch_source_set_timer(v53, v55, (unint64_t)(v56 * 1000000000.0), 0LL);

  v11 = v42;
  v13 = v57;
  uint64_t v12 = v58;
  if ((v59 & 1) != 0) {
LABEL_27:
  }
    [*(id *)(a1 + 40) determineLocale:1];
LABEL_28:
}
}

    v13 = 0LL;
    goto LABEL_19;
  }

  uint64_t v12 = [v4 isEAP];
  v5->_enterprisePolicy = v12 & [v4 isProfileBased];
  v13 = (void *)[v4 copyWithZone:0];
  if (![v13 isEqualToBlacklistNetwork:v4])
  {
LABEL_19:
    v14 = 0LL;
    goto LABEL_20;
  }

  -[WFBlackListNode setNetworkDelegate:](v5, "setNetworkDelegate:", v13);
  v14 = v5;
LABEL_20:

  return v14;
}

          ++v14;
        }

        while (v14 < -[NSMutableArray count](self->_blacklistMetrics, "count"));
      }

      if ([v50 count])
      {
        v44 = -[NSMutableArray objectsAtIndexes:](self->_blacklistMetrics, "objectsAtIndexes:", v50);
        [v44 enumerateObjectsUsingBlock:&__block_literal_global_15];
        -[NSMutableArray removeObjectsAtIndexes:](self->_blacklistMetrics, "removeObjectsAtIndexes:", v50);
      }
    }

    else
    {
      [MEMORY[0x189603FC8] dictionary];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      [NSString stringWithString:v13];
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 setObject:v36 forKeyedSubscript:@"ssid"];

      [NSString stringWithString:v11];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 setObject:v37 forKeyedSubscript:@"bssid"];

      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v7, "blacklistedState"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 setObject:v38 forKeyedSubscript:@"state"];

      v39 = (void *)MEMORY[0x189607968];
      [v7 blacklistedStateTimestamp];
      objc_msgSend(v39, "numberWithDouble:");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 setObject:v40 forKeyedSubscript:@"blocklistTimestamp"];
      v41 = +[WiFiUsagePrivacyFilter sanitizedOUI:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "sanitizedOUI:", v11);
      [v35 setObject:v41 forKeyedSubscript:@"oui"];

      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v7, "blacklistedReason"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 setObject:v42 forKeyedSubscript:@"blocklistedReason"];

      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v7, "blacklistedReasonData"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 setObject:v43 forKeyedSubscript:@"blocklistedSubreason"];

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        -[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:].cold.1( (uint64_t)v13,  v11,  v35);
      }
      -[NSMutableArray addObject:](self->_blacklistMetrics, "addObject:", v35);
    }
  }

  else
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s ssid nil",  "-[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      v48 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v13, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      v53 = (const char *)[v48 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }

  v13 = (id)v11;
LABEL_27:
}

LABEL_9:
    v7 = 0LL;
    goto LABEL_10;
  }
  v6 = -[WiFiLocaleManager testPeer](self, "testPeer");
  v7 = (void *)[v6 copy];

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = 138412290;
    v13 = v7;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Using testPeer [%@]",  (uint8_t *)&v12,  0xCu);
  }

  objc_autoreleasePoolPop(v2);
}

  [MEMORY[0x189607968] numberWithInteger:a4];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSessionLQM setValue:forKey:](self, "setValue:forKey:", v12, v13);
}

  if (v8)
  {
    -[WiFiUsageSession setInWalkingEntryTime:](self, "setInWalkingEntryTime:", v12);
    ++self->_inWalkingEventCount;
  }

  else if (self->_inWalkingEntryTime)
  {
    objc_msgSend(v12, "timeIntervalSinceDate:");
    self->_inWalkingDuration = v11 + self->_inWalkingDuration;
    -[WiFiUsageSession setInWalkingEntryTime:](self, "setInWalkingEntryTime:", 0LL);
  }

  -[WiFiUsageBssSession motionStateDidChange:andVehicularState:]( self->_currentBssSession,  "motionStateDidChange:andVehicularState:",  v6 ^ 1u,  v7);
}
}

LABEL_10:
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = 138412290;
    v13 = v7;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Locale from peer: <%@>",  (uint8_t *)&v12,  0xCu);
  }

  return v7;
}

  if (+[WiFiUsagePrivacyFilter isInternalInstall](&OBJC_CLASS___WiFiUsagePrivacyFilter, "isInternalInstall"))
  {
    [MEMORY[0x189607968] numberWithBool:self->_isHome];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v7 forKeyedSubscript:@"NetworkIsHome"];

    [MEMORY[0x189607968] numberWithBool:self->_isWork];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v8 forKeyedSubscript:@"NetworkIsWork"];
  }

  [MEMORY[0x189607968] numberWithBool:self->_isKnown];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v9 forKeyedSubscript:@"NetworkIsKnown"];

  [MEMORY[0x189607968] numberWithBool:self->_isOpen];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v10 forKeyedSubscript:@"NetworkIsOpen"];

  [MEMORY[0x189607968] numberWithBool:self->_captiveStatus == 2];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v11 forKeyedSubscript:@"NetworkIsCaptive"];

  [MEMORY[0x189607968] numberWithBool:self->_isPublic];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v12 forKeyedSubscript:@"NetworkIsPublic"];

  [MEMORY[0x189607968] numberWithBool:self->_isLowQuality];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v13 forKeyedSubscript:@"NetworkIsLowQuality"];

  [MEMORY[0x189607968] numberWithBool:self->_isInternal];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v14 forKeyedSubscript:@"NetworkIsInternal"];

  [MEMORY[0x189607968] numberWithBool:self->_isManaged];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v15 forKeyedSubscript:@"NetworkIsManaged"];

  [MEMORY[0x189607968] numberWithBool:self->_isCarrierBased];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v16 forKeyedSubscript:@"NetworkIsCarrierBased"];

  [MEMORY[0x189607968] numberWithBool:self->_isCarPlay];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v17 forKeyedSubscript:@"NetworkIsCarPlay"];

  [MEMORY[0x189607968] numberWithBool:self->_isAppBased];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v18 forKeyedSubscript:@"NetworkIsAppBased"];

  [MEMORY[0x189607968] numberWithBool:self->_isWalletBased];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v19 forKeyedSubscript:@"NetworkIsWalletBased"];

  [MEMORY[0x189607968] numberWithBool:self->_isPersonalHotspot];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v20 forKeyedSubscript:@"NetworkIsPersonalHotspot"];

  [MEMORY[0x189607968] numberWithBool:self->_isMoving];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v21 forKeyedSubscript:@"NetworkIsMoving"];

  [MEMORY[0x189607968] numberWithBool:self->_isMesh];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v22 forKeyedSubscript:@"NetworkIsMesh"];

  [MEMORY[0x189607968] numberWithBool:self->_isWidelyDeployed];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v23 forKeyedSubscript:@"NetworkIsWidelyDeployed"];

  [MEMORY[0x189607968] numberWithBool:self->_isAutoJoined];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v24 forKeyedSubscript:@"NetworkIsAutoJoined"];

  [MEMORY[0x189607968] numberWithBool:self->_isAdhoc];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v25 forKeyedSubscript:@"NetworkIsAdhoc"];

  [MEMORY[0x189607968] numberWithBool:self->_isHidden];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v26 forKeyedSubscript:@"NetworkIsHidden"];

  [MEMORY[0x189607968] numberWithBool:self->_isPasspoint];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v27 forKeyedSubscript:@"NetworkIsPasspoint"];

  [MEMORY[0x189607968] numberWithBool:self->_isMetered];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v28 forKeyedSubscript:@"NetworkIsMetered"];

  [MEMORY[0x189607968] numberWithBool:self->_isBlueAtlas];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v29 forKeyedSubscript:@"NetworkIsBlueAtlas"];

  [MEMORY[0x189607968] numberWithBool:self->_hasWapi];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v30 forKeyedSubscript:@"NetworkHasWapi"];

  [MEMORY[0x189607968] numberWithBool:self->_hasWeakSecurity];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v31 forKeyedSubscript:@"NetworkHasWeakSecurity"];

  [MEMORY[0x189607968] numberWithBool:self->_hasWpa3];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v32 forKeyedSubscript:@"NetworkHasWpa3"];

  [MEMORY[0x189607968] numberWithBool:self->_hasWep];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v33 forKeyedSubscript:@"NetworkHasWep"];

  [MEMORY[0x189607968] numberWithBool:self->_hasEnterpriseSecurity];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v34 forKeyedSubscript:@"NetworkHasEnterpriseSecurity"];

  [MEMORY[0x189607968] numberWithBool:self->_hasLegacyEnterpriseSecurity];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v35 forKeyedSubscript:@"NetworkHasLegacyEnterprise"];

  [MEMORY[0x189607968] numberWithBool:self->_hasNoMap];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v36 forKeyedSubscript:@"NetworkHasNoMap"];

  [MEMORY[0x189607968] numberWithBool:self->_hasAmbiguousSsid];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v37 forKeyedSubscript:@"NetworkHasAmbiguousName"];

  [MEMORY[0x189607968] numberWithBool:self->_hasCustomNetworkSettings];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v38 forKeyedSubscript:@"NetworkHasCustomSettings"];

  [MEMORY[0x189607968] numberWithBool:self->_requiresUsername];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v39 forKeyedSubscript:@"NetworkRequiresUsername"];

  [MEMORY[0x189607968] numberWithBool:self->_requiresPassword];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v40 forKeyedSubscript:@"NetworkRequiresPassword"];

  [MEMORY[0x189607968] numberWithBool:self->_requiresIdentity];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v41 forKeyedSubscript:@"NetworkRequiresIdentity"];

  [MEMORY[0x189607968] numberWithBool:self->_requiresOtp];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v42 forKeyedSubscript:@"NetworkRequiresOtp"];

  [MEMORY[0x189607968] numberWithBool:self->_canExposeImsi];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v43 forKeyedSubscript:@"NetworkCanExposeImsi"];

  [MEMORY[0x189607968] numberWithBool:self->_addedFromUI];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v44 forKeyedSubscript:@"NetworkAddedFromUi"];

  [MEMORY[0x189607968] numberWithBool:self->_addedFromApp];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v45 forKeyedSubscript:@"NetworkAddedFromApp"];

  [MEMORY[0x189607968] numberWithBool:self->_addedViaSync];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v46 forKeyedSubscript:@"NetworkAddedViaSync"];

  [MEMORY[0x189607968] numberWithBool:self->_addedViaATJ];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v47 forKeyedSubscript:@"NetworkAddedViaAtj"];

  [MEMORY[0x189607968] numberWithBool:self->_addedViaRecommendation];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v48 forKeyedSubscript:@"NetworkAddedViaRecommendation"];

  [MEMORY[0x189607968] numberWithBool:self->_addedViaSharing];
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v49 forKeyedSubscript:@"NetworkAddedViaSharing"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageRank];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v50 forKeyedSubscript:@"NetworkUsageRank"];

  [MEMORY[0x189607968] numberWithBool:self->_autoJoinDisabled];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v51 forKeyedSubscript:@"NetworkAutoJoinDisabled"];

  [MEMORY[0x189607968] numberWithBool:self->_autoLoginDisabled];
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v52 forKeyedSubscript:@"NetworkAutoLoginDisabled"];

  [MEMORY[0x189607968] numberWithBool:self->_lowDataModeEnabled];
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v53 forKeyedSubscript:@"NetworkLowDataModeEnabled"];

  [MEMORY[0x189607968] numberWithBool:self->_controlCenterDisabled];
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v54 forKeyedSubscript:@"NetworkControlCenterDisabled"];

  [MEMORY[0x189607968] numberWithBool:self->_privateRelayEnabled];
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v55 forKeyedSubscript:@"NetworkPrivateRelayEnabled"];

  [v5 setObject:self->_privateRelayBlockedReason forKeyedSubscript:@"NetworkPrivateRelayBlockedReason"];
  v97[0] = self->_advertisedCountryCode;
  [NSString stringWithCString:v97 encoding:4];
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v56 forKeyedSubscript:@"NetworkCountryCodeAdvertised"];

  v97[0] = self->_appliedCountryCode;
  [NSString stringWithCString:v97 encoding:4];
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v57 forKeyedSubscript:@"NetworkCountryCodeApplied"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_localeSource];
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v58 forKeyedSubscript:@"NetworkCountryCodeSource"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_colocatedNetworkCount];
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v59 forKeyedSubscript:@"NetworkColocatedCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_switchedAwayCount];
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v60 forKeyedSubscript:@"NetworkSwitchedAwayCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_switchedToCount];
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v61 forKeyedSubscript:@"NetworkSwitchedToCount"];

  [MEMORY[0x189607968] numberWithInteger:self->_networkScore];
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v62 forKeyedSubscript:@"NetworkScore"];

  if (-[NSMutableArray count](self->_downloadSpeedResults, "count"))
  {
    v63 = -[NSMutableArray objectAtIndexedSubscript:](self->_downloadSpeedResults, "objectAtIndexedSubscript:", 0LL);
    [v5 setObject:v63 forKeyedSubscript:@"NetworkDownloadSpeed"];
  }

  [v5 setObject:self->_privateMacType forKeyedSubscript:@"NetworkPrivateMacType"];
  [MEMORY[0x189607968] numberWithBool:self->_privateMacFeatureToggled];
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v64 forKeyedSubscript:@"NetworkPrivateMacFeatureToggled"];

  [MEMORY[0x189607968] numberWithBool:self->_privateMacUnderClassification];
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v65 forKeyedSubscript:@"NetworkPrivateMacUnderClassification"];

  [MEMORY[0x189607968] numberWithBool:self->_privateMacDisabledByProfile];
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v66 forKeyedSubscript:@"NetworkPrivateMacDisabledByProfile"];

  [MEMORY[0x189607968] numberWithBool:self->_privateMacNetworkTypeHome];
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v67 forKeyedSubscript:@"NetworkPrivateMacNetworkTypeHome"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageDayTimeInLastDay];
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v68 forKeyedSubscript:@"NetworkUsageDayTimeInLastDay"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageDayTimeInLastWeek];
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v69 forKeyedSubscript:@"NetworkUsageDayTimeInLastWeek"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageDayTimeInLastMonth];
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v70 forKeyedSubscript:@"NetworkUsageDayTimeInLastMonth"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageNightTimeInLastDay];
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v71 forKeyedSubscript:@"NetworkUsageNightTimeInLastDay"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageNightTimeInLastWeek];
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v72 forKeyedSubscript:@"NetworkUsageNightTimeInLastWeek"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageNightTimeInLastMonth];
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v73 forKeyedSubscript:@"NetworkUsageNightTimeInLastMonth"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageStationaryDayTimeInLastDay];
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v74 forKeyedSubscript:@"NetworkUsageStationaryDayTimeInLastDay"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageStationaryDayTimeInLastWeek];
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v75 forKeyedSubscript:@"NetworkUsageStationaryDayTimeInLastWeek"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageStationaryDayTimeInLastMonth];
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v76 forKeyedSubscript:@"NetworkUsageStationaryDayTimeInLastMonth"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageStationaryNightTimeInLastDay];
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v77 forKeyedSubscript:@"NetworkUsageStationaryNightTimeInLastDay"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageStationaryNightTimeInLastWeek];
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v78 forKeyedSubscript:@"NetworkUsageStationaryNightTimeInLastWeek"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageStationaryNightTimeInLastMonth];
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v79 forKeyedSubscript:@"NetworkUsageStationaryNightTimeInLastMonth"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageChargingDayTimeInLastDay];
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v80 forKeyedSubscript:@"NetworkUsageChargingDayTimeInLastDay"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageChargingDayTimeInLastWeek];
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v81 forKeyedSubscript:@"NetworkUsageChargingDayTimeInLastWeek"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageChargingDayTimeInLastMonth];
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v82 forKeyedSubscript:@"NetworkUsageChargingDayTimeInLastMonth"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageChargingNightTimeInLastDay];
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v83 forKeyedSubscript:@"NetworkUsageChargingNightTimeInLastDay"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageChargingNightTimeInLastWeek];
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v84 forKeyedSubscript:@"NetworkUsageChargingNightTimeInLastWeek"];

  [MEMORY[0x189607968] numberWithInteger:self->_usageChargingNightTimeInLastMonth];
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v85 forKeyedSubscript:@"NetworkUsageChargingNightTimeInLastMonth"];

  [MEMORY[0x189607968] numberWithBool:self->_isAtPrimaryHMHome];
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v86 forKeyedSubscript:@"NetworkAtPrimaryHMHome"];

  [MEMORY[0x189607968] numberWithBool:self->_isAtNonPrimaryHMHome];
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v87 forKeyedSubscript:@"NetworkAtNonPrimaryHMHome"];

  [MEMORY[0x189607968] numberWithInteger:self->_joinSuccessCountInLastDay];
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v88 forKeyedSubscript:@"NetworkJoinSuccessCountInLastDay"];

  [MEMORY[0x189607968] numberWithInteger:self->_joinSuccessCountInLastWeek];
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v89 forKeyedSubscript:@"NetworkJoinSuccessCountInLastWeek"];

  [MEMORY[0x189607968] numberWithInteger:self->_joinSuccessCountInLastMonth];
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v90 forKeyedSubscript:@"NetworkJoinSuccessCountInLastMonth"];

  [MEMORY[0x189607968] numberWithInteger:self->_joinFailCountInLastDay];
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v91 forKeyedSubscript:@"NetworkJoinFailCountInLastDay"];

  [MEMORY[0x189607968] numberWithInteger:self->_joinFailCountInLastWeek];
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v92 forKeyedSubscript:@"NetworkJoinFailCountInLastWeek"];

  [MEMORY[0x189607968] numberWithInteger:self->_joinFailCountInLastMonth];
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v93 forKeyedSubscript:@"NetworkJoinFailCountInLastMonth"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_colocatedScopeCount];
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v94 forKeyedSubscript:@"NetworkColocatedScopeCount"];

  [v5 setObject:self->_bssEnvironment forKeyedSubscript:@"NetworkBssEnvironment"];
  [v5 setObject:self->_bssEnvironment forKeyedSubscript:@"NetworkBssEnvironmentString"];
  [v5 setObject:self->_disable6eMode forKeyedSubscript:@"NetworkDisable6EMode"];
  v95 = -[WiFiUsageBssDetails eventDictionary:](self->_connectedBss, "eventDictionary:", v3);
  [v5 addEntriesFromDictionary:v95];

  return v5;
}

  return v5;
}

  -[WiFiUsageBssSession faultEventDetected:](self->_currentBssSession, "faultEventDetected:", a3);
}
  v20 = +[WiFiUsagePrivacyFilter bandAsString:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "bandAsString:",  -[WiFiUsageSession bandAtSessionStart](self, "bandAtSessionStart"));
  [v6 setObject:v20 forKeyedSubscript:@"NetworkBssBandAtSessionStart"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[WiFiUsageSession isAssociatedAtSessionStart](self, "isAssociatedAtSessionStart"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v21 forKeyedSubscript:@"isAssociatedAtSessionStart"];
  v22 = +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "numberForKeyPath:ofObject:",  @"rssiAtSessionStart",  self);
  [v6 setObject:v22 forKeyedSubscript:@"RssiAtSessionStart"];
  v23 = +[WiFiUsagePrivacyFilter numberWithByteCount:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithByteCount:",  self->_netInterfaceTxBytes);
  [v6 setObject:v23 forKeyedSubscript:@"NetIfWiFiTxBytes"];
  v24 = +[WiFiUsagePrivacyFilter numberWithByteCount:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithByteCount:",  self->_netInterfaceRxBytes);
  [v6 setObject:v24 forKeyedSubscript:@"NetIfWiFiRxBytes"];
  v25 = +[WiFiUsagePrivacyFilter numberWithByteCount:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithByteCount:",  self->_secondaryInterfaceTxBytes);
  [v6 setObject:v25 forKeyedSubscript:@"NetIfSecondaryTxBytes"];
  v26 = +[WiFiUsagePrivacyFilter numberWithByteCount:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithByteCount:",  self->_secondaryInterfaceRxBytes);
  [v6 setObject:v26 forKeyedSubscript:@"NetIfSecondaryRxBytes"];
  v27 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_systemWakeStateChangedCount);
  [v6 setObject:v27 forKeyedSubscript:@"SystemWakeStateChangedCount"];
  v28 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_systemWokenByWiFiCount);
  [v6 setObject:v28 forKeyedSubscript:@"SystemWokenByWiFiCount"];
  v29 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_lockStateChangedCount);
  [v6 setObject:v29 forKeyedSubscript:@"SystemLockStateChangedCount"];
  v30 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_displayStateChangedCount);
  [v6 setObject:v30 forKeyedSubscript:@"SystemDisplayStateChangedCount"];
  v31 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_applicationStateChangedCount);
  [v6 setObject:v31 forKeyedSubscript:@"SystemApplicationStateChangedCount"];
  v32 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_mediaPlaybackEventCount);
  [v6 setObject:v32 forKeyedSubscript:@"SystemMediaPlaybackCount"];
  v33 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_chargingEventCount);
  [v6 setObject:v33 forKeyedSubscript:@"SystemChargingCount"];
  v34 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inCallEventCount);
  [v6 setObject:v34 forKeyedSubscript:@"SystemInCallCount"];
  v35 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inVehicleEventCount);
  [v6 setObject:v35 forKeyedSubscript:@"SystemInVehicleCount"];
  v36 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inMotionEventCount);
  [v6 setObject:v36 forKeyedSubscript:@"SystemInMotionCount"];
  v37 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_mediaPlaybackDuration,  self->_sessionDuration);
  [v6 setObject:v37 forKeyedSubscript:@"SystemMediaPlaybackDuration"];
  v38 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_chargingDuration,  self->_sessionDuration);
  [v6 setObject:v38 forKeyedSubscript:@"SystemChargingDuration"];
  v39 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inCallDuration,  self->_sessionDuration);
  [v6 setObject:v39 forKeyedSubscript:@"SystemInCallDuration"];
  v40 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inWalkingDuration,  self->_sessionDuration);
  [v6 setObject:v40 forKeyedSubscript:@"SystemInWalkingDuration"];
  v41 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inVehicleDuration,  self->_sessionDuration);
  [v6 setObject:v41 forKeyedSubscript:@"SystemInVehicleDuration"];
  v42 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inMotionDuration,  self->_sessionDuration);
  [v6 setObject:v42 forKeyedSubscript:@"SystemInMotionDuration"];
  v43 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_systemAwakeDuration,  self->_sessionDuration);
  [v6 setObject:v43 forKeyedSubscript:@"SystemAwakeDuration"];
  v44 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_companionConnectionStateChangedCount);
  [v6 setObject:v44 forKeyedSubscript:@"SystemCompanionConnectionStateChangedCount"];
  v45 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_companionConnectedDuration,  self->_sessionDuration);
  [v6 setObject:v45 forKeyedSubscript:@"SystemCompanionConnectedStateDuration"];

  [v6 setObject:self->_lastSmartCoverState forKeyedSubscript:@"SystemSmartCoverLastState"];
  v46 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_smartCoverStateChangedCount);
  [v6 setObject:v46 forKeyedSubscript:@"SystemSmartCoverStateChangedCount"];

  v47 = p_isSessionActive[4] && p_isSessionActive[5];
  [MEMORY[0x189607968] numberWithBool:v47];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v48 forKeyedSubscript:@"SystemIsUserInteractive"];

  [MEMORY[0x189607968] numberWithBool:p_isSessionActive[6]];
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v49 forKeyedSubscript:@"SystemIsInHomeScreen"];
  v50 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_powerBudgetMaxDuration,  self->_sessionDuration);
  [v6 setObject:v50 forKeyedSubscript:@"SystemPowerBudgetMaxDuration"];
  v51 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_powerBudget90Duration,  self->_sessionDuration);
  [v6 setObject:v51 forKeyedSubscript:@"SystemPowerBudget90Duration"];
  v52 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_powerBudget80Duration,  self->_sessionDuration);
  [v6 setObject:v52 forKeyedSubscript:@"SystemPowerBudget80Duration"];
  v53 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_powerBudget70Duration,  self->_sessionDuration);
  [v6 setObject:v53 forKeyedSubscript:@"SystemPowerBudget70Duration"];
  v54 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_powerBudget60Duration,  self->_sessionDuration);
  [v6 setObject:v54 forKeyedSubscript:@"SystemPowerBudget60Duration"];
  v55 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_powerBudget50Duration,  self->_sessionDuration);
  [v6 setObject:v55 forKeyedSubscript:@"SystemPowerBudget50Duration"];
  v56 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_powerBudget40Duration,  self->_sessionDuration);
  [v6 setObject:v56 forKeyedSubscript:@"SystemPowerBudget40Duration"];
  v57 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_powerBudget30Duration,  self->_sessionDuration);
  [v6 setObject:v57 forKeyedSubscript:@"SystemPowerBudget30Duration"];
  v58 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_powerBudget20Duration,  self->_sessionDuration);
  [v6 setObject:v58 forKeyedSubscript:@"SystemPowerBudget20Duration"];
  v59 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_powerBudget10Duration,  self->_sessionDuration);
  [v6 setObject:v59 forKeyedSubscript:@"SystemPowerBudget10Duration"];
  v60 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_powerBudgetMinDuration,  self->_sessionDuration);
  [v6 setObject:v60 forKeyedSubscript:@"SystemPowerBudgetMinDuration"];
  v61 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_thermalIndexMaxDuration,  self->_sessionDuration);
  [v6 setObject:v61 forKeyedSubscript:@"SystemThermalIndexMaxDuration"];
  v62 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_thermalIndex90Duration,  self->_sessionDuration);
  [v6 setObject:v62 forKeyedSubscript:@"SystemThermalIndex90Duration"];
  v63 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_thermalIndex80Duration,  self->_sessionDuration);
  [v6 setObject:v63 forKeyedSubscript:@"SystemThermalIndex80Duration"];
  v64 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_thermalIndex70Duration,  self->_sessionDuration);
  [v6 setObject:v64 forKeyedSubscript:@"SystemThermalIndex70Duration"];
  v65 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_thermalIndex60Duration,  self->_sessionDuration);
  [v6 setObject:v65 forKeyedSubscript:@"SystemThermalIndex60Duration"];
  v66 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_thermalIndex50Duration,  self->_sessionDuration);
  [v6 setObject:v66 forKeyedSubscript:@"SystemThermalIndex50Duration"];
  v67 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_thermalIndex40Duration,  self->_sessionDuration);
  [v6 setObject:v67 forKeyedSubscript:@"SystemThermalIndex40Duration"];
  v68 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_thermalIndex30Duration,  self->_sessionDuration);
  [v6 setObject:v68 forKeyedSubscript:@"SystemThermalIndex30Duration"];
  v69 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_thermalIndex20Duration,  self->_sessionDuration);
  [v6 setObject:v69 forKeyedSubscript:@"SystemThermalIndex20Duration"];
  v70 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_thermalIndex10Duration,  self->_sessionDuration);
  [v6 setObject:v70 forKeyedSubscript:@"SystemThermalIndex10Duration"];
  v71 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_thermalIndexMinDuration,  self->_sessionDuration);
  [v6 setObject:v71 forKeyedSubscript:@"SystemThermalIndexMinDuration"];
  v72 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_usbInsertedDuration,  self->_sessionDuration);
  [v6 setObject:v72 forKeyedSubscript:@"SystemUSBInsertedDurationPerc"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_usbDeviceEventCount];
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v73 forKeyedSubscript:@"SystemUSBEventCount"];
  v74 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inA2dpEventCount);
  [v6 setObject:v74 forKeyedSubscript:@"BluetoothInA2dpCount"];
  v75 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inScoEventCount);
  [v6 setObject:v75 forKeyedSubscript:@"BluetoothInScoCount"];
  v76 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inHidPresentCount);
  [v6 setObject:v76 forKeyedSubscript:@"BluetoothInHidCount"];
  v77 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inA2dpDuration,  self->_sessionDuration);
  [v6 setObject:v77 forKeyedSubscript:@"BluetoothInA2dpDuration"];
  v78 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inScoDuration,  self->_sessionDuration);
  [v6 setObject:v78 forKeyedSubscript:@"BluetoothInScoDuration"];
  v79 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inHidPresentDuration,  self->_sessionDuration);
  [v6 setObject:v79 forKeyedSubscript:@"BluetoothInHidDuration"];

  [MEMORY[0x189607968] numberWithBool:p_isSessionActive[24]];
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v80 forKeyedSubscript:@"isA2dpActive"];

  [MEMORY[0x189607968] numberWithBool:p_isSessionActive[25]];
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v81 forKeyedSubscript:@"isSCOActive"];

  [MEMORY[0x189607968] numberWithBool:p_isSessionActive[26]];
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v82 forKeyedSubscript:@"isUniAoSActive"];

  [MEMORY[0x189607968] numberWithBool:p_isSessionActive[27]];
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v83 forKeyedSubscript:@"isBiAoSActive"];

  [v6 setObject:self->_btAudioBand forKeyedSubscript:@"BTBand"];
  v84 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_linkStateChangedCount);
  [v6 setObject:v84 forKeyedSubscript:@"WiFiLinkStateChangedCount"];
  v85 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_joinStateChangedCount);
  [v6 setObject:v85 forKeyedSubscript:@"WiFiJoinStateChangedCount"];
  v86 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_networkChangedCount);
  [v6 setObject:v86 forKeyedSubscript:@"WiFiNetworkChangedCount"];
  v87 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_rapidLinkTransitionCount);
  [v6 setObject:v87 forKeyedSubscript:@"WiFiRapidLinkTransitionCount"];
  v88 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_powerToggleEventCount);
  [v6 setObject:v88 forKeyedSubscript:@"WiFiPowerToggleEventCount"];
  v89 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_powerStateChangedCount);
  [v6 setObject:v89 forKeyedSubscript:@"WiFiPowerStateChangedCount"];
  v90 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inAwdlEventCount);
  [v6 setObject:v90 forKeyedSubscript:@"WiFiInAwdlCount"];
  v91 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inRoamEventCount);
  [v6 setObject:v91 forKeyedSubscript:@"WiFiInRoamCount"];
  v92 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inScanEventCount);
  [v6 setObject:v92 forKeyedSubscript:@"WiFiInScanCount"];
  v93 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inSoftApEventCount);
  [v6 setObject:v93 forKeyedSubscript:@"WiFiInSoftApCount"];
  v94 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inAwdlDuration,  self->_sessionDuration);
  [v6 setObject:v94 forKeyedSubscript:@"WiFiInAwdlDuration"];
  v95 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inRoamDuration,  self->_sessionDuration);
  [v6 setObject:v95 forKeyedSubscript:@"WiFiInRoamDuration"];
  v96 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inRoamSuppressionEnabled,  self->_sessionDuration);
  [v6 setObject:v96 forKeyedSubscript:@"WiFiInRoamSuppressedDuration"];
  v97 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inRoamSuppressionEnabledCount);
  [v6 setObject:v97 forKeyedSubscript:@"WiFiInRoamSuppressedCount"];

  inRoamSuppressionWaitForRoamStart = self->_inRoamSuppressionWaitForRoamStart;
  *(float *)&inRoamSuppressionWaitForRoamStart = inRoamSuppressionWaitForRoamStart;
  [MEMORY[0x189607968] numberWithFloat:inRoamSuppressionWaitForRoamStart];
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v99 forKeyedSubscript:@"WiFiInRoamSuppressedWaitForRoamStart"];

  inRoamSuppressionWaitForRoamEnd = self->_inRoamSuppressionWaitForRoamEnd;
  *(float *)&inRoamSuppressionWaitForRoamEnd = inRoamSuppressionWaitForRoamEnd;
  [MEMORY[0x189607968] numberWithFloat:inRoamSuppressionWaitForRoamEnd];
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v101 forKeyedSubscript:@"WiFiInRoamSuppressedWaitForRoamEnd"];
  v102 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inScanDuration,  self->_sessionDuration);
  [v6 setObject:v102 forKeyedSubscript:@"WiFiInScanDuration"];
  v103 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inSoftApDuration,  self->_sessionDuration);
  [v6 setObject:v103 forKeyedSubscript:@"WiFiInSoftApDuration"];

  [MEMORY[0x189607968] numberWithBool:p_isSessionActive[8]];
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v104 forKeyedSubscript:@"WiFiIsPoweredOn"];
  v105 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_neighborBssCount);
  [v6 setObject:v105 forKeyedSubscript:@"WiFiBssNeighborCount"];
  v106 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_otherBssCount);
  [v6 setObject:v106 forKeyedSubscript:@"WiFiBssOtherCount"];
  v107 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_poweredOnDuration,  self->_sessionDuration);
  [v6 setObject:v107 forKeyedSubscript:@"WiFiPoweredOnDuration"];
  v108 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_associatedDuration,  self->_sessionDuration);
  [v6 setObject:v108 forKeyedSubscript:@"WiFiAssociatedDuration"];
  v109 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_associatedSleepDuration,  self->_sessionDuration);
  [v6 setObject:v109 forKeyedSubscript:@"WiFiAssociatedSleepDuration"];
  v110 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inCellularFallbackDuration,  self->_sessionDuration);
  [v6 setObject:v110 forKeyedSubscript:@"WiFiInCellularFallbackDuration"];
  v111 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_cellularFallbackStateChangedCount);
  [v6 setObject:v111 forKeyedSubscript:@"WiFiCellularFallbackStateChangedCount"];
  v112 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inCellularOutrankingDuration,  self->_sessionDuration);
  [v6 setObject:v112 forKeyedSubscript:@"WiFiInCellularOutrankingDuration"];
  v113 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_cellularOutrankingStateChangedCount);
  [v6 setObject:v113 forKeyedSubscript:@"WiFiCellularOutrankingStateChangedCount"];
  v114 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_controlCenterStateChangedCount);
  [v6 setObject:v114 forKeyedSubscript:@"WiFiControlCenterStateChangedCount"];
  v115 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_controlCenterToggleEventCount);
  [v6 setObject:v115 forKeyedSubscript:@"WiFiControlCenterToggleEventCount"];
  v116 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inControlCenterAutoJoinDisabledDuration,  self->_sessionDuration);
  [v6 setObject:v116 forKeyedSubscript:@"WiFiControlCenterAutoJoinDisabledDuration"];
  v117 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_rangingEventCount);
  [v6 setObject:v117 forKeyedSubscript:@"WiFiRangingEventCount"];

  [MEMORY[0x189607968] numberWithBool:p_isSessionActive[15]];
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v118 forKeyedSubscript:@"SystemInAirplaneMode"];

  [v6 setObject:self->_cellularDataStatus forKeyedSubscript:@"SystemCellularDataStatus"];
  v119 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_airplaneModeStateChangedCount);
  [v6 setObject:v119 forKeyedSubscript:@"SystemAirplaneModeStateChangedCount"];
  v120 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_linkRecoveryDisabledDuration,  self->_sessionDuration);
  [v6 setObject:v120 forKeyedSubscript:@"WiFiLinkRecoveryDisabledDuration"];
  v121 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_linkRecoveryDisabledCount);
  [v6 setObject:v121 forKeyedSubscript:@"WiFiLinkRecoveryDisabledCount"];
  v122 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_wowStateChangedCount);
  [v6 setObject:v122 forKeyedSubscript:@"WiFiWoWStateChangedCount"];
  v123 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inWowStateDuration,  self->_sessionDuration);
  [v6 setObject:v123 forKeyedSubscript:@"WiFiWoWStateDuration"];
  v124 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_lpasStateChangedCount);
  [v6 setObject:v124 forKeyedSubscript:@"WiFiLPASStateChangedCount"];
  v125 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inLpasStateDuration,  self->_sessionDuration);
  [v6 setObject:v125 forKeyedSubscript:@"WiFiLPASStateDuration"];
  v126 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_lowPowerStateChangedCount);
  [v6 setObject:v126 forKeyedSubscript:@"WiFiLowPowerStateChangedCount"];
  v127 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inLowPowerStateDuration,  self->_sessionDuration);
  [v6 setObject:v127 forKeyedSubscript:@"WiFiLowPowerStateDuration"];
  v128 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_batterySaverStateChangedCount);
  [v6 setObject:v128 forKeyedSubscript:@"WiFiBatterySaverStateChangedCount"];
  v129 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inBatterySaverStateDuration,  self->_sessionDuration);
  [v6 setObject:v129 forKeyedSubscript:@"WiFiBatterySaverStateDuration"];
  v130 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_consecutiveJoinFailureCount);
  [v6 setObject:v130 forKeyedSubscript:@"WiFiConsecutiveJoinFailureCount"];
  v131 = +[WiFiUsagePrivacyFilter numberWithDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithDuration:",  self->_longestUnassociatedDuration);
  [v6 setObject:v131 forKeyedSubscript:@"WiFiLongestUnassociatedDuration"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:(unint64_t)(self->_sleepPowerStatsTotalDuration / 1000.0)];
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v132 forKeyedSubscript:@"WiFiSleepPowerStatsDurationTotal"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:(unint64_t)(self->_sleepPowerStatsUnassociatedDuration / 1000.0)];
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v133 forKeyedSubscript:@"WiFiSleepPowerStatsDurationUnassociated"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:(unint64_t)(self->_sleepPowerStatsAssociatedDuration / 1000.0)];
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v134 forKeyedSubscript:@"WiFiSleepPowerStatsDurationAssociated"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:(unint64_t)(self->_sleepPowerStatsRoamingDuration / 1000.0)];
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v135 forKeyedSubscript:@"WiFiSleepPowerStatsDurationRoaming"];

  sessionDuration = self->_sessionDuration;
  v137 = *(_OWORD *)&self->_bandUsageDuration.valueByBand[2];
  v387 = *(_OWORD *)self->_bandUsageDuration.valueByBand;
  v388 = v137;
  v138 = +[WiFiUsagePrivacyFilter getLabelForBandUsageDuration:overTotalDuration:binned:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForBandUsageDuration:overTotalDuration:binned:",  &v387,  1LL,  sessionDuration);
  [v6 setObject:v138 forKeyedSubscript:@"WiFiBandUsageDuration"];

  [(id)objc_opt_class() joinReasonString:self->_lastJoinReason];
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v139 forKeyedSubscript:@"WiFiNetworkJoinReason"];

  [MEMORY[0x189607968] numberWithInteger:self->_lastJoinFailure];
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v140 forKeyedSubscript:@"WiFiNetworkJoinFailure"];

  [MEMORY[0x189607968] numberWithBool:self->_lastJoinFailure == 0];
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v141 forKeyedSubscript:@"WiFiNetworkJoinResult"];

  [(id)objc_opt_class() disconnectReasonString:self->_lastDisconnectReason];
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v142 forKeyedSubscript:@"WiFiNetworkDisconnectReason"];

  [MEMORY[0x189607968] numberWithInteger:self->_lastDisconnectSubreason];
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v143 forKeyedSubscript:@"WiFiNetworkDisconnectSubreason"];

  [(id)objc_opt_class() disconnectReasonString:self->_previousDisconnectReason];
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v144 forKeyedSubscript:@"WiFiNetworkPreviousDisconnectReason"];
  v145 = -[WiFiUsageSession responsivenessScore](self, "responsivenessScore");
  [v6 setObject:v145 forKeyedSubscript:@"WiFiNetworkResponsivenessScore"];
  v146 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[1]);
  [v6 setObject:v146 forKeyedSubscript:@"ScanCountForAutoJoinPrevChannel"];
  v147 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[2]);
  [v6 setObject:v147 forKeyedSubscript:@"ScanCountForAutoJoinMruChannels"];
  v148 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[3]);
  [v6 setObject:v148 forKeyedSubscript:@"ScanCountForAutoJoinRemChannels"];
  v149 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[4]);
  [v6 setObject:v149 forKeyedSubscript:@"ScanCountForAutoJoin2GHz"];
  v150 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[5]);
  [v6 setObject:v150 forKeyedSubscript:@"ScanCountForAutoJoin5GHz"];
  v151 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[7]);
  [v6 setObject:v151 forKeyedSubscript:@"ScanCountForAutoJoinHiddenNetwork"];
  v152 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[6]);
  [v6 setObject:v152 forKeyedSubscript:@"ScanCountForAutoJoinAllChannels"];
  v153 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[20]);
  [v6 setObject:v153 forKeyedSubscript:@"ScanCountForUnifiedAutoJoinNoSSIDList"];
  v154 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[21]);
  [v6 setObject:v154 forKeyedSubscript:@"ScanCountForUnifiedAutoJoinSSIDList"];
  v155 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[21] + self->_perClientScanCount[20]);
  [v6 setObject:v155 forKeyedSubscript:@"ScanCountForUnifiedAutoJoin"];
  v156 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[8]);
  [v6 setObject:v156 forKeyedSubscript:@"ScanCountForSettings"];
  v157 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[9]);
  [v6 setObject:v157 forKeyedSubscript:@"ScanCountForATJ"];
  v158 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[10]);
  [v6 setObject:v158 forKeyedSubscript:@"ScanCountForControlCenter"];
  v159 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[11]);
  [v6 setObject:v159 forKeyedSubscript:@"ScanCountForApp"];
  v160 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[12]);
  [v6 setObject:v160 forKeyedSubscript:@"ScanCountForHomeKit"];
  v161 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[13]);
  [v6 setObject:v161 forKeyedSubscript:@"ScanCountForConfigd"];
  v162 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[26]);
  [v6 setObject:v162 forKeyedSubscript:@"ScanCountForMilod"];
  v163 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[14]);
  [v6 setObject:v163 forKeyedSubscript:@"ScanCountForOtherClient"];
  v164 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[15]);
  [v6 setObject:v164 forKeyedSubscript:@"ScanCountForNetworkTransition"];
  v165 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[16]);
  [v6 setObject:v165 forKeyedSubscript:@"ScanCountForLocation"];
  v166 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[17]);
  [v6 setObject:v166 forKeyedSubscript:@"ScanCountForIndoor"];
  v167 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[18]);
  [v6 setObject:v167 forKeyedSubscript:@"ScanCountForAutoHotspot"];
  v168 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_perClientScanCount[19]);
  [v6 setObject:v168 forKeyedSubscript:@"ScanCountForPersonalHotspot"];
  v169 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[1]);
  [v6 setObject:v169 forKeyedSubscript:@"FaultReasonDnsFailureCount"];
  v170 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[2]);
  [v6 setObject:v170 forKeyedSubscript:@"FaultReasonArpFailureCount"];
  v171 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[4]);
  [v6 setObject:v171 forKeyedSubscript:@"FaultReasonShortFlowCount"];
  v172 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[5]);
  [v6 setObject:v172 forKeyedSubscript:@"FaultReasonRTTFailureCount"];
  v173 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[3]);
  [v6 setObject:v173 forKeyedSubscript:@"FaultReasonSymptomDataStallCount"];
  v174 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[6]);
  [v6 setObject:v174 forKeyedSubscript:@"FaultReasonL2DatapathStallCount"];
  v175 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[7]);
  [v6 setObject:v175 forKeyedSubscript:@"FaultReasonWatchdogResetCount"];
  v176 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[8]);
  [v6 setObject:v176 forKeyedSubscript:@"FaultReasonBlocklistedSsidCount"];
  v177 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[9]);
  [v6 setObject:v177 forKeyedSubscript:@"FaultReasonBlocklistedBssidCount"];
  v178 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[21]);
  [v6 setObject:v178 forKeyedSubscript:@"FaultReasonFirmwareTrapCount"];
  v179 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[24]);
  [v6 setObject:v179 forKeyedSubscript:@"FaultReasonDextCrashed"];
  v180 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[10]);
  [v6 setObject:v180 forKeyedSubscript:@"FaultReasonSlowWiFi"];
  v181 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[11]);
  [v6 setObject:v181 forKeyedSubscript:@"FaultReasonPrivateMACFallback"];
  v182 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[12]);
  [v6 setObject:v182 forKeyedSubscript:@"FaultReasonDelayedAutoJoin"];
  v183 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[13]);
  [v6 setObject:v183 forKeyedSubscript:@"FaultReasonDhcpFailure"];
  v184 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[14]);
  [v6 setObject:v184 forKeyedSubscript:@"FaultReasonLinkTestLocalCheckFailure"];
  v185 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[15]);
  [v6 setObject:v185 forKeyedSubscript:@"FaultReasonLinkTestInternetCheckFailure"];
  v186 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[16]);
  [v6 setObject:v186 forKeyedSubscript:@"FaultReasonLinkTestDNSCheckFailure"];
  v187 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[17]);
  [v6 setObject:v187 forKeyedSubscript:@"FaultReasonArpFailure"];
  v188 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[18]);
  [v6 setObject:v188 forKeyedSubscript:@"FaultReasonSlowWiFiDnsFailure"];
  v189 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[19]);
  [v6 setObject:v189 forKeyedSubscript:@"FaultReasonSlowWiFiDUT"];
  v190 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[20]);
  [v6 setObject:v190 forKeyedSubscript:@"FaultReasonUserOverridesCellularOutranking"];
  v191 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[22]);
  [v6 setObject:v191 forKeyedSubscript:@"FaultReasonSleepPowerBudgetExceeded"];
  v192 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[23]);
  [v6 setObject:v192 forKeyedSubscript:@"FaultReasonLowPowerBudgetExceeded"];
  v193 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[25]);
  [v6 setObject:v193 forKeyedSubscript:@"FaultReasonSiriTimedOut"];
  v194 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[26]);
  [v6 setObject:v194 forKeyedSubscript:@"FaultReasonApsdTimedOut"];
  v195 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_faultReasonCount[27]);
  [v6 setObject:v195 forKeyedSubscript:@"FaultReasonBrokenBackhaulLinkFailed"];
  v196 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_triggerDisconnectAlertedCount);
  [v6 setObject:v196 forKeyedSubscript:@"TriggerDisconnectAlertedCount"];
  v197 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_triggerDisconnectConfirmedCount);
  [v6 setObject:v197 forKeyedSubscript:@"TriggerDisconnectConfirmedCount"];
  v198 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_triggerDisconnectExecutedCount);
  [v6 setObject:v198 forKeyedSubscript:@"TriggerDisconnectExecutedCount"];
  v199 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonInitialAssociationCount);
  [v6 setObject:v199 forKeyedSubscript:@"RoamReasonInitialAssociationCount"];
  v200 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonLowRssiCount);
  [v6 setObject:v200 forKeyedSubscript:@"RoamReasonLowRssiCount"];
  v201 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonDeauthDisassocCount);
  [v6 setObject:v201 forKeyedSubscript:@"RoamReasonDeauthDisassocCount"];
  v202 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonBeaconLostCount);
  [v6 setObject:v202 forKeyedSubscript:@"RoamReasonBeaconLostCount"];
  v203 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonSteeredByApCount);
  [v6 setObject:v203 forKeyedSubscript:@"RoamReasonSteeredByApCount"];
  v204 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonSteeredByBtmCount);
  [v6 setObject:v204 forKeyedSubscript:@"RoamReasonSteeredByBtmCount"];
  v205 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonSteeredByCsaCount);
  [v6 setObject:v205 forKeyedSubscript:@"RoamReasonSteeredByCsaCount"];
  v206 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonReassocRequestedCount);
  [v6 setObject:v206 forKeyedSubscript:@"RoamReasonReassocRequestedCount"];
  v207 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonHostTriggeredCount);
  [v6 setObject:v207 forKeyedSubscript:@"RoamReasonHostTriggeredCount"];
  v208 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonBetterCandidateCount);
  [v6 setObject:v208 forKeyedSubscript:@"RoamReasonBetterCandidateCount"];
  v209 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonBetterConditionCount);
  [v6 setObject:v209 forKeyedSubscript:@"RoamReasonBetterConditionCount"];
  v210 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamReasonMiscCount);
  [v6 setObject:v210 forKeyedSubscript:@"RoamReasonMiscCount"];
  v211 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamStatusSucceededCount);
  [v6 setObject:v211 forKeyedSubscript:@"RoamStatusSucceededCount"];
  v212 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamStatusFailedCount);
  [v6 setObject:v212 forKeyedSubscript:@"RoamStatusFailedCount"];
  v213 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamStatusNoCandidateCount);
  [v6 setObject:v213 forKeyedSubscript:@"RoamStatusNoCandidateCount"];
  v214 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamStatusNoQualifiedCandidateCount);
  [v6 setObject:v214 forKeyedSubscript:@"RoamStatusNoQualifiedCandidateCount"];
  v215 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamStatusFailedNoScan);
  [v6 setObject:v215 forKeyedSubscript:@"RoamStatusFailedNoScan"];
  v216 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamIsWNMScoreUsedCount);
  [v6 setObject:v216 forKeyedSubscript:@"RoamWNMScoreUsedCount"];
  v217 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamPingPongAboveThresholdCount);
  [v6 setObject:v217 forKeyedSubscript:@"RoamPingPongAboveThresholdCount"];
  v218 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamPingPongAboveThresholdCountLowRssiOnly);
  [v6 setObject:v218 forKeyedSubscript:@"RoamPingPongAboveThresholdCountLowRssiOnly"];
  v219 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamPingPongLowRssiAndReassocOnly);
  [v6 setObject:v219 forKeyedSubscript:@"RoamPingPongLowRssiAndReassocOnly"];
  v220 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_roamPingPongReassocOnly);
  [v6 setObject:v220 forKeyedSubscript:@"RoamPingPongReassocOnly"];

  [v6 setObject:self->_lastDriverUnavailableReason forKeyedSubscript:@"LastDriverUnavailableReason"];
  v221 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_driverUnavailabilityCount);
  [v6 setObject:v221 forKeyedSubscript:@"DriverUnavailabilityCount"];
  v222 = +[WiFiUsagePrivacyFilter numberWithDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithDuration:",  self->_driverProcessLifespan);
  [v6 setObject:v222 forKeyedSubscript:@"DriverProcessLifespan"];
  v223 = +[WiFiUsagePrivacyFilter numberWithDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithDuration:",  self->_driverAvailabilityLifespan);
  [v6 setObject:v223 forKeyedSubscript:@"DriverAvailabilityLifespan"];

  -[NSDate timeIntervalSinceDate:](self->_sessionInitTime, "timeIntervalSinceDate:", self->_processInitTime);
  v224 = +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithDurationMillisecond:");
  [v6 setObject:v224 forKeyedSubscript:@"DriverAvailabilityLatencyFromProcessInit"];
  v225 = +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithDurationMillisecond:",  self->_driverAvailabilityLatencyFromChipReset);
  [v6 setObject:v225 forKeyedSubscript:@"DriverAvailableLatencyFromChipReset"];
  v226 = +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithDurationMillisecond:",  self->_driverAvailabilityLatencyFromTermination);
  [v6 setObject:v226 forKeyedSubscript:@"DriverAvailableLatencyFromTermination"];
  v227 = +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithDurationMillisecond:",  self->_joinScanLatencyFromDriverAvailability);
  [v6 setObject:v227 forKeyedSubscript:@"JoinScanLatencyFromDriverAvailability"];
  v228 = +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithDurationMillisecond:",  self->_joinStartedLatencyFromDriverAvailability);
  [v6 setObject:v228 forKeyedSubscript:@"JoinStartedLatencyFromDriverAvailability"];
  v229 = +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithDurationMillisecond:",  self->_joinLinkUpLatencyFromDriverAvailability);
  [v6 setObject:v229 forKeyedSubscript:@"JoinLinkUpLatencyFromDriverAvailability"];
  v230 = +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithDurationMillisecond:",  self->_joinIpConfigurationLatencyFromDriverAvailability);
  [v6 setObject:v230 forKeyedSubscript:@"JoinIpConfigurationLatencyFromDriverAvailability"];
  v231 = +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithDurationMillisecond:",  self->_joinInterfaceRankingLatencyFromDriverAvailability);
  [v6 setObject:v231 forKeyedSubscript:@"JoinInterfaceRankingLatencyFromDriverAvailability"];
  v232 = +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithDurationMillisecond:",  self->_joinLinkUpLatencyFromSessionStart);
  [v6 setObject:v232 forKeyedSubscript:@"JoinLinkUpLatencySinceSessionStart"];

  [MEMORY[0x189607968] numberWithBool:p_isSessionActive[12]];
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v233 forKeyedSubscript:@"WiFiCompatibilityModeEnabledAtStart"];

  [MEMORY[0x189607968] numberWithBool:p_isSessionActive[13]];
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v234 forKeyedSubscript:@"WiFiCompatibilityModeEnabledAtEnd"];

  [MEMORY[0x189607968] numberWithInteger:self->_compatibilityModeChangeCount];
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v235 forKeyedSubscript:@"WiFiCompatibilityModeChangeCount"];
  v236 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inCompatibilityModeEnabledDuration,  self->_sessionDuration);
  [v6 setObject:v236 forKeyedSubscript:@"WiFiCompatibilityModeEnabledDuration"];

  [v6 setObject:self->_networkDisable6eModeAtStart forKeyedSubscript:@"NetworkDisable6EModeAtStart"];
  [MEMORY[0x189607968] numberWithInteger:self->_network6eDisabledModeChangeCount];
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v237 forKeyedSubscript:@"NetworkDisable6EModeChangeCount"];
  v238 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inNetwork6eModeOffDuration,  self->_sessionDuration);
  [v6 setObject:v238 forKeyedSubscript:@"NetworkIn6EModeOffDuration"];

  if (-[WiFiUsageSession bandAtSessionStart](self, "bandAtSessionStart") == 2)
  {
    objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[WiFiUsageSession infraIsPartOfSplitSSID](self, "infraIsPartOfSplitSSID"));
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v239 forKeyedSubscript:@"infraIsPartOfSplitSSID"];
  }
  v240 = +[WiFiUsagePrivacyFilter getLabelForNeighborsByBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForNeighborsByBand:",  self->_roamNeighborsByBand);
  [v6 setObject:v240 forKeyedSubscript:@"RoamNeighborsCountByBand"];
  v241 = +[WiFiUsagePrivacyFilter getSumArrayCountAllBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getSumArrayCountAllBand:",  self->_roamNeighborsByBand);
  [v6 setObject:v241 forKeyedSubscript:@"RoamNeighborsCountTotal"];
  v242 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_minCandidatesCount);
  [v6 setObject:v242 forKeyedSubscript:@"RoamCandidatesCountMin"];
  v243 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_maxCandidatesCount);
  [v6 setObject:v243 forKeyedSubscript:@"RoamCandidatesCountMax"];

  roamReasonLowRssiCount = self->_roamReasonLowRssiCount;
  if (roamReasonLowRssiCount)
  {
    v245 = +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinEvery10Over100:As:",  100 * self->_currentRSSIStrongestCount / roamReasonLowRssiCount,  0LL);
    [v6 setObject:v245 forKeyedSubscript:@"RoamCandidatesLowRssiCurrentBSSIsBestPerc"];
  }

  else
  {
    [v6 setObject:0 forKeyedSubscript:@"RoamCandidatesLowRssiCurrentBSSIsBestPerc"];
  }

  v246 = *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2];
  v387 = *(_OWORD *)self->_strongestRSSICountByBand.valueByBand;
  v388 = v246;
  v247 = +[WiFiUsagePrivacyFilter getLabelForPercIntegerByBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForPercIntegerByBand:",  &v387);
  [v6 setObject:v247 forKeyedSubscript:@"RoamCandidatesStrongestRssiByBandPerc"];

  v248 = *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2];
  v387 = *(_OWORD *)self->_strongestRSSIByBand.valueByBand;
  v388 = v248;
  v249 = +[WiFiUsagePrivacyFilter getLabelForRssiByBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForRssiByBand:",  &v387);
  [v6 setObject:v249 forKeyedSubscript:@"RoamCandidatesStrongestRssiByBand"];

  v250 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][0];
  v389 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[1][1];
  v390 = v250;
  v391 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][2];
  v392 = *(void *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valid[2][2];
  v251 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][2];
  v387 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][0];
  v388 = v251;
  v252 = +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBandTransition:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForRssiDeltaByBandTransition:",  &v387);
  [v6 setObject:v252 forKeyedSubscript:@"RoamCandidatesSmallestDiffCurrentToNextBestRSSIByBand"];

  v253 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][0];
  v389 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[1][1];
  v390 = v253;
  v391 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][2];
  v392 = *(void *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valid[2][2];
  v254 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][2];
  v387 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][0];
  v388 = v254;
  v255 = +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBandTransition:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForRssiDeltaByBandTransition:",  &v387);
  [v6 setObject:v255 forKeyedSubscript:@"RoamCandidatesLargestDiffCurrentToNextBestRSSIByBand"];

  v256 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][0];
  v389 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[1][1];
  v390 = v256;
  v391 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][2];
  v392 = *(void *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valid[2][2];
  v257 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][2];
  v387 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][0];
  v388 = v257;
  v258 = +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBandTransition:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForRssiDeltaByBandTransition:",  &v387);
  [v6 setObject:v258 forKeyedSubscript:@"RoamCandidatesSmallestDiffCurrentToBestRSSIByBand"];

  v259 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][0];
  v389 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[1][1];
  v390 = v259;
  v391 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][2];
  v392 = *(void *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valid[2][2];
  v260 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][2];
  v387 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][0];
  v388 = v260;
  v261 = +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBandTransition:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForRssiDeltaByBandTransition:",  &v387);
  [v6 setObject:v261 forKeyedSubscript:@"RoamCandidatesLargestDiffCurrentToBestRSSIByBand"];

  +[WiFiUsagePrivacyFilter getModeCountersByCandidatesByBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getModeCountersByCandidatesByBand:",  self->_roamCandidatesPerBandWhenSuccessful);
  v262 = +[WiFiUsagePrivacyFilter getLabelForIntegerByBand:withCap:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForIntegerByBand:withCap:",  v386,  1LL);
  [v6 setObject:v262 forKeyedSubscript:@"RoamCandidatesModeSuccessfulRoams"];

  +[WiFiUsagePrivacyFilter getModeCountersByCandidatesByBand:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getModeCountersByCandidatesByBand:",  self->_roamCandidatesPerBandWhenUnSuccessful);
  v263 = +[WiFiUsagePrivacyFilter getLabelForIntegerByBand:withCap:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForIntegerByBand:withCap:",  &v385,  1LL);
  [v6 setObject:v263 forKeyedSubscript:@"RoamCandidatesModeUnsuccessfulRoams"];

  if (self->_ipV4DetailsPrevSession)
  {
    [MEMORY[0x189607968] numberWithBool:p_isSessionActive[19]];
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v264 forKeyedSubscript:@"ipv4ParamChange"];
  }

  if (self->_ipV6DetailsPrevSession)
  {
    [MEMORY[0x189607968] numberWithBool:p_isSessionActive[20]];
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v265 forKeyedSubscript:@"ipv6ParamChange"];
  }

  if (-[NSMutableArray count](self->_prevNetworkNames, "count") == 2)
  {
    v266 = (void *)MEMORY[0x189607968];
    v267 = -[WiFiUsageNetworkDetails networkName](self->_networkDetails, "networkName");
    v268 = -[NSMutableArray objectAtIndex:](self->_prevNetworkNames, "objectAtIndex:", 0LL);
    objc_msgSend(v266, "numberWithBool:", objc_msgSend(v267, "isEqualToString:", v268));
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v269 forKeyedSubscript:@"PrevJoinLeftSameSSID"];
  }

  if (self->_prevJoinReason != -1LL)
  {
    [(id)objc_opt_class() joinReasonString:self->_prevJoinReason];
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v270 forKeyedSubscript:@"PrevJoinReason"];
    v271 = +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinFor:In:WithLowestEdge:As:",  (unint64_t)self->_timeSincePrevJoin,  &unk_18A1B5990,  @"0",  1LL);
    [v6 setObject:v271 forKeyedSubscript:@"timeSincePrevJoin"];
  }

  [MEMORY[0x189607968] numberWithBool:p_isSessionActive[23]];
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v272 forKeyedSubscript:@"inCoexRealTimeAtJoin"];

  [MEMORY[0x189607968] numberWithBool:p_isSessionActive[22]];
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v273 forKeyedSubscript:@"inCoexRealTimeAtSessionStart"];

  [MEMORY[0x189607968] numberWithBool:p_isSessionActive[21]];
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v274 forKeyedSubscript:@"inCoexRealTimeAtSessionEnd"];

  if (self->_lastCoexRealTimeOn)
  {
    v275 = (void *)MEMORY[0x189607968];
    -[NSDate timeIntervalSinceDate:](self->_sessionEndTime, "timeIntervalSinceDate:");
    [v275 numberWithInteger:(unint64_t)v276];
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v277 forKeyedSubscript:@"timeSinceLastRTCoexStarted"];
  }

  if (self->_lastCoexRealTimeOff)
  {
    v278 = (void *)MEMORY[0x189607968];
    -[NSDate timeIntervalSinceDate:](self->_sessionEndTime, "timeIntervalSinceDate:");
    [v278 numberWithInteger:(unint64_t)v279];
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v280 forKeyedSubscript:@"timeSinceLastRTCoexEnded"];
  }
  v281 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_joinReasonCount[1]);
  [v6 setObject:v281 forKeyedSubscript:@"JoinReasonAutoCount"];
  v282 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_joinReasonCount[2]);
  [v6 setObject:v282 forKeyedSubscript:@"JoinReasonSettingsCount"];
  v283 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_joinReasonCount[3]);
  [v6 setObject:v283 forKeyedSubscript:@"JoinReasonAskToJoinCount"];
  v284 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_joinReasonCount[4]);
  [v6 setObject:v284 forKeyedSubscript:@"JoinReasonRecommendationCount"];
  v285 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_joinReasonCount[5]);
  [v6 setObject:v285 forKeyedSubscript:@"JoinReasonApplicationCount"];
  v286 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_joinReasonCount[6]);
  [v6 setObject:v286 forKeyedSubscript:@"JoinReasonHomeKitCount"];
  v287 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_joinReasonCount[7]);
  [v6 setObject:v287 forKeyedSubscript:@"JoinReasonControlCenterCount"];
  v288 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_joinReasonCount[8]);
  [v6 setObject:v288 forKeyedSubscript:@"JoinReasonOtherClientCount"];
  v289 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_joinReasonCount[9]);
  [v6 setObject:v289 forKeyedSubscript:@"JoinReasonLegacyTransitionCount"];
  v290 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_joinReasonCount[10]);
  [v6 setObject:v290 forKeyedSubscript:@"JoinReasonAutoHotspotCount"];
  v291 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_joinReasonCount[11]);
  [v6 setObject:v291 forKeyedSubscript:@"JoinReasonUserOverridesAutoJoinDenyListCount"];
  v292 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_joinReasonCount[12]);
  [v6 setObject:v292 forKeyedSubscript:@"JoinReasonSeamlessTransitionCount"];
  v293 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_joinReasonCount[13]);
  [v6 setObject:v293 forKeyedSubscript:@"JoinReasonSetupCount"];
  v294 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_joinReasonCount[14]);
  [v6 setObject:v294 forKeyedSubscript:@"JoinReasonSharingCount"];

  if (self->_countRoamScan)
  {
    [MEMORY[0x189607968] numberWithBool:p_isSessionActive[28]];
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v295 forKeyedSubscript:@"LastRoamScanFoundSSIDTransitionTarget"];
    v296 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_countSSIDTransitionTargetInLastRoamScan);
    [v6 setObject:v296 forKeyedSubscript:@"LastRoamScanFoundSSIDTransitionTargetCount"];
    v297 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_countRoamScanThatFoundSSIDTransitionTarget);
    [v6 setObject:v297 forKeyedSubscript:@"FoundSSIDTransitionTargetRoamScanCount"];

    objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  (uint64_t)(float)((float)((float)self->_countRoamScanThatFoundSSIDTransitionTarget * 100.0)
                     / (float)self->_countRoamScan));
    v298 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v298 forKeyedSubscript:@"RoamScanFoundSSIDTransitionTargetAsPercOfFailedRoam"];

    [MEMORY[0x189607968] numberWithBool:p_isSessionActive[29]];
    v299 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v299 forKeyedSubscript:@"LastRoamScanFoundPotentialSSIDTransitionCandidate"];
    v300 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_countSSIDTransitionPotentialCandidatesInLastRoamScan);
    [v6 setObject:v300 forKeyedSubscript:@"LastRoamScanPotentialSSIDTransitionCandidateCount"];
    v301 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet);
    [v6 setObject:v301 forKeyedSubscript:@"LastRoamScanPotentialSSIDTransitionCandidateNotSSIDTransitionTargetCount"];
    v302 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_countRoamScanThatFoundSSIDTransitionPotentialCandidate);
    [v6 setObject:v302 forKeyedSubscript:@"FoundPotentialSSIDTransitionCandidateRoamScanCount"];

    objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  (uint64_t)(float)((float)((float)self->_countRoamScanThatFoundSSIDTransitionPotentialCandidate * 100.0)
                     / (float)self->_countRoamScan));
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v303 forKeyedSubscript:@"RoamScanFoundPotentialSSIDTransitionCandidateAsPercOfFailedRoam"];

    [MEMORY[0x189607968] numberWithBool:p_isSessionActive[30]];
    v304 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v304 forKeyedSubscript:@"LastRoamScanContainsRoamCandidate"];
    v305 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  p_isSessionActive[30]);
    [v6 setObject:v305 forKeyedSubscript:@"LastRoamScanContainsRoamCandidateCount"];
    v306 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_lastRoamScanUniqueChannelsCount);
    [v6 setObject:v306 forKeyedSubscript:@"LastRoamScanUniqueChannelsCount"];
    v307 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_lastRoamScanUniqueBandsCount);
    [v6 setObject:v307 forKeyedSubscript:@"LastRoamScanUniqueBandsCount"];
  }

  if (self->_type != 9)
  {
    v308 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_inPoorLinkSessionCount);
    [v6 setObject:v308 forKeyedSubscript:@"WiFiInPoorLinkSessionCount"];
    v309 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inPoorLinkSessionDuration,  self->_sessionDuration);
    [v6 setObject:v309 forKeyedSubscript:@"WiFiInPoorLinkSessionDurationPerc"];
    v310 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inPoorLinkSessionDuration,  self->_associatedDuration);
    [v6 setObject:v310 forKeyedSubscript:@"WiFiInPoorLinkAssocPerc"];
    v311 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_tdAfterJoinAfterTDCount);
    [v6 setObject:v311 forKeyedSubscript:@"TDAfterJoinAfterTDCount"];

    if (self->_min_subsequentTdAfterJoinAfterTDCount == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v6 setObject:0 forKeyedSubscript:@"TDAfterJoinAfterTDMinSequenceLen"];
    }

    else
    {
      v312 = +[WiFiUsagePrivacyFilter numberWithInstances:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "numberWithInstances:");
      [v6 setObject:v312 forKeyedSubscript:@"TDAfterJoinAfterTDMinSequenceLen"];
    }
    v313 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_max_subsequentTdAfterJoinAfterTDCount);
    [v6 setObject:v313 forKeyedSubscript:@"TDAfterJoinAfterTDMaxSequenceLen"];
    v314 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_tdSessionStartedByBadRSSICount);
    [v6 setObject:v314 forKeyedSubscript:@"PoorLinkSessionStartedByBadRSSICount"];
    v315 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_tdSessionStartedByTDRecommendedCount);
    [v6 setObject:v315 forKeyedSubscript:@"PoorLinkSessionStartedByTDRecommendedCount"];
    v316 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_tdSessionStartedBySymptomDNSFailureCount);
    [v6 setObject:v316 forKeyedSubscript:@"PoorLinkSessionStartedBySymptomDNSFailureCount"];
  }
  v317 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_tdEvalEndedCount);
  [v6 setObject:v317 forKeyedSubscript:@"TDEvalEndedCount"];
  v318 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_tdEvalCumulativeDuration,  self->_sessionDuration);
  [v6 setObject:v318 forKeyedSubscript:@"TDEvalDurationPerc"];
  v319 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_tdEvalStartedCount);
  [v6 setObject:v319 forKeyedSubscript:@"TDEvalStartedCount"];
  v320 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_tdEvalStartedByBadRSSICount);
  [v6 setObject:v320 forKeyedSubscript:@"TDEvalStartedByBadRSSICount"];
  v321 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_tdEvalStartedBySymptomsARPFailureCount);
  [v6 setObject:v321 forKeyedSubscript:@"TDEvalStartedBySymptomsARPFailureCount"];
  v322 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_tdEvalStartedBySymptomsShortFlowCount);
  [v6 setObject:v322 forKeyedSubscript:@"TDEvalStartedBySymptomsShortFlowCount"];
  v323 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_tdEvalStartedBySymptomsDataStallCount);
  [v6 setObject:v323 forKeyedSubscript:@"TDEvalStartedBySymptomsDataStallCount"];
  v324 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_tdEvalStartedBySymptomsDNSStallCount);
  [v6 setObject:v324 forKeyedSubscript:@"TDEvalStartedBySymptomsDNSStallCount"];
  v325 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_tdEvalStartedBySymptomsDNSFailCount);
  [v6 setObject:v325 forKeyedSubscript:@"TDEvalStartedBySymptomsDNSFailCount"];
  v326 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_tdEvalStartedByActiveProbingCount);
  [v6 setObject:v326 forKeyedSubscript:@"TDEvalStartedByActiveProbingCount"];
  v327 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_tdEvalStartedByFGNetwAppChangeCount);
  [v6 setObject:v327 forKeyedSubscript:@"TDEvalStartedByFGNetwAppChangeCount"];
  v328 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_tdEvalStartedByUserNotificationCount);
  [v6 setObject:v328 forKeyedSubscript:@"TDEvalStartedByUserNotificationCount"];
  v329 = +[WiFiUsagePrivacyFilter numberWithInstances:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "numberWithInstances:",  self->_tdEvalStartedByCheckReassocCount);
  [v6 setObject:v329 forKeyedSubscript:@"TDEvalStartedByCheckReassocCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_inAWDL_BestInfraScore];
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v330 forKeyedSubscript:@"inAWDL_bestInfraScore"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_inAWDL_WorstInfraScore];
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v331 forKeyedSubscript:@"inAWDL_worstInfraScore"];

  inAWDL_BestP2PScore = self->_inAWDL_BestP2PScore;
  *(float *)&inAWDL_BestP2PScore = inAWDL_BestP2PScore;
  [MEMORY[0x189607968] numberWithFloat:inAWDL_BestP2PScore];
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v333 forKeyedSubscript:@"inAWDL_bestP2PScore"];

  inAWDL_WorstP2PScore = self->_inAWDL_WorstP2PScore;
  *(float *)&inAWDL_WorstP2PScore = inAWDL_WorstP2PScore;
  [MEMORY[0x189607968] numberWithFloat:inAWDL_WorstP2PScore];
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v335 forKeyedSubscript:@"inAWDL_worstP2PScore"];
  v336 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inAWDL_BestInfraScoreDuration,  self->_sessionDuration);
  [v6 setObject:v336 forKeyedSubscript:@"inAWDL_bestInfraScoreDurationPerc"];
  v337 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inAWDL_WorstInfraScoreDuration,  self->_sessionDuration);
  [v6 setObject:v337 forKeyedSubscript:@"inAWDL_worstInfraScoreDurationPerc"];
  v338 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inAWDL_BestP2PScoreDuration,  self->_sessionDuration);
  [v6 setObject:v338 forKeyedSubscript:@"inAWDL_bestP2PScoreDurationPerc"];
  v339 = +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "timePercentage:overTotalDuration:",  self->_inAWDL_WorstP2PScoreDuration,  self->_sessionDuration);
  [v6 setObject:v339 forKeyedSubscript:@"inAWDL_worstP2PScoreDurationPerc"];

  inAWDL_BestInfraScoreDuration = self->_inAWDL_BestInfraScoreDuration;
  *(float *)&inAWDL_BestInfraScoreDuration = inAWDL_BestInfraScoreDuration;
  [MEMORY[0x189607968] numberWithFloat:inAWDL_BestInfraScoreDuration];
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v341 forKeyedSubscript:@"inAWDL_bestInfraScoreDuration"];

  inAWDL_WorstInfraScoreDuration = self->_inAWDL_WorstInfraScoreDuration;
  *(float *)&inAWDL_WorstInfraScoreDuration = inAWDL_WorstInfraScoreDuration;
  [MEMORY[0x189607968] numberWithFloat:inAWDL_WorstInfraScoreDuration];
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v343 forKeyedSubscript:@"inAWDL_worstInfraScoreDuration"];

  inAWDL_BestP2PScoreDuration = self->_inAWDL_BestP2PScoreDuration;
  *(float *)&inAWDL_BestP2PScoreDuration = inAWDL_BestP2PScoreDuration;
  [MEMORY[0x189607968] numberWithFloat:inAWDL_BestP2PScoreDuration];
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v345 forKeyedSubscript:@"inAWDL_bestP2PScoreDuration"];

  inAWDL_WorstP2PScoreDuration = self->_inAWDL_WorstP2PScoreDuration;
  *(float *)&inAWDL_WorstP2PScoreDuration = inAWDL_WorstP2PScoreDuration;
  [MEMORY[0x189607968] numberWithFloat:inAWDL_WorstP2PScoreDuration];
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v347 forKeyedSubscript:@"inAWDL_worstP2PScoreDuration"];

  [MEMORY[0x189607968] numberWithBool:self->_maxPhyMode == 512];
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v348 forKeyedSubscript:@"hasAssocToWiFi7"];

  [MEMORY[0x189607968] numberWithBool:self->_maxPhyMode == 1024];
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v349 forKeyedSubscript:@"hasAssocToWiFi6E"];

  [MEMORY[0x189607968] numberWithBool:self->_maxPhyMode == 256];
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v350 forKeyedSubscript:@"hasAssocToWiFi6"];

  [MEMORY[0x189607968] numberWithBool:self->_maxPhyMode == 128];
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v351 forKeyedSubscript:@"hasAssocToWiFi5"];

  [MEMORY[0x189607968] numberWithBool:self->_maxPhyMode == 16];
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v352 forKeyedSubscript:@"hasAssocToWiFi4"];

  [MEMORY[0x189607968] numberWithBool:self->_maxPhyMode == 8];
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v353 forKeyedSubscript:@"hasAssocToWiFi3"];

  [MEMORY[0x189607968] numberWithBool:self->_maxPhyMode == 2];
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v354 forKeyedSubscript:@"hasAssocToWiFi2"];

  [MEMORY[0x189607968] numberWithBool:self->_maxPhyMode == 4];
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v355 forKeyedSubscript:@"hasAssocToWiFi1"];

  capabilities = self->_capabilities;
  if (!capabilities)
  {
    v357 = -[WiFiUsageInterfaceCapabilities initWithInterfaceName:]( objc_alloc(&OBJC_CLASS___WiFiUsageInterfaceCapabilities),  "initWithInterfaceName:",  self->_interfaceName);
    v358 = self->_capabilities;
    self->_capabilities = v357;

    capabilities = self->_capabilities;
  }
  v359 = +[WiFiUsagePrivacyFilter getLabelForPhyModes:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForPhyModes:",  +[WiFiUsageLQMTransformations maxPhyModeFrom:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "maxPhyModeFrom:",  -[WiFiUsageInterfaceCapabilities supportedPhyModes](capabilities, "supportedPhyModes")));
  [v6 setObject:v359 forKeyedSubscript:@"WiFiRadioTechCapable"];

  if (self->_disconnectReasonMap) {
    objc_msgSend(v6, "addEntriesFromDictionary:");
  }
  lqm = self->_lqm;
  if (lqm)
  {
    v361 = -[WiFiUsageSessionLQM eventDictionary:](lqm, "eventDictionary:", v3);
    [v6 addEntriesFromDictionary:v361];
  }

  networkDetails = self->_networkDetails;
  if (networkDetails)
  {
    v363 = -[WiFiUsageNetworkDetails eventDictionary:](networkDetails, "eventDictionary:", v3);
    [v6 addEntriesFromDictionary:v363];
  }

  [MEMORY[0x189607968] numberWithBool:self->_awdlActiveTime != 0];
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v364 forKeyedSubscript:@"WiFiIsAwdlActive"];

  [MEMORY[0x189607968] numberWithBool:p_isSessionActive[14]];
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v365 forKeyedSubscript:@"WiFiIsLinkRecoveryDisabled"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_forwardedBssInwakeCount];
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v366 forKeyedSubscript:@"forwardedBssInwakeCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_forwardedBssInSleepCount];
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v367 forKeyedSubscript:@"forwardedBssInSleepCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_hostScanTriggersCount];
  v368 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v368 forKeyedSubscript:@"hostScanTriggersCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_roamScanTriggersCount];
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v369 forKeyedSubscript:@"roamScanTriggersCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_pnoScanTriggersCount];
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v370 forKeyedSubscript:@"pnoScanTriggersCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_epnoScanTriggersCount];
  v371 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v371 forKeyedSubscript:@"epnoScanTriggersCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_currentBssMsgInWakeCount];
  v372 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v372 forKeyedSubscript:@"currentBssMsgInWakeCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_currentBssMsgInSleepCount];
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v373 forKeyedSubscript:@"currentBssMsgInSleepCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_scanDataMsgInWakeCount];
  v374 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v374 forKeyedSubscript:@"scanDataMsgInWakeCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_scanDataMsgInSleepCount];
  v375 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v375 forKeyedSubscript:@"scanDataMsgInSleepCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_spmiMsgInAwakeCount];
  v376 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v376 forKeyedSubscript:@"spmiMsgInAwakeCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_spmiMsgInSleepCount];
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v377 forKeyedSubscript:@"spmiMsgInSleepCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_spmiMsgDropRssiFilterCount];
  v378 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v378 forKeyedSubscript:@"spmiMsgDropRssiFilterCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_spmiMsgDropMaxFilterCount];
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v379 forKeyedSubscript:@"spmiMsgDropMaxFilterCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_spmiMsgDropSpmiFailCount];
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v380 forKeyedSubscript:@"spmiMsgDropSpmiFailCount"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_bssDropLowMemoryCount];
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v381 forKeyedSubscript:@"bssDropLowMemoryCount"];

  [MEMORY[0x189607968] numberWithBool:p_isSessionActive[35]];
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v382 forKeyedSubscript:@"NetworkIsInstantHotspot"];

  [MEMORY[0x189607968] numberWithBool:p_isSessionActive[36]];
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v383 forKeyedSubscript:@"NetworkIsAutoHotspot"];

  return v6;
}

    v17 = (void *)NSString;
    v16 = v16;
    v18 = objc_msgSend(v17, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v16, "UTF8String"));
    v19 = [v18 UTF8String];
    *(_DWORD *)buf = 136446210;
    v23 = v19;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    goto LABEL_11;
  }

  -[WFBlacklistEngine setBlacklistDelegate:](v8, "setBlacklistDelegate:", v6);
  -[WFBlacklistEngine setWowBlacklistExpiry:](v8, "setWowBlacklistExpiry:", 600.0);
  -[WFBlacklistEngine setAutojoinBlacklistExpiry:](v8, "setAutojoinBlacklistExpiry:", 300.0);
  -[WFBlacklistEngine setBssBlacklistExpiry:](v8, "setBssBlacklistExpiry:", 300.0);
  v8->_profile = a4;
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  blacklist = v8->_blacklist;
  v8->_blacklist = v9;

  if (!v8->_blacklist)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s _blacklist alloc failed",  "-[WFBlacklistEngine initWithBlacklistDelegate:profile:]");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  v11 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:13];
  ssidThresholds = v8->_ssidThresholds;
  v8->_ssidThresholds = (NSMutableArray *)v11;

  if (!v8->_ssidThresholds)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s  ssidThresholds alloc failed",  "-[WFBlacklistEngine initWithBlacklistDelegate:profile:]");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  v13 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:13];
  bssidThresholds = v8->_bssidThresholds;
  v8->_bssidThresholds = (NSMutableArray *)v13;

  if (!v8->_bssidThresholds)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s  bssidThresholds alloc failed",  "-[WFBlacklistEngine initWithBlacklistDelegate:profile:]");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  -[WFBlacklistEngine setDefaultBlacklistThresholds](v8, "setDefaultBlacklistThresholds");
  v15 = v8;
LABEL_12:

  return v15;
}

  return v8;
}

  return v8;
}

LABEL_12:
    v7 = 0LL;
    goto LABEL_13;
  }
  v4 = -[WiFiLocaleManager testUserDefaults](self, "testUserDefaults");
  v5 = [v4 caseInsensitiveCompare:@"OFF"];

  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Locale from user defaults is disabled",  (uint8_t *)&v15,  2u);
    }

    goto LABEL_12;
  }
  v6 = -[WiFiLocaleManager testUserDefaults](self, "testUserDefaults");
  v7 = (void *)[v6 copy];

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v7;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Using user defaults [%@]",  (uint8_t *)&v15,  0xCu);
  }

  if ([v7 source] == 1)
  {
    v24 = 2LL;
LABEL_17:
    v10->_priority = v24;
    goto LABEL_18;
  }

  if ([v7 source] != 2)
  {
    v24 = 1LL;
    goto LABEL_17;
  }

  v10->_priority = 0LL;
LABEL_18:
  v25 = [MEMORY[0x189603F50] date];
  matchedAt = v10->_matchedAt;
  v10->_matchedAt = (NSDate *)v25;
LABEL_19:

  return v10;
}

  v5 = 0LL;
LABEL_13:
  objc_msgSend( NSString,  "stringWithFormat:",  @"Leave %s",  "-[WFTrafficEngManager initWithTrafficEngDelegate:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    v16 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v15, "UTF8String"));
    v17 = [v16 UTF8String];
    *(_DWORD *)buf = 136446210;
    v21 = v17;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  return v5;
}

  [v4 appendString:@"BTM&"];
  if ((v6 & 8) == 0)
  {
LABEL_6:
    if ((v6 & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    [v4 appendString:@"fastlane&"];
    if ((v6 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  }

  if ([v5 count]) {
    uint64_t v12 = v5;
  }
  else {
    uint64_t v12 = 0LL;
  }
  v13 = v12;

  return v13;
}

    v65 = 0LL;
    goto LABEL_13;
  }

  if (!v12)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:]";
      v77 = 2112;
      v78 = 0LL;
      v66 = (os_log_s *)MEMORY[0x1895F8DA0];
      v67 = "%s - Cannot init Analysis (invalid current rolling window: %@)";
      goto LABEL_11;
    }

    goto LABEL_12;
  }

  v16 = v15;
  [v12 interfaceName];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      [v12 interfaceName];
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:]";
      v77 = 2112;
      v78 = v69;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - Cannot init Analysis (invalid interfaceName on current rolling window: %@)",  location,  0x16u);
    }

    goto LABEL_12;
  }

  v75.receiver = self;
  v75.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMWindowAnalysis;
  v18 = -[WiFiUsageLQMWindowAnalysis init](&v75, sel_init);
  *((void *)v18 + 14) = v16;
  v19 = [v13 copy];
  v20 = (void *)*((void *)v18 + 3);
  *((void *)v18 + 3) = v19;

  objc_storeStrong((id *)v18 + 4, a6);
  *((_BYTE *)v18 + 17) = v9 & 1;
  *((_BYTE *)v18 + 19) = BYTE1(v9) & 1;
  *((_BYTE *)v18 + 20) = BYTE2(v9) & 1;
  [v12 samples];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 lastObject];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 networkDetails];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 connectedBss];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 bssid];
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  [v12 samples];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896079C8] predicateWithFormat:@"networkDetails.connectedBss.bssid == %@", v71];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 filteredArrayUsingPredicate:v26];
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_alloc(&OBJC_CLASS___WiFiUsageLQMRollingWindow);
  [v12 interfaceName];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 duration];
  v30 = v29;
  [v12 capabilities];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[WiFiUsageLQMRollingWindow initWithInterfaceName:andDuration:andInterfaceCapabilities:]( v27,  "initWithInterfaceName:andDuration:andInterfaceCapabilities:",  v28,  v31,  v30);
  v33 = (void *)*((void *)v18 + 17);
  *((void *)v18 + 17) = v32;

  [*((id *)v18 + 17) addSamples:v70];
  [*((id *)v18 + 17) setLabel:@"before"];
  v34 = (void *)*((void *)v18 + 17);
  [v12 capabilities];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v34 setCapabilities:v35];

  v36 = objc_alloc(&OBJC_CLASS___WiFiUsageLQMRollingWindow);
  [v12 interfaceName];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 duration];
  v39 = v38;
  [v12 capabilities];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[WiFiUsageLQMRollingWindow initWithInterfaceName:andDuration:andInterfaceCapabilities:]( v36,  "initWithInterfaceName:andDuration:andInterfaceCapabilities:",  v37,  v40,  v39);
  v42 = (void *)*((void *)v18 + 18);
  *((void *)v18 + 1_Block_object_dispose(va, 8) = v41;

  [*((id *)v18 + 18) setLabel:@"after"];
  v43 = [v12 fgApp];
  v44 = (void *)*((void *)v18 + 10);
  *((void *)v18 + 10) = v43;

  v45 = (void *)MEMORY[0x189603F18];
  [v12 preceedingTriggers];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = [v45 arrayWithArray:v46];
  v48 = (void *)*((void *)v18 + 9);
  *((void *)v18 + 9) = v47;

  v49 = (__CFString *)*((id *)v18 + 3);
  if ([v18 isMemberOfClass:objc_opt_class()])
  {

    v49 = @"GenericTrigger";
  }

  v50 = [NSString stringWithFormat:@"%@.%@.%@", _metricPrefix, _cdfMetricName, v49];
  v51 = (void *)*((void *)v18 + 11);
  *((void *)v18 + 11) = v50;

  v52 = [NSString stringWithFormat:@"%@.%@.%@", _metricPrefix, _sankeyMetricName, v49];
  v53 = (void *)*((void *)v18 + 12);
  *((void *)v18 + 12) = v52;

  v54 = (void *)*((void *)v18 + 6);
  *((void *)v18 + 6) = 0LL;

  v55 = objc_opt_new();
  v56 = (void *)*((void *)v18 + 7);
  *((void *)v18 + 7) = v55;

  v57 = objc_opt_new();
  v58 = (void *)*((void *)v18 + 13);
  *((void *)v18 + 13) = v57;

  objc_storeStrong((id *)v18 + 16, a7);
  v59 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v14);
  v60 = (void *)*((void *)v18 + 15);
  *((void *)v18 + 15) = v59;

  [v18 getBeforeKernelWindowWithLikelyhood];
  objc_initWeak((id *)location, v18);
  v61 = (dispatch_source_s *)*((void *)v18 + 15);
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __94__WiFiUsageLQMWindowAnalysis_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue___block_invoke;
  handler[3] = &unk_18A16CE78;
  objc_copyWeak(&v74, (id *)location);
  dispatch_source_set_event_handler(v61, handler);
  v62 = (dispatch_source_s *)*((void *)v18 + 15);
  [v12 duration];
  v64 = dispatch_time(0LL, (uint64_t)(v63 * 1000000000.0));
  dispatch_source_set_timer(v62, v64, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  dispatch_resume(*((dispatch_object_t *)v18 + 15));
  *((_BYTE *)v18 + 16) = 0;
  self = (WiFiUsageLQMWindowAnalysis *)v18;
  objc_destroyWeak(&v74);
  objc_destroyWeak((id *)location);

  v65 = self;
LABEL_13:

  return v65;
}

LABEL_13:
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v7;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Locale from user defaults <%@>",  (uint8_t *)&v15,  0xCu);
  }

  return v7;
}

    NSLog( @"%s: error %@",  "-[TBRemoteDataSource _fetchTilesForTileItems:completionHandler:trigger:]_block_invoke",  v14);
    goto LABEL_14;
  }

  if (!v13)
  {
    v15 = 1LL;
    goto LABEL_9;
  }

  [v13 domain];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  GEOErrorDomain();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v16 isEqualToString:v17])
  {

    goto LABEL_12;
  }

  v18 = [v14 code];

  if (v18 != -7)
  {
LABEL_12:
    v21 = mach_absolute_time();
    [*(id *)(a1 + 32) _captureTileFetchError:v14 tileKey:v22 duration:*(void *)(a1 + 64) trigger:MachTimeToSecs(v21 - *(void *)(a1 + 56))];
    goto LABEL_13;
  }

  v19 = -[TBRemoteFetchTileItem initWithEmptyTileKey:etag:error:]( [TBRemoteFetchTileItem alloc],  "initWithEmptyTileKey:etag:error:",  [v22 integerValue],  v12,  v14);
  v20 = *(id *)(a1 + 32);
  objc_sync_enter(v20);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v19];
LABEL_10:
  objc_sync_exit(v20);

LABEL_14:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

  [MEMORY[0x189607968] numberWithUnsignedLong:a3];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:v13];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendFormat:@"%@&", v14];

  if ((a3 & 8) == 0)
  {
LABEL_5:
    if ((a3 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }

  [v4 appendString:@"adaptiveFBT&"];
  if ((v6 & 0x10) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((v6 & 0x20) != 0) {
LABEL_8:
  }
    [v4 appendString:@"ntwAssurance&"];
LABEL_9:
  [NSString stringWithString:v4];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

LABEL_46:
}

LABEL_24:
    [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
    objc_msgSend(*(id *)(a1 + 32), "setLocaleLastUpdatedTime:");
    [*(id *)(a1 + 32) setAggressiveRetryAttemptsRemaining:5];
    [*(id *)(a1 + 32) retryTimer];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      [*(id *)(a1 + 32) retryTimer];
      v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
      dispatch_source_cancel(v8);

      [*(id *)(a1 + 32) setRetryTimer:0];
    }

    [*(id *)(a1 + 32) setCountryCode:v4 source:v5];

    return;
  }

  v9 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  if (v9) {
    __40__WiFiLocaleManager_didUpdateLocations___block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
  }
}

  return v9;
}
          }

          v38 = -[WiFi3BarsNetwork countByEnumeratingWithState:objects:count:]( v36,  "countByEnumeratingWithState:objects:count:",  &v44,  v55,  16LL);
        }

        while (v38);

        v26 = v39;
        if (v39)
        {
          v13 = -[WiFi3BarsNetwork initWithNetwork:]( objc_alloc(&OBJC_CLASS___WiFi3BarsNetwork),  "initWithNetwork:",  v39);
          [v29 setObject:v13 forKey:v33];
          v6 = v31;
          i = v35;
LABEL_29:

          goto LABEL_31;
        }

        v6 = v31;
        i = v35;
LABEL_31:
      }

      v34 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
      if (!v34)
      {
LABEL_33:

        v5 = v28;
        goto LABEL_34;
      }
    }
  }

  [v6 resultsByBSSID];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x1895F87A8];
  v52[1] = 3221225472LL;
  v52[2] = __49__WiFi3BarsSource__matchSearchBSSIDs_toResponse___block_invoke;
  v52[3] = &unk_18A16E8C0;
  v53 = v29;
  [v9 enumerateKeysAndObjectsUsingBlock:v52];

LABEL_34:
  return v29;
}

void sub_187ED2D20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

LABEL_7:
  v7 = v3;
  for (i = 72LL; i != -8; i -= 8LL)

  return v7;
}

  v8 = v2;

  for (i = 72LL; i != -8; i -= 8LL)
  return v8;
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void *TBMacAddressFromString(void *result)
{
  if (result)
  {
    id v1 = [result stringByReplacingOccurrencesOfString:@":" withString:&stru_18A170410];
    unint64_t v2 = strtoull((const char *)[v1 UTF8String], 0, 16);

    return (void *)v2;
  }

  return result;
}

uint64_t TBMacAdressFromLong(uint64_t a1)
{
  return objc_msgSend( NSString,  "stringWithFormat:",  @"%02x:%02x:%02x:%02x:%02x:%02x",  BYTE5(a1),  BYTE4(a1),  BYTE3(a1),  BYTE2(a1),  BYTE1(a1),  a1);
}

uint64_t _createLexiconWithLocale(void *a1)
{
  v5[1] = *MEMORY[0x1895F89C0];
  id v1 = a1;
  uint64_t v4 = *MEMORY[0x1896105C8];
  v5[0] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  uint64_t v2 = LXLexiconCreate();

  return v2;
}

void sub_187ED5514(_Unwind_Exception *a1)
{
}

void sub_187ED59EC()
{
}

void sub_187ED5A04(_Unwind_Exception *a1)
{
}

LABEL_21:
}

  objc_msgSend( v5,  "roamingStateDidChange:reason:andStatus:andLatency:andRoamData:andPingPongNth:",  *(unsigned __int8 *)(a1 + 104),  *(void *)(a1 + 80),  *(void *)(a1 + 88),  *(void *)(a1 + 96),  *(void *)(a1 + 56),  -[WiFiUsageSessionPingPongStats pingPongNth](v2, "pingPongNth") != 0);
  if (*(_BYTE *)(*(void *)(a1 + 40) + 33LL))
  {
    [MEMORY[0x189607958] defaultCenter];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607950] notificationWithName:@"setRoamingState" object:0];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 postNotification:v17];
  }
}
        }

        v5 = obj;
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
      }

      while (v7);
    }
  }

  else
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s  results alloc failed",  "-[WFBlacklistEngine retrieveNetworksInBlacklistedStateHistory:]");
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)NSString;
      v5 = v5;
      v23 = objc_msgSend(v22, "stringWithFormat:", @"[WiFiPolicy] %s", -[NSMutableArray UTF8String](v5, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      v37 = [v23 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }

  return v24;
}

void sub_187ED6670( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
}

void sub_187ED67F0(_Unwind_Exception *a1)
{
}

LABEL_17:
    [v13 setObject:v12 forKey:@"SiriTLS"];
    v134 = 1;
    goto LABEL_18;
  }

  if (v12) {
    goto LABEL_17;
  }
  v15 = v13;
  v134 = 0;
LABEL_19:
  if ([v3 backhaulResultsValid])
  {
    [v3 downloadError];
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16) {
      v17 = &kWFMeasureStatusBroken;
    }
    else {
      v17 = &kWFMeasureStatusOK;
    }
    [v15 setObject:*v17 forKey:@"Backhaul"];
  }

  if (*(_BYTE *)(a1 + 48) && [v3 seenSpecificAcFailure])
  {
    [v3 statusForAcFailure];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setObject:v18 forKey:@"FltBadAC"];
  }

  v137 = v4;
  v138 = v6;
  v139 = v5;
  v140 = v11;
  if (v4 == kWFMeasureStatusOK)
  {
    v135 = 0;
    v30 = v4;
  }

  else
  {
    v19 = kWFMeasureStatusBroken;
    if (v4 == kWFMeasureStatusBroken)
    {
      [MEMORY[0x189607958] defaultCenter];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 40);
      v168[0] = &unk_18A1B3768;
      v167[0] = @"SessionNotificationFaultType";
      v167[1] = @"SessionNotificationInterfaceName";
      [v21 interfaceName];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v168[1] = v22;
      [MEMORY[0x189603F68] dictionaryWithObjects:v168 forKeys:v167 count:2];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v21;
      v5 = v139;
      [v20 postNotificationName:@"SessionNotificationFaultEventDetected" object:v24 userInfo:v23];

      uint64_t v4 = v137;
      v6 = v138;

      v19 = kWFMeasureStatusBroken;
    }

    if (v4) {
      v25 = v4 == v19;
    }
    else {
      v25 = 1;
    }
    v26 = v25;
    v135 = v26;
    if (v25)
    {
      v27 = @"_DNSNil";
      if (v130) {
        v27 = @"_DNSNoG";
      }
      if (v132) {
        v27 = @"_DNSNoDNS";
      }
      if (v132 && v130) {
        v28 = @"_DNSNoGDNS";
      }
      else {
        v28 = v27;
      }
      if (v4) {
        v29 = @"_DNS";
      }
      else {
        v29 = v28;
      }
      [v142 appendString:v29];
    }

    NSLog( @"%s: statusForDNS - %@ linkTestFailureReasonString %@",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  v4,  v142);
    v30 = kWFMeasureStatusOK;
  }

  if (v6 == v30)
  {
    v141 = 0LL;
  }

  else
  {
    v31 = kWFMeasureStatusBroken;
    if (v6 == kWFMeasureStatusBroken)
    {
      [MEMORY[0x189607958] defaultCenter];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(void **)(a1 + 40);
      v166[0] = &unk_18A1B3780;
      v165[0] = @"SessionNotificationFaultType";
      v165[1] = @"SessionNotificationInterfaceName";
      [v33 interfaceName];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v166[1] = v34;
      [MEMORY[0x189603F68] dictionaryWithObjects:v166 forKeys:v165 count:2];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v33;
      v5 = v139;
      [v32 postNotificationName:@"SessionNotificationFaultEventDetected" object:v36 userInfo:v35];

      uint64_t v4 = v137;
      v6 = v138;

      v31 = kWFMeasureStatusBroken;
    }

    if (v6) {
      v37 = v6 == v31;
    }
    else {
      v37 = 1;
    }
    v38 = v37;
    v141 = v38;
    if (v37)
    {
      v39 = @"_IntNil";
      if (v130) {
        v39 = @"_IntNoG";
      }
      if (v132) {
        v39 = @"_IntNoDNS";
      }
      if (v132 && v130) {
        v40 = @"_IntNoGDNS";
      }
      else {
        v40 = v39;
      }
      if (v6) {
        v41 = @"_Int";
      }
      else {
        v41 = v40;
      }
      [v142 appendString:v41];
    }

    NSLog( @"%s: statusForInternet - %@ linkTestFailureReasonString %@",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  v6,  v142);
    v6 = kWFMeasureStatusOK;
  }

  if (v5 != v6)
  {
    v42 = kWFMeasureStatusBroken;
    if (v5 == kWFMeasureStatusBroken)
    {
      [MEMORY[0x189607958] defaultCenter];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = *(void **)(a1 + 40);
      v164[0] = &unk_18A1B3798;
      v163[0] = @"SessionNotificationFaultType";
      v163[1] = @"SessionNotificationInterfaceName";
      [v44 interfaceName];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v164[1] = v45;
      [MEMORY[0x189603F68] dictionaryWithObjects:v164 forKeys:v163 count:2];
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v44;
      v5 = v139;
      [v43 postNotificationName:@"SessionNotificationFaultEventDetected" object:v47 userInfo:v46];

      uint64_t v4 = v137;
      v42 = kWFMeasureStatusBroken;
      if (!v139) {
        goto LABEL_81;
      }
    }

    else if (!v5)
    {
      goto LABEL_81;
    }

    if (v5 != v42)
    {
LABEL_84:
      NSLog( @"%s: statusForLocal - %@ linkTestFailureReasonString %@",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  v5,  v142);
      goto LABEL_85;
    }

  objc_sync_exit(v4);

  objc_autoreleasePoolPop(v3);
}

    v15 = 0LL;
LABEL_18:

    v7 = 0LL;
    goto LABEL_14;
  }

  v15 = v14;
  [v14 storeURL];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [v16 copy];
  storeURL = v7->_storeURL;
  v7->_storeURL = (NSURL *)v17;

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    v19 = v7->_storeURL;
    *(_DWORD *)buf = 136315394;
    v28 = "-[WiFi3BarsSource initWithChangeHandler:localStoreType:]";
    v29 = 2112;
    v30 = v19;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: source initialized with storeURL %@",  buf,  0x16u);
  }

  v20 = -[TBDataSourceMediator initWithLocalStoreDescriptor:]( objc_alloc(&OBJC_CLASS___TBDataSourceMediator),  "initWithLocalStoreDescriptor:",  v15);
  sourceMediator = v7->_sourceMediator;
  v7->_sourceMediator = v20;

  if (!v7->_sourceMediator) {
    goto LABEL_18;
  }
  if (![v15 type])
  {
    v22 = -[WiFi3BarsTileFetcher initWithDataSourceMediator:]( objc_alloc(&OBJC_CLASS___WiFi3BarsTileFetcher),  "initWithDataSourceMediator:",  v7->_sourceMediator);
    tileFetcher = v7->_tileFetcher;
    v7->_tileFetcher = v22;

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      v24 = v7->_tileFetcher;
      *(_DWORD *)buf = 136315394;
      v28 = "-[WiFi3BarsSource initWithChangeHandler:localStoreType:]";
      v29 = 2112;
      v30 = v24;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: created tile fetcher %@ for server",  buf,  0x16u);
    }
  }

  v7->_cacheExpirationInDays = 7LL;
LABEL_14:

  return v7;
}

    v11 = 0LL;
    goto LABEL_6;
  }

  v11 = (void *)v10;
LABEL_6:

  return v11;
}

  [v5 addObject:@"11AC"];
  if ((v3 & 0x10) != 0) {
LABEL_6:
  }
    [v5 addObject:@"11N"];
LABEL_7:
  if ((v3 & 0x48) != 0) {
    [v5 addObject:@"11G"];
  }
  if ((v3 & 0x22) != 0) {
    [v5 addObject:@"11A"];
  }
  if ((v3 & 4) != 0) {
    [v5 addObject:@"11B"];
  }
  [v5 componentsJoinedByString:@"|"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

LABEL_81:
    if ((v141 & 1) == 0) {
      NSLog( @"%s: WARNING - Local test failed while internet test passed",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke");
    }
    [v142 appendString:@"_Loc"];
    goto LABEL_84;
  }

LABEL_85:
  if (*(_BYTE *)(a1 + 48) && [v3 seenSpecificAcFailure])
  {
    [v3 statusForAcFailure];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    [v142 appendFormat:@"_FltBadAC %@", v48];

    NSLog( @"%s: Fault with seenSpecificAcFailure - %@ linkTestFailureReasonString %@",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  v3,  v142);
    NSLog( @"%s: statusForLocal - %@ linkTestFailureReasonString %@ results %@",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  v5,  v142,  v15);
  }

  v49 = kWFMeasureStatusOK;
  if (v11 && v11 != kWFMeasureStatusOK)
  {
    if (v11 == kWFMeasureStatusBroken)
    {
      [MEMORY[0x189607958] defaultCenter];
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = *(void **)(a1 + 40);
      v162[0] = &unk_18A1B37B0;
      v161[0] = @"SessionNotificationFaultType";
      v161[1] = @"SessionNotificationInterfaceName";
      [v51 interfaceName];
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v162[1] = v52;
      [MEMORY[0x189603F68] dictionaryWithObjects:v162 forKeys:v161 count:2];
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      [v50 postNotificationName:@"SessionNotificationFaultEventDetected" object:v51 userInfo:v53];

      uint64_t v4 = v137;
    }

    [v142 appendString:@"_SiriTCP"];
    NSLog( @"%s: statusForSiriTCP - %@ linkTestFailureReasonString %@ results %@",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  v11,  v142,  v15);
    v49 = kWFMeasureStatusOK;
    v141 = 1LL;
  }

  v54 = v136;
  v25 = v136 == v49;
  v55 = v134;
  if (v25) {
    v55 = 0;
  }
  if (v55 == 1)
  {
    if (v136 == kWFMeasureStatusBroken)
    {
      [MEMORY[0x189607958] defaultCenter];
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = *(void **)(a1 + 40);
      v160[0] = &unk_18A1B37C8;
      v159[0] = @"SessionNotificationFaultType";
      v159[1] = @"SessionNotificationInterfaceName";
      [v57 interfaceName];
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v160[1] = v58;
      [MEMORY[0x189603F68] dictionaryWithObjects:v160 forKeys:v159 count:2];
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      [v56 postNotificationName:@"SessionNotificationFaultEventDetected" object:v57 userInfo:v59];

      uint64_t v4 = v137;
    }

    [v142 appendString:@"_SiriTLS"];
    NSLog( @"%s: statusForSiriTLS - %@ linkTestFailureReasonString %@ results %@",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  v136,  v142,  v15);
    v141 = 1LL;
  }

  if (*(_BYTE *)(a1 + 48) && [v3 seenSpecificAcFailure])
  {
    [v142 appendFormat:@"_FltBadAC"];
    NSLog( @"%s: Fault with seenSpecificAcFailure - %@ linkTestFailureReasonString %@ results %@",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  v3,  v142,  v15);
  }

  NSLog( @"%s: LQM-WiFi:%@",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  v3);
  if (_os_feature_enabled_impl())
  {
    [MEMORY[0x189612BF0] sharedAnalyticsProcessor];
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      v61 = objc_alloc_init(MEMORY[0x189603FC8]);
      v62 = *(void *)(a1 + 40);
      v63 = (void *)MEMORY[0x189612C00];
      if (*(void *)(v62 + 11968))
      {
        v157 = *(void *)(MEMORY[0x189612C00] + 16LL);
        v158 = *(void *)(v62 + 11968);
        [MEMORY[0x189603F68] dictionaryWithObjects:&v158 forKeys:&v157 count:1];
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        [v61 addEntriesFromDictionary:v64];

        v62 = *(void *)(a1 + 40);
      }

      v128 = v15;
      if (*(void *)(v62 + 11960))
      {
        v155 = v63[3];
        v156 = *(void *)(v62 + 11960);
        [MEMORY[0x189603F68] dictionaryWithObjects:&v156 forKeys:&v155 count:1];
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        [v61 addEntriesFromDictionary:v65];
      }

      v153[0] = v63[1];
      [MEMORY[0x189603F50] date];
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v154[0] = v127;
      v153[1] = v63[4];
      [MEMORY[0x189607968] numberWithBool:v132];
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v154[1] = v133;
      v153[2] = v63[5];
      [MEMORY[0x189607968] numberWithBool:v130];
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v154[2] = v131;
      v153[3] = v63[6];
      objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v3, "dnsResultsValid"));
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v154[3] = v126;
      v153[4] = v63[7];
      objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v3, "dnsSuccess"));
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v154[4] = v125;
      v153[5] = v63[8];
      [MEMORY[0x189607968] numberWithBool:v141];
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v154[5] = v124;
      v153[6] = v63[9];
      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v3, "gatewayMaxRTT"));
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v154[6] = v123;
      v153[7] = v63[10];
      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v3, "gatewayMinRTT"));
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v154[7] = v122;
      v153[8] = v63[11];
      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v3, "gatewayPacketLoss"));
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v154[8] = v121;
      v153[9] = v63[12];
      objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v3, "gatewayResultsValid"));
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = *(void *)(a1 + 32);
      v154[9] = v120;
      v154[10] = v66;
      v67 = v63[14];
      v153[10] = v63[13];
      v153[11] = v67;
      [MEMORY[0x189607968] numberWithBool:*(unsigned __int8 *)(a1 + 48)];
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v154[11] = v119;
      v153[12] = v63[15];
      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v3, "localDNSMaxRTT"));
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v154[12] = v118;
      v153[13] = v63[16];
      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v3, "localDNSMinRTT"));
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v154[13] = v117;
      v153[14] = v63[17];
      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v3, "localDNSPacketLoss"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v154[14] = v116;
      v153[15] = v63[18];
      objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v3, "localResultsValid"));
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v154[15] = v115;
      v153[16] = v63[19];
      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v3, "publicDNSMaxRTT"));
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v154[16] = v114;
      v153[17] = v63[20];
      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v3, "publicDNSMinRTT"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v154[17] = v113;
      v153[18] = v63[21];
      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v3, "publicDNSPacketLoss"));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v154[18] = v112;
      v153[19] = v63[22];
      objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v3, "publicResultsValid"));
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v154[19] = v111;
      v153[20] = v63[23];
      objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v3, "seenSpecificAcFailure"));
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v154[20] = v110;
      v153[21] = v63[24];
      objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v3, "siriTCPResultsValid"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v154[21] = v68;
      v153[22] = v63[25];
      objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v3, "siriTCPSuccess"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v154[22] = v69;
      v153[23] = v63[26];
      objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v3, "siriTLSResultsValid"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v154[23] = v70;
      v153[24] = v63[27];
      v71 = v61;
      objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v3, "siriTLSSuccess"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v154[24] = v72;
      v153[25] = v63[28];
      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v3, "siriTrafficClass"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v154[25] = v73;
      [MEMORY[0x189603F68] dictionaryWithObjects:v154 forKeys:v153 count:26];
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      [v71 addEntriesFromDictionary:v74];

      v75 = v71;
      uint64_t v4 = v137;
      if (v137)
      {
        v151 = v63[29];
        v152 = v137;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v152 forKeys:&v151 count:1];
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        [v71 addEntriesFromDictionary:v76];
      }

      v54 = v136;
      if (v138)
      {
        v149 = v63[30];
        v150 = v138;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v150 forKeys:&v149 count:1];
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        [v71 addEntriesFromDictionary:v77];
      }

      v15 = v128;
      if (v139)
      {
        v147 = v63[31];
        v148 = v139;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        [v75 addEntriesFromDictionary:v78];
      }

      if (v140)
      {
        v145 = v63[32];
        v146 = v140;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        [v75 addEntriesFromDictionary:v79];
      }

      if (v134)
      {
        v143 = v63[33];
        v144 = v136;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        [v75 addEntriesFromDictionary:v80];
      }

      [MEMORY[0x189612BF0] sharedAnalyticsProcessor];
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      [v81 processWAMessageMetric:*v63 data:v75];
    }
  }

  v82 = *(void *)(a1 + 40);
  if ((v135 | v141) == 1)
  {
    ++*(void *)(v82 + 11976);
    NSLog( @"%s:%u: Link test failed (total = %lu) reasonString: %@\n",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  678LL,  *(void *)(*(void *)(a1 + 40) + 11976LL),  v142);
    v83 = @"FoundFailure";
  }

  else
  {
    *(_BYTE *)(v82 + 11985) = 1;
    *(void *)(*(void *)(a1 + 40) + 11976LL) = 0LL;
    NSLog( @"%s:%u: Link test passed\n",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  684LL);
    v83 = @"SuccessfulLinkTest";
  }

  [v15 setObject:@"YES" forKey:v83];
  v84 = *(void *)(a1 + 40);
  if (!*(_BYTE *)(v84 + 11984))
  {
    if (*(_BYTE *)(v84 + 11985) || (v86 = *(void *)(v84 + 11992), v86 >= 2))
    {
      *(void *)(v84 + 11992) = 0LL;
      v87 = *(void *)(a1 + 40);
      if (!*(_BYTE *)(v87 + 11985)) {
        NSLog( @"%s:%u: Link test has not passed in last _numLinkRecoverySkips %lu link tests\n",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  718LL,  *(void *)(v87 + 11992));
      }
      if ((v141 & 1) != 0)
      {
        if (!v135 || *(void *)(*(void *)(a1 + 40) + 11976LL) < 2uLL) {
          goto LABEL_149;
        }
LABEL_138:
        NSLog( @"%s:%u: linkTestFailureReasonString adding _MaxNonCrit\n",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  726LL);
        [v142 appendFormat:@"_MaxNonCrit"];
        goto LABEL_149;
      }

      if (v135)
      {
        if (*(void *)(*(void *)(a1 + 40) + 11976LL) > 1uLL) {
          goto LABEL_138;
        }
        if (!*(_BYTE *)(a1 + 48))
        {
          NSLog( @"%s:%u: Found Non Critical Failure, attemping retest\n",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  748LL);
          [v15 setObject:@"YES" forKey:@"WillAttemptRetest"];
          [*(id *)(a1 + 40) addDictionary:v15 withKeysPrefix:@"BeforeNonCriticalFailureRetest_" toFlatDictionary:*(void *)(*(void *)(a1 + 40) + 12040)];
          *(void *)(*(void *)(a1 + 40) + 12024) = [v3 options];
          [*(id *)(a1 + 40) retryLinkTestInOneMinute];
          goto LABEL_157;
        }

LABEL_149:
        [NSString stringWithFormat:@"LinkTestFailure_%@", *v129];
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v142 isEqualToString:v102])
        {
          NSLog( @"%s:%u: Attempting to reset chip with vague reason %@, linkTestIniated %@\n",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  733LL,  v142,  *v129);
          v108 = (os_log_s *)MEMORY[0x1895F8DA0];
          v109 = MEMORY[0x1895F8DA0];
          if (os_log_type_enabled(v108, OS_LOG_TYPE_FAULT)) {
            __62__WiFiUsageLinkSession_performLinkTestFor_isTriggeredByFault___block_invoke_cold_1((uint64_t)v142, v129);
          }

          __assert_rtn( "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  "WiFiUsageLinkSession.m",  735,  "false");
        }

        if (v135)
        {
          v103 = *(void *)(*(void *)(a1 + 40) + 11976LL) > 1uLL;
        }

        else if ((v141 & 1) != 0)
        {
          v103 = 0LL;
        }

        else
        {
          v104 = [v3 seenSpecificAcFailure];
          v103 = 0LL;
          v105 = 0LL;
          if (!v104)
          {
LABEL_156:
            NSLog( @"%s:%u: Will induce fault recovery with reason: %@  :foundCriticalFailure %d foundNonCriticalFailure %d fo undFailure w seenSpecificAcFailure %d\n",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  739LL,  v142,  v141,  v103,  v105);
            [v15 setObject:@"YES" forKey:@"WillInduceFaultEvent"];
            [*(id *)(a1 + 40) addDictionary:v15 withKeysPrefix:@"BeforeInduceingFault_" toFlatDictionary:*(void *)(*(void *)(a1 + 40) + 12040)];
            *(void *)(*(void *)(a1 + 40) + 12024) = [v3 options];
            v106 = *(void **)(a1 + 40);
            [NSString stringWithString:v142];
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            [v106 handleFaultEventWithReason:v107];

            goto LABEL_157;
          }
        }

        v105 = *(unsigned __int8 *)(a1 + 48);
        goto LABEL_156;
      }

      if (*(_BYTE *)(*(void *)(a1 + 40) + 11985LL))
      {
        NSLog( @"%s:%u: Found successful linktest\n",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  757LL);
        [*(id *)(a1 + 40) addDictionary:v15 withKeysPrefix:@"FinalResults_" toFlatDictionary:*(void *)(*(void *)(a1 + 40) + 12040)];
        v94 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
        v95 = v94;
        v96 = *(void *)(*(void *)(a1 + 40) + 12040LL);
        v97 = 2LL;
LABEL_147:
        [v94 networkActivityStop:1 withReason:v97 withClientMetric:"linkTestResults" withClientDict:v96 andError:0];
        v99 = +[SiriTimeoutInitiatedTelemetry sharedObj](&OBJC_CLASS___SiriTimeoutInitiatedTelemetry, "sharedObj");
        [v99 addLinkTestReasonAndResult:*(void *)(a1 + 32) result:*(void *)(*(void *)(a1 + 40) + 12040)];

        *(void *)(*(void *)(a1 + 40) + 12024LL) = 0LL;
        v100 = *(void *)(a1 + 40);
        v101 = *(void **)(v100 + 12040);
        *(void *)(v100 + 12040) = 0LL;

        goto LABEL_157;
      }

      NSLog( @"%s:%u: Not proceeding with linktest\n",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  769LL);
      v98 = @"LinkRecoverySkips";
    }

    else
    {
      *(void *)(v84 + 11992) = v86 + 1;
      NSLog( @"%s:%u: Link test did not pass, skipping recovery (skips = %lu)\n",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  784LL,  *(void *)(*(void *)(a1 + 40) + 11992LL));
      v98 = @"SkippingRecovery";
    }

    [v15 setObject:@"YES" forKey:v98];
    [*(id *)(a1 + 40) addDictionary:v15 withKeysPrefix:@"FinalResults_" toFlatDictionary:*(void *)(*(void *)(a1 + 40) + 12040)];
    v94 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
    v95 = v94;
    v96 = *(void *)(*(void *)(a1 + 40) + 12040LL);
    v97 = 4LL;
    goto LABEL_147;
  }

  NSLog( @"%s:%u: Link test completed after _didHandleFaultEvent, %@\n",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  690LL,  *v129);
  if ([(id)*v129 isEqualToString:@"didHandleFaultEvent"])
  {
    if (((v135 | v141) & 1) != 0)
    {
      [v15 setObject:@"YES" forKey:@"FaultEventLinkNotRecovered"];
      NSLog( @"%s:%u: Link test failed after handling fault event %@, not trying to handle fault event again\n",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  699LL,  *(void *)(*(void *)(a1 + 40) + 12016LL));
      v85 = 3LL;
    }

    else
    {
      [v15 setObject:@"YES" forKey:@"FaultEventRecoveredLink"];
      NSLog( @"%s:%u: Link test passed after handling fault event %@\n",  "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke",  696LL,  *(void *)(*(void *)(a1 + 40) + 12016LL));
      v85 = 2LL;
    }

    [*(id *)(a1 + 40) addDictionary:v15 withKeysPrefix:@"FinalResults_" toFlatDictionary:*(void *)(*(void *)(a1 + 40) + 12040)];
    v88 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
    [v88 networkActivityStop:1 withReason:v85 withClientMetric:"linkTestResults" withClientDict:*(void *)(*(void *)(a1 + 40) + 12040) andError:0];
    v89 = +[SiriTimeoutInitiatedTelemetry sharedObj](&OBJC_CLASS___SiriTimeoutInitiatedTelemetry, "sharedObj");
    [v89 addLinkTestReasonAndResult:*(void *)(a1 + 32) result:*(void *)(*(void *)(a1 + 40) + 12040)];

    v90 = *(void *)(a1 + 40);
    v91 = *(void **)(v90 + 12040);
    *(void *)(v90 + 12040) = 0LL;

    *(_BYTE *)(*(void *)(a1 + 40) + 11984LL) = 0;
    v92 = *(void *)(a1 + 40);
    v93 = *(void **)(v92 + 12016);
    *(void *)(v92 + 12016) = 0LL;

    *(void *)(*(void *)(a1 + 40) + 12024LL) = 0LL;
    *(void *)(*(void *)(a1 + 40) + 11976LL) = 0LL;
    v54 = v136;
    uint64_t v4 = v137;
  }

LABEL_157:
}

void sub_187ED900C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

double MachTimeToSecs(unint64_t a1)
{
  LODWORD(v2) = info.numer;
  LODWORD(v3) = info.denom;
  return (double)a1 * (double)v2 / (double)v3 / 1000000000.0;
}

void sub_187EDA48C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_187EDAE58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

void sub_187EDB068(_Unwind_Exception *a1)
{
}

void sub_187EDB134( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

id WiFiUsageFaultReasonStringMap(unint64_t a1)
{
  if (WiFiUsageFaultReasonStringMap_onceToken != -1) {
    dispatch_once(&WiFiUsageFaultReasonStringMap_onceToken, &__block_literal_global_3);
  }
  if (a1 > 0x21) {
    WiFiUsageFaultReasonStringMap_cold_3(a1);
  }
  uint64_t v2 = [MEMORY[0x189607968] numberWithLong:a1];
  if (!v2) {
    WiFiUsageFaultReasonStringMap_cold_1(a1);
  }
  unint64_t v3 = (void *)v2;
  [(id)gWiFiUsageFaultReasonStringMap objectForKey:v2];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4) {
    WiFiUsageFaultReasonStringMap_cold_2(a1);
  }
  [(id)gWiFiUsageFaultReasonStringMap objectForKey:v3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __WiFiUsageFaultReasonStringMap_block_invoke()
{
  v3[34] = *MEMORY[0x1895F89C0];
  v2[0] = &unk_18A1B37F8;
  v2[1] = &unk_18A1B3810;
  v3[0] = @"kWiFiUsageFaultReasonUnknown";
  v3[1] = @"kWiFiUsageFaultReasonSymptomLowRssiDnsFailure";
  v2[2] = &unk_18A1B3828;
  v2[3] = &unk_18A1B3840;
  v3[2] = @"kWiFiUsageFaultReasonSymptomLowRssiArpFailure";
  v3[3] = @"kWiFiUsageFaultReasonSymptomLowRssiDataStall";
  v2[4] = &unk_18A1B3858;
  void v2[5] = &unk_18A1B3870;
  v3[4] = @"kWiFiUsageFaultReasonSymptomLowRssiShortFlow";
  v3[5] = @"kWiFiUsageFaultReasonSymptomLowRssiRTTFailure";
  v2[6] = &unk_18A1B3888;
  v2[7] = &unk_18A1B38A0;
  void v3[6] = @"kWiFiUsageFaultReasonDatapathStall";
  v3[7] = @"kWiFiUsageFaultReasonWatchdogReset";
  v2[8] = &unk_18A1B38B8;
  v2[9] = &unk_18A1B38D0;
  v3[8] = @"kWiFiUsageFaultReasonSsidBlocklisted";
  v3[9] = @"kWiFiUsageFaultReasonBssidBlocklisted";
  v2[10] = &unk_18A1B38E8;
  v2[11] = &unk_18A1B3900;
  v3[10] = @"kWiFiUsageFaultReasonSlowWiFiAP";
  v3[11] = @"kWiFiUsageFaultReasonPrivateMACFallback";
  v2[12] = &unk_18A1B3918;
  v2[13] = &unk_18A1B3930;
  v3[12] = @"kWiFiUsageFaultReasonDelayedAutoJoin";
  v3[13] = @"kWiFiUsageFaultReasonDhcpFailure";
  v2[14] = &unk_18A1B3948;
  v2[15] = &unk_18A1B3960;
  v3[14] = @"kWiFiUsageFaultReasonLinkTestLocalCheckFailed";
  v3[15] = @"kWiFiUsageFaultReasonLinkTestInternetCheckFailed";
  v2[16] = &unk_18A1B3978;
  v2[17] = &unk_18A1B3990;
  v3[16] = @"kWiFiUsageFaultReasonLinkTestDNSCheckFailed";
  v3[17] = @"kWiFiUsageFaultReasonArpFailure";
  v2[18] = &unk_18A1B39A8;
  v2[19] = &unk_18A1B39C0;
  v3[18] = @"kWiFiUsageFaultReasonSlowWiFiDnsFailure";
  v3[19] = @"kWiFiUsageFaultReasonSlowWiFiDUT";
  v2[20] = &unk_18A1B39D8;
  v2[21] = &unk_18A1B39F0;
  v3[20] = @"kWiFiUsageFaultReasonUserOverridesCellularOutranking";
  v3[21] = @"kWiFiUsageFaultReasonFirmwareTrap";
  v2[22] = &unk_18A1B3A08;
  v2[23] = &unk_18A1B3A20;
  v3[22] = @"kWiFiUsageFaultReasonSleepPowerBudgetExceeded";
  v3[23] = @"kWiFiUsageFaultReasonLowPowerBudgetExceeded";
  v2[24] = &unk_18A1B3A38;
  v2[25] = &unk_18A1B3A50;
  v3[24] = @"kWiFiUsageFaultReasonDextCrashed";
  v3[25] = @"kWiFiUsageFaultReasonSiriTimedOut";
  v2[26] = &unk_18A1B3A68;
  v2[27] = &unk_18A1B3A80;
  v3[26] = @"kWiFiUsageFaultReasonApsdTimedOut";
  v3[27] = @"kWiFiUsageFaultReasonBrokenBackhaulLinkFailed";
  v2[28] = &unk_18A1B3A98;
  v2[29] = &unk_18A1B3AB0;
  v3[28] = @"kWiFiUsageFaultReasonLinkTestSiriTCPCheckFailed";
  v3[29] = @"kWiFiUsageFaultReasonLinkTestSiriTLSCheckFailed";
  v2[30] = &unk_18A1B3AC8;
  v2[31] = &unk_18A1B3AE0;
  v3[30] = @"kWiFiUsageFaultReasonAirplayConnectionStall";
  v3[31] = @"kWiFiUsageFaultReasonAirplayBufferedAudioUnderrun";
  v2[32] = &unk_18A1B3AF8;
  v2[33] = &unk_18A1B3B10;
  v3[32] = @"kWiFiUsageFaultReasonAirplayRealtimeAudioUnderrun";
  v3[33] = @"kWiFiUsageFaultReasonHomeKitFault";
  uint64_t v0 = [MEMORY[0x189603F68] dictionaryWithObjects:v3 forKeys:v2 count:34];
  uint64_t v1 = (void *)gWiFiUsageFaultReasonStringMap;
  gWiFiUsageFaultReasonStringMap = v0;
}

id WiFiFaultHandlingLimitsStringMap(uint64_t a1)
{
  if (WiFiFaultHandlingLimitsStringMap_onceToken != -1) {
    dispatch_once(&WiFiFaultHandlingLimitsStringMap_onceToken, &__block_literal_global_115);
  }
  uint64_t v2 = (void *)gWiFiFaultHandlingLimitsStringMap;
  [MEMORY[0x189607968] numberWithLong:a1];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKey:v3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __WiFiFaultHandlingLimitsStringMap_block_invoke()
{
  v3[5] = *MEMORY[0x1895F89C0];
  v2[0] = &unk_18A1B3B28;
  v2[1] = &unk_18A1B3B40;
  v3[0] = @"WiFiFaultHandlingNotIgnored";
  v3[1] = @"WiFiFaultHandlingLimitedRateLastFaultIndication";
  v2[2] = &unk_18A1B3B58;
  v2[3] = &unk_18A1B3B70;
  v3[2] = @"WiFiFaultHandlingLimitedLinkOrPrimaryNotSet";
  v3[3] = @"WiFiFaultHandlingLimitedRateMinBrokenLinkDetectedInterval";
  v2[4] = &unk_18A1B3B88;
  v3[4] = @"WiFiFaultHandlingLimitedRecoveryDisabled";
  uint64_t v0 = [MEMORY[0x189603F68] dictionaryWithObjects:v3 forKeys:v2 count:5];
  uint64_t v1 = (void *)gWiFiFaultHandlingLimitsStringMap;
  gWiFiFaultHandlingLimitsStringMap = v0;
}

void sub_187EDBB14( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_187EDCE4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_37:
  v45 = *(void *)(a1 + 32);
  if (*(void *)(v45 + 328) <= 0x64uLL)
  {
    if (*(void *)(v45 + 408) || *(void *)(v45 + 448))
    {
      *(_BYTE *)(v45 + 36) = 1;
    }

    else
    {
      v46 = [MEMORY[0x189603F50] date];
      v47 = *(void *)(a1 + 32);
      v48 = *(void **)(v47 + 376);
      *(void *)(v47 + 376) = v46;

      v49 = (void *)MEMORY[0x189607968];
      +[WiFiUsagePrivacyFilter timeSinceBootInSeconds](&OBJC_CLASS___WiFiUsagePrivacyFilter, "timeSinceBootInSeconds");
      v50 = objc_msgSend(v49, "numberWithDouble:");
      v51 = *(void *)(a1 + 32);
      v52 = *(void **)(v51 + 384);
      *(void *)(v51 + 384) = v50;

      v53 = *(void *)(a1 + 32);
      if (*(void *)(v53 + 344))
      {
        v54 = (void *)MEMORY[0x189607968];
        objc_msgSend(*(id *)(v53 + 376), "timeIntervalSinceDate:");
        v55 = objc_msgSend(v54, "numberWithDouble:");
        v56 = *(void *)(a1 + 32);
        v57 = *(void **)(v56 + 392);
        *(void *)(v56 + 392) = v55;

        v53 = *(void *)(a1 + 32);
      }

      if (*(void *)(v53 + 352))
      {
        v58 = (void *)MEMORY[0x189607968];
        objc_msgSend(*(id *)(v53 + 376), "timeIntervalSinceDate:");
        v59 = objc_msgSend(v58, "numberWithDouble:");
        v60 = *(void *)(a1 + 32);
        v61 = *(void **)(v60 + 400);
        *(void *)(v60 + 400) = v59;
      }
    }
  }
}

  -[WFLoggerFile cleanStaleLogs](self, "cleanStaleLogs");
}

      goto LABEL_47;
    }

    v51 = v28;
    v32 = 0LL;
    v30 = v14;
LABEL_28:
    if (![v22 containsObject:v21])
    {
LABEL_44:

      goto LABEL_48;
    }

    if ([v51 count] == 2)
    {
      v40 = [v51 objectAtIndexedSubscript:0];
      v41 = v15;
      v42 = (void *)v40;
      [a1 parseCriteria:v40 intoRequiredFields:v30 andFeatures:v41 forFields:v57 withType:v16 isFilter:v54];
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      [v51 objectAtIndexedSubscript:1];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 parseCriteria:v43 intoRequiredFields:v30 andFeatures:v52 forFields:v57 withType:v16 isFilter:v54];
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50 && v44)
      {
        v56 = [NSString stringWithFormat:@"( %@) %@(%@)", v50, v21, v44];

        v39 = v50;
        v32 = (void *)v56;
        v15 = v52;
LABEL_43:

        goto LABEL_44;
      }

      v28 = v51;
      v15 = v52;
    }

    else
    {
      NSLog( @"%s - Failed to parse (Binary criteria %@ contains %lu conditions)",  "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]",  v21,  [v51 count]);

      v28 = v51;
    }

    goto LABEL_37;
  }

  v22 = v17;
  v23 = v19;
  NSLog( @"%s -  Failed to parse (criteria does not contain key 'test'): %@",  "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]",  v13);
  v32 = 0LL;
  v30 = v14;
LABEL_49:

  return v32;
}

LABEL_41:
}

LABEL_79:
      return;
    }

    if ((unint64_t)[*(id *)(a1 + 48) length] <= 5)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 136315650;
        v112 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
        v113 = 2160;
        v114 = 1752392040LL;
        v115 = 2112;
        v116 = v9;
        uint64_t v10 = (os_log_s *)MEMORY[0x1895F8DA0];
        v11 = "%s - currentBSSID (%{mask.hash}@) too short";
        uint64_t v12 = 32;
LABEL_10:
        _os_log_impl(&dword_187EBF000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, v12);
        goto LABEL_79;
      }

      goto LABEL_79;
    }

    [*(id *)(a1 + 48) getBytes:v109 length:6];
    objc_msgSend( NSString,  "stringWithFormat:",  @"%x:%02x:%02x:%02x:%02x:%02x",  v109[0],  v109[1],  v109[2],  v109[3],  v109[4],  v109[5]);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v15 = *(id *)(a1 + 56);
    v16 = [v15 countByEnumeratingWithState:&v105 objects:v131 count:16];
    if (v16)
    {
      v80 = 0LL;
      v17 = *(void *)v106;
      do
      {
        for (i = 0LL; i != v16; ++i)
        {
          if (*(void *)v106 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = *(void **)(*((void *)&v105 + 1) + 8 * i);
          [v19 objectForKey:@"BSSID"];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 objectForKey:@"SSID"];
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v20 isEqualToString:v82])
          {
            v22 = v21;

            v80 = v22;
          }
        }

        v16 = [v15 countByEnumeratingWithState:&v105 objects:v131 count:16];
      }

      while (v16);

      if (v80)
      {
        v77 = (void *)objc_opt_new();
        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        v23 = *(id *)(a1 + 56);
        v24 = [v23 countByEnumeratingWithState:&v101 objects:v130 count:16];
        if (v24)
        {
          v25 = *(void *)v102;
          do
          {
            for (j = 0LL; j != v24; ++j)
            {
              if (*(void *)v102 != v25) {
                objc_enumerationMutation(v23);
              }
              v27 = *(void **)(*((void *)&v101 + 1) + 8 * j);
              [v27 objectForKey:@"AGE"];
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              [v27 objectForKey:@"SSID"];
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if ((unint64_t)[v28 unsignedIntegerValue] <= 0x1388
                && [v29 isEqualToData:v80])
              {
                [v77 addObject:v27];
              }
            }

            v24 = [v23 countByEnumeratingWithState:&v101 objects:v130 count:16];
          }

          while (v24);
        }

        v79 = [v77 count];
        v81 = (void *)objc_opt_new();
        v69 = v62;
        v97 = 0u;
        v98 = 0u;
        v99 = 0u;
        v100 = 0u;
        obj = v77;
        v30 = [obj countByEnumeratingWithState:&v97 objects:v129 count:16];
        if (v30)
        {
          v74 = -95LL;
          v73 = 3;
          v71 = *(void *)v98;
          v72 = 3;
          v75 = 3;
          v76 = -95LL;
          v78 = -95LL;
          do
          {
            for (k = 0LL; k != v30; ++k)
            {
              if (*(void *)v98 != v71) {
                objc_enumerationMutation(obj);
              }
              v32 = *(void **)(*((void *)&v97 + 1) + 8 * k);
              [v32 objectForKey:@"BSSID"];
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              [v32 objectForKey:@"CHANNEL_FLAGS"];
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              [v32 objectForKey:@"CHANNEL"];
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              [v32 objectForKey:@"RSSI"];
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = +[WiFiUsagePrivacyFilter bandFromFlags:OrChannel:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "bandFromFlags:OrChannel:",  v34,  v35);
              [MEMORY[0x189607968] numberWithInteger:v37];
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              [v81 objectForKeyedSubscript:v38];
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v39 == 0LL;

              if (v40)
              {
                v41 = (void *)objc_opt_new();
                [v81 setObject:v41 forKeyedSubscript:v38];
              }

              [v81 objectForKeyedSubscript:v38];
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              [v42 addObject:v33];

              if (v79)
              {
                if (v36 && [v36 integerValue] >= v78)
                {
                  v78 = [v36 integerValue];
                  v73 = v37;
                }

                if ([v33 isEqualToString:v82])
                {
                  v76 = [v36 integerValue];
                  v75 = v37;
                }

                else if (v36 && [v36 integerValue] >= v74)
                {
                  v74 = [v36 integerValue];
                  v72 = v37;
                }

                v43 = (os_log_s *)MEMORY[0x1895F8DA0];
                v44 = MEMORY[0x1895F8DA0];
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  +[WiFiUsagePrivacyFilter bandAsString:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "bandAsString:", v37);
                  v45 = (id)objc_claimAutoreleasedReturnValue();
                  v46 = [v33 isEqualToString:v82];
                  *(_DWORD *)buf = 136316418;
                  v47 = &stru_18A170410;
                  if (v46) {
                    v47 = @"(current BSSID)";
                  }
                  v112 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
                  v113 = 2160;
                  v114 = 1752392040LL;
                  v115 = 2112;
                  v116 = (uint64_t)v33;
                  v117 = 2112;
                  v118 = v45;
                  v119 = 2112;
                  v120 = (uint64_t)v36;
                  v121 = 2112;
                  v122 = (uint64_t)v47;
                  _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - bssid:%{mask.hash}@ %@Ghz rssi:%@dBm %@",  buf,  0x3Eu);
                }
              }
            }

            v30 = [obj countByEnumeratingWithState:&v97 objects:v129 count:16];
          }

          while (v30);
        }

        else
        {
          v74 = -95LL;
          v72 = 3;
          v73 = 3;
          v75 = 3;
          v76 = -95LL;
          v78 = -95LL;
        }

        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v112 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
          v113 = 2112;
          v114 = (uint64_t)v81;
          _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - roamCandidatesByBand:%@",  buf,  0x16u);
        }

        if (v79)
        {
          v48 = (os_log_s *)MEMORY[0x1895F8DA0];
          v49 = MEMORY[0x1895F8DA0];
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            +[WiFiUsagePrivacyFilter bandAsString:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "bandAsString:", v73);
            v50 = (id)objc_claimAutoreleasedReturnValue();
            v51 = +[WiFiUsagePrivacyFilter bandAsString:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "bandAsString:", v72);
            v52 = (void *)v51;
            v53 = @"NO";
            *(_DWORD *)buf = 136317186;
            v112 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
            v113 = 2048;
            v114 = v76;
            if (!v60) {
              v53 = @"YES";
            }
            v115 = 2048;
            v116 = v78;
            v117 = 2112;
            v118 = v50;
            v119 = 2048;
            v120 = v74;
            v121 = 2112;
            v122 = v51;
            v123 = 2048;
            v124 = v79;
            v125 = 2112;
            v126 = v69;
            v127 = 2112;
            v128 = v53;
            _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - \n currentBSSrssi:%lddBm strongestRSSI:%lddBm strongestRssiBand:%@ strongestRssiExcludingCurrent:%lddBm stron gestRSSIbandExcludingCurrent:%@Ghz candidatesCount:%lu roamBandTransition:%@ roamSuccessful:%@",  buf,  0x5Cu);
          }
        }

        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        [*(id *)(*(void *)(a1 + 64) + 104) valueForKey:*(void *)(a1 + 32)];
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = [v54 countByEnumeratingWithState:&v93 objects:v110 count:16];
        v56 = v69;
        if (v55)
        {
          v57 = *(void *)v94;
          do
          {
            for (m = 0LL; m != v55; ++m)
            {
              if (*(void *)v94 != v57) {
                objc_enumerationMutation(v54);
              }
              v59 = *(void **)(*((void *)&v93 + 1) + 8 * m);
              v83 = v76;
              v84 = v75;
              v85 = v78;
              v86 = v74;
              v87 = v73;
              v88 = v72;
              v89 = v79;
              v90 = v81;
              v91 = v56;
              v92 = v60 == 0;
              if (v59)
              {
                [v59 roamCandidatesStatsDidUpdate:&v83];
              }

              else
              {

                v56 = v69;
              }
            }

            v55 = [v54 countByEnumeratingWithState:&v93 objects:v110 count:16];
          }

          while (v55);
        }

LABEL_78:
        goto LABEL_79;
      }
    }

    else
    {
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v112 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
      v113 = 2160;
      v114 = 1752392040LL;
      v115 = 2112;
      v116 = (uint64_t)v82;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - currentBSSID (%{mask.hash}@) not in beaconCache",  buf,  0x20u);
    }

    goto LABEL_78;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v112 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
    v113 = 2112;
    v114 = v13;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s - Invalid interfaceName: %@",  buf,  0x16u);
  }

  [v10 removeAllObjects];
  [v74 removeAllObjects];
}

void sub_187EE3F5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, void *a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, void *a38)
{
}

LABEL_11:
}
}

  return v6;
}

    if (v12)
    {
      v15 = (void *)[v12 mutableCopy];
      [v12 objectForKeyedSubscript:@"apProfileBeaconInfo"];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 addEntriesFromDictionary:v16];

      [v12 objectForKeyedSubscript:@"apProfileWPSInfo"];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 addEntriesFromDictionary:v17];

      [v15 setValue:0 forKey:@"apProfileBeaconInfo"];
      [v15 setValue:0 forKey:@"apProfileWPSInfo"];
      [v15 objectForKeyedSubscript:@"apProfileCacheTimestampCreated"];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 timeIntervalSinceNow];
      v20 = -v19;

      [a1 _getBinTimeInterval:1 As:v20];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 setValue:v21 forKey:@"ageAtRemoval"];

      [v15 setValue:0 forKey:@"apProfileCacheTimestampCreated"];
      [v15 objectForKeyedSubscript:@"apProfileCacheTimestamp"];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 timeIntervalSinceNow];
      v24 = -v23;

      [a1 _getBinTimeInterval:1 As:v24];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 setValue:v25 forKey:@"timeSinceLastRefresh"];

      [v15 setValue:0 forKey:@"apProfileCacheTimestamp"];
      [v15 setValue:0 forKey:@"submittedToCA"];
      [v12 objectForKey:@"apProfileBeaconInfoParsingSuccessful"];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = [v26 BOOLValue];

      if (v27) {
        [v15 setValue:0 forKey:@"apProfileBeaconRaw"];
      }
      goto LABEL_16;
    }

    goto LABEL_15;
  }

  v13 = 0LL;
LABEL_17:

  return v13;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_187EEEE78(_Unwind_Exception *a1)
{
}

void sub_187EEFB80( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_187EEFDF0(_Unwind_Exception *a1)
{
}

LABEL_33:
  [v86 setNetworkOrigin:v87];
  [v8 networkDetails];
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = [v88 isOpen];

  if (v89)
  {
    v90 = p_isa[1];
    v91 = 1LL;
  }

  else
  {
    [v8 networkDetails];
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = [v92 hasEnterpriseSecurity];

    if (v93)
    {
      v90 = p_isa[1];
      v91 = 4LL;
    }

    else
    {
      [v8 networkDetails];
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = [v96 hasWep];

      v90 = p_isa[1];
      if (v97) {
        v91 = 2LL;
      }
      else {
        v91 = 3LL;
      }
    }
  }

  [v90 addAuthTraits:v91];
  [v8 networkDetails];
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = [v100 isMoving];

  if (v101) {
    [p_isa[1] addTraits:1];
  }
  [v8 networkDetails];
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = [v102 isWidelyDeployed];

  if (v103) {
    [p_isa[1] addTraits:2];
  }
  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  [v8 networkDetails];
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  [v104 downloadSpeedResults];
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  v106 = [v105 countByEnumeratingWithState:&v149 objects:v156 count:16];
  if (v106)
  {
    v107 = v106;
    v108 = *(void *)v150;
    do
    {
      for (i = 0LL; i != v107; ++i)
      {
        if (*(void *)v150 != v108) {
          objc_enumerationMutation(v105);
        }
        v110 = *(void **)(*((void *)&v149 + 1) + 8 * i);
        v111 = objc_alloc_init(MEMORY[0x18960F418]);
        [v110 floatValue];
        objc_msgSend(v111, "setAvgDL:");
        [p_isa[1] addSpeedTest:v111];
      }

      v107 = [v105 countByEnumeratingWithState:&v149 objects:v156 count:16];
    }

    while (v107);
  }

  v138 = v8;

  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  v112 = v139;
  v113 = [v112 countByEnumeratingWithState:&v145 objects:v155 count:16];
  if (v113)
  {
    v114 = v113;
    v115 = 0;
    v116 = *(void *)v146;
    do
    {
      for (j = 0LL; j != v114; ++j)
      {
        if (*(void *)v146 != v116) {
          objc_enumerationMutation(v112);
        }
        v118 = *(void **)(*((void *)&v145 + 1) + 8 * j);
        v119 = objc_alloc_init(MEMORY[0x18960F3F8]);
        objc_msgSend(v119, "setRssi:", objc_msgSend(v118, "rssi"));
        objc_msgSend(v119, "setChannel:", objc_msgSend(v118, "channel"));
        [v118 bssid];
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        [v119 setUniqueID:v120];

        [v82[1] addEssMembers:v119];
        if ((v115 & 1) == 0)
        {
          v121 = [v118 networkAccessCode];
          v122 = [v118 venueGroup];
          v123 = [v118 venueCode];
          v124 = objc_alloc_init(MEMORY[0x18960F428]);
          [v124 setVenueName:&stru_18A170410];
          [v124 setNetworkType:v121];
          [v124 setVenueType:v123];
          v125 = v122;
          v82 = p_isa;
          [v124 setVenueGroup:v125];
          [p_isa[1] setPasspointInfo:v124];
        }

        v115 = 1;
      }

      v114 = [v112 countByEnumeratingWithState:&v145 objects:v155 count:16];
    }

    while (v114);
  }

  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  uint64_t v10 = v137;
  v126 = v137;
  v127 = [v126 countByEnumeratingWithState:&v141 objects:v154 count:16];
  v8 = v138;
  if (v127)
  {
    v128 = v127;
    v129 = *(void *)v142;
    do
    {
      for (k = 0LL; k != v128; ++k)
      {
        if (*(void *)v142 != v129) {
          objc_enumerationMutation(v126);
        }
        v131 = *(void **)(*((void *)&v141 + 1) + 8 * k);
        v132 = objc_alloc_init(MEMORY[0x18960F3F8]);
        objc_msgSend(v132, "setRssi:", objc_msgSend(v131, "rssi"));
        objc_msgSend(v132, "setChannel:", objc_msgSend(v131, "channel"));
        [v131 bssid];
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        [v132 setUniqueID:v133];

        [p_isa[1] addNearbyBSS:v132];
      }

      v128 = [v126 countByEnumeratingWithState:&v141 objects:v154 count:16];
    }

    while (v128);
  }

  self = p_isa;
  v66 = self;
  v9 = v139;
LABEL_72:

  return v66;
}

uint64_t WiFiUsageConnectionQualityRecordConvertDisconnectReasonToGEOReason(uint64_t a1)
{
  switch(a1)
  {
    case 1000LL:
      uint64_t result = 6LL;
      break;
    case 1001LL:
      uint64_t result = 8LL;
      break;
    case 1002LL:
      uint64_t result = 7LL;
      break;
    case 1003LL:
      uint64_t result = 9LL;
      break;
    case 1004LL:
      uint64_t result = 10LL;
      break;
    case 1005LL:
      uint64_t result = 11LL;
      break;
    case 1006LL:
      uint64_t result = 12LL;
      break;
    case 1007LL:
      uint64_t result = 13LL;
      break;
    case 1008LL:
      uint64_t result = 14LL;
      break;
    case 1009LL:
      uint64_t result = 15LL;
      break;
    case 1010LL:
      uint64_t result = 16LL;
      break;
    case 1011LL:
      uint64_t result = 17LL;
      break;
    case 1012LL:
      uint64_t result = 18LL;
      break;
    case 1013LL:
      uint64_t result = 19LL;
      break;
    case 1014LL:
      uint64_t result = 20LL;
      break;
    case 1015LL:
      uint64_t result = 21LL;
      break;
    case 1016LL:
      uint64_t result = 22LL;
      break;
    case 1017LL:
      uint64_t result = 23LL;
      break;
    case 1018LL:
      uint64_t result = 24LL;
      break;
    case 1019LL:
      uint64_t result = 25LL;
      break;
    case 1020LL:
      uint64_t result = 26LL;
      break;
    case 1021LL:
      uint64_t result = 28LL;
      break;
    default:
      uint64_t v2 = a1 - 1;
      uint64_t result = 1LL;
      switch(v2)
      {
        case 0LL:
          return result;
        case 1LL:
          uint64_t result = 2LL;
          break;
        case 2LL:
          uint64_t result = 3LL;
          break;
        case 3LL:
          uint64_t result = 4LL;
          break;
        case 4LL:
          uint64_t result = 5LL;
          break;
        case 5LL:
          uint64_t result = 27LL;
          break;
        default:
          uint64_t result = 0LL;
          break;
      }

      break;
  }

  return result;
}

void sub_187EF5890( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_187EF6A00(_Unwind_Exception *a1)
{
}

void sub_187EFC124( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_187EFC6E8(_Unwind_Exception *a1)
{
}

void sub_187EFD720( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

LABEL_26:
  objc_msgSend( v3,  "appendFormat:",  @"_BEL%d:%d_S%d:%d",  self->_trafficClassBESucceededLarge,  self->_trafficClassBEAttemptedLarge,  self->_trafficClassBESucceededSmall,  self->_trafficClassBEAttemptedSmall);
  if (!v5)
  {
LABEL_17:
    if (!v6) {
      goto LABEL_18;
    }
LABEL_28:
    objc_msgSend( v3,  "appendFormat:",  @"_VOL%d:%d_S%d:%d",  self->_trafficClassVOSucceededLarge,  self->_trafficClassVOAttemptedLarge,  self->_trafficClassVOSucceededSmall,  self->_trafficClassVOAttemptedSmall);
    if (!v7) {
      return v3;
    }
    goto LABEL_19;
  }

  if (v13)
  {
    v22 = (WiFiUsageNetworkDetails *)[v13 copy];
    v23 = self->_lastNetworkDetails;
    self->_lastNetworkDetails = v22;
  }
}

    v14 = a3 - 1;
    if (a3 - 1 < 3) {
      return qword_187F83A58[12 * v14 + 3 * v13 + v12];
    }
    goto LABEL_29;
  }

  if (v9 == 256)
  {
    uint64_t v12 = 2LL;
    goto LABEL_17;
  }

  return 0x7FFFFFFFFFFFFFFFLL;
}

    goto LABEL_27;
  }

  v19 = 0;
LABEL_27:

  return v19;
}

LABEL_27:
  objc_msgSend( v3,  "appendFormat:",  @"_BKL%d:%d_S%d:%d",  self->_trafficClassBKSucceededLarge,  self->_trafficClassBKAttemptedLarge,  self->_trafficClassBKSucceededSmall,  self->_trafficClassBKAttemptedSmall);
  if (v6) {
    goto LABEL_28;
  }
LABEL_18:
  if (v7) {
LABEL_19:
  }
    objc_msgSend( v3,  "appendFormat:",  @"_VIL%d:%d_S%d:%d",  self->_trafficClassVISucceededLarge,  self->_trafficClassVIAttemptedLarge,  self->_trafficClassVISucceededSmall,  self->_trafficClassVIAttemptedSmall);
  return v3;
}

LABEL_5:
  v7 = 0;
LABEL_10:

  return v7;
}

  uint64_t v12 = 1;
LABEL_17:

  return v12;
}

LABEL_20:
    v19 = -[WiFiUsageNetworkDetails networkName](lastNetworkDetails, "networkName");
    v20 = [v19 isEqual:v12];

    v21 = -[WiFiUsageSession isSessionActive](self, "isSessionActive");
    if (v20)
    {
      if (((v16 | !v21) & 1) == 0) {
        goto LABEL_26;
      }
LABEL_25:
      NSLog( @"%s: network session started",  "-[WiFiUsageNetworkSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:]");
      -[WiFiUsageNetworkSession sessionDidStart](self, "sessionDidStart");
      goto LABEL_26;
    }

    if (!v21 && !v17) {
      goto LABEL_25;
    }
LABEL_24:
    NSLog( @"%s: network session ended",  "-[WiFiUsageNetworkSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:]");
    -[WiFiUsageNetworkSession sessionDidEnd](self, "sessionDidEnd");
    goto LABEL_25;
  }

  if (v12 || !lastNetworkDetails)
  {
    if (!v12 || !lastNetworkDetails) {
      goto LABEL_26;
    }
    v17 = 0;
    goto LABEL_20;
  }

  v18 = -[WiFiUsageSession isSessionActive](self, "isSessionActive");
  if (!a6 && v18)
  {
    NSLog( @"%s: network session ended",  "-[WiFiUsageNetworkSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:]");
    -[WiFiUsageNetworkSession sessionDidEnd](self, "sessionDidEnd");
  }

      ++v10;
    }

    while (v7 != v10);
    v33 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    v7 = v33;
  }

  while (v33);
  v34 = 0LL;
  v22 = v40;
LABEL_36:

  NSLog(@"%s: received config for platform %@", "+[WiFiUsageLQMConfiguration getConfigForPlatform]", v22);
  if (!v34) {
    NSLog( @"%s: unable to find DataPathTelemetry configuration for current platform",  "+[WiFiUsageLQMConfiguration getConfigForPlatform]");
  }
LABEL_38:
  v39 = p_cache[328];
  p_cache[328] = v34;
}

    objc_autoreleasePoolPop(v7);
    uint64_t v4 = v28;
  }

  else
  {
    v24 = -[WiFi3BarsNetwork network](self, "network");
    NSLog( @"%s: network (%@) contains 0 access points",  "-[WiFi3BarsNetwork containsAccessPointMatchingBSSIDs:]",  v24);

    v22 = 0;
  }

  return v22;
}

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___WiFiUsagePoorLinkSession;
  -[WiFiUsageSession roamingStateDidChange:reason:andStatus:andLatency:andRoamData:andPingPongStats:]( &v11,  sel_roamingStateDidChange_reason_andStatus_andLatency_andRoamData_andPingPongStats_);
}
}

        v20 = 0x189607000uLL;
        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        v83 = v6;
        [v6 blacklistedStatesCurrent];
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = [v21 countByEnumeratingWithState:&v90 objects:v98 count:16];
        if (!v22) {
          goto LABEL_58;
        }
        v23 = v22;
        v24 = *(void *)v91;
LABEL_22:
        v25 = 0LL;
        while (1)
        {
          if (*(void *)v91 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v90 + 1) + 8 * v25);
          [MEMORY[0x189603F50] date];
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          [v27 timeIntervalSince1970];
          v29 = v28;

          if ([v26 blacklistedState] != a3 || objc_msgSend(v26, "blacklistedState") != 3) {
            goto LABEL_38;
          }
          -[WFBlacklistEngine wowBlacklistExpiry](self, "wowBlacklistExpiry");
          if (v14 != 0.0) {
            break;
          }
          objc_msgSend( *(id *)(v20 + 2600),  "stringWithFormat:",  @"%s No history for most recent blacklisting time!!",  "-[WFBlacklistEngine removeExpiredBlacklistedState:]");
          v31 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v32 = (os_log_s *)MEMORY[0x1895F8DA0];
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
            goto LABEL_29;
          }
LABEL_52:

LABEL_53:
          if (v23 == ++v25)
          {
            v68 = [v21 countByEnumeratingWithState:&v90 objects:v98 count:16];
            v23 = v68;
            if (!v68)
            {
LABEL_58:

              v88[0] = MEMORY[0x1895F87A8];
              v88[1] = 3221225472LL;
              v88[2] = __51__WFBlacklistEngine_removeExpiredBlacklistedState___block_invoke;
              v88[3] = &unk_18A16E910;
              v6 = v83;
              v69 = v83;
              v89 = v69;
              v5 = v85;
              [v85 enumerateObjectsUsingBlock:v88];
              [v69 blacklistedStatesCurrent];
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              [v70 removeObjectsInArray:v85];

              if ([v85 count])
              {
                v71 = -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
                v72 = objc_opt_respondsToSelector();

                v7 = v84;
                if ((v72 & 1) != 0)
                {
                  v73 = -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
                  [v73 blacklistDidUpdate];
                }

                [v85 removeAllObjects];
                -[WFBlacklistEngine _printBlacklist](self, "_printBlacklist");
              }

              else
              {
                [v85 removeAllObjects];
                v7 = v84;
              }

              goto LABEL_64;
            }

            goto LABEL_22;
          }
        }

        v36 = v30;
        if ([v26 blacklistedReason] == 2)
        {
          [v26 blacklistedStateTimestamp];
          if (v29 - v37 <= 3600.0)
          {
            objc_msgSend( *(id *)(v20 + 2600),  "stringWithFormat:",  @"%s Skipping blacklist expiration: recent power alert",  "-[WFBlacklistEngine removeExpiredBlacklistedState:]");
            v31 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v32 = (os_log_s *)MEMORY[0x1895F8DA0];
            if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_52;
            }
LABEL_29:
            v33 = *(void **)(v20 + 2600);
            v31 = v31;
            v34 = objc_msgSend(v33, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v31, "UTF8String"));
            v35 = [v34 UTF8String];
            *(_DWORD *)buf = 136446210;
            v101 = v35;
            _os_log_impl(&dword_187EBF000, v32, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

            goto LABEL_52;
          }
        }

        objc_msgSend( *(id *)(v20 + 2600),  "stringWithFormat:",  @"%s timeDiff :%f expiry :%f ",  "-[WFBlacklistEngine removeExpiredBlacklistedState:]",  v29 - v14,  *(void *)&v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
        {
          v39 = objc_msgSend( *(id *)(v20 + 2600), "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v38, "UTF8String"));
          v40 = [v39 UTF8String];
          *(_DWORD *)buf = 136446210;
          v101 = v40;
          _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

          self = v87;
        }

        if (v29 - v14 > v36)
        {
          [v26 blacklistedStateString];
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 blacklistedStateTimestamp];
          v42 = *(void **)(v20 + 2600);
          objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSince1970:");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          [v42 stringWithFormat:@"%s Unblacklisting '%@' expired blacklisted state %@ (%@) for:%@", "-[WFBlacklistEngine removeExpiredBlacklistedState:]", v86, v41, v43, v86];
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
          {
            v45 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v44, "UTF8String"));
            v46 = [v45 UTF8String];
            *(_DWORD *)buf = 136446210;
            v101 = v46;
            _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
          }

          [v85 addObject:v26];
          self = v87;
          v20 = 0x189607000uLL;
        }

id __softlink__BiomeLibrary()
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v0 = getBiomeLibrarySymbolLoc_ptr;
  v8 = getBiomeLibrarySymbolLoc_ptr;
  if (!getBiomeLibrarySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)BiomeLibraryLibrary();
    uint64_t v0 = dlsym(v1, "BiomeLibrary");
    v6[3] = (uint64_t)v0;
    getBiomeLibrarySymbolLoc_ptr = v0;
  }

  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)__softlink__BiomeLibrary_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }

  ((void (*)(uint64_t))v0)(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_187F01DF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

LABEL_25:
    v9 = 0;
    goto LABEL_17;
  }

LABEL_16:
  v9 = 1;
LABEL_17:

  return v9;
}

  return (char)v17;
}

uint64_t BiomeLibraryLibrary()
{
  if (!BiomeLibraryLibraryCore_frameworkLibrary) {
    BiomeLibraryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = BiomeLibraryLibraryCore_frameworkLibrary;
  if (!BiomeLibraryLibraryCore_frameworkLibrary)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }

  return v0;
}

WiFiUsageLQMMLOSample *__getBMDeviceWiFiClass_block_invoke(uint64_t a1)
{
  uint64_t result = (WiFiUsageLQMMLOSample *)objc_getClass("BMDeviceWiFi");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    getBMDeviceWiFiClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    unint64_t v3 = (WiFiUsageLQMMLOSample *)__getBMDeviceWiFiClass_block_invoke_cold_1();
    return -[WiFiUsageLQMMLOSample initWith:andDuration:](v3, v4, v5, v6);
  }

  return result;
}

LABEL_65:
    v17 = -[WFMeasure options](v12, "options") | 0x40;
LABEL_74:
    -[WFMeasure setOptions:](v12, "setOptions:", v17);
    goto LABEL_75;
  }

  if (-[WFMeasure shouldTimeoutSampleSiriTLS](v12, "shouldTimeoutSampleSiriTLS")) {
    -[WFMeasure setOptions:](v12, "setOptions:", -[WFMeasure options](v12, "options") | 0x40);
  }
  if ((-[WFMeasure options](v12, "options") & 0x40) == 0
    && -[WFMeasure shouldTimeoutSampleSiriTCP](v12, "shouldTimeoutSampleSiriTCP"))
  {
    -[WFMeasure setOptions:](v12, "setOptions:", -[WFMeasure options](v12, "options") | 0x20);
  }

  -[WFMeasure setTclass:]( v12,  "setTclass:",  -[WFMeasure getTimeoutSampleTrafficClass](v12, "getTimeoutSampleTrafficClass"));
  if ([v10 containsString:@"tcp"])
  {
LABEL_73:
    v17 = -[WFMeasure options](v12, "options") | 0x20;
    goto LABEL_74;
  }

LABEL_75:
  if (MGGetBoolAnswer())
  {
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_5;
    v22[3] = &unk_18A16C818;
    v23 = v12;
    -[WFMeasure getLazyNSNumberPreference:exists:](v23, "getLazyNSNumberPreference:exists:", @"test_options", v22);
  }

  NSLog( @"%s: Will test type: %lu for Reason: %@ prevTestedOptions: 0x%lx options: 0x%lx using interface: %@",  "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]",  a3,  v10,  a5,  -[WFMeasure options](v12, "options"),  v11);
  if (-[WFMeasure options](v12, "options"))
  {
    -[WFMeasure setPublicDNSAddress:](v12, "setPublicDNSAddress:", @"1.1.1.1");
    -[WFMeasure setTestDNSHostname:](v12, "setTestDNSHostname:", @"www.apple.com");
    v18 = -[WFMeasureResult initWithType:](objc_alloc(&OBJC_CLASS___WFMeasureResult), "initWithType:", a3);
    -[WFMeasure setResult:](v12, "setResult:", v18);

    v19 = -[WFMeasure options](v12, "options");
    v20 = -[WFMeasure result](v12, "result");
    [v20 setOptions:v19];

    -[WFMeasure retrieveNetworkConfigurations](v12, "retrieveNetworkConfigurations");
    NSLog( @"%s: LQM-WiFi: %@",  "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]",  v12);
    uint64_t v12 = v12;
    v16 = v12;
    goto LABEL_79;
  }

  NSLog( @"%s: options not specified",  "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]");

  uint64_t v12 = 0LL;
LABEL_25:
  v16 = 0LL;
LABEL_79:
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v16;
}

void sub_187F033B8(_Unwind_Exception *a1)
{
}

void sub_187F0396C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_187F03C24( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_187F03E88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_187F040A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_187F04360( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_187F045C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_187F047E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_187F04A9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_187F04D00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_63:
                  }
                }
              }

              else
              {
                uint64_t v30 = [v59 integerValue];
                v31 = *(void **)(a1 + 48);
                if (v30 == 300)
                {
                  [v31 result];
                  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend( v32,  "setTrafficClassBEAttemptedSmall:",  *(void *)(a1 + 64) + objc_msgSend(v32, "trafficClassBEAttemptedSmall"));
                }

                else
                {
                  [v31 result];
                  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend( v32,  "setTrafficClassBEAttemptedLarge:",  *(void *)(a1 + 64) + objc_msgSend(v32, "trafficClassBEAttemptedLarge"));
                }

                if (v85[3] >= 1)
                {
                  v41 = [v59 integerValue];
                  v42 = *(void **)(a1 + 48);
                  if (v41 == 300)
                  {
                    [v42 result];
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend( v38,  "setTrafficClassBESucceededSmall:",  v85[3] + objc_msgSend(v38, "trafficClassBESucceededSmall"));
                  }

                  else
                  {
                    [v42 result];
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend( v38,  "setTrafficClassBESucceededLarge:",  v85[3] + objc_msgSend(v38, "trafficClassBESucceededLarge"));
                  }

                  goto LABEL_63;
                }
              }
            }

            v45 = *(_BYTE **)(a1 + 48);
            if (v45[13] && !v85[3])
            {
              [v45 result];
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              [v46 setSeenSpecificAcFailure:1];
            }

            v47 = *(void *)(a1 + 80);
            switch(v47)
            {
              case 2LL:
                [*(id *)(a1 + 48) result];
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                [v48 setGatewayResultsValid:v14];
                goto LABEL_73;
              case 8LL:
                [*(id *)(a1 + 48) result];
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                [v48 setPublicResultsValid:v14];
                goto LABEL_73;
              case 4LL:
                [*(id *)(a1 + 48) result];
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                [v48 setLocalResultsValid:v14];
LABEL_73:

                goto LABEL_75;
            }

            NSLog( @"%s: not a recognizable ping option. Ignoring results",  "-[WFMeasure dispatchPingTest:]_block_invoke");
LABEL_75:
            v3 += v10;
            v4 += v20;
            if ((v14 & 1) == 0)
            {
              if (!*(void *)(a1 + 56))
              {
                if (MGGetBoolAnswer())
                {
                  NSLog( @"%s: Pinging LocalDNS PublicDNS or Gateway failed due to no pingAddress",  "-[WFMeasure dispatchPingTest:]_block_invoke");
                  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
                    __30__WFMeasure_dispatchPingTest___block_invoke_cold_1(&buf, v71);
                  }
                }
              }

              goto LABEL_83;
            }

            ++v6;
          }

          while (v57 != v6);
          uint64_t v5 = [v56 countByEnumeratingWithState:&v76 objects:v90 count:16];
          if (v5) {
            continue;
          }
          break;
        }

LABEL_83:
      }

      v54 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
      if (!v54) {
        goto LABEL_87;
      }
    }
  }

  unint64_t v3 = 0LL;
  SEL v4 = 0LL;
  v60 = 0x7FFFFFFFLL;
  v61 = 0xFFFFFFFF80000000LL;
LABEL_87:

  [*(id *)(a1 + 48) internalQueue];
  v49 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__WFMeasure_dispatchPingTest___block_invoke_242;
  block[3] = &unk_18A16DBD0;
  v65 = v3;
  v66 = v4;
  v50 = *(id *)(a1 + 56);
  v67 = v60;
  v68 = v61;
  v69 = *(void *)(a1 + 80);
  v51 = *(void *)(a1 + 48);
  v63 = v50;
  v64 = v51;
  dispatch_sync(v49, block);

  _Block_object_dispose(&v84, 8);
}

void sub_187F06244( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

void sub_187F068F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187F06C44(_Unwind_Exception *a1)
{
}

void sub_187F07454(_Unwind_Exception *a1)
{
}

void sub_187F098C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187F09AE4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187F0AA70( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, id location)
{
}

void sub_187F0CF74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_187F0D200(_Unwind_Exception *a1)
{
}

void WFLoggerTimerTmoCallBack(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)MEMORY[0x1895BA820]();
  if (!a1) {
    goto LABEL_9;
  }
  if (!*(void *)(a1 + 8))
  {
    uint64_t v5 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: _ctxt is null",  "WFLoggerTimerTmoCallBack");
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
LABEL_13:
    *(_DWORD *)buf = 136446210;
    uint64_t v7 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v5, "UTF8String")),  "UTF8String");
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    goto LABEL_9;
  }

  if (!*(void *)(a1 + 24))
  {
    uint64_t v5 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: _dispatchQueue is null",  "WFLoggerTimerTmoCallBack");
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    goto LABEL_13;
  }

  unint64_t v3 = (void *)objc_msgSend(NSString, "stringWithFormat:", @"%s: Timeout", "WFLoggerTimerTmoCallBack");
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v7 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v3, "UTF8String")),  "UTF8String");
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  if ([(id)a1 checkLogFileUpdate:*(void *)(a1 + 96)])
  {
    SEL v4 = (const void *)[(id)a1 changeLogFile:*(unsigned __int8 *)(a1 + 64)];
    if (v4) {
      CFRelease(v4);
    }
  }

LABEL_28:
        Current = CFAbsoluteTimeGetCurrent();
        fileCreationDate = self->_fileCreationDate;
        if (fileCreationDate)
        {
          CFRelease(fileCreationDate);
          self->_fileCreationDate = 0LL;
        }

        self->_fileCreationDate = CFDateCreate(v10, Current);
        self->_isFileLoggingEnabled = 1;
        self->_filePtr = v19;
        v28 = self->_logFilePath;
        if (v28)
        {
          CFRelease(v28);
          self->_logFilePath = 0LL;
        }

        self->_logFilePath = (__CFString *)CFStringCreateCopy(v10, a3);
        -[WFLoggerFile stopWatchingLogFile](self, "stopWatchingLogFile");
        -[WFLoggerFile startWatchingLogFile](self, "startWatchingLogFile");
        v29 = (void *)[NSString stringWithFormat:@"%s: fileCreationDate %@", "-[WFLoggerFile createLogFile:fileClassC:]", self->_fileCreationDate];
        if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_35;
        }
        uint64_t v30 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v29, "UTF8String")),  "UTF8String");
        *(_DWORD *)buf = 136446210;
        v43 = v30;
        v31 = (os_log_s *)MEMORY[0x1895F8DA0];
        uint64_t v32 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_34;
      }

      v39 = __error();
      v37 = (void *)objc_msgSend( v24,  "stringWithFormat:",  @"%s: fopen failed %s (%s)",  "-[WFLoggerFile createLogFile:fileClassC:]",  v13,  strerror(*v39));
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
LABEL_46:
        v40 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v37, "UTF8String")),  "UTF8String");
        *(_DWORD *)buf = 136446210;
        v43 = v40;
        v31 = (os_log_s *)MEMORY[0x1895F8DA0];
        uint64_t v32 = OS_LOG_TYPE_ERROR;
LABEL_34:
        _os_log_impl(&dword_187EBF000, v31, v32, "%{public}s", buf, 0xCu);
      }
    }

        v14 = a3 - 1;
        v13 = 4LL;
LABEL_29:
        +[WiFiUsagePrivacyFilter getLabelForPhyModes:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "getLabelForPhyModes:", v5);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog( @"%s: Invalid Parameters nSS:%lu(idx:%ld) bw:%lu(idx:%lu) phy:%@(%X)(idx:%lu)",  "+[WiFiUsageLQMTransformations getMaxPhyrateWithNss:Bw:Phy:]",  a3,  v14,  a4,  v13,  v15,  v5,  v12);

        return 0x7FFFFFFFFFFFFFFFLL;
      }

      v13 = 0LL;
    }

LABEL_35:
    if (v13) {
      free(v13);
    }
    goto LABEL_37;
  }

  v21 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Failed to create directory %s, errno = %d",  "-[WFLoggerFile createLogFile:fileClassC:]",  v44,  *__error());
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    v22 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v21, "UTF8String")),  "UTF8String");
    *(_DWORD *)buf = 136446210;
    v43 = v22;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

LABEL_4:
      v13 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v12, "UTF8String")),  "UTF8String");
      *(_DWORD *)buf = 136446210;
      v36 = v13;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
      goto LABEL_5;
    }

    uint64_t v15 = self->_maxFileSizeInBytes;
    if (!v15)
    {
      uint64_t v12 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: #error Max size is 0",  "-[WFLoggerFile rotateLogFile:]");
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }

    if (v34.st_size < v15)
    {
      uint64_t v12 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: #error Nothing to do. CurrentSize:%lld MaxSize:%lu",  "-[WFLoggerFile rotateLogFile:]",  v34.st_size,  v15);
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }

    v16 = llround((double)maxFileSizeInBytes * 0.5);
    v17 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Rotating log file %s from %lld to %ld bytes",  "-[WFLoggerFile rotateLogFile:]",  v9,  v34.st_size,  v16);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v17, "UTF8String")),  "UTF8String");
      *(_DWORD *)buf = 136446210;
      v36 = v18;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    self->_isFileLoggingEnabled = 0;
    v19 = fopen(v9, "r");
    if (!v19)
    {
      v26 = (void *)NSString;
      v27 = __error();
      uint64_t v12 = (void *)objc_msgSend( v26,  "stringWithFormat:",  @"%s: #error opening log file %s (%s) for reading",  "-[WFLoggerFile rotateLogFile:]",  v9,  strerror(*v27));
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }

    v20 = v19;
    if (fseek(v19, -v16, 2))
    {
      v21 = (void *)NSString;
      v22 = __error();
      v23 = strerror(*v22);
      v24 = (void *)objc_msgSend( v21,  "stringWithFormat:",  @"%s: #error fseeking log file %s (%s), file size %lld, SEEK_END offset %ld",  "-[WFLoggerFile rotateLogFile:]",  v9,  v23,  v34.st_size,  v16);
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
LABEL_21:
        fclose(v20);
        goto LABEL_5;
      }
    }

    else
    {
      v28 = fopen(v9, "r+");
      if (v28)
      {
        v29 = v28;
        uint64_t v30 = fread(buf, 1uLL, 0x400uLL, v20);
        if (v30)
        {
          v31 = v30;
          do
          {
            fwrite(buf, 1uLL, v31, v29);
            v31 = fread(buf, 1uLL, 0x400uLL, v20);
          }

          while (v31);
        }

        fclose(v20);
        fflush(v29);
        fclose(v29);
        truncate(v9, v16);
        goto LABEL_5;
      }

      uint64_t v32 = (void *)NSString;
      v33 = __error();
      v24 = (void *)objc_msgSend( v32,  "stringWithFormat:",  @"%s: #error opening log file %s (%s) for writing",  "-[WFLoggerFile rotateLogFile:]",  v9,  strerror(*v33));
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
    }

    v25 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v24, "UTF8String")),  "UTF8String");
    *(_DWORD *)buf = 136446210;
    v36 = v25;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    goto LABEL_21;
  }

  v14 = (void *)objc_msgSend( NSString,  "stringWithFormat:",  @"%s: alloc failed",  "-[WFLoggerFile rotateLogFile:]");
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v36 = objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[WiFiPolicy] %s",  objc_msgSend(v14, "UTF8String")),  "UTF8String");
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

LABEL_47:
      uint64_t v32 = 0LL;
      goto LABEL_48;
    }

    v22 = v17;
    v23 = v19;
    v24 = [v13 objectForKey:@"conditions"];
    if (!v24) {
      goto LABEL_11;
    }
    v25 = (void *)v24;
    [v13 objectForKey:@"conditions"];
    v52 = v15;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v15 = v52;
    if ((isKindOfClass & 1) == 0)
    {
LABEL_11:
      NSLog( @"%s -  Failed to parse (compound condition does not contain key 'conditions'): %@",  "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]",  v13);
      uint64_t v32 = 0LL;
      uint64_t v30 = v14;
LABEL_48:

      goto LABEL_49;
    }

    [v13 objectForKey:@"conditions"];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v18 containsObject:v21])
    {
      if ([v28 count] == 1)
      {
        [v28 objectAtIndexedSubscript:0];
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v30 = v14;
        [a1 parseCriteria:v29 intoRequiredFields:v14 andFeatures:v52 forFields:v57 withType:v16 isFilter:v54];
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v15 = v52;
        if (v31)
        {
          v51 = v28;
          [NSString stringWithFormat:@"%@(%@)", v21, v31];
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_28;
        }
      }

      else
      {
        NSLog( @"%s -  Failed to parse (Unary criteria %@ contains %lu conditions): %@",  "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]",  v21,  [v28 count],  v13);
        uint64_t v30 = v14;
      }

  -[WiFiUsageSession setLastPowerBudget:](self, "setLastPowerBudget:", a3);
  -[WiFiUsageSession setLastThermalIndex:](self, "setLastThermalIndex:", a4);
  -[WiFiUsageSession setLastPowerBudgetChangedTime:](self, "setLastPowerBudgetChangedTime:", v14);
}

double gloria::TileCoordinate::XToLng(gloria::TileCoordinate *this)
{
  double v1 = (double)*(unint64_t *)this;
  return v1 / ldexp(1.0, *((unsigned __int8 *)this + 16)) * 360.0 + -180.0;
}

double gloria::TileCoordinate::YToLat(gloria::TileCoordinate *this)
{
  double v1 = (double)*((unint64_t *)this + 1) * -6.28318531;
  double v2 = v1 / ldexp(1.0, *((unsigned __int8 *)this + 16)) + 3.14159265;
  double v3 = exp(v2);
  double v4 = exp(-v2);
  return atan((v3 - v4) * 0.5) * 57.2957795;
}

double gloria::TileId::ToBBOX(gloria::TileId *this)
{
  int v1 = v7;
  int64x2_t v4 = vaddq_s64(v6, vdupq_n_s64(1uLL));
  unsigned __int8 v5 = v7;
  double v2 = gloria::TileCoordinate::YToLat((gloria::TileCoordinate *)&v6);
  gloria::TileCoordinate::YToLat((gloria::TileCoordinate *)&v4);
  ldexp(1.0, v1);
  ldexp(1.0, v1);
  return v2;
}

int8x16_t gloria::TileId::ToXYZ@<Q0>(gloria::TileId *this@<X0>, int8x16_t *a2@<X8>)
{
  v2.i64[0] = *(void *)this & 0x1111111111111111LL | ((*(void *)this & 0x5555555555555555uLL) >> 1) & 0x3333333333333333LL;
  v2.i64[1] = (*(void *)this >> 1) & 0x4444444444444444LL | *(void *)this & 0x2222222222222222LL;
  int8x16_t v3 = (int8x16_t)vshlq_u64(v2, (uint64x2_t)xmmword_187F83860);
  v2.i64[1] = (unint64_t)v2.i64[1] >> 1;
  __int8 v4 = *((_BYTE *)this + 8);
  int8x16_t v5 = vorrq_s8(v3, (int8x16_t)v2);
  v3.i64[0] = 0xF0F0F0F0F0F0F0FLL;
  v3.i64[1] = 0xF0F0F0F0F0F0F0FLL;
  int8x16_t v6 = vandq_s8(v5, v3);
  v3.i64[0] = 0xFF00FF00FF00FFLL;
  v3.i64[1] = 0xFF00FF00FF00FFLL;
  int8x16_t v7 = vandq_s8(vorrq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v6, 4uLL), v6), v3);
  int8x16_t v8 = vorrq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v7, 8uLL), v7);
  v9.i64[0] = 4294901760LL;
  v9.i64[1] = 4294901760LL;
  int8x16_t v10 = vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v8, 0x10uLL), v9);
  v9.i64[0] = 0xFFFFLL;
  v9.i64[1] = 0xFFFFLL;
  int8x16_t result = vorrq_s8(v10, vandq_s8(v8, v9));
  *a2 = result;
  a2[1].i8[0] = v4;
  return result;
}

int8x16_t gloria::TileCoordinate::FromLatLng@<Q0>( gloria::TileCoordinate *this@<X0>, double *a2@<X1>, const double *a3@<X2>, int8x16_t *a4@<X8>)
{
  double v7 = fmax(*a2, -180.0);
  double v8 = fmax(*(double *)this, -85.0511288);
  if (v7 >= 180.0) {
    double v9 = 1.0;
  }
  else {
    double v9 = (v7 + 180.0) / 360.0;
  }
  float64_t v18 = v9;
  double v10 = v8 * 3.14159265 / 180.0;
  if (v8 >= 85.0511288) {
    double v10 = 1.48442223;
  }
  double v11 = sin(v10);
  double v12 = log((v11 + 1.0) / (1.0 - v11));
  __int8 v13 = *(_BYTE *)a3;
  v14.f64[0] = v18;
  v14.f64[1] = v12 / -12.5663706 + 0.5;
  int8x16_t v15 = (int8x16_t)vcvtq_u64_f64(vrndmq_f64(vmulq_n_f64(v14, (double)(unint64_t)(1LL << *(_BYTE *)a3))));
  int8x16_t v16 = (int8x16_t)vdupq_n_s64((1LL << *(_BYTE *)a3) - 1);
  int8x16_t result = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v15, (uint64x2_t)v16), v16, v15);
  *a4 = result;
  a4[1].i8[0] = v13;
  return result;
}

void *gloria::operator<<(void *a1)
{
  uint64x2_t v2 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)" tile_y: ", 9LL);
  int8x16_t v3 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)" tile_zoom: ", 12LL);
  std::ostream::operator<<();
  return a1;
}

{
  void *v2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"tile_id: ", 9LL);
  uint64x2_t v2 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)" zoom: ", 7LL);
  std::ostream::operator<<();
  return a1;
}

double gloria::MortonUtils::XYToQuadId(gloria::MortonUtils *this, uint64_t a2)
{
  v2.i64[0] = a2;
  v2.i64[1] = (uint64_t)this;
  v3.i64[0] = 0xFFFFFFFFLL;
  v3.i64[1] = 0xFFFFFFFFLL;
  int8x16_t v4 = vorrq_s8((int8x16_t)vshlq_n_s64(v2, 0x10uLL), vandq_s8((int8x16_t)v2, v3));
  v3.i64[0] = 0xFFFF0000FFFFLL;
  v3.i64[1] = 0xFFFF0000FFFFLL;
  int64x2_t v5 = (int64x2_t)vandq_s8(v4, v3);
  unsigned __int128 v6 = *(_OWORD *)&vorrq_s8((int8x16_t)vshlq_n_s64(v5, 8uLL), (int8x16_t)v5) & __PAIR128__( 0xFFFF00FFFFFF00FFLL,  0xFFFF00FFFFFF00FFLL);
  unsigned __int128 v7 = *(_OWORD *)&vorrq_s8((int8x16_t)vshlq_n_s64((int64x2_t)v6, 4uLL), (int8x16_t)v6) & __PAIR128__( 0xFF0FFF0FFF0FFF0FLL,  0xFF0FFF0FFF0FFF0FLL);
  v3.i64[0] = 0x3333333333333333LL;
  v3.i64[1] = 0x3333333333333333LL;
  int8x16_t v8 = vandq_s8(vorrq_s8((int8x16_t)vshlq_n_s64((int64x2_t)v7, 2uLL), (int8x16_t)v7), v3);
  int8x16_t v9 = (int8x16_t)vshlq_u64((uint64x2_t)v8, (uint64x2_t)xmmword_187F83870);
  v8.i64[0] *= 2LL;
  int64x2_t v10 = (int64x2_t)vandq_s8(vorrq_s8(v9, v8), (int8x16_t)xmmword_187F83880);
  *(void *)&double result = vorrq_s8((int8x16_t)v10, (int8x16_t)vdupq_laneq_s64(v10, 1)).u64[0];
  return result;
}

unint64_t gloria::MortonUtils::LeadingZeros(gloria::MortonUtils *this)
{
  return __clz((unint64_t)this);
}

void gloria::TileId::FromLatLng( gloria::TileId *this@<X0>, double *a2@<X1>, const double *a3@<X2>, uint64_t a4@<X8>)
{
  char v6 = v9;
  *(void *)a4 = v7;
  *(_BYTE *)(a4 + _Block_object_dispose(va, 8) = v6;
}

void gloria::TileId::FromXYZ(gloria::TileId *this@<X0>, uint64_t a2@<X8>)
{
  char v5 = *((_BYTE *)this + 16);
  *(void *)a2 = v6;
  *(_BYTE *)(a2 + _Block_object_dispose(va, 8) = v5;
}

uint64_t gloria::TileId::TileId(uint64_t this, unint64_t a2)
{
  int v2 = __clz(a2);
  LOBYTE(v2) = (int)((63 - v2 + (((63 - v2) & 0x80u) >> 7)) << 24) >> 25;
  *(_BYTE *)(this + _Block_object_dispose(va, 8) = v2;
  *(void *)this = a2 - gloria::LEADING_BITS_VALUE_LUT[v2];
  return this;
}

{
  int v2;
  int v2 = __clz(a2);
  LOBYTE(v2) = (int)((63 - v2 + (((63 - v2) & 0x80u) >> 7)) << 24) >> 25;
  *(_BYTE *)(this + _Block_object_dispose(va, 8) = v2;
  *(void *)this = a2 - gloria::LEADING_BITS_VALUE_LUT[v2];
  return this;
}

uint64_t gloria::TileId::Zoom(gloria::TileId *this)
{
  char v1 = 63 - __clz((unint64_t)this);
  return ((char)(v1 + ((v1 & 0x80) >> 7)) >> 1);
}

uint64_t gloria::TileId::GetEncodedTileId(gloria::TileId *this)
{
  return *(void *)this | gloria::LEADING_BITS_VALUE_LUT[*((unsigned __int8 *)this + 8)];
}

BOOL gloria::TileId::operator==(uint64_t a1, uint64_t a2)
{
  return *(void *)a1 == *(void *)a2 && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8);
}

BOOL gloria::TileId::operator!=(uint64_t a1, uint64_t a2)
{
  return *(void *)a2 != *(void *)a1 || *(unsigned __int8 *)(a2 + 8) != *(unsigned __int8 *)(a1 + 8);
}

void gloria::TileId::Children(gloria::TileId *this@<X0>, void *a2@<X8>)
{
}

void gloria::TileId::Children(gloria::TileId *this@<X0>, char a2@<W1>, void *a3@<X8>)
{
  char v5 = *((_BYTE *)this + 8);
  char v6 = 2 * a2;
  uint64_t v7 = *(void *)this;
  a3[1] = 0LL;
  a3[2] = 0LL;
  unint64_t v8 = (1 << (2 * a2));
  *a3 = 0LL;
  std::vector<gloria::TileId>::resize(a3, v8);
  uint64_t v9 = 0LL;
  uint64_t v10 = v7 << v6;
  do
  {
    uint64_t v11 = *a3 + v9;
    *(void *)uint64_t v11 = v10;
    *(_BYTE *)(v11 + _Block_object_dispose(va, 8) = v5 + a2;
    ++v10;
    v9 += 16LL;
    --v8;
  }

  while (v8);
}

void sub_187F15324(_Unwind_Exception *exception_object)
{
  int8x16_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(va, 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void std::vector<gloria::TileId>::resize(void *a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(a1[1] - *a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      a1[1] = *a1 + 16 * a2;
    }
  }

  else
  {
    std::vector<gloria::TileId>::__append((uint64_t)a1, a2 - v2);
  }

uint64_t gloria::TileId::Ancestor@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(_BYTE *)(this + 8) - 1;
  if (*(_BYTE *)(this + 8) == 1) {
    uint64_t v3 = 0LL;
  }
  else {
    uint64_t v3 = *(void *)this >> 2;
  }
  *(void *)a2 = v3;
  *(_BYTE *)(a2 + _Block_object_dispose(va, 8) = v2;
  return this;
}

uint64_t gloria::TileId::Ancestor@<X0>(uint64_t this@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  int v3 = *(unsigned __int8 *)(this + 8) - a2;
  if (v3) {
    uint64_t v4 = *(void *)this >> (2 * a2);
  }
  else {
    uint64_t v4 = 0LL;
  }
  *(void *)a3 = v4;
  *(_BYTE *)(a3 + _Block_object_dispose(va, 8) = v3;
  return this;
}

void gloria::TileId::Neighbors(gloria::TileId *this@<X0>, uint64_t a2@<X8>)
{
}

void gloria::TileId::Neighbors(gloria::TileId *this@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 16) = 0LL;
  *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
  *(void *)a3 = a3 + 8;
  double v6 = ldexp(1.0, *((unsigned __int8 *)this + 8));
  uint64_t v7 = v21.i64[0] - a2;
  uint64_t v8 = v21.i64[0] + a2;
  if (v7 <= v8)
  {
    uint64_t v9 = (uint64_t)v6;
    uint64_t v10 = a2;
    uint64_t v11 = (v21.i64[1] - a2) & ~((v21.i64[1] - a2) >> 63);
    uint64_t v12 = v21.i64[1] + v10;
    else {
      uint64_t v13 = (uint64_t)v6 - 1;
    }
    do
    {
      uint64_t v14 = v11;
      if (v11 <= v13)
      {
        do
        {
          int8x16_t v15 = (gloria::MortonUtils *)v7;
          if (v7 < 0) {
            int8x16_t v15 = (gloria::MortonUtils *)(v7 % v9 + v9);
          }
          char v16 = *((_BYTE *)this + 8);
          gloria::MortonUtils::XYToQuadId(v15, v14 % v9);
          unint64_t v19 = v17;
          char v20 = v16;
          std::__tree<gloria::TileId>::__emplace_unique_key_args<gloria::TileId,gloria::TileId const&>( (uint64_t **)a3,  &v19,  (uint64_t)&v19);
          ++v14;
        }

        while (v13 + 1 != v14);
      }
    }

    while (v7++ != v8);
  }

void sub_187F154DC(_Unwind_Exception *a1)
{
}

void gloria::TileId::NeighborsWithinRadius(gloria::TileId *this@<X0>, double a2@<D0>, uint64_t a3@<X8>)
{
  unsigned int v3 = a2;
  double v4 = 40075016.7 / (double)(unint64_t)(256LL << *((_BYTE *)this + 8)) * 256.0;
  else {
    unsigned int v5 = vcvtpd_u64_f64((double)v3 / v4);
  }
  gloria::TileId::Neighbors(this, v5, a3);
}

unsigned int gloria::TileId::Reach(gloria::TileId *this, unsigned int a2)
{
  double v2 = 40075016.7 / (double)(unint64_t)(256LL << *((_BYTE *)this + 8)) * 256.0;
  else {
    return vcvtpd_u64_f64((double)a2 / v2);
  }
}

double gloria::TileId::TileSize(gloria::TileId *this)
{
  return 40075016.7 / (double)(unint64_t)(256LL << *((_BYTE *)this + 8)) * 256.0;
}

uint64_t gloria::TileId::MapSize(gloria::TileId *this)
{
  return 256LL << *((_BYTE *)this + 8);
}

double gloria::TileId::Resolution(gloria::TileId *this)
{
  return 40075016.7 / (double)(unint64_t)(256LL << *((_BYTE *)this + 8));
}

uint64_t gloria::TileBoundingBox::ToWKT@<X0>(std::stringbuf::string_type *a1@<X8>)
{
  *(std::locale::__imp **)((char *)&v14.__loc_.__locale_ + *(void *)(v13 - 24)) = (std::locale::__imp *)8;
  unsigned int v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v13, (uint64_t)"POLYGON( ", 9LL);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)"(", 1LL);
  double v4 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)" ", 1LL);
  unsigned int v5 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)", ", 2LL);
  double v6 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)" ", 1LL);
  uint64_t v7 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)", ", 2LL);
  uint64_t v8 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)" ", 1LL);
  uint64_t v9 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)", ", 2LL);
  uint64_t v10 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)" ", 1LL);
  uint64_t v11 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"))", 2LL);
  std::stringbuf::str(a1, &v14);
  uint64_t v13 = *MEMORY[0x189614738];
  *(uint64_t *)((char *)&v13 + *(void *)(v13 - 24)) = *(void *)(MEMORY[0x189614738] + 24LL);
  v14.__vftable = (std::stringbuf_vtbl *)(MEMORY[0x189614750] + 16LL);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1895BA184](&v15);
}

void sub_187F15798(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x189614768];
  uint64_t v3 = MEMORY[0x189614768] + 64LL;
  *(void *)(a1 + 112) = MEMORY[0x189614768] + 64LL;
  uint64_t v4 = *(void *)(MEMORY[0x189614738] + 8LL);
  uint64_t v5 = *(void *)(MEMORY[0x189614738] + 16LL);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v5;
  double v6 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24LL));
  std::ios_base::init(v6, (void *)(a1 + 8));
  v6[1].__vftable = 0LL;
  v6[1].__fmtflags_ = -1;
  *(void *)a1 = v2 + 24;
  *(void *)(a1 + 112) = v3;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + _Block_object_dispose(va, 8) = MEMORY[0x189614750] + 16LL;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 8_Block_object_dispose(va, 8) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_187F15870(_Unwind_Exception *a1)
{
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)a1 = *MEMORY[0x189614738];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + _Block_object_dispose(va, 8) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BA184](a1 + 112);
  return a1;
}

BOOL gloria::TileId::operator<(void *a1, void *a2)
{
  return *a1 < *a2;
}

void __clang_call_terminate(void *a1)
{
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( void *a1, uint64_t a2, uint64_t a3)
{
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)));
      uint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x189614558]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32LL);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }

    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | 5);
    }
  }

  MEMORY[0x1895BA100](v13);
  return a1;
}

void sub_187F15A48( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
}

void sub_187F15A90(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0LL;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96LL))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0LL;
      }
    }

    uint64_t v15 = a4 - a3;
    else {
      return 0LL;
    }
  }

  return v6;
}

void sub_187F15BC4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000LL;
    *__b = v6;
  }

  else
  {
    *((_BYTE *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }

  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_18A16BD68, MEMORY[0x1896141F8]);
}

void sub_187F15CD8(_Unwind_Exception *a1)
{
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x189614778] + 16LL);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x189614700], MEMORY[0x189614270]);
}

void std::vector<gloria::TileId>::__append(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = a1 + 16;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(_BYTE **)(a1 + 8);
  if (a2 <= (v5 - (uint64_t)v6) >> 4)
  {
    *(void *)(a1 + _Block_object_dispose(va, 8) = &v6[16 * a2];
  }

  else
  {
    size_t v7 = *(_BYTE **)a1;
    uint64_t v8 = (uint64_t)&v6[-*(void *)a1];
    unint64_t v9 = a2 + (v8 >> 4);
    if (v9 >> 60) {
      std::vector<gloria::TileId>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 4;
    uint64_t v11 = v5 - (void)v7;
    if (v11 >> 3 > v9) {
      unint64_t v9 = v11 >> 3;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12)
    {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<gloria::TileId>>(v4, v12);
      size_t v7 = *(_BYTE **)a1;
      uint64_t v6 = *(_BYTE **)(a1 + 8);
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    uint64_t v14 = &v13[16 * v10];
    uint64_t v15 = &v13[16 * v12];
    char v16 = &v14[16 * a2];
    while (v6 != v7)
    {
      uint64_t v17 = *((void *)v6 - 2);
      v6 -= 16;
      *((void *)v14 - 2) = v17;
      v14 -= 16;
      v14[8] = v6[8];
    }

    *(void *)a1 = v14;
    *(void *)(a1 + _Block_object_dispose(va, 8) = v16;
    *(void *)(a1 + 16) = v15;
    if (v7) {
      operator delete(v7);
    }
  }

void std::vector<gloria::TileId>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<gloria::TileId>>( uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void std::__tree<gloria::TileId>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<gloria::TileId>::destroy(a1, *a2);
    std::__tree<gloria::TileId>::destroy(a1, a2[1]);
    operator delete(a2);
  }

uint64_t **std::__tree<gloria::TileId>::__emplace_unique_key_args<gloria::TileId,gloria::TileId const&>( uint64_t **a1, unint64_t *a2, uint64_t a3)
{
  uint64_t v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        uint64_t v5 = *v8;
        uint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (v9 >= v7) {
        break;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        uint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = operator new(0x30uLL);
    v10[4] = *(void *)a3;
    *((_BYTE *)v10 + 40) = *(_BYTE *)(a3 + 8);
    std::__tree<gloria::TileId>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }

  return v8;
}

uint64_t *std::__tree<gloria::TileId>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }

  double result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>( uint64_t *result, uint64_t *a2)
{
  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unint64_t v9 = (uint64_t **)a2[2];
          }

          else
          {
            unint64_t v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }

            v9[2] = v3;
            *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = v9;
            *unint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }

          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }

      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }

          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }

        else
        {
          a2 = (uint64_t *)a2[2];
        }

        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }

      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      _BYTE *v5 = 1;
    }

    while (v3 != result);
  }

  return result;
}

void sub_187F16A5C(_Unwind_Exception *a1)
{
}

void sub_187F1D2A8(_Unwind_Exception *a1)
{
}

void sub_187F1DCC4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id location)
{
}

void sub_187F1DFF8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

LABEL_16:
  [MEMORY[0x189607968] numberWithUnsignedLong:a3];
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:v19];
  char v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendFormat:@"%@&", v20];

  if ((a3 & 0x40) != 0) {
    goto LABEL_17;
  }
LABEL_8:
  if ((a3 & 0x80) != 0)
  {
LABEL_9:
    [MEMORY[0x189607968] numberWithUnsignedLong:a3];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v6];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 appendFormat:@"%@&", v7];
  }
    }

    return v9;
  }

  else
  {
    uint64_t v17 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v17) {
      -[WiFiTelephonyClient _getCurrentDataServiceContext].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    return 0LL;
  }

          ++v20;
        }

        while (v18 != v20);
        char v16 = obj;
        v37 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
        char v18 = v37;
        if (!v37)
        {
          uint64_t v13 = v42;
          uint64_t v10 = v43;
          goto LABEL_28;
        }
      }
    }

    objc_msgSend( NSString,  "stringWithFormat:",  @"%s  results alloc failed",  "-[WFBlacklistEngine retrieveBlacklistedStateHistoryForNetwork:state:timestamps:reasonData:]");
    char v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
  }

  else
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s  Not in blacklisted state",  "-[WFBlacklistEngine retrieveBlacklistedStateHistoryForNetwork:state:timestamps:reasonData:]");
    char v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
  }

  v39 = (void *)NSString;
  char v16 = v16;
  v40 = objc_msgSend(v39, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v16, "UTF8String"));
  *(_DWORD *)buf = 136446210;
  v51 = [v40 UTF8String];
  _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

LABEL_35:
  uint64_t v15 = 0LL;
LABEL_28:

LABEL_30:
  return v15;
}

  [v5 addObject:@"11AX"];
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

LABEL_8:
  uint64_t v17 = v16;
  char v18 = v17;
  if ([v9 count] > v11)
  {
    [v9 objectAtIndexedSubscript:v11];
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 doubleValue];
    int8x16_t v21 = v20;

    char v18 = v17;
    if (v21 >= a3)
    {
      [v9 objectAtIndexedSubscript:v11];
      char v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }

  if ([v9 count] == v11)
  {
    -[__CFString doubleValue](v18, "doubleValue");
    if (v22 < a3)
    {

      char v18 = 0LL;
    }
  }

  if (a6 == 2)
  {
    v25 = v18;
  }

  else
  {
    if (a6)
    {
      v26 = 0LL;
      goto LABEL_25;
    }

    if (v17) {
      uint64_t v23 = v17;
    }
    else {
      uint64_t v23 = v10;
    }
    v24 = @"+inf";
    if (v18) {
      v24 = v18;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(%@:%@]"), v23, v24;
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  v26 = v25;
LABEL_25:

  return v26;
}
}
}
}

  uint64_t v17 = v16;
  char v18 = v17;
  if ([v10 count] > v12)
  {
    [v10 objectAtIndexedSubscript:v12];
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    char v20 = [v19 integerValue];

    char v18 = v17;
    if (v20 >= a3)
    {
      [v10 objectAtIndexedSubscript:v12];
      char v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }

  if ([v10 count] == v12 && -[__CFString integerValue](v18, "integerValue") < a3)
  {

    char v18 = 0LL;
  }

  if (a6 == 2)
  {
    uint64_t v23 = v18;
LABEL_24:
    v24 = v23;
    goto LABEL_33;
  }

  if (a6 != 1)
  {
    if (a6)
    {
      v24 = 0LL;
      goto LABEL_33;
    }

    if (v17) {
      int8x16_t v21 = v17;
    }
    else {
      int8x16_t v21 = v11;
    }
    v22 = @"+inf";
    if (v18) {
      v22 = v18;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(%@:%@]"), v21, v22;
    uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }

  v25 = (void *)NSString;
  if (v17) {
    v26 = v17;
  }
  else {
    v26 = v11;
  }
  [a1 getHumanSecondsFromObject:v26];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18) {
    v28 = v18;
  }
  else {
    v28 = @"+inf";
  }
  [a1 getHumanSecondsFromObject:v28];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", @"(%@:%@]"), v27, v29;
  v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
  return v24;
}

LABEL_38:
  if (!-[WiFiUsageSession isSessionActive](self, "isSessionActive") || self->_sessionStartedBy == 4)
  {
    if (-[WiFiUsagePoorLinkSession isBadRssi:](self, "isBadRssi:", [v4 rssi]))
    {
      char v20 = [v4 rssi];
      int8x16_t v21 = v20;
      if (self->_badLinkRssi == 0x7FFFFFFFFFFFFFFFLL)
      {
        NSLog( @"%s: rssi (%lddBm) crossing BadLink Threshold (%@dBm)",  "-[WiFiUsagePoorLinkSession linkQualityDidChange:]",  v20,  @"N/A");
      }

      else
      {
        objc_msgSend(MEMORY[0x189607968], "numberWithInteger:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog( @"%s: rssi (%lddBm) crossing BadLink Threshold (%@dBm)",  "-[WiFiUsagePoorLinkSession linkQualityDidChange:]",  v21,  v22);
      }

      if (-[WiFiUsageSession isSessionActive](self, "isSessionActive")) {
        self->_sessionStartedBy = 1;
      }
      else {
        -[WiFiUsagePoorLinkSession sessionDidStart:](self, "sessionDidStart:", 1LL);
      }
    }

    if ([v4 driverTDrecommended] != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v4, "driverTDrecommended"))
    {
      NSLog( @"%s: BadLink session started due to driver TD Recommendation (%@)",  "-[WiFiUsagePoorLinkSession linkQualityDidChange:]",  v4);
      -[WiFiUsagePoorLinkSession sessionDidStart:](self, "sessionDidStart:", 2LL);
    }

    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___WiFiUsagePoorLinkSession;
    -[WiFiUsageSession linkQualityDidChange:](&v23, sel_linkQualityDidChange_, v4);
  }

  if (self->_justJoined)
  {
    -[WiFiUsagePoorLinkSession setRssiAtJoin:](self, "setRssiAtJoin:", [v4 rssi]);
    if ([v4 driverTDrecommended] != 0x7FFFFFFFFFFFFFFFLL) {
      -[WiFiUsagePoorLinkSession setTdRecommendAtJoin:]( self,  "setTdRecommendAtJoin:",  [v4 driverTDrecommended] != 0);
    }
    self->_justJoined = 0;
  }

  if ([v4 driverTDrecommended] != 0x7FFFFFFFFFFFFFFFLL) {
    self->_lastTdRecommended = [v4 driverTDrecommended] != 0;
  }
}

        if ([v26 blacklistedState] == a3
          && [v26 blacklistedState] == 2
          && [v26 blacklistedReason] == 8)
        {
          -[WFBlacklistEngine bssBlacklistExpiry](self, "bssBlacklistExpiry");
          v48 = v47;
          v49 = *(void **)(v20 + 2600);
          [v26 blacklistedStateTimestamp];
          objc_msgSend( v49,  "stringWithFormat:",  @"%s timeDiff :%f expiry :%f ",  "-[WFBlacklistEngine removeExpiredBlacklistedState:]",  v29 - v50,  *(void *)&v48);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
          {
            v52 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v51, "UTF8String"));
            v53 = [v52 UTF8String];
            *(_DWORD *)buf = 136446210;
            v101 = v53;
            _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
          }

          [v26 blacklistedStateTimestamp];
          char v20 = 0x189607000uLL;
          if (v29 - v54 > v48)
          {
            [v26 blacklistedStateString];
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            [v26 blacklistedStateTimestamp];
            v56 = (void *)NSString;
            objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSince1970:");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            [v56 stringWithFormat:@"%s Unblacklisting '%@' expired blacklisted state %@ (%@) for:%@", "-[WFBlacklistEngine removeExpiredBlacklistedState:]", v86, v55, v57, v86];
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            v59 = (os_log_s *)MEMORY[0x1895F8DA0];
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
            {
              v60 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v58, "UTF8String"));
              v61 = [v60 UTF8String];
              *(_DWORD *)buf = 136446210;
              v101 = v61;
              _os_log_impl(&dword_187EBF000, v59, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
            }

            [v85 addObject:v26];
            self = v87;
            char v20 = 0x189607000uLL;
          }
        }

        if ([v26 blacklistedState] != a3 || objc_msgSend(v26, "blacklistedState") != 4) {
          goto LABEL_53;
        }
        [v26 blacklistedStateString];
        v31 = (id)objc_claimAutoreleasedReturnValue();
        [v26 blacklistedStateTimestamp];
        v62 = *(void **)(v20 + 2600);
        objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSince1970:");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        [v62 stringWithFormat:@"%s Unblacklisting '%@' expired blacklisted state %@ (%@) for:%@", "-[WFBlacklistEngine removeExpiredBlacklistedState:]", v86, v31, v63, v86];
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        v65 = (os_log_s *)MEMORY[0x1895F8DA0];
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
        {
          v66 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v64, "UTF8String"));
          v67 = [v66 UTF8String];
          *(_DWORD *)buf = 136446210;
          v101 = v67;
          _os_log_impl(&dword_187EBF000, v65, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
        }

        [v85 addObject:v26];
        self = v87;
        char v20 = 0x189607000LL;
        goto LABEL_52;
      }

      objc_msgSend( NSString,  "stringWithFormat:",  @"%s SSID is null",  "-[WFBlacklistEngine removeExpiredBlacklistedState:]");
      v74 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        v75 = (void *)NSString;
        v74 = v74;
        v76 = objc_msgSend(v75, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v74, "UTF8String"));
        v77 = [v76 UTF8String];
        *(_DWORD *)buf = 136446210;
        v101 = v77;
        _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
      }

LABEL_32:
  self->_linkIsUp = v10;
}

      if (v23 != a4)
      {
        v53 = (void *)NSString;
        v54 = +[WFBlacklistEngine stringRepresentationWithReason:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithReason:",  v23);
        v55 = +[WFBlacklistEngine stringRepresentationWithReason:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithReason:",  a4);
        [v53 stringWithFormat:@"%s Reasons differ. TriggerNodeReason: %@ CurrentReason: %@", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v54, v55];
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v17 = (os_log_s *)MEMORY[0x1895F8DA0];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v56 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v52, "UTF8String"));
          v57 = [v56 UTF8String];
          *(_DWORD *)buf = 136446210;
          v110 = (const char *)v57;
          v58 = v17;
          v59 = OS_LOG_TYPE_DEBUG;
          goto LABEL_44;
        }

void sub_187F26780( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_187F26B10( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187F26CC4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187F26F68( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_187F2730C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_187F2776C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187F27BB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void OUTLINED_FUNCTION_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_6( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_8(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

  ;
}

  ;
}

LABEL_62:
            [v43 setMatched:v46];
            [v43 setValid:v47];
            [v43 firstTriggered];
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v55;
            if ((_DWORD)v46)
            {

              if (!v56)
              {
                [v43 currentSample];
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                [v43 setFirstTriggered:v57];
              }

              [v43 setBssid:v23];
              if (v8)
              {
                [v43 firstTriggered];
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                [v43 currentSample];
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = [v22 isEqual:v58];

                if ((v59 & 1) != 0)
                {
                  uint64_t v23 = (NSString *)v80;
                  goto LABEL_86;
                }

                uint64_t v23 = (NSString *)v80;
              }
            }

            else
            {
              if (v55)
              {
                [v43 lastTriggered];
                v60 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v60)
                {
                  if (v30 && (unint64_t)[v30 count] >= 2)
                  {
                    objc_msgSend(v30, "objectAtIndex:", objc_msgSend(v30, "count") - 2);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    [v61 timestamp];
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    [v43 setLastTriggered:v62];
                  }

                  else
                  {
                    [v43 currentSample];
                    v63 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v63) {
                      [v43 currentSample];
                    }
                    else {
                      [v43 firstTriggered];
                    }
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    [v43 setLastTriggered:v61];
                  }
                }
              }

              uint64_t v23 = (NSString *)v80;
              [v43 setBssid:v80];
              if (v8)
              {
                [v43 lastTriggered];
                v64 = (void *)objc_claimAutoreleasedReturnValue();

                if (v64)
                {
                  v22 = v43;
                  j = v73;
                  goto LABEL_88;
                }
              }
            }
          }

          v41 = [v79 countByEnumeratingWithState:&v82 objects:v98 count:16];
          if (v41) {
            continue;
          }
          break;
        }

        v22 = v43;
        v43 = 0LL;
LABEL_86:
        j = v73;
LABEL_87:

        v22 = v43;
LABEL_88:
      }

      v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v90,  v100,  16LL);
      if (!v71) {
        goto LABEL_92;
      }
    }
  }

  uint64_t v23 = (NSString *)v7;
LABEL_92:

  v65 = v23;
  lastSampleBssid = v74->_lastSampleBssid;
  v74->_lastSampleBssid = v65;
  v67 = v65;

  return v22;
}

LABEL_57:
  -[WiFiUsageSession setIsInstantHotspot:](self, "setIsInstantHotspot:", [v8 isInstantHotspot]);
  -[WiFiUsageSession setIsAutoHotspot:](self, "setIsAutoHotspot:", [v8 isAutoHotspot]);
  -[WiFiUsageSession updateAssociatedNetworkDetails:](self, "updateAssociatedNetworkDetails:", v8);
}

void sub_187F31CCC(_Unwind_Exception *a1)
{
}

void __destructor_8_s48_s56(uint64_t a1)
{
}

void sub_187F3214C(_Unwind_Exception *a1)
{
}

void sub_187F3D708(_Unwind_Exception *a1)
{
}

void sub_187F3D850(_Unwind_Exception *a1)
{
}

void sub_187F3DA8C(_Unwind_Exception *a1)
{
}

void sub_187F3DDA4(_Unwind_Exception *a1)
{
}

void sub_187F3E0C4(_Unwind_Exception *a1)
{
}

void sub_187F3E390(_Unwind_Exception *a1)
{
}

void sub_187F3E534(_Unwind_Exception *a1)
{
}

void sub_187F3E6DC(_Unwind_Exception *a1)
{
}

void sub_187F3F060(_Unwind_Exception *a1)
{
}

void sub_187F3F564(_Unwind_Exception *a1)
{
}

__CFString *_labelDescription(unint64_t a1)
{
  if (a1 >= 0xB) {
    _labelDescription_cold_1(a1);
  }
  return off_18A16E718[a1];
}

void sub_187F408F8(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_187F41F0C(_Unwind_Exception *a1)
{
}

void sub_187F4885C(_Unwind_Exception *a1)
{
}

void sub_187F48E0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

LABEL_45:
        goto LABEL_46;
      }

      if (a4 <= 3)
      {
        if (a8 != 1 && a8 != 5)
        {
          if (a8 == 3)
          {
            -[WFBlacklistEngine _setBlacklistedState:state:reason:reasonData:]( self,  "_setBlacklistedState:state:reason:reasonData:",  v12,  3LL,  a4,  a5);
            v44 = (void *)NSString;
            [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:v22];
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            [v44 stringWithFormat:@"%s Power Alert Event Generated, Blacklist for WoW, TimeStamp: %@", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v45];
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v47 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v46, "UTF8String"));
              v48 = [v47 UTF8String];
              *(_DWORD *)buf = 136446210;
              v110 = (const char *)v48;
              _os_log_impl(&dword_187EBF000, v17, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
            }

            v95 = 1;
          }

          v49 = (void *)NSString;
          v50 = +[WFBlacklistEngine stringRepresentationWithReason:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithReason:",  a4);
          [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:v22];
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          [v49 stringWithFormat:@"%s WFNetworkBlacklistStateNoAutoJoin ignored for %@ @ %@", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v50, v51];
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          uint64_t v17 = (os_log_s *)MEMORY[0x1895F8DA0];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
LABEL_86:
            v56 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v52, "UTF8String"));
            v85 = [v56 UTF8String];
            *(_DWORD *)buf = 136446210;
            v110 = (const char *)v85;
            v58 = v17;
            v59 = OS_LOG_TYPE_INFO;
LABEL_44:
            _os_log_impl(&dword_187EBF000, v58, v59, "%{public}s", buf, 0xCu);
          }

          goto LABEL_45;
        }

        v97 = 1;
        -[WFBlacklistEngine _setBlacklistedState:state:reason:reasonData:]( self,  "_setBlacklistedState:state:reason:reasonData:",  v12,  1,  a4,  [v19 triggerReasonData]);
        goto LABEL_46;
      }

      switch(a4)
      {
        case 7uLL:
          if (++HIDWORD(v94) <= 2u) {
            goto LABEL_46;
          }
LABEL_59:
          if ((a8 | 4) == 5)
          {
            -[WFBlacklistEngine _setBlacklistedState:state:reason:reasonData:]( self,  "_setBlacklistedState:state:reason:reasonData:",  v12,  1,  a4,  [v19 triggerReasonData]);
            v97 = 1;
          }

          else
          {
            v64 = (void *)NSString;
            v65 = +[WFBlacklistEngine stringRepresentationWithReason:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithReason:",  a4);
            [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:v22];
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            [v64 stringWithFormat:@"%s WFNetworkBlacklistStateNoAutoJoin ignored for %@ @ %@", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v65, v66];
            v67 = (void *)objc_claimAutoreleasedReturnValue();

            uint64_t v17 = (os_log_s *)MEMORY[0x1895F8DA0];
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
            {
              v68 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v67, "UTF8String"));
              v69 = [v68 UTF8String];
              *(_DWORD *)buf = 136446210;
              v110 = (const char *)v69;
              _os_log_impl(&dword_187EBF000, v17, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
            }

            a8 = v98;
          }

          goto LABEL_67;
        case 5uLL:
          LODWORD(v94) = v94 + 1;
          goto LABEL_59;
        case 4uLL:
          v34 = v22 - v25;
          if (v22 - v25 <= 300.0)
          {
            LODWORD(v92) = v92 + 1;
            if (v92 >= 3)
            {
              if ((a8 | 4) != 5)
              {
                v82 = (void *)NSString;
                v83 = +[WFBlacklistEngine stringRepresentationWithReason:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithReason:",  4LL,  v34);
                [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:v22];
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                [v82 stringWithFormat:@"%s WFNetworkBlacklistStateNoAutoJoin ignored for %@ @ %@", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v83, v84];
                v52 = (void *)objc_claimAutoreleasedReturnValue();

                uint64_t v17 = (os_log_s *)MEMORY[0x1895F8DA0];
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
                  goto LABEL_86;
                }
                goto LABEL_45;
              }

              v60 = objc_msgSend(v19, "triggerReasonData", v34);
              v61 = self;
              v62 = v12;
              v63 = 4LL;
LABEL_71:
              -[WFBlacklistEngine _setBlacklistedState:state:reason:reasonData:]( v61,  "_setBlacklistedState:state:reason:reasonData:",  v62,  1LL,  v63,  v60);
              v97 = 1;
              goto LABEL_46;
            }
          }

          goto LABEL_46;
      }

      if (a4 - 11 <= 1)
      {
        if (v91 != 4)
        {
          v73 = (void *)NSString;
          v74 = +[WFBlacklistEngine stringRepresentationWithReason:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithReason:",  a4);
          [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:v22];
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          [v73 stringWithFormat:@"%s WFNetworkBlacklistStateTemporarilyUnavailable ignored for %@ @ %@", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v74, v75];
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          uint64_t v17 = (os_log_s *)MEMORY[0x1895F8DA0];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
            goto LABEL_86;
          }
          goto LABEL_45;
        }

        -[WFBlacklistEngine _setBlacklistedState:state:reason:reasonData:]( self,  "_setBlacklistedState:state:reason:reasonData:",  v12,  4,  a4,  [v19 triggerReasonData]);
        v97 = 1;
        goto LABEL_46;
      }

LABEL_67:
      if (a4 != 8)
      {
        if (a4 != 6) {
          goto LABEL_46;
        }
        if ((a8 | 4) != 5)
        {
          v76 = (void *)NSString;
          v77 = +[WFBlacklistEngine stringRepresentationWithReason:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithReason:",  6LL);
          [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:v22];
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          [v76 stringWithFormat:@"%s WFNetworkBlacklistStateNoAutoJoin ignored for %@ @ %@", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v77, v78];
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          uint64_t v17 = (os_log_s *)MEMORY[0x1895F8DA0];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
            goto LABEL_86;
          }
          goto LABEL_45;
        }

        v60 = [v19 triggerReasonData];
        v61 = self;
        v62 = v12;
        v63 = 6LL;
        goto LABEL_71;
      }

      [v19 bssid];
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = [v70 compare:v13 options:1];

      if (v71) {
        v72 = HIDWORD(v92);
      }
      else {
        v72 = HIDWORD(v92) + 1;
      }
      HIDWORD(v92) = v72;
      if (v72 >= 3)
      {
        if (a8 != 2)
        {
          v79 = (void *)NSString;
          v80 = +[WFBlacklistEngine stringRepresentationWithReason:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithReason:",  8LL);
          [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:v22];
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          [v79 stringWithFormat:@"%s WFNetworkBlacklistReasonBssBlacklist ignored for %@ @ %@", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v80, v81];
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          uint64_t v17 = (os_log_s *)MEMORY[0x1895F8DA0];
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO)) {
            goto LABEL_86;
          }
          goto LABEL_45;
        }

        -[WFBlacklistEngine _setBlacklistedState:state:reason:reasonData:]( self,  "_setBlacklistedState:state:reason:reasonData:",  v12,  2,  8,  [v19 triggerReasonData]);
        v97 = 1;
      }

      uint64_t v17 = (os_log_s *)MEMORY[0x1895F8DA0];
LABEL_46:
      ++v18;
    }

    while (v104 != v18);
    v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v119, 16, v34);
    v104 = v86;
  }

  while (v86);

  v87 = v97;
  if ((v95 & 1) != 0)
  {
    [v12 addBlacklistedStateHistory:0 state:a8 reason:a4 reasonData:a5];
    v87 = 1;
  }
    }
  }

  else
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s discardedNodes is null",  "-[WFBlacklistEngine removeExpiredBlacklistedState:]");
    int v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      v78 = (void *)NSString;
      int v6 = v6;
      v79 = objc_msgSend(v78, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      v101 = [v79 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
}

LABEL_91:
  -[WFBlacklistEngine _printBlacklist](self, "_printBlacklist");
LABEL_92:

  return v87 & 1;
}
          }

          v43 = [v98 countByEnumeratingWithState:&v107 objects:v121 count:16];
          if (!v43)
          {
LABEL_93:

            break;
          }
        }
      }

      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v98 = (id)_apProfileVendorFields;
      v56 = [v98 countByEnumeratingWithState:&v103 objects:v120 count:16];
      if (!v56) {
        goto LABEL_121;
      }
      v57 = v56;
      v58 = *(void *)v104;
      do
      {
        for (k = 0LL; k != v57; ++k)
        {
          if (*(void *)v104 != v58) {
            objc_enumerationMutation(v98);
          }
          v60 = *(void **)(*((void *)&v103 + 1) + 8 * k);
          [v60 objectForKeyedSubscript:@"match_len"];
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if (v61)
          {
            [v60 objectForKeyedSubscript:@"match_len"];
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              [v60 objectForKeyedSubscript:@"match_len"];
              v63 = (void *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              v63 = 0LL;
            }
          }

          else
          {
            v63 = 0LL;
          }

          v64 = [v60 objectForKeyedSubscript:@"match_value"];
          if (!v64)
          {
            v67 = 0LL;
LABEL_116:
            v68 = (os_log_s *)MEMORY[0x1895F8DA0];
LABEL_117:
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v124 = "+[WiFiUsageAccessPointProfile _toMobileAssetsProfile:]";
              v125 = 2112;
              v126 = v63;
              v127 = 2112;
              v128 = (uint64_t)v67;
              v129 = 2112;
              v130 = (uint64_t)v60;
              _os_log_impl( &dword_187EBF000,  v68,  OS_LOG_TYPE_DEFAULT,  "%s - Field has wrong format (missing match_len (%@) and|or match_value (%@) and|or matchLen is larger th an 8) - ignoring : %@",  buf,  0x2Au);
            }

            goto LABEL_119;
          }

          v65 = (void *)v64;
          [v60 objectForKeyedSubscript:@"match_value"];
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [v60 objectForKeyedSubscript:@"match_value"];
            v67 = (void *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            v67 = 0LL;
          }

          if (!v63) {
            goto LABEL_116;
          }
          v68 = (os_log_s *)MEMORY[0x1895F8DA0];
          v69 = [obja length];
          if (v69 >= [v63 unsignedIntValue]
            && objc_msgSend( a1,  "_compareBytes:FromStart:WithLen:With:",  obja,  0,  objc_msgSend(v63, "unsignedIntValue"),  v67))
          {
            v74 = (void *)objc_opt_new();
            v76 = obja;
            [a1 _extractFieldsFor:v60 From:obja Into:v74];
            [v86 addObject:v74];

            v38 = v89;
            v75 = v92;
            goto LABEL_125;
          }

LABEL_77:
    goto LABEL_72;
  }

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = self->_blacklist;
  v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v101,  v117,  16LL);
  unint64_t v9 = 0;
  if (!v82) {
    goto LABEL_64;
  }
  uint64_t v10 = 0LL;
  v81 = *(void *)v102;
  uint64_t v11 = (os_log_s *)MEMORY[0x1895F8DA0];
  v78 = v7;
  v86 = self;
  do
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = v10;
    do
    {
      if (*(void *)v102 != v81) {
        objc_enumerationMutation(obj);
      }
      v84 = v12;
      uint64_t v10 = *(id *)(*((void *)&v101 + 1) + 8 * v12);

      if (a3 == 1)
      {
        [v10 blacklistTriggers];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 removeAllObjects];

        [v10 blacklistedStatesCurrent];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        v99[0] = MEMORY[0x1895F87A8];
        v99[1] = 3221225472LL;
        v99[2] = __63__WFBlacklistEngine_removeBlacklistedStateWithUnblacklistType___block_invoke;
        v99[3] = &unk_18A16E910;
        char v16 = v10;
        v100 = v16;
        [v15 enumerateObjectsUsingBlock:v99];

        [v16 blacklistedStatesCurrent];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 removeAllObjects];

        [v7 addObject:v16];
        unint64_t v9 = 1;
        char v18 = v100;
        goto LABEL_61;
      }

      v80 = v9;
      [v10 networkDelegate];
      unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 ssid];
      char v18 = (void *)objc_claimAutoreleasedReturnValue();

      [v10 networkDelegate];
      char v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 bssid];
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      [v10 networkDelegate];
      int8x16_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[WFBlacklistEngine isNetworkInBlacklistedState:state:]( self,  "isNetworkInBlacklistedState:state:",  v21,  1LL);

      uint64_t v23 = 0.0;
      v83 = v10;
      if (v22)
      {
        [v10 blacklistTriggers];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 removeAllObjects];

        v97 = 0u;
        v98 = 0u;
        v95 = 0u;
        v96 = 0u;
        [v10 blacklistedStatesCurrent];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = [v25 countByEnumeratingWithState:&v95 objects:v116 count:16];
        if (!v26) {
          goto LABEL_38;
        }
        v27 = v26;
        v28 = *(void *)v96;
        while (1)
        {
          v29 = 0LL;
          do
          {
            if (*(void *)v96 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void **)(*((void *)&v95 + 1) + 8 * v29);
            if ([v30 blacklistedState] != 1) {
              goto LABEL_28;
            }
            if ([v30 blacklistedReason] == 6) {
              goto LABEL_32;
            }
            if (a3 != 3) {
              goto LABEL_25;
            }
            [v30 blacklistedStateTimestamp];
            if (v31 > v23)
            {
              [v30 blacklistedStateTimestamp];
              uint64_t v23 = v32;
            }

            [MEMORY[0x189603F50] date];
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            [v33 timeIntervalSince1970];
            v35 = v34;

            -[WFBlacklistEngine autojoinBlacklistExpiry](v86, "autojoinBlacklistExpiry");
            v36 = *(void **)(v8 + 2600);
            if (v35 - v23 > v37)
            {
              [v36 stringWithFormat:@"Network '%@' is due for unblacklisting", v18];
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                v39 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v38, "UTF8String"));
                v40 = [v39 UTF8String];
                *(_DWORD *)buf = 136446210;
                v106 = v40;
                _os_log_impl(&dword_187EBF000, v11, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

                int v8 = 0x189607000uLL;
              }

LABEL_25:
              [*(id *)(v8 + 2600) stringWithFormat:@"%s Unblacklisting network '%@' for autojoin ", "-[WFBlacklistEngine removeBlacklistedStateWithUnblacklistType:]", v18];
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                v42 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v41, "UTF8String"));
                v43 = [v42 UTF8String];
                *(_DWORD *)buf = 136446210;
                v106 = v43;
                _os_log_impl(&dword_187EBF000, v11, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

                int v8 = 0x189607000uLL;
              }

              [v87 addObject:v30];
LABEL_28:
              if ([v30 blacklistedState] == 3)
              {
                [*(id *)(v8 + 2600) stringWithFormat:@"%s Unblacklisting network '%@' for WoW ", "-[WFBlacklistEngine removeBlacklistedStateWithUnblacklistType:]", v18];
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                {
                  v45 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v44, "UTF8String"));
                  v46 = [v45 UTF8String];
                  *(_DWORD *)buf = 136446210;
                  v106 = v46;
                  _os_log_impl(&dword_187EBF000, v11, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

                  int v8 = 0x189607000LL;
                }

                [v87 addObject:v30];
              }

              goto LABEL_32;
            }

            [v36 stringWithFormat:@"Skip unblacklisting network '%@' - not due.", v18];
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v48 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v47, "UTF8String"));
              v49 = [v48 UTF8String];
              *(_DWORD *)buf = 136446210;
              v106 = v49;
              _os_log_impl(&dword_187EBF000, v11, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

              int v8 = 0x189607000LL;
            }

LABEL_32:
            ++v29;
          }

          while (v27 != v29);
          v50 = [v25 countByEnumeratingWithState:&v95 objects:v116 count:16];
          v27 = v50;
          if (!v50)
          {
LABEL_38:

            uint64_t v7 = v78;
            self = v86;
            uint64_t v10 = v83;
            break;
          }
        }
      }

      [v10 networkDelegate];
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = -[WFBlacklistEngine isNetworkInBlacklistedState:state:]( self,  "isNetworkInBlacklistedState:state:",  v51,  2LL);

      if (!v52) {
        goto LABEL_60;
      }
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      [v10 blacklistedStatesCurrent];
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = [v53 countByEnumeratingWithState:&v91 objects:v115 count:16];
      if (!v54) {
        goto LABEL_59;
      }
      v55 = v54;
      v56 = *(void *)v92;
      do
      {
        for (i = 0LL; i != v55; ++i)
        {
          if (*(void *)v92 != v56) {
            objc_enumerationMutation(v53);
          }
          v58 = *(void **)(*((void *)&v91 + 1) + 8 * i);
          if ([v58 blacklistedState] == 2)
          {
            if (a3 != 3) {
              goto LABEL_52;
            }
            [v58 blacklistedStateTimestamp];
            if (v59 > v23)
            {
              [v58 blacklistedStateTimestamp];
              uint64_t v23 = v60;
            }

            [MEMORY[0x189603F50] date];
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            [v61 timeIntervalSince1970];
            v63 = v62;

            v64 = v63 - v23;
            -[WFBlacklistEngine bssBlacklistExpiry](v86, "bssBlacklistExpiry");
            v66 = v65;
            v67 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
            if (v64 > v66)
            {
              if (v67)
              {
                *(_DWORD *)buf = 141558786;
                v106 = 1752392040LL;
                v107 = 2112;
                v108 = (uint64_t)v18;
                v109 = 2160;
                v110 = 1752392040LL;
                v111 = 2112;
                v112 = (uint64_t)v85;
                _os_log_error_impl( &dword_187EBF000,  v11,  OS_LOG_TYPE_ERROR,  "BSS '%{mask.hash}@[%{mask.hash}@]' is due for unblacklisting",  buf,  0x2Au);
              }

  self->_supportsBssTransitionManagement = 1;
  if ((v42 & 8) == 0)
  {
LABEL_71:
    if ((v42 & 0x10) == 0) {
      goto LABEL_72;
    }
LABEL_79:
    self->_supportsFastlane = 1;
    if ((v42 & 0x20) == 0) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }

LABEL_52:
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                v106 = (uint64_t)"-[WFBlacklistEngine removeBlacklistedStateWithUnblacklistType:]";
                v107 = 2160;
                v108 = 1752392040LL;
                v109 = 2112;
                v110 = (uint64_t)v18;
                v111 = 2160;
                v112 = 1752392040LL;
                v113 = 2112;
                v114 = v85;
                _os_log_error_impl( &dword_187EBF000,  v11,  OS_LOG_TYPE_ERROR,  "%s Unblacklisting BSS '%{mask.hash}@[%{mask.hash}@]' for autojoin ",  buf,  0x34u);
              }

              [v87 addObject:v58];
              continue;
            }

            if (v67)
            {
              *(_DWORD *)buf = 141558786;
              v106 = 1752392040LL;
              v107 = 2112;
              v108 = (uint64_t)v18;
              v109 = 2160;
              v110 = 1752392040LL;
              v111 = 2112;
              v112 = (uint64_t)v85;
              _os_log_error_impl( &dword_187EBF000,  v11,  OS_LOG_TYPE_ERROR,  "Skip unblacklisting BSS '%{mask.hash}@[%{mask.hash}@]' - not due.",  buf,  0x2Au);
            }
          }
        }

        v55 = [v53 countByEnumeratingWithState:&v91 objects:v115 count:16];
      }

      while (v55);
LABEL_59:

      uint64_t v7 = v78;
      self = v86;
      uint64_t v10 = v83;
LABEL_60:
      v88[0] = MEMORY[0x1895F87A8];
      v88[1] = 3221225472LL;
      v88[2] = __63__WFBlacklistEngine_removeBlacklistedStateWithUnblacklistType___block_invoke_77;
      v88[3] = &unk_18A16E938;
      v90 = a3;
      v68 = v10;
      v89 = v68;
      [v87 enumerateObjectsUsingBlock:v88];
      [v68 blacklistedStatesCurrent];
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      [v69 removeObjectsInArray:v87];

      unint64_t v9 = ([v87 count] != 0) | v80;
      uint64_t v10 = v83;
      [v87 removeAllObjects];

      int v8 = 0x189607000uLL;
LABEL_61:

      uint64_t v12 = v84 + 1;
      uint64_t v13 = v10;
    }

    while (v84 + 1 != v82);
    v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v101,  v117,  16LL);
  }

  while (v82);

LABEL_64:
  if ([v7 count])
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s Unblacklisting all networks",  "-[WFBlacklistEngine removeBlacklistedStateWithUnblacklistType:]");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      v71 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v70, "UTF8String"));
      v72 = [v71 UTF8String];
      *(_DWORD *)buf = 136446210;
      v106 = v72;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }

    -[NSMutableArray removeObjectsInArray:](self->_blacklist, "removeObjectsInArray:", v7);
  }

  if ((v9 & 1) != 0)
  {
    v73 = -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
    v74 = objc_opt_respondsToSelector();

    if ((v74 & 1) != 0)
    {
      v75 = -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
      [v75 blacklistDidUpdate];
    }
  }

  -[WFBlacklistEngine _printBlacklist](self, "_printBlacklist");
LABEL_72:
}

    [v10 bssid];
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = (void *)MEMORY[0x189607968];
    v77 = -[WiFiUsageParsedBeacon parsingSuccessful](v90, "parsingSuccessful")
       && ![v91 count]
       && [v86 count] == 0;
    [v76 numberWithBool:v77];
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_saveToUserDefaults:withKey:andValue:",  v75,  @"apProfileBeaconInfoParsingSuccessful",  v78);

    [v10 bssid];
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithUnsignedInteger:v82];
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_saveToUserDefaults:withKey:andValue:",  v79,  @"apProfileBeaconInfoOccurrencies",  v80);

    v26 = v90;
    v44 = v85;
    goto LABEL_56;
  }

  unint64_t v19 = 0LL;
LABEL_66:

  return v19;
}

LABEL_43:
                  [v74 addObject:v26];
                  goto LABEL_44;
                }
              }
            }

            v40 = dbl_187F83C90[[v26 triggerReason] == 2];
            [v26 triggerReasonTimestamp];
            if (v32 - v41 > v40)
            {
              v67 = (id)NSString;
              [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:v32];
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              [v67 stringWithFormat:@"%s Clearing(expired) trigger %@ (%@) for '%@'", "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]", v27, v42, v73];
              v68 = (id)objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                v43 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v68, "UTF8String"));
                v44 = [v43 UTF8String];
                *(_DWORD *)buf = 136446210;
                v89 = (const char *)v44;
                _os_log_impl(&dword_187EBF000, v23, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
              }

              goto LABEL_43;
            }

LABEL_44:
            ++v25;
          }

          while (v22 != v25);
          v45 = [obj countByEnumeratingWithState:&v79 objects:v104 count:16];
          v22 = v45;
        }

        while (v45);
      }

      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      uint64_t v10 = v10;
      v46 = [v10 countByEnumeratingWithState:&v75 objects:v87 count:16];
      if (v46)
      {
        v47 = v46;
        v48 = *(void *)v76;
        do
        {
          for (j = 0LL; j != v47; ++j)
          {
            if (*(void *)v76 != v48) {
              objc_enumerationMutation(v10);
            }
            [v8 processBlacklistedStateMetric:*(void *)(*((void *)&v75 + 1) + 8 * j) unblacklisting:1 unblacklistingReason:7];
          }

          v47 = [v10 countByEnumeratingWithState:&v75 objects:v87 count:16];
        }

        while (v47);
      }

      [v8 blacklistedStatesCurrent];
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      [v50 removeObjectsInArray:v10];

      [v8 blacklistTriggers];
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      [v51 removeObjectsInArray:v74];

      if ([v10 count])
      {
        v52 = -[WFBlacklistEngine blacklistDelegate](v70, "blacklistDelegate");
        v53 = objc_opt_respondsToSelector();

        if ((v53 & 1) != 0)
        {
          v54 = -[WFBlacklistEngine blacklistDelegate](v70, "blacklistDelegate");
          [v54 blacklistDidUpdate];
        }
      }

      [v8 blacklistedStatesCurrent];
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v55 count])
      {
      }

      else
      {
        [v8 blacklistTriggers];
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = [v56 count];

        if (!v57) {
          -[NSMutableArray removeObject:](v70->_blacklist, "removeObject:", v8);
        }
      }
    }

    else
    {
      objc_msgSend( NSString,  "stringWithFormat:",  @"%s SSID is null",  "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        v65 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v64, "UTF8String"));
        v66 = [v65 UTF8String];
        *(_DWORD *)buf = 136446210;
        v89 = (const char *)v66;
        _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
      }

      v69 = 0LL;
      v73 = 0LL;
    }
  }

  else
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s discardedNodes is null",  "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      v62 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v61, "UTF8String"));
      v63 = [v62 UTF8String];
      *(_DWORD *)buf = 136446210;
      v89 = (const char *)v63;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }

    v69 = 0LL;
    v73 = 0LL;
    v74 = 0LL;
  }

LABEL_22:
            uint64_t v30 = 0LL;
            v28 = 0LL;
            goto LABEL_16;
          }

          v27 = [MEMORY[0x189607968] numberWithDouble:v24];
          if (!v27)
          {
            objc_msgSend( NSString,  "stringWithFormat:",  @"%s timeNum failed",  "-[WFBlacklistEngine retrieveBlacklistedStateHistoryForNetwork:state:timestamps:reasonData:]");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_21;
            }
            goto LABEL_22;
          }

          v28 = (void *)v27;
          v29 = [MEMORY[0x189607968] numberWithInteger:v25];
          if (v29)
          {
            uint64_t v30 = (void *)v29;
            [v15 addObject:v26];
            if (v11) {
              [v11 addObject:v28];
            }
            if (v12) {
              [v12 addObject:v30];
            }
          }

          else
          {
            objc_msgSend( NSString,  "stringWithFormat:",  @"%s reasonDataNum failed",  "-[WFBlacklistEngine retrieveBlacklistedStateHistoryForNetwork:state:timestamps:reasonData:]");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v34, "UTF8String"));
              v35 = v41 = v34;
              v36 = [v35 UTF8String];
              *(_DWORD *)buf = 136446210;
              v51 = v36;
              _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

              v34 = v41;
            }

            uint64_t v30 = 0LL;
          }

  return v5;
}
      }

      v31 = [obj countByEnumeratingWithState:&v37 objects:v48 count:16];
    }

    while (v31);
  }

  else
  {
    uint64_t v32 = 0LL;
  }

  return v32;
}

void OUTLINED_FUNCTION_1_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_187F55B44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_187F564E8(_Unwind_Exception *a1)
{
}

void sub_187F5668C(_Unwind_Exception *a1)
{
}

void sub_187F5802C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, id location)
{
}

void sub_187F586A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_187F5D720( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id location)
{
}

void WiFiWalletUtilAddPassFromURL(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x189603F48];
  id v4 = a2;
  [v3 dataWithContentsOfURL:a1];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = 0LL;
  int v6 = (void *)[objc_alloc(MEMORY[0x189611C60]) initWithData:v5 error:&v7];
  WiFiWalletUtilAddPass(v6, v4);
}

void WiFiWalletUtilAddPass(void *a1, void *a2)
{
  v11[1] = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (void (**)(void, void, void))v4;
  if (v3)
  {
    id v6 = objc_alloc_init(MEMORY[0x189611C68]);
    if (v6)
    {
      v11[0] = v3;
      [MEMORY[0x189603F18] arrayWithObjects:v11 count:1];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1895F87A8];
      v8[1] = 3221225472LL;
      v8[2] = __WiFiWalletUtilAddPass_block_invoke;
      v8[3] = &unk_18A16EB50;
      uint64_t v10 = v5;
      id v9 = v3;
      [v6 addPasses:v7 withCompletionHandler:v8];
    }

    else
    {
      v5[2](v5, 0LL, -1LL);
    }
  }

  else
  {
    (*((void (**)(id, void, uint64_t))v4 + 2))(v4, 0LL, -1LL);
  }
}

uint64_t __WiFiWalletUtilAddPass_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  a2);
}

uint64_t WiFiWalletUtilRemovePassesMatchingIdentifier(void *a1, void *a2)
{
  return _WiFiWalletUtilRemovePassMatching(a1, a2, 0LL, 0LL);
}

uint64_t _WiFiWalletUtilRemovePassMatching(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init(MEMORY[0x189611C68]);
  id v12 = v10;
  uint64_t v13 = v12;
  if (!v12)
  {
    if (v9)
    {
      [MEMORY[0x189603F48] dataWithContentsOfURL:v9];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = 0LL;
      char v16 = (void *)[objc_alloc(MEMORY[0x189611C60]) initWithData:v15 error:&v18];
      if (v16)
      {

        NSLog(@"Failed to remove PKPass with pass: %@", 0LL);
      }

      else
      {
        NSLog(@"Failed to create PKPass with URL: %@", v9);
      }
    }

    else
    {
      if (v7)
      {
        [v11 passWithPassTypeIdentifier:v7 serialNumber:v8];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13) {
          goto LABEL_2;
        }
        NSLog(@"Failed to find pass with identifier: %@ and serial %@", v7, v8);
LABEL_8:
        uint64_t v14 = 0LL;
        goto LABEL_9;
      }

      NSLog(@"Failed to find pass with identifier: %@ and serial %@", 0LL, v8);
    }

    uint64_t v13 = 0LL;
    goto LABEL_8;
  }

LABEL_2:
  [v11 removePass:v13];
  if ([v11 containsPass:v13])
  {
    NSLog(@"Library still contains pass after removal");
    goto LABEL_8;
  }

  uint64_t v14 = 1LL;
LABEL_9:

  return v14;
}

uint64_t WiFiWalletUtilRemovePassMatchingURL(void *a1)
{
  return _WiFiWalletUtilRemovePassMatching(0LL, 0LL, a1, 0LL);
}

uint64_t WiFiWalletUtilRemovePass(void *a1)
{
  return _WiFiWalletUtilRemovePassMatching(0LL, 0LL, 0LL, a1);
}

id WiFiWalletSignedDataForRawPass(void *a1, void *a2, void *a3, void *a4)
{
  items[1] = *(CFArrayRef *)MEMORY[0x1895F89C0];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (!v7)
  {
    v28 = 0LL;
    uint64_t v17 = 0LL;
    goto LABEL_42;
  }

  [MEMORY[0x1896078A8] defaultManager];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = (void *)MEMORY[0x189604030];
  NSTemporaryDirectory();
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 stringByAppendingPathComponent:@"PassBeingSigned.raw"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v12 fileURLWithPath:v14];

  [v11 removeItemAtURL:v15 error:0];
  id v117 = 0LL;
  v105 = v11;
  v106 = (void *)v15;
  [v11 copyItemAtURL:v7 toURL:v15 error:&v117];
  char v16 = (__CFString *)v117;
  uint64_t v17 = v16;
  if (v10 && !v16)
  {
    v116 = 0LL;
    id v103 = v10;
    id v18 = v10;
    [v106 URLByAppendingPathComponent:@"pass.json" isDirectory:0];
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [MEMORY[0x189603F48] dataWithContentsOfURL:v19 options:0 error:&v116];
    if (v20)
    {
      int8x16_t v21 = (void *)v20;
      id v99 = v9;
      v118[0] = 0LL;
      [MEMORY[0x1896078D8] JSONObjectWithData:v20 options:1 error:v118];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = (__CFString *)v118[0];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v97 = v8;
        id v24 = v22;
        [v24 objectForKey:@"semantics"];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25)
        {
          v27 = (void *)[v25 mutableCopy];
          [v27 setObject:v18 forKey:@"wifiAccess"];
        }

        else
        {
          items[0] = (CFArrayRef)@"wifiAccess";
          *(void *)&__int128 v119 = v18;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v119 forKeys:items count:1];
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }

        [v24 setObject:v27 forKey:@"semantics"];

        v125 = v23;
        [MEMORY[0x1896078D8] dataWithJSONObject:v24 options:1 error:&v125];
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v125;

        if (v29) {
          v116 = v29;
        }
        else {
          [v30 writeToURL:v19 atomically:1];
        }

        id v8 = v97;
      }

      else
      {
        _ErrorWithCodeAndDescription(0LL, @"Invalid pass data.");
        v116 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        v29 = v23;
        uint64_t v30 = v21;
      }

      id v9 = v99;
    }

    uint64_t v17 = v116;
    id v10 = v103;
  }

  if (v17) {
    goto LABEL_39;
  }
  id v104 = v10;
  v98 = v8;
  v31 = (objc_class *)MEMORY[0x189603FC8];
  id v32 = v106;
  id v107 = objc_alloc_init(v31);
  [MEMORY[0x1896078A8] defaultManager];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = [v32 URLByStandardizingPath];
  v95 = v32;

  v96 = v33;
  v110 = (void *)v34;
  [v33 enumeratorAtURL:v34 includingPropertiesForKeys:0 options:0 errorHandler:0];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v119 = 0u;
  __int128 v120 = 0u;
  __int128 v121 = 0u;
  __int128 v122 = 0u;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v119 objects:v118 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    id v100 = v9;
    id v93 = v7;
    v38 = 0LL;
    uint64_t v39 = *(void *)v120;
    uint64_t v40 = *MEMORY[0x189603C88];
    uint64_t v108 = *MEMORY[0x189603C88];
    v109 = v35;
    do
    {
      for (uint64_t i = 0LL; i != v37; ++i)
      {
        if (*(void *)v120 != v39) {
          objc_enumerationMutation(v35);
        }
        if (!v38)
        {
          v42 = *(void **)(*((void *)&v119 + 1) + 8 * i);
          v125 = 0LL;
          items[0] = 0LL;
          int v43 = [v42 getResourceValue:items forKey:v40 error:&v125];
          v44 = items[0];
          v38 = v125;
          if (v43 && -[__CFArray BOOLValue](v44, "BOOLValue"))
          {
            [v42 URLByStandardizingPath];
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            [MEMORY[0x189603F48] dataWithContentsOfURL:v45];
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            [v112 SHA1Hash];
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            [v46 hexEncoding];
            v114 = (void *)objc_claimAutoreleasedReturnValue();

            [v110 pathComponents];
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            [v45 pathComponents];
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v49 = [v47 count];
            objc_msgSend(v48, "subarrayWithRange:", v49, objc_msgSend(v48, "count") - v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            [NSString pathWithComponents:v50];
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51) {
              [v107 setObject:v114 forKeyedSubscript:v51];
            }

            uint64_t v40 = v108;
            v35 = v109;
          }
        }
      }

      uint64_t v37 = [v35 countByEnumeratingWithState:&v119 objects:v118 count:16];
    }

    while (v37);
    id v7 = v93;
    id v9 = v100;
    if (v38) {
      goto LABEL_35;
    }
  }

  [v110 URLByAppendingPathComponent:@"manifest.json"];
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  id v124 = 0LL;
  [MEMORY[0x1896078D8] dataWithJSONObject:v107 options:1 error:&v124];
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (__CFString *)v124;
  if (v54)
  {
    v38 = v54;

LABEL_35:
    v55 = v38;
    goto LABEL_37;
  }

  [v53 writeToURL:v52 atomically:1];

  v55 = 0LL;
LABEL_37:

  v56 = v55;
  id v8 = v98;
  id v10 = v104;
  if (!v56)
  {
    id v58 = v95;
    id v59 = v98;
    id v60 = v9;
    if (!v60 || !v59 || !v58)
    {
      _ErrorWithCodeAndDescription(0LL, @"Missing required signature parameters.");
      id v76 = (id)objc_claimAutoreleasedReturnValue();
LABEL_64:

      v78 = (__CFString *)v76;
      if (v78)
      {
        uint64_t v17 = v78;
        v28 = 0LL;
      }

      else
      {
        id v102 = v9;
        id v79 = v7;
        id v80 = v58;
        BOMCopierNew();
        *(void *)&__int128 v119 = @"createPKZip";
        v118[0] = (id)MEMORY[0x189604A88];
        [MEMORY[0x189603F68] dictionaryWithObjects:v118 forKeys:&v119 count:1];
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607AB8] UUID];
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        [v82 UUIDString];
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        [v83 stringByAppendingPathExtension:@"pkpass"];
        v84 = (void *)objc_claimAutoreleasedReturnValue();

        NSTemporaryDirectory();
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        [v85 stringByAppendingPathComponent:v84];
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        [v80 path];
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x1896078A8] defaultManager];
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        id v89 = v87;
        [v89 fileSystemRepresentation];
        id v90 = v86;
        [v90 fileSystemRepresentation];
        int v91 = BOMCopierCopyWithOptions();
        if (v91)
        {
          _ErrorWithCodeAndDescription(v91, @"Error zipping pass.");
          id v92 = (id)objc_claimAutoreleasedReturnValue();
          v28 = 0LL;
        }

        else
        {
          [MEMORY[0x189603F48] dataWithContentsOfFile:v90];
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          id v92 = 0LL;
        }

        [v88 removeItemAtPath:v90 error:0];
        BOMCopierFree();

        uint64_t v17 = (__CFString *)v92;
        id v7 = v79;
        id v9 = v102;
      }

      id v10 = v104;
      goto LABEL_40;
    }

    [v58 URLByAppendingPathComponent:@"manifest.json"];
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603F48] dataWithContentsOfURL:v61];
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603F48] dataWithContentsOfURL:v59];
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603F48] dataWithContentsOfURL:v60];
    v64 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v65 = v64;
    if (!v63 || !v64)
    {
      _ErrorWithCodeAndDescription(0LL, @"Error loading certificates.");
      id v76 = (id)objc_claimAutoreleasedReturnValue();
LABEL_63:

      id v8 = v98;
      goto LABEL_64;
    }

    v113 = v61;
    v115 = v62;
    id v101 = v9;
    v66 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    SecCertificateRef v67 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x189604DB0], v64);
    items[0] = 0LL;
    id v124 = (id)*MEMORY[0x18960BBF0];
    v125 = @"apple123";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v125 forKeys:&v124 count:1];
    v111 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    OSStatus v68 = SecPKCS12Import((CFDataRef)v63, v111, items);
    if (v67 && !v68 && CFArrayGetCount(items[0]) == 1)
    {
      id v94 = v7;
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(items[0], 0LL);
      CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x18960BBF8]);
      uint64_t v70 = *MEMORY[0x18960BB10];
      v118[0] = *(id *)MEMORY[0x189604DE8];
      uint64_t v71 = *MEMORY[0x18960BB08];
      *(void *)&__int128 v119 = v70;
      *((void *)&v119 + 1) = v71;
      SecCertificateRef v123 = v67;
      [MEMORY[0x189603F18] arrayWithObjects:&v123 count:1];
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v118[1] = v72;
      [MEMORY[0x189603F68] dictionaryWithObjects:v118 forKeys:&v119 count:2];
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      CFMutableDataRef Mutable = CFDataCreateMutable(v66, 0LL);
      int v75 = SecCMSCreateSignedData();
      if (v75)
      {
        _ErrorWithCodeAndDescription(v75, @"Error signing manifest.");
        id v76 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        [v58 URLByAppendingPathComponent:@"signature"];
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFData writeToURL:atomically:](Mutable, "writeToURL:atomically:", v77, 1LL);

        id v76 = 0LL;
      }

      id v7 = v94;
      if (Mutable) {
        CFRelease(Mutable);
      }
    }

    else
    {
      _ErrorWithCodeAndDescription(0LL, @"Error importing certificates.");
      id v76 = (id)objc_claimAutoreleasedReturnValue();
      if (!v67) {
        goto LABEL_62;
      }
    }

    CFRelease(v67);
LABEL_62:

    id v9 = v101;
    v61 = v113;
    v62 = v115;
    goto LABEL_63;
  }

  uint64_t v17 = v56;
LABEL_39:
  v28 = 0LL;
LABEL_40:
  [v105 removeItemAtURL:v106 error:0];

  if (v17) {
    NSLog(@"PASS SIGNING ERROR: %@", v17);
  }
LABEL_42:

  return v28;
}

id _ErrorWithCodeAndDescription(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v3 = (void *)MEMORY[0x189607870];
  uint64_t v9 = *MEMORY[0x1896075E0];
  v10[0] = a2;
  id v4 = (void *)MEMORY[0x189603F68];
  id v5 = a2;
  [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 errorWithDomain:@"com.apple.wallet.server" code:a1 userInfo:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_187F626D8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_187F62798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_187F62858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double _TBGloriaBoundingBoxFromLocation(double a1, double a2, char a3)
{
  double v6 = a2;
  double v7 = a1;
  char v5 = a3;
  gloria::TileId::FromLatLng((gloria::TileId *)&v7, &v6, (const double *)&v5, (uint64_t)v4);
  return gloria::TileId::ToBBOX((gloria::TileId *)v4);
}

void sub_187F629B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_187F62AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_78:
  self->_supportsAdaptiveFastTransition = 1;
  if ((v42 & 0x10) != 0) {
    goto LABEL_79;
  }
LABEL_72:
  if ((v42 & 0x20) != 0) {
LABEL_73:
  }
    self->_supportsNetworkAssurance = 1;
LABEL_74:
}

void sub_187F66D98(_Unwind_Exception *a1)
{
}

void sub_187F6706C(_Unwind_Exception *a1)
{
}

LABEL_6:
}
}

void sub_187F6831C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_58:
        ++v5;
      }

      while (v4 != v5);
      id v4 = [obj countByEnumeratingWithState:&v115 objects:v131 count:16];
    }

    while (v4);
  }

  v86 = (void *)objc_opt_new();
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  [v90 vendorIEList];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v35 allKeys];
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sortedArrayUsingSelector:");
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();

  v85 = v37;
  v88 = [v37 countByEnumeratingWithState:&v111 objects:v122 count:16];
  v38 = v89;
  if (!v88) {
    goto LABEL_128;
  }
  v87 = *(void *)v112;
  do
  {
    for (uint64_t i = 0LL; i != v88; uint64_t i = v75 + 1)
    {
      if (*(void *)v112 != v87) {
        objc_enumerationMutation(v85);
      }
      id v92 = i;
      uint64_t v40 = *(void *)(*((void *)&v111 + 1) + 8 * i);
      [v90 vendorIEList];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v41 objectForKeyedSubscript:v40];
      obja = (id)objc_claimAutoreleasedReturnValue();

      if (_apProfileListVendorIEs)
      {
        v109 = 0u;
        v110 = 0u;
        id v107 = 0u;
        uint64_t v108 = 0u;
        v98 = (id)_apProfileVendorExcludeFields;
        v42 = [v98 countByEnumeratingWithState:&v107 objects:v121 count:16];
        if (!v42) {
          goto LABEL_93;
        }
        int v43 = v42;
        v44 = *(void *)v108;
        while (1)
        {
          for (j = 0LL; j != v43; ++j)
          {
            if (*(void *)v108 != v44) {
              objc_enumerationMutation(v98);
            }
            v46 = *(void **)(*((void *)&v107 + 1) + 8 * j);
            [v46 objectForKeyedSubscript:@"match_len"];
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (v47)
            {
              [v46 objectForKeyedSubscript:@"match_len"];
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                [v46 objectForKeyedSubscript:@"match_len"];
                uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                uint64_t v49 = 0LL;
              }
            }

            else
            {
              uint64_t v49 = 0LL;
            }

            v50 = [v46 objectForKeyedSubscript:@"match_value"];
            if (!v50)
            {
              v53 = 0LL;
LABEL_88:
              v54 = (os_log_s *)MEMORY[0x1895F8DA0];
LABEL_89:
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                id v124 = "+[WiFiUsageAccessPointProfile _toMobileAssetsProfile:]";
                v125 = 2112;
                v126 = v49;
                v127 = 2112;
                v128 = (uint64_t)v53;
                v129 = 2112;
                v130 = (uint64_t)v46;
                _os_log_impl( &dword_187EBF000,  v54,  OS_LOG_TYPE_DEFAULT,  "%s - Field has wrong format (missing match_len (%@) and|or match_value (%@) and|or matchLen is larger than 8) - ignoring : %@",  buf,  0x2Au);
              }

              goto LABEL_91;
            }

            v51 = (void *)v50;
            [v46 objectForKeyedSubscript:@"match_value"];
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              [v46 objectForKeyedSubscript:@"match_value"];
              v53 = (void *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              v53 = 0LL;
            }

            if (!v49) {
              goto LABEL_88;
            }
            v54 = (os_log_s *)MEMORY[0x1895F8DA0];
            v55 = [obja length];
            if (v55 >= [v49 unsignedIntValue]
              && objc_msgSend( a1,  "_compareBytes:FromStart:WithLen:With:",  obja,  0,  objc_msgSend(v49, "unsignedIntValue"),  v53))
            {

              v38 = v89;
              int v75 = v92;
              id v76 = obja;
              goto LABEL_125;
            }

LABEL_119:
        }

        v57 = [v98 countByEnumeratingWithState:&v103 objects:v120 count:16];
      }

      while (v57);
LABEL_121:

      v38 = v89;
      int v75 = v92;
      id v76 = obja;
      if (_apProfileListVendorIEs)
      {
        uint64_t v70 = obja;
        uint64_t v71 = [v70 bytes];
        v72 = [v70 length];
        v73 = _apProfileListVendorIEsLen;
        if (v72 < _apProfileListVendorIEsLen) {
          v73 = [v70 length];
        }
        +[WiFiUsagePrivacyFilter toHEXString:length:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "toHEXString:length:",  v71,  v73);
        v98 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "addObject:");
LABEL_125:
      }
    }

    v88 = [v85 countByEnumeratingWithState:&v111 objects:v122 count:16];
  }

  while (v88);
LABEL_128:

  id v101 = 0u;
  id v102 = 0u;
  id v99 = 0u;
  id v100 = 0u;
  [v86 allObjects];
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  [v77 sortedArrayUsingSelector:sel_compare_];
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  id v79 = [v78 countByEnumeratingWithState:&v99 objects:v119 count:16];
  if (v79)
  {
    id v80 = v79;
    v81 = *(void *)v100;
    do
    {
      for (m = 0LL; m != v80; ++m)
      {
        if (*(void *)v100 != v81) {
          objc_enumerationMutation(v78);
        }
        [v38 appendFormat:@"DD%@", *(void *)(*((void *)&v99 + 1) + 8 * m)];
      }

      id v80 = [v78 countByEnumeratingWithState:&v99 objects:v119 count:16];
    }

    while (v80);
  }

  return v38;
}

LABEL_59:
          if (v8) {
            [a1 updateWithWPS:v8];
          }
          if (v20) {
            [a1 _cleanUpStaleProfiles];
          }
          unint64_t v19 = v10;
          goto LABEL_65;
        }

        [v10 bssid];
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_saveToUserDefaults:withKey:andValue:",  v44,  @"apProfileForLatestAssoc",  MEMORY[0x189604A88]);
        uint64_t v20 = 0;
LABEL_56:

        goto LABEL_57;
      }
    }

    else
    {
    }

    [v10 apProfile];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = [v46 isEqualToString:v87];

    if (v33
      && (v48 = v33 + v47) != 0
      && v47
      && v88
      && (uint64_t v49 = [v88 length], v49 == 2 * _shortProfileBytesLen))
    {
      v82 = v48;
      uint64_t v20 = 0;
    }

    else
    {
      [v10 bssid];
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( NSString,  "stringWithFormat:",  @"replaced (from %s)",  "+[WiFiUsageAccessPointProfile profileFromBeaconData:andParsedIE:]");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      [v92 _submitProfileFor:v50 withCachedDict:0 AndEraseWithLog:v51];

      [v10 bssid];
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 apProfile];
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_saveToUserDefaults:withKey:andValue:",  v52,  @"apProfileID",  v53);

      [v10 bssid];
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 apProfile];
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = _shortProfileBytesLen;
      v56 = v54;
      memset(buf, 0, 20);
      v84 = v56;
      if (v56)
      {
        v57 = (void *)MEMORY[0x189603F48];
        id v58 = v56;
        objc_msgSend( v57,  "dataWithBytes:length:",  objc_msgSend(v58, "cStringUsingEncoding:", 4),  objc_msgSend(v58, "length"));
        v56 = (id)objc_claimAutoreleasedReturnValue();
      }

      id v59 = v56;
      if (CC_SHA1((const void *)[v59 bytes], objc_msgSend(v59, "length"), buf) == buf)
      {
        +[WiFiUsagePrivacyFilter toHEXString:length:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "toHEXString:length:",  buf,  20LL);
        id v60 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v60 = 0LL;
      }

      v61 = 2 * v55;
      if (v61 < [v60 length])
      {
        v62 = objc_msgSend(v60, "substringFromIndex:", objc_msgSend(v60, "length") - v61);

        id v60 = (void *)v62;
      }

      +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_saveToUserDefaults:withKey:andValue:",  v83,  @"apProfile_shortID",  v60);
      [v10 bssid];
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = -[WiFiUsageParsedBeacon dictionaryRepresentation](v90, "dictionaryRepresentation");
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_saveToUserDefaults:withKey:andValue:",  v63,  @"apProfileBeaconInfo",  v64);

      [v10 bssid];
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_saveToUserDefaults:withKey:andValue:",  v65,  @"apProfileBeaconRaw",  v6);

      v82 = 1LL;
      uint64_t v20 = 1;
      a1 = v92;
    }

    [v10 bssid];
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_loadFromUserDefaults:withKey:withCachedData:",  v66,  @"apProfileBeaconInfo",  0LL);
    SecCertificateRef v67 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = v67;
    [v67 objectForKey:@"apName"];
    id v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageParsedBeacon apName](v90, "apName");
    OSStatus v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      v69 = v68;
      if (v93)
      {
        -[WiFiUsageParsedBeacon apName](v90, "apName");
        uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v71 = [v70 isEqualToString:v93];

        if ((v71 & 1) != 0) {
          goto LABEL_52;
        }
      }

      else
      {
      }

      [v10 bssid];
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = -[WiFiUsageParsedBeacon dictionaryRepresentation](v90, "dictionaryRepresentation");
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_saveToUserDefaults:withKey:andValue:",  v72,  @"apProfileBeaconInfo",  v73);

      [v10 bssid];
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "_saveToUserDefaults:withKey:andValue:",  v74,  @"apProfileBeaconRaw",  v6);
    }

void WiFiUsageFaultReasonStringMap_cold_1(uint64_t a1)
{
}

void WiFiUsageFaultReasonStringMap_cold_2(uint64_t a1)
{
}

void WiFiUsageFaultReasonStringMap_cold_3(uint64_t a1)
{
}

uint64_t __softlink__BiomeLibrary_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBMDeviceWiFiClass_block_invoke_cold_1(v0);
}

uint64_t __getBMDeviceWiFiClass_block_invoke_cold_1()
{
  uint64_t v0 = (uint8_t *)abort_report_np();
  return __30__WFMeasure_dispatchPingTest___block_invoke_cold_1(v0);
}

void _labelDescription_cold_1(uint64_t a1)
{
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x18960DA90]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x18960DAA8]();
}

uint64_t Apple80211BindToInterface()
{
  return MEMORY[0x18960FF18]();
}

uint64_t Apple80211Close()
{
  return MEMORY[0x18960FF30]();
}

uint64_t Apple80211CopyValue()
{
  return MEMORY[0x18960FF48]();
}

uint64_t Apple80211Get()
{
  return MEMORY[0x18960FF58]();
}

uint64_t Apple80211Open()
{
  return MEMORY[0x18960FF80]();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x18960D518]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x18960D528]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x18960D530]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F8290](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x189602A68](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x189602AF0](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate( CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x189602B00](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime( CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x189602B20](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

void CFHostCancelInfoResolution(CFHostRef theHost, CFHostInfoType info)
{
}

CFHostRef CFHostCreateWithName(CFAllocatorRef allocator, CFStringRef hostname)
{
  return (CFHostRef)MEMORY[0x189601DB8](allocator, hostname);
}

CFArrayRef CFHostGetAddressing(CFHostRef theHost, Boolean *hasBeenResolved)
{
  return (CFArrayRef)MEMORY[0x189601DC0](theHost, hasBeenResolved);
}

Boolean CFHostStartInfoResolution(CFHostRef theHost, CFHostInfoType info, CFStreamError *error)
{
  return MEMORY[0x189601DC8](theHost, *(void *)&info, error);
}

uint64_t CFNetDiagnosticPingWithOptions()
{
  return MEMORY[0x189601DD0]();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

void CFStringAppendFormatAndArguments( CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x189603418](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation( CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x189603420](alloc, theString, *(void *)&encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x189603430](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments( CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x189603498](alloc, formatOptions, format, arguments);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603538](string, buffer, maxBufLen);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x189603560](string);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t GEOErrorDomain()
{
  return MEMORY[0x18960F3D0]();
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x1896105A8]();
}

uint64_t LXEntryGetMetaFlags()
{
  return MEMORY[0x1896105B0]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x1896105B8]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x1896105C0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x189613710]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x189613728]();
}

uint64_t MKBUserUnlockedSinceBoot()
{
  return MEMORY[0x189611540]();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains( NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1896076E0](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1896076F0](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x189607710](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x189607718](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x189607720]();
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x18960C1C0](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate( CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x18960C1C8](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity( CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x18960C1F8](allocator, domain, serviceID, entity);
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x18960C288](interface);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress( CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x18960C2F0](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x18960C308](target, flags);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return (SCNetworkInterfaceRef)MEMORY[0x18960C378](service);
}

CFStringRef SCNetworkServiceGetServiceID(SCNetworkServiceRef service)
{
  return (CFStringRef)MEMORY[0x18960C388](service);
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return (SCNetworkSetRef)MEMORY[0x18960C3C0](prefs);
}

CFArrayRef SCNetworkSetCopyServices(SCNetworkSetRef set)
{
  return (CFArrayRef)MEMORY[0x18960C3C8](set);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization( CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x18960C400](allocator, name, prefsID, authorization);
}

uint64_t SCPrint()
{
  return MEMORY[0x18960C458]();
}

uint64_t SecCMSCreateSignedData()
{
  return MEMORY[0x18960B228]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x18960B2E8](allocator, data);
}

OSStatus SecPKCS12Import(CFDataRef pkcs12_data, CFDictionaryRef options, CFArrayRef *items)
{
  return MEMORY[0x18960B518](pkcs12_data, options, items);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::stringbuf::string_type *__cdecl std::stringbuf::str( std::stringbuf::string_type *__return_ptr retstr, const std::stringbuf *this)
{
  return (std::stringbuf::string_type *)MEMORY[0x189614198](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1896141C8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1896141D0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1896141E0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x189614268](this);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1896143C8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1896143D0]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1896143D8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1896143F0]();
}

{
  return MEMORY[0x189614408]();
}

{
  return MEMORY[0x189614438]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x189614470]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x189614478]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x189614638]();
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_18A16BDA0(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1896147A0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

double __exp10(double a1)
{
  return result;
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

__double2 __sincos_stret(double a1)
{
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

int __vsnprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, va_list a6)
{
  return MEMORY[0x1895F8A58](a1, a2, *(void *)&a3, a4, a5, a6);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x189612738]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1895F9308]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1895F94D8](*(void *)&__upper_bound);
}

double atan(double a1)
{
  return result;
}

double atan2(double a1, double a2)
{
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x189616488](cls, outCount);
}

objc_property_t class_getProperty(Class cls, const char *name)
{
  return (objc_property_t)MEMORY[0x1896164D8](cls, name);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1895FA578](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FA5A8](a1);
}

double cos(double a1)
{
  return result;
}

double difftime(time_t a1, time_t a2)
{
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1895FAC60]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAC80](group, timeout);
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

void dispatch_release(dispatch_object_t object)
{
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

ether_addr *__cdecl ether_aton(const char *a1)
{
  return (ether_addr *)MEMORY[0x1895FB148](a1);
}

double exp(double a1)
{
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1895FB228](*(void *)&a1, a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1895FB268](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB388](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1895FB420](a1, a2, *(void *)&a3);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1895FB5A0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FB6E0](a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1895FB7D8](a1);
}

double ldexp(double a1, int a2)
{
  return result;
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1895FBA20](a1, a2);
}

double log(double a1)
{
  return result;
}

double log10(double a1)
{
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBEF0](a1, a2);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x189608FE8]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x189608FF0]();
}

uint64_t nw_activity_complete_with_reason_and_underlying_error()
{
  return MEMORY[0x189608FF8]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x189609008]();
}

uint64_t nw_activity_get_domain()
{
  return MEMORY[0x189609018]();
}

uint64_t nw_activity_get_label()
{
  return MEMORY[0x189609020]();
}

uint64_t nw_activity_get_token()
{
  return MEMORY[0x189609028]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x189609040]();
}

uint64_t nw_activity_submit_metrics()
{
  return MEMORY[0x189609050]();
}

uint64_t nw_array_get_count()
{
  return MEMORY[0x189609078]();
}

uint64_t nw_array_get_object_at_index()
{
  return MEMORY[0x189609080]();
}

void nw_connection_cancel(nw_connection_t connection)
{
}

uint64_t nw_connection_copy_attempted_endpoint_array()
{
  return MEMORY[0x189609140]();
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1896091B0](endpoint, parameters);
}

uint64_t nw_connection_end_activity()
{
  return MEMORY[0x1896091D8]();
}

uint64_t nw_connection_get_id()
{
  return MEMORY[0x189609200]();
}

void nw_connection_send( nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x189609300]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

uint64_t nw_connection_set_read_close_handler()
{
  return MEMORY[0x189609320]();
}

uint64_t nw_connection_set_write_close_handler()
{
  return MEMORY[0x189609338]();
}

void nw_connection_start(nw_connection_t connection)
{
}

uint64_t nw_connection_start_activity()
{
  return MEMORY[0x189609348]();
}

uint64_t nw_context_create()
{
  return MEMORY[0x189609430]();
}

uint64_t nw_context_set_isolate_protocol_cache()
{
  return MEMORY[0x189609460]();
}

uint64_t nw_context_set_isolate_protocol_stack()
{
  return MEMORY[0x189609468]();
}

uint64_t nw_context_set_privacy_level()
{
  return MEMORY[0x189609478]();
}

uint64_t nw_context_set_scheduling_mode()
{
  return MEMORY[0x189609480]();
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x189609520](hostname, port);
}

uint64_t nw_endpoint_get_description()
{
  return MEMORY[0x189609550]();
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x189609598](error);
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x1896095A8](error);
}

nw_error_domain_t nw_error_get_error_domain(nw_error_t error)
{
  return MEMORY[0x1896095B0](error);
}

nw_parameters_t nw_parameters_create_secure_tcp( nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x189609A08](configure_tls, configure_tcp);
}

uint64_t nw_parameters_set_context()
{
  return MEMORY[0x189609B10]();
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x189609B18]();
}

void nw_parameters_set_expired_dns_behavior( nw_parameters_t parameters, nw_parameters_expired_dns_behavior_t expired_dns_behavior)
{
}

uint64_t nw_parameters_set_indefinite()
{
  return MEMORY[0x189609B78]();
}

uint64_t nw_parameters_set_initial_data_payload()
{
  return MEMORY[0x189609B80]();
}

uint64_t nw_parameters_set_source_application()
{
  return MEMORY[0x189609C78]();
}

uint64_t nw_parameters_set_tfo()
{
  return MEMORY[0x189609C90]();
}

uint64_t nw_parameters_set_tls_session_id()
{
  return MEMORY[0x189609C98]();
}

uint64_t nw_parameters_set_traffic_class()
{
  return MEMORY[0x189609CA8]();
}

void nw_tcp_options_set_no_delay(nw_protocol_options_t options, BOOL no_delay)
{
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x18960AB98](options);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1896165F8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1895FC250](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FC278](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1895FC600](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1895FC640]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1895FC6D8]();
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x1895FC6E0]();
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x1896169F8](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x189616A00](property);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FCC40](a1);
}

int remove(const char *a1)
{
  return MEMORY[0x1895FCD08](a1);
}

void sec_protocol_options_set_tls_tickets_enabled(sec_protocol_options_t options, BOOL tickets_enabled)
{
}

double sin(double a1)
{
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1C8](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

kern_return_t task_info( task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1895FD320](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

int truncate(const char *a1, off_t a2)
{
  return MEMORY[0x1895FD430](a1, a2);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1895FD4E0](uu);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1895FD780](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1895FDB00](bytes, length);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

uint64_t objc_msgSend__evaluateTriggersForBlacklisting_reason_reasonData_bssid_ssid_state_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__evaluateTriggersForBlacklisting_reason_reasonData_bssid_ssid_state_);
}

uint64_t objc_msgSend__networkActivityRemoveNWConnection_fromActivityWithLabel_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__networkActivityRemoveNWConnection_fromActivityWithLabel_completion_);
}

uint64_t objc_msgSend__networkActivityStop_withReason_withClientMetric_withClientDict_andError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__networkActivityStop_withReason_withClientMetric_withClientDict_andError_);
}

uint64_t objc_msgSend_addRangingRttSampleWithRssi_rtt_snr_flags_channel_coreId_bitErrorRate_phyError_andPeerSnr_andPeerCoreId_andPeerBitErrorRate_andPeerPhyError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_addRangingRttSampleWithRssi_rtt_snr_flags_channel_coreId_bitErrorRate_phyError_andPeerSnr_andPeerCoreId_andPeerBitErrorRate_andPeerPhyError_);
}

uint64_t objc_msgSend_addSoftApClientEvent_identifier_isAppleClient_isInstantHotspot_isAutoHotspot_isHidden_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_addSoftApClientEvent_identifier_isAppleClient_isInstantHotspot_isAutoHotspot_isHidden_);
}

uint64_t objc_msgSend_addSoftApCoexEvent_deniedUnii1ChannelMap_deniedUnii2aChannelMap_deniedUnii2cChannelMap_deniedUnii3ChannelMap_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_addSoftApCoexEvent_deniedUnii1ChannelMap_deniedUnii2aChannelMap_deniedUnii2cChannelMap_deniedUnii3ChannelMap_);
}

uint64_t objc_msgSend_bluetoothStateDidChange_connectedDeviceCount_inA2dp_inSco_inUniAoS_inBiAoS_btAudioBand_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_bluetoothStateDidChange_connectedDeviceCount_inA2dp_inSco_inUniAoS_inBiAoS_btAudioBand_);
}

uint64_t objc_msgSend_bssWithIdentifier_apProfile_apMode_phyMode_channel_channelFlags_channelWidth_rssi_latitude_longitude_isEdgeBss_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_bssWithIdentifier_apProfile_apMode_phyMode_channel_channelFlags_channelWidth_rssi_latitude_longitude_isEdgeBss_);
}

uint64_t objc_msgSend_decodingAttemptsWithRxCrsGlitch_rxBadPLCP_RxBphyCrsGlitch_rxBphyBadPLCP_rxStart_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_decodingAttemptsWithRxCrsGlitch_rxBadPLCP_RxBphyCrsGlitch_rxBphyBadPLCP_rxStart_);
}

uint64_t objc_msgSend_fetch3BarsNetworksForLocation_forceRemote_trigger_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_fetch3BarsNetworksForLocation_forceRemote_trigger_completionHandler_);
}

uint64_t objc_msgSend_fetchEventWithSource_type_trigger_duration_requestCount_resultCount_error_tileKey_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_fetchEventWithSource_type_trigger_duration_requestCount_resultCount_error_tileKey_);
}

uint64_t objc_msgSend_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_withHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_withHandler_);
}

uint64_t objc_msgSend_init_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_init_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays_);
}

uint64_t objc_msgSend_init_subSystem_category_logLifespanInDays_logLevel_logPrivacy_dispatchQueue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_init_subSystem_category_logLifespanInDays_logLevel_logPrivacy_dispatchQueue_);
}

uint64_t objc_msgSend_initWithDirectoryPath_dirPath_fileNamePrefix_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays_dispatchQueue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithDirectoryPath_dirPath_fileNamePrefix_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays_dispatchQueue_);
}

uint64_t objc_msgSend_initWithFilePath_filePath_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays_dispatchQueue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithFilePath_filePath_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays_dispatchQueue_);
}

uint64_t objc_msgSend_initWithInterfaceName_bssEnvironment_andBssDetails_andNetworkDetails_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithInterfaceName_bssEnvironment_andBssDetails_andNetworkDetails_);
}

uint64_t objc_msgSend_initWithRollingWindow_AndDictionary_andContext_andTimestamp_onQueue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithRollingWindow_AndDictionary_andContext_andTimestamp_onQueue_);
}

uint64_t objc_msgSend_initWithRollingWindow_WithIsInvoluntary_AndLinkChangeReason_AndLinkChangeSubreason_AndDuration_andContext_AndTimestamp_onQueue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithRollingWindow_WithIsInvoluntary_AndLinkChangeReason_AndLinkChangeSubreason_AndDuration_andContext_AndTimestamp_onQueue_);
}

uint64_t objc_msgSend_initWithRollingWindow_WithRoamingState_andReasonString_andStatus_asString_andLatency_andRoamData_andCurrentBSSSession_andContext_andPingPongStats_andTimestamp_onQueue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithRollingWindow_WithRoamingState_andReasonString_andStatus_asString_andLatency_andRoamData_andCurrentBSSSession_andContext_andPingPongStats_andTimestamp_onQueue_);
}

uint64_t objc_msgSend_initWithRollingWindow_andCallStatus_andCallDuration_andContext_andTimestamp_onQueue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithRollingWindow_andCallStatus_andCallDuration_andContext_andTimestamp_onQueue_);
}

uint64_t objc_msgSend_initWithRollingWindow_andReason_withWFMeasureResults_andContext_andTimestamp_onQueue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithRollingWindow_andReason_withWFMeasureResults_andContext_andTimestamp_onQueue_);
}

uint64_t objc_msgSend_initWithRollingWindow_andReasonString_andContext_andTimestamp_onQueue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithRollingWindow_andReasonString_andContext_andTimestamp_onQueue_);
}

uint64_t objc_msgSend_ipConfigurationDidChangeWithMethod_dhcpLeaseDuration_hasRoutableIpV4_hasRoutableIpV6_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_ipConfigurationDidChangeWithMethod_dhcpLeaseDuration_hasRoutableIpV4_hasRoutableIpV6_);
}

uint64_t objc_msgSend_joinStateDidChange_withReason_lastDisconnectReason_lastJoinFailure_andNetworkDetails_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_joinStateDidChange_withReason_lastDisconnectReason_lastJoinFailure_andNetworkDetails_);
}

uint64_t objc_msgSend_linkStateDidChange_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_linkStateDidChange_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails_);
}

uint64_t objc_msgSend_networkActivityStop_withReason_withClientMetric_withClientDict_andError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_networkActivityStop_withReason_withClientMetric_withClientDict_andError_);
}

uint64_t objc_msgSend_parseCriteria_intoRequiredFields_andFeatures_forFields_withType_isFilter_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_parseCriteria_intoRequiredFields_andFeatures_forFields_withType_isFilter_);
}

uint64_t objc_msgSend_populateWithBspOverflowed_IsBSPActive_BspTimeToTST_BspSampleDurationMS_IsScanActiveBSP_IsP2PActiveBSP_BspTriggerCount_BspMutePercentage_BspMaxMuteMS_BspAvgMuteMS_BspErrorPercentage_BspTimeOutPercentageOfTriggers_BspRejectOrFailPercentageOfTriggers_BspMaxConsecutiveFails_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_populateWithBspOverflowed_IsBSPActive_BspTimeToTST_BspSampleDurationMS_IsScanActiveBSP_IsP2PActiveBSP_BspTriggerCount_BspMutePercentage_BspMaxMuteMS_BspAvgMuteMS_BspErrorPercentage_BspTimeOutPercentageOfTriggers_BspRejectOrFailPercentageOfTriggers_BspMaxConsecutiveFails_);
}

uint64_t objc_msgSend_populateWithRssi_noise_snr_selfCca_otherCca_interference_totalReportedCca_beaconPer_rxCrsGlitch_rxBadPLCP_rxStart_sampleDuration_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_populateWithRssi_noise_snr_selfCca_otherCca_interference_totalReportedCca_beaconPer_rxCrsGlitch_rxBadPLCP_rxStart_sampleDuration_);
}

uint64_t objc_msgSend_processDriverAvailability_available_version_flags_eventID_reason_subReason_minorReason_reasonString_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_processDriverAvailability_available_version_flags_eventID_reason_subReason_minorReason_reasonString_);
}

uint64_t objc_msgSend_rangingSessionRequestedWithSelfPreferredChannel_selfMainChannel_selfChannelFlags_peerPreferredChannel_peerMainChannel_peerChannelFlags_requester_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_rangingSessionRequestedWithSelfPreferredChannel_selfMainChannel_selfChannelFlags_peerPreferredChannel_peerMainChannel_peerChannelFlags_requester_);
}

uint64_t objc_msgSend_ratePercentagesWithTxRate_rxRate_txFallbackRate_txFrames_rxFrames_nss_bw_phyMode_band_deviceMaxRate_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_ratePercentagesWithTxRate_rxRate_txFallbackRate_txFrames_rxFrames_nss_bw_phyMode_band_deviceMaxRate_);
}

uint64_t objc_msgSend_receivedBssTransitionRequestWithCandidateListIncluded_isAbridged_disassociationImminent_bssTerminationIncluded_essDisassociationImminent_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_receivedBssTransitionRequestWithCandidateListIncluded_isAbridged_disassociationImminent_bssTerminationIncluded_essDisassociationImminent_);
}

uint64_t objc_msgSend_roamingStateDidChange_reason_andStatus_andLatency_andRoamData_andPingPongNth_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_roamingStateDidChange_reason_andStatus_andLatency_andRoamData_andPingPongNth_);
}

uint64_t objc_msgSend_roamingStateDidChange_reason_andStatus_andLatency_andRoamData_andPingPongStats_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_roamingStateDidChange_reason_andStatus_andLatency_andRoamData_andPingPongStats_);
}

uint64_t objc_msgSend_rxDecodingErrorsPercentagesWithRxFrmTooLong_rxFrmTooShrt_rxBadFCS_rxResponseTimeout_rxNoDelim_rxAnyErr_rxFifo0Ovfl_rxFifo1Ovfl_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_rxDecodingErrorsPercentagesWithRxFrmTooLong_rxFrmTooShrt_rxBadFCS_rxResponseTimeout_rxNoDelim_rxAnyErr_rxFifo0Ovfl_rxFifo1Ovfl_);
}

uint64_t objc_msgSend_setCountSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_setCountSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet_);
}

uint64_t objc_msgSend_setSSIDTransitionCandidates_SSIDTransitionPotentialCandidates_potentialCandidatesMinusCandidates_roamCandidates_uniqueChannels_uniqueBands_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_setSSIDTransitionCandidates_SSIDTransitionPotentialCandidates_potentialCandidatesMinusCandidates_roamCandidates_uniqueChannels_uniqueBands_);
}

uint64_t objc_msgSend_setSteeringRequest_preferredChannel_preferredBand_preferredSSID_targetSSIDDiffersFromCurrent_preferredBSS_ssidIsSplit_transitionCandidates_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_setSteeringRequest_preferredChannel_preferredBand_preferredSSID_targetSSIDDiffersFromCurrent_preferredBSS_ssidIsSplit_transitionCandidates_);
}

uint64_t objc_msgSend_setTriggerForNetworkWithReasonAndState_reason_reasonData_bssid_state_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_setTriggerForNetworkWithReasonAndState_reason_reasonData_bssid_state_);
}

uint64_t objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_);
}

uint64_t objc_msgSend_softApStateDidChange_requester_status_changeReason_channelNumber_countryCode_isHidden_isInfraConnected_isAwdlUp_lowPowerModeDuration_compatibilityMode_requestToUpLatency_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_softApStateDidChange_requester_status_changeReason_channelNumber_countryCode_isHidden_isInfraConnected_isAwdlUp_lowPowerModeDuration_compatibilityMode_requestToUpLatency_);
}

uint64_t objc_msgSend_txErrorsPercentagesWithtxSuccess_txDropped_txNoBuff_txNoRes_txNoAck_txChipModeErr_txExpired_txFail_txFwFree_txMaxRetries_txForceExpire_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_txErrorsPercentagesWithtxSuccess_txDropped_txNoBuff_txNoRes_txNoAck_txChipModeErr_txExpired_txFail_txFwFree_txMaxRetries_txForceExpire_);
}

uint64_t objc_msgSend_updateSleepPowerStats_unassociatedDuration_associatedDuration_roamingDuration_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_updateSleepPowerStats_unassociatedDuration_associatedDuration_roamingDuration_);
}

uint64_t objc_msgSend_updateWithChQualScore_txLatencyScore_rxLatencyScore_txLossScore_rxLossScore_txLatencyP95_linkRecommendationFlags_rtTrafficStatus_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_updateWithChQualScore_txLatencyScore_rxLatencyScore_txLossScore_rxLossScore_txLatencyP95_linkRecommendationFlags_rtTrafficStatus_);
}

uint64_t objc_msgSend_updateWithTxBytes_RxBytes_TxL3Packets_RxL3Packets_txBytesSecondary_rxBytesSecondary_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_updateWithTxBytes_RxBytes_TxL3Packets_RxL3Packets_txBytesSecondary_rxBytesSecondary_);
}