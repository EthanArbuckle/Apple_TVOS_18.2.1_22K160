@interface PPSMetric
+ (BOOL)isValidAuxiliaryType:(id)a3;
+ (BOOL)isValidBuild:(id)a3;
+ (BOOL)isValidCategory:(id)a3;
+ (BOOL)isValidDMACompliant:(id)a3;
+ (BOOL)isValidDatatype:(int)a3;
+ (BOOL)isValidDeviceCapability:(int)a3;
+ (BOOL)isValidDirectionality:(int)a3;
+ (BOOL)isValidEnumDeclaration:(id)a3;
+ (BOOL)isValidEnumDeclarationJSON:(id)a3;
+ (BOOL)isValidFilterEntryLogging:(id)a3;
+ (BOOL)isValidFixedArraySize:(id)a3;
+ (BOOL)isValidGroupingDimensions:(id)a3;
+ (BOOL)isValidGroupingDimensionsJSON:(id)a3;
+ (BOOL)isValidMetricJSON:(id)a3;
+ (BOOL)isValidMetricType:(id)a3;
+ (BOOL)isValidMode:(int)a3;
+ (BOOL)isValidName:(id)a3;
+ (BOOL)isValidObfuscation:(int)a3;
+ (BOOL)isValidOptionalPayload:(id)a3;
+ (BOOL)isValidPopulation:(int)a3;
+ (BOOL)isValidPrivacyClassification:(int)a3;
+ (BOOL)isValidRounding:(id)a3;
+ (BOOL)isValidSource:(id)a3;
+ (BOOL)isValidSourceJSON:(id)a3;
+ (BOOL)isValidStorage:(int)a3;
+ (BOOL)isValidSubsystem:(id)a3;
+ (BOOL)isValidTTL:(unsigned int)a3;
+ (BOOL)isValidVersion:(double)a3;
+ (id)dictionaryWithPropertiesOfPPSMetric:(id)a3;
+ (id)enumMappingToProto:(id)a3;
+ (id)enumMappingWithProto:(id)a3;
+ (id)groupByToProto:(id)a3;
+ (id)groupByWithProto:(id)a3;
+ (id)jsonDataWithMetrics:(id)a3;
+ (id)metricWithJSONObject:(id)a3;
+ (id)metricWithProto:(id)a3;
+ (id)metricWithProto:(id)a3 withBuild:(id)a4;
+ (id)metricsWithJSONData:(id)a3;
+ (id)metricsWithPlist:(id)a3 subsystem:(id)a4;
+ (id)setOptionalFields:(id)a3;
+ (id)sourceToProto:(id)a3;
+ (id)sourceWithProto:(id)a3;
+ (void)setMetadataDefaults:(id)a3;
- (BOOL)DMACompliant;
- (BOOL)filterEntryLogging;
- (NSArray)groupBy;
- (NSDictionary)enumMapping;
- (NSString)build;
- (NSString)category;
- (NSString)name;
- (NSString)source;
- (NSString)subsystem;
- (PPSCadence)cadence;
- (PPSMetric)init;
- (PPSMetric)initWithName:(id)a3 subsystem:(id)a4 category:(id)a5 version:(double)a6 datatype:(int)a7 unit:(id)a8 cadence:(id)a9 directionality:(int)a10 storage:(int)a11 timeToLive:(unsigned int)a12 mode:(int)a13 deviceCapability:(int)a14 population:(int)a15 obfuscation:(int)a16 privacyClassification:(int)a17 optionalPayload:(id)a18;
- (PPSMetric)initWithName:(id)a3 version:(double)a4 datatype:(int)a5 unit:(id)a6 baseMetric:(id)a7 optionalPayload:(id)a8;
- (PPSMetricType)metricType;
- (PPSRounding)rounding;
- (PPSUnit)unit;
- (double)version;
- (id)data;
- (id)json;
- (id)proto;
- (id)protoData;
- (int)auxiliaryType;
- (int)datatype;
- (int)deviceCapability;
- (int)directionality;
- (int)enabledPopulation;
- (int)mode;
- (int)obfuscation;
- (int)privacyClassification;
- (int)storage;
- (unsigned)fixedArraySize;
- (unsigned)timeToLive;
- (void)addAuxiliaryType:(id)a3;
- (void)addDMACompliant:(id)a3;
- (void)addEnumMapping:(id)a3;
- (void)addFilterEntryLogging:(id)a3;
- (void)addFixedArraySize:(id)a3;
- (void)addGroupingDimensions:(id)a3;
- (void)addMetricType:(id)a3;
- (void)addOptionalFields:(id)a3;
- (void)addRounding:(id)a3;
- (void)addSource:(id)a3;
- (void)setBuild:(id)a3;
@end

@implementation PPSMetric

+ (id)metricWithJSONObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)[v3 mutableCopy];
  if (+[PPSMetric isValidMetricJSON:](&OBJC_CLASS___PPSMetric, "isValidMetricJSON:", v4))
  {
    id v5 = v4;

    [v5 objectForKeyedSubscript:@"unit"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[PPSUnit unitWithJSONObject:](&OBJC_CLASS___PPSUnit, "unitWithJSONObject:", v6);
    [v5 objectForKeyedSubscript:@"cadence"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [v5 objectForKeyedSubscript:@"cadence"];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = +[PPSCadence cadenceWithJSONObject:](&OBJC_CLASS___PPSCadence, "cadenceWithJSONObject:", v9);

      if (!v10)
      {
        PPSStorageLog();
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          +[PPSMetric(JSON) metricWithJSONObject:].cold.4();
        }
        v12 = 0LL;
        goto LABEL_43;
      }
    }

    else
    {
      PPSStorageLog();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        +[PPSMetric(JSON) metricWithJSONObject:].cold.3();
      }

      uint64_t v10 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
    }

    v67 = (os_log_s *)v10;
    [v5 objectForKeyedSubscript:@"rounding"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      [v5 objectForKeyedSubscript:@"rounding"];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = +[PPSRounding roundingWithJSONObject:](&OBJC_CLASS___PPSRounding, "roundingWithJSONObject:", v15);
      if (!v16)
      {
        PPSStorageLog();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          +[PPSMetric(JSON) metricWithJSONObject:].cold.2();
        }

LABEL_22:
        v12 = 0LL;
        v11 = v67;
LABEL_43:

        goto LABEL_44;
      }
    }

    else
    {
      v16 = 0LL;
    }

    [v5 objectForKeyedSubscript:@"metricType"];
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      [v5 objectForKeyedSubscript:@"metricType"];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = +[PPSMetricType metricTypeWithJSONObject:](&OBJC_CLASS___PPSMetricType, "metricTypeWithJSONObject:", v19);

      if (!v20)
      {
        PPSStorageLog();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          +[PPSMetric(JSON) metricWithJSONObject:].cold.1();
        }

        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v20 = 0LL;
    }

    v22 = (void *)objc_opt_new();
    [v5 objectForKeyedSubscript:@"enumMapping"];
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      [v5 objectForKeyedSubscript:@"enumMapping"];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 setObject:v24 forKeyedSubscript:@"EnumMapping"];
    }

    if (v16) {
      [v22 setObject:v16 forKeyedSubscript:@"Rounding"];
    }
    [v5 objectForKeyedSubscript:@"source"];
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      [v5 objectForKeyedSubscript:@"source"];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 setObject:v26 forKeyedSubscript:@"Source"];
    }

    [v5 objectForKeyedSubscript:@"groupBy"];
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      [v5 objectForKeyedSubscript:@"groupBy"];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 setObject:v28 forKeyedSubscript:@"GroupingDimensions"];
    }

    if (v20) {
      [v22 setObject:v20 forKeyedSubscript:@"MetricType"];
    }
    [v5 objectForKeyedSubscript:@"auxiliaryType"];
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      [v5 objectForKeyedSubscript:@"auxiliaryType"];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 setObject:v30 forKeyedSubscript:@"AuxiliaryType"];
    }

    [v5 objectForKeyedSubscript:@"filterEntryLogging"];
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      [v5 objectForKeyedSubscript:@"filterEntryLogging"];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 setObject:v32 forKeyedSubscript:@"FilterEntryLogging"];
    }

    [v5 objectForKeyedSubscript:@"dmaCompliant"];
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      [v5 objectForKeyedSubscript:@"dmaCompliant"];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 setObject:v34 forKeyedSubscript:@"DMACompliant"];
    }

    v63 = (void *)v20;
    v64 = v16;
    v65 = v7;
    v66 = v4;
    [v5 objectForKeyedSubscript:@"fixedArraySize"];
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      [v5 objectForKeyedSubscript:@"fixedArraySize"];
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 setObject:v36 forKeyedSubscript:@"FixedArraySize"];
    }

    v37 = objc_alloc(&OBJC_CLASS___PPSMetric);
    [v5 objectForKeyedSubscript:@"name"];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKeyedSubscript:@"subsystem"];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKeyedSubscript:@"category"];
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKeyedSubscript:@"version"];
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    [v62 doubleValue];
    double v41 = v40;
    [v5 objectForKeyedSubscript:@"datatype"];
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v57 = [v61 unsignedIntValue];
    [v5 objectForKeyedSubscript:@"directionality"];
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v55 = [v60 unsignedIntValue];
    [v5 objectForKeyedSubscript:@"storage"];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v53 = [v58 unsignedIntValue];
    [v5 objectForKeyedSubscript:@"timeToLive"];
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v51 = [v56 unsignedIntValue];
    [v5 objectForKeyedSubscript:@"mode"];
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v49 = [v54 unsignedIntValue];
    [v5 objectForKeyedSubscript:@"deviceCapability"];
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v42 = [v52 unsignedIntValue];
    [v5 objectForKeyedSubscript:@"enabledPopulation"];
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v43 = [v50 unsignedIntValue];
    [v5 objectForKeyedSubscript:@"obfuscation"];
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v45 = [v44 unsignedIntValue];
    [v5 objectForKeyedSubscript:@"privacyClassification"];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v48 = __PAIR64__(v43, v42);
    v11 = v67;
    v12 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v37,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceC apability:population:obfuscation:privacyClassification:optionalPayload:",  v38,  v39,  v59,  v57,  v65,  v67,  v41,  __PAIR64__(v53, v55),  __PAIR64__(v49, v51),  v48,  __PAIR64__([v46 unsignedIntValue], v45),  v22);

    v7 = v65;
    v4 = v66;
    goto LABEL_43;
  }

  v12 = 0LL;
  id v5 = v3;
LABEL_44:

  return v12;
}

- (id)json
{
  return +[PPSMetric dictionaryWithPropertiesOfPPSMetric:]( &OBJC_CLASS___PPSMetric,  "dictionaryWithPropertiesOfPPSMetric:",  self);
}

+ (id)dictionaryWithPropertiesOfPPSMetric:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    [MEMORY[0x189603FC8] dictionary];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int outCount = 0;
    id v5 = (objc_class *)objc_opt_class();
    v6 = class_copyPropertyList(v5, &outCount);
    if (outCount)
    {
      for (unint64_t i = 0LL; i < outCount; ++i)
      {
        [NSString stringWithUTF8String:property_getName(v6[i])];
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 valueForKey:v8];
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          if (([v8 isEqualToString:@"cadence"] & 1) != 0
            || ([v8 isEqualToString:@"rounding"] & 1) != 0
            || ([v8 isEqualToString:@"unit"] & 1) != 0
            || [v8 isEqualToString:@"metricType"])
          {
            [v3 valueForKey:v8];
            uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 json];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            [v4 setObject:v11 forKeyedSubscript:v8];
          }

          else
          {
            [v3 valueForKey:v8];
            uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
            [v4 setObject:v10 forKeyedSubscript:v8];
          }
        }
      }
    }

    free(v6);
    [MEMORY[0x189603F68] dictionaryWithDictionary:v4];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

+ (id)metricsWithJSONData:(id)a3
{
  if (a3)
  {
    id v13 = 0LL;
    [MEMORY[0x1896078D8] JSONObjectWithData:a3 options:4 error:&v13];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (os_log_s *)v13;
    if (v4)
    {
      PPSStorageLog();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric(JSON) metricsWithJSONData:].cold.4();
      }
    }

    else if ([MEMORY[0x1896078D8] isValidJSONObject:v3])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        [MEMORY[0x189603FA8] array];
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x1895F87A8];
        v11[1] = 3221225472LL;
        v11[2] = __39__PPSMetric_JSON__metricsWithJSONData___block_invoke;
        v11[3] = &unk_18A290DF0;
        v8 = v9;
        v12 = v8;
        [v3 enumerateObjectsUsingBlock:v11];
        id v5 = v12;
LABEL_16:

        goto LABEL_17;
      }

      PPSStorageLog();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric(JSON) metricsWithJSONData:].cold.2();
      }
    }

    else
    {
      PPSStorageLog();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric(JSON) metricsWithJSONData:].cold.3();
      }
    }

    v8 = 0LL;
    goto LABEL_16;
  }

  PPSStorageLog();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    +[PPSMetric(JSON) metricsWithJSONData:].cold.1(v4, v6, v7);
  }
  v8 = 0LL;
LABEL_17:

  return v8;
}

void __39__PPSMetric_JSON__metricsWithJSONData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[PPSMetric metricWithJSONObject:](&OBJC_CLASS___PPSMetric, "metricWithJSONObject:", v3);
  if (v4)
  {
    [*(id *)(a1 + 32) addObject:v4];
  }

  else
  {
    PPSStorageLog();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __39__PPSMetric_JSON__metricsWithJSONData___block_invoke_cold_1();
    }
  }
}

+ (id)jsonDataWithMetrics:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    [MEMORY[0x189603FA8] array];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __39__PPSMetric_JSON__jsonDataWithMetrics___block_invoke;
    v11[3] = &unk_18A290E58;
    id v5 = v4;
    id v12 = v5;
    [v3 enumerateObjectsUsingBlock:v11];
    if ([v5 count] && objc_msgSend(MEMORY[0x1896078D8], "isValidJSONObject:", v5))
    {
      [MEMORY[0x1896078D8] dataWithJSONObject:v5 options:1 error:0];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      PPSStorageLog();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric(JSON) jsonDataWithMetrics:].cold.2();
      }

      uint64_t v6 = 0LL;
    }
  }

  else
  {
    PPSStorageLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric(JSON) jsonDataWithMetrics:].cold.1((os_log_s *)v5, v8, v9);
    }
    uint64_t v6 = 0LL;
  }

  return v6;
}

void __39__PPSMetric_JSON__jsonDataWithMetrics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    id v3 = v4;
  }
}

+ (BOOL)isValidMetricJSON:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v4 objectForKeyedSubscript:@"name"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      [v4 objectForKeyedSubscript:@"subsystem"];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char v8 = objc_opt_isKindOfClass();

      if ((v8 & 1) != 0)
      {
        [v4 objectForKeyedSubscript:@"category"];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        char v10 = objc_opt_isKindOfClass();

        if ((v10 & 1) != 0)
        {
          [v4 objectForKeyedSubscript:@"version"];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          char v12 = objc_opt_isKindOfClass();

          if ((v12 & 1) != 0)
          {
            [v4 objectForKeyedSubscript:@"datatype"];
            id v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            char v14 = objc_opt_isKindOfClass();

            if ((v14 & 1) != 0)
            {
              [v4 objectForKeyedSubscript:@"directionality"];
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v15)
              {
                PPSStorageLog();
                v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
                  +[PPSMetric(JSON) isValidMetricJSON:].cold.17();
                }

                [v4 setObject:&unk_18A29AB00 forKeyedSubscript:@"directionality"];
              }

              [v4 objectForKeyedSubscript:@"directionality"];
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              char v18 = objc_opt_isKindOfClass();

              if ((v18 & 1) != 0)
              {
                [v4 objectForKeyedSubscript:@"storage"];
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                char v20 = objc_opt_isKindOfClass();

                if ((v20 & 1) != 0)
                {
                  [v4 objectForKeyedSubscript:@"timeToLive"];
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  char v22 = objc_opt_isKindOfClass();

                  if ((v22 & 1) != 0)
                  {
                    [v4 objectForKeyedSubscript:@"mode"];
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    char v24 = objc_opt_isKindOfClass();

                    if ((v24 & 1) != 0)
                    {
                      [v4 objectForKeyedSubscript:@"enabledPopulation"];
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      char v26 = objc_opt_isKindOfClass();

                      if ((v26 & 1) != 0)
                      {
                        [v4 objectForKeyedSubscript:@"deviceCapability"];
                        v27 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v27)
                        {
                          PPSStorageLog();
                          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
                            +[PPSMetric(JSON) isValidMetricJSON:].cold.11();
                          }

                          [v4 setObject:&unk_18A29AB18 forKeyedSubscript:@"deviceCapability"];
                        }

                        [v4 objectForKeyedSubscript:@"deviceCapability"];
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        char v30 = objc_opt_isKindOfClass();

                        if ((v30 & 1) != 0)
                        {
                          [v4 objectForKeyedSubscript:@"obfuscation"];
                          v31 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v31)
                          {
                            PPSStorageLog();
                            v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
                              +[PPSMetric(JSON) isValidMetricJSON:].cold.9();
                            }

                            [v4 setObject:&unk_18A29AB18 forKeyedSubscript:@"obfuscation"];
                          }

                          [v4 objectForKeyedSubscript:@"obfuscation"];
                          v33 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          char v34 = objc_opt_isKindOfClass();

                          if ((v34 & 1) != 0)
                          {
                            [v4 objectForKeyedSubscript:@"privacyClassification"];
                            v35 = (void *)objc_claimAutoreleasedReturnValue();

                            if (!v35)
                            {
                              PPSStorageLog();
                              v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
                                +[PPSMetric(JSON) isValidMetricJSON:].cold.7();
                              }

                              [v4 setObject:&unk_18A29AB30 forKeyedSubscript:@"privacyClassification"];
                            }

                            [v4 objectForKeyedSubscript:@"privacyClassification"];
                            v37 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            char v38 = objc_opt_isKindOfClass();

                            if ((v38 & 1) != 0)
                            {
                              [v4 objectForKeyedSubscript:@"enumMapping"];
                              v39 = (void *)objc_claimAutoreleasedReturnValue();
                              int v40 = [a1 isValidEnumDeclarationJSON:v39];

                              if (!v40) {
                                goto LABEL_77;
                              }
                              [v4 objectForKeyedSubscript:@"source"];
                              double v41 = (void *)objc_claimAutoreleasedReturnValue();
                              int v42 = [a1 isValidSourceJSON:v41];

                              if (!v42
                                || ([v4 objectForKeyedSubscript:@"groupBy"],
                                    unsigned int v43 = (void *)objc_claimAutoreleasedReturnValue(),
                                    int v44 = [a1 isValidGroupingDimensionsJSON:v43],
                                    v43,
                                    !v44))
                              {
LABEL_77:
                                char v68 = 0;
                                goto LABEL_76;
                              }

                              uint64_t v45 = [v4 objectForKeyedSubscript:@"auxiliaryType"];
                              if (v45
                                && (v46 = (void *)v45,
                                    [v4 objectForKeyedSubscript:@"auxiliaryType"],
                                    v47 = (void *)objc_claimAutoreleasedReturnValue(),
                                    objc_opt_class(),
                                    char v48 = objc_opt_isKindOfClass(),
                                    v47,
                                    v46,
                                    (v48 & 1) == 0))
                              {
                                PPSStorageLog();
                                v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                                  +[PPSMetric(JSON) isValidMetricJSON:].cold.5();
                                }
                              }

                              else
                              {
                                uint64_t v49 = [v4 objectForKeyedSubscript:@"filterEntryLogging"];
                                if (v49
                                  && (v50 = (void *)v49,
                                      [v4 objectForKeyedSubscript:@"filterEntryLogging"],
                                      unsigned int v51 = (void *)objc_claimAutoreleasedReturnValue(),
                                      objc_opt_class(),
                                      char v52 = objc_opt_isKindOfClass(),
                                      v51,
                                      v50,
                                      (v52 & 1) == 0))
                                {
                                  PPSStorageLog();
                                  v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                                    +[PPSMetric(JSON) isValidMetricJSON:].cold.4();
                                  }
                                }

                                else
                                {
                                  uint64_t v53 = [v4 objectForKeyedSubscript:@"dmaCompliant"];
                                  if (v53
                                    && (v54 = (void *)v53,
                                        [v4 objectForKeyedSubscript:@"dmaCompliant"],
                                        unsigned int v55 = (void *)objc_claimAutoreleasedReturnValue(),
                                        objc_opt_class(),
                                        char v56 = objc_opt_isKindOfClass(),
                                        v55,
                                        v54,
                                        (v56 & 1) == 0))
                                  {
                                    PPSStorageLog();
                                    v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                                      +[PPSMetric(JSON) isValidMetricJSON:].cold.3();
                                    }
                                  }

                                  else
                                  {
                                    uint64_t v57 = [v4 objectForKeyedSubscript:@"exampleValue"];
                                    if (v57
                                      && (v58 = (void *)v57,
                                          [v4 objectForKeyedSubscript:@"exampleValue"],
                                          v59 = (void *)objc_claimAutoreleasedReturnValue(),
                                          objc_opt_class(),
                                          char v60 = objc_opt_isKindOfClass(),
                                          v59,
                                          v58,
                                          (v60 & 1) == 0))
                                    {
                                      PPSStorageLog();
                                      v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                                      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                                        +[PPSMetric(JSON) isValidMetricJSON:].cold.2();
                                      }
                                    }

                                    else
                                    {
                                      uint64_t v61 = [v4 objectForKeyedSubscript:@"metricDescription"];
                                      if (!v61
                                        || (v62 = (void *)v61,
                                            [v4 objectForKeyedSubscript:@"metricDescription"],
                                            v63 = (void *)objc_claimAutoreleasedReturnValue(),
                                            objc_opt_class(),
                                            char v64 = objc_opt_isKindOfClass(),
                                            v63,
                                            v62,
                                            (v64 & 1) != 0))
                                      {
                                        uint64_t v65 = [v4 objectForKeyedSubscript:@"fixedArraySize"];
                                        if (!v65)
                                        {
                                          char v68 = 1;
                                          goto LABEL_76;
                                        }

                                        v66 = (os_log_s *)v65;
                                        [v4 objectForKeyedSubscript:@"fixedArraySize"];
                                        v67 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_opt_class();
                                        char v68 = objc_opt_isKindOfClass();

                                        goto LABEL_75;
                                      }

                                      PPSStorageLog();
                                      v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                                      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                                        +[PPSMetric(JSON) isValidMetricJSON:].cold.1();
                                      }
                                    }
                                  }
                                }
                              }
                            }

                            else
                            {
                              PPSStorageLog();
                              v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                                +[PPSMetric(JSON) isValidMetricJSON:].cold.6();
                              }
                            }
                          }

                          else
                          {
                            PPSStorageLog();
                            v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                              +[PPSMetric(JSON) isValidMetricJSON:].cold.8();
                            }
                          }
                        }

                        else
                        {
                          PPSStorageLog();
                          v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                            +[PPSMetric(JSON) isValidMetricJSON:].cold.10();
                          }
                        }
                      }

                      else
                      {
                        PPSStorageLog();
                        v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                          +[PPSMetric(JSON) isValidMetricJSON:].cold.12();
                        }
                      }
                    }

                    else
                    {
                      PPSStorageLog();
                      v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                        +[PPSMetric(JSON) isValidMetricJSON:].cold.13();
                      }
                    }
                  }

                  else
                  {
                    PPSStorageLog();
                    v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                      +[PPSMetric(JSON) isValidMetricJSON:].cold.14();
                    }
                  }
                }

                else
                {
                  PPSStorageLog();
                  v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                    +[PPSMetric(JSON) isValidMetricJSON:].cold.15();
                  }
                }
              }

              else
              {
                PPSStorageLog();
                v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                  +[PPSMetric(JSON) isValidMetricJSON:].cold.16();
                }
              }
            }

            else
            {
              PPSStorageLog();
              v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                +[PPSMetric(JSON) isValidMetricJSON:].cold.18();
              }
            }
          }

          else
          {
            PPSStorageLog();
            v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
              +[PPSMetric(JSON) isValidMetricJSON:].cold.19();
            }
          }
        }

        else
        {
          PPSStorageLog();
          v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
            +[PPSMetric(JSON) isValidMetricJSON:].cold.20();
          }
        }
      }

      else
      {
        PPSStorageLog();
        v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
          +[PPSMetric(JSON) isValidMetricJSON:].cold.21();
        }
      }
    }

    else
    {
      PPSStorageLog();
      v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric(JSON) isValidMetricJSON:].cold.22();
      }
    }
  }

  else
  {
    PPSStorageLog();
    v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric(JSON) isValidMetricJSON:].cold.23();
    }
  }

  char v68 = 0;
LABEL_75:

LABEL_76:
  return v68 & 1;
}

+ (BOOL)isValidEnumDeclarationJSON:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v7 = 0LL;
    char v8 = &v7;
    uint64_t v9 = 0x2020000000LL;
    char v10 = 1;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke;
    v6[3] = &unk_18A290E80;
    v6[4] = &v7;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];
    LODWORD(v4) = *((unsigned __int8 *)v8 + 24);
    _Block_object_dispose(&v7, 8);
    if ((_DWORD)v4) {
LABEL_4:
    }
      LOBYTE(v4) = 1;
  }

  else
  {
    PPSStorageLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric(JSON) isValidEnumDeclarationJSON:].cold.1();
    }

    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

void __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSStorageLog();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke_cold_2();
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSStorageLog();
    char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke_cold_1();
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

+ (BOOL)isValidSourceJSON:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PPSStorageLog();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric(JSON) isValidSourceJSON:].cold.1();
    }

    BOOL v4 = 0;
  }

  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidGroupingDimensionsJSON:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      id v4 = v3;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v13;
        while (2)
        {
          for (uint64_t i = 0LL; i != v6; ++i)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              PPSMetricLog();
              char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
                +[PPSMetric(JSON) isValidGroupingDimensionsJSON:].cold.1();
              }

              goto LABEL_18;
            }
          }

          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
          BOOL v9 = 1;
          if (v6) {
            continue;
          }
          break;
        }
      }

      else
      {
        BOOL v9 = 1;
      }
    }

    else
    {
      PPSStorageLog();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric(JSON) isValidGroupingDimensionsJSON:].cold.2();
      }
LABEL_18:
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

+ (id)metricWithProto:(id)a3
{
  id v4 = a3;
  [a1 setOptionalFields:v4];
  char v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSMetric setMetadataDefaults:](&OBJC_CLASS___PPSMetric, "setMetadataDefaults:", v4);
  v25 = objc_alloc(&OBJC_CLASS___PPSMetric);
  [v4 name];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 subsystem];
  char v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 category];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 version];
  double v6 = v5;
  unsigned int v19 = [v4 datatype];
  [v4 unit];
  char v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit unitWithProto:](&OBJC_CLASS___PPSUnit, "unitWithProto:", v20);
  char v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 cadence];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceWithProto:](&OBJC_CLASS___PPSCadence, "cadenceWithProto:", v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v17 = [v4 directionality];
  unsigned int v9 = [v4 storage];
  unsigned int v10 = [v4 timeToLive];
  unsigned int v11 = [v4 mode];
  unsigned int v12 = [v4 deviceCapability];
  unsigned int v13 = [v4 enabledPopulation];
  unsigned int v14 = [v4 obfuscation];
  LODWORD(a1) = [v4 privacyClassification];

  __int128 v15 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v25,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCap ability:population:obfuscation:privacyClassification:optionalPayload:",  v23,  v22,  v21,  v19,  v18,  v8,  v6,  __PAIR64__(v9, v17),  __PAIR64__(v11, v10),  __PAIR64__(v13, v12),  __PAIR64__(a1, v14),  v24);
  return v15;
}

+ (id)metricWithProto:(id)a3 withBuild:(id)a4
{
  id v6 = a4;
  [a1 metricWithProto:a3];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setValue:v6 forKey:@"build"];

  return v7;
}

- (id)proto
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PPSPBMetric);
  -[PPSMetric name](self, "name");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSPBMetric setName:](v3, "setName:", v4);

  -[PPSMetric subsystem](self, "subsystem");
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSPBMetric setSubsystem:](v3, "setSubsystem:", v5);

  -[PPSMetric category](self, "category");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSPBMetric setCategory:](v3, "setCategory:", v6);

  -[PPSMetric version](self, "version");
  -[PPSPBMetric setVersion:](v3, "setVersion:");
  -[PPSPBMetric setDatatype:](v3, "setDatatype:", -[PPSMetric datatype](self, "datatype"));
  -[PPSMetric unit](self, "unit");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 proto];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSPBMetric setUnit:](v3, "setUnit:", v8);

  -[PPSMetric cadence](self, "cadence");
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 proto];
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSPBMetric setCadence:](v3, "setCadence:", v10);

  -[PPSPBMetric setDirectionality:](v3, "setDirectionality:", -[PPSMetric directionality](self, "directionality"));
  -[PPSPBMetric setStorage:](v3, "setStorage:", -[PPSMetric storage](self, "storage"));
  -[PPSPBMetric setTimeToLive:](v3, "setTimeToLive:", -[PPSMetric timeToLive](self, "timeToLive"));
  -[PPSPBMetric setMode:](v3, "setMode:", -[PPSMetric mode](self, "mode"));
  -[PPSPBMetric setDeviceCapability:]( v3,  "setDeviceCapability:",  -[PPSMetric deviceCapability](self, "deviceCapability"));
  -[PPSPBMetric setEnabledPopulation:]( v3,  "setEnabledPopulation:",  -[PPSMetric enabledPopulation](self, "enabledPopulation"));
  -[PPSPBMetric setObfuscation:](v3, "setObfuscation:", -[PPSMetric obfuscation](self, "obfuscation"));
  -[PPSPBMetric setPrivacyClassification:]( v3,  "setPrivacyClassification:",  -[PPSMetric privacyClassification](self, "privacyClassification"));
  -[PPSMetric rounding](self, "rounding");
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PPSMetric rounding](self, "rounding");
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 proto];
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSPBMetric setRounding:](v3, "setRounding:", v13);
  }

  -[PPSMetric enumMapping](self, "enumMapping");
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PPSMetric enumMapping](self, "enumMapping");
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[PPSMetric enumMappingToProto:](&OBJC_CLASS___PPSMetric, "enumMappingToProto:", v15);
    -[PPSPBMetric setEnumMapping:](v3, "setEnumMapping:", v16);
  }

  -[PPSMetric source](self, "source");
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[PPSMetric source](self, "source");
    char v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSMetric sourceToProto:](&OBJC_CLASS___PPSMetric, "sourceToProto:", v18);
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSPBMetric setSource:](v3, "setSource:", v19);
  }

  -[PPSMetric groupBy](self, "groupBy");
  char v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = -[PPSMetric groupBy](self, "groupBy");
    +[PPSMetric groupByToProto:](&OBJC_CLASS___PPSMetric, "groupByToProto:", v21);
    char v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSPBMetric setGroupBy:](v3, "setGroupBy:", v22);
  }
  v23 = -[PPSMetric metricType](self, "metricType");
  if (v23)
  {
    -[PPSMetric metricType](self, "metricType");
    char v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 proto];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSPBMetric setMetricType:](v3, "setMetricType:", v25);
  }

  if (-[PPSMetric auxiliaryType](self, "auxiliaryType")) {
    -[PPSPBMetric setAuxiliaryType:](v3, "setAuxiliaryType:", -[PPSMetric auxiliaryType](self, "auxiliaryType"));
  }
  if (-[PPSMetric filterEntryLogging](self, "filterEntryLogging")) {
    -[PPSPBMetric setFilterEntryLogging:]( v3,  "setFilterEntryLogging:",  -[PPSMetric filterEntryLogging](self, "filterEntryLogging"));
  }
  if (-[PPSMetric DMACompliant](self, "DMACompliant")) {
    -[PPSPBMetric setDmaCompliant:](v3, "setDmaCompliant:", -[PPSMetric DMACompliant](self, "DMACompliant"));
  }
  if (-[PPSMetric fixedArraySize](self, "fixedArraySize")) {
    -[PPSPBMetric setFixedArraySize:](v3, "setFixedArraySize:", -[PPSMetric fixedArraySize](self, "fixedArraySize"));
  }
  return v3;
}

- (id)protoData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 data];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)enumMappingWithProto:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [v3 enumMaps];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = (void *)objc_opt_new();
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    objc_msgSend(v3, "enumMaps", 0);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          unsigned int v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          [v12 value];
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 key];
          unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 setObject:v13 forKeyedSubscript:v14];
        }

        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v9);
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

+ (id)enumMappingToProto:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___PPSPBEnumMapping);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __42__PPSMetric_Protobuf__enumMappingToProto___block_invoke;
  v7[3] = &unk_18A290EA8;
  uint64_t v5 = v4;
  uint64_t v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __42__PPSMetric_Protobuf__enumMappingToProto___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = (id)objc_opt_new();
  [v7 setKey:v6];

  [v7 setValue:v5];
  [*(id *)(a1 + 32) addEnumMap:v7];
}

+ (id)sourceWithProto:(id)a3
{
  return (id)[a3 source];
}

+ (id)sourceToProto:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___PPSPBSource);
  -[PPSPBSource setSource:](v4, "setSource:", v3);

  return v4;
}

+ (id)groupByWithProto:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_opt_new();
  uint64_t v5 = [v3 groupBysCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0LL; i != v6; ++i)
    {
      [v3 groupByAtIndex:i];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 addObject:v8];
    }
  }

  return v4;
}

+ (id)groupByToProto:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___PPSPBGroupingDimensions);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[PPSPBGroupingDimensions addGroupBy:]( v4,  "addGroupBy:",  *(void *)(*((void *)&v11 + 1) + 8 * v9++),  (void)v11);
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  return v4;
}

+ (void)setMetadataDefaults:(id)a3
{
  id v3 = a3;
}

+ (id)setOptionalFields:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_opt_new();
  [v3 enumMapping];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    [v3 enumMapping];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSMetric enumMappingWithProto:](&OBJC_CLASS___PPSMetric, "enumMappingWithProto:", v6);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    [v4 setObject:v7 forKeyedSubscript:@"EnumMapping"];
  }

  [v3 rounding];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    [v3 rounding];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSRounding roundingWithProto:](&OBJC_CLASS___PPSRounding, "roundingWithProto:", v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v10 forKeyedSubscript:@"Rounding"];
  }

  [v3 source];
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    [v3 source];
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSMetric sourceWithProto:](&OBJC_CLASS___PPSMetric, "sourceWithProto:", v12);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v13 forKeyedSubscript:@"Source"];
  }

  [v3 groupBy];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    [v3 groupBy];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSMetric groupByWithProto:](&OBJC_CLASS___PPSMetric, "groupByWithProto:", v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v16 forKeyedSubscript:@"GroupingDimensions"];
  }

  [v3 metricType];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    [v3 metricType];
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSMetricType metricTypeWithProto:](&OBJC_CLASS___PPSMetricType, "metricTypeWithProto:", v18);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v19 forKeyedSubscript:@"MetricType"];
  }

  if ([v3 auxiliaryType])
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v3, "auxiliaryType"));
    char v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v20 forKeyedSubscript:@"AuxiliaryType"];
  }

  if ([v3 filterEntryLogging])
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v3, "filterEntryLogging"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v21 forKeyedSubscript:@"FilterEntryLogging"];
  }

  if ([v3 dmaCompliant])
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v3, "dmaCompliant"));
    char v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v22 forKeyedSubscript:@"DMACompliant"];
  }

  if ([v3 fixedArraySize])
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", objc_msgSend(v3, "fixedArraySize"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v23 forKeyedSubscript:@"FixedArraySize"];
  }

  return v4;
}

- (PPSMetric)init
{
  return 0LL;
}

- (id)data
{
  if (self)
  {
    -[PPSMetric protoData](self, "protoData");
    self = (PPSMetric *)objc_claimAutoreleasedReturnValue();
  }

  return self;
}

- (PPSMetric)initWithName:(id)a3 version:(double)a4 datatype:(int)a5 unit:(id)a6 baseMetric:(id)a7 optionalPayload:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!v17
    || !+[PPSMetric isValidName:](&OBJC_CLASS___PPSMetric, "isValidName:", v15)
    || !+[PPSMetric isValidDatatype:](&OBJC_CLASS___PPSMetric, "isValidDatatype:", v11))
  {
    goto LABEL_10;
  }

  BOOL v19 = +[PPSMetric isValidVersion:](&OBJC_CLASS___PPSMetric, "isValidVersion:", a4);
  char v20 = 0LL;
  if (!v16 || !v19) {
    goto LABEL_11;
  }
  if (!+[PPSMetric isValidOptionalPayload:](&OBJC_CLASS___PPSMetric, "isValidOptionalPayload:", v18))
  {
LABEL_10:
    char v20 = 0LL;
    goto LABEL_11;
  }

  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___PPSMetric;
  uint64_t v21 = -[PPSMetric init](&v32, sel_init);
  char v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_name, a3);
    uint64_t v23 = [v17 subsystem];
    subsystem = v22->_subsystem;
    v22->_subsystem = (NSString *)v23;

    uint64_t v25 = [v17 category];
    category = v22->_category;
    v22->_category = (NSString *)v25;

    v22->_version = a4;
    v22->_datatype = v11;
    objc_storeStrong((id *)&v22->_unit, a6);
    uint64_t v27 = [v17 cadence];
    cadence = v22->_cadence;
    v22->_cadence = (PPSCadence *)v27;

    v22->_directionality = [v17 directionality];
    v22->_storage = [v17 storage];
    v22->_timeToLive = [v17 timeToLive];
    v22->_mode = [v17 mode];
    uint64_t v29 = [v17 source];
    source = v22->_source;
    v22->_source = (NSString *)v29;

    v22->_deviceCapability = [v17 deviceCapability];
    v22->_enabledPopulation = [v17 enabledPopulation];
    v22->_obfuscation = 1;
    v22->_privacyClassification = [v17 privacyClassification];
    -[PPSMetric addOptionalFields:](v22, "addOptionalFields:", v18);
  }

  self = v22;
  char v20 = self;
LABEL_11:

  return v20;
}

- (PPSMetric)initWithName:(id)a3 subsystem:(id)a4 category:(id)a5 version:(double)a6 datatype:(int)a7 unit:(id)a8 cadence:(id)a9 directionality:(int)a10 storage:(int)a11 timeToLive:(unsigned int)a12 mode:(int)a13 deviceCapability:(int)a14 population:(int)a15 obfuscation:(int)a16 privacyClassification:(int)a17 optionalPayload:(id)a18
{
  uint64_t v20 = *(void *)&a7;
  id v25 = a3;
  id v26 = a4;
  id v27 = a5;
  id v40 = a8;
  id v39 = a9;
  id v38 = a18;
  if (!+[PPSMetric isValidName:](&OBJC_CLASS___PPSMetric, "isValidName:", v25)
    || !+[PPSMetric isValidSubsystem:](&OBJC_CLASS___PPSMetric, "isValidSubsystem:", v26)
    || !+[PPSMetric isValidCategory:](&OBJC_CLASS___PPSMetric, "isValidCategory:", v27)
    || !+[PPSMetric isValidDatatype:](&OBJC_CLASS___PPSMetric, "isValidDatatype:", v20)
    || !+[PPSMetric isValidDirectionality:](&OBJC_CLASS___PPSMetric, "isValidDirectionality:")
    || !+[PPSMetric isValidStorage:](&OBJC_CLASS___PPSMetric, "isValidStorage:")
    || !+[PPSMetric isValidMode:](&OBJC_CLASS___PPSMetric, "isValidMode:")
    || !+[PPSMetric isValidPopulation:](&OBJC_CLASS___PPSMetric, "isValidPopulation:")
    || !+[PPSMetric isValidDeviceCapability:](&OBJC_CLASS___PPSMetric, "isValidDeviceCapability:")
    || !+[PPSMetric isValidObfuscation:](&OBJC_CLASS___PPSMetric, "isValidObfuscation:"))
  {
    v28 = v25;
    goto LABEL_21;
  }

  int v36 = v20;
  v28 = v25;
  if (!+[PPSMetric isValidPrivacyClassification:]( &OBJC_CLASS___PPSMetric,  "isValidPrivacyClassification:",  a17))
  {
LABEL_21:
    uint64_t v29 = v26;
    goto LABEL_22;
  }

  uint64_t v29 = v26;
  if (!+[PPSMetric isValidVersion:](&OBJC_CLASS___PPSMetric, "isValidVersion:", a6))
  {
LABEL_22:
    char v30 = v27;
    goto LABEL_23;
  }

  char v30 = v27;
  if (!+[PPSMetric isValidTTL:](&OBJC_CLASS___PPSMetric, "isValidTTL:", a12)) {
    goto LABEL_23;
  }
  v31 = 0LL;
  if (!v40 || !v39) {
    goto LABEL_24;
  }
  if (!+[PPSMetric isValidOptionalPayload:](&OBJC_CLASS___PPSMetric, "isValidOptionalPayload:", v38))
  {
LABEL_23:
    v31 = 0LL;
LABEL_24:
    char v34 = self;
    goto LABEL_25;
  }

  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___PPSMetric;
  objc_super v32 = -[PPSMetric init](&v41, sel_init);
  v33 = v32;
  if (v32)
  {
    objc_storeStrong((id *)&v32->_name, a3);
    objc_storeStrong((id *)&v33->_subsystem, a4);
    objc_storeStrong((id *)&v33->_category, a5);
    v33->_version = a6;
    v33->_datatype = v36;
    objc_storeStrong((id *)&v33->_unit, a8);
    objc_storeStrong((id *)&v33->_cadence, a9);
    v33->_directionality = a10;
    v33->_storage = a11;
    v33->_timeToLive = a12;
    v33->_mode = a13;
    v33->_deviceCapability = a14;
    v33->_enabledPopulation = a15;
    v33->_obfuscation = a16;
    v33->_privacyClassification = a17;
    -[PPSMetric addOptionalFields:](v33, "addOptionalFields:", v38);
  }

  char v34 = v33;
  v31 = v34;
LABEL_25:

  return v31;
}

- (void)setBuild:(id)a3
{
  id v5 = a3;
}

- (void)addEnumMapping:(id)a3
{
}

- (void)addSource:(id)a3
{
}

- (void)addRounding:(id)a3
{
}

- (void)addGroupingDimensions:(id)a3
{
}

- (void)addMetricType:(id)a3
{
}

- (void)addAuxiliaryType:(id)a3
{
  self->_auxiliaryType = [a3 unsignedLongValue];
}

- (void)addFilterEntryLogging:(id)a3
{
  self->_filterEntryLogging = [a3 BOOLValue];
}

- (void)addDMACompliant:(id)a3
{
  self->_DMACompliant = [a3 BOOLValue];
}

- (void)addFixedArraySize:(id)a3
{
  self->_fixedArraySize = [a3 intValue];
}

- (void)addOptionalFields:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v24 = v4;
    [v4 objectForKeyedSubscript:@"EnumMapping"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      [v24 objectForKeyedSubscript:@"EnumMapping"];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetric addEnumMapping:](self, "addEnumMapping:", v6);
    }

    [v24 objectForKeyedSubscript:@"Source"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      [v24 objectForKeyedSubscript:@"Source"];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetric addSource:](self, "addSource:", v8);
    }

    [v24 objectForKeyedSubscript:@"Rounding"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      [v24 objectForKeyedSubscript:@"Rounding"];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetric addRounding:](self, "addRounding:", v10);
    }

    [v24 objectForKeyedSubscript:@"GroupingDimensions"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      [v24 objectForKeyedSubscript:@"GroupingDimensions"];
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetric addGroupingDimensions:](self, "addGroupingDimensions:", v12);
    }

    [v24 objectForKeyedSubscript:@"MetricType"];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      [v24 objectForKeyedSubscript:@"MetricType"];
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetric addMetricType:](self, "addMetricType:", v14);
    }

    [v24 objectForKeyedSubscript:@"AuxiliaryType"];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      [v24 objectForKeyedSubscript:@"AuxiliaryType"];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetric addAuxiliaryType:](self, "addAuxiliaryType:", v16);
    }

    [v24 objectForKeyedSubscript:@"FilterEntryLogging"];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      [v24 objectForKeyedSubscript:@"FilterEntryLogging"];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetric addFilterEntryLogging:](self, "addFilterEntryLogging:", v18);
    }

    [v24 objectForKeyedSubscript:@"DMACompliant"];
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      [v24 objectForKeyedSubscript:@"DMACompliant"];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetric addDMACompliant:](self, "addDMACompliant:", v20);
    }

    [v24 objectForKeyedSubscript:@"FixedArraySize"];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      [v24 objectForKeyedSubscript:@"FixedArraySize"];
      char v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetric addFixedArraySize:](self, "addFixedArraySize:", v22);
    }

    unsigned int auxiliaryType = self->_auxiliaryType;
    if (auxiliaryType <= 1) {
      unsigned int auxiliaryType = 1;
    }
    self->_unsigned int auxiliaryType = auxiliaryType;
  }

  else
  {
    self->_unsigned int auxiliaryType = 1;
    self->_filterEntryLogging = 0;
  }

+ (BOOL)isValidSubsystem:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    objc_msgSend(MEMORY[0x189607930], "characterSetWithRange:", 65, 26);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addCharactersInRange:", 97, 26);
    objc_msgSend(v5, "addCharactersInRange:", 48, 10);
    [v5 addCharactersInString:@"-_."];
    [v4 stringByTrimmingCharactersInSet:v5];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    char v7 = [v6 isEqualToString:&stru_18A292320];

    if ((v7 & 1) == 0)
    {
      PPSMetricLog();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric isValidSubsystem:].cold.2();
      }
    }
  }

  else
  {
    PPSMetricLog();
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidSubsystem:].cold.1();
    }
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isValidCategory:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    [MEMORY[0x189607930] alphanumericCharacterSet];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 addCharactersInString:@"-_."];
    [v4 stringByTrimmingCharactersInSet:v5];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    char v7 = [v6 isEqualToString:&stru_18A292320];

    if ((v7 & 1) == 0)
    {
      PPSMetricLog();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric isValidCategory:].cold.2();
      }
    }
  }

  else
  {
    PPSMetricLog();
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidCategory:].cold.1();
    }
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isValidName:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    if ([v4 canBeConvertedToEncoding:1])
    {
      [v4 lowercaseString];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      int v6 = [v5 isEqualToString:@"timestamp"];

      if (!v6)
      {
        BOOL v8 = 1;
        goto LABEL_12;
      }

      PPSMetricLog();
      char v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric isValidName:].cold.2();
      }
    }

    else
    {
      PPSMetricLog();
      char v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric isValidName:].cold.3();
      }
    }
  }

  else
  {
    PPSMetricLog();
    char v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidName:].cold.1();
    }
  }

  BOOL v8 = 0;
LABEL_12:

  return v8;
}

+ (BOOL)isValidDatatype:(int)a3
{
  unsigned int v3 = a3 - 1;
  if ((a3 - 1) >= 9)
  {
    PPSMetricLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidDatatype:].cold.1();
    }
  }

  return v3 < 9;
}

+ (BOOL)isValidDirectionality:(int)a3
{
  unsigned int v3 = a3 - 1;
  if ((a3 - 1) >= 6)
  {
    PPSMetricLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidDirectionality:].cold.1();
    }
  }

  return v3 < 6;
}

+ (BOOL)isValidStorage:(int)a3
{
  unsigned int v3 = a3 - 1;
  if ((a3 - 1) >= 5)
  {
    PPSMetricLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidStorage:].cold.1();
    }
  }

  return v3 < 5;
}

+ (BOOL)isValidMode:(int)a3
{
  unsigned int v3 = a3 - 1;
  if ((a3 - 1) >= 7)
  {
    PPSMetricLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidMode:].cold.1();
    }
  }

  return v3 < 7;
}

+ (BOOL)isValidPopulation:(int)a3
{
  unsigned int v3 = a3 - 1;
  if ((a3 - 1) >= 3)
  {
    PPSMetricLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidPopulation:].cold.1();
    }
  }

  return v3 < 3;
}

+ (BOOL)isValidTTL:(unsigned int)a3
{
  unsigned int v3 = a3 - 1;
  if (a3 - 1 >= 0xE42)
  {
    PPSMetricLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidTTL:].cold.1();
    }
  }

  return v3 < 0xE42;
}

+ (BOOL)isValidVersion:(double)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 doubleValue];
  double v6 = v5;

  if (v6 != a3)
  {
    PPSMetricLog();
    char v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidVersion:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  return v6 == a3;
}

+ (BOOL)isValidDeviceCapability:(int)a3
{
  unsigned int v3 = a3 - 1;
  if ((a3 - 1) >= 0x15)
  {
    PPSMetricLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidDeviceCapability:].cold.1();
    }
  }

  return v3 < 0x15;
}

+ (BOOL)isValidObfuscation:(int)a3
{
  unsigned int v3 = a3 - 1;
  if ((a3 - 1) >= 3)
  {
    PPSMetricLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidObfuscation:].cold.1();
    }
  }

  return v3 < 3;
}

+ (BOOL)isValidPrivacyClassification:(int)a3
{
  unsigned int v3 = a3 - 1;
  if ((a3 - 1) >= 3)
  {
    PPSMetricLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidPrivacyClassification:].cold.1();
    }
  }

  return v3 < 3;
}

+ (BOOL)isValidAuxiliaryType:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSMetricLog();
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidAuxiliaryType:].cold.2();
    }
    goto LABEL_9;
  }

  if ((unint64_t)([v3 unsignedLongValue] - 1) >= 3)
  {
    PPSMetricLog();
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidAuxiliaryType:].cold.1();
    }
LABEL_9:

    BOOL v4 = 0;
    goto LABEL_10;
  }

+ (BOOL)isValidFilterEntryLogging:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PPSMetricLog();
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidFilterEntryLogging:].cold.1();
    }

    BOOL v4 = 0;
  }

  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidDMACompliant:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PPSMetricLog();
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidDMACompliant:].cold.1();
    }

    BOOL v4 = 0;
  }

  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidFixedArraySize:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PPSMetricLog();
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidFixedArraySize:].cold.1();
    }

    BOOL v4 = 0;
  }

  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidOptionalPayload:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (!v3) {
    goto LABEL_11;
  }
  [v3 objectForKeyedSubscript:@"EnumMapping"];
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = +[PPSMetric isValidEnumDeclaration:](&OBJC_CLASS___PPSMetric, "isValidEnumDeclaration:", v5);

  if (v6)
  {
    [v4 objectForKeyedSubscript:@"Rounding"];
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v6 = +[PPSMetric isValidRounding:](&OBJC_CLASS___PPSMetric, "isValidRounding:", v7);

    if (v6)
    {
      [v4 objectForKeyedSubscript:@"Source"];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v6 = +[PPSMetric isValidSource:](&OBJC_CLASS___PPSMetric, "isValidSource:", v8);

      if (v6)
      {
        [v4 objectForKeyedSubscript:@"GroupingDimensions"];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v6 = +[PPSMetric isValidGroupingDimensions:](&OBJC_CLASS___PPSMetric, "isValidGroupingDimensions:", v9);

        if (v6)
        {
          [v4 objectForKeyedSubscript:@"MetricType"];
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v6 = +[PPSMetric isValidMetricType:](&OBJC_CLASS___PPSMetric, "isValidMetricType:", v10);

          if (v6)
          {
            [v4 objectForKeyedSubscript:@"AuxiliaryType"];
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v6 = +[PPSMetric isValidAuxiliaryType:](&OBJC_CLASS___PPSMetric, "isValidAuxiliaryType:", v11);

            if (v6)
            {
              [v4 objectForKeyedSubscript:@"FilterEntryLogging"];
              uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
              BOOL v6 = +[PPSMetric isValidFilterEntryLogging:](&OBJC_CLASS___PPSMetric, "isValidFilterEntryLogging:", v12);

              if (v6)
              {
                [v4 objectForKeyedSubscript:@"DMACompliant"];
                uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
                BOOL v6 = +[PPSMetric isValidDMACompliant:](&OBJC_CLASS___PPSMetric, "isValidDMACompliant:", v13);

                if (v6)
                {
                  [v4 objectForKeyedSubscript:@"FixedArraySize"];
                  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
                  BOOL v6 = +[PPSMetric isValidFixedArraySize:](&OBJC_CLASS___PPSMetric, "isValidFixedArraySize:", v14);

                  if (v6) {
LABEL_11:
                  }
                    LOBYTE(v6) = 1;
                }
              }
            }
          }
        }
      }
    }
  }

  return v6;
}

+ (BOOL)isValidEnumDeclaration:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000LL;
    char v10 = 1;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __36__PPSMetric_isValidEnumDeclaration___block_invoke;
    v6[3] = &unk_18A290E80;
    v6[4] = &v7;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];
    LODWORD(v4) = *((unsigned __int8 *)v8 + 24);
    _Block_object_dispose(&v7, 8);
    if ((_DWORD)v4) {
LABEL_4:
    }
      LOBYTE(v4) = 1;
  }

  else
  {
    PPSMetricLog();
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidEnumDeclaration:].cold.1();
    }

    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

void __36__PPSMetric_isValidEnumDeclaration___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSMetricLog();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke_cold_2();
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSMetricLog();
    char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke_cold_1();
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

+ (BOOL)isValidSource:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PPSMetricLog();
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric(JSON) isValidSourceJSON:].cold.1();
    }

    BOOL v4 = 0;
  }

  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidRounding:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PPSMetricLog();
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidRounding:].cold.1();
    }

    BOOL v4 = 0;
  }

  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidGroupingDimensions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      id v4 = v3;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v13;
        while (2)
        {
          for (uint64_t i = 0LL; i != v6; ++i)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              PPSMetricLog();
              char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
                +[PPSMetric(JSON) isValidGroupingDimensionsJSON:].cold.1();
              }

              goto LABEL_18;
            }
          }

          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
          BOOL v9 = 1;
          if (v6) {
            continue;
          }
          break;
        }
      }

      else
      {
        BOOL v9 = 1;
      }
    }

    else
    {
      PPSMetricLog();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric isValidGroupingDimensions:].cold.2();
      }
LABEL_18:
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

+ (BOOL)isValidMetricType:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PPSMetricLog();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetric isValidMetricType:].cold.1();
    }

    BOOL v4 = 0;
  }

  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidBuild:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v11 = 0LL;
    [MEMORY[0x189607A00] regularExpressionWithPattern:@"^([0-9]+)([A-Z])([0-9]+)([a-z]?)$" options:1 error:&v11];
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = v11;
    uint64_t v6 = objc_msgSend(v4, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    if (v5) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = v6 == 1;
    }
    BOOL v8 = v7;
    if (!v7)
    {
      PPSMetricLog();
      BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric isValidBuild:].cold.1();
      }

      BOOL v4 = v5;
    }
  }

  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (NSString)build
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (NSString)subsystem
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (double)version
{
  return self->_version;
}

- (int)datatype
{
  return self->_datatype;
}

- (PPSUnit)unit
{
  return (PPSUnit *)objc_getProperty(self, a2, 96LL, 1);
}

- (PPSCadence)cadence
{
  return (PPSCadence *)objc_getProperty(self, a2, 104LL, 1);
}

- (int)directionality
{
  return self->_directionality;
}

- (int)storage
{
  return self->_storage;
}

- (unsigned)timeToLive
{
  return self->_timeToLive;
}

- (int)mode
{
  return self->_mode;
}

- (int)deviceCapability
{
  return self->_deviceCapability;
}

- (int)enabledPopulation
{
  return self->_enabledPopulation;
}

- (int)obfuscation
{
  return self->_obfuscation;
}

- (int)privacyClassification
{
  return self->_privacyClassification;
}

- (PPSRounding)rounding
{
  return (PPSRounding *)objc_getProperty(self, a2, 112LL, 1);
}

- (NSString)source
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (NSDictionary)enumMapping
{
  return (NSDictionary *)objc_getProperty(self, a2, 128LL, 1);
}

- (NSArray)groupBy
{
  return (NSArray *)objc_getProperty(self, a2, 136LL, 1);
}

- (PPSMetricType)metricType
{
  return (PPSMetricType *)objc_getProperty(self, a2, 144LL, 1);
}

- (int)auxiliaryType
{
  return self->_auxiliaryType;
}

- (BOOL)filterEntryLogging
{
  return self->_filterEntryLogging;
}

- (BOOL)DMACompliant
{
  return self->_DMACompliant;
}

- (unsigned)fixedArraySize
{
  return self->_fixedArraySize;
}

- (void).cxx_destruct
{
}

+ (id)metricsWithPlist:(id)a3 subsystem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    BOOL v7 = (os_log_s *)[objc_alloc(MEMORY[0x189603F68]) initWithContentsOfURL:v5];
    BOOL v8 = v7;
    if (v7)
    {
      -[os_log_s objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", @"metrics");
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          [MEMORY[0x189603FA8] array];
          char v10 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = MEMORY[0x1895F87A8];
          v35[1] = 3221225472LL;
          v35[2] = __47__PPSMetric_Plist__metricsWithPlist_subsystem___block_invoke;
          v35[3] = &unk_18A291360;
          id v36 = v6;
          id v11 = v10;
          id v37 = v11;
          [v9 enumerateObjectsUsingBlock:v35];
          __int128 v12 = v37;
          id v13 = v11;

LABEL_15:
          goto LABEL_16;
        }
      }

      PPSStorageLog();
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric(Plist) metricsWithPlist:subsystem:].cold.3((uint64_t)v9, v21, v22, v23, v24, v25, v26, v27);
      }
    }

    else
    {
      PPSStorageLog();
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
        +[PPSMetric(Plist) metricsWithPlist:subsystem:].cold.2( (uint64_t)v5,  (os_log_s *)v9,  v28,  v29,  v30,  v31,  v32,  v33);
      }
    }

    id v13 = 0LL;
    goto LABEL_15;
  }

  PPSStorageLog();
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[PPSMetric(Plist) metricsWithPlist:subsystem:].cold.1(v8, v14, v15, v16, v17, v18, v19, v20);
  }
  id v13 = 0LL;
LABEL_16:

  return v13;
}

void __47__PPSMetric_Plist__metricsWithPlist_subsystem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (!*(void *)(a1 + 32)
    || ([v3 objectForKeyedSubscript:@"subsystem"],
        id v5 = (void *)objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:*(void *)(a1 + 32)],
        v5,
        v6))
  {
    +[PPSMetric metricWithJSONObject:](&OBJC_CLASS___PPSMetric, "metricWithJSONObject:", v4);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      [*(id *)(a1 + 40) addObject:v7];
    }

    else
    {
      PPSStorageLog();
      BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __47__PPSMetric_Plist__metricsWithPlist_subsystem___block_invoke_cold_1( (uint64_t)v4,  v8,  v9,  v10,  v11,  v12,  v13,  v14);
      }
    }
  }
}

void __39__PPSMetric_JSON__metricsWithJSONData___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_188807000, v0, v1, "Could not construct PPSMetric from JSON object: %@", v2);
  OUTLINED_FUNCTION_6();
}

void __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke_cold_1()
{
  v0 = (void *)OUTLINED_FUNCTION_12();
  id v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4( &dword_188807000,  v2,  v3,  "Enum Map expects String : String map, found value %@[%@]",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

void __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke_cold_2()
{
  v0 = (void *)OUTLINED_FUNCTION_12();
  id v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4( &dword_188807000,  v2,  v3,  "Enum Map expects String : String map, found key %@[%@]",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidSubsystem:.cold.1()
{
}

+ (void)isValidSubsystem:.cold.2()
{
}

+ (void)isValidCategory:.cold.1()
{
}

+ (void)isValidCategory:.cold.2()
{
}

+ (void)isValidName:.cold.1()
{
}

+ (void)isValidName:.cold.2()
{
}

+ (void)isValidName:.cold.3()
{
}

+ (void)isValidDatatype:.cold.1()
{
}

+ (void)isValidDirectionality:.cold.1()
{
}

+ (void)isValidStorage:.cold.1()
{
}

+ (void)isValidMode:.cold.1()
{
}

+ (void)isValidPopulation:.cold.1()
{
}

+ (void)isValidTTL:.cold.1()
{
}

+ (void)isValidVersion:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)isValidDeviceCapability:.cold.1()
{
}

+ (void)isValidObfuscation:.cold.1()
{
}

+ (void)isValidPrivacyClassification:.cold.1()
{
}

+ (void)isValidAuxiliaryType:.cold.1()
{
}

+ (void)isValidAuxiliaryType:.cold.2()
{
  v0 = (void *)OUTLINED_FUNCTION_12();
  id v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_188807000, v2, v3, "auxiliaryType not a NSNumber type %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidFilterEntryLogging:.cold.1()
{
  v0 = (void *)OUTLINED_FUNCTION_12();
  id v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_188807000, v2, v3, "filterEntryLogging not a NSNumber type %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidDMACompliant:.cold.1()
{
  v0 = (void *)OUTLINED_FUNCTION_12();
  id v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_188807000, v2, v3, "dmaCompliant not a NSNumber type %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidFixedArraySize:.cold.1()
{
  v0 = (void *)OUTLINED_FUNCTION_12();
  id v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_188807000, v2, v3, "fixedArraySize not a NSNumber type %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidEnumDeclaration:.cold.1()
{
  v0 = (void *)OUTLINED_FUNCTION_12();
  id v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_188807000, v2, v3, "Enum Map not a dictionary %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidRounding:.cold.1()
{
  v0 = (void *)OUTLINED_FUNCTION_12();
  id v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_188807000, v2, v3, "Rounding not a PPSRounding type %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidGroupingDimensions:.cold.2()
{
  v0 = (void *)OUTLINED_FUNCTION_12();
  id v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_188807000, v2, v3, "Grouping dimensions not an array %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricType:.cold.1()
{
  v0 = (void *)OUTLINED_FUNCTION_12();
  id v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_188807000, v2, v3, "MetricType not a PPSMetricType type %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidBuild:.cold.1()
{
}

void __47__PPSMetric_Plist__metricsWithPlist_subsystem___block_invoke_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end