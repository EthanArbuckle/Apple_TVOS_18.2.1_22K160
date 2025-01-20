@interface OSATasking
+ (BOOL)preference:(id)a3 alreadySetInInstructions:(id)a4;
+ (BOOL)shouldApplyPreference:(id)a3;
+ (id)applyTasking:(id)a3 taskId:(id)a4 fromBlob:(id)a5;
+ (id)getAvailableTaskingRoutings;
+ (id)getDefaultTasking;
+ (id)getInstalledTaskIds;
+ (id)normalizeInstructions:(id)a3;
+ (id)proxyTasking:(id)a3 taskId:(id)a4 usingConfig:(id)a5 fromBlob:(id)a6;
+ (id)selectConfigFromBlob:(id)a3 withError:(id *)a4;
+ (void)checkTaskingRelevance;
+ (void)setCRKeyToRandomValue;
@end

@implementation OSATasking

+ (id)proxyTasking:(id)a3 taskId:(id)a4 usingConfig:(id)a5 fromBlob:(id)a6
{
  v45[2] = *MEMORY[0x1895F89C0];
  id v9 = a3;
  v10 = (__CFString *)a4;
  id v11 = a5;
  id v12 = a6;
  int v13 = [v12 length] != 0;
  if (v13 != -[__CFString isEqualToString:](v10, "isEqualToString:", @"-1"))
  {
    if ([v12 length])
    {
      if (v12)
      {
        int v14 = 0;
LABEL_9:
        if ([v9 isEqualToString:@"ca1"])
        {
          id v17 = v12;
          id v34 = 0LL;
          v44[0] = @"taskingID";
          v18 = v10;
          if ((v14 & 1) == 0) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }

        id v35 = 0LL;
        [MEMORY[0x1896079E8] propertyListWithData:v12 options:0 format:0 error:&v35];
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        id v19 = v35;
        v20 = v19;
        if (v17) {
          int v21 = 1;
        }
        else {
          int v21 = v14;
        }
        if (v21 == 1)
        {
          id v34 = v19;
          v44[0] = @"taskingID";
          v18 = v10;
          if (!v14) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }

        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v37 = v20;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Tasking blob was not encodable: %@",  buf,  0xCu);
        }
        v22 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
        int v23 = [v22 appleInternal];

        if (v23)
        {
          v24 = (void *)NSString;
          [v11 identifier];
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          [v24 stringWithFormat:@"/tmp/bad_%@_%@.blob", v17, v9];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 writeToFile:v25 atomically:1];
          v15 = (void *)MEMORY[0x189604A60];
LABEL_30:

LABEL_33:
          goto LABEL_34;
        }

+ (id)applyTasking:(id)a3 taskId:(id)a4 fromBlob:(id)a5
{
  uint64_t v182 = *MEMORY[0x1895F89C0];
  id v125 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v134 = 0LL;
  v135 = &v134;
  uint64_t v136 = 0x3032000000LL;
  v137 = __Block_byref_object_copy_;
  v138 = __Block_byref_object_dispose_;
  id v139 = (id)MEMORY[0x189604A60];
  id v124 = v8;
  uint64_t v9 = [v8 length];
  v123 = v7;
  if ((v9 != 0) != [v7 isEqualToString:@"-1"])
  {
    if ([v124 length]) {
      int v121 = 0;
    }
    else {
      int v121 = [v7 isEqualToString:@"-1"];
    }
    int v14 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v15 = MEMORY[0x1895F8DA0];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [v124 length];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v125;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v177) = v16;
      WORD2(v177) = 1024;
      *(_DWORD *)((char *)&v177 + 6) = v121;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "applyTasking routing %@ id %@ length %d; untasked %d",
        buf,
        0x22u);
    }

    if ([v125 isEqualToString:@"da3"])
    {
      id v17 = (void *)MEMORY[0x189604A58];
      if ((v121 & 1) != 0)
      {
        v18 = 0LL;
        id v19 = (void *)MEMORY[0x189604A58];
      }

      else
      {
        id v133 = 0LL;
        selectConfigFromBlob((uint64_t)v124, &v133);
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        id v29 = v133;
        v18 = v29;
        if (!v19)
        {
          if (v29)
          {
            v160 = @"error";
            [v29 localizedDescription];
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v161 = v59;
            uint64_t v60 = [MEMORY[0x189603F68] dictionaryWithObjects:&v161 forKeys:&v160 count:1];
            v61 = (void *)v135[5];
            v135[5] = v60;
          }

          else
          {
            v18 = (void *)v135[5];
            v135[5] = (uint64_t)&unk_189E318B8;
          }

void __43__OSATasking_applyTasking_taskId_fromBlob___block_invoke(void *a1)
{
  v15[3] = *MEMORY[0x1895F89C0];
  v2 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  int v3 = [v2 setPrefsKey:@"ScheduledTasking" value:a1[4] forDomain:@"com.apple.OTACrashCopier" withSync:1];

  if (v3)
  {
    v14[0] = @"action";
    v14[1] = @"taskId";
    uint64_t v4 = a1[5];
    v15[0] = @"scheduled";
    v15[1] = v4;
    v14[2] = @"blob";
    [NSString stringWithFormat:@"defaults://%@/%@", @"com.apple.OTACrashCopier", @"ScheduledTasking"];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v5;
    uint64_t v6 = [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
    uint64_t v7 = *(void *)(a1[6] + 8LL);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = (os_log_s *)MEMORY[0x1895F8DA0];
    v10 = "Saved da3 tasking for deferred installation";
  }

  else
  {
    uint64_t v11 = *(void *)(a1[6] + 8LL);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = &unk_189E31890;

    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = (os_log_s *)MEMORY[0x1895F8DA0];
    v10 = "deferring da3 task failed";
  }

  _os_log_impl(&dword_1861AC000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
}

void __43__OSATasking_applyTasking_taskId_fromBlob___block_invoke_71(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8LL);
  obuint64_t j = *(id *)(v4 + 40);
  char v5 = [v2 writeToFile:v3 options:1 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = v5;
}

+ (void)checkTaskingRelevance
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v2 = +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  [v2 getPrefsKey:@"ScheduledTasking" forDomain:@"com.apple.OTACrashCopier" withOptions:0];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  [v3 objectForKeyedSubscript:@"TaskingOS"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 buildVersion];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 buildVersion];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      int v14 = v9;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "removing outdated da tasking (and restoring hotship) %@ -> %@",  (uint8_t *)&v11,  0x16u);
    }

    id v10 =  +[OSATasking applyTasking:taskId:fromBlob:]( &OBJC_CLASS___OSATasking,  "applyTasking:taskId:fromBlob:",  @"da3",  @"-1",  0LL);
  }
}

+ (id)getInstalledTaskIds
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 getPrefsKey:@"ScheduledTasking" forDomain:@"com.apple.OTACrashCopier" withOptions:0];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    [v4 objectForKeyedSubscript:@"TaskingID"];
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v5 forKeyedSubscript:@"da3"];
  }

  else
  {
    [v2 setObject:@"-1" forKeyedSubscript:@"da3"];
  }

  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 getPrefsKey:@"AWDTaskingID" forDomain:@"com.apple.OTACrashCopier" withOptions:0];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    [v7 objectForKeyedSubscript:@"TaskingID"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v8 forKeyedSubscript:@"awd"];
  }

  else
  {
    [v2 setObject:@"-1" forKeyedSubscript:@"awd"];
  }

  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 getPrefsKey:@"CATaskingID" forDomain:@"com.apple.OTACrashCopier" withOptions:0];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [v10 objectForKeyedSubscript:@"TaskingID"];
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v11 forKeyedSubscript:@"ca1"];
  }

  else
  {
    [v2 setObject:@"-1" forKeyedSubscript:@"ca1"];
  }

  return v2;
}

+ (id)getAvailableTaskingRoutings
{
  return &unk_189E31D18;
}

+ (BOOL)shouldApplyPreference:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v3 count] != 2) {
    goto LABEL_6;
  }
  [v3 objectAtIndexedSubscript:0];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = [v4 unsignedIntegerValue];

  [v3 objectAtIndexedSubscript:1];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = [v6 unsignedIntegerValue];

  if (!v7) {
    goto LABEL_15;
  }
  if (v7 == 1)
  {
LABEL_6:
    BOOL v8 = 1;
    goto LABEL_7;
  }

  if (v5 >= v7)
  {
LABEL_15:
    BOOL v8 = 0;
    goto LABEL_7;
  }

  uLong v10 = crc32(0LL, 0LL, 0);
  uLong v11 = crc32(v10, (const Bytef *)samplingKeyCString, 8u);
  unint64_t v12 = 0xFFFFFFFF / v7 * v5;
  BOOL v14 = v11 >= v12;
  unint64_t v13 = v11 - v12;
  BOOL v14 = !v14 || v13 >= 0xFFFFFFFF / v7;
  BOOL v8 = !v14;
LABEL_7:

  return v8;
}

+ (id)getDefaultTasking
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v2 appleInternal])
  {
    uint64_t v3 = @"/AppleInternal/Library/OSAnalytics/defaultTasking.plist";
  }

  else
  {
    [MEMORY[0x1896077F8] bundleForClass:objc_opt_class()];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 pathForResource:@"defaultTasking" ofType:@"plist"];
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  unint64_t v5 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithContentsOfFile:v3];
  return v5;
}

+ (id)normalizeInstructions:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 crashReporterKey];
  uint64_t v6 = (void *)samplingKey;
  samplingKey = v5;

  if ([(id)samplingKey hasPrefix:@"baadbaadbaaadbaaaadbaadbaadbaaadbaaaad"])
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
      +[OSATasking normalizeInstructions:].cold.3();
    }
    +[OSATasking setCRKeyToRandomValue](&OBJC_CLASS___OSATasking, "setCRKeyToRandomValue");
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "samplingKey is good", buf, 2u);
    }

    samplingKeyCString = [(id)samplingKey UTF8String];
  }

  id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  int v16 = v3;
  [v3 reverseObjectEnumerator];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    unint64_t v12 = (os_log_s *)MEMORY[0x1895F8DA0];
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (+[OSATasking shouldApplyPreference:](&OBJC_CLASS___OSATasking, "shouldApplyPreference:", v14))
        {
          if (+[OSATasking preference:alreadySetInInstructions:]( &OBJC_CLASS___OSATasking,  "preference:alreadySetInInstructions:",  v14,  v7))
          {
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
              +[OSATasking normalizeInstructions:].cold.1(buf, v14, &v24);
            }
          }

          else
          {
            [v7 insertObject:v14 atIndex:0];
          }
        }

        else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          +[OSATasking normalizeInstructions:].cold.2(v21, v14, &v22);
        }
      }

      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }

    while (v10);
  }

  return v7;
}

+ (BOOL)preference:(id)a3 alreadySetInInstructions:(id)a4
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v23 = *(void *)v25;
    id v20 = v6;
    id v21 = v5;
    do
    {
      uint64_t v10 = 0LL;
      uint64_t v22 = v8;
      do
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
        objc_msgSend(v5, "objectForKeyedSubscript:", @"User", v20, v21);
        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 objectForKeyedSubscript:@"User"];
        unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v12 isEqualToString:v13])
        {
          [v5 objectForKeyedSubscript:@"Domain"];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 objectForKeyedSubscript:@"Domain"];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v14 isEqualToString:v15])
          {
            [v5 objectForKeyedSubscript:@"Key"];
            int v16 = (void *)objc_claimAutoreleasedReturnValue();
            [v11 objectForKeyedSubscript:@"Key"];
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
            char v18 = [v16 isEqualToString:v17];

            id v6 = v20;
            id v5 = v21;
          }

          else
          {
            char v18 = 0;
          }

          uint64_t v8 = v22;
        }

        else
        {
          char v18 = 0;
        }

        v9 |= v18;
        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v8);
  }

  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

+ (id)selectConfigFromBlob:(id)a3 withError:(id *)a4
{
  return selectConfigFromBlob((uint64_t)a3, a4);
}

+ (void)setCRKeyToRandomValue
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v2 = (void *)NSString;
  [MEMORY[0x189607AB8] UUID];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 UUIDString];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] date];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringWithFormat:@"%@%@", v4, v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  *(void *)md = 0LL;
  uint64_t v11 = 0LL;
  int v12 = 0;
  id v7 = v6;
  CC_SHA1((const void *)[v7 UTF8String], objc_msgSend(v7, "length"), md);
  uint64_t v8 = objc_msgSend( NSString,  "stringWithFormat:",  @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",  md[0],  md[1],  md[2],  md[3],  md[4],  md[5],  md[6],  md[7],  v11,  BYTE1(v11),  BYTE2(v11),  BYTE3(v11),  BYTE4(v11),  BYTE5(v11),  BYTE6(v11),  HIBYTE(v11),  v12,  BYTE1(v12),  BYTE2(v12),  HIBYTE(v12));
  char v9 = (void *)samplingKey;
  samplingKey = v8;

  samplingKeyCString = [(id)samplingKey UTF8String];
}

+ (void)applyTasking:(uint64_t)a1 taskId:(uint64_t)a2 fromBlob:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 138543362;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0_0( &dword_1861AC000,  MEMORY[0x1895F8DA0],  a3,  "After normalization, combinedConfig is %{public}@",  (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)applyTasking:(uint64_t)a1 taskId:(uint64_t)a2 fromBlob:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 138543362;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1861AC000, MEMORY[0x1895F8DA0], a3, "task_config is %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)applyTasking:(uint64_t)a1 taskId:(uint64_t)a2 fromBlob:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 138543362;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1861AC000, MEMORY[0x1895F8DA0], a3, "defaultConfig is %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)normalizeInstructions:(void *)a3 .cold.1(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_0_0( &dword_1861AC000,  MEMORY[0x1895F8DA0],  (uint64_t)a3,  "Not applying %@ as it has already been set",  a1);
}

+ (void)normalizeInstructions:(void *)a3 .cold.2(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_0_0( &dword_1861AC000,  MEMORY[0x1895F8DA0],  (uint64_t)a3,  "Not applying %@ as it is sampled and this device isn't IN",  a1);
}

+ (void)normalizeInstructions:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  int v0 = 138543362;
  uint64_t v1 = samplingKey;
  _os_log_fault_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "samplingKey [randomizing due to failure] was %{public}@",  (uint8_t *)&v0,  0xCu);
  OUTLINED_FUNCTION_1();
}

@end