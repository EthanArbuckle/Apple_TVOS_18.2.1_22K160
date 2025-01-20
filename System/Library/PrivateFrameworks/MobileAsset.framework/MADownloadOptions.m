@interface MADownloadOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)allowDaemonConnectionRetries;
- (BOOL)allowsCellularAccess;
- (BOOL)allowsExpensiveAccess;
- (BOOL)canUseLocalCacheServer;
- (BOOL)disableUI;
- (BOOL)discretionary;
- (BOOL)liveServerCatalogOnly;
- (BOOL)liveServerCatalogOnlyIsOverridden;
- (BOOL)prefersInfraWiFi;
- (BOOL)requiresPowerPluggedIn;
- (MADownloadOptions)init;
- (MADownloadOptions)initWithCoder:(id)a3;
- (MADownloadOptions)initWithPlist:(id)a3;
- (NSData)decryptionKey;
- (NSDictionary)analyticsData;
- (NSMutableDictionary)additionalServerParams;
- (NSString)downloadAuthorizationHeader;
- (NSString)sessionId;
- (NSString)sourceDirectory;
- (id)description;
- (id)encodeAsPlist;
- (id)tightSummaryIncludingAdditional:(BOOL)a3;
- (int64_t)timeoutIntervalForResource;
- (void)encodeWithCoder:(id)a3;
- (void)logOptions;
- (void)setAdditionalServerParams:(id)a3;
- (void)setAllowDaemonConnectionRetries:(BOOL)a3;
- (void)setAllowsCellularAccess:(BOOL)a3;
- (void)setAllowsExpensiveAccess:(BOOL)a3;
- (void)setAnalyticsData:(id)a3;
- (void)setCanUseLocalCacheServer:(BOOL)a3;
- (void)setDecryptionKey:(id)a3;
- (void)setDisableUI:(BOOL)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setDownloadAuthorizationHeader:(id)a3;
- (void)setLiveServerCatalogOnly:(BOOL)a3;
- (void)setLiveServerCatalogOnlyIsOverridden:(BOOL)a3;
- (void)setPrefersInfraWiFi:(BOOL)a3;
- (void)setRequiresPowerPluggedIn:(BOOL)a3;
- (void)setSessionId:(id)a3;
- (void)setSourceDirectory:(id)a3;
- (void)setTimeoutIntervalForResource:(int64_t)a3;
@end

@implementation MADownloadOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADownloadOptions)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MADownloadOptions;
  v2 = -[MADownloadOptions init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_discretionary = 1;
    additionalServerParams = v2->_additionalServerParams;
    v2->_additionalServerParams = 0LL;

    sessionId = v3->_sessionId;
    v3->_sessionId = 0LL;

    *(_WORD *)&v3->_allowsCellularAccess = 0;
    v3->_timeoutIntervalForResource = -1LL;
    *(_DWORD *)&v3->_allowsExpensiveAccess = 65537;
    v3->_liveServerCatalogOnlyIsOverridden = 0;
    downloadAuthorizationHeader = v3->_downloadAuthorizationHeader;
    v3->_downloadAuthorizationHeader = 0LL;

    decryptionKey = v3->_decryptionKey;
    v3->_decryptionKey = 0LL;

    sourceDirectory = v3->_sourceDirectory;
    v3->_sourceDirectory = 0LL;

    analyticsData = v3->_analyticsData;
    v3->_analyticsData = 0LL;

    v3->_allowDaemonConnectionRetries = 0;
  }

  return v3;
}

- (MADownloadOptions)initWithCoder:(id)a3
{
  v38[8] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___MADownloadOptions;
  v5 = -[MADownloadOptions init](&v37, sel_init);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SessionId"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADownloadOptions setSessionId:](v5, "setSessionId:", v6);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AdditionalServerParams"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v7 error:0];
    plistDecodeClasses();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 decodeObjectOfClasses:v9 forKey:*MEMORY[0x1896075C8]];
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADownloadOptions initWithCoder:]",  @"Invalid additionalServerParams; not a dictionary. Leaving as nil.",
    }
        v11,
        v12,
        v13,
        v14,
        v36);
    else {
      -[MADownloadOptions setAdditionalServerParams:](v5, "setAdditionalServerParams:", v10);
    }
    [v8 finishDecoding];
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsCellularAccess"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsCellularAccess = [v15 BOOLValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsExpensive"];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsExpensiveAccess = [v16 BOOLValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requiresPowerPluggedIn"];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requiresPowerPluggedIn = [v17 BOOLValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prefersInfraWiFi"];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_prefersInfraWiFi = [v18 BOOLValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeoutIntervalForResource"];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_timeoutIntervalForResource = [v19 longValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"canUseLocalCacheServer"];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canUseLocalCacheServer = [v20 BOOLValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"discretionary"];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_discretionary = [v21 BOOLValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disableUI"];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_disableUI = [v22 BOOLValue];

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"decryptionKey"];
    decryptionKey = v5->_decryptionKey;
    v5->_decryptionKey = (NSData *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceDirectory"];
    sourceDirectory = v5->_sourceDirectory;
    v5->_sourceDirectory = (NSString *)v25;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowDaemonConnectionRetries"];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowDaemonConnectionRetries = [v27 BOOLValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LiveServerOnly"];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_liveServerCatalogOnly = [v28 BOOLValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LiveServerOnlyIsOverridden"];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_liveServerCatalogOnlyIsOverridden = [v29 BOOLValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DownloadAuthorizationHeader"];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADownloadOptions setDownloadAuthorizationHeader:](v5, "setDownloadAuthorizationHeader:", v30);

    v31 = (void *)MEMORY[0x189604010];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v38[2] = objc_opt_class();
    v38[3] = objc_opt_class();
    v38[4] = objc_opt_class();
    v38[5] = objc_opt_class();
    v38[6] = objc_opt_class();
    v38[7] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v38 count:8];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 setWithArray:v32];
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    [v4 decodeObjectOfClasses:v33 forKey:@"AnalyticsData"];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADownloadOptions setAnalyticsData:](v5, "setAnalyticsData:", v34);
  }

  return v5;
}

- (MADownloadOptions)initWithPlist:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MADownloadOptions;
  v5 = -[MADownloadOptions init](&v23, sel_init);
  if (v5)
  {
    getPlistString(v4, @"SessionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADownloadOptions setSessionId:](v5, "setSessionId:", v6);

    getPlistData(v4, @"AdditionalServerParams");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v7 error:0];
    plistDecodeClasses();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 decodeObjectOfClasses:v9 forKey:*MEMORY[0x1896075C8]];
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADownloadOptions initWithPlist:]",  @"Invalid additionalServerParams; not a dictionary. Leaving as nil.",
    }
        v11,
        v12,
        v13,
        v14,
        (uint64_t)v23.receiver);
    else {
      -[MADownloadOptions setAdditionalServerParams:](v5, "setAdditionalServerParams:", v10);
    }
    [v8 finishDecoding];
    v5->_allowsCellularAccess = getPlistNumberAsBool(v4, @"allowsCellularAccess");
    v5->_allowsExpensiveAccess = getPlistNumberAsBool(v4, @"allowsExpensive");
    v5->_requiresPowerPluggedIn = getPlistNumberAsBool(v4, @"requiresPowerPluggedIn");
    v5->_prefersInfraWiFi = getPlistNumberAsBool(v4, @"prefersInfraWiFi");
    getPlistNumber(v4, @"timeoutIntervalForResource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_timeoutIntervalForResource = [v15 longValue];

    v5->_canUseLocalCacheServer = getPlistNumberAsBool(v4, @"canUseLocalCacheServer");
    v5->_discretionary = getPlistNumberAsBool(v4, @"discretionary");
    uint64_t v16 = getPlistData(v4, @"decryptionKey");
    decryptionKey = v5->_decryptionKey;
    v5->_decryptionKey = (NSData *)v16;

    uint64_t v18 = getPlistString(v4, @"sourceDirectory");
    sourceDirectory = v5->_sourceDirectory;
    v5->_sourceDirectory = (NSString *)v18;

    v5->_allowDaemonConnectionRetries = getPlistNumberAsBool(v4, @"allowDaemonConnectionRetries");
    v5->_liveServerCatalogOnly = getPlistNumberAsBool(v4, @"LiveServerOnly");
    v5->_liveServerCatalogOnlyIsOverridden = getPlistNumberAsBool(v4, @"LiveServerOnlyIsOverridden");
    uint64_t v20 = getPlistDictionary(v4, @"AnalyticsData");
    analyticsData = v5->_analyticsData;
    v5->_analyticsData = (NSDictionary *)v20;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v21 = a3;
  if (self->_additionalServerParams)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [MEMORY[0x1896078F8] archivedDataWithRootObject:self->_additionalServerParams requiringSecureCoding:1 error:0];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 encodeObject:v4 forKey:@"AdditionalServerParams"];
    }
  }

  [MEMORY[0x189607968] numberWithBool:self->_allowsCellularAccess];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v5 forKey:@"allowsCellularAccess"];

  [MEMORY[0x189607968] numberWithBool:self->_allowsExpensiveAccess];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v6 forKey:@"allowsExpensive"];

  [MEMORY[0x189607968] numberWithBool:self->_requiresPowerPluggedIn];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v7 forKey:@"requiresPowerPluggedIn"];

  [MEMORY[0x189607968] numberWithBool:self->_prefersInfraWiFi];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v8 forKey:@"prefersInfraWiFi"];

  [MEMORY[0x189607968] numberWithLong:self->_timeoutIntervalForResource];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v9 forKey:@"timeoutIntervalForResource"];

  [MEMORY[0x189607968] numberWithBool:self->_canUseLocalCacheServer];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v10 forKey:@"canUseLocalCacheServer"];

  [MEMORY[0x189607968] numberWithBool:self->_discretionary];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v11 forKey:@"discretionary"];

  [MEMORY[0x189607968] numberWithBool:self->_disableUI];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v12 forKey:@"disableUI"];

  decryptionKey = self->_decryptionKey;
  if (decryptionKey) {
    [v21 encodeObject:decryptionKey forKey:@"decryptionKey"];
  }
  sourceDirectory = self->_sourceDirectory;
  if (sourceDirectory) {
    [v21 encodeObject:sourceDirectory forKey:@"sourceDirectory"];
  }
  [MEMORY[0x189607968] numberWithBool:self->_allowDaemonConnectionRetries];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v15 forKey:@"allowDaemonConnectionRetries"];

  [MEMORY[0x189607968] numberWithBool:self->_liveServerCatalogOnly];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v16 forKey:@"LiveServerOnly"];

  [MEMORY[0x189607968] numberWithBool:self->_liveServerCatalogOnlyIsOverridden];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v17 forKey:@"LiveServerOnlyIsOverridden"];

  -[MADownloadOptions downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v18 forKey:@"DownloadAuthorizationHeader"];

  sessionId = self->_sessionId;
  if (sessionId) {
    [v21 encodeObject:sessionId forKey:@"SessionId"];
  }
  -[MADownloadOptions analyticsData](self, "analyticsData");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 encodeObject:v20 forKey:@"AnalyticsData"];
}

- (id)encodeAsPlist
{
  v3 = (void *)objc_opt_new();
  if (self->_additionalServerParams)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [MEMORY[0x1896078F8] archivedDataWithRootObject:self->_additionalServerParams requiringSecureCoding:1 error:0];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setValue:v4 forKey:@"AdditionalServerParams"];
    }
  }

  [MEMORY[0x189607968] numberWithBool:self->_allowsCellularAccess];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v5 forKey:@"allowsCellularAccess"];

  [MEMORY[0x189607968] numberWithBool:self->_allowsExpensiveAccess];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v6 forKey:@"allowsExpensive"];

  [MEMORY[0x189607968] numberWithBool:self->_requiresPowerPluggedIn];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v7 forKey:@"requiresPowerPluggedIn"];

  [MEMORY[0x189607968] numberWithBool:self->_prefersInfraWiFi];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v8 forKey:@"prefersInfraWiFi"];

  [MEMORY[0x189607968] numberWithLong:self->_timeoutIntervalForResource];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v9 forKey:@"timeoutIntervalForResource"];

  [MEMORY[0x189607968] numberWithBool:self->_canUseLocalCacheServer];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v10 forKey:@"canUseLocalCacheServer"];

  [MEMORY[0x189607968] numberWithBool:self->_discretionary];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v11 forKey:@"discretionary"];

  decryptionKey = self->_decryptionKey;
  if (decryptionKey) {
    [v3 setValue:decryptionKey forKey:@"decryptionKey"];
  }
  sourceDirectory = self->_sourceDirectory;
  if (sourceDirectory) {
    [v3 setValue:sourceDirectory forKey:@"sourceDirectory"];
  }
  [MEMORY[0x189607968] numberWithBool:self->_allowDaemonConnectionRetries];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v14 forKey:@"allowDaemonConnectionRetries"];

  [MEMORY[0x189607968] numberWithBool:self->_liveServerCatalogOnly];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v15 forKey:@"LiveServerOnly"];

  [MEMORY[0x189607968] numberWithBool:self->_liveServerCatalogOnlyIsOverridden];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v16 forKey:@"LiveServerOnlyIsOverridden"];

  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setValue:sessionId forKey:@"SessionId"];
  }
  -[MADownloadOptions analyticsData](self, "analyticsData");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = -[MADownloadOptions analyticsData](self, "analyticsData");
    [v3 setValue:v19 forKey:@"AnalyticsData"];
  }

  return v3;
}

- (void)setLiveServerCatalogOnly:(BOOL)a3
{
  self->_liveServerCatalogOnly = a3;
  self->_liveServerCatalogOnlyIsOverridden = 1;
}

- (id)description
{
  id v21 = (void *)NSString;
  BOOL v19 = -[MADownloadOptions allowsCellularAccess](self, "allowsCellularAccess");
  int64_t v18 = -[MADownloadOptions timeoutIntervalForResource](self, "timeoutIntervalForResource");
  BOOL v16 = -[MADownloadOptions canUseLocalCacheServer](self, "canUseLocalCacheServer");
  BOOL v15 = -[MADownloadOptions discretionary](self, "discretionary");
  BOOL v14 = -[MADownloadOptions disableUI](self, "disableUI");
  -[MADownloadOptions sessionId](self, "sessionId");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MADownloadOptions additionalServerParams](self, "additionalServerParams");
  stringWithoutNewlines((uint64_t)v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v13 = -[MADownloadOptions allowsExpensiveAccess](self, "allowsExpensiveAccess");
  BOOL v4 = -[MADownloadOptions requiresPowerPluggedIn](self, "requiresPowerPluggedIn");
  BOOL v5 = -[MADownloadOptions prefersInfraWiFi](self, "prefersInfraWiFi");
  if (self->_liveServerCatalogOnlyIsOverridden) {
    uint64_t liveServerCatalogOnly = self->_liveServerCatalogOnly;
  }
  else {
    uint64_t liveServerCatalogOnly = 0xFFFFFFFFLL;
  }
  v7 = -[MADownloadOptions downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  v8 = @"present";
  if (v7) {
    v9 = @"present";
  }
  else {
    v9 = @"not present";
  }
  v10 = -[MADownloadOptions analyticsData](self, "analyticsData");
  if (!v10) {
    v8 = @"not present";
  }
  [v21 stringWithFormat:@"MADownloadOptions allowsCellular: %d resourceTimeout: %ld canUseCacheServer: %d discretionary: %d disableUI: %d sessionId: %@ additionalServerParams:%@ allowsExpensiveAccess:%d requiresPowerPluggedIn: %d prefersInfraWiFi: %d liveServerOnly: %d DownloadAuthorizationHeader: %@ analyticsData: %@ allowDaemonConnectionRetries: %d", v19, v18, v16, v15, v14, v20, v3, v13, v4, v5, liveServerCatalogOnly, v9, v8, -[MADownloadOptions allowDaemonConnectionRetries](self, "allowDaemonConnectionRetries")];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)tightSummaryIncludingAdditional:(BOOL)a3
{
  BOOL v29 = a3;
  v28 = (void *)NSString;
  if (-[MADownloadOptions discretionary](self, "discretionary")) {
    BOOL v4 = @"Y";
  }
  else {
    BOOL v4 = @"N";
  }
  if (-[MADownloadOptions allowsCellularAccess](self, "allowsCellularAccess")) {
    BOOL v5 = @"Y";
  }
  else {
    BOOL v5 = @"N";
  }
  if (-[MADownloadOptions allowsExpensiveAccess](self, "allowsExpensiveAccess")) {
    v6 = @"Y";
  }
  else {
    v6 = @"N";
  }
  if (-[MADownloadOptions requiresPowerPluggedIn](self, "requiresPowerPluggedIn")) {
    v7 = @"Y";
  }
  else {
    v7 = @"N";
  }
  if (-[MADownloadOptions canUseLocalCacheServer](self, "canUseLocalCacheServer")) {
    v8 = @"Y";
  }
  else {
    v8 = @"N";
  }
  if (-[MADownloadOptions prefersInfraWiFi](self, "prefersInfraWiFi")) {
    v9 = @"Y";
  }
  else {
    v9 = @"N";
  }
  v10 = @"Y";
  if (!-[MADownloadOptions liveServerCatalogOnly](self, "liveServerCatalogOnly"))
  {
    if (-[MADownloadOptions liveServerCatalogOnlyIsOverridden](self, "liveServerCatalogOnlyIsOverridden")) {
      v10 = @"Y";
    }
    else {
      v10 = @"N";
    }
  }

  if (-[MADownloadOptions allowDaemonConnectionRetries](self, "allowDaemonConnectionRetries")) {
    uint64_t v11 = @"Y";
  }
  else {
    uint64_t v11 = @"N";
  }
  [v28 stringWithFormat:@"disc:%@,cell:%@,expen:%@,power:%@,cache:%@,pwifi:%@,live:%@,retry:%@", v4, v5, v6, v7, v8, v9, v10, v11];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    uint64_t v13 = -[MADownloadOptions additionalServerParams](self, "additionalServerParams");
    if (v13)
    {
      BOOL v14 = (void *)v13;
      -[MADownloadOptions additionalServerParams](self, "additionalServerParams");
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v15 count];

      if (v16)
      {
        v17 = -[MADownloadOptions sessionId](self, "sessionId");
        int64_t v18 = (void *)NSString;
        -[MADownloadOptions additionalServerParams](self, "additionalServerParams");
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = stringWithoutNewlines((uint64_t)v19);
        id v21 = (void *)v20;
        if (v17)
        {
          v22 = -[MADownloadOptions sessionId](self, "sessionId");
          uint64_t v23 = [v18 stringWithFormat:@"%@,+%@,ssn:%@", v12, v21, v22];

          uint64_t v12 = (void *)v23;
        }

        else
        {
          uint64_t v27 = [v18 stringWithFormat:@"%@,+%@", v12, v20];

          uint64_t v12 = (void *)v27;
        }

        goto LABEL_33;
      }
    }
  }
  v24 = -[MADownloadOptions sessionId](self, "sessionId");
  if (v24)
  {
    uint64_t v25 = (void *)NSString;
    -[MADownloadOptions sessionId](self, "sessionId");
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 stringWithFormat:@"%@,ssn:%@", v12, v19];
    id v21 = v12;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:
  }

  return v12;
}

- (void)logOptions
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADownloadOptions logOptions]",  @"The download options are %@",  v2,  v3,  v4,  v5,  (uint64_t)v6);
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (int64_t)timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource;
}

- (void)setTimeoutIntervalForResource:(int64_t)a3
{
  self->_timeoutIntervalForResource = a3;
}

- (BOOL)canUseLocalCacheServer
{
  return self->_canUseLocalCacheServer;
}

- (void)setCanUseLocalCacheServer:(BOOL)a3
{
  self->_canUseLocalCacheServer = a3;
}

- (NSMutableDictionary)additionalServerParams
{
  return self->_additionalServerParams;
}

- (void)setAdditionalServerParams:(id)a3
{
}

- (BOOL)discretionary
{
  return self->_discretionary;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

- (BOOL)disableUI
{
  return self->_disableUI;
}

- (void)setDisableUI:(BOOL)a3
{
  self->_disableUI = a3;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (BOOL)allowsExpensiveAccess
{
  return self->_allowsExpensiveAccess;
}

- (void)setAllowsExpensiveAccess:(BOOL)a3
{
  self->_allowsExpensiveAccess = a3;
}

- (BOOL)requiresPowerPluggedIn
{
  return self->_requiresPowerPluggedIn;
}

- (void)setRequiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
}

- (BOOL)prefersInfraWiFi
{
  return self->_prefersInfraWiFi;
}

- (void)setPrefersInfraWiFi:(BOOL)a3
{
  self->_prefersInfraWiFi = a3;
}

- (BOOL)liveServerCatalogOnly
{
  return self->_liveServerCatalogOnly;
}

- (BOOL)liveServerCatalogOnlyIsOverridden
{
  return self->_liveServerCatalogOnlyIsOverridden;
}

- (void)setLiveServerCatalogOnlyIsOverridden:(BOOL)a3
{
  self->_liveServerCatalogOnlyIsOverridden = a3;
}

- (NSString)downloadAuthorizationHeader
{
  return self->_downloadAuthorizationHeader;
}

- (void)setDownloadAuthorizationHeader:(id)a3
{
}

- (NSDictionary)analyticsData
{
  return self->_analyticsData;
}

- (void)setAnalyticsData:(id)a3
{
}

- (NSData)decryptionKey
{
  return self->_decryptionKey;
}

- (void)setDecryptionKey:(id)a3
{
}

- (NSString)sourceDirectory
{
  return self->_sourceDirectory;
}

- (void)setSourceDirectory:(id)a3
{
}

- (BOOL)allowDaemonConnectionRetries
{
  return self->_allowDaemonConnectionRetries;
}

- (void)setAllowDaemonConnectionRetries:(BOOL)a3
{
  self->_allowDaemonConnectionRetries = a3;
}

- (void).cxx_destruct
{
}

@end