@interface __NSURLSessionStatistics
+ (void)reportMetricsToSymptoms:(id)a3;
@end

@implementation __NSURLSessionStatistics

+ (void)reportMetricsToSymptoms:(id)a3
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  objc_msgSend(v3, "_private_nw_activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (objc_msgSend(v3, "_private_nw_activity"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        int is_selected_for_reporting = nw_activity_is_selected_for_reporting(),
        v5,
        v4,
        is_selected_for_reporting))
  {
    v7 = +[__NSURLSessionStatistics createCFNetworkTaskMetrics_s:]( &OBJC_CLASS_____NSURLSessionStatistics,  "createCFNetworkTaskMetrics_s:",  v3);
    if (v7)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      v8 = (os_log_s *)(id)CFNLog::logger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        unint64_t var7 = v7->var7;
        LODWORD(v41) = 134217984;
        *(void *)((char *)&v41 + 4) = var7;
        _os_log_debug_impl( &dword_18298D000,  v8,  OS_LOG_TYPE_DEBUG,  "[Telemetry]: Calling symptoms. The number of transactions are %llu",  (uint8_t *)&v41,  0xCu);
      }

      uint64_t v9 = 120 * v7->var7 + 104;
      double Helper_x8__symptom_framework_init = gotLoadHelper_x8__symptom_framework_init(v10);
      uint64_t v13 = *(void *)(v12 + 2656);
      BOOL v14 = v14 || v13 == 0;
      if (!v14)
      {
        symptom_new_delayInitStub(Helper_x8__symptom_framework_init);
        symptom_set_qualifier_delayInitStub(v15);
        symptom_set_additional_qualifier_delayInitStub(v16);
        if (os_variant_has_internal_diagnostics()
          && nw_activity_should_write_metric_stream_to_log())
        {
          v18 = -[__NSURLSessionStatistics initWithCFNetworkReport:length:]( objc_alloc(&OBJC_CLASS_____NSURLSessionStatistics),  "initWithCFNetworkReport:length:",  v7,  v9);
          v19 = -[__NSURLSessionStatistics dictionaryReport](v18, "dictionaryReport");
          if (v19)
          {
            __CFNPopulateTransactionMetrics(v7, v19);
            *(void *)&__int128 v41 = MEMORY[0x1895F87A8];
            *((void *)&v41 + 1) = 3221225472LL;
            v42 = ___Z28__CFNReportMetricsToSymptomsPvm_block_invoke;
            v43 = &unk_189C1A548;
            v44 = v19;
            dispatch_async((dispatch_queue_t)logQueue, &v41);
          }
        }

        else
        {
          symptom_send_delayInitStub(v17);
        }
      }
    }
  }

  else
  {
    v7 = 0LL;
  }

  objc_msgSend(v3, "_private_nw_activity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_nw_activity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v22 = v20 == v21;

  if (!v22)
  {
    objc_msgSend(v3, "_private_nw_activity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v24 = v23 == 0LL;

    if (!v24)
    {
      objc_msgSend(v3, "_private_nw_activity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 error];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      nw_activity_complete_with_reason();
    }
  }

  objc_opt_self();
  if (os_variant_has_internal_diagnostics())
  {
    if (nw_settings_networkscore_metrics_enabled())
    {
      if (v7
        || (v7 = +[__NSURLSessionStatistics createCFNetworkTaskMetrics_s:]( &OBJC_CLASS_____NSURLSessionStatistics,  "createCFNetworkTaskMetrics_s:",  v3)) != 0LL)
      {
        objc_msgSend(v3, "_private_nw_activity");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v28 = v27 == 0LL;

        if (!v28)
        {
          objc_msgSend(v3, "_private_nw_activity");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t domain = nw_activity_get_domain();
          uint64_t label = nw_activity_get_label();
          unint64_t v32 = v7->var7;
          [v3 _effectiveConfiguration];
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          [v33 _sourceApplicationBundleIdentifier];
          v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (setupNetworkScoreReporting(void)::sInitNetworkScoreReporting != -1) {
            dispatch_once( &setupNetworkScoreReporting(void)::sInitNetworkScoreReporting,  &__block_literal_global_37_17424);
          }
          uint64_t v35 = setupNetworkScoreReporting(void)::networkScoreReporting;
          if (setupNetworkScoreReporting(void)::networkScoreReporting)
          {
            if (!v34)
            {
              if (objc_msgSend((id)objc_msgSend(MEMORY[0x1896077F8], "mainBundle"), "bundleIdentifier")) {
                v34 = (__CFString *)objc_msgSend( (id)objc_msgSend(MEMORY[0x1896077F8], "mainBundle"),  "bundleIdentifier");
              }
              else {
                v34 = @"Not Available";
              }
            }

            uint32_t networkscore_sampling_rate_denominator = nw_settings_get_networkscore_sampling_rate_denominator();
            if (!arc4random_uniform(networkscore_sampling_rate_denominator))
            {
              if (120 * v32 == -104LL)
              {
                if (CFNLog::onceToken != -1) {
                  dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
                }
                v39 = (os_log_s *)CFNLog::logger;
                if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v41) = 0;
                  _os_log_debug_impl( &dword_18298D000,  v39,  OS_LOG_TYPE_DEBUG,  "[NETWORKSCORE] return because the report is empty",  (uint8_t *)&v41,  2u);
                }
              }

              else
              {
                v37 = -[__NSURLSessionStatistics initWithCFNetworkReport:length:]( objc_alloc(&OBJC_CLASS_____NSURLSessionStatistics),  "initWithCFNetworkReport:length:",  v7,  120 * v32 + 104);
                v38 = -[__NSURLSessionStatistics dictionaryReport](v37, "dictionaryReport");
                if (v38)
                {
                  __CFNPopulateTransactionMetrics(v7, v38);
                  -[NSMutableDictionary setValue:forKey:]( v38,  "setValue:forKey:",  [MEMORY[0x189607968] numberWithInt:domain],  @"activityDomain");
                  -[NSMutableDictionary setValue:forKey:]( v38,  "setValue:forKey:",  [MEMORY[0x189607968] numberWithInt:label],  @"activityLabel");
                  *(void *)&__int128 v41 = MEMORY[0x1895F87A8];
                  *((void *)&v41 + 1) = 3221225472LL;
                  v42 = ___Z30__CFNReportNetworkScoreMetricsPvmPK10__CFStringjj_block_invoke;
                  v43 = &unk_189C1A610;
                  v44 = v38;
                  v45 = v34;
                  uint64_t v46 = v35;
                  dispatch_async((dispatch_queue_t)logQueue, &v41);
                }
              }
            }
          }
        }
      }
    }
  }

  free(v7);
}

@end