@interface WiFiSoftError
+ (void)_cloudAssetsFetchHandler:(id)a3;
+ (void)_submitSummaryReportMetric;
+ (void)_updateHUDWithMessage:(id)a3;
- (BOOL)_maxNonUIActionsReachedFor:(id)a3;
- (BOOL)_maxUIActionsReachedFor:(id)a3;
- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3;
- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3 completionHandler:(id)a4;
- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3 timeout:(double)a4;
- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
- (NSMutableArray)abcSubmissionTimestamps;
- (NSMutableArray)askToLaunchTapToRadarTimestamps;
- (NSMutableArray)hudTimestamps;
- (NSMutableArray)occurrenceTimestamps;
- (NSMutableArray)simulateCrashTimestamps;
- (NSMutableArray)tapToRadarTimestamps;
- (NSMutableString)logMessage;
- (NSNumber)lastTimestamp;
- (NSString)metricEventName;
- (NSString)name;
- (SDRDiagnosticReporter)abcReporter;
- (WiFiSoftError)initWithName:(id)a3;
- (WiFiSoftError)initWithName:(id)a3 andParams:(id)a4;
- (double)creationDate;
- (id)appendLogMessage:(id)a3 includeTimestamp:(BOOL)a4;
- (id)incrementCount;
- (id)submitABCReportWithReason:(id)a3;
- (id)submitMetric;
- (id)submitMetricWithData:(id)a3;
- (id)tapToRadarWithURL:(id)a3 completionHandler:(id)a4;
- (id)updateHUDWithMessage:(id)a3;
- (int64_t)_countOf:(id)a3 withinInterval:(double)a4;
- (int64_t)count;
- (int64_t)enabled;
- (int64_t)intervalForMaxNonUIActions;
- (int64_t)intervalForMaxUIActions;
- (int64_t)maxLogMessageLength;
- (int64_t)maxNonUIActions;
- (int64_t)maxOccurrences;
- (int64_t)maxUIActions;
- (int64_t)metricSubmissionSamplingRate;
- (int64_t)metricsEnabled;
- (int64_t)recentCountWithinTimeInterval:(double)a3;
- (void)_addConfigurationData:(id)a3;
- (void)_addGenericMetricData:(id)a3;
- (void)_recordCurrentTimestampIn:(id)a3;
- (void)_resetCount;
- (void)clearLogMessage;
- (void)dealloc;
- (void)resetCount;
- (void)setAbcReporter:(id)a3;
- (void)setAbcSubmissionTimestamps:(id)a3;
- (void)setAskToLaunchTapToRadarTimestamps:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setEnabled:(int64_t)a3;
- (void)setHudTimestamps:(id)a3;
- (void)setLastTimestamp:(id)a3;
- (void)setLogMessage:(id)a3;
- (void)setMetricEventName:(id)a3;
- (void)setMetricsEnabled:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setOccurrenceTimestamps:(id)a3;
- (void)setSimulateCrashTimestamps:(id)a3;
- (void)setTapToRadarTimestamps:(id)a3;
- (void)writeLogMessage;
@end

@implementation WiFiSoftError

- (WiFiSoftError)initWithName:(id)a3
{
  return -[WiFiSoftError initWithName:andParams:](self, "initWithName:andParams:", a3, 0LL);
}

- (WiFiSoftError)initWithName:(id)a3 andParams:(id)a4
{
  uint64_t v143 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    BOOL v17 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v17) {
      -[WiFiSoftError initWithName:andParams:].cold.6(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_9;
  }

  if ((os_variant_is_recovery() & 1) != 0 || (os_variant_is_darwinos() & 1) != 0 || MGGetBoolAnswer())
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v9) {
      -[WiFiSoftError initWithName:andParams:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
LABEL_9:
    v25 = 0LL;
    v26 = self;
    goto LABEL_10;
  }

  v113 = v8;
  id v114 = v7;
  if (!queue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v29 = dispatch_queue_create("com.apple.wifi.softerror", v28);
    v30 = (void *)queue;
    queue = (uint64_t)v29;
  }

  if (!logPtr)
  {
    os_log_t v31 = os_log_create("com.apple.wifi.softerror", "");
    v32 = (void *)logPtr;
    logPtr = (uint64_t)v31;
  }

  p_cache = &OBJC_CLASS___TBNetworkRemoteFetchResponse.cache;
  if (!currentSoftErrors)
  {
    uint64_t v34 = [MEMORY[0x189603FE0] set];
    v35 = (void *)currentSoftErrors;
    currentSoftErrors = v34;
  }

  if (!metricTimer)
  {
    dispatch_source_t v36 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)queue);
    v37 = (void *)metricTimer;
    metricTimer = (uint64_t)v36;

    dispatch_source_set_event_handler((dispatch_source_t)metricTimer, &__block_literal_global_11);
    v38 = (dispatch_source_s *)metricTimer;
    dispatch_time_t v39 = dispatch_time(0LL, 86400000000000LL);
    dispatch_source_set_timer(v38, v39, 0x4E94914F0000uLL, 0LL);
    dispatch_activate((dispatch_object_t)metricTimer);
  }

  objc_storeStrong((id *)&self->_name, a3);
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  v26 = (WiFiSoftError *)(id)[(id)currentSoftErrors copy];
  uint64_t v40 = -[WiFiSoftError countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v116,  v142,  16LL);
  if (v40)
  {
    uint64_t v41 = v40;
    char v42 = 0;
    uint64_t v43 = *(void *)v117;
    do
    {
      for (uint64_t i = 0LL; i != v41; ++i)
      {
        if (*(void *)v117 != v43) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(*((void *)&v116 + 1) + 8 * i) pointerValue];
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        [v45 name];
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        char v47 = [v46 isEqualToString:self->_name];

        v42 |= v47;
      }

      uint64_t v41 = -[WiFiSoftError countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v116,  v142,  16LL);
    }

    while (v41);

    p_cache = (void **)(&OBJC_CLASS___TBNetworkRemoteFetchResponse + 16);
    if ((v42 & 1) != 0)
    {
      id v8 = v113;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        -[WiFiSoftError initWithName:andParams:].cold.5();
      }

      v25 = 0LL;
      v26 = self;
      id v7 = v114;
      goto LABEL_10;
    }
  }

  else
  {
  }

  v115.receiver = self;
  v115.super_class = (Class)&OBJC_CLASS___WiFiSoftError;
  v25 = -[WiFiSoftError init](&v115, sel_init);
  id v8 = v113;
  [v113 objectForKeyedSubscript:@"maxOccurrences"];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v49 = [v48 integerValue];
  BOOL v50 = v49 <= -1 || v48 == 0LL;
  uint64_t v51 = 100LL;
  if (!v50) {
    uint64_t v51 = v49;
  }
  v25->_int64_t maxOccurrences = v51;
  [v113 objectForKeyedSubscript:@"metricSubmissionSamplingRate"];
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v53 = [v52 integerValue];
  BOOL v55 = v53 >= 101 || v53 <= -1 || v52 == 0LL;
  uint64_t v56 = 30LL;
  if (!v55) {
    uint64_t v56 = v53;
  }
  v25->_int64_t metricSubmissionSamplingRate = v56;
  [v113 objectForKeyedSubscript:@"maxNonUIActions"];
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v58 = [v57 integerValue];
  BOOL v59 = v58 <= -1 || v57 == 0LL;
  uint64_t v60 = 5LL;
  if (!v59) {
    uint64_t v60 = v58;
  }
  v25->_int64_t maxNonUIActions = v60;
  [v113 objectForKeyedSubscript:@"intervalForMaxNonUIActions"];
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v62 = [v61 integerValue];
  BOOL v63 = v62 <= -1 || v61 == 0LL;
  uint64_t v64 = 120LL;
  if (!v63) {
    uint64_t v64 = v62;
  }
  v25->_int64_t intervalForMaxNonUIActions = v64;
  [v113 objectForKeyedSubscript:@"maxUIActions"];
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v66 = [v65 integerValue];
  BOOL v67 = v66 <= -1 || v65 == 0LL;
  uint64_t v68 = 2LL;
  if (!v67) {
    uint64_t v68 = v66;
  }
  v25->_int64_t maxUIActions = v68;
  [v113 objectForKeyedSubscript:@"intervalForMaxUIActions"];
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v70 = [v69 integerValue];
  BOOL v71 = v70 <= -1 || v69 == 0LL;
  uint64_t v72 = 86400LL;
  if (!v71) {
    uint64_t v72 = v70;
  }
  v25->_int64_t intervalForMaxUIActions = v72;
  [v113 objectForKeyedSubscript:@"maxLogMessageLength"];
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v74 = [v73 integerValue];
  BOOL v75 = v74 <= -1 || v73 == 0LL;
  uint64_t v76 = 1000LL;
  if (!v75) {
    uint64_t v76 = v74;
  }
  v25->_int64_t maxLogMessageLength = v76;
  v77 = p_cache[321];
  [MEMORY[0x189607B18] valueWithNonretainedObject:v25];
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  [v77 addObject:v78];

  [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
  v25->_creationDate = v79;
  *(int64x2_t *)&v25->_int64_t enabled = vdupq_n_s64(1uLL);
  p_int64_t enabled = &v25->_enabled;
  v81 = (void *)NSString;
  name = v25->_name;
  [MEMORY[0x189607810] URLUserAllowedCharacterSet];
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = -[NSString stringByAddingPercentEncodingWithAllowedCharacters:]( name,  "stringByAddingPercentEncodingWithAllowedCharacters:",  v83);
  uint64_t v85 = [v81 stringWithFormat:@"%@.%@", @"com.apple.wifi.softerror", v84];
  metricEventName = v25->_metricEventName;
  v25->_metricEventName = (NSString *)v85;

  if ((cloudAssetsQueried & 1) == 0)
  {
    BOOL v87 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v87) {
      -[WiFiSoftError initWithName:andParams:].cold.4(v87, v88, v89, v90, v91, v92, v93, v94);
    }
    +[WCAFetchWiFiBehaviorParameters fetchWiFiBehaviorWithCompletion:]( &OBJC_CLASS___WCAFetchWiFiBehaviorParameters,  "fetchWiFiBehaviorWithCompletion:",  &__block_literal_global_36);
    cloudAssetsQueried = 1;
  }

  id v7 = v114;
  if (cloudAssets)
  {
    [(id)cloudAssets objectForKey:v25->_name];
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v95;
    if (v95)
    {
      [v95 objectForKey:@"enabled"];
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v98 = [v97 integerValue];
      if (v97)
      {
        unint64_t v99 = v98;
        if (v98 <= 1 && *p_enabled != v98)
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
            -[WiFiSoftError initWithName:andParams:].cold.3();
          }
          void *p_enabled = v99;
        }
      }

      [v96 objectForKey:@"metricsEnabled"];
      v100 = (void *)objc_claimAutoreleasedReturnValue();

      unint64_t v101 = [v100 integerValue];
      if (v100)
      {
        unint64_t v102 = v101;
        if (v101 <= 1 && v25->_metricsEnabled != v101)
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
            -[WiFiSoftError initWithName:andParams:].cold.2();
          }
          v25->_int64_t metricsEnabled = v102;
        }
      }
    }
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int64_t enabled = v25->_enabled;
    int64_t metricsEnabled = v25->_metricsEnabled;
    int64_t maxOccurrences = v25->_maxOccurrences;
    int64_t metricSubmissionSamplingRate = v25->_metricSubmissionSamplingRate;
    int64_t maxNonUIActions = v25->_maxNonUIActions;
    int64_t intervalForMaxNonUIActions = v25->_intervalForMaxNonUIActions;
    int64_t maxUIActions = v25->_maxUIActions;
    int64_t intervalForMaxUIActions = v25->_intervalForMaxUIActions;
    int64_t maxLogMessageLength = v25->_maxLogMessageLength;
    v112 = v25->_name;
    *(_DWORD *)buf = 136317698;
    v121 = "-[WiFiSoftError initWithName:andParams:]";
    __int16 v122 = 2112;
    v123 = v112;
    __int16 v124 = 2048;
    int64_t v125 = enabled;
    __int16 v126 = 2048;
    int64_t v127 = metricsEnabled;
    __int16 v128 = 2048;
    int64_t v129 = maxOccurrences;
    __int16 v130 = 2048;
    int64_t v131 = metricSubmissionSamplingRate;
    __int16 v132 = 2048;
    int64_t v133 = maxNonUIActions;
    __int16 v134 = 2048;
    int64_t v135 = intervalForMaxNonUIActions;
    __int16 v136 = 2048;
    int64_t v137 = maxUIActions;
    __int16 v138 = 2048;
    int64_t v139 = intervalForMaxUIActions;
    __int16 v140 = 2048;
    int64_t v141 = maxLogMessageLength;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Created SoftError <%@>, enabled <%ld>, metricsEnabled <%ld>, params <%ld, %ld, %ld, %ld, %ld, %ld, %ld>",  buf,  0x70u);
  }

LABEL_10:
  return v25;
}

uint64_t __40__WiFiSoftError_initWithName_andParams___block_invoke()
{
  return +[WiFiSoftError _submitSummaryReportMetric](&OBJC_CLASS___WiFiSoftError, "_submitSummaryReportMetric");
}

uint64_t __40__WiFiSoftError_initWithName_andParams___block_invoke_34(uint64_t a1, uint64_t a2)
{
  return +[WiFiSoftError _cloudAssetsFetchHandler:](&OBJC_CLASS___WiFiSoftError, "_cloudAssetsFetchHandler:", a2);
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    *(_DWORD *)buf = 136315394;
    BOOL v9 = "-[WiFiSoftError dealloc]";
    __int16 v10 = 2112;
    uint64_t v11 = name;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s: Dealloc SoftError <%@>", buf, 0x16u);
  }

  if (self->_hudTimestamps)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v9 = "-[WiFiSoftError dealloc]";
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s: Clearing HUD...", buf, 0xCu);
    }

    +[WiFiSoftError _updateHUDWithMessage:](&OBJC_CLASS___WiFiSoftError, "_updateHUDWithMessage:", 0LL);
  }

  v4 = (void *)currentSoftErrors;
  [MEMORY[0x189607B18] valueWithNonretainedObject:self];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 removeObject:v5];

  if (![(id)currentSoftErrors count])
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v9 = "-[WiFiSoftError dealloc]";
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s: Final dealloc", buf, 0xCu);
    }

    if (metricTimer)
    {
      dispatch_source_cancel((dispatch_source_t)metricTimer);
      v6 = (void *)metricTimer;
      metricTimer = 0LL;
    }
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___WiFiSoftError;
  -[WiFiSoftError dealloc](&v7, sel_dealloc);
}

- (id)incrementCount
{
  uint64_t v8 = 0LL;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = __Block_byref_object_copy__6;
  uint64_t v12 = __Block_byref_object_dispose__6;
  id v13 = 0LL;
  if (_os_feature_enabled_impl() && !MGGetBoolAnswer())
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __31__WiFiSoftError_incrementCount__block_invoke;
    v7[3] = &unk_18A16E2A0;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync((dispatch_queue_t)queue, v7);
  }

  else
  {
    uint64_t v3 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:45 userInfo:0];
    v4 = (void *)v9[5];
    v9[5] = v3;
  }

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __31__WiFiSoftError_incrementCount__block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 72))
  {
    unint64_t v4 = [*(id *)(v2 + 96) count];
    id v5 = *(void **)v3;
    if (v4 >= *(void *)(*(void *)v3 + 8LL))
    {
      uint64_t v12 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:12 userInfo:0];
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        __31__WiFiSoftError_incrementCount__block_invoke_cold_1();
      }
    }

    else
    {
      uint64_t v6 = v5[12];
      if (!v6)
      {
        uint64_t v7 = [MEMORY[0x189603FA8] array];
        uint64_t v8 = *(void **)(*(void *)v3 + 96LL);
        *(void *)(*(void *)v3 + 96LL) = v7;

        id v5 = *(void **)v3;
        uint64_t v6 = *(void *)(*(void *)v3 + 96LL);
      }

      [v5 _recordCurrentTimestampIn:v6];
    }
  }

  else
  {
    uint64_t v9 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:82 userInfo:0];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }

- (void)resetCount
{
  if (_os_feature_enabled_impl())
  {
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __27__WiFiSoftError_resetCount__block_invoke;
      block[3] = &unk_18A16C770;
      block[4] = self;
      dispatch_sync((dispatch_queue_t)queue, block);
    }
  }

uint64_t __27__WiFiSoftError_resetCount__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetCount];
}

- (int64_t)count
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = -1LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __22__WiFiSoftError_count__block_invoke;
  v4[3] = &unk_18A16E2A0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)queue, v4);
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void *__22__WiFiSoftError_count__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[9])
  {
    result = (void *)[result _countOf:result[12] withinInterval:9.22337204e18];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  }

  return result;
}

- (int64_t)recentCountWithinTimeInterval:(double)a3
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  uint64_t v11 = -1LL;
  if (_os_feature_enabled_impl() && !MGGetBoolAnswer())
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __47__WiFiSoftError_recentCountWithinTimeInterval___block_invoke;
    block[3] = &unk_18A16E2C8;
    block[4] = self;
    void block[5] = &v8;
    *(double *)&block[6] = a3;
    dispatch_sync((dispatch_queue_t)queue, block);
  }

  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void *__47__WiFiSoftError_recentCountWithinTimeInterval___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[9])
  {
    result = (void *)[result _countOf:result[12] withinInterval:*(double *)(a1 + 48)];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  }

  return result;
}

- (id)appendLogMessage:(id)a3 includeTimestamp:(BOOL)a4
{
  id v6 = a3;
  uint64_t v16 = 0LL;
  BOOL v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = __Block_byref_object_copy__6;
  uint64_t v20 = __Block_byref_object_dispose__6;
  id v21 = 0LL;
  if (_os_feature_enabled_impl() && !MGGetBoolAnswer())
  {
    uint64_t v10 = (dispatch_queue_s *)queue;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __51__WiFiSoftError_appendLogMessage_includeTimestamp___block_invoke;
    v12[3] = &unk_18A16E2F0;
    v12[4] = self;
    BOOL v15 = a4;
    id v13 = v6;
    uint64_t v14 = &v16;
    dispatch_sync(v10, v12);
    id v9 = (id)v17[5];
  }

  else
  {
    uint64_t v7 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:45 userInfo:0];
    uint64_t v8 = (void *)v17[5];
    v17[5] = v7;

    id v9 = (id)v17[5];
  }

  _Block_object_dispose(&v16, 8);

  return v9;
}

void __51__WiFiSoftError_appendLogMessage_includeTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  int64_t v2 = *(void **)(a1 + 32);
  if (v2[9])
  {
    unint64_t v4 = (void *)v2[14];
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x189607940] stringWithFormat:@"[name <%@>] ", v2[8]];
      id v6 = *(void **)(*(void *)v3 + 112LL);
      *(void *)(*(void *)v3 + 112LL) = v5;

      unint64_t v4 = *(void **)(*(void *)v3 + 112LL);
    }

    uint64_t v7 = [v4 length];
    uint64_t v8 = [*(id *)(a1 + 40) length];
    uint64_t v9 = *(void *)(a1 + 32);
    if ((unint64_t)(v8 + v7) >= *(void *)(v9 + 56))
    {
      uint64_t v13 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:12 userInfo:0];
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8LL);
      BOOL v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        __51__WiFiSoftError_appendLogMessage_includeTimestamp___block_invoke_cold_1();
      }
    }

    else if (*(_BYTE *)(a1 + 56))
    {
      [MEMORY[0x189603F50] date];
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      [*(id *)(*(void *)(a1 + 32) + 112) appendFormat:@"[date <%@> logStr <%@>] ", v16, *(void *)(a1 + 40)];
    }

    else
    {
      [*(id *)(v9 + 112) appendFormat:@"[logStr <%@>] ", *(void *)(a1 + 40)];
    }
  }

  else
  {
    uint64_t v10 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:82 userInfo:0];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

- (NSMutableString)logMessage
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0LL;
  if (_os_feature_enabled_impl() && !MGGetBoolAnswer())
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __27__WiFiSoftError_logMessage__block_invoke;
    v5[3] = &unk_18A16E2A0;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync((dispatch_queue_t)queue, v5);
  }

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableString *)v3;
}

void __27__WiFiSoftError_logMessage__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 72))
  {
    uint64_t v3 = [*(id *)(v1 + 112) copy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }

- (void)clearLogMessage
{
  if (_os_feature_enabled_impl())
  {
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __32__WiFiSoftError_clearLogMessage__block_invoke;
      block[3] = &unk_18A16C770;
      block[4] = self;
      dispatch_sync((dispatch_queue_t)queue, block);
    }
  }

void __32__WiFiSoftError_clearLogMessage__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 72))
  {
    int64_t v2 = *(void **)(v1 + 112);
    *(void *)(v1 + 112) = 0LL;
  }

- (void)writeLogMessage
{
  if (_os_feature_enabled_impl())
  {
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __32__WiFiSoftError_writeLogMessage__block_invoke;
      block[3] = &unk_18A16C770;
      block[4] = self;
      dispatch_sync((dispatch_queue_t)queue, block);
    }
  }

void __32__WiFiSoftError_writeLogMessage__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (*(void *)(*(void *)(a1 + 32) + 72LL))
  {
    int64_t v2 = (void *)logPtr;
    if (os_log_type_enabled((os_log_t)logPtr, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(v3 + 112);
      uint64_t v5 = *(void **)(v3 + 96);
      uint64_t v6 = v2;
      int v7 = 138412546;
      uint64_t v8 = v4;
      __int16 v9 = 2048;
      uint64_t v10 = [v5 count];
      _os_log_impl(&dword_187EBF000, v6, OS_LOG_TYPE_DEFAULT, "%@ [count <%ld>]", (uint8_t *)&v7, 0x16u);
    }
  }

- (id)submitMetric
{
  uint64_t v8 = 0LL;
  __int16 v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = __Block_byref_object_copy__6;
  uint64_t v12 = __Block_byref_object_dispose__6;
  id v13 = 0LL;
  if (_os_feature_enabled_impl()
    && ((MEMORY[0x18960DAA8] != 0LL) & ~MGGetBoolAnswer()) != 0)
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __29__WiFiSoftError_submitMetric__block_invoke;
    v7[3] = &unk_18A16E2A0;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync((dispatch_queue_t)queue, v7);
  }

  else
  {
    uint64_t v3 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:45 userInfo:0];
    uint64_t v4 = (void *)v9[5];
    v9[5] = v3;
  }

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __29__WiFiSoftError_submitMetric__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (id *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 72) && *(void *)(v2 + 80))
  {
    if (*((void *)*v3 + 2) <= (uint64_t)arc4random_uniform(0x64u))
    {
      uint64_t v10 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:35 userInfo:0];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        __29__WiFiSoftError_submitMetric__block_invoke_cold_1();
      }
    }

    else
    {
      [NSString stringWithFormat:@"%@.%@", @"com.apple.wifi.softerror", @"generic"];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
      [*v3 _addGenericMetricData:v5];
      if ([v5 count])
      {
        [v5 setObject:*((void *)*v3 + 8) forKey:@"name"];
        id v13 = v5;
        AnalyticsSendEventLazy();
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = (void *)*((void *)*v3 + 8);
          *(_DWORD *)buf = 136315650;
          BOOL v15 = "-[WiFiSoftError submitMetric]_block_invoke_2";
          __int16 v16 = 2112;
          id v17 = v6;
          __int16 v18 = 2112;
          uint64_t v19 = v4;
          _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: SoftError <%@> submitted metric <%@>",  buf,  0x20u);
        }
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        BOOL v15 = "-[WiFiSoftError submitMetric]_block_invoke";
        __int16 v16 = 2112;
        id v17 = v5;
        _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA8],  OS_LOG_TYPE_DEFAULT,  "%s: SoftError metric dictionary <%@>",  buf,  0x16u);
      }
    }
  }

  else
  {
    uint64_t v7 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:82 userInfo:0];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
    __int16 v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }

id __29__WiFiSoftError_submitMetric__block_invoke_57(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)submitMetricWithData:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  __int16 v16 = __Block_byref_object_copy__6;
  id v17 = __Block_byref_object_dispose__6;
  id v18 = 0LL;
  if (_os_feature_enabled_impl()
    && ((MEMORY[0x18960DAA8] != 0LL) & ~MGGetBoolAnswer()) != 0)
  {
    uint64_t v8 = (dispatch_queue_s *)queue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __38__WiFiSoftError_submitMetricWithData___block_invoke;
    block[3] = &unk_18A16E318;
    block[4] = self;
    uint64_t v12 = &v13;
    id v11 = v4;
    dispatch_sync(v8, block);
    id v7 = (id)v14[5];
  }

  else
  {
    uint64_t v5 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:45 userInfo:0];
    uint64_t v6 = (void *)v14[5];
    v14[5] = v5;

    id v7 = (id)v14[5];
  }

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __38__WiFiSoftError_submitMetricWithData___block_invoke(void *a1)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (id *)(a1 + 4);
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 72) && *(void *)(v2 + 80))
  {
    if (*((void *)*v3 + 2) <= (uint64_t)arc4random_uniform(0x64u))
    {
      uint64_t v8 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:35 userInfo:0];
      uint64_t v9 = *(void *)(a1[6] + 8LL);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        __38__WiFiSoftError_submitMetricWithData___block_invoke_cold_1();
      }
    }

    else
    {
      if (a1[5]) {
        id v4 = (id)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:a1[5]];
      }
      else {
        id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
      }
      id v11 = v4;
      [*v3 _addGenericMetricData:v4];
      if ([v11 count])
      {
        [v11 setObject:*((void *)*v3 + 8) forKey:@"name"];
        id v14 = v11;
        AnalyticsSendEventLazy();
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = (void *)*((void *)*v3 + 8);
          uint64_t v13 = *((void *)*v3 + 15);
          *(_DWORD *)buf = 136315650;
          __int16 v16 = "-[WiFiSoftError submitMetricWithData:]_block_invoke_2";
          __int16 v17 = 2112;
          id v18 = v12;
          __int16 v19 = 2112;
          uint64_t v20 = v13;
          _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: SoftError <%@> submitted metric <%@>",  buf,  0x20u);
        }
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v16 = "-[WiFiSoftError submitMetricWithData:]_block_invoke";
        __int16 v17 = 2112;
        id v18 = v11;
        _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA8],  OS_LOG_TYPE_DEFAULT,  "%s: SoftError metric dictionary <%@>",  buf,  0x16u);
      }
    }
  }

  else
  {
    uint64_t v5 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:82 userInfo:0];
    uint64_t v6 = *(void *)(a1[6] + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

id __38__WiFiSoftError_submitMetricWithData___block_invoke_60(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)submitABCReportWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  __int16 v16 = __Block_byref_object_copy__6;
  __int16 v17 = __Block_byref_object_dispose__6;
  id v18 = 0LL;
  if (_os_feature_enabled_impl() && (MGGetBoolAnswer() & 1) == 0 && objc_opt_class())
  {
    uint64_t v5 = (dispatch_queue_s *)queue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __43__WiFiSoftError_submitABCReportWithReason___block_invoke;
    block[3] = &unk_18A16E318;
    block[4] = self;
    uint64_t v12 = &v13;
    id v11 = v4;
    dispatch_sync(v5, block);
    id v6 = (id)v14[5];
  }

  else
  {
    uint64_t v7 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:45 userInfo:0];
    uint64_t v8 = (void *)v14[5];
    v14[5] = v7;

    id v6 = (id)v14[5];
  }

  _Block_object_dispose(&v13, 8);

  return v6;
}

void __43__WiFiSoftError_submitABCReportWithReason___block_invoke(void *a1)
{
  uint64_t v3 = (uint64_t)(a1 + 4);
  uint64_t v2 = (void *)a1[4];
  if (v2[9])
  {
    if ([v2 _maxNonUIActionsReachedFor:v2[17]])
    {
      uint64_t v4 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:35 userInfo:0];
      uint64_t v5 = *(void *)(a1[6] + 8LL);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        __43__WiFiSoftError_submitABCReportWithReason___block_invoke_cold_1(v3, v7, v8, v9, v10, v11, v12, v13);
      }
    }

    else
    {
      uint64_t v17 = *(void *)v3;
      id v18 = *(void **)(*(void *)v3 + 128LL);
      if (!v18)
      {
        id v19 = objc_alloc_init(MEMORY[0x189612A50]);
        uint64_t v20 = *(void **)(*(void *)v3 + 128LL);
        *(void *)(*(void *)v3 + 128LL) = v19;

        uint64_t v17 = *(void *)v3;
        id v18 = *(void **)(*(void *)v3 + 128LL);
      }

      uint64_t v21 = *(void *)(v17 + 64);
      uint64_t v22 = a1[5];
      [MEMORY[0x1896079D8] processInfo];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 processName];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 signatureWithDomain:@"WiFi" type:@"SoftError" subType:v21 subtypeContext:v22 detectedProcess:v24 triggerThresholdValues:0];
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v26 = a1[4];
      v27 = *(void **)(v26 + 128);
      v32[0] = MEMORY[0x1895F87A8];
      v32[1] = 3221225472LL;
      v32[2] = __43__WiFiSoftError_submitABCReportWithReason___block_invoke_68;
      v32[3] = &unk_18A16E340;
      v32[4] = v26;
      if (([v27 snapshotWithSignature:v25 duration:0 events:0 payload:0 actions:v32 reply:0.0] & 1) == 0 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        __43__WiFiSoftError_submitABCReportWithReason___block_invoke_cold_2();
      }

      v28 = *(void **)v3;
      uint64_t v29 = *(void *)(*(void *)v3 + 136LL);
      if (!v29)
      {
        uint64_t v30 = [MEMORY[0x189603FA8] array];
        os_log_t v31 = *(void **)(*(void *)v3 + 136LL);
        *(void *)(*(void *)v3 + 136LL) = v30;

        v28 = *(void **)v3;
        uint64_t v29 = *(void *)(*(void *)v3 + 136LL);
      }

      [v28 _recordCurrentTimestampIn:v29];
    }
  }

  else
  {
    uint64_t v14 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:82 userInfo:0];
    uint64_t v15 = *(void *)(a1[6] + 8LL);
    __int16 v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }

void __43__WiFiSoftError_submitABCReportWithReason___block_invoke_68(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 64LL);
    int v3 = 136315394;
    uint64_t v4 = "-[WiFiSoftError submitABCReportWithReason:]_block_invoke";
    __int16 v5 = 2112;
    uint64_t v6 = v2;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: SoftError <%@> submitted an ABC report",  (uint8_t *)&v3,  0x16u);
  }

- (id)updateHUDWithMessage:(id)a3
{
  return (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:45 userInfo:0];
}

- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3 timeout:(double)a4
{
  return 0;
}

- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3
{
  return -[WiFiSoftError askToLaunchTapToRadarWithMessage:timeout:]( self,  "askToLaunchTapToRadarWithMessage:timeout:",  a3,  30.0);
}

- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  __int16 v5 = (void (**)(id, void, void *))a5;
  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:45 userInfo:0];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    v5[2](v5, 0LL, v6);
  }

  return 0;
}

- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3 completionHandler:(id)a4
{
  return -[WiFiSoftError askToLaunchTapToRadarWithMessage:timeout:completionHandler:]( self,  "askToLaunchTapToRadarWithMessage:timeout:completionHandler:",  a3,  a4,  30.0);
}

- (id)tapToRadarWithURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v4 = (void (**)(id, void, void *))a4;
  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:45 userInfo:0];
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    v4[2](v4, 0LL, v5);
  }

  return v5;
}

- (void)_recordCurrentTimestampIn:(id)a3
{
  int v3 = (void *)MEMORY[0x189607968];
  uint64_t v4 = (void *)MEMORY[0x189603F50];
  id v5 = a3;
  [v4 timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "numberWithDouble:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 addObject:v6];
}

- (int64_t)_countOf:(id)a3 withinInterval:(double)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    if (a4 == 9.22337204e18)
    {
      int64_t v7 = [v5 count];
    }

    else
    {
      [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
      double v9 = v8;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        int64_t v7 = 0LL;
        uint64_t v13 = *(void *)v18;
        do
        {
          for (uint64_t i = 0LL; i != v12; ++i)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "doubleValue", (void)v17);
            if (v9 - v15 < a4) {
              ++v7;
            }
          }

          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }

        while (v12);
      }

      else
      {
        int64_t v7 = 0LL;
      }
    }
  }

  else
  {
    int64_t v7 = 0LL;
  }

  return v7;
}

- (BOOL)_maxNonUIActionsReachedFor:(id)a3
{
  id v4 = a3;
  BOOL v7 = 0;
  if (v4)
  {
    int64_t v5 = -[WiFiSoftError _countOf:withinInterval:]( self,  "_countOf:withinInterval:",  v4,  (double)self->_intervalForMaxNonUIActions);
    int64_t v6 = -[WiFiSoftError _countOf:withinInterval:](self, "_countOf:withinInterval:", v4, 9.22337204e18);
    if (v5 >= self->_maxNonUIActions || v6 >= self->_maxOccurrences) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (BOOL)_maxUIActionsReachedFor:(id)a3
{
  id v4 = a3;
  BOOL v7 = 0;
  if (v4)
  {
    int64_t v5 = -[WiFiSoftError _countOf:withinInterval:]( self,  "_countOf:withinInterval:",  v4,  (double)self->_intervalForMaxUIActions);
    int64_t v6 = -[WiFiSoftError _countOf:withinInterval:](self, "_countOf:withinInterval:", v4, 9.22337204e18);
    if (v5 >= self->_maxUIActions || v6 >= self->_maxOccurrences) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (void)_resetCount
{
  if (self->_enabled) {
    -[NSMutableArray removeAllObjects](self->_occurrenceTimestamps, "removeAllObjects");
  }
}

- (void)_addConfigurationData:(id)a3
{
  id v4 = (void *)MEMORY[0x189607968];
  int64_t metricSubmissionSamplingRate = self->_metricSubmissionSamplingRate;
  id v6 = a3;
  [v4 numberWithInteger:metricSubmissionSamplingRate];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v7 forKey:@"samplingRate"];

  [MEMORY[0x189607968] numberWithInteger:self->_maxOccurrences];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v8 forKey:@"maxOccurrences"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[NSMutableArray count](self->_occurrenceTimestamps, "count") == self->_maxOccurrences);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v9 forKey:@"reachedMaxDailyOccurrences"];
}

- (void)_addGenericMetricData:(id)a3
{
  id v15 = a3;
  uint64_t v4 = -[WiFiSoftError _countOf:withinInterval:]( self,  "_countOf:withinInterval:",  self->_occurrenceTimestamps,  9.22337204e18);
  uint64_t v5 = v4;
  if (v4 > 1 || v4 == 1 && self->_lastTimestamp)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_occurrenceTimestamps, "objectAtIndexedSubscript:", v4 - 1);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 doubleValue];
    double v8 = v7;

    if (v5 <= 1)
    {
      -[NSNumber doubleValue](self->_lastTimestamp, "doubleValue");
      double v11 = v12;
    }

    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_occurrenceTimestamps, "objectAtIndexedSubscript:", v5 - 2);
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 doubleValue];
      double v11 = v10;
    }

    uint64_t v13 = +[WiFiUsagePrivacyFilter getBinTimeInterval:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinTimeInterval:As:",  1LL,  v8 - v11);
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      [v15 setObject:v13 forKey:@"timeSinceLastOccurrenceBin"];
      -[WiFiSoftError _addConfigurationData:](self, "_addConfigurationData:", v15);
    }
  }
}

+ (void)_submitSummaryReportMetric
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (_os_feature_enabled_impl() && (MGGetBoolAnswer() & 1) == 0 && MEMORY[0x18960DAA8])
  {
    [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
    double v3 = v2;
    [NSString stringWithFormat:@"%@.%@", @"com.apple.wifi.softerror", @"generic"];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:2];
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    obuint64_t j = (id)currentSoftErrors;
    uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v42 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v32;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(obj);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * i) pointerValue];
          double v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 creationDate];
          if (v3 - v11 >= 86400.0 && [v10 metricsEnabled])
          {
            [v10 name];
            double v12 = (void *)objc_claimAutoreleasedReturnValue();
            [v5 setObject:v12 forKey:@"name"];

            __int128 v29 = 0u;
            __int128 v30 = 0u;
            __int128 v27 = 0u;
            __int128 v28 = 0u;
            [v10 occurrenceTimestamps];
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v41 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = 0LL;
              uint64_t v17 = *(void *)v28;
              do
              {
                for (uint64_t j = 0LL; j != v15; ++j)
                {
                  if (*(void *)v28 != v17) {
                    objc_enumerationMutation(v13);
                  }
                  [*(id *)(*((void *)&v27 + 1) + 8 * j) doubleValue];
                  if (v3 - v19 < 86400.0) {
                    ++v16;
                  }
                }

                uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v41 count:16];
              }

              while (v15);
            }

            else
            {
              uint64_t v16 = 0LL;
            }

            [MEMORY[0x189607968] numberWithInteger:v16];
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
            [v5 setObject:v20 forKey:@"occurrenceCountIn24hr"];

            [v10 _addConfigurationData:v5];
            [v10 occurrenceTimestamps];
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 lastObject];
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setLastTimestamp:v22];

            [v10 _resetCount];
            id v23 = v5;
            AnalyticsSendEventLazy();
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
            {
              [v10 name];
              uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              dispatch_source_t v36 = "+[WiFiSoftError _submitSummaryReportMetric]";
              __int16 v37 = 2112;
              v38 = v24;
              __int16 v39 = 2112;
              uint64_t v40 = v4;
              _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: SoftError <%@> submitted a summary in metric <%@>",  buf,  0x20u);
            }

            uint64_t v8 = v25;
            if (os_log_type_enabled(MEMORY[0x1895F8DA8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              dispatch_source_t v36 = "+[WiFiSoftError _submitSummaryReportMetric]";
              __int16 v37 = 2112;
              v38 = v5;
              _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA8],  OS_LOG_TYPE_DEFAULT,  "%s: SoftError metric dictionary <%@>",  buf,  0x16u);
            }

            [v23 removeAllObjects];
          }
        }

        uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v42 count:16];
      }

      while (v7);
    }
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:45 userInfo:0];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
}

id __43__WiFiSoftError__submitSummaryReportMetric__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)_cloudAssetsFetchHandler:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (dispatch_queue_s *)queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __42__WiFiSoftError__cloudAssetsFetchHandler___block_invoke;
  block[3] = &unk_18A16C770;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

void __42__WiFiSoftError__cloudAssetsFetchHandler___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  BOOL v2 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  if (v2) {
    __42__WiFiSoftError__cloudAssetsFetchHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  double v10 = *(void **)(a1 + 32);
  if (v10)
  {
    [v10 softErrors];
    double v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 copy];
    uint64_t v13 = (void *)cloudAssets;
    cloudAssets = v12;
  }

  if (cloudAssets)
  {
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v14 = (id)currentSoftErrors;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v15)
    {
      uint64_t v17 = v15;
      uint64_t v18 = *(void *)v38;
      *(void *)&__int128 v16 = 136315906LL;
      __int128 v34 = v16;
      do
      {
        uint64_t v19 = 0LL;
        do
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v19), "pointerValue", v34);
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v21 = (void *)cloudAssets;
          [v20 name];
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v21 objectForKey:v22];
          id v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            [v23 objectForKey:@"enabled"];
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
            unint64_t v25 = [v24 integerValue];
            if (v24) {
              BOOL v26 = v25 > 1;
            }
            else {
              BOOL v26 = 1;
            }
            if (!v26)
            {
              unint64_t v27 = v25;
              if ([v20 enabled] != v25)
              {
                if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
                {
                  [v20 name];
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v32 = [v20 enabled];
                  *(_DWORD *)buf = v34;
                  char v42 = "+[WiFiSoftError _cloudAssetsFetchHandler:]_block_invoke";
                  __int16 v43 = 2112;
                  v44 = v35;
                  __int16 v45 = 2048;
                  uint64_t v46 = v32;
                  __int16 v47 = 2048;
                  unint64_t v48 = v27;
                  _os_log_error_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s: Updating SoftError <%@> property <enabled> from %ld => %ld",  buf,  0x2Au);
                }

                [v20 setEnabled:v27];
              }
            }

            [v23 objectForKey:@"metricsEnabled"];
            __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();

            unint64_t v29 = [v28 integerValue];
            if (v28) {
              BOOL v30 = v29 > 1;
            }
            else {
              BOOL v30 = 1;
            }
            if (!v30)
            {
              unint64_t v31 = v29;
              if ([v20 metricsEnabled] != v29)
              {
                if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
                {
                  [v20 name];
                  dispatch_source_t v36 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v33 = [v20 metricsEnabled];
                  *(_DWORD *)buf = v34;
                  char v42 = "+[WiFiSoftError _cloudAssetsFetchHandler:]_block_invoke";
                  __int16 v43 = 2112;
                  v44 = v36;
                  __int16 v45 = 2048;
                  uint64_t v46 = v33;
                  __int16 v47 = 2048;
                  unint64_t v48 = v31;
                  _os_log_error_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s: Updating SoftError <%@> property <metricsEnabled> from %ld => %ld",  buf,  0x2Au);
                }

                [v20 setMetricsEnabled:v31];
              }
            }
          }

          ++v19;
        }

        while (v17 != v19);
        uint64_t v17 = [v14 countByEnumeratingWithState:&v37 objects:v49 count:16];
      }

      while (v17);
    }
  }

+ (void)_updateHUDWithMessage:(id)a3
{
  if (![a3 length] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    +[WiFiSoftError _updateHUDWithMessage:].cold.1();
  }
}

- (int64_t)maxOccurrences
{
  return self->_maxOccurrences;
}

- (int64_t)metricSubmissionSamplingRate
{
  return self->_metricSubmissionSamplingRate;
}

- (int64_t)maxNonUIActions
{
  return self->_maxNonUIActions;
}

- (int64_t)intervalForMaxNonUIActions
{
  return self->_intervalForMaxNonUIActions;
}

- (int64_t)maxUIActions
{
  return self->_maxUIActions;
}

- (int64_t)intervalForMaxUIActions
{
  return self->_intervalForMaxUIActions;
}

- (int64_t)maxLogMessageLength
{
  return self->_maxLogMessageLength;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(int64_t)a3
{
  self->_int64_t enabled = a3;
}

- (int64_t)metricsEnabled
{
  return self->_metricsEnabled;
}

- (void)setMetricsEnabled:(int64_t)a3
{
  self->_int64_t metricsEnabled = a3;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(double)a3
{
  self->_creationDate = a3;
}

- (NSMutableArray)occurrenceTimestamps
{
  return self->_occurrenceTimestamps;
}

- (void)setOccurrenceTimestamps:(id)a3
{
}

- (NSNumber)lastTimestamp
{
  return self->_lastTimestamp;
}

- (void)setLastTimestamp:(id)a3
{
}

- (void)setLogMessage:(id)a3
{
}

- (NSString)metricEventName
{
  return self->_metricEventName;
}

- (void)setMetricEventName:(id)a3
{
}

- (SDRDiagnosticReporter)abcReporter
{
  return self->_abcReporter;
}

- (void)setAbcReporter:(id)a3
{
}

- (NSMutableArray)abcSubmissionTimestamps
{
  return self->_abcSubmissionTimestamps;
}

- (void)setAbcSubmissionTimestamps:(id)a3
{
}

- (NSMutableArray)simulateCrashTimestamps
{
  return self->_simulateCrashTimestamps;
}

- (void)setSimulateCrashTimestamps:(id)a3
{
}

- (NSMutableArray)hudTimestamps
{
  return self->_hudTimestamps;
}

- (void)setHudTimestamps:(id)a3
{
}

- (NSMutableArray)askToLaunchTapToRadarTimestamps
{
  return self->_askToLaunchTapToRadarTimestamps;
}

- (void)setAskToLaunchTapToRadarTimestamps:(id)a3
{
}

- (NSMutableArray)tapToRadarTimestamps
{
  return self->_tapToRadarTimestamps;
}

- (void)setTapToRadarTimestamps:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

- (void)initWithName:(uint64_t)a3 andParams:(uint64_t)a4 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)initWithName:andParams:.cold.2()
{
  OUTLINED_FUNCTION_4( &dword_187EBF000,  MEMORY[0x1895F8DA0],  v0,  "%s: Updating SoftError <%@> property <metricsEnabled> from %ld => %ld",  v1,  v2,  v3,  v4,  2u);
  OUTLINED_FUNCTION_10();
}

- (void)initWithName:andParams:.cold.3()
{
  OUTLINED_FUNCTION_4( &dword_187EBF000,  MEMORY[0x1895F8DA0],  v0,  "%s: Updating SoftError <%@> property <enabled> from %ld => %ld",  v1,  v2,  v3,  v4,  2u);
  OUTLINED_FUNCTION_10();
}

- (void)initWithName:(uint64_t)a3 andParams:(uint64_t)a4 .cold.4( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)initWithName:andParams:.cold.5()
{
}

- (void)initWithName:(uint64_t)a3 andParams:(uint64_t)a4 .cold.6( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __31__WiFiSoftError_incrementCount__block_invoke_cold_1()
{
}

void __51__WiFiSoftError_appendLogMessage_includeTimestamp___block_invoke_cold_1()
{
}

void __29__WiFiSoftError_submitMetric__block_invoke_cold_1()
{
}

void __38__WiFiSoftError_submitMetricWithData___block_invoke_cold_1()
{
}

void __43__WiFiSoftError_submitABCReportWithReason___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __43__WiFiSoftError_submitABCReportWithReason___block_invoke_cold_2()
{
}

void __42__WiFiSoftError__cloudAssetsFetchHandler___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)_updateHUDWithMessage:.cold.1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "[HUD]: ignoring empty HUD message info",  v0,  2u);
}

@end