@interface OSAProxyConfiguration
- (BOOL)isComputeController;
- (BOOL)isComputeNode;
- (BOOL)isConfigEnabled:(id)a3;
- (BOOL)isFile:(id)a3 validForSubmission:(id)a4 reasonableSize:(int64_t)a5 to:(id)a6 internalTypes:(id)a7 result:(const char *)a8;
- (BOOL)isInternalBridge;
- (BOOL)isProxy;
- (BOOL)usesLegacySubmission:(id)a3;
- (NSDictionary)currentTaskingIDByRouting;
- (NSString)automatedContextURL;
- (NSString)automatedDeviceGroup;
- (NSString)awdReporterKey;
- (NSString)buildVersion;
- (NSString)crashReporterKey;
- (NSString)experimentGroup;
- (NSString)identifier;
- (NSString)internalKey;
- (NSString)logPath;
- (NSString)modelCode;
- (NSString)osTrain;
- (NSString)productName;
- (NSString)productNameVersionBuildString;
- (NSString)productVersion;
- (NSString)releaseType;
- (NSString)seedGroup;
- (NSString)systemId;
- (NSString)targetAudience;
- (NSString)uiCountryCode;
- (id)assembleMetadataAt:(double)a3 withOptions:(unsigned int)a4;
- (id)description;
- (id)init:(id)a3 fromMetadata:(id)a4;
- (id)initFromPath:(id)a3;
- (id)metadata;
@end

@implementation OSAProxyConfiguration

- (id)init:(id)a3 fromMetadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___OSAProxyConfiguration;
  v9 = -[OSAProxyConfiguration init](&v50, sel_init);
  if (!v9) {
    goto LABEL_14;
  }
  uint64_t v10 = [v8 objectForKeyedSubscript:@"path"];
  logPath = v9->_logPath;
  v9->_logPath = (NSString *)v10;

  objc_storeStrong((id *)&v9->_identifier, a3);
  uint64_t v12 = [v8 objectForKeyedSubscript:@"machine_config"];
  modelCode = v9->_modelCode;
  v9->_modelCode = (NSString *)v12;

  uint64_t v14 = [v8 objectForKeyedSubscript:@"product_version"];
  productVersion = v9->_productVersion;
  v9->_productVersion = (NSString *)v14;

  uint64_t v16 = [v8 objectForKeyedSubscript:@"os_train"];
  osTrain = v9->_osTrain;
  v9->_osTrain = (NSString *)v16;

  uint64_t v18 = [v8 objectForKeyedSubscript:@"target_audience"];
  targetAudience = v9->_targetAudience;
  v9->_targetAudience = (NSString *)v18;

  uint64_t v20 = [v8 objectForKeyedSubscript:@"os_version"];
  buildVersion = v9->_buildVersion;
  v9->_buildVersion = (NSString *)v20;

  uint64_t v22 = [v8 objectForKeyedSubscript:@"UI_country_code"];
  uiCountryCode = v9->_uiCountryCode;
  v9->_uiCountryCode = (NSString *)v22;

  uint64_t v24 = [v8 objectForKeyedSubscript:@"system_ID"];
  systemId = v9->_systemId;
  v9->_systemId = (NSString *)v24;

  uint64_t v26 = [v8 objectForKeyedSubscript:@"crashreporter_key"];
  crashReporterKey = v9->_crashReporterKey;
  v9->_crashReporterKey = (NSString *)v26;

  uint64_t v28 = [v8 objectForKeyedSubscript:@"awd_device_ID"];
  awdReporterKey = v9->_awdReporterKey;
  v9->_awdReporterKey = (NSString *)v28;

  uint64_t v30 = [v8 objectForKeyedSubscript:@"internal_key"];
  internalKey = v9->_internalKey;
  v9->_internalKey = (NSString *)v30;

  uint64_t v32 = [v8 objectForKeyedSubscript:@"release_type"];
  releaseType = v9->_releaseType;
  v9->_releaseType = (NSString *)v32;

  uint64_t v34 = [v8 objectForKeyedSubscript:@"SeedGroup"];
  seedGroup = v9->_seedGroup;
  v9->_seedGroup = (NSString *)v34;

  uint64_t v36 = [v8 objectForKeyedSubscript:@"ExperimentGroup"];
  experimentGroup = v9->_experimentGroup;
  v9->_experimentGroup = (NSString *)v36;

  uint64_t v38 = [v8 objectForKeyedSubscript:@"AutomatedDeviceGroup"];
  automatedDeviceGroup = v9->_automatedDeviceGroup;
  v9->_automatedDeviceGroup = (NSString *)v38;

  uint64_t v40 = [v8 objectForKeyedSubscript:@"AutomatedContextURL"];
  automatedContextURL = v9->_automatedContextURL;
  v9->_automatedContextURL = (NSString *)v40;

  uint64_t v42 = [v8 objectForKeyedSubscript:@"currentTaskingIDByRouting"];
  currentTaskingIDByRouting = v9->_currentTaskingIDByRouting;
  v9->_currentTaskingIDByRouting = (NSDictionary *)v42;

  [v8 objectForKeyedSubscript:@"isComputeController"];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_isComputeController = [v44 BOOLValue];

  if (!v9->_osTrain)
  {
    v9->_osTrain = (NSString *)@"<unknown>";
  }

  if (!v9->_targetAudience)
  {
    v9->_targetAudience = (NSString *)@"<unknown>";
  }

  uint64_t v45 = [NSString stringWithFormat:@"%@ (%@)", v9->_osTrain, v9->_buildVersion];
  productNameVersionBuildString = v9->_productNameVersionBuildString;
  v9->_productNameVersionBuildString = (NSString *)v45;

  if (-[NSString length](v9->_modelCode, "length")
    && -[NSString length](v9->_productVersion, "length")
    && -[NSString length](v9->_buildVersion, "length")
    && -[NSString length](v9->_uiCountryCode, "length")
    && -[NSString length](v9->_crashReporterKey, "length"))
  {
    if (-[NSString length](v9->_releaseType, "length")) {
      v47 = v9;
    }
    else {
      v47 = 0LL;
    }
  }

  else
  {
LABEL_14:
    v47 = 0LL;
  }

  v48 = v47;

  return v48;
}

- (id)initFromPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x189603F68];
  [v4 stringByAppendingPathComponent:@"deviceMetadata.proxy"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 dictionaryWithContentsOfFile:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 lastPathComponent];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[OSAProxyConfiguration init:fromMetadata:](self, "init:fromMetadata:", v8, v7);

  if (v9)
  {
    uint64_t v10 = [v4 copy];
    v11 = (void *)v9[1];
    v9[1] = v10;
  }

  return v9;
}

- (BOOL)isProxy
{
  return 1;
}

- (BOOL)isInternalBridge
{
  return -[NSString containsString:](self->_logPath, "containsString:", @"Bridge");
}

- (id)assembleMetadataAt:(double)a3 withOptions:(unsigned int)a4
{
  char v4 = a4;
  double v5 = a3;
  v30[2] = *MEMORY[0x1895F89C0];
  if ((a4 & 4) != 0) {
    a3 = OSATimeIntervalApproximate(a3);
  }
  OSADateFormat(5u, a3);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FC8] dictionary];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x189607968];
  if ((v4 & 4) != 0) {
    double v5 = OSATimeIntervalApproximate(v5);
  }
  [v9 numberWithDouble:v5];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:v10 forKey:@"submissionTime"];

  [v8 setObject:v7 forKey:@"submissionTimeISO"];
  v11 = -[OSAProxyConfiguration releaseType](self, "releaseType");
  [v8 setValue:v11 forKey:@"release_type"];

  -[OSAProxyConfiguration modelCode](self, "modelCode");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setValue:v12 forKey:@"machine_config"];
  v13 = -[OSAProxyConfiguration automatedDeviceGroup](self, "automatedDeviceGroup");
  [v8 setValue:v13 forKey:@"AutomatedDeviceGroup"];

  -[OSAProxyConfiguration automatedContextURL](self, "automatedContextURL");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setValue:v14 forKey:@"AutomatedContextURL"];
  v15 = -[OSAProxyConfiguration seedGroup](self, "seedGroup");
  [v8 setValue:v15 forKey:@"SeedGroup"];

  -[OSAProxyConfiguration experimentGroup](self, "experimentGroup");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setValue:v16 forKey:@"ExperimentGroup"];
  v17 = -[OSAProxyConfiguration internalKey](self, "internalKey");
  [v8 setValue:v17 forKey:@"internal_key"];

  if (-[OSAProxyConfiguration isComputeController](self, "isComputeController")) {
    [v8 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"isComputeController"];
  }
  if ((v4 & 1) != 0)
  {
    [v8 setValue:0 forKey:@"crashreporter_key"];
    if ((v4 & 2) != 0) {
      goto LABEL_9;
    }
  }

  else
  {
    -[OSAProxyConfiguration crashReporterKey](self, "crashReporterKey");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setValue:v18 forKey:@"crashreporter_key"];

    if ((v4 & 2) != 0)
    {
LABEL_9:
      [v8 setValue:0 forKey:@"system_ID"];
      goto LABEL_12;
    }
  }
  v19 = -[OSAProxyConfiguration systemId](self, "systemId");
  [v8 setValue:v19 forKey:@"system_ID"];

LABEL_12:
  if (-[OSAProxyConfiguration isProxy](self, "isProxy"))
  {
    +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = @"os_version";
    [v20 productNameVersionBuildString];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = @"machine_config";
    v30[0] = v21;
    [v20 modelCode];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v22;
    [MEMORY[0x189603F68] dictionaryWithObjects:v30 forKeys:v29 count:2];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = (void *)[v23 mutableCopy];

    if ([v20 appleInternal])
    {
      [v20 crashReporterKey];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 setObject:v25 forKey:@"crashreporter_key"];

      [v20 automatedDeviceGroup];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 setValue:v26 forKey:@"AutomatedDeviceGroup"];

      [v20 internalKey];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 setValue:v27 forKey:@"internal_key"];
    }

    [v8 setValue:v24 forKey:@"proxyingDevice"];
  }

  return v8;
}

- (id)metadata
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSAProxyConfiguration modelCode](self, "modelCode");
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKeyedSubscript:@"machine_config"];

  -[OSAProxyConfiguration productVersion](self, "productVersion");
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v5 forKeyedSubscript:@"product_version"];
  v6 = -[OSAProxyConfiguration osTrain](self, "osTrain");
  [v3 setObject:v6 forKeyedSubscript:@"os_train"];

  -[OSAProxyConfiguration targetAudience](self, "targetAudience");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v7 forKeyedSubscript:@"target_audience"];

  -[OSAProxyConfiguration buildVersion](self, "buildVersion");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v8 forKeyedSubscript:@"os_version"];
  v9 = -[OSAProxyConfiguration uiCountryCode](self, "uiCountryCode");
  [v3 setObject:v9 forKeyedSubscript:@"UI_country_code"];

  -[OSAProxyConfiguration systemId](self, "systemId");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v10 forKeyedSubscript:@"system_ID"];
  v11 = -[OSAProxyConfiguration crashReporterKey](self, "crashReporterKey");
  [v3 setObject:v11 forKeyedSubscript:@"crashreporter_key"];

  -[OSAProxyConfiguration awdReporterKey](self, "awdReporterKey");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v12 forKeyedSubscript:@"awd_device_ID"];
  v13 = -[OSAProxyConfiguration internalKey](self, "internalKey");
  [v3 setObject:v13 forKeyedSubscript:@"internal_key"];

  -[OSAProxyConfiguration releaseType](self, "releaseType");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v14 forKeyedSubscript:@"release_type"];

  if (-[OSAProxyConfiguration isComputeController](self, "isComputeController")) {
    [v3 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"isComputeController"];
  }
  v15 = -[OSAProxyConfiguration seedGroup](self, "seedGroup");
  [v3 setValue:v15 forKey:@"SeedGroup"];

  -[OSAProxyConfiguration experimentGroup](self, "experimentGroup");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v16 forKey:@"ExperimentGroup"];
  v17 = -[OSAProxyConfiguration automatedDeviceGroup](self, "automatedDeviceGroup");
  [v3 setValue:v17 forKey:@"AutomatedDeviceGroup"];

  -[OSAProxyConfiguration automatedContextURL](self, "automatedContextURL");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v18 forKey:@"AutomatedContextURL"];
  v19 = -[OSAProxyConfiguration currentTaskingIDByRouting](self, "currentTaskingIDByRouting");
  [v3 setValue:v19 forKey:@"currentTaskingIDByRouting"];

  return v3;
}

- (id)description
{
  v2 = (void *)MEMORY[0x1896078D8];
  v3 = -[OSAProxyConfiguration metadata](self, "metadata");
  [v2 dataWithJSONObject:v3 options:0 error:0];
  char v4 = (void *)objc_claimAutoreleasedReturnValue();

  double v5 = (void *)[objc_alloc(NSString) initWithData:v4 encoding:4];
  return v5;
}

- (BOOL)usesLegacySubmission:(id)a3
{
  return 0;
}

- (BOOL)isConfigEnabled:(id)a3
{
  id v3 = a3;
  [v3 objectForKeyedSubscript:@"eOS"];
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    [v3 objectForKeyedSubscript:@"eOS"];
    double v5 = (void *)objc_claimAutoreleasedReturnValue();
    char v6 = [v5 BOOLValue];
  }

  else
  {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)isFile:(id)a3 validForSubmission:(id)a4 reasonableSize:(int64_t)a5 to:(id)a6 internalTypes:(id)a7 result:(const char *)a8
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  if (!a8) {
    -[OSAProxyConfiguration isFile:validForSubmission:reasonableSize:to:internalTypes:result:].cold.1();
  }
  uint64_t v18 = v17;
  *a8 = 0LL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v19 = [v15 stringValue];

    id v15 = (id)v19;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v15 length])
  {
    +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v20 appleInternal])
    {
      int v21 = [v18 containsObject:v15];

      if (v21)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v48 = v14;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Logfile '%@' allowed for submission for testing",  buf,  0xCu);
        }

        int v22 = 1;
        goto LABEL_62;
      }
    }

    else
    {
    }

    int64_t v46 = a5;
    +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 getLogBlacklist];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    int v26 = [v25 containsObject:v15];

    if (v26)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v48 = v14;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Logfile '%{public}@' blacklisted from submission",  buf,  0xCu);
      }

      int v22 = 0;
      *a8 = "rejected-blacklist";
      goto LABEL_62;
    }
    v27 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
    [v27 getPropsForLogType:v15];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v48 = v14;
        __int16 v49 = 2114;
        unint64_t v50 = (unint64_t)v15;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Logfile '%{public}@' invalid for submission: unknown type %{public}@",  buf,  0x16u);
      }

      uint64_t v32 = "rejected-unregistered";
      goto LABEL_60;
    }

    if (!-[OSAProxyConfiguration isConfigEnabled:](self, "isConfigEnabled:", v28))
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v48 = v14;
        __int16 v49 = 2114;
        unint64_t v50 = (unint64_t)v15;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Logfile '%{public}@' type %{public}@ invalid for platform",  buf,  0x16u);
      }

      uint64_t v32 = "rejected-platform";
      goto LABEL_60;
    }

    if ([v16 isEqualToString:@"<transfer>"])
    {
      [v28 objectForKeyedSubscript:@"disabled"];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v30 = v46;
      if (!v29)
      {
        [v28 objectForKeyedSubscript:@"watchSync"];
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v31) {
          goto LABEL_51;
        }
LABEL_41:
        int v22 = 1;
LABEL_52:
        [v28 objectForKeyedSubscript:@"limit"];
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
        int v43 = [v42 intValue];

        if (v43) {
          int v44 = v43;
        }
        else {
          int v44 = 0x100000;
        }
        if (!v22 || v44 >= v30) {
          goto LABEL_61;
        }
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v48 = v14;
          __int16 v49 = 2048;
          unint64_t v50 = v30;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Logfile '%{public}@' is too large (%lld) for submission",  buf,  0x16u);
        }

        uint64_t v32 = "rejected-size";
LABEL_60:
        int v22 = 0;
        *a8 = v32;
LABEL_61:

LABEL_62:
        BOOL v23 = v22 != 0;
        goto LABEL_63;
      }
    }

    else
    {
      int v33 = [v16 isEqualToString:@"<sync>"];
      uint64_t v34 = [v28 objectForKeyedSubscript:@"disabled"];
      v29 = (void *)v34;
      unint64_t v30 = v46;
      if (!v33)
      {
        if (v34)
        {
          BOOL v35 = 0;
        }

        else
        {
          v37 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
          if ([v37 appleInternal])
          {
            BOOL v35 = 1;
          }

          else
          {
            [v28 objectForKeyedSubscript:@"gm"];
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v35 = v39 != 0LL;
          }
        }

        uint64_t v40 = [v28 objectForKeyedSubscript:@"routing"];
        if (v40) {
          v41 = (__CFString *)v40;
        }
        else {
          v41 = @"da3";
        }
        if ((-[__CFString isEqualToString:](v41, "isEqualToString:", v16) & 1) == 0
          && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138544130;
          id v48 = v14;
          __int16 v49 = 2114;
          unint64_t v50 = (unint64_t)v15;
          __int16 v51 = 2114;
          id v52 = v16;
          __int16 v53 = 2114;
          v54 = v41;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Warning: Logfile '%{public}@' type %{public}@ routing %{public}@ does not match config %{public}@",  buf,  0x2Au);
        }

        if (!v35) {
          goto LABEL_51;
        }
        goto LABEL_41;
      }

      if (!v34)
      {
        +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v36 appleInternal])
        {

          goto LABEL_41;
        }

        [v28 objectForKeyedSubscript:@"gm"];
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38) {
          goto LABEL_41;
        }
LABEL_51:
        int v22 = 0;
        *a8 = "rejected-config";
        goto LABEL_52;
      }
    }

    goto LABEL_51;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v48 = v14;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Logfile '%{public}@' invalid for submission: no type",  buf,  0xCu);
  }

  BOOL v23 = 0;
  *a8 = "rejected-invalid";
LABEL_63:

  return v23;
}

- (NSString)logPath
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)modelCode
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)productVersion
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSString)buildVersion
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSString)osTrain
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (NSString)productName
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (NSString)productNameVersionBuildString
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (NSString)targetAudience
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSString)uiCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (NSString)systemId
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (NSString)internalKey
{
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (NSString)crashReporterKey
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (NSString)awdReporterKey
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (NSString)releaseType
{
  return (NSString *)objc_getProperty(self, a2, 144LL, 1);
}

- (NSString)seedGroup
{
  return (NSString *)objc_getProperty(self, a2, 152LL, 1);
}

- (NSString)experimentGroup
{
  return (NSString *)objc_getProperty(self, a2, 160LL, 1);
}

- (NSString)automatedDeviceGroup
{
  return (NSString *)objc_getProperty(self, a2, 168LL, 1);
}

- (NSString)automatedContextURL
{
  return (NSString *)objc_getProperty(self, a2, 176LL, 1);
}

- (BOOL)isComputeController
{
  return self->_isComputeController;
}

- (BOOL)isComputeNode
{
  return self->_isComputeNode;
}

- (NSDictionary)currentTaskingIDByRouting
{
  return (NSDictionary *)objc_getProperty(self, a2, 184LL, 1);
}

- (void).cxx_destruct
{
}

- (void)isFile:validForSubmission:reasonableSize:to:internalTypes:result:.cold.1()
{
}

@end