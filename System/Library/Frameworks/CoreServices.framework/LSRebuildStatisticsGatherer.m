@interface LSRebuildStatisticsGatherer
- (LSRebuildStatisticsGatherer)init;
- (uint64_t)performContainerizedContentScan:(uint64_t)result;
- (uint64_t)performRebuild:(uint64_t)result;
- (uint64_t)performSystemContentSave:(uint64_t)result;
- (uint64_t)performSystemContentScan:(uint64_t)result;
- (uint64_t)setIsUserRequested:(uint64_t)result;
- (uint64_t)setMigratorRunning:(uint64_t)result;
- (uint64_t)setRebuildReasonFlags:(uint64_t)result;
- (void)registeredBundleOfType:(uint64_t)a1;
- (void)setRebuildError:(void *)a1;
- (void)submitAnalytics;
@end

@implementation LSRebuildStatisticsGatherer

- (LSRebuildStatisticsGatherer)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LSRebuildStatisticsGatherer;
  result = -[LSRebuildStatisticsGatherer init](&v3, sel_init);
  if (result)
  {
    result->_numApplications = 0LL;
    *(_OWORD *)&result->_containerizedContentScanTime = 0u;
    *(_OWORD *)&result->_systemContentSaveTime = 0u;
    *(_OWORD *)&result->_totalRebuildTime = 0u;
  }

  return result;
}

- (uint64_t)performRebuild:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    result = timeWorkBlock(a2);
    *(void *)(v2 + 8) = result;
  }

  return result;
}

- (uint64_t)performSystemContentScan:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    result = timeWorkBlock(a2);
    *(void *)(v2 + 16) = result;
  }

  return result;
}

- (uint64_t)performSystemContentSave:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    result = timeWorkBlock(a2);
    *(void *)(v2 + 24) = result;
  }

  return result;
}

- (uint64_t)performContainerizedContentScan:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    result = timeWorkBlock(a2);
    *(void *)(v2 + 40) = result;
  }

  return result;
}

- (void)registeredBundleOfType:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v7 = v3;
    if ([v3 isEqualToString:@"PluginKitPlugin"])
    {
      uint64_t v5 = 48LL;
    }

    else
    {
      if (([v7 isEqualToString:@"CoreServices"] & 1) == 0
        && ([v7 isEqualToString:@"Internal"] & 1) == 0
        && ([v7 isEqualToString:@"User"] & 1) == 0
        && ([v7 isEqualToString:@"System"] & 1) == 0
        && ([v7 isEqualToString:@"SystemAppPlaceholder"] & 1) == 0)
      {
        int v6 = [v7 isEqualToString:@"VPNPlugin"];
        v4 = v7;
        if (!v6) {
          goto LABEL_12;
        }
        uint64_t v5 = 56LL;
        goto LABEL_11;
      }

      uint64_t v5 = 56LL;
    }

    v4 = v7;
LABEL_11:
    ++*(void *)(a1 + v5);
  }

- (void)submitAnalytics
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "CoreAnalytics is not available; not sending rebuild analytics",
    v1,
    2u);
}

void __46__LSRebuildStatisticsGatherer_submitAnalytics__block_invoke()
{
  uint64_t v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.lsd.rebuildAnalyticsSubmit", v2);
  v1 = (void *)submitAnalytics_analyticsSubmitQueue;
  submitAnalytics_analyticsSubmitQueue = (uint64_t)v0;
}

void __46__LSRebuildStatisticsGatherer_submitAnalytics__block_invoke_15(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    BOOL v4 = *(unsigned __int8 *)(v3 + 64) != 0;
  }
  else {
    BOOL v4 = 0LL;
  }
  [MEMORY[0x189607968] numberWithBool:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v5 forKeyedSubscript:@"onlyCryptexContent"];

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    BOOL v7 = *(unsigned __int8 *)(v6 + 66) != 0;
  }
  else {
    BOOL v7 = 0LL;
  }
  [MEMORY[0x189607968] numberWithBool:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v8 forKeyedSubscript:@"userRequested"];

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    BOOL v10 = *(unsigned __int8 *)(v9 + 65) != 0;
  }
  else {
    BOOL v10 = 0LL;
  }
  [MEMORY[0x189607968] numberWithBool:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v11 forKeyedSubscript:@"migration"];

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    uint64_t v13 = *(unsigned __int16 *)(v12 + 68);
  }
  else {
    uint64_t v13 = 0LL;
  }
  [MEMORY[0x189607968] numberWithUnsignedShort:v13];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v14 forKeyedSubscript:@"rebuildReasonFlags"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(*(void *)(a1 + 32) + 48)];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v15 forKeyedSubscript:@"numPlugins"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(*(void *)(a1 + 32) + 56)];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v16 forKeyedSubscript:@"numApplications"];

  uint64_t v17 = *(void *)(a1 + 32);
  if (v17)
  {
    id v18 = *(id *)(v17 + 72);
    v19 = v18;
    if (v18)
    {
      v20 = (void *)NSString;
      [v18 domain];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 stringWithFormat:@"%@, %ld", v21, objc_msgSend(v19, "code")];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v2 setObject:v22 forKeyedSubscript:@"errorInfo"];
    }
  }

  else
  {
    v19 = 0LL;
  }

  v23 = *(void **)(a1 + 32);
  unint64_t v24 = v23[1];
  if (v24)
  {
    v25 = (void *)MEMORY[0x189607968];
    double v26 = (double)v24;
    uint64_t v27 = _LSGetMachTimebase();
    [v25 numberWithDouble:(double)v27 / (double)HIDWORD(v27) * v26 / 1000000000.0];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v28 forKeyedSubscript:@"totalRebuildTime"];

    v29 = (void *)MEMORY[0x189607968];
    double v30 = (double)(unint64_t)(*(void *)(*(void *)(a1 + 32) + 8LL)
                                   - vaddvq_s64( vaddq_s64( *(int64x2_t *)(*(void *)(a1 + 32) + 16LL),  *(int64x2_t *)(*(void *)(a1 + 32) + 32LL))));
    uint64_t v31 = _LSGetMachTimebase();
    [v29 numberWithDouble:(double)v31 / (double)HIDWORD(v31) * v30 / 1000000000.0];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v32 forKeyedSubscript:@"otherTime"];

    v23 = *(void **)(a1 + 32);
  }

  unint64_t v33 = v23[2];
  if (v33)
  {
    v34 = (void *)MEMORY[0x189607968];
    double v35 = (double)v33;
    uint64_t v36 = _LSGetMachTimebase();
    [v34 numberWithDouble:(double)v36 / (double)HIDWORD(v36) * v35 / 1000000000.0];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v37 forKeyedSubscript:@"systemContentScanTime"];

    v23 = *(void **)(a1 + 32);
  }

  unint64_t v38 = v23[3];
  if (v38)
  {
    v39 = (void *)MEMORY[0x189607968];
    double v40 = (double)v38;
    uint64_t v41 = _LSGetMachTimebase();
    [v39 numberWithDouble:(double)v41 / (double)HIDWORD(v41) * v40 / 1000000000.0];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v42 forKeyedSubscript:@"systemContentSaveTime"];

    v23 = *(void **)(a1 + 32);
  }

  unint64_t v43 = v23[4];
  if (v43)
  {
    v44 = (void *)MEMORY[0x189607968];
    double v45 = (double)v43;
    uint64_t v46 = _LSGetMachTimebase();
    [v44 numberWithDouble:(double)v46 / (double)HIDWORD(v46) * v45 / 1000000000.0];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v47 forKeyedSubscript:@"cryptexContentScanTime"];

    v23 = *(void **)(a1 + 32);
  }

  unint64_t v48 = v23[5];
  if (v48)
  {
    v49 = (void *)MEMORY[0x189607968];
    double v50 = (double)v48;
    uint64_t v51 = _LSGetMachTimebase();
    [v49 numberWithDouble:(double)v51 / (double)HIDWORD(v51) * v50 / 1000000000.0];
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v52 forKeyedSubscript:@"containerizedContentScanTime"];
  }

  _LSDefaultLog();
  v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v55 = v2;
    _os_log_impl(&dword_183E58000, v53, OS_LOG_TYPE_DEFAULT, "Noting rebuild statistics: %@", buf, 0xCu);
  }

  softLinkAnalyticsSendEvent(@"com.apple.coreservices.DatabaseRebuildStatistics", v2);
}

- (uint64_t)setMigratorRunning:(uint64_t)result
{
  if (result) {
    *(_BYTE *)(result + 65) = a2;
  }
  return result;
}

- (uint64_t)setIsUserRequested:(uint64_t)result
{
  if (result) {
    *(_BYTE *)(result + 66) = a2;
  }
  return result;
}

- (uint64_t)setRebuildReasonFlags:(uint64_t)result
{
  if (result) {
    *(_WORD *)(result + 68) = a2;
  }
  return result;
}

- (void)setRebuildError:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 72LL);
  }
}

- (void).cxx_destruct
{
}

@end