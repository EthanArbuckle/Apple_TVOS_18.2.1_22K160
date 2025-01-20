@interface WiFiUsageLQMSample
+ (BOOL)isPerSecond:(id)a3;
+ (id)allLQMProperties;
+ (id)binLabelfromFieldName:(id)a3 value:(int64_t)a4;
+ (id)featureFromFieldName:(id)a3;
+ (int64_t)subtract:(int64_t)a3 From:(int64_t)a4;
+ (void)initialize;
- (id)asDictionaryInto:(id)a3;
- (id)description;
- (id)numberForKeyPath:(id)a3;
@end

@implementation WiFiUsageLQMSample

- (id)numberForKeyPath:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = v3;
    if ([v4 unsignedLongValue] == 0x7FFFFFFFFFFFFFFFLL) {
      v5 = 0LL;
    }
    else {
      v5 = v4;
    }
    id v6 = v5;
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v3 = (void *)objc_opt_new();
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  [(id)objc_opt_class() allLQMProperties];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = -[WiFiUsageLQMSample numberForKeyPath:](self, "numberForKeyPath:", v9);
        [v3 appendFormat:@"%@:%@,", v9, v10, (void)v13];
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  [NSString stringWithString:v3];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)isPerSecond:(id)a3
{
  v3 = (void *)WiFiUsageLQMFieldNameToRoundMethod;
  id v4 = a3;
  [v3 allKeys];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithFormat:@"%@PerSecond", v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (id)asDictionaryInto:(id)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!v4) {
    id v4 = (id)objc_opt_new();
  }
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  [(id)objc_opt_class() allLQMProperties];
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    v8 = @"perCoreRssiInUse";
    do
    {
      uint64_t v9 = 0LL;
      uint64_t v25 = v6;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v27 + 1) + 8 * v9);
        v11 = -[WiFiUsageLQMSample numberForKeyPath:](self, "numberForKeyPath:", v10);
        [v4 setObject:v11 forKeyedSubscript:v10];

        if ([(id)objc_opt_class() isPerSecond:v10])
        {
          uint64_t v12 = v7;
          __int128 v13 = v8;
          __int128 v14 = (void *)MEMORY[0x189607968];
          [v4 objectForKeyedSubscript:v10];
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 doubleValue];
          double v17 = v16;
          -[WiFiUsageLQMSample numberForKeyPath:](self, "numberForKeyPath:", @"duration");
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "numberWithLong:", (uint64_t)(v17 / (double)objc_msgSend(v18, "integerValue")));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          [NSString stringWithFormat:@"%@PerSecond", v10];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 setObject:v19 forKeyedSubscript:v20];

          v8 = v13;
          uint64_t v7 = v12;
          uint64_t v6 = v25;
        }

        if ([v10 isEqualToString:v8])
        {
          [v4 objectForKeyedSubscript:v10];
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v22 = [v21 unsignedIntValue];
          v23 = +[WiFiUsagePrivacyFilter getLabelForCoreRssiMode:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getLabelForCoreRssiMode:",  v22);
          [v4 setObject:v23 forKeyedSubscript:v10];
        }

        ++v9;
      }

      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v6);
  }

  return v4;
}

+ (id)allLQMProperties
{
  v3 = (void *)objc_opt_new();
  if ([a1 isSubclassOfClass:objc_opt_class()])
  {
    while (1)
    {
      id v4 = class_copyPropertyList((Class)a1, &outCount);
      if (outCount) {
        break;
      }
      a1 = (id)[a1 superclass];
      if (v4) {
        goto LABEL_12;
      }
LABEL_13:
      if (([a1 isSubclassOfClass:objc_opt_class()] & 1) == 0) {
        goto LABEL_14;
      }
    }

    for (unint64_t i = 0LL; i < outCount; ++i)
    {
      Attributes = property_getAttributes(v4[i]);
      if (!Attributes) {
        goto LABEL_8;
      }
      uint64_t v7 = Attributes;
      [NSString stringWithUTF8String:Attributes];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      char v9 = [v8 hasPrefix:@"T@"];

      if ((v9 & 1) == 0)
      {
        [NSString stringWithUTF8String:v7];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        char v11 = [v10 hasPrefix:@"T#"];

        if ((v11 & 1) == 0)
        {
          [NSString stringWithUTF8String:v7];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          char v13 = [v12 hasPrefix:@"T:"];

          if ((v13 & 1) == 0)
          {
LABEL_8:
            objc_msgSend( NSString,  "stringWithCString:encoding:",  property_getName(v4[i]),  objc_msgSend(NSString, "defaultCStringEncoding"));
            __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v3 addObject:v14];
          }
        }
      }
    }

    a1 = (id)[a1 superclass];
LABEL_12:
    free(v4);
    goto LABEL_13;
  }

+ (void)initialize
{
  uint64_t v2 = objc_opt_new();
  v3 = (void *)WiFiUsageLQMFieldNameToFeatureMethod;
  WiFiUsageLQMFieldNameToFeatureMethod = v2;

  defaultForPercentages = 2LL;
  id v20 = objc_alloc(MEMORY[0x189603F68]);
  [MEMORY[0x189607968] numberWithInt:3];
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:4];
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:5];
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:6];
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:13];
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:13];
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:6];
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:9];
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:11];
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:11];
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:12];
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  double v17 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  double v16 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:8];
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:8];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:8];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:8];
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:8];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:9];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:9];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:9];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:9];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:9];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:7];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:7];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:8];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:8];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:7];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:7];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:7];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:7];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:1];
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:11];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:9];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:9];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:9];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:9];
  char v13 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:9];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:9];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:9];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:27];
  char v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend( v20,  "initWithObjectsAndKeys:",  v97,  @"rssi",  v85,  @"noise",  v94,  @"snr",  v96,  @"selfCca",  v95,  @"otherCca",  v93,  @"interference",  v82,  @"totalReportedCca",  v91,  @"decodingAttemptsPerSecond",  v90,  @"rxStartOverDecodingAttemptsPercentage",  v92,  @"rxCrsGlitchOverDecodingAttemptsPercentage",  v88,  @"rxBadPlcpOverDecodingAttemptsPercentage",  v87,  @"ofdmDesense",  v89,  @"bPhyDesense",  v86,  @"txLatencyP95",  v84,  @"rxDecodingErrorsOverRxStart",  v72,  @"rxUcastOverRxStart",  v83,  @"rxBeaconOverRxStart",  v64,  @"rxAnyErrOverDecodingErrors",  v81,  @"rxBadFCSOverDecodingErrors",  v80,  @"rxFifo0OvflOverDecodingErrors",  v56,  @"rxFifo1OvflOverDecodingErrors",  v79,  @"rxFrmTooLongOverDecodingErrors",  v78,  @"rxFrmTooShrtOverDecodingErrors",  v77,
         @"rxNoDelimOverDecodingErrors",
         v76,
         @"rxResponseTimeoutOverDecodingErrors",
         v75,
         @"rxUcastCtrlPercentage",
         v74,
         @"rxUcastMgmtPercentage",
         v19,
         @"rxUcastDataPercentage",
         v73,
         @"rxBACKOverRxCtrlFrmsPercentage",
         v71,
         @"rxUcastACKOverRxCtrlFrmsPercentage",
         v70);
  v10 = (void *)WiFiUsageLQMFieldNameToRoundMethod;
  WiFiUsageLQMFieldNameToRoundMethod = v9;
}

+ (id)binLabelfromFieldName:(id)a3 value:(int64_t)a4
{
  id v5 = a3;
  [(id)WiFiUsageLQMFieldNameToRoundMethod objectForKeyedSubscript:v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 integerValue];

  if (v7) {
    goto LABEL_5;
  }
  if (([v5 hasSuffix:@"Perc"] & 1) != 0
    || [v5 hasSuffix:@"Percentage"])
  {
    uint64_t v7 = defaultForPercentages;
LABEL_5:
    switch(v7)
    {
      case 0LL:
        break;
      case 1LL:
        int64_t v10 = a4;
        uint64_t v11 = 0LL;
        goto LABEL_22;
      case 2LL:
        int64_t v12 = a4;
        uint64_t v13 = 0LL;
        goto LABEL_24;
      case 3LL:
        int64_t v14 = a4;
        uint64_t v15 = 0LL;
        goto LABEL_26;
      case 4LL:
        int64_t v16 = a4;
        uint64_t v17 = 0LL;
        goto LABEL_28;
      case 5LL:
        int64_t v18 = a4;
        uint64_t v19 = 0LL;
        goto LABEL_30;
      case 6LL:
        int64_t v20 = a4;
        uint64_t v21 = 0LL;
        goto LABEL_32;
      case 7LL:
        int64_t v22 = a4;
        uint64_t v23 = 0LL;
        goto LABEL_34;
      case 8LL:
        int64_t v24 = a4;
        uint64_t v25 = 0LL;
        goto LABEL_36;
      case 9LL:
        int64_t v26 = a4;
        uint64_t v27 = 0LL;
        goto LABEL_38;
      case 10LL:
        int64_t v28 = a4;
        uint64_t v29 = 0LL;
        goto LABEL_40;
      case 11LL:
        int64_t v30 = a4;
        uint64_t v31 = 0LL;
        goto LABEL_42;
      case 12LL:
        int64_t v32 = a4;
        uint64_t v33 = 0LL;
        goto LABEL_44;
      case 13LL:
        int64_t v34 = a4;
        uint64_t v35 = 0LL;
        goto LABEL_46;
      case 14LL:
        int64_t v10 = a4;
        uint64_t v11 = 2LL;
LABEL_22:
        uint64_t v8 = +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "getBinEvery10Over100:As:",  v10,  v11);
        goto LABEL_48;
      case 15LL:
        int64_t v12 = a4;
        uint64_t v13 = 2LL;
LABEL_24:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinEvery10thOverRatioScale:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinEvery10thOverRatioScale:As:",  v12,  v13);
        goto LABEL_48;
      case 16LL:
        int64_t v14 = a4;
        uint64_t v15 = 2LL;
LABEL_26:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinRssi:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinRssi:As:",  v14,  v15);
        goto LABEL_48;
      case 17LL:
        int64_t v16 = a4;
        uint64_t v17 = 2LL;
LABEL_28:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinNoise:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinNoise:As:",  v16,  v17);
        goto LABEL_48;
      case 18LL:
        int64_t v18 = a4;
        uint64_t v19 = 2LL;
LABEL_30:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinSnr:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinSnr:As:",  v18,  v19);
        goto LABEL_48;
      case 19LL:
        int64_t v20 = a4;
        uint64_t v21 = 2LL;
LABEL_32:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinDecodingAttempts:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinDecodingAttempts:As:",  v20,  v21);
        goto LABEL_48;
      case 20LL:
        int64_t v22 = a4;
        uint64_t v23 = 2LL;
LABEL_34:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinBytesPerFrame:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinBytesPerFrame:As:",  v22,  v23);
        goto LABEL_48;
      case 21LL:
        int64_t v24 = a4;
        uint64_t v25 = 2LL;
LABEL_36:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinBytesPerPacket:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinBytesPerPacket:As:",  v24,  v25);
        goto LABEL_48;
      case 22LL:
        int64_t v26 = a4;
        uint64_t v27 = 2LL;
LABEL_38:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinFrames:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinFrames:As:",  v26,  v27);
        goto LABEL_48;
      case 23LL:
        int64_t v28 = a4;
        uint64_t v29 = 2LL;
LABEL_40:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinRetries:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinRetries:As:",  v28,  v29);
        goto LABEL_48;
      case 24LL:
        int64_t v30 = a4;
        uint64_t v31 = 2LL;
LABEL_42:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinMpduDensity:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinMpduDensity:As:",  v30,  v31);
        goto LABEL_48;
      case 25LL:
        int64_t v32 = a4;
        uint64_t v33 = 2LL;
LABEL_44:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinQueuedAmpdu:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinQueuedAmpdu:As:",  v32,  v33);
        goto LABEL_48;
      case 26LL:
        int64_t v34 = a4;
        uint64_t v35 = 2LL;
LABEL_46:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinDesense:As:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getBinDesense:As:",  v34,  v35);
        goto LABEL_48;
      case 27LL:
        uint64_t v8 = +[WiFiUsageLQMTransformations getLabelTrafficState:]( &OBJC_CLASS___WiFiUsageLQMTransformations,  "getLabelTrafficState:",  a4);
        goto LABEL_48;
      default:
        uint64_t v9 = 0LL;
        goto LABEL_49;
    }
  }

  uint64_t v8 = [MEMORY[0x189607968] numberWithLong:a4];
LABEL_48:
  uint64_t v9 = (void *)v8;
LABEL_49:

  return v9;
}

+ (id)featureFromFieldName:(id)a3
{
  return @"median";
}

+ (int64_t)subtract:(int64_t)a3 From:(int64_t)a4
{
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return a4 - a3;
  }
}

@end