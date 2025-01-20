@interface MAAutoAssetInfoStaging
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetInfoStaging)initWithAvailableForStaging:(id)a3 withTotalExpectedBytes:(unint64_t)a4;
- (MAAutoAssetInfoStaging)initWithByGroupAvailableForStaging:(id)a3 withByGroupTotalExpectedBytes:(id)a4;
- (MAAutoAssetInfoStaging)initWithCoder:(id)a3;
- (MAAutoAssetInfoStaging)initWithUpdateAttributes:(id)a3;
- (MAAutoAssetInfoStaging)initWithUpdateAttributes:(id)a3 withByGroupAvailableForStaging:(id)a4 withAvailableForStaging:(id)a5 withByGroupTotalExpectedBytes:(id)a6 withTotalExpectedBytes:(unint64_t)a7;
- (MAAutoAssetInfoStaging)initWithUpdateAttributes:(id)a3 withByGroupAvailableForStaging:(id)a4 withByGroupTotalExpectedBytes:(id)a5;
- (NSDictionary)allAvailableForStagingAttributes;
- (NSDictionary)byGroupAvailableForStagingAttributes;
- (NSDictionary)byGroupTotalExpectedBytes;
- (NSDictionary)updateAttributes;
- (id)description;
- (id)summary;
- (unint64_t)totalExpectedBytes;
- (void)encodeWithCoder:(id)a3;
- (void)fullDescription:(id)a3 usingLogger:(id)a4;
@end

@implementation MAAutoAssetInfoStaging

- (MAAutoAssetInfoStaging)initWithUpdateAttributes:(id)a3 withByGroupAvailableForStaging:(id)a4 withByGroupTotalExpectedBytes:(id)a5
{
  return -[MAAutoAssetInfoStaging initWithUpdateAttributes:withByGroupAvailableForStaging:withAvailableForStaging:withByGroupTotalExpectedBytes:withTotalExpectedBytes:]( self,  "initWithUpdateAttributes:withByGroupAvailableForStaging:withAvailableForStaging:withByGroupTotalExpectedBytes :withTotalExpectedBytes:",  a3,  a4,  0LL,  a5,  0LL);
}

- (MAAutoAssetInfoStaging)initWithByGroupAvailableForStaging:(id)a3 withByGroupTotalExpectedBytes:(id)a4
{
  return -[MAAutoAssetInfoStaging initWithUpdateAttributes:withByGroupAvailableForStaging:withAvailableForStaging:withByGroupTotalExpectedBytes:withTotalExpectedBytes:]( self,  "initWithUpdateAttributes:withByGroupAvailableForStaging:withAvailableForStaging:withByGroupTotalExpectedBytes :withTotalExpectedBytes:",  0LL,  a3,  0LL,  a4,  0LL);
}

- (MAAutoAssetInfoStaging)initWithAvailableForStaging:(id)a3 withTotalExpectedBytes:(unint64_t)a4
{
  return -[MAAutoAssetInfoStaging initWithUpdateAttributes:withByGroupAvailableForStaging:withAvailableForStaging:withByGroupTotalExpectedBytes:withTotalExpectedBytes:]( self,  "initWithUpdateAttributes:withByGroupAvailableForStaging:withAvailableForStaging:withByGroupTotalExpectedBytes :withTotalExpectedBytes:",  0LL,  0LL,  a3,  0LL,  a4);
}

- (MAAutoAssetInfoStaging)initWithUpdateAttributes:(id)a3
{
  return -[MAAutoAssetInfoStaging initWithUpdateAttributes:withByGroupAvailableForStaging:withAvailableForStaging:withByGroupTotalExpectedBytes:withTotalExpectedBytes:]( self,  "initWithUpdateAttributes:withByGroupAvailableForStaging:withAvailableForStaging:withByGroupTotalExpectedBytes :withTotalExpectedBytes:",  a3,  0LL,  0LL,  0LL,  0LL);
}

- (MAAutoAssetInfoStaging)initWithUpdateAttributes:(id)a3 withByGroupAvailableForStaging:(id)a4 withAvailableForStaging:(id)a5 withByGroupTotalExpectedBytes:(id)a6 withTotalExpectedBytes:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MAAutoAssetInfoStaging;
  v17 = -[MAAutoAssetInfoStaging init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_updateAttributes, a3);
    objc_storeStrong((id *)&v18->_byGroupAvailableForStagingAttributes, a4);
    objc_storeStrong((id *)&v18->_allAvailableForStagingAttributes, a5);
    objc_storeStrong((id *)&v18->_byGroupTotalExpectedBytes, a6);
    v18->_totalExpectedBytes = a7;
  }

  return v18;
}

- (MAAutoAssetInfoStaging)initWithCoder:(id)a3
{
  v27[3] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___MAAutoAssetInfoStaging;
  v5 = -[MAAutoAssetInfoStaging init](&v24, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x189604010];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v27 count:3];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setWithArray:v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x189604010];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v26[2] = objc_opt_class();
    v26[3] = objc_opt_class();
    v26[4] = objc_opt_class();
    v26[5] = objc_opt_class();
    v26[6] = objc_opt_class();
    v26[7] = objc_opt_class();
    v26[8] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v26 count:9];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setWithArray:v10];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x189604010];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v25[3] = objc_opt_class();
    v25[4] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v25 count:5];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setWithArray:v13];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v15 = [v4 decodeObjectOfClasses:v8 forKey:@"updateAttributes"];
    updateAttributes = v5->_updateAttributes;
    v5->_updateAttributes = (NSDictionary *)v15;

    uint64_t v17 = [v4 decodeObjectOfClasses:v11 forKey:@"byGroupAvailableForStagingAttributes"];
    byGroupAvailableForStagingAttributes = v5->_byGroupAvailableForStagingAttributes;
    v5->_byGroupAvailableForStagingAttributes = (NSDictionary *)v17;

    uint64_t v19 = [v4 decodeObjectOfClasses:v11 forKey:@"allAvailableForStagingAttributes"];
    allAvailableForStagingAttributes = v5->_allAvailableForStagingAttributes;
    v5->_allAvailableForStagingAttributes = (NSDictionary *)v19;

    uint64_t v21 = [v4 decodeObjectOfClasses:v14 forKey:@"byGroupTotalExpectedBytes"];
    byGroupTotalExpectedBytes = v5->_byGroupTotalExpectedBytes;
    v5->_byGroupTotalExpectedBytes = (NSDictionary *)v21;

    v5->_totalExpectedBytes = [v4 decodeIntegerForKey:@"totalExpectedBytes"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 encodeObject:v4 forKey:@"updateAttributes"];
  v5 = -[MAAutoAssetInfoStaging byGroupAvailableForStagingAttributes](self, "byGroupAvailableForStagingAttributes");
  [v8 encodeObject:v5 forKey:@"byGroupAvailableForStagingAttributes"];
  v6 = -[MAAutoAssetInfoStaging allAvailableForStagingAttributes](self, "allAvailableForStagingAttributes");
  [v8 encodeObject:v6 forKey:@"allAvailableForStagingAttributes"];
  v7 = -[MAAutoAssetInfoStaging byGroupTotalExpectedBytes](self, "byGroupTotalExpectedBytes");
  [v8 encodeObject:v7 forKey:@"byGroupTotalExpectedBytes"];

  objc_msgSend( v8,  "encodeInteger:forKey:",  -[MAAutoAssetInfoStaging totalExpectedBytes](self, "totalExpectedBytes"),  @"totalExpectedBytes");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  objc_super v20 = (void *)NSString;
  v22 = -[MAAutoAssetInfoStaging summary](self, "summary");
  -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x189603F68];
    -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeSummaryForDictionary:");
    uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v21 = @"N";
  }
  v6 = -[MAAutoAssetInfoStaging byGroupAvailableForStagingAttributes](self, "byGroupAvailableForStagingAttributes");
  if (v6)
  {
    v7 = (void *)MEMORY[0x189603F68];
    v18 = -[MAAutoAssetInfoStaging byGroupAvailableForStagingAttributes](self, "byGroupAvailableForStagingAttributes");
    objc_msgSend(v7, "safeSummaryForDictionary:");
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v8 = @"N";
  }
  v9 = -[MAAutoAssetInfoStaging allAvailableForStagingAttributes](self, "allAvailableForStagingAttributes");
  if (v9)
  {
    v10 = (void *)MEMORY[0x189603F68];
    v2 = -[MAAutoAssetInfoStaging allAvailableForStagingAttributes](self, "allAvailableForStagingAttributes");
    [v10 safeSummaryForDictionary:v2];
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v11 = @"N";
  }
  v12 = -[MAAutoAssetInfoStaging byGroupTotalExpectedBytes](self, "byGroupTotalExpectedBytes");
  if (v12)
  {
    id v13 = (void *)MEMORY[0x189603F68];
    -[MAAutoAssetInfoStaging byGroupTotalExpectedBytes](self, "byGroupTotalExpectedBytes");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 safeSummaryForDictionary:v14];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 stringWithFormat:@"%@|updateAttributes:%@|byGroupAvailableForStaging:%@|allAvailableForStaging:%@|byGroupTotalExpectedBytes:%@", v22, v21, v8, v11, v15];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v20 stringWithFormat:@"%@|updateAttributes:%@|byGroupAvailableForStaging:%@|allAvailableForStaging:%@|byGroupTotalExpectedBytes:%@", v22, v21, v8, v11, @"N"];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v9)
  {
  }

  if (v6)
  {
  }

  if (v4)
  {
  }

  return v16;
}

- (id)summary
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  v3 = -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
  [v3 safeObjectForKey:@"OSVersion" ofClass:objc_opt_class()];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
  [v5 safeObjectForKey:@"Build" ofClass:objc_opt_class()];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
  [v7 safeObjectForKey:@"TrainName" ofClass:objc_opt_class()];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
  [v9 safeObjectForKey:@"RestoreVersion" ofClass:objc_opt_class()];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
  [v11 safeObjectForKey:@"GroupNames" ofClass:objc_opt_class()];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v12;
  if (v12)
  {
    v30 = v10;
    v31 = v8;
    v32 = v6;
    v33 = v4;
    id v13 = objc_alloc_init(MEMORY[0x189607940]);
    id v14 = objc_alloc_init(MEMORY[0x189607940]);
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id obj = v12;
    uint64_t v15 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      char v17 = 1;
      uint64_t v36 = *(void *)v38;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v38 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          -[MAAutoAssetInfoStaging byGroupAvailableForStagingAttributes](self, "byGroupAvailableForStagingAttributes");
          objc_super v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v20 safeObjectForKey:v19 ofClass:objc_opt_class()];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[MAAutoAssetInfoStaging byGroupTotalExpectedBytes](self, "byGroupTotalExpectedBytes");
          [v22 safeObjectForKey:v19 ofClass:objc_opt_class()];
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_super v24 = v19;
          v25 = @"REQUIRED";
          if (([MEMORY[0x189612760] stringIsEqual:v24 to:@"STAGE_GROUP_REQUIRED"] & 1) != 0
            || (v25 = @"OPTIONAL",
                [MEMORY[0x189612760] stringIsEqual:v24 to:@"STAGE_GROUP_OPTIONAL"]))
          {

            objc_super v24 = (__CFString *)v25;
          }

          if ((v17 & 1) == 0)
          {
            [v13 appendString:@","];
            [v14 appendString:@","];
          }

          [v13 appendFormat:@"%@:%ld", v24, objc_msgSend(v21, "count")];
          [v14 appendFormat:@"%@:%llu", v24, objc_msgSend(v23, "unsignedLongLongValue")];

          char v17 = 0;
        }

        uint64_t v16 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        char v17 = 0;
      }

      while (v16);
    }

    v10 = v30;
    id v8 = v31;
    v6 = v32;
    id v4 = v33;
    [NSString stringWithFormat:@"staging[BY-GROUP]|osVersion:%@|build:%@|trainName:%@|restoreVersion:%@|byGroupAttributes:%@|byGroupExpectedBytes:%@", v33, v32, v31, v30, v13, v14];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v27 = (void *)NSString;
    v28 = -[MAAutoAssetInfoStaging allAvailableForStagingAttributes](self, "allAvailableForStagingAttributes");
    [v27 stringWithFormat:@"staging[ALL]|osVersion:%@|build:%@|trainName:%@|restoreVersion:%@|allAvailableForStaging:%ld|totalExpectedBytes:%llu", v4, v6, v8, v10, objc_msgSend(v28, "count"), -[MAAutoAssetInfoStaging totalExpectedBytes](self, "totalExpectedBytes")];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

- (void)fullDescription:(id)a3 usingLogger:(id)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x189612760] stringIsEqual:v6 to:@"MA-AUTO-STAGE:DETERMINE_GROUPS_AVAILABLE_FOR_UPDATE"])
  {
    id v8 = @"DETERMINE-GROUPS-REQUEST";
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v6 to:@"MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE_FOR_UPDATE"])
  {
    id v8 = @"DETERMINE-ALL-REQUEST";
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v6 to:@"MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE"])
  {
    id v8 = @"DETERMINE-ALL-LEGACY-REQUEST";
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v6 to:@"MA-AUTO-STAGE:DOWNLOAD_GROUPS"])
  {
    id v8 = @"DOWNLOAD-GROUPS-REQUEST";
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v6 to:@"MA-AUTO-STAGE:DOWNLOAD_ALL"])
  {
    id v8 = @"DOWNLOAD-ALL-REQUEST";
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v6 to:@"MA-AUTO-STAGE(REPLY):DETERMINE_GROUPS_AVAILABLE_FOR_UPDATE"])
  {
    id v8 = @"DETERMINE-GROUPS-REPLY";
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v6 to:@"MA-AUTO-STAGE(REPLY):DETERMINE_ALL_AVAILABLE_FOR_UPDATE"])
  {
    id v8 = @"DETERMINE-ALL-REPLY";
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v6 to:@"MA-AUTO-STAGE(REPLY):DETERMINE_ALL_AVAILABLE"])
  {
    id v8 = @"DETERMINE-ALL-LEGACY-REPLY";
  }

  else
  {
    id v8 = @"STAGING";
  }
  v9 = -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
  if (v9)
  {
    [v7 oslog];
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[MAAutoAssetInfoStaging updateAttributes](self, "updateAttributes");
      int v30 = 138543618;
      v31 = v8;
      __int16 v32 = 2114;
      unint64_t v33 = (unint64_t)v11;
      _os_log_impl( &dword_18718F000,  v10,  OS_LOG_TYPE_DEFAULT,  "\n>%{public}@> updateAttributes:\n%{public}@",  (uint8_t *)&v30,  0x16u);
    }
  }
  v12 = -[MAAutoAssetInfoStaging byGroupAvailableForStagingAttributes](self, "byGroupAvailableForStagingAttributes");
  if (v12)
  {
    -[MAAutoAssetInfoStaging byGroupAvailableForStagingAttributes](self, "byGroupAvailableForStagingAttributes");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 safeObjectForKey:@"STAGE_GROUP_REQUIRED" ofClass:objc_opt_class()];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[MAAutoAssetInfoStaging byGroupAvailableForStagingAttributes](self, "byGroupAvailableForStagingAttributes");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 safeObjectForKey:@"STAGE_GROUP_OPTIONAL" ofClass:objc_opt_class()];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && [v14 count])
    {
      [v7 oslog];
      char v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        [v14 safeSummary];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        int v30 = 138543618;
        v31 = v8;
        __int16 v32 = 2114;
        unint64_t v33 = (unint64_t)v18;
        _os_log_impl( &dword_18718F000,  v17,  OS_LOG_TYPE_DEFAULT,  "\n>%{public}@> byGroupAvailableForStaging[REQUIRED]:\n%{public}@",  (uint8_t *)&v30,  0x16u);
      }
    }

    else
    {
      [v7 oslog];
      char v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 138543362;
        v31 = v8;
        _os_log_impl( &dword_18718F000,  v17,  OS_LOG_TYPE_DEFAULT,  "\n>%{public}@> byGroupAvailableForStaging[REQUIRED]:NONE",  (uint8_t *)&v30,  0xCu);
      }
    }

    if (v16 && [v16 count])
    {
      [v7 oslog];
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        [v16 safeSummary];
        objc_super v20 = (void *)objc_claimAutoreleasedReturnValue();
        int v30 = 138543618;
        v31 = v8;
        __int16 v32 = 2114;
        unint64_t v33 = (unint64_t)v20;
        _os_log_impl( &dword_18718F000,  v19,  OS_LOG_TYPE_DEFAULT,  "\n>%{public}@> byGroupAvailableForStaging[OPTIONAL]:\n%{public}@",  (uint8_t *)&v30,  0x16u);
      }
    }

    else
    {
      [v7 oslog];
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 138543362;
        v31 = v8;
        _os_log_impl( &dword_18718F000,  v19,  OS_LOG_TYPE_DEFAULT,  "\n>%{public}@> byGroupAvailableForStaging[OPTIONAL]:NONE",  (uint8_t *)&v30,  0xCu);
      }
    }
  }

  -[MAAutoAssetInfoStaging allAvailableForStagingAttributes](self, "allAvailableForStagingAttributes");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    [v7 oslog];
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = -[MAAutoAssetInfoStaging allAvailableForStagingAttributes](self, "allAvailableForStagingAttributes");
      [v23 safeSummary];
      objc_super v24 = (void *)objc_claimAutoreleasedReturnValue();
      int v30 = 138543618;
      v31 = v8;
      __int16 v32 = 2114;
      unint64_t v33 = (unint64_t)v24;
      _os_log_impl( &dword_18718F000,  v22,  OS_LOG_TYPE_DEFAULT,  "\n>%{public}@> allAvailableForStagingAttributes:\n%{public}@",  (uint8_t *)&v30,  0x16u);
    }
  }
  v25 = -[MAAutoAssetInfoStaging byGroupTotalExpectedBytes](self, "byGroupTotalExpectedBytes");
  if (v25)
  {
    [v7 oslog];
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = -[MAAutoAssetInfoStaging byGroupTotalExpectedBytes](self, "byGroupTotalExpectedBytes");
      int v30 = 138543618;
      v31 = v8;
      __int16 v32 = 2114;
      unint64_t v33 = (unint64_t)v27;
      _os_log_impl( &dword_18718F000,  v26,  OS_LOG_TYPE_DEFAULT,  "\n>%{public}@> byGroupTotalExpectedBytes:\n%{public}@",  (uint8_t *)&v30,  0x16u);
    }
  }

  [v7 oslog];
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v29 = -[MAAutoAssetInfoStaging totalExpectedBytes](self, "totalExpectedBytes");
    int v30 = 138543618;
    v31 = v8;
    __int16 v32 = 2048;
    unint64_t v33 = v29;
    _os_log_impl( &dword_18718F000,  v28,  OS_LOG_TYPE_DEFAULT,  "\n>%{public}@> totalExpectedBytes:%llu",  (uint8_t *)&v30,  0x16u);
  }
}

- (NSDictionary)updateAttributes
{
  return self->_updateAttributes;
}

- (NSDictionary)byGroupAvailableForStagingAttributes
{
  return self->_byGroupAvailableForStagingAttributes;
}

- (NSDictionary)allAvailableForStagingAttributes
{
  return self->_allAvailableForStagingAttributes;
}

- (NSDictionary)byGroupTotalExpectedBytes
{
  return self->_byGroupTotalExpectedBytes;
}

- (unint64_t)totalExpectedBytes
{
  return self->_totalExpectedBytes;
}

- (void).cxx_destruct
{
}

@end