@interface SUCorePolicyExtensionManagedUpdates
+ (BOOL)supportsSecureCoding;
+ (id)nameForMDMSoftwareUpdatePath:(unint64_t)a3;
- (BOOL)MDMUseDelayPeriod;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRequestedPMVSupervisedPolicy;
- (BOOL)supervised;
- (NSString)requestedPMV;
- (SUCorePolicyExtensionManagedUpdates)init;
- (SUCorePolicyExtensionManagedUpdates)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extensionName;
- (id)filterDocumentationAssetArray:(id)a3;
- (id)filterSoftwareUpdateAssetArray:(id)a3;
- (id)mdmPathName;
- (id)summary;
- (int64_t)delayPeriodDays;
- (int64_t)delayPeriodSecs;
- (unint64_t)mdmSoftwareUpdatePath;
- (void)encodeWithCoder:(id)a3;
- (void)extendMADocumentationCatalogDownloadOptions:(id)a3 descriptor:(id)a4;
- (void)extendMASoftwareUpdateAssetDownloadOptions:(id)a3;
- (void)extendMASoftwareUpdateCatalogDownloadOptions:(id)a3;
- (void)extendMSUApplyOptions:(id)a3;
- (void)setDelayPeriodSecs:(int64_t)a3;
- (void)setMDMUseDelayPeriod:(BOOL)a3;
- (void)setMdmSoftwareUpdatePath:(unint64_t)a3;
- (void)setRequestedPMV:(id)a3;
- (void)setSupervised:(BOOL)a3;
@end

@implementation SUCorePolicyExtensionManagedUpdates

- (SUCorePolicyExtensionManagedUpdates)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SUCorePolicyExtensionManagedUpdates;
  v2 = -[SUCorePolicyExtension init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_supervised = 0;
    requestedPMV = v2->_requestedPMV;
    v2->_requestedPMV = 0LL;

    v3->_MDMUseDelayPeriod = 0;
    v3->_delayPeriodSecs = 0LL;
    v3->_mdmSoftwareUpdatePath = 0LL;
  }

  return v3;
}

- (id)filterSoftwareUpdateAssetArray:(id)a3
{
  return a3;
}

- (id)filterDocumentationAssetArray:(id)a3
{
  return a3;
}

- (void)extendMASoftwareUpdateCatalogDownloadOptions:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    int v5 = [v4 supervised];
    objc_super v6 = @"NO";
    if (v5) {
      objc_super v6 = @"YES";
    }
    [@"|" stringByAppendingFormat:@"supervised:%@|", v6];
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"))
    {
      objc_msgSend(v4, "setSupervised:", -[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"));
      v8 = -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
      if (v8)
      {
        v9 = -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
        [v4 setRequestedProductVersion:v9];

        [v4 requestedProductVersion];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", @"requestedPMV:%@|", v10);

        v7 = (__CFString *)v11;
      }

      if (-[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod"))
      {
        if (-[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs") < 0)
        {
          [MEMORY[0x189612778] sharedDiag];
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ with MDMUseDelayPeriod, yet delayPeriodSecs < 0 (ignoring delay period)", self];
          [v12 trackAnomaly:@"[POLICY] DOWNLOAD_OPTIONS" forReason:v17 withResult:8102 withError:0];
        }

        else
        {
          objc_msgSend( v4,  "setDelayPeriod:",  -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs") / 86400);
          -[__CFString stringByAppendingFormat:]( v7,  "stringByAppendingFormat:",  @"delayPeriod:%ld|",  [v4 delayPeriod]);
          v12 = v7;
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }

      [v4 additionalServerParams];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 setSafeObject:v19 forKey:@"MDMSoftwareUpdatePath"];

      [v4 additionalServerParams];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:]( &OBJC_CLASS___SUCorePolicyExtensionManagedUpdates,  "nameForMDMSoftwareUpdatePath:",  -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
      [v20 setSafeObject:v21 forKey:@"MDMSoftwareUpdatePathName"];

      [v4 additionalServerParams];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[__CFString stringByAppendingFormat:]( v7,  "stringByAppendingFormat:",  @"%@:%lld|",  @"MDMSoftwareUpdatePath",  [v22 safeULLForKey:@"MDMSoftwareUpdatePath"]);
      [v4 additionalServerParams];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 safeStringForKey:@"MDMSoftwareUpdatePathName"];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 stringByAppendingFormat:@"%@:%@|", @"MDMSoftwareUpdatePathName", v16];
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [MEMORY[0x189612778] sharedDiag];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ without supervised = YES, yet calling extendMASoftwareUpdateCatalogDownloadOptions (no extended download options will be added)", self];
      [v15 trackAnomaly:@"[POLICY] DOWNLOAD_OPTIONS" forReason:v16 withResult:8102 withError:0];
    }

    [MEMORY[0x1896127A0] sharedLogger];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 oslog];
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = self;
      __int16 v27 = 2114;
      v28 = v7;
      _os_log_impl( &dword_187A54000,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ downloading software update catalog with extended download options: %{public}@",  buf,  0x16u);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v14,  OS_LOG_TYPE_DEFAULT,  "Options class is not MAMsuDownloadOptions, so unable to set managed options.",  buf,  2u);
    }

    v7 = @"|";
  }
}

- (void)extendMADocumentationCatalogDownloadOptions:(id)a3 descriptor:(id)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"))
    {
      objc_msgSend(v6, "setSupervised:", -[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"));
      int v8 = [v6 supervised];
      v9 = @"NO";
      if (v8) {
        v9 = @"YES";
      }
      [@"|" stringByAppendingFormat:@"supervised:%@|", v9];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 productVersion];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setRequestedProductVersion:v11];

      [v6 requestedProductVersion];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 stringByAppendingFormat:@"requestedPMV:%@|", v12];
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      [v6 additionalServerParams];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 setSafeObject:v15 forKey:@"MDMSoftwareUpdatePath"];

      [v6 additionalServerParams];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:]( &OBJC_CLASS___SUCorePolicyExtensionManagedUpdates,  "nameForMDMSoftwareUpdatePath:",  -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
      [v16 setSafeObject:v17 forKey:@"MDMSoftwareUpdatePathName"];

      [v6 additionalServerParams];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 stringByAppendingFormat:@"%@:%lld|", @"MDMSoftwareUpdatePath", objc_msgSend(v18, "safeULLForKey:", @"MDMSoftwareUpdatePath")];
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      [v6 additionalServerParams];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 safeStringForKey:@"MDMSoftwareUpdatePathName"];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 stringByAppendingFormat:@"%@:%@|", @"MDMSoftwareUpdatePathName", v21];
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v22 = @"|";
    }

    [MEMORY[0x1896127A0] sharedLogger];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 oslog];
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v27 = self;
      __int16 v28 = 2114;
      uint64_t v29 = v22;
      _os_log_impl( &dword_187A54000,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@ downloading documentation catalog with extended download options: %{public}@",  buf,  0x16u);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 oslog];
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v24,  OS_LOG_TYPE_DEFAULT,  "Options class is not MAMsuDownloadOptions, so unable to set managed options.",  buf,  2u);
    }

    v22 = @"|";
  }
}

- (void)extendMASoftwareUpdateAssetDownloadOptions:(id)a3
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
  int v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    [v4 additionalServerParams];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setSafeObject:v7 forKey:@"RequestedProductVersion"];

    [v4 additionalServerParams];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 safeStringForKey:@"RequestedProductVersion"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [@"|" stringByAppendingFormat:@"%@:%@|", @"RequestedProductVersion", v9];
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v10 = @"|";
  }

  if (-[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod"))
  {
    if (-[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs") < 0)
    {
      [MEMORY[0x189612778] sharedDiag];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ with MDMUseDelayPeriod, yet delayPeriodSecs < 0 (ignoring delay period)", self];
      [v13 trackAnomaly:@"[POLICY] DOWNLOAD_OPTIONS" forReason:v14 withResult:8102 withError:0];
    }

    else
    {
      [v4 additionalServerParams];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( MEMORY[0x189607968],  "numberWithLong:",  -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 setSafeObject:v12 forKey:@"DelayPeriod"];

      [v4 additionalServerParams];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 safeObjectForKey:@"DelayPeriod" ofClass:objc_opt_class()];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = -[__CFString stringByAppendingFormat:]( v10,  "stringByAppendingFormat:",  @"%@:%@|",  @"DelayPeriod",  v14);

      v10 = (__CFString *)v15;
    }
  }

  [v4 additionalServerParams];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setSafeObject:v17 forKey:@"MDMSoftwareUpdatePath"];

  [v4 additionalServerParams];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:]( &OBJC_CLASS___SUCorePolicyExtensionManagedUpdates,  "nameForMDMSoftwareUpdatePath:",  -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
  [v18 setSafeObject:v19 forKey:@"MDMSoftwareUpdatePathName"];

  [v4 additionalServerParams];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod")) {
    v21 = @"true";
  }
  else {
    v21 = @"false";
  }
  [v20 setSafeObject:v21 forKey:@"DelayRequested"];

  [v4 additionalServerParams];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised")) {
    v23 = @"true";
  }
  else {
    v23 = @"false";
  }
  [v22 setSafeObject:v23 forKey:@"Supervised"];

  [v4 additionalServerParams];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 safeStringForKey:@"DelayRequested"];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[__CFString stringByAppendingFormat:](v10, "stringByAppendingFormat:", @"%@:%@|", @"DelayRequested", v25);
  [v4 additionalServerParams];
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 safeStringForKey:@"Supervised"];
  __int16 v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 stringByAppendingFormat:@"%@:%@|", @"Supervised", v28];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 additionalServerParams];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v29 stringByAppendingFormat:@"%@:%lld|", @"MDMSoftwareUpdatePath", objc_msgSend(v30, "safeULLForKey:", @"MDMSoftwareUpdatePath")];
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 additionalServerParams];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v32 safeStringForKey:@"MDMSoftwareUpdatePathName"];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v31 stringByAppendingFormat:@"%@:%@|", @"MDMSoftwareUpdatePathName", v33];
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896127A0] sharedLogger];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v35 oslog];
  v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v38 = self;
    __int16 v39 = 2114;
    v40 = v34;
    _os_log_impl( &dword_187A54000,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}@ downloading software update asset with extended download options: %{public}@",  buf,  0x16u);
  }
}

- (void)extendMSUApplyOptions:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = (__CFDictionary *)a3;
  if (-[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"))
  {
    CFDictionaryAddValue(v4, (const void *)*MEMORY[0x1896116A8], (const void *)*MEMORY[0x189604DE8]);
    int v5 = (void *)[objc_alloc(NSString) initWithFormat:@"enabledManagedRequest|"];
    [@"|" stringByAppendingString:v5];
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v6 = @"|";
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 oslog];
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    v10 = self;
    __int16 v11 = 2114;
    v12 = v6;
    _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ MSU apply options with extended options: %{public}@",  (uint8_t *)&v9,  0x16u);
  }
}

- (BOOL)isRequestedPMVSupervisedPolicy
{
  if (!-[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised")) {
    return 0;
  }
  v3 = -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (int64_t)delayPeriodDays
{
  if (-[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod")) {
    return -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs") / 86400;
  }
  else {
    return 0LL;
  }
}

- (id)mdmPathName
{
  v3 = -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath");
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (v3)
    {
      [MEMORY[0x189612778] sharedDiag];
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
      int v5 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Unknown mdmPath value: %lu",  -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
      [v4 trackAnomaly:@"[POLICY] SCAN_OPTIONS" forReason:v5 withResult:8102 withError:0];

      v3 = 0LL;
    }
  }

  else
  {
    +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:]( &OBJC_CLASS___SUCorePolicyExtensionManagedUpdates,  "nameForMDMSoftwareUpdatePath:",  -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
    v3 = (char *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (SUCorePolicyExtensionManagedUpdates)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCorePolicyExtensionManagedUpdates;
  int v5 = -[SUCorePolicyExtension init](&v9, sel_init);
  if (v5)
  {
    v5->_supervised = [v4 decodeBoolForKey:@"Supervised"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RequestedPMV"];
    requestedPMV = v5->_requestedPMV;
    v5->_requestedPMV = (NSString *)v6;

    v5->_MDMUseDelayPeriod = [v4 decodeBoolForKey:@"MDMUseDelayPeriod"];
    v5->_delayPeriodSecs = [v4 decodeIntegerForKey:@"DelayPeriodSecs"];
    v5->_mdmSoftwareUpdatePath = [v4 decodeIntegerForKey:@"MDMSoftwareUpdatePath"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend( v5,  "encodeBool:forKey:",  -[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"),  @"Supervised");
  -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v4 forKey:@"RequestedPMV"];

  objc_msgSend( v5,  "encodeBool:forKey:",  -[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod"),  @"MDMUseDelayPeriod");
  objc_msgSend( v5,  "encodeInteger:forKey:",  -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs"),  @"DelayPeriodSecs");
  objc_msgSend( v5,  "encodeInteger:forKey:",  -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"),  @"MDMSoftwareUpdatePath");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyExtensionManagedUpdates *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v5 = v4;
      BOOL v6 = -[SUCorePolicyExtensionManagedUpdates supervised](v5, "supervised");
      if (v6 == -[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"))
      {
        int v8 = (void *)MEMORY[0x189612760];
        -[SUCorePolicyExtensionManagedUpdates requestedPMV](v5, "requestedPMV");
        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
        if ([v8 stringIsEqual:v9 to:v10]
          && (BOOL v11 = -[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](v5, "MDMUseDelayPeriod"),
              v11 == -[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod"))
          && (uint64_t v12 = -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](v5, "delayPeriodSecs"),
              v12 == -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs")))
        {
          uint64_t v13 = -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](v5, "mdmSoftwareUpdatePath");
          BOOL v7 = v13 == -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath");
        }

        else
        {
          BOOL v7 = 0;
        }
      }

      else
      {
        BOOL v7 = 0;
      }
    }

    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)extensionName
{
  return @"SUCorePolicyExtensionManagedUpdates";
}

+ (id)nameForMDMSoftwareUpdatePath:(unint64_t)a3
{
  if (a3 < 3) {
    return off_18A0F0F00[a3];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"SUCoreMDMSoftwareUpdatePathUnknown(%ld)", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)summary
{
  if (-[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"))
  {
    [&stru_18A0F22B0 stringByAppendingString:@"|supervised"];
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v3 = &stru_18A0F22B0;
  }

  -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = -[__CFString stringByAppendingFormat:](v3, "stringByAppendingFormat:", @"|requestedPMV=%@", v5);

    v3 = (__CFString *)v6;
  }

  if (-[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod"))
  {
    uint64_t v7 = -[__CFString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"|MDMDelay=%ld",  -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs"));

    v3 = (__CFString *)v7;
  }

  if (-[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"))
  {
    +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:]( &OBJC_CLASS___SUCorePolicyExtensionManagedUpdates,  "nameForMDMSoftwareUpdatePath:",  -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = -[__CFString stringByAppendingFormat:](v3, "stringByAppendingFormat:", @"|mdmSoftwareUpdatePath=%@", v8);

    v3 = (__CFString *)v9;
  }

  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", &stru_18A0F22B0) & 1) == 0)
  {
    uint64_t v10 = -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", @"|");

    v3 = (__CFString *)v10;
  }

  return v3;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  -[SUCorePolicyExtensionManagedUpdates extensionName](self, "extensionName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised")) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod")) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  int64_t v8 = -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs");
  +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:]( &OBJC_CLASS___SUCorePolicyExtensionManagedUpdates,  "nameForMDMSoftwareUpdatePath:",  -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = (void *)[v3 initWithFormat:@"%@(supervised:%@|requestedPMV:%@|MDMUseDelayPeriod:%@|delayPeriodSecs:%ld|mdmSoftwareUpdatePath:%@)", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___SUCorePolicyExtensionManagedUpdates);
  -[SUCorePolicyExtensionManagedUpdates setSupervised:]( v5,  "setSupervised:",  -[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"));
  -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  -[SUCorePolicyExtensionManagedUpdates setRequestedPMV:](v5, "setRequestedPMV:", v7);

  -[SUCorePolicyExtensionManagedUpdates setMDMUseDelayPeriod:]( v5,  "setMDMUseDelayPeriod:",  -[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod"));
  -[SUCorePolicyExtensionManagedUpdates setDelayPeriodSecs:]( v5,  "setDelayPeriodSecs:",  -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs"));
  -[SUCorePolicyExtensionManagedUpdates setMdmSoftwareUpdatePath:]( v5,  "setMdmSoftwareUpdatePath:",  -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
  return v5;
}

- (BOOL)supervised
{
  return self->_supervised;
}

- (void)setSupervised:(BOOL)a3
{
  self->_supervised = a3;
}

- (NSString)requestedPMV
{
  return self->_requestedPMV;
}

- (void)setRequestedPMV:(id)a3
{
}

- (BOOL)MDMUseDelayPeriod
{
  return self->_MDMUseDelayPeriod;
}

- (void)setMDMUseDelayPeriod:(BOOL)a3
{
  self->_MDMUseDelayPeriod = a3;
}

- (int64_t)delayPeriodSecs
{
  return self->_delayPeriodSecs;
}

- (void)setDelayPeriodSecs:(int64_t)a3
{
  self->_delayPeriodSecs = a3;
}

- (unint64_t)mdmSoftwareUpdatePath
{
  return self->_mdmSoftwareUpdatePath;
}

- (void)setMdmSoftwareUpdatePath:(unint64_t)a3
{
  self->_mdmSoftwareUpdatePath = a3;
}

- (void).cxx_destruct
{
}

@end